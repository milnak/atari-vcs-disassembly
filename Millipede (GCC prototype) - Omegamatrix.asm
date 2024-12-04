; Rough disassembly of Millipede GCC prototype
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; Mill1.cfg contents:
;
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 9619
;      GFX 961A 964C
;      CODE 964D 98A1
;      GFX 98A2 9900
;      CODE 9901 9C40
;      GFX 9C41 9C48
;      CODE 9C49 9DAF
;      GFX 9DB0 9FE9
;      CODE 9FEA 9FF5
;      GFX 9FF6 9FFF
;
; Mill2.cfg contents:
;
;      ORG B000
;      DATA B000 B0FF
;      CODE B100 B322
;      GFX B323 B340
;      CODE B341 B425
;      GFX B426 B445
;      CODE B446 B998
;      GFX B999 B9C0
;      CODE B9C1 BA13
;      GFX BA14 BA53
;      CODE BA54 BC54
;      GFX BC55 BC64
;      CODE BC65 BD1D
;      GFX BD1E BFE9
;      CODE BFEA BFF5
;      GFX BFF6 BFFF
;
; Mill3.cfg contents:
;
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 D19E
;      GFX D19F D1FF
;      CODE D200 D3CB
;      GFX D3CC D3DB
;      CODE D3DC D65A
;      GFX D65B D69D
;      CODE D69E D768
;      GFX D769 D776
;      CODE D777 D77E
;      GFX D77F D7FF
;      CODE D800 DC87
;      GFX DC88 DFE9
;      CODE DFEA DFF5
;      GFX DFF6 DFFF
;
; Mill4.cfg contents:
;
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F1CA
;      GFX F1CB F1FF
;      CODE F200 F20D
;      GFX F20E F20F
;      CODE F210 F635
;      CODE F636 F729
;      GFX F72A FFE9
;      CODE FFEA FFF5
;      GFX FFF6 FFFF

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
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $0000
      RORG $9000

L9000:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L900B:
    .byte $00
L900C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L9016:
    .byte $00
L9017:
    .byte $00
L9018:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L9023:
    .byte $00
L9024:
    .byte $00
L9025:
    .byte $00
L9026:
    .byte $00
L9027:
    .byte $00
L9028:
    .byte $00
L9029:
    .byte $00
L902A:
    .byte $00
L902B:
    .byte $00
L902C:
    .byte $00
L902D:
    .byte $00
L902E:
    .byte $00
L902F:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00
L9044:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L9080:
    .byte $00
L9081:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L908B:
    .byte $00
L908C:
    .byte $00
L908D:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L9097:
    .byte $00
L9098:
    .byte $00
L9099:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
L90A4:
    .byte $00
L90A5:
    .byte $00
L90A6:
    .byte $00
L90A7:
    .byte $00
L90A8:
    .byte $00
L90A9:
    .byte $00
L90AA:
    .byte $00
L90AB:
    .byte $00
L90AC:
    .byte $00
L90AD:
    .byte $00
L90AE:
    .byte $00
L90AF:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00
L90C4:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    sta    L9FF8                 ; 4
L9103:
    lda    $87                   ; 3
    cmp    #1                    ; 2
    beq    L910D                 ; 2³
    lda    $83                   ; 3
    bmi    L9124                 ; 2³
L910D:
    ldx    #0                    ; 2
    stx    $F6                   ; 3
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    L9124                 ; 2³
    tax                          ; 2
    dex                          ; 2
L9119:
    lda    $F098,X               ; 4
    bmi    L9127                 ; 2³
    lda    $84                   ; 3
    and    #$01                  ; 2
    beq    L9127                 ; 2³
L9124:
    jmp    L923F                 ; 3

L9127:
    lda    $F08C,X               ; 4
    sta    $EC                   ; 3
    bpl    L9154                 ; 2³
    lda    $F6                   ; 3
    bne    L9134                 ; 2³
    stx    $F6                   ; 3
L9134:
    lda    $F08B,X               ; 4
    and    #$1F                  ; 2
    sta    $EA                   ; 3
    lda    $EC                   ; 3
    and    #$1F                  ; 2
    cmp    $EA                   ; 3
    beq    L9178                 ; 2³
    lda    $F080,X               ; 4
    and    #$03                  ; 2
    bne    L9178                 ; 2³
    lda    $F08B,X               ; 4
    ora    #$80                  ; 2
    sta    $F00C,X               ; 5
    bne    L9192                 ; 2³
L9154:
    lda    $EC                   ; 3
    and    #$20                  ; 2
    bne    L9165                 ; 2³
    lda    $F080,X               ; 4
    and    #$7F                  ; 2
    cmp    #$7C                  ; 2
    bne    L9170                 ; 2³
    beq    L916A                 ; 2³
L9165:
    lda    $F080,X               ; 4
    and    #$7F                  ; 2
L916A:
    beq    L91BA                 ; 2³
    cmp    #$7C                  ; 2
    beq    L9178                 ; 2³
L9170:
    cmp    #0                    ; 2
    beq    L9178                 ; 2³
    and    #$03                  ; 2
    beq    L91A3                 ; 2³
L9178:
    lda    $EC                   ; 3
    and    #$20                  ; 2
    bne    L9189                 ; 2³
    lda    $F080,X               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F000,X               ; 5
    bne    L9192                 ; 2³
L9189:
    lda    $F080,X               ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F000,X               ; 5
L9192:
    bit    $EC                   ; 3
    bmi    L919A                 ; 2³
    lda    #0                    ; 2
    sta    $F6                   ; 3
L919A:
    dex                          ; 2
    bmi    L91A0                 ; 2³
    jmp    L9119                 ; 3

L91A0:
    jmp    L923F                 ; 3

L91A3:
    lda    $F080,X               ; 4
    bpl    L91C2                 ; 2³
    lda    $8A                   ; 3
    and    #$01                  ; 2
    sta    $EF                   ; 3
    lda    $EC                   ; 3
    eor    $EF                   ; 3
    lsr                          ; 2
    lda    $F080,X               ; 4
    and    #$04                  ; 2
    bcc    L91BE                 ; 2³
L91BA:
    beq    L91F3                 ; 2³
    bne    L9178                 ; 2³
L91BE:
    bne    L91F3                 ; 2³
    beq    L9178                 ; 2³
L91C2:
    ldy    #$FC                  ; 2
    lda    $EC                   ; 3
    and    #$20                  ; 2
    bne    L91CC                 ; 2³
    ldy    #4                    ; 2
L91CC:
    tya                          ; 2
    clc                          ; 2
    adc    $F080,X               ; 4
    sta    $EB                   ; 3
    lda    $EC                   ; 3
    and    #$1F                  ; 2
    sta    $EA                   ; 3
    stx    $EE                   ; 3
    jsr    L9B8F                 ; 6
    ldx    $EE                   ; 3
    cmp    #0                    ; 2
    beq    L9178                 ; 2³
    ldy    $EA                   ; 3
    lda    $F0C4,Y               ; 4
    bpl    L91F3                 ; 2³
    lda    $F080,X               ; 4
    ora    #$80                  ; 2
    sta    $F000,X               ; 5
L91F3:
    lda    $EC                   ; 3
    tay                          ; 2
    and    #$1F                  ; 2
    beq    L9204                 ; 2³+1
    cmp    #5                    ; 2
    bne    L922E                 ; 2³+1
    bit    $EC                   ; 3
    bvc    L9235                 ; 2³
    bvs    L9229                 ; 2³
L9204:
    lda    $F080,X               ; 4
    bpl    L9213                 ; 2³
    lda    $F080,X               ; 4
    and    #$7F                  ; 2
    sta    $F000,X               ; 5
    bpl    L9229                 ; 2³
L9213:
    lda    $83                   ; 3
    ora    #$20                  ; 2
    sta    $83                   ; 3
    lda    $F6                   ; 3
    beq    L9229                 ; 2³
    tay                          ; 2
    lda    $F08C,Y               ; 4
    eor    #$A0                  ; 2
    sta    $F00C,Y               ; 5
    jsr    L9A90                 ; 6
L9229:
    lda    $EC                   ; 3
    eor    #$40                  ; 2
    tay                          ; 2
L922E:
    tya                          ; 2
    and    #$40                  ; 2
    beq    L9235                 ; 2³
    iny                          ; 2
    iny                          ; 2
L9235:
    dey                          ; 2
    tya                          ; 2
    eor    #$20                  ; 2
    sta    $F00C,X               ; 5
    jmp    L9192                 ; 3

L923F:
    rts                          ; 6

L9240:
    bit    $8A                   ; 3
    bvc    L9279                 ; 2³
    lda    $83                   ; 3
    and    #$08                  ; 2
    beq    L9276                 ; 2³
    lda    $E4                   ; 3
    lsr                          ; 2
    bcc    L9276                 ; 2³
    lda    $84                   ; 3
    and    #$0F                  ; 2
    bne    L9266                 ; 2³
    lda    SWCHA                 ; 4
    bpl    L9268                 ; 2³
    asl                          ; 2
    bmi    L9266                 ; 2³
    lda    $80                   ; 3
    beq    L9266                 ; 2³
    sed                          ; 2
    sbc    #1                    ; 2
    sta    $80                   ; 3
L9266:
    cld                          ; 2
    rts                          ; 6

L9268:
    lda    $80                   ; 3
    cmp    $FF                   ; 3
    beq    L9274                 ; 2³
    sed                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $80                   ; 3
L9274:
    cld                          ; 2
    rts                          ; 6

L9276:
    jmp    L9336                 ; 3

L9279:
    lda    $E7                   ; 3
    bmi    L9282                 ; 2³
    and    #$7F                  ; 2
    beq    L9282                 ; 2³
    rts                          ; 6

L9282:
    lda    SWCHA                 ; 4
    asl                          ; 2
    asl                          ; 2
    bpl    L92A3                 ; 2³
    asl                          ; 2
    bmi    L92B6                 ; 2³
    lda    $84                   ; 3
    and    #$03                  ; 2
    bne    L92B6                 ; 2³
    ldx    $F097                 ; 4
    inx                          ; 2
    stx    $F017                 ; 4
    cpx    #6                    ; 2
    bne    L92B6                 ; 2³
    dex                          ; 2
    stx    $F017                 ; 4
    bne    L92B6                 ; 2³
L92A3:
    lda    $84                   ; 3
    and    #$01                  ; 2
    bne    L92B6                 ; 2³
    ldx    $F097                 ; 4
    dex                          ; 2
    stx    $F017                 ; 4
    bpl    L92B6                 ; 2³
    inx                          ; 2
    stx    $F017                 ; 4
L92B6:
    lda    SWCHA                 ; 4
    bpl    L92FE                 ; 2³
    asl                          ; 2
    bpl    L92D5                 ; 2³
    lda    $F08B                 ; 4
    and    #$03                  ; 2
    beq    L92CF                 ; 2³
    lda    $E2                   ; 3
    and    #$C0                  ; 2
    sta    $E2                   ; 3
    bmi    L92E9                 ; 2³
    bpl    L9314                 ; 2³+1
L92CF:
    lda    #0                    ; 2
    sta    $E2                   ; 3
    beq    L9321                 ; 2³+1
L92D5:
    lda    $84                   ; 3
    and    #$07                  ; 2
    bne    L92EB                 ; 2³
    lda    $E2                   ; 3
    bmi    L92E3                 ; 2³
    lda    #$80                  ; 2
    sta    $E2                   ; 3
L92E3:
    and    #$3F                  ; 2
    cmp    #3                    ; 2
    beq    L92EB                 ; 2³
L92E9:
    inc    $E2                   ; 5
L92EB:
    lda    $E2                   ; 3
    and    #$3F                  ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    clc                          ; 2
    adc    $F08B                 ; 4
    sta    $F00B                 ; 4
    jmp    L9321                 ; 3

L92FE:
    lda    $84                   ; 3
    and    #$07                  ; 2
    bne    L9316                 ; 2³
    lda    $E2                   ; 3
    bit    $E2                   ; 3
    bvs    L930E                 ; 2³
    lda    #$40                  ; 2
    sta    $E2                   ; 3
L930E:
    and    #$3F                  ; 2
    cmp    #3                    ; 2
    beq    L9316                 ; 2³
L9314:
    inc    $E2                   ; 5
L9316:
    lda    $E2                   ; 3
    and    #$3F                  ; 2
    clc                          ; 2
    adc    $F08B                 ; 4
    sta    $F00B                 ; 4
L9321:
    lda    $F08B                 ; 4
    bpl    L932B                 ; 2³
    lda    #0                    ; 2
    sta    $F00B                 ; 4
L932B:
    cmp    #$7D                  ; 2
    bmi    L93AD                 ; 2³
    lda    #$7C                  ; 2
    sta    $F00B                 ; 4
    bne    L93AD                 ; 2³
L9336:
    lda    $84                   ; 3
    bpl    L93A7                 ; 2³
    and    #$03                  ; 2
    bne    L9372                 ; 2³
    bit    $E2                   ; 3
    bpl    L935A                 ; 2³
    lda    $F097                 ; 4
    bne    L934F                 ; 2³
    lda    $E2                   ; 3
    eor    #$80                  ; 2
    sta    $E2                   ; 3
    bpl    L9372                 ; 2³
L934F:
    lda    $F097                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F017                 ; 4
    bpl    L9372                 ; 2³
L935A:
    lda    $F097                 ; 4
    cmp    #5                    ; 2
    bne    L9369                 ; 2³
    lda    $E2                   ; 3
    eor    #$80                  ; 2
    sta    $E2                   ; 3
    bmi    L9372                 ; 2³
L9369:
    lda    $F097                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F017                 ; 4
L9372:
    bit    $E2                   ; 3
    bvc    L938F                 ; 2³
    lda    $F08B                 ; 4
    bne    L9384                 ; 2³
    lda    $E2                   ; 3
    eor    #$40                  ; 2
    sta    $E2                   ; 3
    jmp    L93A7                 ; 3

L9384:
    lda    $F08B                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F00B                 ; 4
    bpl    L93A7                 ; 2³
L938F:
    lda    $F08B                 ; 4
    cmp    #$7C                  ; 2
    bne    L939E                 ; 2³
    lda    $E2                   ; 3
    eor    #$40                  ; 2
    sta    $E2                   ; 3
    bne    L93A7                 ; 2³
L939E:
    lda    $F08B                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F00B                 ; 4
L93A7:
    lda    $86                   ; 3
    bpl    L93BF                 ; 2³
    bmi    L93B5                 ; 2³
L93AD:
    lda    $86                   ; 3
    bpl    L93BF                 ; 2³
    lda    INPT4                 ; 3
    bmi    L93CB                 ; 2³
L93B5:
    ldx    $F08B                 ; 4
    stx    $85                   ; 3
    lda    $F097                 ; 4
    sta    $86                   ; 3
L93BF:
    inc    $86                   ; 5
    lda    $86                   ; 3
    cmp    #$14                  ; 2
    bcc    L93CB                 ; 2³
    lda    #$FF                  ; 2
    sta    $86                   ; 3
L93CB:
    lda    $86                   ; 3
    bpl    L93D3                 ; 2³
    lda    #0                    ; 2
    beq    L93D9                 ; 2³
L93D3:
    asl                          ; 2
    adc    $86                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
L93D9:
    lda    #1                    ; 2
    ldy    $86                   ; 3
    cpy    #$FF                  ; 2
    beq    L93E3                 ; 2³
    lda    #7                    ; 2
L93E3:
    sta    $F023                 ; 4
    rts                          ; 6

L93E7:
    lda    #$FF                  ; 2
    sta    $EF                   ; 3
    sta    $F6                   ; 3
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    L93F5                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
L93F5:
    and    #$01                  ; 2
    sta    $F3                   ; 3
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F1                   ; 3
    lda    $FA                   ; 3
    and    #$F0                  ; 2
    beq    L9431                 ; 2³
    lda    $84                   ; 3
    and    #$0F                  ; 2
    bne    L9417                 ; 2³
    lda    $FA                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $FA                   ; 3
    bcs    L9431                 ; 2³
L9417:
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L9DF0,X               ; 4
    sta    $F0                   ; 3
    asl                          ; 2
    adc    $F0                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    $FB                   ; 3
    tax                          ; 2
    lda    L9E2C,X               ; 4
    sta    $EF                   ; 3
L9431:
    ldx    #0                    ; 2
L9433:
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    beq    L945D                 ; 2³
    and    #$1F                  ; 2
    sta    $EA                   ; 3
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1B                  ; 2
    bcs    L945D                 ; 2³
    tay                          ; 2
    lda    L961A,Y               ; 4
    bmi    L945D                 ; 2³
    tay                          ; 2
    lda    $F08B                 ; 4
    sec                          ; 2
    sbc    $F080,X               ; 4
    bcc    L9460                 ; 2³
    cmp    #4                    ; 2
    bcs    L947A                 ; 2³
    bcc    L9464                 ; 2³
L945D:
    jmp    L9519                 ; 3

L9460:
    cmp    #$FC                  ; 2
    bcc    L947A                 ; 2³
L9464:
    lda    $F097                 ; 4
    cmp    $EA                   ; 3
    bne    L947A                 ; 2³
    lda    $83                   ; 3
    and    #$EF                  ; 2
    sta    $83                   ; 3
    lda    #$50                  ; 2
    sta    $E7                   ; 3
    lda    #$FF                  ; 2
    sta    $86                   ; 3
    rts                          ; 6

L947A:
    cpy    #7                    ; 2
    beq    L948A                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lda    $F3                   ; 3
    bcs    L9488                 ; 2³
    beq    L948A                 ; 2³
    bne    L94C2                 ; 2³
L9488:
    beq    L94C2                 ; 2³
L948A:
    lda    $EF                   ; 3
    cmp    #$FF                  ; 2
    beq    L94C2                 ; 2³
    sec                          ; 2
    sbc    $F080,X               ; 4
    bcc    L949C                 ; 2³
    cmp    #8                    ; 2
    bcc    L94A0                 ; 2³
    bcs    L94C2                 ; 2³
L949C:
    cmp    #$F0                  ; 2
    bcc    L94C2                 ; 2³
L94A0:
    lda    $EA                   ; 3
    cmp    $F0                   ; 3
    beq    L94AD                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    $F0                   ; 3
    bne    L94C2                 ; 2³
L94AD:
    lda    $FA                   ; 3
    ora    #$08                  ; 2
    sta    $FA                   ; 3
    lda    L963D,Y               ; 4
    sta    $EC                   ; 3
    lda    L9645,Y               ; 4
    sta    $ED                   ; 3
    jsr    L9617                 ; 6
    bne    L9519                 ; 2³+1
L94C2:
    cpy    #7                    ; 2
    beq    L94CB                 ; 2³
    lda    $84                   ; 3
    lsr                          ; 2
    bcs    L9519                 ; 2³+1
L94CB:
    lda    $86                   ; 3
    bmi    L9519                 ; 2³+1
    cmp    $EA                   ; 3
    beq    L94ED                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    cmp    $EA                   ; 3
    beq    L94ED                 ; 2³
    cpy    #7                    ; 2
    beq    L9519                 ; 2³+1
    cpy    #2                    ; 2
    beq    L9519                 ; 2³+1
    cpy    #5                    ; 2
    beq    L9519                 ; 2³+1
    sec                          ; 2
    sbc    #2                    ; 2
    cmp    $EA                   ; 3
    bne    L9519                 ; 2³+1
L94ED:
    lda    $85                   ; 3
    sec                          ; 2
    sbc    $F080,X               ; 4
    bcc    L94FC                 ; 2³
    cmp    L9635,Y               ; 4
    bcc    L9500                 ; 2³+1
    bcs    L9519                 ; 2³+1
L94FC:
    cmp    #$FE                  ; 2
    bcc    L9519                 ; 2³
L9500:
    lda    $FA                   ; 3
    and    #$F7                  ; 2
    sta    $FA                   ; 3
    lda    L963D,Y               ; 4
    sta    $EC                   ; 3
    lda    L9645,Y               ; 4
    sta    $ED                   ; 3
    jsr    L9617                 ; 6
    beq    L9519                 ; 2³
    lda    #$FF                  ; 2
    sta    $86                   ; 3
L9519:
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcs    L9521                 ; 2³
    jmp    L9433                 ; 3

L9521:
    lda    $FA                   ; 3
    and    #$F7                  ; 2
    sta    $FA                   ; 3
    lda    #0                    ; 2
    sta    $EC                   ; 3
    lda    $85                   ; 3
    sta    $EB                   ; 3
    lda    $86                   ; 3
    bpl    L9534                 ; 2³
L9533:
    rts                          ; 6

L9534:
    sta    $EA                   ; 3
    jsr    L9B8F                 ; 6
    beq    L9533                 ; 2³
    bmi    L9542                 ; 2³
    asl                          ; 2
    bpl    L9547                 ; 2³
    bmi    L95A7                 ; 2³
L9542:
    asl                          ; 2
    bmi    L9567                 ; 2³
    bpl    L956C                 ; 2³
L9547:
    asl                          ; 2
    bmi    L954F                 ; 2³
    asl                          ; 2
    bpl    L9554                 ; 2³
    bmi    L95A7                 ; 2³
L954F:
    asl                          ; 2
    bmi    L9567                 ; 2³
    bpl    L956C                 ; 2³
L9554:
    asl                          ; 2
    bmi    L955C                 ; 2³
    asl                          ; 2
    bpl    L9561                 ; 2³
    bmi    L95A7                 ; 2³
L955C:
    asl                          ; 2
    bmi    L9567                 ; 2³
    bpl    L956C                 ; 2³
L9561:
    asl                          ; 2
    bmi    L956A                 ; 2³
    asl                          ; 2
    bmi    L95A7                 ; 2³
L9567:
    jmp    L9612                 ; 3

L956A:
    bmi    L9567                 ; 2³
L956C:
    inc    $EC                   ; 5
    tya                          ; 2
    and    #$FC                  ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$4D                  ; 2
    sta    $FB                   ; 3
    tya                          ; 2
    and    #$03                  ; 2
    clc                          ; 2
    adc    $FB                   ; 3
    sta    $FB                   ; 3
    asl                          ; 2
    clc                          ; 2
    adc    $FB                   ; 3
    sta    $FB                   ; 3
    txa                          ; 2
    and    #$06                  ; 2
    lsr                          ; 2
    adc    $FB                   ; 3
    sta    $FB                   ; 3
    dec    $FA                   ; 5
    lda    #8                    ; 2
    jsr    L9B31                 ; 6
    lda    #$27                  ; 2
    cmp    $FD                   ; 3
    bcs    L959D                 ; 2³
    sta    $FD                   ; 3
L959D:
    lda    $FA                   ; 3
    and    #$0F                  ; 2
    ora    #$70                  ; 2
    sta    $FA                   ; 3
    bne    L95D6                 ; 2³
L95A7:
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$14                  ; 2
    cmp    $EA                   ; 3
    bcc    L9612                 ; 2³+1
    cpx    $E5                   ; 3
    beq    L95C2                 ; 2³
    txa                          ; 2
    ora    #$80                  ; 2
    cmp    $E5                   ; 3
    beq    L95C9                 ; 2³
    stx    $E5                   ; 3
    bne    L9612                 ; 2³+1
L95C2:
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $E5                   ; 3
    bne    L9612                 ; 2³+1
L95C9:
    lda    #1                    ; 2
    jsr    L9AFE                 ; 6
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    L95D6                 ; 2³
    dec    $FE                   ; 5
L95D6:
    lda    #$FF                  ; 2
    sta    $E5                   ; 3
    lda    L9DD0,X               ; 4
    eor    #$FF                  ; 2
    sta    $EA                   ; 3
    lda.wy $8B,Y                 ; 4
    and    $EA                   ; 3
    sta.wy $8B,Y                 ; 5
    tya                          ; 2
    and    #$FC                  ; 2
    tay                          ; 2
    lda.wy $8B,Y                 ; 4
    bne    L9612                 ; 2³+1
    lda.wy $8C,Y                 ; 4
    bne    L9612                 ; 2³+1
    lda.wy $8D,Y                 ; 4
    bne    L9612                 ; 2³+1
    lda.wy $8E,Y                 ; 4
    bne    L9612                 ; 2³
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$14                  ; 2
    tay                          ; 2
    lda    $F0C4,Y               ; 4
    and    #$7F                  ; 2
    sta    $F044,Y               ; 5
L9612:
    ldx    #$FF                  ; 2
    stx    $86                   ; 3
    rts                          ; 6

L9617:
    jmp.ind ($00EC)              ; 5

L961A:
    .byte $FF ; |XXXXXXXX| $961A
    .byte $FF ; |XXXXXXXX| $961B
    .byte $00 ; |        | $961C
    .byte $00 ; |        | $961D
    .byte $01 ; |       X| $961E
    .byte $01 ; |       X| $961F
    .byte $01 ; |       X| $9620
    .byte $FF ; |XXXXXXXX| $9621
    .byte $02 ; |      X | $9622
    .byte $02 ; |      X | $9623
    .byte $02 ; |      X | $9624
    .byte $02 ; |      X | $9625
    .byte $03 ; |      XX| $9626
    .byte $03 ; |      XX| $9627
    .byte $04 ; |     X  | $9628
    .byte $04 ; |     X  | $9629
    .byte $04 ; |     X  | $962A
    .byte $04 ; |     X  | $962B
    .byte $05 ; |     X X| $962C
    .byte $05 ; |     X X| $962D
    .byte $05 ; |     X X| $962E
    .byte $05 ; |     X X| $962F
    .byte $06 ; |     XX | $9630
    .byte $06 ; |     XX | $9631
    .byte $06 ; |     XX | $9632
    .byte $06 ; |     XX | $9633
    .byte $07 ; |     XXX| $9634
L9635:
    .byte $05 ; |     X X| $9635
    .byte $06 ; |     XX | $9636
    .byte $06 ; |     XX | $9637
    .byte $05 ; |     X X| $9638
    .byte $06 ; |     XX | $9639
    .byte $06 ; |     XX | $963A
    .byte $02 ; |      X | $963B
    .byte $02 ; |      X | $963C
L963D:
    .byte $CE ; |XX  XXX | $963D
    .byte $49 ; | X  X  X| $963E
    .byte $94 ; |X  X X  | $963F
    .byte $B0 ; |X XX    | $9640
    .byte $0D ; |    XX X| $9641
    .byte $61 ; | XX    X| $9642
    .byte $85 ; |X    X X| $9643
    .byte $4D ; | X  XX X| $9644
L9645:
    .byte $9B ; |X  XX XX| $9645
    .byte $9C ; |X  XXX  | $9646
    .byte $9C ; |X  XXX  | $9647
    .byte $9C ; |X  XXX  | $9648
    .byte $9D ; |X  XXX X| $9649
    .byte $9D ; |X  XXX X| $964A
    .byte $9D ; |X  XXX X| $964B
    .byte $96 ; |X  X XX | $964C
    stx    $F6                   ; 3
    lda    $F08C,X               ; 4
    sta    $EC                   ; 3
    lda    #$FF                  ; 2
    sta    $E5                   ; 3
    dec    $DF                   ; 5
    dec    $F1                   ; 5
    bpl    L966C                 ; 2³
    lda    $83                   ; 3
    and    #$DF                  ; 2
    sta    $83                   ; 3
    lda    $8A                   ; 3
    ora    #$02                  ; 2
    sta    $8A                   ; 3
    bne    L9681                 ; 2³
L966C:
    cpx    $F1                   ; 3
    bcc    L9672                 ; 2³
    bne    L9681                 ; 2³
L9672:
    lda    $F08D,X               ; 4
    and    #$7F                  ; 2
    sta    $F00C,X               ; 5
    bpl    L9687                 ; 2³
L967C:
    cpx    #9                    ; 2
    bcs    L9696                 ; 2³
    inx                          ; 2
L9681:
    lda    $F08D,X               ; 4
    sta    $F00C,X               ; 5
L9687:
    lda    $F081,X               ; 4
    sta    $F000,X               ; 5
    lda    $F099,X               ; 4
    sta    $F018,X               ; 5
    jmp    L967C                 ; 3

L9696:
    lda    #$FF                  ; 2
    sta    $F016                 ; 4
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    L96AA                 ; 2³
    cmp    #1                    ; 2
    bne    L96AA                 ; 2³
    lda    #$9A                  ; 2
    sta    $F018                 ; 4
L96AA:
    jsr    L9A65                 ; 6
    bit    $EC                   ; 3
    bpl    L96C3                 ; 2³
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L96BB                 ; 2³
    lda    #3                    ; 2
    bpl    L96BD                 ; 2³
L96BB:
    lda    #1                    ; 2
L96BD:
    jsr    L9B31                 ; 6
    jmp    L96CE                 ; 3

L96C3:
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L96CB                 ; 2³
    lda    #$30                  ; 2
L96CB:
    jsr    L9AFE                 ; 6
L96CE:
    lda    $85                   ; 3
    sta    $EB                   ; 3
L96D2:
    jsr    L9B8F                 ; 6
    bne    L972E                 ; 2³+1
    lda    L9DD0,X               ; 4
    bne    L96F7                 ; 2³
    lda    $EC                   ; 3
    and    #$20                  ; 2
    beq    L96EB                 ; 2³
L96E2:
    lda    $EB                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    cmp    #$7C                  ; 2
    bcc    L96F2                 ; 2³
L96EB:
    lda    $EB                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    bcc    L96E2                 ; 2³
L96F2:
    sta    $EB                   ; 3
    jmp    L96D2                 ; 3

L96F7:
    sta    $EB                   ; 3
    bpl    L970B                 ; 2³+1
    tya                          ; 2
    and    #$03                  ; 2
    beq    L971C                 ; 2³
    lda.wy $8A,Y                 ; 4
    and    #$03                  ; 2
    cmp    #2                    ; 2
    beq    L972E                 ; 2³
    bne    L971C                 ; 2³
L970B:
    asl                          ; 2
    asl                          ; 2
    and.wy $8B,Y                 ; 4
    cmp    #$80                  ; 2
    beq    L972E                 ; 2³
    cmp    #$20                  ; 2
    beq    L972E                 ; 2³
    cmp    #8                    ; 2
    beq    L972E                 ; 2³
L971C:
    lda    $EB                   ; 3
    and    #$55                  ; 2
    ora.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    L972E                 ; 2³
    inc    $FE                   ; 5
L972E:
    dec    $F6                   ; 5
    ldx    $F6                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

L9735:
    lda    $84                   ; 3
    and    #$07                  ; 2
    beq    L9744                 ; 2³
    lsr                          ; 2
    bcs    L9744                 ; 2³
    lda    #2                    ; 2
    bit    $8A                   ; 3
    bne    L9746                 ; 2³
L9744:
    clc                          ; 2
    rts                          ; 6

L9746:
    ldy    #0                    ; 2
    ldx    #$0A                  ; 2
L974A:
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    bne    L9752                 ; 2³
    iny                          ; 2
L9752:
    dex                          ; 2
    bpl    L974A                 ; 2³
    cpy    #9                    ; 2
    bcc    L9744                 ; 2³
    ldx    #$0A                  ; 2
    ldy    #$0A                  ; 2
L975D:
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    beq    L9774                 ; 2³
    sta    $F00C,Y               ; 5
    lda    $F080,X               ; 4
    sta    $F000,Y               ; 5
    lda    $F098,X               ; 4
    sta    $F018,Y               ; 5
    dey                          ; 2
L9774:
    dex                          ; 2
    bpl    L975D                 ; 2³
    tya                          ; 2
    bmi    L9782                 ; 2³
    lda    #$FF                  ; 2
L977C:
    sta    $F00C,Y               ; 5
    dey                          ; 2
    bpl    L977C                 ; 2³
L9782:
    lda    $83                   ; 3
    bpl    L97C1                 ; 2³
    lda    $87                   ; 3
    cmp    #1                    ; 2
    bne    L979F                 ; 2³
    ldx    $80                   ; 3
    cpx    #$1E                  ; 2
    bcc    L9794                 ; 2³
    ldx    #$1E                  ; 2
L9794:
    lda    L98E2,X               ; 4
    sta    $E6                   ; 3
    lda    #4                    ; 2
    bit    $8A                   ; 3
    bne    L97A5                 ; 2³
L979F:
    lda    $83                   ; 3
    and    #$7F                  ; 2
    sta    $83                   ; 3
L97A5:
    lda    #0                    ; 2
    sta    $E3                   ; 3
    lda    $87                   ; 3
    cmp    #$0F                  ; 2
    bne    L97E1                 ; 2³
    lda    #1                    ; 2
    sta    $87                   ; 3
    lda    #4                    ; 2
    bit    $8A                   ; 3
    bne    L97C7                 ; 2³
    lda    $8A                   ; 3
    ora    #$08                  ; 2
    sta    $8A                   ; 3
    bne    L97C7                 ; 2³
L97C1:
    lda    $87                   ; 3
    cmp    #1                    ; 2
    bne    L97E1                 ; 2³
L97C7:
    bit    $8A                   ; 3
    bvs    L97E1                 ; 2³
    ldx    $80                   ; 3
    cpx    #$1E                  ; 2
    bcc    L97D3                 ; 2³
    ldx    #$1E                  ; 2
L97D3:
    lda    L98C3,X               ; 4
    sta    $E6                   ; 3
    lda    $83                   ; 3
    ora    #$80                  ; 2
    sta    $83                   ; 3
    jmp    L9824                 ; 3

L97E1:
    lda    #4                    ; 2
    bit    $8A                   ; 3
    bne    L9824                 ; 2³+1
    bvs    L9824                 ; 2³+1
    inc    $87                   ; 5
    lda    $87                   ; 3
    cmp    #7                    ; 2
    bne    L9800                 ; 2³+1
    lda    $83                   ; 3
    ora    #$10                  ; 2
    sta    $83                   ; 3
    lda    #$FC                  ; 2
    sta    $E3                   ; 3
    sta    $E4                   ; 3
    jmp    L9824                 ; 3

L9800:
    cmp    #4                    ; 2
    beq    L9814                 ; 2³
    cmp    #9                    ; 2
    beq    L9814                 ; 2³
    cmp    #$0B                  ; 2
    beq    L9814                 ; 2³
    cmp    #$0D                  ; 2
    beq    L9814                 ; 2³
    cmp    #$0F                  ; 2
    bne    L981E                 ; 2³
L9814:
    lda    $83                   ; 3
    ora    #$80                  ; 2
    sta    $83                   ; 3
    lda    #0                    ; 2
    sta    $E3                   ; 3
L981E:
    lda    $8A                   ; 3
    ora    #$08                  ; 2
    sta    $8A                   ; 3
L9824:
    lda    $87                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L9E38,X               ; 4
    sta    $88                   ; 3
    lda    L9E40,X               ; 4
    sta    $89                   ; 3
    lda    $8A                   ; 3
    and    #$F9                  ; 2
    sta    $8A                   ; 3
    lda    $87                   ; 3
    cmp    #1                    ; 2
    beq    L9845                 ; 2³
    lda    $83                   ; 3
    bpl    L9845                 ; 2³
    jmp    L989D                 ; 3

L9845:
    lda    $DF                   ; 3
    and    #$F0                  ; 2
    ora    #$09                  ; 2
    sta    $DF                   ; 3
    ldx    $80                   ; 3
    cpx    #2                    ; 2
    bcs    L985C                 ; 2³
    lda    $87                   ; 3
    lsr                          ; 2
    bcs    L985C                 ; 2³
    lda    #$1A                  ; 2
    bne    L985E                 ; 2³
L985C:
    lda    #$9A                  ; 2
L985E:
    sta    $EB                   ; 3
    ldx    $87                   ; 3
    lda    L98B3,X               ; 4
    sta    $EA                   ; 3
    lda    #$3C                  ; 2
    ldy    #$B3                  ; 2
    ldx    #0                    ; 2
L986D:
    cpx    $EA                   ; 3
    bcc    L9881                 ; 2³
    lda    L98A2,X               ; 4
    sta    $F000,X               ; 5
    lda    L98AB,X               ; 4
    sta    $F00C,X               ; 5
    lda    #$9A                  ; 2
    bne    L988D                 ; 2³
L9881:
    clc                          ; 2
    adc    #4                    ; 2
    sta    $F000,X               ; 5
    tya                          ; 2
    sta    $F00C,X               ; 5
    lda    $EB                   ; 3
L988D:
    sta    $F018,X               ; 5
    lda    $F080,X               ; 4
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L986D                 ; 2³
    lda    #$33                  ; 2
    sta    $F00C                 ; 4
L989D:
    jsr    L9A65                 ; 6
    sec                          ; 2
    rts                          ; 6

L98A2:
    .byte $40 ; | X      | $98A2
    .byte $2F ; |  X XXXX| $98A3
    .byte $4D ; | X  XX X| $98A4
    .byte $0E ; |    XXX | $98A5
    .byte $6C ; | XX XX  | $98A6
    .byte $1F ; |   XXXXX| $98A7
    .byte $5D ; | X XXX X| $98A8
    .byte $02 ; |      X | $98A9
    .byte $7C ; | XXXXX  | $98AA
L98AB:
    .byte $33 ; |  XX  XX| $98AB
    .byte $12 ; |   X  X | $98AC
    .byte $32 ; |  XX  X | $98AD
    .byte $12 ; |   X  X | $98AE
    .byte $32 ; |  XX  X | $98AF
    .byte $12 ; |   X  X | $98B0
    .byte $33 ; |  XX  XX| $98B1
    .byte $13 ; |   X  XX| $98B2
L98B3:
    .byte $33 ; |  XX  XX| $98B3
    .byte $09 ; |    X  X| $98B4
    .byte $08 ; |    X   | $98B5
    .byte $08 ; |    X   | $98B6
    .byte $07 ; |     XXX| $98B7
    .byte $07 ; |     XXX| $98B8
    .byte $06 ; |     XX | $98B9
    .byte $06 ; |     XX | $98BA
    .byte $05 ; |     X X| $98BB
    .byte $05 ; |     X X| $98BC
    .byte $04 ; |     X  | $98BD
    .byte $04 ; |     X  | $98BE
    .byte $03 ; |      XX| $98BF
    .byte $02 ; |      X | $98C0
    .byte $01 ; |       X| $98C1
    .byte $01 ; |       X| $98C2
L98C3:
    .byte $11 ; |   X   X| $98C3
    .byte $11 ; |   X   X| $98C4
    .byte $11 ; |   X   X| $98C5
    .byte $12 ; |   X  X | $98C6
    .byte $12 ; |   X  X | $98C7
    .byte $12 ; |   X  X | $98C8
    .byte $13 ; |   X  XX| $98C9
    .byte $13 ; |   X  XX| $98CA
    .byte $13 ; |   X  XX| $98CB
    .byte $14 ; |   X X  | $98CC
    .byte $14 ; |   X X  | $98CD
    .byte $14 ; |   X X  | $98CE
    .byte $14 ; |   X X  | $98CF
    .byte $15 ; |   X X X| $98D0
    .byte $15 ; |   X X X| $98D1
    .byte $15 ; |   X X X| $98D2
    .byte $15 ; |   X X X| $98D3
    .byte $16 ; |   X XX | $98D4
    .byte $16 ; |   X XX | $98D5
    .byte $16 ; |   X XX | $98D6
    .byte $16 ; |   X XX | $98D7
    .byte $16 ; |   X XX | $98D8
    .byte $17 ; |   X XXX| $98D9
    .byte $17 ; |   X XXX| $98DA
    .byte $17 ; |   X XXX| $98DB
    .byte $17 ; |   X XXX| $98DC
    .byte $18 ; |   XX   | $98DD
    .byte $18 ; |   XX   | $98DE
    .byte $18 ; |   XX   | $98DF
    .byte $18 ; |   XX   | $98E0
    .byte $18 ; |   XX   | $98E1
L98E2:
    .byte $11 ; |   X   X| $98E2
    .byte $11 ; |   X   X| $98E3
    .byte $11 ; |   X   X| $98E4
    .byte $11 ; |   X   X| $98E5
    .byte $11 ; |   X   X| $98E6
    .byte $22 ; |  X   X | $98E7
    .byte $22 ; |  X   X | $98E8
    .byte $22 ; |  X   X | $98E9
    .byte $22 ; |  X   X | $98EA
    .byte $22 ; |  X   X | $98EB
    .byte $22 ; |  X   X | $98EC
    .byte $22 ; |  X   X | $98ED
    .byte $22 ; |  X   X | $98EE
    .byte $22 ; |  X   X | $98EF
    .byte $22 ; |  X   X | $98F0
    .byte $22 ; |  X   X | $98F1
    .byte $22 ; |  X   X | $98F2
    .byte $22 ; |  X   X | $98F3
    .byte $22 ; |  X   X | $98F4
    .byte $22 ; |  X   X | $98F5
    .byte $22 ; |  X   X | $98F6
    .byte $22 ; |  X   X | $98F7
    .byte $22 ; |  X   X | $98F8
    .byte $22 ; |  X   X | $98F9
    .byte $22 ; |  X   X | $98FA
    .byte $33 ; |  XX  XX| $98FB
    .byte $33 ; |  XX  XX| $98FC
    .byte $33 ; |  XX  XX| $98FD
    .byte $33 ; |  XX  XX| $98FE
    .byte $33 ; |  XX  XX| $98FF
    .byte $33 ; |  XX  XX| $9900
L9901:
    lda    $E1                   ; 3
    sta    $EA                   ; 3
    lda    $DF                   ; 3
    sta    $EB                   ; 3
L9909:
    jsr    L9B8F                 ; 6
    and    #$55                  ; 2
    beq    L9921                 ; 2³
    sta    $F6                   ; 3
    lda    L9DD0,X               ; 4
    eor    #$FF                  ; 2
    and.wy $8B,Y                 ; 4
    ora    $F6                   ; 3
    sta.wy $8B,Y                 ; 5
    bne    L9929                 ; 2³
L9921:
    dec    $EA                   ; 5
    dec    $EA                   ; 5
    bpl    L9909                 ; 2³
    bmi    L994D                 ; 2³
L9929:
    lda    $EB                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
    bcs    L9932                 ; 2³
    lda    #0                    ; 2
L9932:
    sta    $F00B                 ; 4
    lda    $EA                   ; 3
    sta    $F017                 ; 4
    lda    #$80                  ; 2
    sta    $E0                   ; 3
    lda    #5                    ; 2
    jsr    L9AFE                 ; 6
    dec    $EA                   ; 5
    dec    $EA                   ; 5
    lda    $EA                   ; 3
    sta    $E1                   ; 3
    bpl    L9960                 ; 2³
L994D:
    lda    $EB                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    bmi    L9961                 ; 2³
    sta    $DF                   ; 3
    lda    $E1                   ; 3
    and    #$01                  ; 2
    eor    #$01                  ; 2
    ora    #$12                  ; 2
    sta    $E1                   ; 3
L9960:
    rts                          ; 6

L9961:
    lda    $83                   ; 3
    and    #$BF                  ; 2
    sta    $83                   ; 3
    lda    $83                   ; 3
    and    #$07                  ; 2
    beq    L9972                 ; 2³
    dec    $83                   ; 5
    jmp    L9983                 ; 3

L9972:
    lda    $83                   ; 3
    ora    #$08                  ; 2
    sta    $83                   ; 3
    lda    $8A                   ; 3
    and    #$F9                  ; 2
    ora    #$40                  ; 2
    sta    $8A                   ; 3
    jmp    L9998                 ; 3

L9983:
    lda    $8A                   ; 3
    ora    #$06                  ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $F017                 ; 4
    lda    #$3C                  ; 2
    sta    $F00B                 ; 4
    lda    #1                    ; 2
    sta    $F023                 ; 4
L9998:
    ldx    #$0A                  ; 2
    lda    #$FF                  ; 2
L999C:
    sta    $F00C,X               ; 5
    dex                          ; 2
    bpl    L999C                 ; 2³
    inx                          ; 2
    stx    $DF                   ; 3
    stx    $E0                   ; 3
    stx    $E1                   ; 3
    stx    $E4                   ; 3
    ldx    #$13                  ; 2
L99AD:
    lda    $F0C4,X               ; 4
    and    #$7F                  ; 2
    sta    $F044,X               ; 5
    dex                          ; 2
    bpl    L99AD                 ; 2³
    rts                          ; 6

L99B9:
    ldx    #$0A                  ; 2
L99BB:
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    beq    L99E3                 ; 2³
    and    #$C0                  ; 2
    sta    $F6                   ; 3
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$21                  ; 2
    bcc    L99E3                 ; 2³
    cmp    #$2B                  ; 2
    bcs    L99E3                 ; 2³
    lda    $84                   ; 3
    and    #$C0                  ; 2
    cmp    $F6                   ; 3
    bne    L99E3                 ; 2³
    jsr    L9A4B                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
L99E3:
    dex                          ; 2
    bpl    L99BB                 ; 2³
    lda    $E7                   ; 3
    bmi    L9A1B                 ; 2³+1
    and    #$7F                  ; 2
    beq    L9A1B                 ; 2³+1
    and    #$03                  ; 2
    bne    L99FE                 ; 2³
    lda    $F7                   ; 3
    bmi    L99FA                 ; 2³
    ldx    #$B2                  ; 2
    bmi    L99FC                 ; 2³
L99FA:
    ldx    #$40                  ; 2
L99FC:
    stx    $F7                   ; 3
L99FE:
    dec    $E7                   ; 5
    lda    $E7                   ; 3
    and    #$7F                  ; 2
    beq    L9A1C                 ; 2³
    cmp    #$0C                  ; 2
    bcc    L9A1B                 ; 2³
    bne    L9A12                 ; 2³
    lda    #$31                  ; 2
    sta    $F023                 ; 4
    rts                          ; 6

L9A12:
    cmp    #$18                  ; 2
    bne    L9A1B                 ; 2³
    lda    #$2C                  ; 2
    sta    $F023                 ; 4
L9A1B:
    rts                          ; 6

L9A1C:
    lda    #$1C                  ; 2
    sta    $F023                 ; 4
    lda    #$FF                  ; 2
    sta    $F017                 ; 4
    lda    $FA                   ; 3
    and    #$0F                  ; 2
    sta    $FA                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
    sta    $DF                   ; 3
    sta    $E7                   ; 3
    ldx    #$13                  ; 2
    lda    $8A                   ; 3
    lsr                          ; 2
    bcs    L9A3C                 ; 2³
    dex                          ; 2
L9A3C:
    stx    $E1                   ; 3
    lda    $83                   ; 3
    and    #$DF                  ; 2
    ora    #$40                  ; 2
    sta    $83                   ; 3
    lda    #$B2                  ; 2
    sta    $F7                   ; 3
    rts                          ; 6

L9A4B:
    stx    $F5                   ; 3
    ldx    #$0C                  ; 2
L9A4F:
    dex                          ; 2
    bmi    L9A63                 ; 2³
    lda    $F0A4,X               ; 4
    and    #$0F                  ; 2
    cmp    $F5                   ; 3
    bne    L9A4F                 ; 2³
    lda    #$FF                  ; 2
    sta    $F024,X               ; 5
    ldx    $F5                   ; 3
    rts                          ; 6

L9A63:
    bmi    L9A63                 ; 2³
L9A65:
    ldy    #0                    ; 2
    ldx    #$0B                  ; 2
L9A69:
    lda    $F08C,X               ; 4
    bpl    L9A7B                 ; 2³
    cmp    #$FF                  ; 2
    beq    L9A80                 ; 2³
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    beq    L9A80                 ; 2³
L9A7B:
    txa                          ; 2
    sta    $F024,Y               ; 5
    iny                          ; 2
L9A80:
    dex                          ; 2
    bpl    L9A69                 ; 2³
    lda    #$FF                  ; 2
L9A85:
    cpy    #$0C                  ; 2
    bcs    L9A8F                 ; 2³
    sta    $F024,Y               ; 5
    iny                          ; 2
    bpl    L9A85                 ; 2³
L9A8F:
    rts                          ; 6

L9A90:
    lda    #$FF                  ; 2
    cmp    $F0AD                 ; 4
    bne    L9A9B                 ; 2³
    sty    $F02D                 ; 4
    rts                          ; 6

L9A9B:
    cmp    $F0AE                 ; 4
    bne    L9AA4                 ; 2³
    sty    $F02E                 ; 4
    rts                          ; 6

L9AA4:
    cmp    $F0AF                 ; 4
    bne    L9AAD                 ; 2³
    sty    $F02F                 ; 4
    rts                          ; 6

L9AAD:
    cmp    $F0AC                 ; 4
    bne    L9AB6                 ; 2³
    sty    $F02C                 ; 4
    rts                          ; 6

L9AB6:
    cmp    $F0AB                 ; 4
    bne    L9ABF                 ; 2³
    sty    $F02B                 ; 4
    rts                          ; 6

L9ABF:
    cmp    $F0AA                 ; 4
    bne    L9AC8                 ; 2³
    sty    $F02A                 ; 4
    rts                          ; 6

L9AC8:
    cmp    $F0A9                 ; 4
    bne    L9AD1                 ; 2³
    sty    $F029                 ; 4
    rts                          ; 6

L9AD1:
    cmp    $F0A8                 ; 4
    bne    L9ADA                 ; 2³
    sty    $F028                 ; 4
    rts                          ; 6

L9ADA:
    cmp    $F0A7                 ; 4
    bne    L9AE3                 ; 2³
    sty    $F027                 ; 4
    rts                          ; 6

L9AE3:
    cmp    $F0A6                 ; 4
    bne    L9AEC                 ; 2³
    sty    $F026                 ; 4
    rts                          ; 6

L9AEC:
    cmp    $F0A5                 ; 4
    bne    L9AF5                 ; 2³
    sty    $F025                 ; 4
    rts                          ; 6

L9AF5:
    cmp    $F0A4                 ; 4
    bne    L9AFD                 ; 2³
    sty    $F024                 ; 4
L9AFD:
    rts                          ; 6

L9AFE:
    bit    $8A                   ; 3
    bvs    L9B30                 ; 2³
    sed                          ; 2
    clc                          ; 2
    adc    $82                   ; 3
    sta    $82                   ; 3
    lda    #0                    ; 2
    adc    $81                   ; 3
    sta    $81                   ; 3
    bcc    L9B2F                 ; 2³
L9B10:
    lda    #0                    ; 2
    adc    $80                   ; 3
    sta    $80                   ; 3
    lda    #$13                  ; 2
    sta    $FD                   ; 3
    lda    $83                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$07                  ; 2
    bne    L9B25                 ; 2³
    lda    #7                    ; 2
L9B25:
    sta    $F6                   ; 3
    lda    $83                   ; 3
    and    #$F8                  ; 2
    ora    $F6                   ; 3
    sta    $83                   ; 3
L9B2F:
    cld                          ; 2
L9B30:
    rts                          ; 6

L9B31:
    bit    $8A                   ; 3
    bvs    L9B30                 ; 2³
    sed                          ; 2
    clc                          ; 2
    adc    $81                   ; 3
    sta    $81                   ; 3
    bcs    L9B10                 ; 2³
    bcc    L9B2F                 ; 2³
L9B3F:
    bit    $8A                   ; 3
    bmi    L9B87                 ; 2³
    bit    $83                   ; 3
    bvc    L9B5D                 ; 2³
    bit    $E0                   ; 3
    bpl    L9B57                 ; 2³
    lda    $84                   ; 3
    and    #$01                  ; 2
    bne    L9B87                 ; 2³
    lda    $E0                   ; 3
    and    #$7F                  ; 2
    sta    $E0                   ; 3
L9B57:
    jsr    L9901                 ; 6
    jmp    L9B87                 ; 3

L9B5D:
    jsr    L99B9                 ; 6
    lda    $E7                   ; 3
    bmi    L9B66                 ; 2³
    bne    L9B87                 ; 2³
L9B66:
    jsr    L93E7                 ; 6
    bit    $83                   ; 3
    bvs    L9B87                 ; 2³
    jsr    L9240                 ; 6
    lda    $E7                   ; 3
    bpl    L9B7A                 ; 2³
    lda    $84                   ; 3
    and    #$03                  ; 2
    beq    L9B7C                 ; 2³
L9B7A:
    bne    L9B87                 ; 2³
L9B7C:
    jsr    L9735                 ; 6
    bcs    L9B87                 ; 2³
    jsr    L9103                 ; 6
    jmp    L9FEA                 ; 3

L9B87:
    ldx    INTIM                 ; 4
    bne    L9B87                 ; 2³
    jmp    L9FF0                 ; 3

L9B8F:
    lda    $EA                   ; 3
    eor    $8A                   ; 3
    lsr                          ; 2
    lda    #0                    ; 2
    bcs    L9B9A                 ; 2³
    lda    #5                    ; 2
L9B9A:
    adc    $EB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $EA                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$51                  ; 2
    sec                          ; 2
    sbc    L9DB0,X               ; 4
    tay                          ; 2
    lda.wy $8B,Y                 ; 4
    and    L9DD0,X               ; 4
    bne    L9BC9                 ; 2³
    lda    L9DCF,X               ; 4
    and.wy $8B,Y                 ; 4
    cmp    #8                    ; 2
    beq    L9BCA                 ; 2³
    cmp    #$20                  ; 2
    beq    L9BCA                 ; 2³
    cmp    #$80                  ; 2
    beq    L9BCA                 ; 2³
    lda    #0                    ; 2
L9BC9:
    rts                          ; 6

L9BCA:
    dex                          ; 2
    cmp    #0                    ; 2
    rts                          ; 6

    lda    $F098,X               ; 4
    bmi    L9BDB                 ; 2³
    ora    #$80                  ; 2
    sta    $F018,X               ; 5
    lda    #0                    ; 2
    rts                          ; 6

L9BDB:
    lda    $83                   ; 3
    bpl    L9C2F                 ; 2³+1
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    beq    L9C2F                 ; 2³+1
    cmp    #9                    ; 2
    beq    L9C2F                 ; 2³+1
    cmp    #$0B                  ; 2
    beq    L9C2F                 ; 2³+1
    lda    $84                   ; 3
    and    #$C0                  ; 2
    clc                          ; 2
    adc    #$40                  ; 2
    ora    $EA                   ; 3
    sta    $F00C,X               ; 5
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9C10                 ; 2³
    lda    #6                    ; 2
    jsr    L9B31                 ; 6
    lda    #4                    ; 2
    cmp    $E3                   ; 3
    bcc    L9C2F                 ; 2³
    sta    $E3                   ; 3
    bcs    L9C2F                 ; 2³
L9C10:
    sed                          ; 2
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    jsr    L9B31                 ; 6
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #$21                  ; 2
    sta    $F018,X               ; 5
    inc    $E3                   ; 5
    lda    $E3                   ; 3
    cmp    #9                    ; 2
    bcc    L9C37                 ; 2³
    lda    #8                    ; 2
    sta    $E3                   ; 3
    bpl    L9C37                 ; 2³
L9C2F:
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    L9A4B                 ; 6
L9C37:
    lda    $DF                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $DF                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

L9C41:
    .byte $2A ; |  X X X | $9C41
    .byte $28 ; |  X X   | $9C42
    .byte $25 ; |  X  X X| $9C43
    .byte $22 ; |  X   X | $9C44
L9C45:
    .byte $12 ; |   X  X | $9C45
    .byte $09 ; |    X  X| $9C46
    .byte $06 ; |     XX | $9C47
    .byte $03 ; |      XX| $9C48
    sty    $EC                   ; 3
    lda    $EA                   ; 3
    sec                          ; 2
    sbc    $F097                 ; 4
    bcs    L9C55                 ; 2³
    lda    #0                    ; 2
L9C55:
    cmp    #7                    ; 2
    bcc    L9C5B                 ; 2³
    lda    #7                    ; 2
L9C5B:
    lsr                          ; 2
    tay                          ; 2
    lda    L9C41,Y               ; 4
    sta    $F018,X               ; 5
    lda    L9C45,Y               ; 4
    sta    $ED                   ; 3
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9C7D                 ; 2³
    sed                          ; 2
    lda    $ED                   ; 3
    clc                          ; 2
    adc    $ED                   ; 3
    adc    $ED                   ; 3
    jsr    L9B31                 ; 6
    lda    #$FF                  ; 2
    bmi    L9C8A                 ; 2³
L9C7D:
    lda    $ED                   ; 3
    jsr    L9B31                 ; 6
    lda    $84                   ; 3
    and    #$C0                  ; 2
    adc    #$40                  ; 2
    ora    $EA                   ; 3
L9C8A:
    sta    $F00C,X               ; 5
    dec    $E0                   ; 5
    ldy    $EC                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9C9C                 ; 2³
    lda    #$30                  ; 2
L9C9C:
    jsr    L9B31                 ; 6
    jsr    L9A4B                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    lda    $E0                   ; 3
    and    #$BF                  ; 2
    sta    $E0                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9CBA                 ; 2³
    lda    #$15                  ; 2
    bpl    L9CBC                 ; 2³
L9CBA:
    lda    #5                    ; 2
L9CBC:
    jsr    L9B31                 ; 6
    lda    $83                   ; 3
    bpl    L9CFB                 ; 2³
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    beq    L9CFB                 ; 2³
    cmp    #4                    ; 2
    beq    L9CFB                 ; 2³
    cmp    #$0B                  ; 2
    beq    L9CFB                 ; 2³
    lda    $84                   ; 3
    and    #$C0                  ; 2
    clc                          ; 2
    adc    #$40                  ; 2
    ora    $EA                   ; 3
    sta    $F00C,X               ; 5
    lda    #8                    ; 2
    bit    $FA                   ; 3
    bne    L9CFB                 ; 2³
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #$21                  ; 2
    sta    $F018,X               ; 5
    inc    $E3                   ; 5
    lda    $E3                   ; 3
    cmp    #9                    ; 2
    bcc    L9D03                 ; 2³+1
    lda    #8                    ; 2
    sta    $E3                   ; 3
    bpl    L9D03                 ; 2³+1
L9CFB:
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    L9A4B                 ; 6
L9D03:
    lda    $E1                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E1                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9D17                 ; 2³
    lda    #$12                  ; 2
    bpl    L9D19                 ; 2³
L9D17:
    lda    #4                    ; 2
L9D19:
    jsr    L9B31                 ; 6
    lda    $8A                   ; 3
    ora    #$10                  ; 2
    sta    $8A                   ; 3
    lda    $83                   ; 3
    bpl    L9D54                 ; 2³
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #$0B                  ; 2
    beq    L9D32                 ; 2³
    cmp    #$0F                  ; 2
    bne    L9D54                 ; 2³
L9D32:
    lda    $84                   ; 3
    and    #$C0                  ; 2
    clc                          ; 2
    adc    #$40                  ; 2
    ora    $EA                   ; 3
    sta    $F00C,X               ; 5
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #$21                  ; 2
    sta    $F018,X               ; 5
    inc    $E3                   ; 5
    lda    $E3                   ; 3
    cmp    #9                    ; 2
    bcc    L9D5C                 ; 2³
    lda    #8                    ; 2
    sta    $E3                   ; 3
    bpl    L9D5C                 ; 2³
L9D54:
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    L9A4B                 ; 6
L9D5C:
    dec    $E1                   ; 5
    lda    #1                    ; 2
    rts                          ; 6

    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9D6B                 ; 2³
    lda    #$30                  ; 2
    bpl    L9D6D                 ; 2³
L9D6B:
    lda    #1                    ; 2
L9D6D:
    jsr    L9B31                 ; 6
    lda    #$BC                  ; 2
    sta    $E7                   ; 3
    jsr    L9A4B                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    lda    $E0                   ; 3
    and    #$7F                  ; 2
    sta    $E0                   ; 3
    lda    #1                    ; 2
    rts                          ; 6

    lda    $EA                   ; 3
    beq    L9DAF                 ; 2³
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    L9D93                 ; 2³
    lda    #9                    ; 2
    bpl    L9D95                 ; 2³
L9D93:
    lda    #3                    ; 2
L9D95:
    jsr    L9B31                 ; 6
    lda    $8A                   ; 3
    ora    #$08                  ; 2
    sta    $8A                   ; 3
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    L9A4B                 ; 6
    lda    $E0                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E0                   ; 3
    lda    #1                    ; 2
L9DAF:
    rts                          ; 6

L9DB0:
    .byte $04 ; |     X  | $9DB0
    .byte $04 ; |     X  | $9DB1
    .byte $04 ; |     X  | $9DB2
    .byte $04 ; |     X  | $9DB3
    .byte $04 ; |     X  | $9DB4
    .byte $04 ; |     X  | $9DB5
    .byte $04 ; |     X  | $9DB6
    .byte $04 ; |     X  | $9DB7
    .byte $03 ; |      XX| $9DB8
    .byte $03 ; |      XX| $9DB9
    .byte $03 ; |      XX| $9DBA
    .byte $03 ; |      XX| $9DBB
    .byte $03 ; |      XX| $9DBC
    .byte $03 ; |      XX| $9DBD
    .byte $03 ; |      XX| $9DBE
    .byte $03 ; |      XX| $9DBF
    .byte $02 ; |      X | $9DC0
    .byte $02 ; |      X | $9DC1
    .byte $02 ; |      X | $9DC2
    .byte $02 ; |      X | $9DC3
    .byte $02 ; |      X | $9DC4
    .byte $02 ; |      X | $9DC5
    .byte $02 ; |      X | $9DC6
    .byte $02 ; |      X | $9DC7
    .byte $01 ; |       X| $9DC8
    .byte $01 ; |       X| $9DC9
    .byte $01 ; |       X| $9DCA
    .byte $01 ; |       X| $9DCB
    .byte $01 ; |       X| $9DCC
    .byte $01 ; |       X| $9DCD
    .byte $01 ; |       X| $9DCE
L9DCF:
    .byte $01 ; |       X| $9DCF
L9DD0:
    .byte $00 ; |        | $9DD0
    .byte $C0 ; |XX      | $9DD1
    .byte $00 ; |        | $9DD2
    .byte $30 ; |  XX    | $9DD3
    .byte $00 ; |        | $9DD4
    .byte $0C ; |    XX  | $9DD5
    .byte $00 ; |        | $9DD6
    .byte $03 ; |      XX| $9DD7
    .byte $00 ; |        | $9DD8
    .byte $C0 ; |XX      | $9DD9
    .byte $00 ; |        | $9DDA
    .byte $30 ; |  XX    | $9DDB
    .byte $00 ; |        | $9DDC
    .byte $0C ; |    XX  | $9DDD
    .byte $00 ; |        | $9DDE
    .byte $03 ; |      XX| $9DDF
    .byte $00 ; |        | $9DE0
    .byte $C0 ; |XX      | $9DE1
    .byte $00 ; |        | $9DE2
    .byte $30 ; |  XX    | $9DE3
    .byte $00 ; |        | $9DE4
    .byte $0C ; |    XX  | $9DE5
    .byte $00 ; |        | $9DE6
    .byte $03 ; |      XX| $9DE7
    .byte $00 ; |        | $9DE8
    .byte $C0 ; |XX      | $9DE9
    .byte $00 ; |        | $9DEA
    .byte $30 ; |  XX    | $9DEB
    .byte $00 ; |        | $9DEC
    .byte $0C ; |    XX  | $9DED
    .byte $00 ; |        | $9DEE
    .byte $03 ; |      XX| $9DEF
L9DF0:
    .byte $00 ; |        | $9DF0
    .byte $00 ; |        | $9DF1
    .byte $00 ; |        | $9DF2
    .byte $01 ; |       X| $9DF3
    .byte $01 ; |       X| $9DF4
    .byte $01 ; |       X| $9DF5
    .byte $02 ; |      X | $9DF6
    .byte $02 ; |      X | $9DF7
    .byte $02 ; |      X | $9DF8
    .byte $03 ; |      XX| $9DF9
    .byte $03 ; |      XX| $9DFA
    .byte $03 ; |      XX| $9DFB
    .byte $04 ; |     X  | $9DFC
    .byte $04 ; |     X  | $9DFD
    .byte $04 ; |     X  | $9DFE
    .byte $05 ; |     X X| $9DFF
    .byte $05 ; |     X X| $9E00
    .byte $05 ; |     X X| $9E01
    .byte $06 ; |     XX | $9E02
    .byte $06 ; |     XX | $9E03
    .byte $06 ; |     XX | $9E04
    .byte $07 ; |     XXX| $9E05
    .byte $07 ; |     XXX| $9E06
    .byte $07 ; |     XXX| $9E07
    .byte $08 ; |    X   | $9E08
    .byte $08 ; |    X   | $9E09
    .byte $08 ; |    X   | $9E0A
    .byte $09 ; |    X  X| $9E0B
    .byte $09 ; |    X  X| $9E0C
    .byte $09 ; |    X  X| $9E0D
    .byte $0A ; |    X X | $9E0E
    .byte $0A ; |    X X | $9E0F
    .byte $0A ; |    X X | $9E10
    .byte $0B ; |    X XX| $9E11
    .byte $0B ; |    X XX| $9E12
    .byte $0B ; |    X XX| $9E13
    .byte $0C ; |    XX  | $9E14
    .byte $0C ; |    XX  | $9E15
    .byte $0C ; |    XX  | $9E16
    .byte $0D ; |    XX X| $9E17
    .byte $0D ; |    XX X| $9E18
    .byte $0D ; |    XX X| $9E19
    .byte $0E ; |    XXX | $9E1A
    .byte $0E ; |    XXX | $9E1B
    .byte $0E ; |    XXX | $9E1C
    .byte $0F ; |    XXXX| $9E1D
    .byte $0F ; |    XXXX| $9E1E
    .byte $0F ; |    XXXX| $9E1F
    .byte $10 ; |   X    | $9E20
    .byte $10 ; |   X    | $9E21
    .byte $10 ; |   X    | $9E22
    .byte $11 ; |   X   X| $9E23
    .byte $11 ; |   X   X| $9E24
    .byte $11 ; |   X   X| $9E25
    .byte $12 ; |   X  X | $9E26
    .byte $12 ; |   X  X | $9E27
    .byte $12 ; |   X  X | $9E28
    .byte $13 ; |   X  XX| $9E29
    .byte $13 ; |   X  XX| $9E2A
    .byte $13 ; |   X  XX| $9E2B
L9E2C:
    .byte $00 ; |        | $9E2C
    .byte $07 ; |     XXX| $9E2D
    .byte $0F ; |    XXXX| $9E2E
    .byte $1F ; |   XXXXX| $9E2F
    .byte $27 ; |  X  XXX| $9E30
    .byte $2F ; |  X XXXX| $9E31
    .byte $3F ; |  XXXXXX| $9E32
    .byte $47 ; | X   XXX| $9E33
    .byte $4F ; | X  XXXX| $9E34
    .byte $5F ; | X XXXXX| $9E35
    .byte $67 ; | XX  XXX| $9E36
    .byte $6F ; | XX XXXX| $9E37
L9E38:
    .byte $B3 ; |X XX  XX| $9E38
    .byte $B8 ; |X XXX   | $9E39
    .byte $BD ; |X XXXX X| $9E3A
    .byte $C2 ; |XX    X | $9E3B
    .byte $C7 ; |XX   XXX| $9E3C
    .byte $CC ; |XX  XX  | $9E3D
    .byte $D1 ; |XX X   X| $9E3E
    .byte $D6 ; |XX X XX | $9E3F
L9E40:
    .byte $B8 ; |X XXX   | $9E40
    .byte $C7 ; |XX   XXX| $9E41
    .byte $C2 ; |XX    X | $9E42
    .byte $B8 ; |X XXX   | $9E43
    .byte $D1 ; |XX X   X| $9E44
    .byte $B8 ; |X XXX   | $9E45
    .byte $C7 ; |XX   XXX| $9E46
    .byte $CC ; |XX  XX  | $9E47
    .byte $00 ; |        | $9E48
    .byte $00 ; |        | $9E49
    .byte $00 ; |        | $9E4A
    .byte $00 ; |        | $9E4B
    .byte $00 ; |        | $9E4C
    .byte $00 ; |        | $9E4D
    .byte $00 ; |        | $9E4E
    .byte $00 ; |        | $9E4F
    .byte $00 ; |        | $9E50
    .byte $00 ; |        | $9E51
    .byte $00 ; |        | $9E52
    .byte $00 ; |        | $9E53
    .byte $00 ; |        | $9E54
    .byte $00 ; |        | $9E55
    .byte $00 ; |        | $9E56
    .byte $00 ; |        | $9E57
    .byte $00 ; |        | $9E58
    .byte $00 ; |        | $9E59
    .byte $00 ; |        | $9E5A
    .byte $00 ; |        | $9E5B
    .byte $00 ; |        | $9E5C
    .byte $00 ; |        | $9E5D
    .byte $00 ; |        | $9E5E
    .byte $00 ; |        | $9E5F
    .byte $00 ; |        | $9E60
    .byte $00 ; |        | $9E61
    .byte $00 ; |        | $9E62
    .byte $00 ; |        | $9E63
    .byte $00 ; |        | $9E64
    .byte $00 ; |        | $9E65
    .byte $00 ; |        | $9E66
    .byte $00 ; |        | $9E67
    .byte $00 ; |        | $9E68
    .byte $00 ; |        | $9E69
    .byte $00 ; |        | $9E6A
    .byte $00 ; |        | $9E6B
    .byte $00 ; |        | $9E6C
    .byte $00 ; |        | $9E6D
    .byte $00 ; |        | $9E6E
    .byte $00 ; |        | $9E6F
    .byte $00 ; |        | $9E70
    .byte $00 ; |        | $9E71
    .byte $00 ; |        | $9E72
    .byte $00 ; |        | $9E73
    .byte $00 ; |        | $9E74
    .byte $00 ; |        | $9E75
    .byte $00 ; |        | $9E76
    .byte $00 ; |        | $9E77
    .byte $00 ; |        | $9E78
    .byte $00 ; |        | $9E79
    .byte $00 ; |        | $9E7A
    .byte $00 ; |        | $9E7B
    .byte $00 ; |        | $9E7C
    .byte $00 ; |        | $9E7D
    .byte $00 ; |        | $9E7E
    .byte $00 ; |        | $9E7F
    .byte $00 ; |        | $9E80
    .byte $00 ; |        | $9E81
    .byte $00 ; |        | $9E82
    .byte $00 ; |        | $9E83
    .byte $00 ; |        | $9E84
    .byte $00 ; |        | $9E85
    .byte $00 ; |        | $9E86
    .byte $00 ; |        | $9E87
    .byte $00 ; |        | $9E88
    .byte $00 ; |        | $9E89
    .byte $00 ; |        | $9E8A
    .byte $00 ; |        | $9E8B
    .byte $00 ; |        | $9E8C
    .byte $00 ; |        | $9E8D
    .byte $00 ; |        | $9E8E
    .byte $00 ; |        | $9E8F
    .byte $00 ; |        | $9E90
    .byte $00 ; |        | $9E91
    .byte $00 ; |        | $9E92
    .byte $00 ; |        | $9E93
    .byte $00 ; |        | $9E94
    .byte $00 ; |        | $9E95
    .byte $00 ; |        | $9E96
    .byte $00 ; |        | $9E97
    .byte $00 ; |        | $9E98
    .byte $00 ; |        | $9E99
    .byte $00 ; |        | $9E9A
    .byte $00 ; |        | $9E9B
    .byte $00 ; |        | $9E9C
    .byte $00 ; |        | $9E9D
    .byte $00 ; |        | $9E9E
    .byte $00 ; |        | $9E9F
    .byte $00 ; |        | $9EA0
    .byte $00 ; |        | $9EA1
    .byte $00 ; |        | $9EA2
    .byte $00 ; |        | $9EA3
    .byte $00 ; |        | $9EA4
    .byte $00 ; |        | $9EA5
    .byte $00 ; |        | $9EA6
    .byte $00 ; |        | $9EA7
    .byte $00 ; |        | $9EA8
    .byte $00 ; |        | $9EA9
    .byte $00 ; |        | $9EAA
    .byte $00 ; |        | $9EAB
    .byte $00 ; |        | $9EAC
    .byte $00 ; |        | $9EAD
    .byte $00 ; |        | $9EAE
    .byte $00 ; |        | $9EAF
    .byte $00 ; |        | $9EB0
    .byte $00 ; |        | $9EB1
    .byte $00 ; |        | $9EB2
    .byte $00 ; |        | $9EB3
    .byte $00 ; |        | $9EB4
    .byte $00 ; |        | $9EB5
    .byte $00 ; |        | $9EB6
    .byte $00 ; |        | $9EB7
    .byte $00 ; |        | $9EB8
    .byte $00 ; |        | $9EB9
    .byte $00 ; |        | $9EBA
    .byte $00 ; |        | $9EBB
    .byte $00 ; |        | $9EBC
    .byte $00 ; |        | $9EBD
    .byte $00 ; |        | $9EBE
    .byte $00 ; |        | $9EBF
    .byte $00 ; |        | $9EC0
    .byte $00 ; |        | $9EC1
    .byte $00 ; |        | $9EC2
    .byte $00 ; |        | $9EC3
    .byte $00 ; |        | $9EC4
    .byte $00 ; |        | $9EC5
    .byte $00 ; |        | $9EC6
    .byte $00 ; |        | $9EC7
    .byte $00 ; |        | $9EC8
    .byte $00 ; |        | $9EC9
    .byte $00 ; |        | $9ECA
    .byte $00 ; |        | $9ECB
    .byte $00 ; |        | $9ECC
    .byte $00 ; |        | $9ECD
    .byte $00 ; |        | $9ECE
    .byte $00 ; |        | $9ECF
    .byte $00 ; |        | $9ED0
    .byte $00 ; |        | $9ED1
    .byte $00 ; |        | $9ED2
    .byte $00 ; |        | $9ED3
    .byte $00 ; |        | $9ED4
    .byte $00 ; |        | $9ED5
    .byte $00 ; |        | $9ED6
    .byte $00 ; |        | $9ED7
    .byte $00 ; |        | $9ED8
    .byte $00 ; |        | $9ED9
    .byte $00 ; |        | $9EDA
    .byte $00 ; |        | $9EDB
    .byte $00 ; |        | $9EDC
    .byte $00 ; |        | $9EDD
    .byte $00 ; |        | $9EDE
    .byte $00 ; |        | $9EDF
    .byte $00 ; |        | $9EE0
    .byte $00 ; |        | $9EE1
    .byte $00 ; |        | $9EE2
    .byte $00 ; |        | $9EE3
    .byte $00 ; |        | $9EE4
    .byte $00 ; |        | $9EE5
    .byte $00 ; |        | $9EE6
    .byte $00 ; |        | $9EE7
    .byte $00 ; |        | $9EE8
    .byte $00 ; |        | $9EE9
    .byte $00 ; |        | $9EEA
    .byte $00 ; |        | $9EEB
    .byte $00 ; |        | $9EEC
    .byte $00 ; |        | $9EED
    .byte $00 ; |        | $9EEE
    .byte $00 ; |        | $9EEF
    .byte $00 ; |        | $9EF0
    .byte $00 ; |        | $9EF1
    .byte $00 ; |        | $9EF2
    .byte $00 ; |        | $9EF3
    .byte $00 ; |        | $9EF4
    .byte $00 ; |        | $9EF5
    .byte $00 ; |        | $9EF6
    .byte $00 ; |        | $9EF7
    .byte $00 ; |        | $9EF8
    .byte $00 ; |        | $9EF9
    .byte $00 ; |        | $9EFA
    .byte $00 ; |        | $9EFB
    .byte $00 ; |        | $9EFC
    .byte $00 ; |        | $9EFD
    .byte $00 ; |        | $9EFE
    .byte $00 ; |        | $9EFF
    .byte $00 ; |        | $9F00
    .byte $00 ; |        | $9F01
    .byte $00 ; |        | $9F02
    .byte $00 ; |        | $9F03
    .byte $00 ; |        | $9F04
    .byte $00 ; |        | $9F05
    .byte $00 ; |        | $9F06
    .byte $00 ; |        | $9F07
    .byte $00 ; |        | $9F08
    .byte $00 ; |        | $9F09
    .byte $00 ; |        | $9F0A
    .byte $00 ; |        | $9F0B
    .byte $00 ; |        | $9F0C
    .byte $00 ; |        | $9F0D
    .byte $00 ; |        | $9F0E
    .byte $00 ; |        | $9F0F
    .byte $00 ; |        | $9F10
    .byte $00 ; |        | $9F11
    .byte $00 ; |        | $9F12
    .byte $00 ; |        | $9F13
    .byte $00 ; |        | $9F14
    .byte $00 ; |        | $9F15
    .byte $00 ; |        | $9F16
    .byte $00 ; |        | $9F17
    .byte $00 ; |        | $9F18
    .byte $00 ; |        | $9F19
    .byte $00 ; |        | $9F1A
    .byte $00 ; |        | $9F1B
    .byte $00 ; |        | $9F1C
    .byte $00 ; |        | $9F1D
    .byte $00 ; |        | $9F1E
    .byte $00 ; |        | $9F1F
    .byte $00 ; |        | $9F20
    .byte $00 ; |        | $9F21
    .byte $00 ; |        | $9F22
    .byte $00 ; |        | $9F23
    .byte $00 ; |        | $9F24
    .byte $00 ; |        | $9F25
    .byte $00 ; |        | $9F26
    .byte $00 ; |        | $9F27
    .byte $00 ; |        | $9F28
    .byte $00 ; |        | $9F29
    .byte $00 ; |        | $9F2A
    .byte $00 ; |        | $9F2B
    .byte $00 ; |        | $9F2C
    .byte $00 ; |        | $9F2D
    .byte $00 ; |        | $9F2E
    .byte $00 ; |        | $9F2F
    .byte $00 ; |        | $9F30
    .byte $00 ; |        | $9F31
    .byte $00 ; |        | $9F32
    .byte $00 ; |        | $9F33
    .byte $00 ; |        | $9F34
    .byte $00 ; |        | $9F35
    .byte $00 ; |        | $9F36
    .byte $00 ; |        | $9F37
    .byte $00 ; |        | $9F38
    .byte $00 ; |        | $9F39
    .byte $00 ; |        | $9F3A
    .byte $00 ; |        | $9F3B
    .byte $00 ; |        | $9F3C
    .byte $00 ; |        | $9F3D
    .byte $00 ; |        | $9F3E
    .byte $00 ; |        | $9F3F
    .byte $00 ; |        | $9F40
    .byte $00 ; |        | $9F41
    .byte $00 ; |        | $9F42
    .byte $00 ; |        | $9F43
    .byte $00 ; |        | $9F44
    .byte $00 ; |        | $9F45
    .byte $00 ; |        | $9F46
    .byte $00 ; |        | $9F47
    .byte $00 ; |        | $9F48
    .byte $00 ; |        | $9F49
    .byte $00 ; |        | $9F4A
    .byte $00 ; |        | $9F4B
    .byte $00 ; |        | $9F4C
    .byte $00 ; |        | $9F4D
    .byte $00 ; |        | $9F4E
    .byte $00 ; |        | $9F4F
    .byte $00 ; |        | $9F50
    .byte $00 ; |        | $9F51
    .byte $00 ; |        | $9F52
    .byte $00 ; |        | $9F53
    .byte $00 ; |        | $9F54
    .byte $00 ; |        | $9F55
    .byte $00 ; |        | $9F56
    .byte $00 ; |        | $9F57
    .byte $00 ; |        | $9F58
    .byte $00 ; |        | $9F59
    .byte $00 ; |        | $9F5A
    .byte $00 ; |        | $9F5B
    .byte $00 ; |        | $9F5C
    .byte $00 ; |        | $9F5D
    .byte $00 ; |        | $9F5E
    .byte $00 ; |        | $9F5F
    .byte $00 ; |        | $9F60
    .byte $00 ; |        | $9F61
    .byte $00 ; |        | $9F62
    .byte $00 ; |        | $9F63
    .byte $00 ; |        | $9F64
    .byte $00 ; |        | $9F65
    .byte $00 ; |        | $9F66
    .byte $00 ; |        | $9F67
    .byte $00 ; |        | $9F68
    .byte $00 ; |        | $9F69
    .byte $00 ; |        | $9F6A
    .byte $00 ; |        | $9F6B
    .byte $00 ; |        | $9F6C
    .byte $00 ; |        | $9F6D
    .byte $00 ; |        | $9F6E
    .byte $00 ; |        | $9F6F
    .byte $00 ; |        | $9F70
    .byte $00 ; |        | $9F71
    .byte $00 ; |        | $9F72
    .byte $00 ; |        | $9F73
    .byte $00 ; |        | $9F74
    .byte $00 ; |        | $9F75
    .byte $00 ; |        | $9F76
    .byte $00 ; |        | $9F77
    .byte $00 ; |        | $9F78
    .byte $00 ; |        | $9F79
    .byte $00 ; |        | $9F7A
    .byte $00 ; |        | $9F7B
    .byte $00 ; |        | $9F7C
    .byte $00 ; |        | $9F7D
    .byte $00 ; |        | $9F7E
    .byte $00 ; |        | $9F7F
    .byte $00 ; |        | $9F80
    .byte $00 ; |        | $9F81
    .byte $00 ; |        | $9F82
    .byte $00 ; |        | $9F83
    .byte $00 ; |        | $9F84
    .byte $00 ; |        | $9F85
    .byte $00 ; |        | $9F86
    .byte $00 ; |        | $9F87
    .byte $00 ; |        | $9F88
    .byte $00 ; |        | $9F89
    .byte $00 ; |        | $9F8A
    .byte $00 ; |        | $9F8B
    .byte $00 ; |        | $9F8C
    .byte $00 ; |        | $9F8D
    .byte $00 ; |        | $9F8E
    .byte $00 ; |        | $9F8F
    .byte $00 ; |        | $9F90
    .byte $00 ; |        | $9F91
    .byte $00 ; |        | $9F92
    .byte $00 ; |        | $9F93
    .byte $00 ; |        | $9F94
    .byte $00 ; |        | $9F95
    .byte $00 ; |        | $9F96
    .byte $00 ; |        | $9F97
    .byte $00 ; |        | $9F98
    .byte $00 ; |        | $9F99
    .byte $00 ; |        | $9F9A
    .byte $00 ; |        | $9F9B
    .byte $00 ; |        | $9F9C
    .byte $00 ; |        | $9F9D
    .byte $00 ; |        | $9F9E
    .byte $00 ; |        | $9F9F
    .byte $00 ; |        | $9FA0
    .byte $00 ; |        | $9FA1
    .byte $00 ; |        | $9FA2
    .byte $00 ; |        | $9FA3
    .byte $00 ; |        | $9FA4
    .byte $00 ; |        | $9FA5
    .byte $00 ; |        | $9FA6
    .byte $00 ; |        | $9FA7
    .byte $00 ; |        | $9FA8
    .byte $00 ; |        | $9FA9
    .byte $00 ; |        | $9FAA
    .byte $00 ; |        | $9FAB
    .byte $00 ; |        | $9FAC
    .byte $00 ; |        | $9FAD
    .byte $00 ; |        | $9FAE
    .byte $00 ; |        | $9FAF
    .byte $00 ; |        | $9FB0
    .byte $00 ; |        | $9FB1
    .byte $00 ; |        | $9FB2
    .byte $00 ; |        | $9FB3
    .byte $00 ; |        | $9FB4
    .byte $00 ; |        | $9FB5
    .byte $00 ; |        | $9FB6
    .byte $00 ; |        | $9FB7
    .byte $00 ; |        | $9FB8
    .byte $00 ; |        | $9FB9
    .byte $00 ; |        | $9FBA
    .byte $00 ; |        | $9FBB
    .byte $00 ; |        | $9FBC
    .byte $00 ; |        | $9FBD
    .byte $00 ; |        | $9FBE
    .byte $00 ; |        | $9FBF
    .byte $00 ; |        | $9FC0
    .byte $00 ; |        | $9FC1
    .byte $00 ; |        | $9FC2
    .byte $00 ; |        | $9FC3
    .byte $00 ; |        | $9FC4
    .byte $00 ; |        | $9FC5
    .byte $00 ; |        | $9FC6
    .byte $00 ; |        | $9FC7
    .byte $00 ; |        | $9FC8
    .byte $00 ; |        | $9FC9
    .byte $00 ; |        | $9FCA
    .byte $00 ; |        | $9FCB
    .byte $00 ; |        | $9FCC
    .byte $00 ; |        | $9FCD
    .byte $00 ; |        | $9FCE
    .byte $00 ; |        | $9FCF
    .byte $00 ; |        | $9FD0
    .byte $00 ; |        | $9FD1
    .byte $00 ; |        | $9FD2
    .byte $00 ; |        | $9FD3
    .byte $00 ; |        | $9FD4
    .byte $00 ; |        | $9FD5
    .byte $00 ; |        | $9FD6
    .byte $00 ; |        | $9FD7
    .byte $00 ; |        | $9FD8
    .byte $00 ; |        | $9FD9
    .byte $00 ; |        | $9FDA
    .byte $00 ; |        | $9FDB
    .byte $00 ; |        | $9FDC
    .byte $00 ; |        | $9FDD
    .byte $00 ; |        | $9FDE
    .byte $00 ; |        | $9FDF
    .byte $00 ; |        | $9FE0
    .byte $00 ; |        | $9FE1
    .byte $00 ; |        | $9FE2
    .byte $00 ; |        | $9FE3
    .byte $00 ; |        | $9FE4
    .byte $00 ; |        | $9FE5
    .byte $00 ; |        | $9FE6
    .byte $00 ; |        | $9FE7
    .byte $00 ; |        | $9FE8
    .byte $00 ; |        | $9FE9

L9FEA:
    sta    L9FF7                 ; 4
L9FED:
    jmp    L9FED                 ; 3

L9FF0:
    sta    L9FF8                 ; 4
    jmp    L9B3F                 ; 3

    .byte $00 ; |        | $9FF6
L9FF7:
    .byte $00 ; |        | $9FF7
L9FF8:
    .byte $00 ; |        | $9FF8
    .byte $00 ; |        | $9FF9
    .byte $00 ; |        | $9FFA
    .byte $00 ; |        | $9FFB
    .byte $00 ; |        | $9FFC
    .byte $D1 ; |XX X   X| $9FFD
    .byte $00 ; |        | $9FFE
    .byte $00 ; |        | $9FFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $B000   

LB000:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB00C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB018:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB024:
    .byte $00
LB025:
    .byte $00
LB026:
    .byte $00
LB027:
    .byte $00
LB028:
    .byte $00
LB029:
    .byte $00
LB02A:
    .byte $00
LB02B:
    .byte $00
LB02C:
    .byte $00
LB02D:
    .byte $00
LB02E:
    .byte $00
LB02F:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00
LB044:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB080:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB08C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB098:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LB0A4:
    .byte $00
LB0A5:
    .byte $00
LB0A6:
    .byte $00
LB0A7:
    .byte $00
LB0A8:
    .byte $00
LB0A9:
    .byte $00
LB0AA:
    .byte $00
LB0AB:
    .byte $00
LB0AC:
    .byte $00
LB0AD:
    .byte $00
LB0AE:
    .byte $00
LB0AF:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00
LB0C4:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    sta    LBFF8                 ; 4
    lda    $F080,X               ; 4
    sta    $EB                   ; 3
    ldy    #7                    ; 2
    lda    $F098,X               ; 4
    eor    #$01                  ; 2
    sta    $F018,X               ; 5
    bpl    LB116                 ; 2³
    ldy    #3                    ; 2
LB116:
    sty    $F6                   ; 3
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB120                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB120:
    and    $F6                   ; 3
    sta    $F0                   ; 3
    lda    $EF                   ; 3
    and    $F6                   ; 3
    cmp    $F0                   ; 3
    beq    LB138                 ; 2³
    lda    $F0                   ; 3
    and    #$0F                  ; 2
    bne    LB150                 ; 2³
    lda    $80                   ; 3
    cmp    #6                    ; 2
    bcc    LB150                 ; 2³
LB138:
    dec    $EA                   ; 5
    lda    $EA                   ; 3
    sta    $F00C,X               ; 5
    bpl    LB153                 ; 2³
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    LBA54                 ; 6
    lda    $DF                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $DF                   ; 3
LB150:
    jmp    LB981                 ; 3

LB153:
    lda    $EA                   ; 3
    cmp    #7                    ; 2
    bcs    LB15D                 ; 2³
    lda    #1                    ; 2
    bne    LB165                 ; 2³
LB15D:
    lda    #3                    ; 2
    bit    $83                   ; 3
    bpl    LB165                 ; 2³
    lda    #7                    ; 2
LB165:
    sta    $F6                   ; 3
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    $F6                   ; 3
    bne    LB1BB                 ; 2³
    lda    $EA                   ; 3
    beq    LB1BB                 ; 2³
    jsr    LB9D5                 ; 6
    bne    LB1BB                 ; 2³
    lda    LBA34,X               ; 4
    beq    LB1BB                 ; 2³
    bpl    LB197                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    beq    LB1A8                 ; 2³
    lda.wy $8A,Y                 ; 4
    and    #$03                  ; 2
    cmp    #2                    ; 2
    beq    LB1BB                 ; 2³
    bne    LB1A8                 ; 2³
LB197:
    asl                          ; 2
    asl                          ; 2
    and.wy $8B,Y                 ; 4
    cmp    #$80                  ; 2
    beq    LB1BB                 ; 2³
    cmp    #$20                  ; 2
    beq    LB1BB                 ; 2³
    cmp    #8                    ; 2
    beq    LB1BB                 ; 2³
LB1A8:
    lda    LBA34,X               ; 4
    and    #$55                  ; 2
    ora.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    LB1BB                 ; 2³
    inc    $FE                   ; 5
LB1BB:
    jmp    LB981                 ; 3

    lda    $EF                   ; 3
    asl                          ; 2
    adc    $EF                   ; 3
    adc    $84                   ; 3
    sta    $EC                   ; 3
    lda    $F098,X               ; 4
    sta    $F0                   ; 3
    lda    $EA                   ; 3
    and    #$1F                  ; 2
    sta    $EE                   ; 3
    lda    $F080,X               ; 4
    sta    $ED                   ; 3
    beq    LB1DD                 ; 2³
    cmp    #$79                  ; 2
    bne    LB1EA                 ; 2³
LB1DD:
    jsr    LBA54                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    dec    $E0                   ; 5
    jmp    LB981                 ; 3

LB1EA:
    lda    $EA                   ; 3
    and    #$20                  ; 2
    beq    LB204                 ; 2³+1
    lda    $F0                   ; 3
    bpl    LB1F9                 ; 2³
    lda    $EC                   ; 3
    lsr                          ; 2
    bcs    LB204                 ; 2³+1
LB1F9:
    bit    $EA                   ; 3
    bmi    LB202                 ; 2³+1
    dec    $ED                   ; 5
    jmp    LB204                 ; 3

LB202:
    inc    $ED                   ; 5
LB204:
    lda    $EC                   ; 3
    and    #$03                  ; 2
    bne    LB284                 ; 2³
    lda    $F0                   ; 3
    bpl    LB214                 ; 2³
    lda    $EC                   ; 3
    and    #$04                  ; 2
    bne    LB284                 ; 2³
LB214:
    lda    $EE                   ; 3
    bne    LB21F                 ; 2³
    lda    $EA                   ; 3
    and    #$BF                  ; 2
    jmp    LB23F                 ; 3

LB21F:
    ldy    $80                   ; 3
    cpy    #$1D                  ; 2
    bcc    LB227                 ; 2³
    ldy    #$1D                  ; 2
LB227:
    cmp    LB323,Y               ; 4
    bcc    LB232                 ; 2³
    lda    $EA                   ; 3
    ora    #$40                  ; 2
    bne    LB23F                 ; 2³
LB232:
    adc    $F080                 ; 4
    adc    $86                   ; 3
    and    #$AB                  ; 2
    bne    LB256                 ; 2³
    lda    $EA                   ; 3
    eor    #$40                  ; 2
LB23F:
    sta    $EA                   ; 3
    lda    $F0                   ; 3
    and    #$7F                  ; 2
    sta    $F0                   ; 3
    adc    $F080                 ; 4
    adc    $F08C                 ; 4
    adc    INTIM                 ; 4
    and    #$80                  ; 2
    ora    $F0                   ; 3
    sta    $F0                   ; 3
LB256:
    bit    $EA                   ; 3
    bvc    LB270                 ; 2³
    inc    $F0                   ; 5
    lda    $F0                   ; 3
    and    #$7F                  ; 2
    cmp    #7                    ; 2
    bcc    LB284                 ; 2³
    dec    $EE                   ; 5
    lda    $F0                   ; 3
    and    #$80                  ; 2
    ora    #$04                  ; 2
    sta    $F0                   ; 3
    bne    LB284                 ; 2³
LB270:
    dec    $F0                   ; 5
    lda    $F0                   ; 3
    and    #$7F                  ; 2
    cmp    #4                    ; 2
    bcs    LB284                 ; 2³
    inc    $EE                   ; 5
    lda    $F0                   ; 3
    and    #$80                  ; 2
    ora    #$06                  ; 2
    sta    $F0                   ; 3
LB284:
    lda    $EA                   ; 3
    sta    $EC                   ; 3
    lda    $ED                   ; 3
    sta    $EB                   ; 3
    and    #$03                  ; 2
    bne    LB2BC                 ; 2³
    lda    $EE                   ; 3
    sta    $EA                   ; 3
    jsr    LB9D5                 ; 6
    beq    LB2BC                 ; 2³
    sta    $EA                   ; 3
LB29B:
    bit    $EA                   ; 3
    bvs    LB2A1                 ; 2³
    bmi    LB2BC                 ; 2³
LB2A1:
    asl    $EA                   ; 5
    asl    $EA                   ; 5
    bne    LB29B                 ; 2³
    lda    LBA34,X               ; 4
    beq    LB2BC                 ; 2³
    eor    #$FF                  ; 2
    and.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EE                   ; 3
    cmp    #6                    ; 2
    bcs    LB2BC                 ; 2³
    dec    $FE                   ; 5
LB2BC:
    ldx    $EF                   ; 3
    lda    $ED                   ; 3
    sta    $F000,X               ; 5
    lda    $F0                   ; 3
    sta    $F018,X               ; 5
    lda    $EC                   ; 3
    and    #$E0                  ; 2
    ora    $EE                   ; 3
    sta    $F00C,X               ; 5
    jmp    LB981                 ; 3

    lda    $E0                   ; 3
    and    #$0F                  ; 2
    beq    LB2E6                 ; 2³
    sta    $EC                   ; 3
    lda    $E6                   ; 3
    and    #$0F                  ; 2
    cmp    $EC                   ; 3
    bcc    LB320                 ; 2³+1
    beq    LB320                 ; 2³+1
LB2E6:
    lda    #5                    ; 2
    ldx    $80                   ; 3
    bne    LB2F4                 ; 2³
    ldx    $81                   ; 3
    cpx    #$30                  ; 2
    bpl    LB2F4                 ; 2³
    ora    #$80                  ; 2
LB2F4:
    ldx    $EF                   ; 3
    sta    $F018,X               ; 5
    inc    $E0                   ; 5
    jsr    LBA97                 ; 6
    lda    #$66                  ; 2
    sta    $F00C,X               ; 5
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    lsr                          ; 2
    bcc    LB31B                 ; 2³
    lda    #$E6                  ; 2
    sta    $F00C,X               ; 5
    lda    #1                    ; 2
    bpl    LB31D                 ; 2³
LB31B:
    lda    #$78                  ; 2
LB31D:
    sta    $F000,X               ; 5
LB320:
    jmp    LBC01                 ; 3

LB323:
    .byte $09 ; |    X  X| $B323
    .byte $09 ; |    X  X| $B324
    .byte $09 ; |    X  X| $B325
    .byte $09 ; |    X  X| $B326
    .byte $09 ; |    X  X| $B327
    .byte $09 ; |    X  X| $B328
    .byte $09 ; |    X  X| $B329
    .byte $08 ; |    X   | $B32A
    .byte $08 ; |    X   | $B32B
    .byte $08 ; |    X   | $B32C
    .byte $08 ; |    X   | $B32D
    .byte $08 ; |    X   | $B32E
    .byte $08 ; |    X   | $B32F
    .byte $08 ; |    X   | $B330
    .byte $07 ; |     XXX| $B331
    .byte $07 ; |     XXX| $B332
    .byte $07 ; |     XXX| $B333
    .byte $07 ; |     XXX| $B334
    .byte $07 ; |     XXX| $B335
    .byte $07 ; |     XXX| $B336
    .byte $07 ; |     XXX| $B337
    .byte $06 ; |     XX | $B338
    .byte $06 ; |     XX | $B339
    .byte $06 ; |     XX | $B33A
    .byte $06 ; |     XX | $B33B
    .byte $06 ; |     XX | $B33C
    .byte $06 ; |     XX | $B33D
    .byte $06 ; |     XX | $B33E
    .byte $05 ; |     X X| $B33F
    .byte $05 ; |     X X| $B340
    lda    $F080,X               ; 4
    sta    $ED                   ; 3
    bit    $EA                   ; 3
    bmi    LB358                 ; 2³
    bvc    LB34E                 ; 2³
    inc    $ED                   ; 5
LB34E:
    inc    $ED                   ; 5
    lda    $ED                   ; 3
    cmp    #$77                  ; 2
    bcs    LB381                 ; 2³
    bcc    LB360                 ; 2³
LB358:
    bpl    LB35C                 ; 2³
    dec    $ED                   ; 5
LB35C:
    dec    $ED                   ; 5
    bmi    LB381                 ; 2³
LB360:
    lda    $ED                   ; 3
    sta    $F000,X               ; 5
    lda    $F098,X               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F018,X               ; 5
    and    #$7F                  ; 2
    cmp    #$0B                  ; 2
    bcc    LB37E                 ; 2³
    lda    $F098,X               ; 4
    and    #$80                  ; 2
    ora    #$08                  ; 2
    sta    $F018,X               ; 5
LB37E:
    jmp    LB981                 ; 3

LB381:
    jsr    LBA54                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    lda    $E0                   ; 3
    and    #$BF                  ; 2
    sta    $E0                   ; 3
    lda    $EA                   ; 3
    and    #$1F                  ; 2
    tax                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$14                  ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #3                    ; 2
    sta    $EA                   ; 3
LB3A0:
    lda.wy $8B,Y                 ; 4
    bne    LB3AC                 ; 2³
    iny                          ; 2
    dec    $EA                   ; 5
    bpl    LB3A0                 ; 2³
    bmi    LB3B4                 ; 2³
LB3AC:
    lda    $F0C4,X               ; 4
    ora    #$80                  ; 2
    sta    $F044,X               ; 5
LB3B4:
    jmp    LB981                 ; 3

    lda    $83                   ; 3
    bmi    LB423                 ; 2³+1
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    bpl    LB423                 ; 2³+1
    lda    #$40                  ; 2
    bit    $E0                   ; 3
    bne    LB423                 ; 2³+1
    ora    $E0                   ; 3
    sta    $E0                   ; 3
    lda    #8                    ; 2
    sta    $F018,X               ; 5
    jsr    LBA97                 ; 6
    lda    INTIM                 ; 4
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    LB426,Y               ; 4
    and    #$1F                  ; 2
    sta    $F00C,X               ; 5
    and    #$03                  ; 2
    bne    LB409                 ; 2³+1
    lda    $80                   ; 3
    cmp    #2                    ; 2
    bcc    LB409                 ; 2³+1
    lda    LB426,Y               ; 4
    and    #$80                  ; 2
    lsr                          ; 2
    ora    $F08C,X               ; 4
    sta    $F00C,X               ; 5
LB409:
    lda    $E8                   ; 3
    lsr                          ; 2
    bcs    LB416                 ; 2³
    lda    #0                    ; 2
    sta    $F000,X               ; 5
    jmp    LBC01                 ; 3

LB416:
    lda    $F08C,X               ; 4
    ora    #$80                  ; 2
    sta    $F00C,X               ; 5
    lda    #$7A                  ; 2
    sta    $F000,X               ; 5
LB423:
    jmp    LBC01                 ; 3

LB426:
    .byte $07 ; |     XXX| $B426
    .byte $88 ; |X   X   | $B427
    .byte $09 ; |    X  X| $B428
    .byte $8A ; |X   X X | $B429
    .byte $0B ; |    X XX| $B42A
    .byte $8C ; |X   XX  | $B42B
    .byte $0D ; |    XX X| $B42C
    .byte $8E ; |X   XXX | $B42D
    .byte $0F ; |    XXXX| $B42E
    .byte $90 ; |X  X    | $B42F
    .byte $11 ; |   X   X| $B430
    .byte $92 ; |X  X  X | $B431
    .byte $13 ; |   X  XX| $B432
    .byte $87 ; |X    XXX| $B433
    .byte $08 ; |    X   | $B434
    .byte $09 ; |    X  X| $B435
    .byte $8A ; |X   X X | $B436
    .byte $0B ; |    X XX| $B437
    .byte $8C ; |X   XX  | $B438
    .byte $0D ; |    XX X| $B439
    .byte $8E ; |X   XXX | $B43A
    .byte $8F ; |X   XXXX| $B43B
    .byte $90 ; |X  X    | $B43C
    .byte $91 ; |X  X   X| $B43D
    .byte $12 ; |   X  X | $B43E
    .byte $13 ; |   X  XX| $B43F
    .byte $8E ; |X   XXX | $B440
    .byte $8F ; |X   XXXX| $B441
    .byte $10 ; |   X    | $B442
    .byte $11 ; |   X   X| $B443
    .byte $92 ; |X  X  X | $B444
    .byte $13 ; |   X  XX| $B445
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB44E                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB44E:
    and    #$07                  ; 2
    sta    $F0                   ; 3
    lda    $EF                   ; 3
    and    #$07                  ; 2
    cmp    $F0                   ; 3
    beq    LB468                 ; 2³
    lda    $F0                   ; 3
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LB48F                 ; 2³
    lda    $80                   ; 3
    cmp    #6                    ; 2
    bcc    LB48F                 ; 2³
LB468:
    lda    $EA                   ; 3
    and    #$1F                  ; 2
    sta    $EE                   ; 3
    lda    $EA                   ; 3
    and    #$E0                  ; 2
    sta    $F0                   ; 3
    lda    $F098,X               ; 4
    eor    #$01                  ; 2
    sta    $F018,X               ; 5
    dec    $EE                   ; 5
    bpl    LB492                 ; 2³
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jsr    LBA54                 ; 6
    lda    $E1                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E1                   ; 3
LB48F:
    jmp    LB981                 ; 3

LB492:
    lda    $F0                   ; 3
    beq    LB4AF                 ; 2³
    lda    $F098,X               ; 4
    bpl    LB4A7                 ; 2³
    lda    $F080,X               ; 4
    clc                          ; 2
    adc    #4                    ; 2
    cmp    #$7C                  ; 2
    bcc    LB4C8                 ; 2³
    bcs    LB4AF                 ; 2³
LB4A7:
    lda    $F080,X               ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    bpl    LB4C8                 ; 2³
LB4AF:
    lda    $F098,X               ; 4
    eor    #$80                  ; 2
    sta    $F018,X               ; 5
    lda    INTIM                 ; 4
    and    #$04                  ; 2
    ora    #$02                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F0                   ; 3
    lda    $F080,X               ; 4
LB4C8:
    sta    $F000,X               ; 5
    lda    $F0                   ; 3
    sec                          ; 2
    sbc    #$20                  ; 2
    sta    $F0                   ; 3
    and    #$E0                  ; 2
    ora    $EE                   ; 3
    sta    $F00C,X               ; 5
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$03                  ; 2
    bne    LB534                 ; 2³+1
    lda    $F080,X               ; 4
    sta    $EB                   ; 3
    lda    $EE                   ; 3
    sta    $EA                   ; 3
    beq    LB534                 ; 2³+1
    jsr    LB9D5                 ; 6
    bne    LB534                 ; 2³+1
    lda    LBA34,X               ; 4
    beq    LB534                 ; 2³+1
    bpl    LB510                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    beq    LB521                 ; 2³
    lda.wy $8A,Y                 ; 4
    and    #$03                  ; 2
    cmp    #2                    ; 2
    beq    LB534                 ; 2³
    bne    LB521                 ; 2³
LB510:
    asl                          ; 2
    asl                          ; 2
    and.wy $8B,Y                 ; 4
    cmp    #$80                  ; 2
    beq    LB534                 ; 2³
    cmp    #$20                  ; 2
    beq    LB534                 ; 2³
    cmp    #8                    ; 2
    beq    LB534                 ; 2³
LB521:
    lda    LBA34,X               ; 4
    and    #$55                  ; 2
    ora.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    LB534                 ; 2³
    inc    $FE                   ; 5
LB534:
    jmp    LB981                 ; 3

    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$1F                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F000,X               ; 5
    lda    #$73                  ; 2
    sta    $F00C,X               ; 5
    jsr    LBA97                 ; 6
    lda    $E8                   ; 3
    and    #$80                  ; 2
    ora    #$0C                  ; 2
    sta    $F018,X               ; 5
    lda    $E1                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $E1                   ; 3
    lda    $83                   ; 3
    bpl    LB5CB                 ; 2³
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    beq    LB576                 ; 2³
    cmp    #$0D                  ; 2
    beq    LB576                 ; 2³
    cmp    #$0F                  ; 2
    bne    LB5CB                 ; 2³
LB576:
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    LB58F                 ; 2³
    dec    $DF                   ; 5
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    bne    LB5CB                 ; 2³
    lda    $8A                   ; 3
    ora    #$02                  ; 2
    sta    $8A                   ; 3
    jmp    LBC01                 ; 3

LB58F:
    lda    $E1                   ; 3
    and    #$F0                  ; 2
    cmp    #$60                  ; 2
    bcs    LB5C5                 ; 2³
    sta    $EA                   ; 3
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    beq    LB5CB                 ; 2³
    lda    $DF                   ; 3
    and    #$F0                  ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #6                    ; 2
    bcs    LB5C5                 ; 2³
    sta    $EA                   ; 3
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    bne    LB5CB                 ; 2³
    lda    $E1                   ; 3
    and    #$0F                  ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    cmp    #6                    ; 2
    bcc    LB5CB                 ; 2³
LB5C5:
    lda    $DF                   ; 3
    ora    #$0A                  ; 2
    sta    $DF                   ; 3
LB5CB:
    jmp    LBC01                 ; 3

    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB5D6                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB5D6:
    and    #$07                  ; 2
    sta    $EC                   ; 3
    lda    $EF                   ; 3
    and    #$07                  ; 2
    cmp    $EC                   ; 3
    beq    LB5EE                 ; 2³
    lda    $EC                   ; 3
    cmp    #2                    ; 2
    bne    LB5FD                 ; 2³
    lda    $80                   ; 3
    cmp    #6                    ; 2
    bcc    LB5FD                 ; 2³
LB5EE:
    lda    $EA                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F00C,X               ; 5
    bpl    LB600                 ; 2³+1
    jsr    LBA54                 ; 6
    dec    $E1                   ; 5
LB5FD:
    jmp    LB981                 ; 3

LB600:
    lda    $F098,X               ; 4
    eor    #$01                  ; 2
    sta    $F018,X               ; 5
    bpl    LB616                 ; 2³
    lda    $F080,X               ; 4
    clc                          ; 2
    adc    #8                    ; 2
    cmp    #$7C                  ; 2
    bcc    LB632                 ; 2³
    bcs    LB61E                 ; 2³
LB616:
    lda    $F080,X               ; 4
    sec                          ; 2
    sbc    #8                    ; 2
    bpl    LB632                 ; 2³
LB61E:
    lda    $F098,X               ; 4
    eor    #$80                  ; 2
    and    #$80                  ; 2
    bpl    LB62B                 ; 2³
    ora    #$0E                  ; 2
    bmi    LB62D                 ; 2³
LB62B:
    ora    #$10                  ; 2
LB62D:
    sta    $F018,X               ; 5
    bne    LB635                 ; 2³
LB632:
    sta    $F000,X               ; 5
LB635:
    jmp    LB981                 ; 3

    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$1F                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F000,X               ; 5
    lda    #$1E                  ; 2
    cmp    $FD                   ; 3
    bcs    LB653                 ; 2³
    sta    $FD                   ; 3
LB653:
    jsr    LBA97                 ; 6
    lda    #$13                  ; 2
    sta    $F00C,X               ; 5
    lda    $E8                   ; 3
    and    #$80                  ; 2
    bpl    LB665                 ; 2³
    ora    #$0E                  ; 2
    bne    LB667                 ; 2³
LB665:
    ora    #$10                  ; 2
LB667:
    sta    $F018,X               ; 5
    inc    $E1                   ; 5
    lda    $83                   ; 3
    bpl    LB6BD                 ; 2³
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #$0B                  ; 2
    beq    LB67C                 ; 2³
    cmp    #$0F                  ; 2
    bne    LB6BD                 ; 2³
LB67C:
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    LB695                 ; 2³
    dec    $DF                   ; 5
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    bne    LB6BD                 ; 2³
    lda    $8A                   ; 3
    ora    #$02                  ; 2
    sta    $8A                   ; 3
    jmp    LBC01                 ; 3

LB695:
    lda    $E1                   ; 3
    and    #$0F                  ; 2
    cmp    #5                    ; 2
    bcs    LB6B7                 ; 2³
    sta    $EA                   ; 3
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #$E1                  ; 2
    beq    LB6BD                 ; 2³
    lda    $DF                   ; 3
    clc                          ; 2
    adc    $E1                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    cmp    #5                    ; 2
    bcc    LB6BD                 ; 2³
LB6B7:
    lda    $DF                   ; 3
    ora    #$08                  ; 2
    sta    $DF                   ; 3
LB6BD:
    jmp    LBC01                 ; 3

    lda    $84                   ; 3
    and    #$01                  ; 2
    sta    $EC                   ; 3
    lda    $EF                   ; 3
    and    #$01                  ; 2
    cmp    $EC                   ; 3
    bne    LB714                 ; 2³+1
    lda    $F098,X               ; 4
    bpl    LB6DF                 ; 2³
    lda    $F080,X               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$7C                  ; 2
    bcs    LB6E7                 ; 2³
    bcc    LB6F8                 ; 2³
LB6DF:
    lda    $F080,X               ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    bpl    LB6F8                 ; 2³
LB6E7:
    jsr    LBA54                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    lda    $E0                   ; 3
    and    #$7F                  ; 2
    sta    $E0                   ; 3
    jmp    LB981                 ; 3

LB6F8:
    sta    $F000,X               ; 5
    lda    $F098,X               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F018,X               ; 5
    and    #$7F                  ; 2
    cmp    #$16                  ; 2
    bcc    LB714                 ; 2³
    lda    $F098,X               ; 4
    and    #$80                  ; 2
    ora    #$12                  ; 2
    sta    $F018,X               ; 5
LB714:
    jmp    LB981                 ; 3

    lda    $83                   ; 3
    bmi    LB76D                 ; 2³
    lda    $E0                   ; 3
    bmi    LB76D                 ; 2³
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$03                  ; 2
    bne    LB76D                 ; 2³
    lda    $E0                   ; 3
    ora    #$80                  ; 2
    sta    $E0                   ; 3
    jsr    LBA97                 ; 6
    lda    INTIM                 ; 4
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LB426,Y               ; 4
    and    #$1F                  ; 2
    sta    $F00C,X               ; 5
    lda    $E8                   ; 3
    bpl    LB763                 ; 2³
    lda    #$80                  ; 2
    ora    #$12                  ; 2
    sta    $F018,X               ; 5
    lda    #0                    ; 2
    sta    $F000,X               ; 5
    jmp    LBC01                 ; 3

LB763:
    lda    #$12                  ; 2
    sta    $F018,X               ; 5
    lda    #$7B                  ; 2
    sta    $F000,X               ; 5
LB76D:
    jmp    LBC01                 ; 3

    lda    $EA                   ; 3
    and    #$1F                  ; 2
    sta    $EE                   ; 3
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    lda    $EA                   ; 3
    and    #$C0                  ; 2
    beq    LB7AC                 ; 2³
    cmp    #$40                  ; 2
    beq    LB7AC                 ; 2³
    cmp    #$80                  ; 2
    bne    LB793                 ; 2³
    jmp    LB829                 ; 3

LB793:
    cmp    #$C0                  ; 2
    bne    LB7CC                 ; 2³
    jmp    LB829                 ; 3

LB79A:
    lda    $E0                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E0                   ; 3
    jsr    LBA54                 ; 6
    lda    #$FF                  ; 2
    sta    $F00C,X               ; 5
    jmp    LB981                 ; 3

LB7AC:
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB7B4                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB7B4:
    and    #$03                  ; 2
    sta    $EC                   ; 3
    lda    $EF                   ; 3
    and    #$03                  ; 2
    cmp    $EC                   ; 3
    beq    LB7CF                 ; 2³
    lda    $80                   ; 3
    cmp    #8                    ; 2
    bcc    LB7CC                 ; 2³
    lda    $EC                   ; 3
    and    #$0E                  ; 2
    beq    LB7CF                 ; 2³
LB7CC:
    jmp    LB981                 ; 3

LB7CF:
    lda    $F098,X               ; 4
    eor    #$01                  ; 2
    sta    $F018,X               ; 5
    bit    $EA                   ; 3
    lda    $F080,X               ; 4
    bvs    LB7F9                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$7D                  ; 2
    bcs    LB79A                 ; 2³
    sta    $F000,X               ; 5
    ldy    $EE                   ; 3
    bne    LB7F6                 ; 2³
    cmp    #$41                  ; 2
    bcc    LB7F6                 ; 2³
    cmp    #$70                  ; 2
    bcs    LB817                 ; 2³+1
    bcc    LB80D                 ; 2³+1
LB7F6:
    jmp    LB89E                 ; 3

LB7F9:
    sec                          ; 2
    sbc    #2                    ; 2
    bmi    LB79A                 ; 2³
    sta    $F000,X               ; 5
    ldy    $EE                   ; 3
    bne    LB826                 ; 2³
    cmp    #$37                  ; 2
    bcs    LB826                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LB817                 ; 2³
LB80D:
    and    #$03                  ; 2
    bne    LB826                 ; 2³
    lda    $E8                   ; 3
    and    #$03                  ; 2
    bne    LB826                 ; 2³
LB817:
    lda    $EE                   ; 3
    ora    #$80                  ; 2
    sta    $F00C,X               ; 5
    lda    $F098,X               ; 4
    and    #$FE                  ; 2
    sta    $F018,X               ; 5
LB826:
    jmp    LB89E                 ; 3

LB829:
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB831                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB831:
    and    #$07                  ; 2
    sta    $EC                   ; 3
    lda    $EF                   ; 3
    and    #$07                  ; 2
    cmp    $EC                   ; 3
    beq    LB84C                 ; 2³
    lda    $80                   ; 3
    cmp    #6                    ; 2
    bcc    LB849                 ; 2³
    lda    $EC                   ; 3
    and    #$03                  ; 2
    beq    LB84C                 ; 2³
LB849:
    jmp    LB981                 ; 3

LB84C:
    lda    $F098,X               ; 4
    eor    #$0E                  ; 2
    sta    $F018,X               ; 5
    bit    $EA                   ; 3
    bvs    LB87D                 ; 2³
    and    #$08                  ; 2
    bne    LB85E                 ; 2³
    inc    $EE                   ; 5
LB85E:
    lda    $EE                   ; 3
    cmp    #8                    ; 2
    bcs    LB872                 ; 2³
    cmp    #5                    ; 2
    bcc    LB86C                 ; 2³
    lda    $E8                   ; 3
    bpl    LB872                 ; 2³
LB86C:
    lda    $EE                   ; 3
    ora    #$80                  ; 2
    bmi    LB89B                 ; 2³
LB872:
    lda    $F080,X               ; 4
    cmp    #$40                  ; 2
    lda    $EE                   ; 3
    bcs    LB89B                 ; 2³
    bcc    LB899                 ; 2³
LB87D:
    and    #$08                  ; 2
    beq    LB885                 ; 2³
    dec    $EE                   ; 5
    beq    LB88B                 ; 2³
LB885:
    lda    $EE                   ; 3
    ora    #$C0                  ; 2
    bmi    LB89B                 ; 2³
LB88B:
    lda    #$16                  ; 2
    sta    $F018,X               ; 5
    lda    $F080,X               ; 4
    cmp    #$40                  ; 2
    lda    $EE                   ; 3
    bcc    LB89B                 ; 2³
LB899:
    ora    #$40                  ; 2
LB89B:
    sta    $F00C,X               ; 5
LB89E:
    lda    $F080,X               ; 4
    sta    $EB                   ; 3
    lda    $EE                   ; 3
    sta    $EA                   ; 3
    jsr    LB9D5                 ; 6
    sta    $EC                   ; 3
    beq    LB8EB                 ; 2³
    asl                          ; 2
    bcs    LB8BB                 ; 2³
    bpl    LB8BB                 ; 2³
    tax                          ; 2
    lda    $EC                   ; 3
    ora    #$80                  ; 2
    sta    $EC                   ; 3
    txa                          ; 2
LB8BB:
    asl                          ; 2
    asl                          ; 2
    bcs    LB8C9                 ; 2³
    bpl    LB8C9                 ; 2³
    tax                          ; 2
    lda    $EC                   ; 3
    ora    #$20                  ; 2
    sta    $EC                   ; 3
    txa                          ; 2
LB8C9:
    asl                          ; 2
    asl                          ; 2
    bcs    LB8D7                 ; 2³
    bpl    LB8D7                 ; 2³
    tax                          ; 2
    lda    $EC                   ; 3
    ora    #$08                  ; 2
    sta    $EC                   ; 3
    txa                          ; 2
LB8D7:
    asl                          ; 2
    asl                          ; 2
    bcs    LB8E3                 ; 2³
    bpl    LB8E3                 ; 2³
    lda    $EC                   ; 3
    ora    #$02                  ; 2
    sta    $EC                   ; 3
LB8E3:
    lda.wy $8B,Y                 ; 4
    ora    $EC                   ; 3
    sta.wy $8B,Y                 ; 5
LB8EB:
    jmp    LB981                 ; 3

    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcs    LB931                 ; 2³+1
    lda    $E0                   ; 3
    and    #$30                  ; 2
    beq    LB908                 ; 2³+1
    sta    $EC                   ; 3
    lda    $E6                   ; 3
    and    #$30                  ; 2
    cmp    $EC                   ; 3
    beq    LB931                 ; 2³
    bcc    LB931                 ; 2³
LB908:
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$01                  ; 2
    beq    LB91A                 ; 2³
    lda    #$7C                  ; 2
LB91A:
    sta    $F000,X               ; 5
    lda    #$C7                  ; 2
    sta    $F00C,X               ; 5
    jsr    LBA97                 ; 6
    lda    #$16                  ; 2
    sta    $F018,X               ; 5
    lda    $E0                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $E0                   ; 3
LB931:
    jmp    LBC01                 ; 3

LB934:
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    bit    $83                   ; 3
    bpl    LB945                 ; 2³
    lda    $87                   ; 3
    cmp    #1                    ; 2
    beq    LB945                 ; 2³
    ldx    #0                    ; 2
LB945:
    lda    $84                   ; 3
    bit    $E7                   ; 3
    bpl    LB94D                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
LB94D:
    lsr                          ; 2
    txa                          ; 2
    bcc    LB956                 ; 2³
    lsr                          ; 2
    bcs    LB959                 ; 2³
    bcc    LB984                 ; 2³
LB956:
    lsr                          ; 2
    bcs    LB984                 ; 2³
LB959:
    stx    $EF                   ; 3
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    beq    LB983                 ; 2³
    sta    $EA                   ; 3
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bcs    LB983                 ; 2³
    tay                          ; 2
    lda    LB999,Y               ; 4
    bmi    LB983                 ; 2³
    tay                          ; 2
    lda    LB9B3,Y               ; 4
    sta    $EC                   ; 3
    lda    LB9BA,Y               ; 4
    sta    $ED                   ; 3
    jmp.ind ($00EC)              ; 5

LB981:
    ldx    $EF                   ; 3
LB983:
    inx                          ; 2
LB984:
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcc    LB959                 ; 2³
    ldx    $E7                   ; 3
    bpl    LB998                 ; 2³
    dex                          ; 2
    txa                          ; 2
    and    #$7F                  ; 2
    bne    LB996                 ; 2³
    sta    $E7                   ; 3
    rts                          ; 6

LB996:
    stx    $E7                   ; 3
LB998:
    rts                          ; 6

LB999:
    .byte $FF ; |XXXXXXXX| $B999
    .byte $FF ; |XXXXXXXX| $B99A
    .byte $00 ; |        | $B99B
    .byte $00 ; |        | $B99C
    .byte $01 ; |       X| $B99D
    .byte $01 ; |       X| $B99E
    .byte $01 ; |       X| $B99F
    .byte $FF ; |XXXXXXXX| $B9A0
    .byte $02 ; |      X | $B9A1
    .byte $02 ; |      X | $B9A2
    .byte $02 ; |      X | $B9A3
    .byte $02 ; |      X | $B9A4
    .byte $03 ; |      XX| $B9A5
    .byte $03 ; |      XX| $B9A6
    .byte $04 ; |     X  | $B9A7
    .byte $04 ; |     X  | $B9A8
    .byte $04 ; |     X  | $B9A9
    .byte $04 ; |     X  | $B9AA
    .byte $05 ; |     X X| $B9AB
    .byte $05 ; |     X X| $B9AC
    .byte $05 ; |     X X| $B9AD
    .byte $05 ; |     X X| $B9AE
    .byte $06 ; |     XX | $B9AF
    .byte $06 ; |     XX | $B9B0
    .byte $06 ; |     XX | $B9B1
    .byte $06 ; |     XX | $B9B2
LB9B3:
    .byte $03 ; |      XX| $B9B3
    .byte $BE ; |X XXXXX | $B9B4
    .byte $41 ; | X     X| $B9B5
    .byte $46 ; | X   XX | $B9B6
    .byte $CE ; |XX  XXX | $B9B7
    .byte $C0 ; |XX      | $B9B8
    .byte $70 ; | XXX    | $B9B9
LB9BA:
    .byte $B1 ; |X XX   X| $B9BA
    .byte $B1 ; |X XX   X| $B9BB
    .byte $B3 ; |X XX  XX| $B9BC
    .byte $B4 ; |X XX X  | $B9BD
    .byte $B5 ; |X XX X X| $B9BE
    .byte $B6 ; |X XX XX | $B9BF
    .byte $B7 ; |X XX XXX| $B9C0
LB9C1:
    jsr    LBB05                 ; 6
    beq    LB9CA                 ; 2³
    lda    $83                   ; 3
    bmi    LB9CD                 ; 2³
LB9CA:
    jsr    LB934                 ; 6
LB9CD:
    ldx    INTIM                 ; 4
    bne    LB9CD                 ; 2³
    jmp    LBFF0                 ; 3

LB9D5:
    lda    $EA                   ; 3
    eor    $8A                   ; 3
    lsr                          ; 2
    lda    #0                    ; 2
    bcs    LB9E0                 ; 2³
    lda    #5                    ; 2
LB9E0:
    adc    $EB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $EA                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$51                  ; 2
    sec                          ; 2
    sbc    LBA14,X               ; 4
    tay                          ; 2
    lda.wy $8B,Y                 ; 4
    and    LBA34,X               ; 4
    bne    LBA0F                 ; 2³+1
    lda    LBA33,X               ; 4
    and.wy $8B,Y                 ; 4
    cmp    #8                    ; 2
    beq    LBA10                 ; 2³
    cmp    #$20                  ; 2
    beq    LBA10                 ; 2³
    cmp    #$80                  ; 2
    beq    LBA10                 ; 2³
    lda    #0                    ; 2
LBA0F:
    rts                          ; 6

LBA10:
    dex                          ; 2
    cmp    #0                    ; 2
    rts                          ; 6

LBA14:
    .byte $04 ; |     X  | $BA14
    .byte $04 ; |     X  | $BA15
    .byte $04 ; |     X  | $BA16
    .byte $04 ; |     X  | $BA17
    .byte $04 ; |     X  | $BA18
    .byte $04 ; |     X  | $BA19
    .byte $04 ; |     X  | $BA1A
    .byte $04 ; |     X  | $BA1B
    .byte $03 ; |      XX| $BA1C
    .byte $03 ; |      XX| $BA1D
    .byte $03 ; |      XX| $BA1E
    .byte $03 ; |      XX| $BA1F
    .byte $03 ; |      XX| $BA20
    .byte $03 ; |      XX| $BA21
    .byte $03 ; |      XX| $BA22
    .byte $03 ; |      XX| $BA23
    .byte $02 ; |      X | $BA24
    .byte $02 ; |      X | $BA25
    .byte $02 ; |      X | $BA26
    .byte $02 ; |      X | $BA27
    .byte $02 ; |      X | $BA28
    .byte $02 ; |      X | $BA29
    .byte $02 ; |      X | $BA2A
    .byte $02 ; |      X | $BA2B
    .byte $01 ; |       X| $BA2C
    .byte $01 ; |       X| $BA2D
    .byte $01 ; |       X| $BA2E
    .byte $01 ; |       X| $BA2F
    .byte $01 ; |       X| $BA30
    .byte $01 ; |       X| $BA31
    .byte $01 ; |       X| $BA32
LBA33:
    .byte $01 ; |       X| $BA33
LBA34:
    .byte $00 ; |        | $BA34
    .byte $C0 ; |XX      | $BA35
    .byte $00 ; |        | $BA36
    .byte $30 ; |  XX    | $BA37
    .byte $00 ; |        | $BA38
    .byte $0C ; |    XX  | $BA39
    .byte $00 ; |        | $BA3A
    .byte $03 ; |      XX| $BA3B
    .byte $00 ; |        | $BA3C
    .byte $C0 ; |XX      | $BA3D
    .byte $00 ; |        | $BA3E
    .byte $30 ; |  XX    | $BA3F
    .byte $00 ; |        | $BA40
    .byte $0C ; |    XX  | $BA41
    .byte $00 ; |        | $BA42
    .byte $03 ; |      XX| $BA43
    .byte $00 ; |        | $BA44
    .byte $C0 ; |XX      | $BA45
    .byte $00 ; |        | $BA46
    .byte $30 ; |  XX    | $BA47
    .byte $00 ; |        | $BA48
    .byte $0C ; |    XX  | $BA49
    .byte $00 ; |        | $BA4A
    .byte $03 ; |      XX| $BA4B
    .byte $00 ; |        | $BA4C
    .byte $C0 ; |XX      | $BA4D
    .byte $00 ; |        | $BA4E
    .byte $30 ; |  XX    | $BA4F
    .byte $00 ; |        | $BA50
    .byte $0C ; |    XX  | $BA51
    .byte $00 ; |        | $BA52
    .byte $03 ; |      XX| $BA53
LBA54:
    stx    $F5                   ; 3
    ldx    #$0C                  ; 2
LBA58:
    dex                          ; 2
    bmi    LBA69                 ; 2³
    lda    $F0A4,X               ; 4
    and    #$0F                  ; 2
    cmp    $F5                   ; 3
    bne    LBA58                 ; 2³
    lda    #$FF                  ; 2
    sta    $F024,X               ; 5
LBA69:
    ldx    $F5                   ; 3
    rts                          ; 6

LBA6C:
    ldy    #0                    ; 2
    ldx    #$0B                  ; 2
LBA70:
    lda    $F08C,X               ; 4
    bpl    LBA82                 ; 2³
    cmp    #$FF                  ; 2
    beq    LBA87                 ; 2³
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    beq    LBA87                 ; 2³
LBA82:
    txa                          ; 2
    sta    $F024,Y               ; 5
    iny                          ; 2
LBA87:
    dex                          ; 2
    bpl    LBA70                 ; 2³
    lda    #$FF                  ; 2
LBA8C:
    cpy    #$0C                  ; 2
    bcs    LBA96                 ; 2³
    sta    $F024,Y               ; 5
    iny                          ; 2
    bpl    LBA8C                 ; 2³
LBA96:
    rts                          ; 6

LBA97:
    lda    #$FF                  ; 2
    cmp    $F0AD                 ; 4
    bne    LBAA2                 ; 2³
    stx    $F02D                 ; 4
    rts                          ; 6

LBAA2:
    cmp    $F0AE                 ; 4
    bne    LBAAB                 ; 2³
    stx    $F02E                 ; 4
    rts                          ; 6

LBAAB:
    cmp    $F0AF                 ; 4
    bne    LBAB4                 ; 2³
    stx    $F02F                 ; 4
    rts                          ; 6

LBAB4:
    cmp    $F0AC                 ; 4
    bne    LBABD                 ; 2³
    stx    $F02C                 ; 4
    rts                          ; 6

LBABD:
    cmp    $F0AB                 ; 4
    bne    LBAC6                 ; 2³
    stx    $F02B                 ; 4
    rts                          ; 6

LBAC6:
    cmp    $F0AA                 ; 4
    bne    LBACF                 ; 2³
    stx    $F02A                 ; 4
    rts                          ; 6

LBACF:
    cmp    $F0A9                 ; 4
    bne    LBAD8                 ; 2³
    stx    $F029                 ; 4
    rts                          ; 6

LBAD8:
    cmp    $F0A8                 ; 4
    bne    LBAE1                 ; 2³
    stx    $F028                 ; 4
    rts                          ; 6

LBAE1:
    cmp    $F0A7                 ; 4
    bne    LBAEA                 ; 2³
    stx    $F027                 ; 4
    rts                          ; 6

LBAEA:
    cmp    $F0A6                 ; 4
    bne    LBAF3                 ; 2³
    stx    $F026                 ; 4
    rts                          ; 6

LBAF3:
    cmp    $F0A5                 ; 4
    bne    LBAFC                 ; 2³
    stx    $F025                 ; 4
    rts                          ; 6

LBAFC:
    cmp    $F0A4                 ; 4
    bne    LBB04                 ; 2³
    stx    $F024                 ; 4
LBB04:
    rts                          ; 6

LBB05:
    lda    #8                    ; 2
    bit    $83                   ; 3
    bne    LBB17                 ; 2³
    lda    #$10                  ; 2
    bit    $83                   ; 3
    bne    LBB17                 ; 2³
    lda    #2                    ; 2
    bit    $8A                   ; 3
    beq    LBB1A                 ; 2³
LBB17:
    lda    #0                    ; 2
    rts                          ; 6

LBB1A:
    lda    #$20                  ; 2
    bit    $83                   ; 3
    beq    LBB43                 ; 2³
    lda    $84                   ; 3
    ldx    $80                   ; 3
    cpx    #8                    ; 2
    bcc    LBB2C                 ; 2³
    and    #$3F                  ; 2
    bpl    LBB32                 ; 2³
LBB2C:
    cpx    #2                    ; 2
    bcc    LBB32                 ; 2³
    and    #$7F                  ; 2
LBB32:
    cmp    #$0D                  ; 2
    bne    LBB43                 ; 2³
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcs    LBB43                 ; 2³
    ldx    #8                    ; 2
    jmp    LBBE2                 ; 3

LBB43:
    lda    $87                   ; 3
    cmp    #1                    ; 2
    bne    LBB4E                 ; 2³
    ldx    #0                    ; 2
    jmp    LBBD6                 ; 3

LBB4E:
    lda    $83                   ; 3
    bpl    LBB58                 ; 2³
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    LBB6E                 ; 2³
LBB58:
    ldx    #7                    ; 2
LBB5A:
    lda    $84                   ; 3
LBB5C:
    cmp    LBD1E,X               ; 4
    beq    LBBD6                 ; 2³
    dex                          ; 2
    bmi    LBB6E                 ; 2³
    bne    LBB5C                 ; 2³
    lda    $E6                   ; 3
    and    #$0F                  ; 2
    cmp    #2                    ; 2
    bcs    LBB5A                 ; 2³
LBB6E:
    lda    #8                    ; 2
    bit    $FA                   ; 3
    beq    LBB7C                 ; 2³
    lda    $84                   ; 3
    and    #$1F                  ; 2
    bne    LBB17                 ; 2³
    beq    LBB8C                 ; 2³
LBB7C:
    lda    $84                   ; 3
    ldx    $80                   ; 3
    cpx    #6                    ; 2
    bcc    LBB88                 ; 2³
    and    #$07                  ; 2
    beq    LBB8C                 ; 2³
LBB88:
    and    #$0F                  ; 2
    bne    LBB17                 ; 2³
LBB8C:
    bit    $83                   ; 3
    bpl    LBB17                 ; 2³
    ldx    #1                    ; 2
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #4                    ; 2
    beq    LBBD6                 ; 2³
    ldx    #3                    ; 2
    cmp    #9                    ; 2
    beq    LBBD6                 ; 2³
    ldx    #5                    ; 2
    cmp    #$0B                  ; 2
    beq    LBBD6                 ; 2³
    ldx    #1                    ; 2
    cmp    #$0D                  ; 2
    bne    LBBB6                 ; 2³
    lda    $84                   ; 3
    and    #$1F                  ; 2
    bne    LBBD6                 ; 2³
    ldx    #3                    ; 2
    bpl    LBBD6                 ; 2³
LBBB6:
    cmp    #$0F                  ; 2
    bne    LBBF9                 ; 2³
    lda    $84                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    LBC55,X               ; 4
    bne    LBBCC                 ; 2³
    ldx    #1                    ; 2
    bne    LBBD6                 ; 2³
LBBCC:
    cmp    #1                    ; 2
    bne    LBBD4                 ; 2³
    ldx    #3                    ; 2
    bpl    LBBD6                 ; 2³
LBBD4:
    ldx    #5                    ; 2
LBBD6:
    lda    $87                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LBC5D,Y               ; 4
    and    LBD38,X               ; 4
    beq    LBBF9                 ; 2³
LBBE2:
    lda    LBD26,X               ; 4
    sta    $EA                   ; 3
    lda    LBD2F,X               ; 4
    sta    $EB                   ; 3
    txa                          ; 2
    ldx    #$0A                  ; 2
LBBEF:
    ldy    $F08C,X               ; 4
    cpy    #$FF                  ; 2
    beq    LBBFC                 ; 2³
    dex                          ; 2
    bpl    LBBEF                 ; 2³
LBBF9:
    lda    #0                    ; 2
    rts                          ; 6

LBBFC:
    stx    $EF                   ; 3
    jmp.ind ($00EA)              ; 5

LBC01:
    lda    $F08C,X               ; 4
    cmp    #$FF                  ; 2
    beq    LBBF9                 ; 2³+1
    lda    #1                    ; 2
    rts                          ; 6

    lda    $DF                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $F08C,Y               ; 4
    cmp    #$FF                  ; 2
    beq    LBC2B                 ; 2³
    ldx    $EF                   ; 3
    lda    $F08C,Y               ; 4
    sta    $F00C,X               ; 5
    lda    $F080,Y               ; 4
    sta    $F000,X               ; 5
    lda    $F098,Y               ; 4
    sta    $F018,X               ; 5
LBC2B:
    lda    INTIM                 ; 4
    adc    $84                   ; 3
    adc    $F080                 ; 4
    bpl    LBC3E                 ; 2³
    lda    #0                    ; 2
    sta    $F000,Y               ; 5
    lda    #$26                  ; 2
    bpl    LBC45                 ; 2³
LBC3E:
    lda    #$7C                  ; 2
    sta    $F000,Y               ; 5
    lda    #6                    ; 2
LBC45:
    sta    $F00C,Y               ; 5
    lda    #$9A                  ; 2
    sta    $F018,Y               ; 5
    inc    $DF                   ; 5
    jsr    LBA6C                 ; 6
    jmp    LB981                 ; 3

LBC55:
    .byte $00 ; |        | $BC55
    .byte $01 ; |       X| $BC56
    .byte $02 ; |      X | $BC57
    .byte $00 ; |        | $BC58
    .byte $01 ; |       X| $BC59
    .byte $02 ; |      X | $BC5A
    .byte $00 ; |        | $BC5B
    .byte $01 ; |       X| $BC5C
LBC5D:
    .byte $03 ; |      XX| $BC5D
    .byte $43 ; | X    XX| $BC5E
    .byte $67 ; | XX  XXX| $BC5F
    .byte $7F ; | XXXXXXX| $BC60
    .byte $7F ; | XXXXXXX| $BC61
    .byte $77 ; | XXX XXX| $BC62
    .byte $7F ; | XXXXXXX| $BC63
    .byte $5B ; | X XX XX| $BC64
    lda    #0                    ; 2
    sta    $EA                   ; 3
    lda    $83                   ; 3
    bpl    LBC87                 ; 2³
    lda    $87                   ; 3
    and    #$0F                  ; 2
    cmp    #4                    ; 2
    beq    LBC7D                 ; 2³
    cmp    #$0D                  ; 2
    beq    LBC7D                 ; 2³
    cmp    #$0F                  ; 2
    bne    LBC87                 ; 2³
LBC7D:
    inc    $EA                   ; 5
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    bne    LBC9C                 ; 2³
LBC87:
    lda    $FE                   ; 3
    ldx    $EF                   ; 3
    cmp    #8                    ; 2
    bcc    LBC9C                 ; 2³
    cmp    #$0C                  ; 2
    bcs    LBC99                 ; 2³
    lda    $80                   ; 3
    cmp    #$12                  ; 2
    bcs    LBC9C                 ; 2³
LBC99:
    jmp    LBD1B                 ; 3

LBC9C:
    lda    $84                   ; 3
    adc    $E8                   ; 3
    adc    $E9                   ; 3
    ldy    $E8                   ; 3
    sty    $E9                   ; 3
    sta    $E8                   ; 3
    and    #$1F                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F000,X               ; 5
    lda    #$13                  ; 2
    sta    $F00C,X               ; 5
    lda    #2                    ; 2
    sta    $F018,X               ; 5
    lda    $DF                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $DF                   ; 3
    jsr    LBA97                 ; 6
    lda    #$2C                  ; 2
    cmp    $FD                   ; 3
    bcs    LBCCD                 ; 2³
    lda    #$3A                  ; 2
    sta    $FD                   ; 3
LBCCD:
    lda    $EA                   ; 3
    beq    LBD1B                 ; 2³+1
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    beq    LBCE9                 ; 2³
    dec    $DF                   ; 5
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    cmp    #1                    ; 2
    bne    LBD1B                 ; 2³+1
    lda    $8A                   ; 3
    ora    #$02                  ; 2
    sta    $8A                   ; 3
    bne    LBD1B                 ; 2³+1
LBCE9:
    lda    $DF                   ; 3
    and    #$F0                  ; 2
    cmp    #$60                  ; 2
    bcs    LBD15                 ; 2³+1
    ldx    $87                   ; 3
    cpx    #4                    ; 2
    beq    LBD1B                 ; 2³+1
    clc                          ; 2
    adc    $E1                   ; 3
    cmp    #$60                  ; 2
    bcs    LBD15                 ; 2³+1
    ldx    $87                   ; 3
    cpx    #$0F                  ; 2
    bne    LBD1B                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $EA                   ; 3
    lda    $E1                   ; 3
    and    #$0F                  ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    cmp    #6                    ; 2
    bcc    LBD1B                 ; 2³
LBD15:
    lda    $DF                   ; 3
    ora    #$0A                  ; 2
    sta    $DF                   ; 3
LBD1B:
    jmp    LBC01                 ; 3

LBD1E:
    .byte $01 ; |       X| $BD1E
    .byte $1D ; |   XXX X| $BD1F
    .byte $3D ; |  XXXX X| $BD20
    .byte $61 ; | XX    X| $BD21
    .byte $83 ; |X     XX| $BD22
    .byte $A1 ; |X X    X| $BD23
    .byte $C1 ; |XX     X| $BD24
    .byte $DF ; |XX XXXXX| $BD25
LBD26:
    .byte $D4 ; |XX X X  | $BD26
    .byte $65 ; | XX  X X| $BD27
    .byte $B7 ; |X XX XXX| $BD28
    .byte $37 ; |  XX XXX| $BD29
    .byte $D4 ; |XX X X  | $BD2A
    .byte $38 ; |  XXX   | $BD2B
    .byte $17 ; |   X XXX| $BD2C
    .byte $EE ; |XXX XXX | $BD2D
    .byte $0B ; |    X XX| $BD2E
LBD2F:
    .byte $B2 ; |X XX  X | $BD2F
    .byte $BC ; |X XXXX  | $BD30
    .byte $B3 ; |X XX  XX| $BD31
    .byte $B5 ; |X XX X X| $BD32
    .byte $B2 ; |X XX  X | $BD33
    .byte $B6 ; |X XX XX | $BD34
    .byte $B7 ; |X XX XXX| $BD35
    .byte $B8 ; |X XXX   | $BD36
    .byte $BC ; |X XXXX  | $BD37
LBD38:
    .byte $02 ; |      X | $BD38
    .byte $01 ; |       X| $BD39
    .byte $04 ; |     X  | $BD3A
    .byte $08 ; |    X   | $BD3B
    .byte $02 ; |      X | $BD3C
    .byte $10 ; |   X    | $BD3D
    .byte $20 ; |  X     | $BD3E
    .byte $40 ; | X      | $BD3F
    .byte $00 ; |        | $BD40
    .byte $00 ; |        | $BD41
    .byte $00 ; |        | $BD42
    .byte $00 ; |        | $BD43
    .byte $00 ; |        | $BD44
    .byte $00 ; |        | $BD45
    .byte $00 ; |        | $BD46
    .byte $00 ; |        | $BD47
    .byte $00 ; |        | $BD48
    .byte $00 ; |        | $BD49
    .byte $00 ; |        | $BD4A
    .byte $00 ; |        | $BD4B
    .byte $00 ; |        | $BD4C
    .byte $00 ; |        | $BD4D
    .byte $00 ; |        | $BD4E
    .byte $00 ; |        | $BD4F
    .byte $00 ; |        | $BD50
    .byte $00 ; |        | $BD51
    .byte $00 ; |        | $BD52
    .byte $00 ; |        | $BD53
    .byte $00 ; |        | $BD54
    .byte $00 ; |        | $BD55
    .byte $00 ; |        | $BD56
    .byte $00 ; |        | $BD57
    .byte $00 ; |        | $BD58
    .byte $00 ; |        | $BD59
    .byte $00 ; |        | $BD5A
    .byte $00 ; |        | $BD5B
    .byte $00 ; |        | $BD5C
    .byte $00 ; |        | $BD5D
    .byte $00 ; |        | $BD5E
    .byte $00 ; |        | $BD5F
    .byte $00 ; |        | $BD60
    .byte $00 ; |        | $BD61
    .byte $00 ; |        | $BD62
    .byte $00 ; |        | $BD63
    .byte $00 ; |        | $BD64
    .byte $00 ; |        | $BD65
    .byte $00 ; |        | $BD66
    .byte $00 ; |        | $BD67
    .byte $00 ; |        | $BD68
    .byte $00 ; |        | $BD69
    .byte $00 ; |        | $BD6A
    .byte $00 ; |        | $BD6B
    .byte $00 ; |        | $BD6C
    .byte $00 ; |        | $BD6D
    .byte $00 ; |        | $BD6E
    .byte $00 ; |        | $BD6F
    .byte $00 ; |        | $BD70
    .byte $00 ; |        | $BD71
    .byte $00 ; |        | $BD72
    .byte $00 ; |        | $BD73
    .byte $00 ; |        | $BD74
    .byte $00 ; |        | $BD75
    .byte $00 ; |        | $BD76
    .byte $00 ; |        | $BD77
    .byte $00 ; |        | $BD78
    .byte $00 ; |        | $BD79
    .byte $00 ; |        | $BD7A
    .byte $00 ; |        | $BD7B
    .byte $00 ; |        | $BD7C
    .byte $00 ; |        | $BD7D
    .byte $00 ; |        | $BD7E
    .byte $00 ; |        | $BD7F
    .byte $00 ; |        | $BD80
    .byte $00 ; |        | $BD81
    .byte $00 ; |        | $BD82
    .byte $00 ; |        | $BD83
    .byte $00 ; |        | $BD84
    .byte $00 ; |        | $BD85
    .byte $00 ; |        | $BD86
    .byte $00 ; |        | $BD87
    .byte $00 ; |        | $BD88
    .byte $00 ; |        | $BD89
    .byte $00 ; |        | $BD8A
    .byte $00 ; |        | $BD8B
    .byte $00 ; |        | $BD8C
    .byte $00 ; |        | $BD8D
    .byte $00 ; |        | $BD8E
    .byte $00 ; |        | $BD8F
    .byte $00 ; |        | $BD90
    .byte $00 ; |        | $BD91
    .byte $00 ; |        | $BD92
    .byte $00 ; |        | $BD93
    .byte $00 ; |        | $BD94
    .byte $00 ; |        | $BD95
    .byte $00 ; |        | $BD96
    .byte $00 ; |        | $BD97
    .byte $00 ; |        | $BD98
    .byte $00 ; |        | $BD99
    .byte $00 ; |        | $BD9A
    .byte $00 ; |        | $BD9B
    .byte $00 ; |        | $BD9C
    .byte $00 ; |        | $BD9D
    .byte $00 ; |        | $BD9E
    .byte $00 ; |        | $BD9F
    .byte $00 ; |        | $BDA0
    .byte $00 ; |        | $BDA1
    .byte $00 ; |        | $BDA2
    .byte $00 ; |        | $BDA3
    .byte $00 ; |        | $BDA4
    .byte $00 ; |        | $BDA5
    .byte $00 ; |        | $BDA6
    .byte $00 ; |        | $BDA7
    .byte $00 ; |        | $BDA8
    .byte $00 ; |        | $BDA9
    .byte $00 ; |        | $BDAA
    .byte $00 ; |        | $BDAB
    .byte $00 ; |        | $BDAC
    .byte $00 ; |        | $BDAD
    .byte $00 ; |        | $BDAE
    .byte $00 ; |        | $BDAF
    .byte $00 ; |        | $BDB0
    .byte $00 ; |        | $BDB1
    .byte $00 ; |        | $BDB2
    .byte $00 ; |        | $BDB3
    .byte $00 ; |        | $BDB4
    .byte $00 ; |        | $BDB5
    .byte $00 ; |        | $BDB6
    .byte $00 ; |        | $BDB7
    .byte $00 ; |        | $BDB8
    .byte $00 ; |        | $BDB9
    .byte $00 ; |        | $BDBA
    .byte $00 ; |        | $BDBB
    .byte $00 ; |        | $BDBC
    .byte $00 ; |        | $BDBD
    .byte $00 ; |        | $BDBE
    .byte $00 ; |        | $BDBF
    .byte $00 ; |        | $BDC0
    .byte $00 ; |        | $BDC1
    .byte $00 ; |        | $BDC2
    .byte $00 ; |        | $BDC3
    .byte $00 ; |        | $BDC4
    .byte $00 ; |        | $BDC5
    .byte $00 ; |        | $BDC6
    .byte $00 ; |        | $BDC7
    .byte $00 ; |        | $BDC8
    .byte $00 ; |        | $BDC9
    .byte $00 ; |        | $BDCA
    .byte $00 ; |        | $BDCB
    .byte $00 ; |        | $BDCC
    .byte $00 ; |        | $BDCD
    .byte $00 ; |        | $BDCE
    .byte $00 ; |        | $BDCF
    .byte $00 ; |        | $BDD0
    .byte $00 ; |        | $BDD1
    .byte $00 ; |        | $BDD2
    .byte $00 ; |        | $BDD3
    .byte $00 ; |        | $BDD4
    .byte $00 ; |        | $BDD5
    .byte $00 ; |        | $BDD6
    .byte $00 ; |        | $BDD7
    .byte $00 ; |        | $BDD8
    .byte $00 ; |        | $BDD9
    .byte $00 ; |        | $BDDA
    .byte $00 ; |        | $BDDB
    .byte $00 ; |        | $BDDC
    .byte $00 ; |        | $BDDD
    .byte $00 ; |        | $BDDE
    .byte $00 ; |        | $BDDF
    .byte $00 ; |        | $BDE0
    .byte $00 ; |        | $BDE1
    .byte $00 ; |        | $BDE2
    .byte $00 ; |        | $BDE3
    .byte $00 ; |        | $BDE4
    .byte $00 ; |        | $BDE5
    .byte $00 ; |        | $BDE6
    .byte $00 ; |        | $BDE7
    .byte $00 ; |        | $BDE8
    .byte $00 ; |        | $BDE9
    .byte $00 ; |        | $BDEA
    .byte $00 ; |        | $BDEB
    .byte $00 ; |        | $BDEC
    .byte $00 ; |        | $BDED
    .byte $00 ; |        | $BDEE
    .byte $00 ; |        | $BDEF
    .byte $00 ; |        | $BDF0
    .byte $00 ; |        | $BDF1
    .byte $00 ; |        | $BDF2
    .byte $00 ; |        | $BDF3
    .byte $00 ; |        | $BDF4
    .byte $00 ; |        | $BDF5
    .byte $00 ; |        | $BDF6
    .byte $00 ; |        | $BDF7
    .byte $00 ; |        | $BDF8
    .byte $00 ; |        | $BDF9
    .byte $00 ; |        | $BDFA
    .byte $00 ; |        | $BDFB
    .byte $00 ; |        | $BDFC
    .byte $00 ; |        | $BDFD
    .byte $00 ; |        | $BDFE
    .byte $00 ; |        | $BDFF
    .byte $00 ; |        | $BE00
    .byte $00 ; |        | $BE01
    .byte $00 ; |        | $BE02
    .byte $00 ; |        | $BE03
    .byte $00 ; |        | $BE04
    .byte $00 ; |        | $BE05
    .byte $00 ; |        | $BE06
    .byte $00 ; |        | $BE07
    .byte $00 ; |        | $BE08
    .byte $00 ; |        | $BE09
    .byte $00 ; |        | $BE0A
    .byte $00 ; |        | $BE0B
    .byte $00 ; |        | $BE0C
    .byte $00 ; |        | $BE0D
    .byte $00 ; |        | $BE0E
    .byte $00 ; |        | $BE0F
    .byte $00 ; |        | $BE10
    .byte $00 ; |        | $BE11
    .byte $00 ; |        | $BE12
    .byte $00 ; |        | $BE13
    .byte $00 ; |        | $BE14
    .byte $00 ; |        | $BE15
    .byte $00 ; |        | $BE16
    .byte $00 ; |        | $BE17
    .byte $00 ; |        | $BE18
    .byte $00 ; |        | $BE19
    .byte $00 ; |        | $BE1A
    .byte $00 ; |        | $BE1B
    .byte $00 ; |        | $BE1C
    .byte $00 ; |        | $BE1D
    .byte $00 ; |        | $BE1E
    .byte $00 ; |        | $BE1F
    .byte $00 ; |        | $BE20
    .byte $00 ; |        | $BE21
    .byte $00 ; |        | $BE22
    .byte $00 ; |        | $BE23
    .byte $00 ; |        | $BE24
    .byte $00 ; |        | $BE25
    .byte $00 ; |        | $BE26
    .byte $00 ; |        | $BE27
    .byte $00 ; |        | $BE28
    .byte $00 ; |        | $BE29
    .byte $00 ; |        | $BE2A
    .byte $00 ; |        | $BE2B
    .byte $00 ; |        | $BE2C
    .byte $00 ; |        | $BE2D
    .byte $00 ; |        | $BE2E
    .byte $00 ; |        | $BE2F
    .byte $00 ; |        | $BE30
    .byte $00 ; |        | $BE31
    .byte $00 ; |        | $BE32
    .byte $00 ; |        | $BE33
    .byte $00 ; |        | $BE34
    .byte $00 ; |        | $BE35
    .byte $00 ; |        | $BE36
    .byte $00 ; |        | $BE37
    .byte $00 ; |        | $BE38
    .byte $00 ; |        | $BE39
    .byte $00 ; |        | $BE3A
    .byte $00 ; |        | $BE3B
    .byte $00 ; |        | $BE3C
    .byte $00 ; |        | $BE3D
    .byte $00 ; |        | $BE3E
    .byte $00 ; |        | $BE3F
    .byte $00 ; |        | $BE40
    .byte $00 ; |        | $BE41
    .byte $00 ; |        | $BE42
    .byte $00 ; |        | $BE43
    .byte $00 ; |        | $BE44
    .byte $00 ; |        | $BE45
    .byte $00 ; |        | $BE46
    .byte $00 ; |        | $BE47
    .byte $00 ; |        | $BE48
    .byte $00 ; |        | $BE49
    .byte $00 ; |        | $BE4A
    .byte $00 ; |        | $BE4B
    .byte $00 ; |        | $BE4C
    .byte $00 ; |        | $BE4D
    .byte $00 ; |        | $BE4E
    .byte $00 ; |        | $BE4F
    .byte $00 ; |        | $BE50
    .byte $00 ; |        | $BE51
    .byte $00 ; |        | $BE52
    .byte $00 ; |        | $BE53
    .byte $00 ; |        | $BE54
    .byte $00 ; |        | $BE55
    .byte $00 ; |        | $BE56
    .byte $00 ; |        | $BE57
    .byte $00 ; |        | $BE58
    .byte $00 ; |        | $BE59
    .byte $00 ; |        | $BE5A
    .byte $00 ; |        | $BE5B
    .byte $00 ; |        | $BE5C
    .byte $00 ; |        | $BE5D
    .byte $00 ; |        | $BE5E
    .byte $00 ; |        | $BE5F
    .byte $00 ; |        | $BE60
    .byte $00 ; |        | $BE61
    .byte $00 ; |        | $BE62
    .byte $00 ; |        | $BE63
    .byte $00 ; |        | $BE64
    .byte $00 ; |        | $BE65
    .byte $00 ; |        | $BE66
    .byte $00 ; |        | $BE67
    .byte $00 ; |        | $BE68
    .byte $00 ; |        | $BE69
    .byte $00 ; |        | $BE6A
    .byte $00 ; |        | $BE6B
    .byte $00 ; |        | $BE6C
    .byte $00 ; |        | $BE6D
    .byte $00 ; |        | $BE6E
    .byte $00 ; |        | $BE6F
    .byte $00 ; |        | $BE70
    .byte $00 ; |        | $BE71
    .byte $00 ; |        | $BE72
    .byte $00 ; |        | $BE73
    .byte $00 ; |        | $BE74
    .byte $00 ; |        | $BE75
    .byte $00 ; |        | $BE76
    .byte $00 ; |        | $BE77
    .byte $00 ; |        | $BE78
    .byte $00 ; |        | $BE79
    .byte $00 ; |        | $BE7A
    .byte $00 ; |        | $BE7B
    .byte $00 ; |        | $BE7C
    .byte $00 ; |        | $BE7D
    .byte $00 ; |        | $BE7E
    .byte $00 ; |        | $BE7F
    .byte $00 ; |        | $BE80
    .byte $00 ; |        | $BE81
    .byte $00 ; |        | $BE82
    .byte $00 ; |        | $BE83
    .byte $00 ; |        | $BE84
    .byte $00 ; |        | $BE85
    .byte $00 ; |        | $BE86
    .byte $00 ; |        | $BE87
    .byte $00 ; |        | $BE88
    .byte $00 ; |        | $BE89
    .byte $00 ; |        | $BE8A
    .byte $00 ; |        | $BE8B
    .byte $00 ; |        | $BE8C
    .byte $00 ; |        | $BE8D
    .byte $00 ; |        | $BE8E
    .byte $00 ; |        | $BE8F
    .byte $00 ; |        | $BE90
    .byte $00 ; |        | $BE91
    .byte $00 ; |        | $BE92
    .byte $00 ; |        | $BE93
    .byte $00 ; |        | $BE94
    .byte $00 ; |        | $BE95
    .byte $00 ; |        | $BE96
    .byte $00 ; |        | $BE97
    .byte $00 ; |        | $BE98
    .byte $00 ; |        | $BE99
    .byte $00 ; |        | $BE9A
    .byte $00 ; |        | $BE9B
    .byte $00 ; |        | $BE9C
    .byte $00 ; |        | $BE9D
    .byte $00 ; |        | $BE9E
    .byte $00 ; |        | $BE9F
    .byte $00 ; |        | $BEA0
    .byte $00 ; |        | $BEA1
    .byte $00 ; |        | $BEA2
    .byte $00 ; |        | $BEA3
    .byte $00 ; |        | $BEA4
    .byte $00 ; |        | $BEA5
    .byte $00 ; |        | $BEA6
    .byte $00 ; |        | $BEA7
    .byte $00 ; |        | $BEA8
    .byte $00 ; |        | $BEA9
    .byte $00 ; |        | $BEAA
    .byte $00 ; |        | $BEAB
    .byte $00 ; |        | $BEAC
    .byte $00 ; |        | $BEAD
    .byte $00 ; |        | $BEAE
    .byte $00 ; |        | $BEAF
    .byte $00 ; |        | $BEB0
    .byte $00 ; |        | $BEB1
    .byte $00 ; |        | $BEB2
    .byte $00 ; |        | $BEB3
    .byte $00 ; |        | $BEB4
    .byte $00 ; |        | $BEB5
    .byte $00 ; |        | $BEB6
    .byte $00 ; |        | $BEB7
    .byte $00 ; |        | $BEB8
    .byte $00 ; |        | $BEB9
    .byte $00 ; |        | $BEBA
    .byte $00 ; |        | $BEBB
    .byte $00 ; |        | $BEBC
    .byte $00 ; |        | $BEBD
    .byte $00 ; |        | $BEBE
    .byte $00 ; |        | $BEBF
    .byte $00 ; |        | $BEC0
    .byte $00 ; |        | $BEC1
    .byte $00 ; |        | $BEC2
    .byte $00 ; |        | $BEC3
    .byte $00 ; |        | $BEC4
    .byte $00 ; |        | $BEC5
    .byte $00 ; |        | $BEC6
    .byte $00 ; |        | $BEC7
    .byte $00 ; |        | $BEC8
    .byte $00 ; |        | $BEC9
    .byte $00 ; |        | $BECA
    .byte $00 ; |        | $BECB
    .byte $00 ; |        | $BECC
    .byte $00 ; |        | $BECD
    .byte $00 ; |        | $BECE
    .byte $00 ; |        | $BECF
    .byte $00 ; |        | $BED0
    .byte $00 ; |        | $BED1
    .byte $00 ; |        | $BED2
    .byte $00 ; |        | $BED3
    .byte $00 ; |        | $BED4
    .byte $00 ; |        | $BED5
    .byte $00 ; |        | $BED6
    .byte $00 ; |        | $BED7
    .byte $00 ; |        | $BED8
    .byte $00 ; |        | $BED9
    .byte $00 ; |        | $BEDA
    .byte $00 ; |        | $BEDB
    .byte $00 ; |        | $BEDC
    .byte $00 ; |        | $BEDD
    .byte $00 ; |        | $BEDE
    .byte $00 ; |        | $BEDF
    .byte $00 ; |        | $BEE0
    .byte $00 ; |        | $BEE1
    .byte $00 ; |        | $BEE2
    .byte $00 ; |        | $BEE3
    .byte $00 ; |        | $BEE4
    .byte $00 ; |        | $BEE5
    .byte $00 ; |        | $BEE6
    .byte $00 ; |        | $BEE7
    .byte $00 ; |        | $BEE8
    .byte $00 ; |        | $BEE9
    .byte $00 ; |        | $BEEA
    .byte $00 ; |        | $BEEB
    .byte $00 ; |        | $BEEC
    .byte $00 ; |        | $BEED
    .byte $00 ; |        | $BEEE
    .byte $00 ; |        | $BEEF
    .byte $00 ; |        | $BEF0
    .byte $00 ; |        | $BEF1
    .byte $00 ; |        | $BEF2
    .byte $00 ; |        | $BEF3
    .byte $00 ; |        | $BEF4
    .byte $00 ; |        | $BEF5
    .byte $00 ; |        | $BEF6
    .byte $00 ; |        | $BEF7
    .byte $00 ; |        | $BEF8
    .byte $00 ; |        | $BEF9
    .byte $00 ; |        | $BEFA
    .byte $00 ; |        | $BEFB
    .byte $00 ; |        | $BEFC
    .byte $00 ; |        | $BEFD
    .byte $00 ; |        | $BEFE
    .byte $00 ; |        | $BEFF
    .byte $00 ; |        | $BF00
    .byte $00 ; |        | $BF01
    .byte $00 ; |        | $BF02
    .byte $00 ; |        | $BF03
    .byte $00 ; |        | $BF04
    .byte $00 ; |        | $BF05
    .byte $00 ; |        | $BF06
    .byte $00 ; |        | $BF07
    .byte $00 ; |        | $BF08
    .byte $00 ; |        | $BF09
    .byte $00 ; |        | $BF0A
    .byte $00 ; |        | $BF0B
    .byte $00 ; |        | $BF0C
    .byte $00 ; |        | $BF0D
    .byte $00 ; |        | $BF0E
    .byte $00 ; |        | $BF0F
    .byte $00 ; |        | $BF10
    .byte $00 ; |        | $BF11
    .byte $00 ; |        | $BF12
    .byte $00 ; |        | $BF13
    .byte $00 ; |        | $BF14
    .byte $00 ; |        | $BF15
    .byte $00 ; |        | $BF16
    .byte $00 ; |        | $BF17
    .byte $00 ; |        | $BF18
    .byte $00 ; |        | $BF19
    .byte $00 ; |        | $BF1A
    .byte $00 ; |        | $BF1B
    .byte $00 ; |        | $BF1C
    .byte $00 ; |        | $BF1D
    .byte $00 ; |        | $BF1E
    .byte $00 ; |        | $BF1F
    .byte $00 ; |        | $BF20
    .byte $00 ; |        | $BF21
    .byte $00 ; |        | $BF22
    .byte $00 ; |        | $BF23
    .byte $00 ; |        | $BF24
    .byte $00 ; |        | $BF25
    .byte $00 ; |        | $BF26
    .byte $00 ; |        | $BF27
    .byte $00 ; |        | $BF28
    .byte $00 ; |        | $BF29
    .byte $00 ; |        | $BF2A
    .byte $00 ; |        | $BF2B
    .byte $00 ; |        | $BF2C
    .byte $00 ; |        | $BF2D
    .byte $00 ; |        | $BF2E
    .byte $00 ; |        | $BF2F
    .byte $00 ; |        | $BF30
    .byte $00 ; |        | $BF31
    .byte $00 ; |        | $BF32
    .byte $00 ; |        | $BF33
    .byte $00 ; |        | $BF34
    .byte $00 ; |        | $BF35
    .byte $00 ; |        | $BF36
    .byte $00 ; |        | $BF37
    .byte $00 ; |        | $BF38
    .byte $00 ; |        | $BF39
    .byte $00 ; |        | $BF3A
    .byte $00 ; |        | $BF3B
    .byte $00 ; |        | $BF3C
    .byte $00 ; |        | $BF3D
    .byte $00 ; |        | $BF3E
    .byte $00 ; |        | $BF3F
    .byte $00 ; |        | $BF40
    .byte $00 ; |        | $BF41
    .byte $00 ; |        | $BF42
    .byte $00 ; |        | $BF43
    .byte $00 ; |        | $BF44
    .byte $00 ; |        | $BF45
    .byte $00 ; |        | $BF46
    .byte $00 ; |        | $BF47
    .byte $00 ; |        | $BF48
    .byte $00 ; |        | $BF49
    .byte $00 ; |        | $BF4A
    .byte $00 ; |        | $BF4B
    .byte $00 ; |        | $BF4C
    .byte $00 ; |        | $BF4D
    .byte $00 ; |        | $BF4E
    .byte $00 ; |        | $BF4F
    .byte $00 ; |        | $BF50
    .byte $00 ; |        | $BF51
    .byte $00 ; |        | $BF52
    .byte $00 ; |        | $BF53
    .byte $00 ; |        | $BF54
    .byte $00 ; |        | $BF55
    .byte $00 ; |        | $BF56
    .byte $00 ; |        | $BF57
    .byte $00 ; |        | $BF58
    .byte $00 ; |        | $BF59
    .byte $00 ; |        | $BF5A
    .byte $00 ; |        | $BF5B
    .byte $00 ; |        | $BF5C
    .byte $00 ; |        | $BF5D
    .byte $00 ; |        | $BF5E
    .byte $00 ; |        | $BF5F
    .byte $00 ; |        | $BF60
    .byte $00 ; |        | $BF61
    .byte $00 ; |        | $BF62
    .byte $00 ; |        | $BF63
    .byte $00 ; |        | $BF64
    .byte $00 ; |        | $BF65
    .byte $00 ; |        | $BF66
    .byte $00 ; |        | $BF67
    .byte $00 ; |        | $BF68
    .byte $00 ; |        | $BF69
    .byte $00 ; |        | $BF6A
    .byte $00 ; |        | $BF6B
    .byte $00 ; |        | $BF6C
    .byte $00 ; |        | $BF6D
    .byte $00 ; |        | $BF6E
    .byte $00 ; |        | $BF6F
    .byte $00 ; |        | $BF70
    .byte $00 ; |        | $BF71
    .byte $00 ; |        | $BF72
    .byte $00 ; |        | $BF73
    .byte $00 ; |        | $BF74
    .byte $00 ; |        | $BF75
    .byte $00 ; |        | $BF76
    .byte $00 ; |        | $BF77
    .byte $00 ; |        | $BF78
    .byte $00 ; |        | $BF79
    .byte $00 ; |        | $BF7A
    .byte $00 ; |        | $BF7B
    .byte $00 ; |        | $BF7C
    .byte $00 ; |        | $BF7D
    .byte $00 ; |        | $BF7E
    .byte $00 ; |        | $BF7F
    .byte $00 ; |        | $BF80
    .byte $00 ; |        | $BF81
    .byte $00 ; |        | $BF82
    .byte $00 ; |        | $BF83
    .byte $00 ; |        | $BF84
    .byte $00 ; |        | $BF85
    .byte $00 ; |        | $BF86
    .byte $00 ; |        | $BF87
    .byte $00 ; |        | $BF88
    .byte $00 ; |        | $BF89
    .byte $00 ; |        | $BF8A
    .byte $00 ; |        | $BF8B
    .byte $00 ; |        | $BF8C
    .byte $00 ; |        | $BF8D
    .byte $00 ; |        | $BF8E
    .byte $00 ; |        | $BF8F
    .byte $00 ; |        | $BF90
    .byte $00 ; |        | $BF91
    .byte $00 ; |        | $BF92
    .byte $00 ; |        | $BF93
    .byte $00 ; |        | $BF94
    .byte $00 ; |        | $BF95
    .byte $00 ; |        | $BF96
    .byte $00 ; |        | $BF97
    .byte $00 ; |        | $BF98
    .byte $00 ; |        | $BF99
    .byte $00 ; |        | $BF9A
    .byte $00 ; |        | $BF9B
    .byte $00 ; |        | $BF9C
    .byte $00 ; |        | $BF9D
    .byte $00 ; |        | $BF9E
    .byte $00 ; |        | $BF9F
    .byte $00 ; |        | $BFA0
    .byte $00 ; |        | $BFA1
    .byte $00 ; |        | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $00 ; |        | $BFA7
    .byte $00 ; |        | $BFA8
    .byte $00 ; |        | $BFA9
    .byte $00 ; |        | $BFAA
    .byte $00 ; |        | $BFAB
    .byte $00 ; |        | $BFAC
    .byte $00 ; |        | $BFAD
    .byte $00 ; |        | $BFAE
    .byte $00 ; |        | $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $00 ; |        | $BFB2
    .byte $00 ; |        | $BFB3
    .byte $00 ; |        | $BFB4
    .byte $00 ; |        | $BFB5
    .byte $00 ; |        | $BFB6
    .byte $00 ; |        | $BFB7
    .byte $00 ; |        | $BFB8
    .byte $00 ; |        | $BFB9
    .byte $00 ; |        | $BFBA
    .byte $00 ; |        | $BFBB
    .byte $00 ; |        | $BFBC
    .byte $00 ; |        | $BFBD
    .byte $00 ; |        | $BFBE
    .byte $00 ; |        | $BFBF
    .byte $00 ; |        | $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $00 ; |        | $BFC3
    .byte $00 ; |        | $BFC4
    .byte $00 ; |        | $BFC5
    .byte $00 ; |        | $BFC6
    .byte $00 ; |        | $BFC7
    .byte $00 ; |        | $BFC8
    .byte $00 ; |        | $BFC9
    .byte $00 ; |        | $BFCA
    .byte $00 ; |        | $BFCB
    .byte $00 ; |        | $BFCC
    .byte $00 ; |        | $BFCD
    .byte $00 ; |        | $BFCE
    .byte $00 ; |        | $BFCF
    .byte $00 ; |        | $BFD0
    .byte $00 ; |        | $BFD1
    .byte $00 ; |        | $BFD2
    .byte $00 ; |        | $BFD3
    .byte $00 ; |        | $BFD4
    .byte $00 ; |        | $BFD5
    .byte $00 ; |        | $BFD6
    .byte $00 ; |        | $BFD7
    .byte $00 ; |        | $BFD8
    .byte $00 ; |        | $BFD9
    .byte $00 ; |        | $BFDA
    .byte $00 ; |        | $BFDB
    .byte $00 ; |        | $BFDC
    .byte $00 ; |        | $BFDD
    .byte $00 ; |        | $BFDE
    .byte $00 ; |        | $BFDF
    .byte $00 ; |        | $BFE0
    .byte $00 ; |        | $BFE1
    .byte $00 ; |        | $BFE2
    .byte $00 ; |        | $BFE3
    .byte $00 ; |        | $BFE4
    .byte $00 ; |        | $BFE5
    .byte $00 ; |        | $BFE6
    .byte $00 ; |        | $BFE7
    .byte $00 ; |        | $BFE8
    .byte $00 ; |        | $BFE9
LBFEA:
    jmp    LBFEA                 ; 3

    jmp    LB9C1                 ; 3

LBFF0:
    sta    LBFF8                 ; 4
LBFF3:
    jmp    LBFF3                 ; 3

    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
LBFF8:
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9
    .byte $00 ; |        | $BFFA
    .byte $00 ; |        | $BFFB
    .byte $00 ; |        | $BFFC
    .byte $D1 ; |XX X   X| $BFFD
    .byte $00 ; |        | $BFFE
    .byte $00 ; |        | $BFFF

      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $D000
      

LD000:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD00B:
    .byte $00
LD00C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD017:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD023:
    .byte $00
LD024:
    .byte $00
LD025:
    .byte $00
LD026:
    .byte $00
LD027:
    .byte $00
LD028:
    .byte $00
LD029:
    .byte $00
LD02A:
    .byte $00
LD02B:
    .byte $00
LD02C:
    .byte $00
LD02D:
    .byte $00
LD02E:
    .byte $00
LD02F:
    .byte $00
LD030:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LD044:
    .byte $00
LD045:
    .byte $00,$00,$00,$00
LD049:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD057:
    .byte $00
LD058:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LD06C:
    .byte $00
LD06D:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00
LD080:
    .byte $00
LD081:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD08C:
    .byte $00
LD08D:
    .byte $00
LD08E:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00
LD097:
    .byte $00
LD098:
    .byte $00
LD099:
    .byte $00
LD09A:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD0A4:
    .byte $00
LD0A5:
    .byte $00
LD0A6:
    .byte $00
LD0A7:
    .byte $00
LD0A8:
    .byte $00
LD0A9:
    .byte $00
LD0AA:
    .byte $00
LD0AB:
    .byte $00
LD0AC:
    .byte $00
LD0AD:
    .byte $00
LD0AE:
    .byte $00
LD0AF:
    .byte $00
LD0B0:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00
LD0C3:
    .byte $00
LD0C4:
    .byte $00
LD0C5:
    .byte $00,$00,$00,$00
LD0C9:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LD0D7:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00

START:
    lda    #1                    ; 2
    nop                          ; 2
    sei                          ; 2
    cld                          ; 2
    ldx    #$DE                  ; 2
    txs                          ; 2
    ldx    #$FF                  ; 2
    lda    #0                    ; 2
LD10C:
    sta    WSYNC,X               ; 4
    sta    $F000,X               ; 5
    dex                          ; 2
    bne    LD10C                 ; 2³
    inx                          ; 2
    stx    CTRLPF                ; 3
    lda    #$FE                  ; 2
    sta    $F9                   ; 3
    ldx    #$4F                  ; 2
LD11D:
    lda    LDF4F,X               ; 4
    sta    $8B,X                 ; 4
    dex                          ; 2
    bpl    LD11D                 ; 2³
    lda    #$0E                  ; 2
    sta    $FE                   ; 3
    lda    #3                    ; 2
    sta    $FF                   ; 3
    jsr    LDA10                 ; 6
LD130:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$40                  ; 2
    sta    TIM64T                ; 4
    jsr    LDA9D                 ; 6
    bne    LD19A                 ; 2³
    jsr    LDB32                 ; 6
    jsr    LDBC0                 ; 6
    lda    $8A                   ; 3
    bmi    LD19A                 ; 2³
    bit    $83                   ; 3
    bvs    LD19A                 ; 2³
    lda    $8A                   ; 3
    and    #$18                  ; 2
    beq    LD19A                 ; 2³
    ldx    #$38                  ; 2
    and    #$08                  ; 2
    beq    LD168                 ; 2³
    ldx    #$48                  ; 2
LD168:
    lda    #3                    ; 2
    sta    $F6                   ; 3
LD16C:
    lda    $8B,X                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $FE                   ; 3
    sec                          ; 2
    sbc    LDFBE,Y               ; 4
    sta    $FE                   ; 3
    lda    $8B,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $FE                   ; 3
    sec                          ; 2
    sbc    LDFBE,Y               ; 4
    sta    $FE                   ; 3
    inx                          ; 2
    dec    $F6                   ; 5
    bpl    LD16C                 ; 2³
    cpx    #$3C                  ; 2
    bne    LD197                 ; 2³
    jsr    LD549                 ; 6
    jmp    LD19A                 ; 3

LD197:
    jsr    LD59D                 ; 6
LD19A:
    inc    $84                   ; 5
    jmp    LD200                 ; 3

    .byte $00 ; |        | $D19F
    .byte $00 ; |        | $D1A0
    .byte $00 ; |        | $D1A1
    .byte $00 ; |        | $D1A2
    .byte $00 ; |        | $D1A3
    .byte $00 ; |        | $D1A4
    .byte $00 ; |        | $D1A5
    .byte $00 ; |        | $D1A6
    .byte $00 ; |        | $D1A7
    .byte $00 ; |        | $D1A8
    .byte $00 ; |        | $D1A9
    .byte $00 ; |        | $D1AA
    .byte $00 ; |        | $D1AB
    .byte $00 ; |        | $D1AC
    .byte $00 ; |        | $D1AD
    .byte $00 ; |        | $D1AE
    .byte $00 ; |        | $D1AF
    .byte $00 ; |        | $D1B0
    .byte $00 ; |        | $D1B1
    .byte $00 ; |        | $D1B2
    .byte $00 ; |        | $D1B3
    .byte $00 ; |        | $D1B4
    .byte $00 ; |        | $D1B5
    .byte $00 ; |        | $D1B6
    .byte $00 ; |        | $D1B7
    .byte $00 ; |        | $D1B8
    .byte $00 ; |        | $D1B9
    .byte $00 ; |        | $D1BA
    .byte $00 ; |        | $D1BB
    .byte $00 ; |        | $D1BC
    .byte $00 ; |        | $D1BD
    .byte $00 ; |        | $D1BE
    .byte $00 ; |        | $D1BF
    .byte $00 ; |        | $D1C0
    .byte $00 ; |        | $D1C1
    .byte $00 ; |        | $D1C2
    .byte $00 ; |        | $D1C3
    .byte $00 ; |        | $D1C4
    .byte $00 ; |        | $D1C5
    .byte $00 ; |        | $D1C6
    .byte $00 ; |        | $D1C7
    .byte $00 ; |        | $D1C8
    .byte $00 ; |        | $D1C9
    .byte $00 ; |        | $D1CA
    .byte $00 ; |        | $D1CB
    .byte $00 ; |        | $D1CC
    .byte $00 ; |        | $D1CD
    .byte $00 ; |        | $D1CE
    .byte $00 ; |        | $D1CF
    .byte $00 ; |        | $D1D0
    .byte $00 ; |        | $D1D1
    .byte $00 ; |        | $D1D2
    .byte $00 ; |        | $D1D3
    .byte $00 ; |        | $D1D4
    .byte $00 ; |        | $D1D5
    .byte $00 ; |        | $D1D6
    .byte $00 ; |        | $D1D7
    .byte $00 ; |        | $D1D8
    .byte $00 ; |        | $D1D9
    .byte $00 ; |        | $D1DA
    .byte $00 ; |        | $D1DB
    .byte $00 ; |        | $D1DC
    .byte $00 ; |        | $D1DD
    .byte $00 ; |        | $D1DE
    .byte $00 ; |        | $D1DF
    .byte $00 ; |        | $D1E0
    .byte $00 ; |        | $D1E1
    .byte $00 ; |        | $D1E2
    .byte $00 ; |        | $D1E3
    .byte $00 ; |        | $D1E4
    .byte $00 ; |        | $D1E5
    .byte $00 ; |        | $D1E6
    .byte $00 ; |        | $D1E7
    .byte $00 ; |        | $D1E8
    .byte $00 ; |        | $D1E9
    .byte $00 ; |        | $D1EA
    .byte $00 ; |        | $D1EB
    .byte $00 ; |        | $D1EC
    .byte $00 ; |        | $D1ED
    .byte $00 ; |        | $D1EE
    .byte $00 ; |        | $D1EF
    .byte $00 ; |        | $D1F0
    .byte $00 ; |        | $D1F1
    .byte $00 ; |        | $D1F2
    .byte $00 ; |        | $D1F3
    .byte $00 ; |        | $D1F4
    .byte $00 ; |        | $D1F5
    .byte $00 ; |        | $D1F6
    .byte $00 ; |        | $D1F7
    .byte $00 ; |        | $D1F8
    .byte $00 ; |        | $D1F9
    .byte $00 ; |        | $D1FA
    .byte $00 ; |        | $D1FB
    .byte $00 ; |        | $D1FC
    .byte $00 ; |        | $D1FD
    .byte $00 ; |        | $D1FE
    .byte $00 ; |        | $D1FF
LD200:
    lda    #$0D                  ; 2
    sta    $EA                   ; 3
    lda    #$D2                  ; 2
    sta    $EB                   ; 3
    lda    $F0A4                 ; 4
    ldy    #0                    ; 2
    cmp    $F0A5                 ; 4
    bcc    LD219                 ; 2³
    ldx    $F0A5                 ; 4
    sta    $F025                 ; 4
    txa                          ; 2
LD219:
    cmp    $F0A6                 ; 4
    bcc    LD225                 ; 2³
    ldx    $F0A6                 ; 4
    sta    $F026                 ; 4
    txa                          ; 2
LD225:
    cmp    $F0A7                 ; 4
    bcc    LD231                 ; 2³
    ldx    $F0A7                 ; 4
    sta    $F027                 ; 4
    txa                          ; 2
LD231:
    cmp    $F0A8                 ; 4
    bcc    LD23D                 ; 2³
    ldx    $F0A8                 ; 4
    sta    $F028                 ; 4
    txa                          ; 2
LD23D:
    cmp    $F0A9                 ; 4
    bcc    LD249                 ; 2³
    ldx    $F0A9                 ; 4
    sta    $F029                 ; 4
    txa                          ; 2
LD249:
    cmp    $F0AA                 ; 4
    bcc    LD255                 ; 2³
    ldx    $F0AA                 ; 4
    sta    $F02A                 ; 4
    txa                          ; 2
LD255:
    cmp    $F0AB                 ; 4
    bcc    LD261                 ; 2³
    ldx    $F0AB                 ; 4
    sta    $F02B                 ; 4
    txa                          ; 2
LD261:
    cmp    $F0AC                 ; 4
    bcc    LD26D                 ; 2³
    ldx    $F0AC                 ; 4
    sta    $F02C                 ; 4
    txa                          ; 2
LD26D:
    cmp    $F0AD                 ; 4
    bcc    LD279                 ; 2³
    ldx    $F0AD                 ; 4
    sta    $F02D                 ; 4
    txa                          ; 2
LD279:
    cmp    $F0AE                 ; 4
    bcc    LD285                 ; 2³
    ldx    $F0AE                 ; 4
    sta    $F02E                 ; 4
    txa                          ; 2
LD285:
    cmp    $F0AF                 ; 4
    bcc    LD292                 ; 2³
    ldx    $F0AF                 ; 4
    sta    $F02F                 ; 4
    txa                          ; 2
    clc                          ; 2
LD292:
    sta    $F024,Y               ; 5
    lda    LDE53,Y               ; 4
    adc    $EA                   ; 3
    sta    $EA                   ; 3
    iny                          ; 2
    lda    $F0A4,Y               ; 4
    jmp.ind ($00EA)              ; 5

    ldy    #$0B                  ; 2
    sty    $F0                   ; 3
    lda    #$FF                  ; 2
    sta    $EA                   ; 3
    sta    $F5                   ; 3
LD2AD:
    lda    INTIM                 ; 4
    cmp    #5                    ; 2
    bcs    LD2B7                 ; 2³
    jmp    LD4AA                 ; 3

LD2B7:
    ldx    $EA                   ; 3
    bpl    LD2D2                 ; 2³
    lda    $F0A4,Y               ; 4
    cmp    #$FF                  ; 2
    bne    LD2C8                 ; 2³
    dec    $F0                   ; 5
    ldy    $F0                   ; 3
    bpl    LD2AD                 ; 2³
LD2C8:
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F08C,X               ; 4
    and    #$40                  ; 2
    sta    $EF                   ; 3
LD2D2:
    lda    #$FF                  ; 2
    sta    $EA                   ; 3
    lda    $F08C,X               ; 4
    and    #$1F                  ; 2
    cmp    #$1F                  ; 2
    bne    LD2E2                 ; 2³
    jmp    LD494                 ; 3

LD2E2:
    tay                          ; 2
    lda    #0                    ; 2
    cmp    $F0B0,Y               ; 4
    beq    LD2ED                 ; 2³
    jmp    LD3EF                 ; 3

LD2ED:
    lda    $F08D,X               ; 4
    bmi    LD2F5                 ; 2³
LD2F2:
    jmp    LD3DC                 ; 3

LD2F5:
    cmp    #$FF                  ; 2
    beq    LD2F2                 ; 2³
    and    #$1F                  ; 2
    sta    $EB                   ; 3
    lda    $F099,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bne    LD2F2                 ; 2³+1
    cpy    $EB                   ; 3
    beq    LD311                 ; 2³
    inx                          ; 2
    stx    $EA                   ; 3
    dex                          ; 2
    jmp    LD3DC                 ; 3

LD311:
    lda    $F08E,X               ; 4
    bpl    LD331                 ; 2³
    cmp    #$FF                  ; 2
    beq    LD331                 ; 2³
    and    #$1F                  ; 2
    sta    $EB                   ; 3
    lda    $F09A,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bne    LD331                 ; 2³
    cpy    $EB                   ; 3
    beq    LD34F                 ; 2³
    inx                          ; 2
    inx                          ; 2
    stx    $EA                   ; 3
    dex                          ; 2
    dex                          ; 2
LD331:
    lda    $F08D,X               ; 4
    clc                          ; 2
    and    #$20                  ; 2
    beq    LD33B                 ; 2³
    lda    #$FC                  ; 2
LD33B:
    adc    $F081,X               ; 4
    bpl    LD342                 ; 2³
    lda    #0                    ; 2
LD342:
    and    #$7F                  ; 2
    sta    $F058,Y               ; 5
    lda    #$1B                  ; 2
    sta    $F030,Y               ; 5
    jmp    LD471                 ; 3

LD34F:
    lda    $F0C4,Y               ; 4
    and    #$7F                  ; 2
    beq    LD359                 ; 2³
    jmp    LD49C                 ; 3

LD359:
    stx    $EC                   ; 3
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    lda    #0                    ; 2
    sta    $ED                   ; 3
LD362:
    lda    $F08C,X               ; 4
    bpl    LD387                 ; 2³
    cmp    #$FF                  ; 2
    beq    LD387                 ; 2³
    and    #$1F                  ; 2
    sta    $EB                   ; 3
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bne    LD387                 ; 2³
    cpy    $EB                   ; 3
    beq    LD381                 ; 2³
    stx    $EA                   ; 3
    jmp    LD387                 ; 3

LD381:
    inx                          ; 2
    inc    $ED                   ; 5
    jmp    LD362                 ; 3

LD387:
    dex                          ; 2
    lda    $F080,X               ; 4
    sta    $EE                   ; 3
    ldx    $EC                   ; 3
    lda    $F08C,X               ; 4
    and    #$20                  ; 2
    beq    LD39B                 ; 2³
    lda    $F080,X               ; 4
    sta    $EE                   ; 3
LD39B:
    lda    $EE                   ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    ldx    $ED                   ; 3
    adc    LD3D5,X               ; 4
    sta    $F058,Y               ; 5
    adc    #8                    ; 2
    sta    $F06C,Y               ; 5
    lda    LD3CE,X               ; 4
    sta    $F030,Y               ; 5
    lda    LD3CC,X               ; 4
    ora    $F0C4,Y               ; 4
    sta    $F044,Y               ; 5
    lda    LD3D5,X               ; 4
    beq    LD3C9                 ; 2³
    lda    $EE                   ; 3
    and    #$7F                  ; 2
    sta    $F6                   ; 3
    sty    $F5                   ; 3
LD3C9:
    jmp    LD471                 ; 3

LD3CC:
    .byte $1A ; |   XX X | $D3CC
    .byte $1B ; |   XX XX| $D3CD
LD3CE:
    .byte $1B ; |   XX XX| $D3CE
    .byte $1B ; |   XX XX| $D3CF
    .byte $1B ; |   XX XX| $D3D0
    .byte $2B ; |  X X XX| $D3D1
    .byte $2B ; |  X X XX| $D3D2
    .byte $2B ; |  X X XX| $D3D3
    .byte $2B ; |  X X XX| $D3D4
LD3D5:
    .byte $00 ; |        | $D3D5
    .byte $00 ; |        | $D3D6
    .byte $04 ; |     X  | $D3D7
    .byte $00 ; |        | $D3D8
    .byte $04 ; |     X  | $D3D9
    .byte $00 ; |        | $D3DA
    .byte $04 ; |     X  | $D3DB
LD3DC:
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    sta    $F030,Y               ; 5
    lda    $F080,X               ; 4
    and    #$7F                  ; 2
    sta    $F058,Y               ; 5
    jmp    LD471                 ; 3

LD3EF:
    lda    $F0C4,Y               ; 4
    and    #$7F                  ; 2
    beq    LD3F9                 ; 2³
    jmp    LD49C                 ; 3

LD3F9:
    lda    $F08D,X               ; 4
    bpl    LD45E                 ; 2³+1
    cmp    #$FF                  ; 2
    beq    LD45E                 ; 2³
    and    #$1F                  ; 2
    sta    $EB                   ; 3
    lda    $F099,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bne    LD45E                 ; 2³
    cpy    $EB                   ; 3
    beq    LD41D                 ; 2³
    inx                          ; 2
    stx    $EA                   ; 3
    dex                          ; 2
    jmp    LD45E                 ; 3

    jmp    LD3DC                 ; 3

LD41D:
    lda    $F08E,X               ; 4
    bpl    LD43D                 ; 2³
    cmp    #$FF                  ; 2
    beq    LD43D                 ; 2³
    and    #$1F                  ; 2
    sta    $EB                   ; 3
    lda    $F09A,X               ; 4
    and    #$7F                  ; 2
    cmp    #$1A                  ; 2
    bne    LD43D                 ; 2³
    cpy    $EB                   ; 3
    beq    LD49C                 ; 2³
    inx                          ; 2
    inx                          ; 2
    stx    $EA                   ; 3
    dex                          ; 2
    dex                          ; 2
LD43D:
    lda    $F08D,X               ; 4
    clc                          ; 2
    and    #$20                  ; 2
    beq    LD447                 ; 2³
    lda    #$FC                  ; 2
LD447:
    adc    $F081,X               ; 4
    bpl    LD44E                 ; 2³
    lda    #0                    ; 2
LD44E:
    and    #$7F                  ; 2
    sta    $F06C,Y               ; 5
    lda    #$1B                  ; 2
    ora    $F0C4,Y               ; 4
    sta    $F044,Y               ; 5
    jmp    LD471                 ; 3

LD45E:
    lda    $F098,X               ; 4
    and    #$7F                  ; 2
    ora    $F0C4,Y               ; 4
    sta    $F044,Y               ; 5
    lda    $F080,X               ; 4
    and    #$7F                  ; 2
    sta    $F06C,Y               ; 5
LD471:
    ldx    $EA                   ; 3
    bmi    LD484                 ; 2³
    lda    $F08C,X               ; 4
    and    #$40                  ; 2
    cmp    $EF                   ; 3
    beq    LD499                 ; 2³
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $F02F                 ; 4
LD484:
    ldy    $F0                   ; 3
    lda    $F0A4,Y               ; 4
    bpl    LD48F                 ; 2³
    lda    #$FF                  ; 2
    bmi    LD491                 ; 2³
LD48F:
    and    #$0F                  ; 2
LD491:
    sta    $F024,Y               ; 5
LD494:
    dey                          ; 2
LD495:
    sty    $F0                   ; 3
    bmi    LD4AA                 ; 2³
LD499:
    jmp    LD2AD                 ; 3

LD49C:
    ldy    $F0                   ; 3
    lda    $F0A4,Y               ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $F024,Y               ; 5
    dey                          ; 2
    bpl    LD495                 ; 2³
LD4AA:
    lda    INTIM                 ; 4
    cmp    #3                    ; 2
    bcs    LD4B4                 ; 2³
    jmp    LDFEA                 ; 3

LD4B4:
    lda    $FA                   ; 3
    and    #$F0                  ; 2
    bne    LD4BD                 ; 2³
    jmp    LD53C                 ; 3

LD4BD:
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDEA7,X               ; 4
    sta    $F1                   ; 3
    tay                          ; 2
    asl                          ; 2
    adc    $F1                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    $FB                   ; 3
    tax                          ; 2
    lda    LDEE3,X               ; 4
    sta    $EA                   ; 3
    cpy    #$13                  ; 2
    bne    LD4DD                 ; 2³
    dey                          ; 2
LD4DD:
    lda    $F0C4,Y               ; 4
    and    #$7F                  ; 2
    bne    LD4EB                 ; 2³
    lda    $F0C5,Y               ; 4
    and    #$7F                  ; 2
    beq    LD500                 ; 2³+1
LD4EB:
    lda    $84                   ; 3
    lsr                          ; 2
    bcc    LD53C                 ; 2³+1
    lda    $F0C4,Y               ; 4
    and    #$80                  ; 2
    sta    $F044,Y               ; 5
    lda    $F0C5,Y               ; 4
    and    #$80                  ; 2
    sta    $F045,Y               ; 5
LD500:
    lda    $84                   ; 3
    and    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    #$7E                  ; 2
    sta    $F06C,Y               ; 5
    lda    $FA                   ; 3
    and    #$70                  ; 2
    tax                          ; 2
    lda    $84                   ; 3
    and    #$04                  ; 2
    lsr                          ; 2
    adc    #$1E                  ; 2
    cpx    #$70                  ; 2
    bne    LD526                 ; 2³
    clc                          ; 2
    adc    #$10                  ; 2
    inc    $EA                   ; 5
    inc    $EA                   ; 5
    inc    $EA                   ; 5
    inc    $EA                   ; 5
LD526:
    ora    $F0C4,Y               ; 4
    sta    $F044,Y               ; 5
    and    #$7F                  ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    ora    $F0C5,Y               ; 4
    sta    $F045,Y               ; 5
    lda    $EA                   ; 3
    sta    $F06D,Y               ; 5
LD53C:
    lda    INTIM                 ; 4
    cmp    #8                    ; 2
    bcc    LD546                 ; 2³
    jsr    LD6AA                 ; 6
LD546:
    jmp    LDFEA                 ; 3

LD549:
    ldy    #0                    ; 2
    ldx    #$13                  ; 2
LD54D:
    lda.wy $8F,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda.wy $90,Y                 ; 4
    sta.wy $8C,Y                 ; 5
    lda.wy $91,Y                 ; 4
    sta.wy $8D,Y                 ; 5
    lda.wy $92,Y                 ; 4
    sta.wy $8E,Y                 ; 5
    lda    $F0C3,X               ; 4
    bpl    LD571                 ; 2³
    lda    $F0C4,X               ; 4
    ora    #$80                  ; 2
    bmi    LD576                 ; 2³
LD571:
    lda    $F0C4,X               ; 4
    and    #$7F                  ; 2
LD576:
    sta    $F044,X               ; 5
    dex                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpy    #$48                  ; 2
    bne    LD54D                 ; 2³
    lda    $F0C4                 ; 4
    and    #$7F                  ; 2
    sta    $F044                 ; 4
    lda    #0                    ; 2
    sta    $D3                   ; 3
    sta    $D4                   ; 3
    sta    $D5                   ; 3
    sta    $D6                   ; 3
    lda    $8A                   ; 3
    eor    #$01                  ; 2
    and    #$EF                  ; 2
    sta    $8A                   ; 3
    rts                          ; 6

LD59D:
    ldx    #3                    ; 2
LD59F:
    lda    $BF,X                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $FE                   ; 3
    clc                          ; 2
    adc    LDFBE,Y               ; 4
    sta    $FE                   ; 3
    lda    $BF,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    lda    $FE                   ; 3
    adc    LDFBE,Y               ; 4
    sta    $FE                   ; 3
    dex                          ; 2
    bpl    LD59F                 ; 2³
    ldy    #$48                  ; 2
    ldx    #0                    ; 2
LD5C2:
    lda.wy $87,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda.wy $88,Y                 ; 4
    sta.wy $8C,Y                 ; 5
    lda.wy $89,Y                 ; 4
    sta.wy $8D,Y                 ; 5
    lda.wy $8A,Y                 ; 4
    sta.wy $8E,Y                 ; 5
    lda    $F0C5,X               ; 4
    bpl    LD5E6                 ; 2³
    lda    $F0C4,X               ; 4
    ora    #$80                  ; 2
    bmi    LD5EB                 ; 2³
LD5E6:
    lda    $F0C4,X               ; 4
    and    #$7F                  ; 2
LD5EB:
    sta    $F044,X               ; 5
    inx                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bne    LD5C2                 ; 2³
    lda    $F0D7                 ; 4
    and    #$7F                  ; 2
    sta    $F057                 ; 4
    lda    $F0C9                 ; 4
    and    #$7F                  ; 2
    sta    $F049                 ; 4
    lda    $85                   ; 3
    adc    $84                   ; 3
    tay                          ; 2
    adc    $86                   ; 3
    adc    LD65E,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LD65A,Y               ; 4
    and    LD65B,X               ; 4
    sta    $8B                   ; 3
    lda    LD65B,Y               ; 4
    and    LD65C,X               ; 4
    sta    $8C                   ; 3
    lda    LD65C,Y               ; 4
    and    LD65D,X               ; 4
    sta    $8D                   ; 3
    lda    LD65D,Y               ; 4
    and    LD65E,X               ; 4
    sta    $8E                   ; 3
    lda    $FA                   ; 3
    and    #$07                  ; 2
    cmp    #4                    ; 2
    beq    LD652                 ; 2³
    inc    $FA                   ; 5
    adc    $B1                   ; 3
    adc    $BC                   ; 3
    adc    $ED                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    ldx    LD67E,Y               ; 4
    lda    LD66E,Y               ; 4
    ora    $8B,X                 ; 4
    and    LD68E,Y               ; 4
    sta    $8B,X                 ; 4
LD652:
    lda    $8A                   ; 3
    eor    #$01                  ; 2
    and    #$F7                  ; 2
    sta    $8A                   ; 3
LD65A:
    rts                          ; 6

LD65B:
    .byte $50 ; | X X    | $D65B
LD65C:
    .byte $55 ; | X X X X| $D65C
LD65D:
    .byte $10 ; |   X    | $D65D
LD65E:
    .byte $15 ; |   X X X| $D65E
    .byte $41 ; | X     X| $D65F
    .byte $44 ; | X   X  | $D660
    .byte $05 ; |     X X| $D661
    .byte $54 ; | X X X  | $D662
    .byte $40 ; | X      | $D663
    .byte $14 ; |   X X  | $D664
    .byte $04 ; |     X  | $D665
    .byte $51 ; | X X   X| $D666
    .byte $45 ; | X   X X| $D667
    .byte $11 ; |   X   X| $D668
    .byte $01 ; |       X| $D669
    .byte $00 ; |        | $D66A
    .byte $55 ; | X X X X| $D66B
    .byte $10 ; |   X    | $D66C
    .byte $50 ; | X X    | $D66D
LD66E:
    .byte $80 ; |X       | $D66E
    .byte $20 ; |  X     | $D66F
    .byte $08 ; |    X   | $D670
    .byte $80 ; |X       | $D671
    .byte $80 ; |X       | $D672
    .byte $20 ; |  X     | $D673
    .byte $08 ; |    X   | $D674
    .byte $80 ; |X       | $D675
    .byte $80 ; |X       | $D676
    .byte $20 ; |  X     | $D677
    .byte $08 ; |    X   | $D678
    .byte $80 ; |X       | $D679
    .byte $80 ; |X       | $D67A
    .byte $20 ; |  X     | $D67B
    .byte $08 ; |    X   | $D67C
    .byte $80 ; |X       | $D67D
LD67E:
    .byte $00 ; |        | $D67E
    .byte $00 ; |        | $D67F
    .byte $00 ; |        | $D680
    .byte $00 ; |        | $D681
    .byte $01 ; |       X| $D682
    .byte $01 ; |       X| $D683
    .byte $01 ; |       X| $D684
    .byte $01 ; |       X| $D685
    .byte $02 ; |      X | $D686
    .byte $02 ; |      X | $D687
    .byte $02 ; |      X | $D688
    .byte $02 ; |      X | $D689
    .byte $03 ; |      XX| $D68A
    .byte $03 ; |      XX| $D68B
    .byte $03 ; |      XX| $D68C
    .byte $03 ; |      XX| $D68D
LD68E:
    .byte $8F ; |X   XXXX| $D68E
    .byte $E3 ; |XXX   XX| $D68F
    .byte $F8 ; |XXXXX   | $D690
    .byte $8F ; |X   XXXX| $D691
    .byte $8F ; |X   XXXX| $D692
    .byte $E3 ; |XXX   XX| $D693
    .byte $F8 ; |XXXXX   | $D694
    .byte $8F ; |X   XXXX| $D695
    .byte $8F ; |X   XXXX| $D696
    .byte $E3 ; |XXX   XX| $D697
    .byte $F8 ; |XXXXX   | $D698
    .byte $8F ; |X   XXXX| $D699
    .byte $8F ; |X   XXXX| $D69A
    .byte $E3 ; |XXX   XX| $D69B
    .byte $F8 ; |XXXXX   | $D69C
    .byte $8F ; |X   XXXX| $D69D
LD69E:
    dec    $EE                   ; 5
    jmp    LD6D3                 ; 3

LD6A3:
    lda    $83                   ; 3
    and    #$EF                  ; 2
    sta    $83                   ; 3
    rts                          ; 6

LD6AA:
    lda    $83                   ; 3
    and    #$10                  ; 2
    bne    LD6B1                 ; 2³
    rts                          ; 6

LD6B1:
    lda    $E4                   ; 3
    bpl    LD6CB                 ; 2³
    lda    #$13                  ; 2
    sta    $E4                   ; 3
    lda    $E3                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    bmi    LD6A3                 ; 2³
    sta    $E3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    $8A                   ; 3
    lsr                          ; 2
    bcs    LD6CB                 ; 2³
    dec    $E4                   ; 5
LD6CB:
    lda    #0                    ; 2
    sta    $EF                   ; 3
    lda    #6                    ; 2
    sta    $EE                   ; 3
LD6D3:
    ldy    $EE                   ; 3
    lda    $E4                   ; 3
    clc                          ; 2
    adc    LD769,Y               ; 4
    bmi    LD69E                 ; 2³
    sta    $EA                   ; 3
    lda    $E3                   ; 3
    clc                          ; 2
    adc    LD770,Y               ; 4
    bmi    LD69E                 ; 2³
    sta    $EB                   ; 3
    lda    $EA                   ; 3
    eor    $8A                   ; 3
    lsr                          ; 2
    lda    #0                    ; 2
    bcs    LD6F4                 ; 2³
    lda    #5                    ; 2
LD6F4:
    adc    $EB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $EA                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$51                  ; 2
    sec                          ; 2
    sbc    LDEEF,X               ; 4
    tay                          ; 2
    lda.wy $8B,Y                 ; 4
    and    LDF0F,X               ; 4
    dec    $EE                   ; 5
    bmi    LD71A                 ; 2³
    cmp    #0                    ; 2
    beq    LD6D3                 ; 2³+1
    inc    $EF                   ; 5
    jmp    LD6D3                 ; 3

LD71A:
    cmp    #0                    ; 2
    bne    LD737                 ; 2³
    lda    $EF                   ; 3
    cmp    #2                    ; 2
    bne    LD764                 ; 2³
    lda    LDF2F,X               ; 4
    ora.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    LD764                 ; 2³
    inc    $FE                   ; 5
    bne    LD764                 ; 2³
LD737:
    cmp    #$40                  ; 2
    beq    LD747                 ; 2³
    cmp    #$10                  ; 2
    beq    LD747                 ; 2³
    cmp    #4                    ; 2
    beq    LD747                 ; 2³
    cmp    #1                    ; 2
    bne    LD764                 ; 2³
LD747:
    lda    $EF                   ; 3
    cmp    #2                    ; 2
    bcc    LD751                 ; 2³
    cmp    #4                    ; 2
    bcc    LD764                 ; 2³
LD751:
    lda    LDF2F,X               ; 4
    eor    #$FF                  ; 2
    and.wy $8B,Y                 ; 4
    sta.wy $8B,Y                 ; 5
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bcs    LD764                 ; 2³
    dec    $FE                   ; 5
LD764:
    dec    $E4                   ; 5
    dec    $E4                   ; 5
    rts                          ; 6

LD769:
    .byte $00 ; |        | $D769
    .byte $01 ; |       X| $D76A
    .byte $00 ; |        | $D76B
    .byte $FF ; |XXXXXXXX| $D76C
    .byte $FF ; |XXXXXXXX| $D76D
    .byte $00 ; |        | $D76E
    .byte $01 ; |       X| $D76F
LD770:
    .byte $00 ; |        | $D770
    .byte $04 ; |     X  | $D771
    .byte $08 ; |    X   | $D772
    .byte $04 ; |     X  | $D773
    .byte $FC ; |XXXXXX  | $D774
    .byte $F8 ; |XXXXX   | $D775
    .byte $FC ; |XXXXXX  | $D776
LD777:
    ldx    #$48                  ; 2
    stx    TIM64T                ; 4
    jmp    LDFF0                 ; 3

    .byte $00 ; |        | $D77F
    .byte $00 ; |        | $D780
    .byte $00 ; |        | $D781
    .byte $00 ; |        | $D782
    .byte $00 ; |        | $D783
    .byte $00 ; |        | $D784
    .byte $00 ; |        | $D785
    .byte $00 ; |        | $D786
    .byte $00 ; |        | $D787
    .byte $00 ; |        | $D788
    .byte $00 ; |        | $D789
    .byte $00 ; |        | $D78A
    .byte $00 ; |        | $D78B
    .byte $00 ; |        | $D78C
    .byte $00 ; |        | $D78D
    .byte $00 ; |        | $D78E
    .byte $00 ; |        | $D78F
    .byte $00 ; |        | $D790
    .byte $00 ; |        | $D791
    .byte $00 ; |        | $D792
    .byte $00 ; |        | $D793
    .byte $00 ; |        | $D794
    .byte $00 ; |        | $D795
    .byte $00 ; |        | $D796
    .byte $00 ; |        | $D797
    .byte $00 ; |        | $D798
    .byte $00 ; |        | $D799
    .byte $00 ; |        | $D79A
    .byte $00 ; |        | $D79B
    .byte $00 ; |        | $D79C
    .byte $00 ; |        | $D79D
    .byte $00 ; |        | $D79E
    .byte $00 ; |        | $D79F
    .byte $00 ; |        | $D7A0
    .byte $00 ; |        | $D7A1
    .byte $00 ; |        | $D7A2
    .byte $00 ; |        | $D7A3
    .byte $00 ; |        | $D7A4
    .byte $00 ; |        | $D7A5
    .byte $00 ; |        | $D7A6
    .byte $00 ; |        | $D7A7
    .byte $00 ; |        | $D7A8
    .byte $00 ; |        | $D7A9
    .byte $00 ; |        | $D7AA
    .byte $00 ; |        | $D7AB
    .byte $00 ; |        | $D7AC
    .byte $00 ; |        | $D7AD
    .byte $00 ; |        | $D7AE
    .byte $00 ; |        | $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $00 ; |        | $D7B2
    .byte $00 ; |        | $D7B3
    .byte $00 ; |        | $D7B4
    .byte $00 ; |        | $D7B5
    .byte $00 ; |        | $D7B6
    .byte $00 ; |        | $D7B7
    .byte $00 ; |        | $D7B8
    .byte $00 ; |        | $D7B9
    .byte $00 ; |        | $D7BA
    .byte $00 ; |        | $D7BB
    .byte $00 ; |        | $D7BC
    .byte $00 ; |        | $D7BD
    .byte $00 ; |        | $D7BE
    .byte $00 ; |        | $D7BF
    .byte $00 ; |        | $D7C0
    .byte $00 ; |        | $D7C1
    .byte $00 ; |        | $D7C2
    .byte $00 ; |        | $D7C3
    .byte $00 ; |        | $D7C4
    .byte $00 ; |        | $D7C5
    .byte $00 ; |        | $D7C6
    .byte $00 ; |        | $D7C7
    .byte $00 ; |        | $D7C8
    .byte $00 ; |        | $D7C9
    .byte $00 ; |        | $D7CA
    .byte $00 ; |        | $D7CB
    .byte $00 ; |        | $D7CC
    .byte $00 ; |        | $D7CD
    .byte $00 ; |        | $D7CE
    .byte $00 ; |        | $D7CF
    .byte $00 ; |        | $D7D0
    .byte $00 ; |        | $D7D1
    .byte $00 ; |        | $D7D2
    .byte $00 ; |        | $D7D3
    .byte $00 ; |        | $D7D4
    .byte $00 ; |        | $D7D5
    .byte $00 ; |        | $D7D6
    .byte $00 ; |        | $D7D7
    .byte $00 ; |        | $D7D8
    .byte $00 ; |        | $D7D9
    .byte $00 ; |        | $D7DA
    .byte $00 ; |        | $D7DB
    .byte $00 ; |        | $D7DC
    .byte $00 ; |        | $D7DD
    .byte $00 ; |        | $D7DE
    .byte $00 ; |        | $D7DF
    .byte $00 ; |        | $D7E0
    .byte $00 ; |        | $D7E1
    .byte $00 ; |        | $D7E2
    .byte $00 ; |        | $D7E3
    .byte $00 ; |        | $D7E4
    .byte $00 ; |        | $D7E5
    .byte $00 ; |        | $D7E6
    .byte $00 ; |        | $D7E7
    .byte $00 ; |        | $D7E8
    .byte $00 ; |        | $D7E9
    .byte $00 ; |        | $D7EA
    .byte $00 ; |        | $D7EB
    .byte $00 ; |        | $D7EC
    .byte $00 ; |        | $D7ED
    .byte $00 ; |        | $D7EE
    .byte $00 ; |        | $D7EF
    .byte $00 ; |        | $D7F0
    .byte $00 ; |        | $D7F1
    .byte $00 ; |        | $D7F2
    .byte $00 ; |        | $D7F3
    .byte $00 ; |        | $D7F4
    .byte $00 ; |        | $D7F5
    .byte $00 ; |        | $D7F6
    .byte $00 ; |        | $D7F7
    .byte $00 ; |        | $D7F8
    .byte $00 ; |        | $D7F9
    .byte $00 ; |        | $D7FA
    .byte $00 ; |        | $D7FB
    .byte $00 ; |        | $D7FC
    .byte $00 ; |        | $D7FD
    .byte $00 ; |        | $D7FE
    .byte $00 ; |        | $D7FF
LD800:
    lda    #$DD                  ; 2
    sta    $EB                   ; 3
    sta    $ED                   ; 3
    sta    $EF                   ; 3
    sta    $F1                   ; 3
    sta    $F3                   ; 3
    sta    $F5                   ; 3
    ldx    #$50                  ; 2
    sec                          ; 2
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LD81B                 ; 2³
    lda    #$58                  ; 2
    bne    LD826                 ; 2³
LD81B:
    lda    $80                   ; 3
    and    #$F0                  ; 2
    bne    LD825                 ; 2³
    stx    $EA                   ; 3
    beq    LD828                 ; 2³
LD825:
    lsr                          ; 2
LD826:
    sta    $EA                   ; 3
LD828:
    sta    WSYNC                 ; 3
    sty    COLUBK                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    ENAM0                 ; 3
    lda    $80                   ; 3
    and    #$0F                  ; 2
    bcc    LD840                 ; 2³
    bne    LD840                 ; 2³
    stx    $EC                   ; 3
    beq    LD845                 ; 2³
LD840:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $EC                   ; 3
LD845:
    lda    $81                   ; 3
    and    #$F0                  ; 2
    bcc    LD851                 ; 2³
    bne    LD851                 ; 2³
    stx    $EE                   ; 3
    beq    LD854                 ; 2³
LD851:
    lsr                          ; 2
    sta    $EE                   ; 3
LD854:
    lda    $81                   ; 3
    and    #$0F                  ; 2
    bcc    LD860                 ; 2³
    bne    LD860                 ; 2³
    stx    $F0                   ; 3
    beq    LD865                 ; 2³
LD860:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F0                   ; 3
LD865:
    lda    $82                   ; 3
    and    #$F0                  ; 2
    sta    WSYNC                 ; 3
    lsr                          ; 2
    sta    $F2                   ; 3
    lda    $82                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F4                   ; 3
    sty    COLUPF                ; 3
    lda    $83                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LDE43,X               ; 4
    sta    PF1                   ; 3
    lda    LDE4B,X               ; 4
    sta    PF2                   ; 3
    sty    HMP1                  ; 3
    iny                          ; 2
    sty    VDELP0                ; 3
    sta    $0110                 ; 4
    sta    RESP1                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sty    VDELP1                ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    nop                          ; 2
    sta    HMOVE                 ; 3
    bit    $8A                   ; 3
    bvc    LD8AA                 ; 2³
    lda    $84                   ; 3
    jmp    LD8AE                 ; 3

LD8AA:
    lda    #$7F                  ; 2
    sta    COLUP0                ; 3
LD8AE:
    sta    COLUP0                ; 3
    sta    $0107                 ; 4
    ldx    #$DE                  ; 2
    txs                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$82                  ; 2
    sta    COLUPF                ; 3
    ldy    #6                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$84                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #5                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$86                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #4                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$88                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #3                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$86                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #2                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$84                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #1                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$82                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    ldy    #0                    ; 2
    lda    ($EA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F0),Y               ; 5
    sta    $F6                   ; 3
    lda    ($F2),Y               ; 5
    tax                          ; 2
    lda    ($F4),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    jmp    LD777                 ; 3

LDA10:
    lda    $83                   ; 3
    ora    #$08                  ; 2
    and    #$F8                  ; 2
    sta    $83                   ; 3
    lda    $8A                   ; 3
    and    #$F9                  ; 2
    ora    #$40                  ; 2
    sta    $8A                   ; 3
    bne    LDA77                 ; 2³
LDA22:
    lda    $8A                   ; 3
    and    #$BF                  ; 2
    ora    #$06                  ; 2
    sta    $8A                   ; 3
    ldx    #$4F                  ; 2
LDA2C:
    lda    LDF4F,X               ; 4
    sta    $8B,X                 ; 4
    dex                          ; 2
    bpl    LDA2C                 ; 2³
    lda    #$0E                  ; 2
    sta    $FE                   ; 3
    lda    $E4                   ; 3
    lsr                          ; 2
    lda    #0                    ; 2
    bcs    LDA41                 ; 2³
    sta    $80                   ; 3
LDA41:
    sta    $81                   ; 3
    sta    $82                   ; 3
    sta    $E4                   ; 3
    lda    #2                    ; 2
    sta    $83                   ; 3
    bne    LDA57                 ; 2³
LDA4D:
    lda    $8A                   ; 3
    ora    #$46                  ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $83                   ; 3
LDA57:
    lda    #4                    ; 2
    sta    $FA                   ; 3
    ldx    #0                    ; 2
    stx    $E7                   ; 3
    stx    $E4                   ; 3
    stx    $F017                 ; 4
    ldx    #$0B                  ; 2
    stx    $F02F                 ; 4
    lda    #$3C                  ; 2
    sta    $F00B                 ; 4
    lda    #1                    ; 2
    sta    $F023                 ; 4
    lda    #$B2                  ; 2
    sta    $F7                   ; 3
LDA77:
    ldx    #$13                  ; 2
    lda    #0                    ; 2
LDA7B:
    sta    $F044,X               ; 5
    dex                          ; 2
    bpl    LDA7B                 ; 2³
    stx    $86                   ; 3
    sta    $E3                   ; 3
    sta    $DF                   ; 3
    sta    $E0                   ; 3
    sta    $E1                   ; 3
    ldx    #$0A                  ; 2
    lda    #$FF                  ; 2
LDA8F:
    sta    $F00C,X               ; 5
    sta    $F024,X               ; 5
    dex                          ; 2
    bpl    LDA8F                 ; 2³
    lda    #1                    ; 2
    sta    $87                   ; 3
    rts                          ; 6

LDA9D:
    lda    #0                    ; 2
    sta    $EA                   ; 3
    bit    $8A                   ; 3
    bvc    LDAC5                 ; 2³
    lda    $83                   ; 3
    and    #$08                  ; 2
    beq    LDAC1                 ; 2³
    inc    $E3                   ; 5
    bne    LDAC1                 ; 2³
    lda    $E4                   ; 3
    lsr                          ; 2
    bcs    LDAC1                 ; 2³
    lda    $83                   ; 3
    eor    #$08                  ; 2
    and    #$F8                  ; 2
    sta    $83                   ; 3
    inc    $EA                   ; 5
    jsr    LDA4D                 ; 6
LDAC1:
    bit    INPT4                 ; 3
    bpl    LDB2F                 ; 2³+1
LDAC5:
    lda    $E4                   ; 3
    and    #$F0                  ; 2
    bne    LDB1B                 ; 2³+1
    lsr    SWCHB                 ; 6
    bcs    LDAD9                 ; 2³
    lda    $8A                   ; 3
    ora    #$80                  ; 2
    sta    $8A                   ; 3
    jmp    LDAE3                 ; 3

LDAD9:
    lda    $8A                   ; 3
    bpl    LDAE3                 ; 2³
    and    #$7F                  ; 2
    sta    $8A                   ; 3
    bpl    LDB2F                 ; 2³+1
LDAE3:
    lda    #2                    ; 2
    bit    SWCHB                 ; 4
    bne    LDB1B                 ; 2³+1
    lda    $80                   ; 3
    cmp    #3                    ; 2
    bcs    LDAF2                 ; 2³
    lda    #3                    ; 2
LDAF2:
    sta    $FF                   ; 3
    lda    #0                    ; 2
    sta    $80                   ; 3
    sta    $81                   ; 3
    sta    $82                   ; 3
    lda    #$F1                  ; 2
    sta    $E4                   ; 3
    lda    $8A                   ; 3
    and    #$7F                  ; 2
    ora    #$40                  ; 2
    eor    #$20                  ; 2
    sta    $8A                   ; 3
    lda    $83                   ; 3
    and    #$F8                  ; 2
    sta    $83                   ; 3
    lda    #8                    ; 2
    bit    $83                   ; 3
    bne    LDB1B                 ; 2³
    inc    $EA                   ; 5
    jsr    LDA10                 ; 6
LDB1B:
    bit    $8A                   ; 3
    bvc    LDB2C                 ; 2³
    lda    $E4                   ; 3
    and    #$F0                  ; 2
    beq    LDB2C                 ; 2³
    lda    $E4                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $E4                   ; 3
LDB2C:
    lda    $EA                   ; 3
    rts                          ; 6

LDB2F:
    jmp    LDA22                 ; 3

LDB32:
    ldy    #0                    ; 2
    lda    $E1                   ; 3
    and    #$F0                  ; 2
    bne    LDB54                 ; 2³
    iny                          ; 2
    lda    $E0                   ; 3
    bmi    LDB54                 ; 2³
    iny                          ; 2
    asl                          ; 2
    bmi    LDB54                 ; 2³
    iny                          ; 2
    and    #$60                  ; 2
    bne    LDB54                 ; 2³
    lda    $E0                   ; 3
    iny                          ; 2
    and    #$0F                  ; 2
    bne    LDB54                 ; 2³
    sta    AUDV0                 ; 3
    sta    $FC                   ; 3
    rts                          ; 6

LDB54:
    lda    $FC                   ; 3
    and    #$E0                  ; 2
    cmp    LDFB9,Y               ; 4
    beq    LDB62                 ; 2³
    lda    LDFB9,Y               ; 4
    sta    $FC                   ; 3
LDB62:
    rts                          ; 6

LDB63:
    lda    $84                   ; 3
    ldx    #0                    ; 2
    and    #$02                  ; 2
    bne    LDB6C                 ; 2³
    dex                          ; 2
LDB6C:
    stx    AUDV0                 ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #$10                  ; 2
    sta    AUDF0                 ; 3
    jmp    LDC38                 ; 3

LDB79:
    and    #$3E                  ; 2
    lsr                          ; 2
    adc    #1                    ; 2
    sta    AUDF0                 ; 3
    ldx    #4                    ; 2
    lda    $84                   ; 3
    and    #$02                  ; 2
    bne    LDB8A                 ; 2³
    ldx    #$0D                  ; 2
LDB8A:
    stx    AUDC0                 ; 3
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
    jmp    LDC1C                 ; 3

LDB93:
    ldx    #4                    ; 2
    stx    AUDC0                 ; 3
    cmp    #$18                  ; 2
    bcs    LDBAA                 ; 2³
    lsr                          ; 2
    tay                          ; 2
    lda    LDFA0,Y               ; 4
    sta    AUDF0                 ; 3
    lda    LDFAD,Y               ; 4
    sta    AUDV0                 ; 3
    jmp    LDC1C                 ; 3

LDBAA:
    lda    $84                   ; 3
    and    #$01                  ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    AUDF0                 ; 3
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
LDBBF:
    rts                          ; 6

LDBC0:
    lda    $8A                   ; 3
    and    #$C4                  ; 2
    bne    LDBBF                 ; 2³
    lda    $83                   ; 3
    and    #$40                  ; 2
    bne    LDB63                 ; 2³
    lda    $E7                   ; 3
    bmi    LDB79                 ; 2³
    bne    LDB93                 ; 2³
    ldy    $FC                   ; 3
    beq    LDC1C                 ; 2³+1
    cpy    #$60                  ; 2
    bcc    LDBE0                 ; 2³
    lda    $84                   ; 3
    and    #$01                  ; 2
    bne    LDC1C                 ; 2³+1
LDBE0:
    lda    LDE00,Y               ; 4
    bpl    LDBEE                 ; 2³
    tya                          ; 2
    and    #$E0                  ; 2
    sta    $FC                   ; 3
    tay                          ; 2
    lda    LDE00,Y               ; 4
LDBEE:
    bne    LDBF6                 ; 2³
    sta    AUDV0                 ; 3
    inc    $FC                   ; 5
    bne    LDC1C                 ; 2³+1
LDBF6:
    sta    AUDF0                 ; 3
    inc    $FC                   ; 5
    tya                          ; 2
    and    #$E0                  ; 2
    cmp    #$60                  ; 2
    bne    LDC0C                 ; 2³
    tya                          ; 2
    and    #$1F                  ; 2
    tay                          ; 2
    lda    LDE00,Y               ; 4
    sta    AUDV0                 ; 3
    bne    LDC18                 ; 2³
LDC0C:
    ldy    #8                    ; 2
    sty    AUDV0                 ; 3
    cmp    #$80                  ; 2
    bne    LDC18                 ; 2³
    lda    #4                    ; 2
    bne    LDC1A                 ; 2³
LDC18:
    lda    #$0D                  ; 2
LDC1A:
    sta    AUDC0                 ; 3
LDC1C:
    lda    $84                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    bne    LDC38                 ; 2³
    lda    $87                   ; 3
    cmp    #1                    ; 2
    beq    LDC2F                 ; 2³
    bit    $83                   ; 3
    bmi    LDC38                 ; 2³
LDC2F:
    lda    #$FF                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDC1                 ; 3
    sta    AUDF1                 ; 3
    rts                          ; 6

LDC38:
    ldy    $FD                   ; 3
    bmi    LDC6C                 ; 2³
    lda    #7                    ; 2
    cpy    #$14                  ; 2
    bcc    LDC4E                 ; 2³
    cpy    #$1F                  ; 2
    bcc    LDC52                 ; 2³
    cpy    #$28                  ; 2
    lda    #1                    ; 2
    bcc    LDC4E                 ; 2³
    lda    #3                    ; 2
LDC4E:
    and    $84                   ; 3
    bne    LDC55                 ; 2³
LDC52:
    dec    $FD                   ; 5
    dey                          ; 2
LDC55:
    lda    LDD60,Y               ; 4
    bpl    LDC5F                 ; 2³
    sta    $FD                   ; 3
    sta    AUDV1                 ; 3
    rts                          ; 6

LDC5F:
    sta    AUDF1                 ; 3
    lda    LDCC3,Y               ; 4
    sta    AUDC1                 ; 3
    lda    LDC88,Y               ; 4
    sta    AUDV1                 ; 3
    rts                          ; 6

LDC6C:
    ldx    #0                    ; 2
    lda    $86                   ; 3
    bmi    LDC85                 ; 2³
    sec                          ; 2
    sbc    $F097                 ; 4
    tay                          ; 2
    cpy    #9                    ; 2
    bpl    LDC85                 ; 2³
    lda    LDE31,Y               ; 4
    sta    AUDF1                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    dex                          ; 2
LDC85:
    stx    AUDV1                 ; 3
    rts                          ; 6

LDC88:
    .byte $00 ; |        | $DC88
    .byte $FF ; |XXXXXXXX| $DC89
    .byte $FF ; |XXXXXXXX| $DC8A
    .byte $FF ; |XXXXXXXX| $DC8B
    .byte $FF ; |XXXXXXXX| $DC8C
    .byte $FF ; |XXXXXXXX| $DC8D
    .byte $FF ; |XXXXXXXX| $DC8E
    .byte $FF ; |XXXXXXXX| $DC8F
    .byte $FF ; |XXXXXXXX| $DC90
    .byte $FF ; |XXXXXXXX| $DC91
    .byte $FF ; |XXXXXXXX| $DC92
    .byte $FF ; |XXXXXXXX| $DC93
    .byte $FF ; |XXXXXXXX| $DC94
    .byte $FF ; |XXXXXXXX| $DC95
    .byte $FF ; |XXXXXXXX| $DC96
    .byte $FF ; |XXXXXXXX| $DC97
    .byte $FF ; |XXXXXXXX| $DC98
    .byte $FF ; |XXXXXXXX| $DC99
    .byte $FF ; |XXXXXXXX| $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $02 ; |      X | $DC9D
    .byte $03 ; |      XX| $DC9E
    .byte $04 ; |     X  | $DC9F
    .byte $05 ; |     X X| $DCA0
    .byte $06 ; |     XX | $DCA1
    .byte $07 ; |     XXX| $DCA2
    .byte $07 ; |     XXX| $DCA3
    .byte $07 ; |     XXX| $DCA4
    .byte $06 ; |     XX | $DCA5
    .byte $05 ; |     X X| $DCA6
    .byte $00 ; |        | $DCA7
    .byte $02 ; |      X | $DCA8
    .byte $04 ; |     X  | $DCA9
    .byte $05 ; |     X X| $DCAA
    .byte $06 ; |     XX | $DCAB
    .byte $07 ; |     XXX| $DCAC
    .byte $08 ; |    X   | $DCAD
    .byte $0D ; |    XX X| $DCAE
    .byte $0D ; |    XX X| $DCAF
    .byte $00 ; |        | $DCB0
    .byte $0A ; |    X X | $DCB1
    .byte $0A ; |    X X | $DCB2
    .byte $0A ; |    X X | $DCB3
    .byte $0A ; |    X X | $DCB4
    .byte $0A ; |    X X | $DCB5
    .byte $0A ; |    X X | $DCB6
    .byte $0A ; |    X X | $DCB7
    .byte $0A ; |    X X | $DCB8
    .byte $0A ; |    X X | $DCB9
    .byte $0A ; |    X X | $DCBA
    .byte $0A ; |    X X | $DCBB
    .byte $0A ; |    X X | $DCBC
    .byte $0A ; |    X X | $DCBD
    .byte $0A ; |    X X | $DCBE
    .byte $0A ; |    X X | $DCBF
    .byte $0A ; |    X X | $DCC0
    .byte $0A ; |    X X | $DCC1
    .byte $0A ; |    X X | $DCC2
LDCC3:
    .byte $00 ; |        | $DCC3
    .byte $04 ; |     X  | $DCC4
    .byte $04 ; |     X  | $DCC5
    .byte $04 ; |     X  | $DCC6
    .byte $04 ; |     X  | $DCC7
    .byte $04 ; |     X  | $DCC8
    .byte $04 ; |     X  | $DCC9
    .byte $04 ; |     X  | $DCCA
    .byte $04 ; |     X  | $DCCB
    .byte $0D ; |    XX X| $DCCC
    .byte $0D ; |    XX X| $DCCD
    .byte $0D ; |    XX X| $DCCE
    .byte $0D ; |    XX X| $DCCF
    .byte $0D ; |    XX X| $DCD0
    .byte $0D ; |    XX X| $DCD1
    .byte $0D ; |    XX X| $DCD2
    .byte $0D ; |    XX X| $DCD3
    .byte $0D ; |    XX X| $DCD4
    .byte $0D ; |    XX X| $DCD5
    .byte $0D ; |    XX X| $DCD6
    .byte $00 ; |        | $DCD7
    .byte $0D ; |    XX X| $DCD8
    .byte $0D ; |    XX X| $DCD9
    .byte $0D ; |    XX X| $DCDA
    .byte $0D ; |    XX X| $DCDB
    .byte $0D ; |    XX X| $DCDC
    .byte $0D ; |    XX X| $DCDD
    .byte $0D ; |    XX X| $DCDE
    .byte $0D ; |    XX X| $DCDF
    .byte $0D ; |    XX X| $DCE0
    .byte $0D ; |    XX X| $DCE1
    .byte $00 ; |        | $DCE2
    .byte $08 ; |    X   | $DCE3
    .byte $08 ; |    X   | $DCE4
    .byte $08 ; |    X   | $DCE5
    .byte $08 ; |    X   | $DCE6
    .byte $08 ; |    X   | $DCE7
    .byte $08 ; |    X   | $DCE8
    .byte $08 ; |    X   | $DCE9
    .byte $08 ; |    X   | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $0D ; |    XX X| $DCEC
    .byte $0D ; |    XX X| $DCED
    .byte $0D ; |    XX X| $DCEE
    .byte $0D ; |    XX X| $DCEF
    .byte $0D ; |    XX X| $DCF0
    .byte $0D ; |    XX X| $DCF1
    .byte $0D ; |    XX X| $DCF2
    .byte $0D ; |    XX X| $DCF3
    .byte $0D ; |    XX X| $DCF4
    .byte $0D ; |    XX X| $DCF5
    .byte $0D ; |    XX X| $DCF6
    .byte $0D ; |    XX X| $DCF7
    .byte $0D ; |    XX X| $DCF8
    .byte $0D ; |    XX X| $DCF9
    .byte $0D ; |    XX X| $DCFA
    .byte $0D ; |    XX X| $DCFB
    .byte $0D ; |    XX X| $DCFC
    .byte $0D ; |    XX X| $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
    .byte $38 ; |  XXX   | $DD00
    .byte $6C ; | XX XX  | $DD01
    .byte $C6 ; |XX   XX | $DD02
    .byte $C6 ; |XX   XX | $DD03
    .byte $C6 ; |XX   XX | $DD04
    .byte $6C ; | XX XX  | $DD05
    .byte $38 ; |  XXX   | $DD06
    .byte $00 ; |        | $DD07
    .byte $7E ; | XXXXXX | $DD08
    .byte $18 ; |   XX   | $DD09
    .byte $18 ; |   XX   | $DD0A
    .byte $18 ; |   XX   | $DD0B
    .byte $18 ; |   XX   | $DD0C
    .byte $38 ; |  XXX   | $DD0D
    .byte $18 ; |   XX   | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $FE ; |XXXXXXX | $DD10
    .byte $C0 ; |XX      | $DD11
    .byte $E0 ; |XXX     | $DD12
    .byte $3C ; |  XXXX  | $DD13
    .byte $06 ; |     XX | $DD14
    .byte $C6 ; |XX   XX | $DD15
    .byte $7C ; | XXXXX  | $DD16
    .byte $00 ; |        | $DD17
    .byte $FC ; |XXXXXX  | $DD18
    .byte $06 ; |     XX | $DD19
    .byte $06 ; |     XX | $DD1A
    .byte $7C ; | XXXXX  | $DD1B
    .byte $06 ; |     XX | $DD1C
    .byte $06 ; |     XX | $DD1D
    .byte $FC ; |XXXXXX  | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $0C ; |    XX  | $DD20
    .byte $0C ; |    XX  | $DD21
    .byte $0C ; |    XX  | $DD22
    .byte $FE ; |XXXXXXX | $DD23
    .byte $CC ; |XX  XX  | $DD24
    .byte $CC ; |XX  XX  | $DD25
    .byte $CC ; |XX  XX  | $DD26
    .byte $00 ; |        | $DD27
    .byte $FC ; |XXXXXX  | $DD28
    .byte $06 ; |     XX | $DD29
    .byte $06 ; |     XX | $DD2A
    .byte $FC ; |XXXXXX  | $DD2B
    .byte $C0 ; |XX      | $DD2C
    .byte $C0 ; |XX      | $DD2D
    .byte $FC ; |XXXXXX  | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $7C ; | XXXXX  | $DD30
    .byte $C6 ; |XX   XX | $DD31
    .byte $C6 ; |XX   XX | $DD32
    .byte $FC ; |XXXXXX  | $DD33
    .byte $C0 ; |XX      | $DD34
    .byte $C0 ; |XX      | $DD35
    .byte $7C ; | XXXXX  | $DD36
    .byte $00 ; |        | $DD37
    .byte $30 ; |  XX    | $DD38
    .byte $30 ; |  XX    | $DD39
    .byte $18 ; |   XX   | $DD3A
    .byte $18 ; |   XX   | $DD3B
    .byte $0C ; |    XX  | $DD3C
    .byte $06 ; |     XX | $DD3D
    .byte $FE ; |XXXXXXX | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $7C ; | XXXXX  | $DD40
    .byte $C6 ; |XX   XX | $DD41
    .byte $C6 ; |XX   XX | $DD42
    .byte $7C ; | XXXXX  | $DD43
    .byte $C6 ; |XX   XX | $DD44
    .byte $C6 ; |XX   XX | $DD45
    .byte $7C ; | XXXXX  | $DD46
    .byte $00 ; |        | $DD47
    .byte $7C ; | XXXXX  | $DD48
    .byte $06 ; |     XX | $DD49
    .byte $06 ; |     XX | $DD4A
    .byte $7E ; | XXXXXX | $DD4B
    .byte $C6 ; |XX   XX | $DD4C
    .byte $C6 ; |XX   XX | $DD4D
    .byte $7C ; | XXXXX  | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $00 ; |        | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $38 ; |  XXX   | $DD58
    .byte $6C ; | XX XX  | $DD59
    .byte $6C ; | XX XX  | $DD5A
    .byte $7C ; | XXXXX  | $DD5B
    .byte $54 ; | X X X  | $DD5C
    .byte $BA ; |X XXX X | $DD5D
    .byte $C6 ; |XX   XX | $DD5E
    .byte $00 ; |        | $DD5F
LDD60:
    .byte $B0 ; |X XX    | $DD60
    .byte $14 ; |   X X  | $DD61
    .byte $14 ; |   X X  | $DD62
    .byte $14 ; |   X X  | $DD63
    .byte $18 ; |   XX   | $DD64
    .byte $14 ; |   X X  | $DD65
    .byte $14 ; |   X X  | $DD66
    .byte $18 ; |   XX   | $DD67
    .byte $1F ; |   XXXXX| $DD68
    .byte $0D ; |    XX X| $DD69
    .byte $0D ; |    XX X| $DD6A
    .byte $0D ; |    XX X| $DD6B
    .byte $0D ; |    XX X| $DD6C
    .byte $10 ; |   X    | $DD6D
    .byte $0D ; |    XX X| $DD6E
    .byte $0D ; |    XX X| $DD6F
    .byte $10 ; |   X    | $DD70
    .byte $14 ; |   X X  | $DD71
    .byte $1B ; |   XX XX| $DD72
    .byte $01 ; |       X| $DD73
    .byte $B0 ; |X XX    | $DD74
    .byte $0E ; |    XXX | $DD75
    .byte $0F ; |    XXXX| $DD76
    .byte $10 ; |   X    | $DD77
    .byte $11 ; |   X   X| $DD78
    .byte $12 ; |   X  X | $DD79
    .byte $13 ; |   X  XX| $DD7A
    .byte $14 ; |   X X  | $DD7B
    .byte $15 ; |   X X X| $DD7C
    .byte $16 ; |   X XX | $DD7D
    .byte $17 ; |   X XXX| $DD7E
    .byte $B0 ; |X XX    | $DD7F
    .byte $08 ; |    X   | $DD80
    .byte $08 ; |    X   | $DD81
    .byte $08 ; |    X   | $DD82
    .byte $08 ; |    X   | $DD83
    .byte $08 ; |    X   | $DD84
    .byte $08 ; |    X   | $DD85
    .byte $08 ; |    X   | $DD86
    .byte $08 ; |    X   | $DD87
    .byte $B0 ; |X XX    | $DD88
    .byte $1F ; |   XXXXX| $DD89
    .byte $1E ; |   XXXX | $DD8A
    .byte $1D ; |   XXX X| $DD8B
    .byte $1C ; |   XXX  | $DD8C
    .byte $1B ; |   XX XX| $DD8D
    .byte $1A ; |   XX X | $DD8E
    .byte $19 ; |   XX  X| $DD8F
    .byte $18 ; |   XX   | $DD90
    .byte $17 ; |   X XXX| $DD91
    .byte $16 ; |   X XX | $DD92
    .byte $15 ; |   X X X| $DD93
    .byte $14 ; |   X X  | $DD94
    .byte $13 ; |   X  XX| $DD95
    .byte $12 ; |   X  X | $DD96
    .byte $11 ; |   X   X| $DD97
    .byte $10 ; |   X    | $DD98
    .byte $0F ; |    XXXX| $DD99
    .byte $0E ; |    XXX | $DD9A
    .byte $00 ; |        | $DD9B
    .byte $00 ; |        | $DD9C
    .byte $00 ; |        | $DD9D
    .byte $00 ; |        | $DD9E
    .byte $00 ; |        | $DD9F
    .byte $00 ; |        | $DDA0
    .byte $00 ; |        | $DDA1
    .byte $00 ; |        | $DDA2
    .byte $00 ; |        | $DDA3
    .byte $00 ; |        | $DDA4
    .byte $00 ; |        | $DDA5
    .byte $00 ; |        | $DDA6
    .byte $00 ; |        | $DDA7
    .byte $00 ; |        | $DDA8
    .byte $00 ; |        | $DDA9
    .byte $00 ; |        | $DDAA
    .byte $00 ; |        | $DDAB
    .byte $00 ; |        | $DDAC
    .byte $00 ; |        | $DDAD
    .byte $00 ; |        | $DDAE
    .byte $00 ; |        | $DDAF
    .byte $00 ; |        | $DDB0
    .byte $00 ; |        | $DDB1
    .byte $00 ; |        | $DDB2
    .byte $00 ; |        | $DDB3
    .byte $00 ; |        | $DDB4
    .byte $00 ; |        | $DDB5
    .byte $00 ; |        | $DDB6
    .byte $00 ; |        | $DDB7
    .byte $00 ; |        | $DDB8
    .byte $00 ; |        | $DDB9
    .byte $00 ; |        | $DDBA
    .byte $00 ; |        | $DDBB
    .byte $00 ; |        | $DDBC
    .byte $00 ; |        | $DDBD
    .byte $00 ; |        | $DDBE
    .byte $00 ; |        | $DDBF
    .byte $00 ; |        | $DDC0
    .byte $00 ; |        | $DDC1
    .byte $00 ; |        | $DDC2
    .byte $00 ; |        | $DDC3
    .byte $00 ; |        | $DDC4
    .byte $00 ; |        | $DDC5
    .byte $00 ; |        | $DDC6
    .byte $00 ; |        | $DDC7
    .byte $00 ; |        | $DDC8
    .byte $00 ; |        | $DDC9
    .byte $00 ; |        | $DDCA
    .byte $00 ; |        | $DDCB
    .byte $00 ; |        | $DDCC
    .byte $00 ; |        | $DDCD
    .byte $00 ; |        | $DDCE
    .byte $00 ; |        | $DDCF
    .byte $00 ; |        | $DDD0
    .byte $00 ; |        | $DDD1
    .byte $00 ; |        | $DDD2
    .byte $00 ; |        | $DDD3
    .byte $00 ; |        | $DDD4
    .byte $00 ; |        | $DDD5
    .byte $00 ; |        | $DDD6
    .byte $00 ; |        | $DDD7
    .byte $00 ; |        | $DDD8
    .byte $00 ; |        | $DDD9
    .byte $00 ; |        | $DDDA
    .byte $00 ; |        | $DDDB
    .byte $00 ; |        | $DDDC
    .byte $00 ; |        | $DDDD
    .byte $00 ; |        | $DDDE
    .byte $00 ; |        | $DDDF
    .byte $00 ; |        | $DDE0
    .byte $00 ; |        | $DDE1
    .byte $00 ; |        | $DDE2
    .byte $00 ; |        | $DDE3
    .byte $00 ; |        | $DDE4
    .byte $00 ; |        | $DDE5
    .byte $00 ; |        | $DDE6
    .byte $00 ; |        | $DDE7
    .byte $00 ; |        | $DDE8
    .byte $00 ; |        | $DDE9
    .byte $00 ; |        | $DDEA
    .byte $00 ; |        | $DDEB
    .byte $00 ; |        | $DDEC
    .byte $00 ; |        | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $00 ; |        | $DDF0
    .byte $00 ; |        | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $00 ; |        | $DDF3
    .byte $00 ; |        | $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
LDE00:
    .byte $04 ; |     X  | $DE00
    .byte $05 ; |     X X| $DE01
    .byte $06 ; |     XX | $DE02
    .byte $07 ; |     XXX| $DE03
    .byte $06 ; |     XX | $DE04
    .byte $05 ; |     X X| $DE05
    .byte $04 ; |     X  | $DE06
    .byte $03 ; |      XX| $DE07
    .byte $02 ; |      X | $DE08
    .byte $02 ; |      X | $DE09
    .byte $02 ; |      X | $DE0A
    .byte $03 ; |      XX| $DE0B
    .byte $04 ; |     X  | $DE0C
    .byte $05 ; |     X X| $DE0D
    .byte $06 ; |     XX | $DE0E
    .byte $07 ; |     XXX| $DE0F
    .byte $06 ; |     XX | $DE10
    .byte $05 ; |     X X| $DE11
    .byte $04 ; |     X  | $DE12
    .byte $03 ; |      XX| $DE13
    .byte $02 ; |      X | $DE14
    .byte $02 ; |      X | $DE15
    .byte $02 ; |      X | $DE16
    .byte $02 ; |      X | $DE17
    .byte $00 ; |        | $DE18
    .byte $00 ; |        | $DE19
    .byte $00 ; |        | $DE1A
    .byte $00 ; |        | $DE1B
    .byte $00 ; |        | $DE1C
    .byte $00 ; |        | $DE1D
    .byte $00 ; |        | $DE1E
    .byte $00 ; |        | $DE1F
    .byte $13 ; |   X  XX| $DE20
    .byte $11 ; |   X   X| $DE21
    .byte $10 ; |   X    | $DE22
    .byte $0D ; |    XX X| $DE23
    .byte $09 ; |    X  X| $DE24
    .byte $08 ; |    X   | $DE25
    .byte $00 ; |        | $DE26
    .byte $00 ; |        | $DE27
    .byte $08 ; |    X   | $DE28
    .byte $09 ; |    X  X| $DE29
    .byte $0D ; |    XX X| $DE2A
    .byte $0F ; |    XXXX| $DE2B
    .byte $11 ; |   X   X| $DE2C
    .byte $13 ; |   X  XX| $DE2D
    .byte $00 ; |        | $DE2E
    .byte $00 ; |        | $DE2F
    .byte $FF ; |XXXXXXXX| $DE30
LDE31:
    .byte $00 ; |        | $DE31
    .byte $00 ; |        | $DE32
    .byte $01 ; |       X| $DE33
    .byte $01 ; |       X| $DE34
    .byte $02 ; |      X | $DE35
    .byte $02 ; |      X | $DE36
    .byte $03 ; |      XX| $DE37
    .byte $04 ; |     X  | $DE38
    .byte $05 ; |     X X| $DE39
    .byte $06 ; |     XX | $DE3A
    .byte $00 ; |        | $DE3B
    .byte $00 ; |        | $DE3C
    .byte $00 ; |        | $DE3D
    .byte $00 ; |        | $DE3E
    .byte $00 ; |        | $DE3F
    .byte $18 ; |   XX   | $DE40
    .byte $00 ; |        | $DE41
    .byte $FF ; |XXXXXXXX| $DE42
LDE43:
    .byte $00 ; |        | $DE43
    .byte $80 ; |X       | $DE44
    .byte $A0 ; |X X     | $DE45
    .byte $A8 ; |X X X   | $DE46
    .byte $AA ; |X X X X | $DE47
    .byte $AA ; |X X X X | $DE48
    .byte $AA ; |X X X X | $DE49
    .byte $AA ; |X X X X | $DE4A
LDE4B:
    .byte $00 ; |        | $DE4B
    .byte $00 ; |        | $DE4C
    .byte $00 ; |        | $DE4D
    .byte $00 ; |        | $DE4E
    .byte $00 ; |        | $DE4F
    .byte $01 ; |       X| $DE50
    .byte $05 ; |     X X| $DE51
    .byte $15 ; |   X X X| $DE52
LDE53:
    .byte $0C ; |    XX  | $DE53
    .byte $0C ; |    XX  | $DE54
    .byte $0C ; |    XX  | $DE55
    .byte $0C ; |    XX  | $DE56
    .byte $0C ; |    XX  | $DE57
    .byte $0C ; |    XX  | $DE58
    .byte $0C ; |    XX  | $DE59
    .byte $0C ; |    XX  | $DE5A
    .byte $0C ; |    XX  | $DE5B
    .byte $0C ; |    XX  | $DE5C
    .byte $1E ; |   XXXX | $DE5D
    .byte $00 ; |        | $DE5E
    .byte $00 ; |        | $DE5F
    .byte $1F ; |   XXXXX| $DE60
    .byte $1E ; |   XXXX | $DE61
    .byte $1D ; |   XXX X| $DE62
    .byte $1D ; |   XXX X| $DE63
    .byte $1E ; |   XXXX | $DE64
    .byte $1E ; |   XXXX | $DE65
    .byte $1E ; |   XXXX | $DE66
    .byte $1E ; |   XXXX | $DE67
    .byte $1E ; |   XXXX | $DE68
    .byte $1E ; |   XXXX | $DE69
    .byte $1D ; |   XXX X| $DE6A
    .byte $1D ; |   XXX X| $DE6B
    .byte $1E ; |   XXXX | $DE6C
    .byte $1E ; |   XXXX | $DE6D
    .byte $1F ; |   XXXXX| $DE6E
    .byte $1F ; |   XXXXX| $DE6F
    .byte $1E ; |   XXXX | $DE70
    .byte $1E ; |   XXXX | $DE71
    .byte $1E ; |   XXXX | $DE72
    .byte $1E ; |   XXXX | $DE73
    .byte $1E ; |   XXXX | $DE74
    .byte $1E ; |   XXXX | $DE75
    .byte $1E ; |   XXXX | $DE76
    .byte $1F ; |   XXXXX| $DE77
    .byte $FF ; |XXXXXXXX| $DE78
    .byte $00 ; |        | $DE79
    .byte $00 ; |        | $DE7A
    .byte $00 ; |        | $DE7B
    .byte $00 ; |        | $DE7C
    .byte $00 ; |        | $DE7D
    .byte $00 ; |        | $DE7E
    .byte $00 ; |        | $DE7F
    .byte $10 ; |   X    | $DE80
    .byte $00 ; |        | $DE81
    .byte $0E ; |    XXX | $DE82
    .byte $00 ; |        | $DE83
    .byte $09 ; |    X  X| $DE84
    .byte $00 ; |        | $DE85
    .byte $00 ; |        | $DE86
    .byte $00 ; |        | $DE87
    .byte $09 ; |    X  X| $DE88
    .byte $00 ; |        | $DE89
    .byte $0E ; |    XXX | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $10 ; |   X    | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $0E ; |    XXX | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $09 ; |    X  X| $DE90
    .byte $00 ; |        | $DE91
    .byte $00 ; |        | $DE92
    .byte $FF ; |XXXXXXXX| $DE93
    .byte $00 ; |        | $DE94
    .byte $00 ; |        | $DE95
    .byte $00 ; |        | $DE96
    .byte $00 ; |        | $DE97
    .byte $00 ; |        | $DE98
    .byte $00 ; |        | $DE99
    .byte $00 ; |        | $DE9A
    .byte $00 ; |        | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $00 ; |        | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $10 ; |   X    | $DEA0
    .byte $19 ; |   XX  X| $DEA1
    .byte $10 ; |   X    | $DEA2
    .byte $13 ; |   X  XX| $DEA3
    .byte $17 ; |   X XXX| $DEA4
    .byte $13 ; |   X  XX| $DEA5
    .byte $FF ; |XXXXXXXX| $DEA6
LDEA7:
    .byte $00 ; |        | $DEA7
    .byte $00 ; |        | $DEA8
    .byte $00 ; |        | $DEA9
    .byte $01 ; |       X| $DEAA
    .byte $01 ; |       X| $DEAB
    .byte $01 ; |       X| $DEAC
    .byte $02 ; |      X | $DEAD
    .byte $02 ; |      X | $DEAE
    .byte $02 ; |      X | $DEAF
    .byte $03 ; |      XX| $DEB0
    .byte $03 ; |      XX| $DEB1
    .byte $03 ; |      XX| $DEB2
    .byte $04 ; |     X  | $DEB3
    .byte $04 ; |     X  | $DEB4
    .byte $04 ; |     X  | $DEB5
    .byte $05 ; |     X X| $DEB6
    .byte $05 ; |     X X| $DEB7
    .byte $05 ; |     X X| $DEB8
    .byte $06 ; |     XX | $DEB9
    .byte $06 ; |     XX | $DEBA
    .byte $06 ; |     XX | $DEBB
    .byte $07 ; |     XXX| $DEBC
    .byte $07 ; |     XXX| $DEBD
    .byte $07 ; |     XXX| $DEBE
    .byte $08 ; |    X   | $DEBF
    .byte $08 ; |    X   | $DEC0
    .byte $08 ; |    X   | $DEC1
    .byte $09 ; |    X  X| $DEC2
    .byte $09 ; |    X  X| $DEC3
    .byte $09 ; |    X  X| $DEC4
    .byte $0A ; |    X X | $DEC5
    .byte $0A ; |    X X | $DEC6
    .byte $0A ; |    X X | $DEC7
    .byte $0B ; |    X XX| $DEC8
    .byte $0B ; |    X XX| $DEC9
    .byte $0B ; |    X XX| $DECA
    .byte $0C ; |    XX  | $DECB
    .byte $0C ; |    XX  | $DECC
    .byte $0C ; |    XX  | $DECD
    .byte $0D ; |    XX X| $DECE
    .byte $0D ; |    XX X| $DECF
    .byte $0D ; |    XX X| $DED0
    .byte $0E ; |    XXX | $DED1
    .byte $0E ; |    XXX | $DED2
    .byte $0E ; |    XXX | $DED3
    .byte $0F ; |    XXXX| $DED4
    .byte $0F ; |    XXXX| $DED5
    .byte $0F ; |    XXXX| $DED6
    .byte $10 ; |   X    | $DED7
    .byte $10 ; |   X    | $DED8
    .byte $10 ; |   X    | $DED9
    .byte $11 ; |   X   X| $DEDA
    .byte $11 ; |   X   X| $DEDB
    .byte $11 ; |   X   X| $DEDC
    .byte $12 ; |   X  X | $DEDD
    .byte $12 ; |   X  X | $DEDE
    .byte $12 ; |   X  X | $DEDF
    .byte $13 ; |   X  XX| $DEE0
    .byte $13 ; |   X  XX| $DEE1
    .byte $13 ; |   X  XX| $DEE2
LDEE3:
    .byte $00 ; |        | $DEE3
    .byte $07 ; |     XXX| $DEE4
    .byte $0F ; |    XXXX| $DEE5
    .byte $1F ; |   XXXXX| $DEE6
    .byte $27 ; |  X  XXX| $DEE7
    .byte $2F ; |  X XXXX| $DEE8
    .byte $3F ; |  XXXXXX| $DEE9
    .byte $47 ; | X   XXX| $DEEA
    .byte $4F ; | X  XXXX| $DEEB
    .byte $5F ; | X XXXXX| $DEEC
    .byte $67 ; | XX  XXX| $DEED
    .byte $6F ; | XX XXXX| $DEEE
LDEEF:
    .byte $04 ; |     X  | $DEEF
    .byte $04 ; |     X  | $DEF0
    .byte $04 ; |     X  | $DEF1
    .byte $04 ; |     X  | $DEF2
    .byte $04 ; |     X  | $DEF3
    .byte $04 ; |     X  | $DEF4
    .byte $04 ; |     X  | $DEF5
    .byte $04 ; |     X  | $DEF6
    .byte $03 ; |      XX| $DEF7
    .byte $03 ; |      XX| $DEF8
    .byte $03 ; |      XX| $DEF9
    .byte $03 ; |      XX| $DEFA
    .byte $03 ; |      XX| $DEFB
    .byte $03 ; |      XX| $DEFC
    .byte $03 ; |      XX| $DEFD
    .byte $03 ; |      XX| $DEFE
    .byte $02 ; |      X | $DEFF
    .byte $02 ; |      X | $DF00
    .byte $02 ; |      X | $DF01
    .byte $02 ; |      X | $DF02
    .byte $02 ; |      X | $DF03
    .byte $02 ; |      X | $DF04
    .byte $02 ; |      X | $DF05
    .byte $02 ; |      X | $DF06
    .byte $01 ; |       X| $DF07
    .byte $01 ; |       X| $DF08
    .byte $01 ; |       X| $DF09
    .byte $01 ; |       X| $DF0A
    .byte $01 ; |       X| $DF0B
    .byte $01 ; |       X| $DF0C
    .byte $01 ; |       X| $DF0D
    .byte $01 ; |       X| $DF0E
LDF0F:
    .byte $00 ; |        | $DF0F
    .byte $C0 ; |XX      | $DF10
    .byte $00 ; |        | $DF11
    .byte $30 ; |  XX    | $DF12
    .byte $00 ; |        | $DF13
    .byte $0C ; |    XX  | $DF14
    .byte $00 ; |        | $DF15
    .byte $03 ; |      XX| $DF16
    .byte $00 ; |        | $DF17
    .byte $C0 ; |XX      | $DF18
    .byte $00 ; |        | $DF19
    .byte $30 ; |  XX    | $DF1A
    .byte $00 ; |        | $DF1B
    .byte $0C ; |    XX  | $DF1C
    .byte $00 ; |        | $DF1D
    .byte $03 ; |      XX| $DF1E
    .byte $00 ; |        | $DF1F
    .byte $C0 ; |XX      | $DF20
    .byte $00 ; |        | $DF21
    .byte $30 ; |  XX    | $DF22
    .byte $00 ; |        | $DF23
    .byte $0C ; |    XX  | $DF24
    .byte $00 ; |        | $DF25
    .byte $03 ; |      XX| $DF26
    .byte $00 ; |        | $DF27
    .byte $C0 ; |XX      | $DF28
    .byte $00 ; |        | $DF29
    .byte $30 ; |  XX    | $DF2A
    .byte $00 ; |        | $DF2B
    .byte $0C ; |    XX  | $DF2C
    .byte $00 ; |        | $DF2D
    .byte $03 ; |      XX| $DF2E
LDF2F:
    .byte $00 ; |        | $DF2F
    .byte $40 ; | X      | $DF30
    .byte $00 ; |        | $DF31
    .byte $10 ; |   X    | $DF32
    .byte $00 ; |        | $DF33
    .byte $04 ; |     X  | $DF34
    .byte $00 ; |        | $DF35
    .byte $01 ; |       X| $DF36
    .byte $00 ; |        | $DF37
    .byte $40 ; | X      | $DF38
    .byte $00 ; |        | $DF39
    .byte $10 ; |   X    | $DF3A
    .byte $00 ; |        | $DF3B
    .byte $04 ; |     X  | $DF3C
    .byte $00 ; |        | $DF3D
    .byte $01 ; |       X| $DF3E
    .byte $00 ; |        | $DF3F
    .byte $40 ; | X      | $DF40
    .byte $00 ; |        | $DF41
    .byte $10 ; |   X    | $DF42
    .byte $00 ; |        | $DF43
    .byte $04 ; |     X  | $DF44
    .byte $00 ; |        | $DF45
    .byte $01 ; |       X| $DF46
    .byte $00 ; |        | $DF47
    .byte $40 ; | X      | $DF48
    .byte $00 ; |        | $DF49
    .byte $10 ; |   X    | $DF4A
    .byte $00 ; |        | $DF4B
    .byte $04 ; |     X  | $DF4C
    .byte $00 ; |        | $DF4D
    .byte $01 ; |       X| $DF4E
LDF4F:
    .byte $04 ; |     X  | $DF4F
    .byte $14 ; |   X X  | $DF50
    .byte $01 ; |       X| $DF51
    .byte $00 ; |        | $DF52
    .byte $40 ; | X      | $DF53
    .byte $48 ; | X  X   | $DF54
    .byte $10 ; |   X    | $DF55
    .byte $00 ; |        | $DF56
    .byte $01 ; |       X| $DF57
    .byte $10 ; |   X    | $DF58
    .byte $04 ; |     X  | $DF59
    .byte $00 ; |        | $DF5A
    .byte $00 ; |        | $DF5B
    .byte $01 ; |       X| $DF5C
    .byte $14 ; |   X X  | $DF5D
    .byte $00 ; |        | $DF5E
    .byte $08 ; |    X   | $DF5F
    .byte $40 ; | X      | $DF60
    .byte $04 ; |     X  | $DF61
    .byte $10 ; |   X    | $DF62
    .byte $01 ; |       X| $DF63
    .byte $00 ; |        | $DF64
    .byte $44 ; | X   X  | $DF65
    .byte $00 ; |        | $DF66
    .byte $10 ; |   X    | $DF67
    .byte $04 ; |     X  | $DF68
    .byte $01 ; |       X| $DF69
    .byte $00 ; |        | $DF6A
    .byte $10 ; |   X    | $DF6B
    .byte $01 ; |       X| $DF6C
    .byte $01 ; |       X| $DF6D
    .byte $00 ; |        | $DF6E
    .byte $40 ; | X      | $DF6F
    .byte $04 ; |     X  | $DF70
    .byte $10 ; |   X    | $DF71
    .byte $84 ; |X    X  | $DF72
    .byte $00 ; |        | $DF73
    .byte $04 ; |     X  | $DF74
    .byte $04 ; |     X  | $DF75
    .byte $10 ; |   X    | $DF76
    .byte $44 ; | X   X  | $DF77
    .byte $10 ; |   X    | $DF78
    .byte $40 ; | X      | $DF79
    .byte $10 ; |   X    | $DF7A
    .byte $04 ; |     X  | $DF7B
    .byte $00 ; |        | $DF7C
    .byte $01 ; |       X| $DF7D
    .byte $00 ; |        | $DF7E
    .byte $21 ; |  X    X| $DF7F
    .byte $00 ; |        | $DF80
    .byte $40 ; | X      | $DF81
    .byte $10 ; |   X    | $DF82
    .byte $01 ; |       X| $DF83
    .byte $50 ; | X X    | $DF84
    .byte $40 ; | X      | $DF85
    .byte $00 ; |        | $DF86
    .byte $10 ; |   X    | $DF87
    .byte $01 ; |       X| $DF88
    .byte $10 ; |   X    | $DF89
    .byte $04 ; |     X  | $DF8A
    .byte $00 ; |        | $DF8B
    .byte $10 ; |   X    | $DF8C
    .byte $01 ; |       X| $DF8D
    .byte $50 ; | X X    | $DF8E
    .byte $04 ; |     X  | $DF8F
    .byte $00 ; |        | $DF90
    .byte $00 ; |        | $DF91
    .byte $00 ; |        | $DF92
    .byte $01 ; |       X| $DF93
    .byte $40 ; | X      | $DF94
    .byte $00 ; |        | $DF95
    .byte $01 ; |       X| $DF96
    .byte $04 ; |     X  | $DF97
    .byte $00 ; |        | $DF98
    .byte $00 ; |        | $DF99
    .byte $01 ; |       X| $DF9A
    .byte $00 ; |        | $DF9B
    .byte $00 ; |        | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
LDFA0:
    .byte $00 ; |        | $DFA0
    .byte $11 ; |   X   X| $DFA1
    .byte $10 ; |   X    | $DFA2
    .byte $0F ; |    XXXX| $DFA3
    .byte $0E ; |    XXX | $DFA4
    .byte $0D ; |    XX X| $DFA5
    .byte $0C ; |    XX  | $DFA6
    .byte $0B ; |    X XX| $DFA7
    .byte $0A ; |    X X | $DFA8
    .byte $09 ; |    X  X| $DFA9
    .byte $08 ; |    X   | $DFAA
    .byte $07 ; |     XXX| $DFAB
    .byte $00 ; |        | $DFAC
LDFAD:
    .byte $00 ; |        | $DFAD
    .byte $03 ; |      XX| $DFAE
    .byte $06 ; |     XX | $DFAF
    .byte $07 ; |     XXX| $DFB0
    .byte $09 ; |    X  X| $DFB1
    .byte $0A ; |    X X | $DFB2
    .byte $0B ; |    X XX| $DFB3
    .byte $0C ; |    XX  | $DFB4
    .byte $0D ; |    XX X| $DFB5
    .byte $0E ; |    XXX | $DFB6
    .byte $0F ; |    XXXX| $DFB7
    .byte $0E ; |    XXX | $DFB8
LDFB9:
    .byte $60 ; | XX     | $DFB9
    .byte $20 ; |  X     | $DFBA
    .byte $A0 ; |X X     | $DFBB
    .byte $40 ; | X      | $DFBC
    .byte $80 ; |X       | $DFBD
LDFBE:
    .byte $00 ; |        | $DFBE
    .byte $01 ; |       X| $DFBF
    .byte $00 ; |        | $DFC0
    .byte $01 ; |       X| $DFC1
    .byte $01 ; |       X| $DFC2
    .byte $02 ; |      X | $DFC3
    .byte $01 ; |       X| $DFC4
    .byte $02 ; |      X | $DFC5
    .byte $00 ; |        | $DFC6
    .byte $01 ; |       X| $DFC7
    .byte $00 ; |        | $DFC8
    .byte $01 ; |       X| $DFC9
    .byte $01 ; |       X| $DFCA
    .byte $02 ; |      X | $DFCB
    .byte $01 ; |       X| $DFCC
    .byte $02 ; |      X | $DFCD
    .byte $00 ; |        | $DFCE
    .byte $00 ; |        | $DFCF
    .byte $00 ; |        | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $00 ; |        | $DFD2
    .byte $00 ; |        | $DFD3
    .byte $00 ; |        | $DFD4
    .byte $00 ; |        | $DFD5
    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $00 ; |        | $DFD8
    .byte $00 ; |        | $DFD9
    .byte $00 ; |        | $DFDA
    .byte $00 ; |        | $DFDB
    .byte $00 ; |        | $DFDC
    .byte $00 ; |        | $DFDD
    .byte $00 ; |        | $DFDE
    .byte $00 ; |        | $DFDF
    .byte $00 ; |        | $DFE0
    .byte $00 ; |        | $DFE1
    .byte $00 ; |        | $DFE2
    .byte $00 ; |        | $DFE3
    .byte $00 ; |        | $DFE4
    .byte $00 ; |        | $DFE5
    .byte $00 ; |        | $DFE6
    .byte $00 ; |        | $DFE7
    .byte $00 ; |        | $DFE8
    .byte $00 ; |        | $DFE9
LDFEA:
    sta    LDFF9                 ; 4
    jmp    LD800                 ; 3

LDFF0:
    sta    LDFF6                 ; 4
    jmp    LD130                 ; 3

LDFF6:
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
LDFF9:
    .byte $00 ; |        | $DFF9
    .byte $00 ; |        | $DFFA
    .byte $00 ; |        | $DFFB
    .byte $00 ; |        | $DFFC
    .byte $D1 ; |XX X   X| $DFFD
    .byte $00 ; |        | $DFFE
    .byte $00 ; |        | $DFFF
      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $3000
      RORG $F000


LF000:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
LF030:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LF044:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00
LF06C:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LF0B0:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LF0C4:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00
LF0D7:
    .byte $00
LF0D8:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00
LF0EB:
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00
LF0FF:
    .byte $00
    sta    LFFF8                 ; 4
LF103:
    lda    #$FC                  ; 2
    sta    $DC                   ; 3
    sta    $DE                   ; 3
LF109:
    lda    INTIM                 ; 4
    bne    LF109                 ; 2³
    ldx    $F6                   ; 3
    lda    $83                   ; 3
    and    #$08                  ; 2
    beq    LF119                 ; 2³
    jmp    LF636                 ; 3
LF119:
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    LFE02,X               ; 4
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF127:
    dex                          ; 2
    bpl    LF127                 ; 2³
    ldx    #$8A                  ; 2
    txs                          ; 2
    sta    RESM1                 ; 3
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $85                   ; 3
    and    #$7F                  ; 2
    tax                          ; 2
    lda    LFE02,X               ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    tax                          ; 2
LF141:
    dex                          ; 2
    bpl    LF141                 ; 2³
    nop                          ; 2
    sta    RESBL                 ; 3
    sty    HMBL                  ; 3
    sta    WSYNC                 ; 3
    ldx    LF0EB                 ; 4
    lda    LFD80,X               ; 4
    sta    $EB                   ; 3
    lda    LFE02,X               ; 4
    sta    HMP0                  ; 3
    ldx    LF0FF                 ; 4
    lda    LFD00,X               ; 4
    sta    $F2                   ; 3
    lda    LFE02,X               ; 4
    sta    HMP1                  ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    lda    #$70                  ; 2
    sta    HMM0                  ; 3
    ldy    #$13                  ; 2
    sty    $F6                   ; 3
    lda    #$F2                  ; 2
    sta    $F3                   ; 3
    lda    #0                    ; 2
    cpy    $F5                   ; 3
    bne    LF17D                 ; 2³
    lda    #2                    ; 2
LF17D:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    $F4                   ; 3
    pla                          ; 4
    tax                          ; 2
    lda    $8A                   ; 3
    lsr                          ; 2
    lda    LF800,X               ; 4
    bcs    LF196                 ; 2³
    lsr                          ; 2
    sta    $EA                   ; 3
    lda    LF900,X               ; 4
    jmp    LF19C                 ; 3
LF196:
    sta    $EA                   ; 3
    lda    LF900,X               ; 4
    asl                          ; 2
LF19C:
    sta    $EE                   ; 3
    lda    #0                    ; 2
    cpy    $86                   ; 3
    bne    LF1A6                 ; 2³
    lda    #2                    ; 2
LF1A6:
    sta    ENABL                 ; 3
    lda    #0                    ; 2
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    sta    HMBL                  ; 3
    sta    $D7                   ; 3
    sta    $D8                   ; 3
    sta    $D9                   ; 3
    sta    $DA                   ; 3
    clc                          ; 2
    sta    WSYNC                 ; 3
    lda    LF0D7                 ; 4
    and    #$7F                  ; 2
    tax                          ; 2
    lda    LF1CB,X               ; 4
    sta    $DD                   ; 3
    lda    $87                   ; 3
    jmp.ind ($00F2)              ; 5
LF1CB:
    .byte $7D ; | XXXXX X| $F1CB
    .byte $07 ; |     XXX| $F1CC
    .byte $14 ; |   X X  | $F1CD
    .byte $1B ; |   XX XX| $F1CE
    .byte $2E ; |  X XXX | $F1CF
    .byte $35 ; |  XX X X| $F1D0
    .byte $3A ; |  XXX X | $F1D1
    .byte $29 ; |  X X  X| $F1D2
    .byte $59 ; | X XX  X| $F1D3
    .byte $41 ; | X     X| $F1D4
    .byte $59 ; | X XX  X| $F1D5
    .byte $48 ; | X  X   | $F1D6
    .byte $53 ; | X X  XX| $F1D7
    .byte $4F ; | X  XXXX| $F1D8
    .byte $64 ; | XX  X  | $F1D9
    .byte $60 ; | XX     | $F1DA
    .byte $6E ; | XX XXX | $F1DB
    .byte $6A ; | XX X X | $F1DC
    .byte $7B ; | XXXX XX| $F1DD
    .byte $92 ; |X  X  X | $F1DE
    .byte $A3 ; |X X   XX| $F1DF
    .byte $92 ; |X  X  X | $F1E0
    .byte $8B ; |X   X XX| $F1E1
    .byte $84 ; |X    X  | $F1E2
    .byte $82 ; |X     X | $F1E3
    .byte $82 ; |X     X | $F1E4
    .byte $0D ; |    XX X| $F1E5
    .byte $22 ; |  X   X | $F1E6
    .byte $00 ; |        | $F1E7
    .byte $B0 ; |X XX    | $F1E8
    .byte $AA ; |X X X X | $F1E9
    .byte $B7 ; |X XX XXX| $F1EA
    .byte $9D ; |X  XXX X| $F1EB
    .byte $D2 ; |XX X  X | $F1EC
    .byte $D8 ; |XX XX   | $F1ED
    .byte $C5 ; |XX   X X| $F1EE
    .byte $DE ; |XX XXXX | $F1EF
    .byte $F0 ; |XXXX    | $F1F0
    .byte $CC ; |XX  XX  | $F1F1
    .byte $E4 ; |XXX  X  | $F1F2
    .byte $75 ; | XXX X X| $F1F3
    .byte $EA ; |XXX X X | $F1F4
    .byte $F7 ; |XXXX XXX| $F1F5
    .byte $22 ; |  X   X | $F1F6
    .byte $99 ; |X  XX  X| $F1F7
    .byte $B0 ; |X XX    | $F1F8
    .byte $AA ; |X X X X | $F1F9
    .byte $B7 ; |X XX XXX| $F1FA
    .byte $9D ; |X  XXX X| $F1FB
    .byte $BE ; |X XXXXX | $F1FC
    .byte $00 ; |        | $F1FD
    .byte $00 ; |        | $F1FE
    .byte $00 ; |        | $F1FF
    adc    #$81                  ; 2
    adc    #$7E                  ; 2
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    LF06C,Y               ; 5
    jmp    LF2E8                 ; 3
    .byte $00 ; |        | $F20E
    .byte $00 ; |        | $F20F
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LF2D8                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    sta    RESP1                 ; 3
    jmp    LF2DD                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LF2DF                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    sta    $0111                 ; 4
    jmp    LF2E3                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LF2E6                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP1                ; 3
    lda    LF0C4,Y               ; 4
    sta    RESP1                 ; 3
    jmp    LF2EB                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP1                ; 3
    lda    LF0C4,Y               ; 4
    bmi    LF286                 ; 2³
    ldx    $88                   ; 3
    sta    RESP1                 ; 3
    jmp    LF28B                 ; 3
LF286:
    nop                          ; 2
    sta    RESP1                 ; 3
    ldx    $89                   ; 3
LF28B:
    jmp    LF2F4                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP1                ; 3
    lda    LF0C4,Y               ; 4
    bmi    LF2A8                 ; 2³
    ldx    $88                   ; 3
    jmp    LF2AB                 ; 3
LF2A8:
    nop                          ; 2
    ldx    $89                   ; 3
LF2AB:
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LF2F4                 ; 3
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP1                ; 3
    lda    LF0C4,Y               ; 4
    bmi    LF2CB                 ; 2³
    ldx    $88                   ; 3
    jmp    LF2CE                 ; 3
LF2CB:
    nop                          ; 2
    ldx    $89                   ; 3
LF2CE:
    stx    $F8                   ; 3
    ldx    LF0B0,Y               ; 4
    sta    RESP1                 ; 3
    jmp    LF2F9                 ; 3
LF2D8:
    lda    LFF00,X               ; 4
    sta    NUSIZ1                ; 3
LF2DD:
    lda    $87                   ; 3
LF2DF:
    adc    LFF9C,X               ; 4
    tax                          ; 2
LF2E3:
    lda    LFF82,X               ; 4
LF2E6:
    sta    COLUP1                ; 3
LF2E8:
    lda    LF0C4,Y               ; 4
LF2EB:
    bmi    LF2F2                 ; 2³
    ldx    $88                   ; 3
    jmp    LF2F4                 ; 3
LF2F2:
    ldx    $89                   ; 3
LF2F4:
    stx    $F8                   ; 3
    ldx    LF0B0,Y               ; 4
LF2F9:
    sta    WSYNC                 ; 3
    lda    LFE82,X               ; 4
    sta    NUSIZ0                ; 3
    ldy    #7                    ; 2
    nop                          ; 2
    lda    #$F3                  ; 2
    sta    $01EC                 ; 4
    jmp.ind ($00EB)              ; 5
    dey                          ; 2
    sta    $0110                 ; 4
    jmp    LF3BF                 ; 3
    dey                          ; 2
    lda    LF1CB,X               ; 4
    nop                          ; 2
    sta    RESP0                 ; 3
    jmp    LF3C2                 ; 3
    dey                          ; 2
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    sta    $0110                 ; 4
    jmp    LF3C6                 ; 3
    dey                          ; 2
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    sta    RESP0                 ; 3
    jmp    LF3CA                 ; 3
    dey                          ; 2
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    $0110                 ; 4
    jmp    LF3CD                 ; 3
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP0                ; 3
    pla                          ; 4
    sta    $0110                 ; 4
    dey                          ; 2
    jmp    LF3D0                 ; 3
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP0                ; 3
    pla                          ; 4
    tax                          ; 2
    dey                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    jmp    LF3D1                 ; 3
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP0                ; 3
    pla                          ; 4
    tax                          ; 2
    dey                          ; 2
    lda    LFA00,X               ; 4
    sta    $EB                   ; 3
    sta    RESP0                 ; 3
    jmp    LF3D6                 ; 3
    lda    LF1CB,X               ; 4
    sta    $DB                   ; 3
    lda    $87                   ; 3
    adc    LFF9C,X               ; 4
    tax                          ; 2
    lda    LFF82,X               ; 4
    sta    COLUP0                ; 3
    pla                          ; 4
    tax                          ; 2
    dey                          ; 2
    lda    LFA00,X               ; 4
    sta    $EB                   ; 3
    lda    LFB00,X               ; 4
    sta    $0110                 ; 4
    jmp    LF3D9                 ; 3
LF3BF:
    lda    LF1CB,X               ; 4
LF3C2:
    sta    $DB                   ; 3
    lda    $87                   ; 3
LF3C6:
    adc    LFF9C,X               ; 4
    tax                          ; 2
LF3CA:
    lda    LFF82,X               ; 4
LF3CD:
    sta    COLUP0                ; 3
    pla                          ; 4
LF3D0:
    tax                          ; 2
LF3D1:
    lda    LFA00,X               ; 4
    sta    $EB                   ; 3
LF3D6:
    lda    LFB00,X               ; 4
LF3D9:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    $EF                   ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    ldx    $F4                   ; 3
    stx    ENAM0                 ; 3
    pla                          ; 4
    tay                          ; 2
    lda    $F6                   ; 3
    eor    $8A                   ; 3
    lsr                          ; 2
    lda    LF800,Y               ; 4
    bcc    LF3FA                 ; 2³
    jmp    LF54B                 ; 3
LF3FA:
    sta    $EC                   ; 3
    lda    LF900,Y               ; 4
    asl                          ; 2
    sta    $F0                   ; 3
    ldy    #5                    ; 2
    lda    ($F8),Y               ; 5
    lsr    $EF                   ; 5
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    stx    ENAM1                 ; 3
    lda    $EA                   ; 3
    sta    PF1                   ; 3
    lda    $EB                   ; 3
    sta    PF2                   ; 3
    pla                          ; 4
    tax                          ; 2
    lda    $EC                   ; 3
    nop                          ; 2
    nop                          ; 2
    sta    $010F                 ; 4
    ldy    LFA00,X               ; 4
    sty    PF1                   ; 3
    sty    $ED                   ; 3
    ldy    #4                    ; 2
    lda    LFB00,X               ; 4
    lsr                          ; 2
    sta    $F1                   ; 3
    lda    ($F8),Y               ; 5
    nop                          ; 2
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EE                   ; 3
    sta    PF1                   ; 3
    lda    $EF                   ; 3
    sta    PF2                   ; 3
    ldx    $F6                   ; 3
    nop                          ; 2
    lda    $F1                   ; 3
    sta    PF1                   ; 3
    lda    $F0                   ; 3
    sta    PF2                   ; 3
    ldy    LF0EB,X               ; 4
    lda    LFD00,Y               ; 4
    sta    $F2                   ; 3
    lda    LFE02,Y               ; 4
    sta    HMP1                  ; 3
    ldy    #3                    ; 2
    lda    ($F8),Y               ; 5
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EA                   ; 3
    sta    PF1                   ; 3
    lda    $EB                   ; 3
    sta    PF2                   ; 3
    lda    LF0C4,X               ; 4
    and    #$80                  ; 2
    sta    LF044,X               ; 5
    ldy    $ED                   ; 3
    lda    $EC                   ; 3
    sta    PF2                   ; 3
    sty    PF1                   ; 3
    ldy    #2                    ; 2
    dex                          ; 2
    lda    #0                    ; 2
    cpx    $F5                   ; 3
    bne    LF492                 ; 2³
    lda    #2                    ; 2
LF492:
    sta    $F4                   ; 3
    lda    ($F8),Y               ; 5
    sta    WSYNC                 ; 3
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EE                   ; 3
    sta    PF1                   ; 3
    lda    $EF                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    $F1                   ; 3
    sta    PF1                   ; 3
    lda    $F0                   ; 3
    sta    $010F                 ; 4
    ldx    $EB                   ; 3
    pla                          ; 4
    ldx    $EB                   ; 3
    ldy    $EA                   ; 3
    stx    PF2                   ; 3
    tax                          ; 2
    sty    PF1                   ; 3
    ldy    #1                    ; 2
    lda    ($F8),Y               ; 5
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    LF900,X               ; 4
    sta    $EE                   ; 3
    lda    LF800,X               ; 4
    lsr                          ; 2
    sta    $EA                   ; 3
    lda    $ED                   ; 3
    sta    PF1                   ; 3
    lda    $EC                   ; 3
    sta    $010F                 ; 4
    sta    PF2                   ; 3
LF4E5:
    dey                          ; 2
    ldx    $F6                   ; 3
    tya                          ; 2
    sta    LF030,X               ; 5
    lda    ($DB),Y               ; 5
    nop                          ; 2
    sty    ENAM1                 ; 3
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    tya                          ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    $F6                   ; 5
    bmi    LF548                 ; 2³
    ldy    $F6                   ; 3
    cpy    $86                   ; 3
    beq    LF509                 ; 2³
    jmp    LF50B                 ; 3
LF509:
    lda    #2                    ; 2
LF50B:
    sta    ENABL                 ; 3
    ldx    LF0D8,Y               ; 4
    lda    LFD80,X               ; 4
    sta    $EB                   ; 3
    lda    LFE02,X               ; 4
    sta    HMP0                  ; 3
    lda    LF0C4,Y               ; 4
    and    #$7F                  ; 2
    tax                          ; 2
    lda    $F7                   ; 3
    lda    LF1CB,X               ; 4
    sta    $DD                   ; 3
    cpy    #6                    ; 2
    bcs    LF53A                 ; 2³
    lda    $F7                   ; 3
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    jmp.ind ($00F2)              ; 5
LF53A:
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    clc                          ; 2
    jmp.ind ($00F2)              ; 5
LF548:
    jmp    LFFEA                 ; 3
LF54B:
    lsr                          ; 2
    sta    $EC                   ; 3
    lda    LF900,Y               ; 4
    sta    $F0                   ; 3
    ldy    #5                    ; 2
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F8),Y               ; 5
    sta    COLUPF                ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    stx    ENAM1                 ; 3
    lda    $EA                   ; 3
    sta    PF1                   ; 3
    asl    $EB                   ; 5
    lda    $EB                   ; 3
    sta    PF2                   ; 3
    pla                          ; 4
    tax                          ; 2
    lda    $EC                   ; 3
    ldy    #4                    ; 2
    sta    $010F                 ; 4
    lda    LFA00,X               ; 4
    asl                          ; 2
    sta    PF1                   ; 3
    sta    $ED                   ; 3
    lda    LFB00,X               ; 4
    sta    $F1                   ; 3
    lda    ($F8),Y               ; 5
    nop                          ; 2
    nop                          ; 2
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EE                   ; 3
    sta    PF1                   ; 3
    lda    $EF                   ; 3
    sta    PF2                   ; 3
    ldx    $F6                   ; 3
    nop                          ; 2
    lda    $F1                   ; 3
    sta    PF1                   ; 3
    lda    $F0                   ; 3
    sta    PF2                   ; 3
    ldy    LF0EB,X               ; 4
    lda    LFD00,Y               ; 4
    sta    $F2                   ; 3
    lda    LFE02,Y               ; 4
    sta    HMP1                  ; 3
    ldy    #3                    ; 2
    lda    ($F8),Y               ; 5
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EA                   ; 3
    sta    PF1                   ; 3
    lda    $EB                   ; 3
    sta    PF2                   ; 3
    lda    LF0C4,X               ; 4
    and    #$80                  ; 2
    sta    LF044,X               ; 5
    ldy    $ED                   ; 3
    lda    $EC                   ; 3
    sta    PF2                   ; 3
    sty    PF1                   ; 3
    ldy    #2                    ; 2
    dex                          ; 2
    lda    #0                    ; 2
    cpx    $F5                   ; 3
    bne    LF5E2                 ; 2³
    lda    #2                    ; 2
LF5E2:
    sta    $F4                   ; 3
    lda    ($F8),Y               ; 5
    sta    WSYNC                 ; 3
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EE                   ; 3
    sta    PF1                   ; 3
    lda    $EF                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    $F1                   ; 3
    sta    PF1                   ; 3
    lda    $F0                   ; 3
    sta    $010F                 ; 4
    ldx    $EB                   ; 3
    pla                          ; 4
    ldx    $EB                   ; 3
    ldy    $EA                   ; 3
    stx    PF2                   ; 3
    tax                          ; 2
    sty    PF1                   ; 3
    ldy    #1                    ; 2
    lda    ($F8),Y               ; 5
    sta    COLUPF                ; 3
    lda    ($DB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($DD),Y               ; 5
    sta    GRP1                  ; 3
    lda    LF900,X               ; 4
    asl                          ; 2
    sta    $EE                   ; 3
    lda    LF800,X               ; 4
    sta    $EA                   ; 3
    lda    $ED                   ; 3
    sta    PF1                   ; 3
    lda    $EC                   ; 3
    sta    $010F                 ; 4
    jmp    LF4E5                 ; 3
LF636:
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    ldy    #$0F                  ; 2
    ldx    #$0A                  ; 2
LF63E:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF63E                 ; 2³
    ldx    #0                    ; 2
LF645:
    sta    WSYNC                 ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    ldx    #5                    ; 2
LF651:
    sta    WSYNC                 ; 3
    lda    LF7BA,Y               ; 4
    and    #$AA                  ; 2
    sta    PF1                   ; 3
    lda    LF7CA,Y               ; 4
    and    #$55                  ; 2
    sta    PF2                   ; 3
    lda    LF7F9,X               ; 4
    sta    COLUPF                ; 3
    txa                          ; 2
    lsr                          ; 2
    lda    LF7EA,Y               ; 4
    and    #$55                  ; 2
    sta    $010E                 ; 4
    lda    LF7DA,Y               ; 4
    and    #$AA                  ; 2
    sta    PF2                   ; 3
    bcc    LF67C                 ; 2³
    dey                          ; 2
    bcs    LF67D                 ; 2³
LF67C:
    iny                          ; 2
LF67D:
    dex                          ; 2
    bne    LF651                 ; 2³
    iny                          ; 2
    sta    WSYNC                 ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    ldx    #5                    ; 2
LF68D:
    sta    WSYNC                 ; 3
    lda    LF7BA,Y               ; 4
    and    #$55                  ; 2
    sta    PF1                   ; 3
    lda    LF7CA,Y               ; 4
    and    #$AA                  ; 2
    sta    PF2                   ; 3
    lda    LF7F9,X               ; 4
    sta    COLUPF                ; 3
    txa                          ; 2
    lsr                          ; 2
    lda    LF7EA,Y               ; 4
    and    #$AA                  ; 2
    sta    $010E                 ; 4
    lda    LF7DA,Y               ; 4
    and    #$55                  ; 2
    sta    PF2                   ; 3
    bcc    LF6B8                 ; 2³
    dey                          ; 2
    bcs    LF6B9                 ; 2³
LF6B8:
    iny                          ; 2
LF6B9:
    dex                          ; 2
    bne    LF68D                 ; 2³
    dey                          ; 2
    bpl    LF645                 ; 2³
    sta    WSYNC                 ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP0                  ; 3
    stx    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #1                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$17                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    $EB                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LF6E5:
    ldy    $EB                   ; 3
    ldx    LF72A,Y               ; 4
    lda    LF742,Y               ; 4
    sta    WSYNC                 ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    LF75A,Y               ; 4
    sta    GRP0                  ; 3
    lda    LF78A,Y               ; 4
    sta    $EA                   ; 3
    lda    #$D8                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    LF7A2,Y               ; 4
    ldx    LF772,Y               ; 4
    ldy    $EA                   ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $EB                   ; 5
    bpl    LF6E5                 ; 2³+1
    ldy    #0                    ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    jmp    LFFEA                 ; 3
LF72A:
    .byte $7F ; | XXXXXXX| $F72A
    .byte $E3 ; |XXX   XX| $F72B
    .byte $DD ; |XX XXX X| $F72C
    .byte $D1 ; |XX X   X| $F72D
    .byte $DD ; |XX XXX X| $F72E
    .byte $E3 ; |XXX   XX| $F72F
    .byte $FF ; |XXXXXXXX| $F730
    .byte $FF ; |XXXXXXXX| $F731
    .byte $99 ; |X  XX  X| $F732
    .byte $99 ; |X  XX  X| $F733
    .byte $99 ; |X  XX  X| $F734
    .byte $99 ; |X  XX  X| $F735
    .byte $99 ; |X  XX  X| $F736
    .byte $99 ; |X  XX  X| $F737
    .byte $99 ; |X  XX  X| $F738
    .byte $99 ; |X  XX  X| $F739
    .byte $99 ; |X  XX  X| $F73A
    .byte $99 ; |X  XX  X| $F73B
    .byte $99 ; |X  XX  X| $F73C
    .byte $90 ; |X  X    | $F73D
    .byte $80 ; |X       | $F73E
    .byte $86 ; |X    XX | $F73F
    .byte $CF ; |XX  XXXX| $F740
    .byte $7F ; | XXXXXXX| $F741
LF742:
    .byte $FF ; |XXXXXXXX| $F742
    .byte $A6 ; |X X  XX | $F743
    .byte $BA ; |X XXX X | $F744
    .byte $A3 ; |X X   XX| $F745
    .byte $AA ; |X X X X | $F746
    .byte $A2 ; |X X   X | $F747
    .byte $FF ; |XXXXXXXX| $F748
    .byte $FF ; |XXXXXXXX| $F749
    .byte $92 ; |X  X  X | $F74A
    .byte $92 ; |X  X  X | $F74B
    .byte $92 ; |X  X  X | $F74C
    .byte $92 ; |X  X  X | $F74D
    .byte $92 ; |X  X  X | $F74E
    .byte $92 ; |X  X  X | $F74F
    .byte $92 ; |X  X  X | $F750
    .byte $92 ; |X  X  X | $F751
    .byte $92 ; |X  X  X | $F752
    .byte $92 ; |X  X  X | $F753
    .byte $9E ; |X  XXXX | $F754
    .byte $92 ; |X  X  X | $F755
    .byte $12 ; |   X  X | $F756
    .byte $12 ; |   X  X | $F757
    .byte $3E ; |  XXXXX | $F758
    .byte $FF ; |XXXXXXXX| $F759
LF75A:
    .byte $FF ; |XXXXXXXX| $F75A
    .byte $3B ; |  XXX XX| $F75B
    .byte $BB ; |X XXX XX| $F75C
    .byte $63 ; | XX   XX| $F75D
    .byte $AB ; |X X X XX| $F75E
    .byte $2B ; |  X X XX| $F75F
    .byte $FF ; |XXXXXXXX| $F760
    .byte $FF ; |XXXXXXXX| $F761
    .byte $49 ; | X  X  X| $F762
    .byte $49 ; | X  X  X| $F763
    .byte $49 ; | X  X  X| $F764
    .byte $49 ; | X  X  X| $F765
    .byte $49 ; | X  X  X| $F766
    .byte $49 ; | X  X  X| $F767
    .byte $49 ; | X  X  X| $F768
    .byte $49 ; | X  X  X| $F769
    .byte $49 ; | X  X  X| $F76A
    .byte $49 ; | X  X  X| $F76B
    .byte $4F ; | X  XXXX| $F76C
    .byte $49 ; | X  X  X| $F76D
    .byte $49 ; | X  X  X| $F76E
    .byte $49 ; | X  X  X| $F76F
    .byte $4F ; | X  XXXX| $F770
    .byte $FF ; |XXXXXXXX| $F771
LF772:
    .byte $FF ; |XXXXXXXX| $F772
    .byte $35 ; |  XX X X| $F773
    .byte $31 ; |  XX   X| $F774
    .byte $35 ; |  XX X X| $F775
    .byte $35 ; |  XX X X| $F776
    .byte $3B ; |  XXX XX| $F777
    .byte $3F ; |  XXXXXX| $F778
    .byte $3F ; |  XXXXXX| $F779
    .byte $2E ; |  X XXX | $F77A
    .byte $26 ; |  X  XX | $F77B
    .byte $32 ; |  XX  X | $F77C
    .byte $32 ; |  XX  X | $F77D
    .byte $32 ; |  XX  X | $F77E
    .byte $32 ; |  XX  X | $F77F
    .byte $32 ; |  XX  X | $F780
    .byte $32 ; |  XX  X | $F781
    .byte $26 ; |  X  XX | $F782
    .byte $0E ; |    XXX | $F783
    .byte $FF ; |XXXXXXXX| $F784
    .byte $FF ; |XXXXXXXX| $F785
    .byte $FF ; |XXXXXXXX| $F786
    .byte $FF ; |XXXXXXXX| $F787
    .byte $FF ; |XXXXXXXX| $F788
    .byte $FF ; |XXXXXXXX| $F789
LF78A:
    .byte $FF ; |XXXXXXXX| $F78A
    .byte $B5 ; |X XX X X| $F78B
    .byte $B1 ; |X XX   X| $F78C
    .byte $B5 ; |X XX X X| $F78D
    .byte $B5 ; |X XX X X| $F78E
    .byte $1B ; |   XX XX| $F78F
    .byte $FF ; |XXXXXXXX| $F790
    .byte $FF ; |XXXXXXXX| $F791
    .byte $1C ; |   XXX  | $F792
    .byte $79 ; | XXXX  X| $F793
    .byte $73 ; | XXX  XX| $F794
    .byte $73 ; | XXX  XX| $F795
    .byte $73 ; | XXX  XX| $F796
    .byte $13 ; |   X  XX| $F797
    .byte $73 ; | XXX  XX| $F798
    .byte $73 ; | XXX  XX| $F799
    .byte $79 ; | XXXX  X| $F79A
    .byte $1C ; |   XXX  | $F79B
    .byte $FF ; |XXXXXXXX| $F79C
    .byte $FF ; |XXXXXXXX| $F79D
    .byte $FF ; |XXXXXXXX| $F79E
    .byte $FF ; |XXXXXXXX| $F79F
    .byte $FF ; |XXXXXXXX| $F7A0
    .byte $FF ; |XXXXXXXX| $F7A1
LF7A2:
    .byte $FE ; |XXXXXXX | $F7A2
    .byte $57 ; | X X XXX| $F7A3
    .byte $57 ; | X X XXX| $F7A4
    .byte $37 ; |  XX XXX| $F7A5
    .byte $57 ; | X X XXX| $F7A6
    .byte $17 ; |   X XXX| $F7A7
    .byte $FF ; |XXXXXXXX| $F7A8
    .byte $FF ; |XXXXXXXX| $F7A9
    .byte $21 ; |  X    X| $F7AA
    .byte $27 ; |  X  XXX| $F7AB
    .byte $27 ; |  X  XXX| $F7AC
    .byte $27 ; |  X  XXX| $F7AD
    .byte $27 ; |  X  XXX| $F7AE
    .byte $21 ; |  X    X| $F7AF
    .byte $27 ; |  X  XXX| $F7B0
    .byte $27 ; |  X  XXX| $F7B1
    .byte $27 ; |  X  XXX| $F7B2
    .byte $21 ; |  X    X| $F7B3
    .byte $3F ; |  XXXXXX| $F7B4
    .byte $3F ; |  XXXXXX| $F7B5
    .byte $3F ; |  XXXXXX| $F7B6
    .byte $3F ; |  XXXXXX| $F7B7
    .byte $3F ; |  XXXXXX| $F7B8
    .byte $FE ; |XXXXXXX | $F7B9
LF7BA:
    .byte $00 ; |        | $F7BA
    .byte $00 ; |        | $F7BB
    .byte $00 ; |        | $F7BC
    .byte $01 ; |       X| $F7BD
    .byte $00 ; |        | $F7BE
    .byte $01 ; |       X| $F7BF
    .byte $00 ; |        | $F7C0
    .byte $00 ; |        | $F7C1
    .byte $0B ; |    X XX| $F7C2
    .byte $0B ; |    X XX| $F7C3
    .byte $3A ; |  XXX X | $F7C4
    .byte $3F ; |  XXXXXX| $F7C5
    .byte $1F ; |   XXXXX| $F7C6
    .byte $1F ; |   XXXXX| $F7C7
    .byte $05 ; |     X X| $F7C8
    .byte $05 ; |     X X| $F7C9
LF7CA:
    .byte $00 ; |        | $F7CA
    .byte $55 ; | X X X X| $F7CB
    .byte $00 ; |        | $F7CC
    .byte $FF ; |XXXXXXXX| $F7CD
    .byte $00 ; |        | $F7CE
    .byte $FF ; |XXXXXXXX| $F7CF
    .byte $00 ; |        | $F7D0
    .byte $FE ; |XXXXXXX | $F7D1
    .byte $02 ; |      X | $F7D2
    .byte $FF ; |XXXXXXXX| $F7D3
    .byte $F5 ; |XXXX X X| $F7D4
    .byte $FF ; |XXXXXXXX| $F7D5
    .byte $FF ; |XXXXXXXX| $F7D6
    .byte $FF ; |XXXXXXXX| $F7D7
    .byte $FF ; |XXXXXXXX| $F7D8
    .byte $FF ; |XXXXXXXX| $F7D9
LF7DA:
    .byte $00 ; |        | $F7DA
    .byte $A0 ; |X X     | $F7DB
    .byte $00 ; |        | $F7DC
    .byte $C0 ; |XX      | $F7DD
    .byte $00 ; |        | $F7DE
    .byte $E0 ; |XXX     | $F7DF
    .byte $05 ; |     X X| $F7E0
    .byte $FF ; |XXXXXXXX| $F7E1
    .byte $0A ; |    X X | $F7E2
    .byte $FF ; |XXXXXXXX| $F7E3
    .byte $FF ; |XXXXXXXX| $F7E4
    .byte $FF ; |XXXXXXXX| $F7E5
    .byte $FF ; |XXXXXXXX| $F7E6
    .byte $FF ; |XXXXXXXX| $F7E7
    .byte $F5 ; |XXXX X X| $F7E8
    .byte $F5 ; |XXXX X X| $F7E9
LF7EA:
    .byte $00 ; |        | $F7EA
    .byte $00 ; |        | $F7EB
    .byte $00 ; |        | $F7EC
    .byte $00 ; |        | $F7ED
    .byte $15 ; |   X X X| $F7EE
    .byte $15 ; |   X X X| $F7EF
    .byte $70 ; | XXX    | $F7F0
    .byte $7F ; | XXXXXXX| $F7F1
    .byte $7F ; | XXXXXXX| $F7F2
    .byte $7F ; | XXXXXXX| $F7F3
    .byte $3F ; |  XXXXXX| $F7F4
    .byte $3F ; |  XXXXXX| $F7F5
    .byte $0B ; |    X XX| $F7F6
    .byte $0B ; |    X XX| $F7F7
    .byte $00 ; |        | $F7F8
LF7F9:
    .byte $00 ; |        | $F7F9
    .byte $46 ; | X   XX | $F7FA
    .byte $88 ; |X   X   | $F7FB
    .byte $44 ; | X   X  | $F7FC
    .byte $84 ; |X    X  | $F7FD
    .byte $42 ; | X    X | $F7FE
    .byte $00 ; |        | $F7FF
LF800:
    .byte $00 ; |        | $F800
    .byte $02 ; |      X | $F801
    .byte $03 ; |      XX| $F802
    .byte $02 ; |      X | $F803
    .byte $08 ; |    X   | $F804
    .byte $0A ; |    X X | $F805
    .byte $0B ; |    X XX| $F806
    .byte $0A ; |    X X | $F807
    .byte $0C ; |    XX  | $F808
    .byte $0E ; |    XXX | $F809
    .byte $0F ; |    XXXX| $F80A
    .byte $0E ; |    XXX | $F80B
    .byte $08 ; |    X   | $F80C
    .byte $0A ; |    X X | $F80D
    .byte $0B ; |    X XX| $F80E
    .byte $0A ; |    X X | $F80F
    .byte $20 ; |  X     | $F810
    .byte $22 ; |  X   X | $F811
    .byte $23 ; |  X   XX| $F812
    .byte $22 ; |  X   X | $F813
    .byte $28 ; |  X X   | $F814
    .byte $2A ; |  X X X | $F815
    .byte $2B ; |  X X XX| $F816
    .byte $2A ; |  X X X | $F817
    .byte $2C ; |  X XX  | $F818
    .byte $2E ; |  X XXX | $F819
    .byte $2F ; |  X XXXX| $F81A
    .byte $2E ; |  X XXX | $F81B
    .byte $28 ; |  X X   | $F81C
    .byte $2A ; |  X X X | $F81D
    .byte $2B ; |  X X XX| $F81E
    .byte $2A ; |  X X X | $F81F
    .byte $30 ; |  XX    | $F820
    .byte $32 ; |  XX  X | $F821
    .byte $33 ; |  XX  XX| $F822
    .byte $32 ; |  XX  X | $F823
    .byte $38 ; |  XXX   | $F824
    .byte $3A ; |  XXX X | $F825
    .byte $3B ; |  XXX XX| $F826
    .byte $3A ; |  XXX X | $F827
    .byte $3C ; |  XXXX  | $F828
    .byte $3E ; |  XXXXX | $F829
    .byte $3F ; |  XXXXXX| $F82A
    .byte $3E ; |  XXXXX | $F82B
    .byte $38 ; |  XXX   | $F82C
    .byte $3A ; |  XXX X | $F82D
    .byte $3B ; |  XXX XX| $F82E
    .byte $3A ; |  XXX X | $F82F
    .byte $20 ; |  X     | $F830
    .byte $22 ; |  X   X | $F831
    .byte $23 ; |  X   XX| $F832
    .byte $22 ; |  X   X | $F833
    .byte $28 ; |  X X   | $F834
    .byte $2A ; |  X X X | $F835
    .byte $2B ; |  X X XX| $F836
    .byte $2A ; |  X X X | $F837
    .byte $2C ; |  X XX  | $F838
    .byte $2E ; |  X XXX | $F839
    .byte $2F ; |  X XXXX| $F83A
    .byte $2E ; |  X XXX | $F83B
    .byte $28 ; |  X X   | $F83C
    .byte $2A ; |  X X X | $F83D
    .byte $2B ; |  X X XX| $F83E
    .byte $2A ; |  X X X | $F83F
    .byte $80 ; |X       | $F840
    .byte $82 ; |X     X | $F841
    .byte $83 ; |X     XX| $F842
    .byte $82 ; |X     X | $F843
    .byte $88 ; |X   X   | $F844
    .byte $8A ; |X   X X | $F845
    .byte $8B ; |X   X XX| $F846
    .byte $8A ; |X   X X | $F847
    .byte $8C ; |X   XX  | $F848
    .byte $8E ; |X   XXX | $F849
    .byte $8F ; |X   XXXX| $F84A
    .byte $8E ; |X   XXX | $F84B
    .byte $88 ; |X   X   | $F84C
    .byte $8A ; |X   X X | $F84D
    .byte $8B ; |X   X XX| $F84E
    .byte $8A ; |X   X X | $F84F
    .byte $A0 ; |X X     | $F850
    .byte $A2 ; |X X   X | $F851
    .byte $A3 ; |X X   XX| $F852
    .byte $A2 ; |X X   X | $F853
    .byte $A8 ; |X X X   | $F854
    .byte $AA ; |X X X X | $F855
    .byte $AB ; |X X X XX| $F856
    .byte $AA ; |X X X X | $F857
    .byte $AC ; |X X XX  | $F858
    .byte $AE ; |X X XXX | $F859
    .byte $AF ; |X X XXXX| $F85A
    .byte $AE ; |X X XXX | $F85B
    .byte $A8 ; |X X X   | $F85C
    .byte $AA ; |X X X X | $F85D
    .byte $AB ; |X X X XX| $F85E
    .byte $AA ; |X X X X | $F85F
    .byte $B0 ; |X XX    | $F860
    .byte $B2 ; |X XX  X | $F861
    .byte $B3 ; |X XX  XX| $F862
    .byte $B2 ; |X XX  X | $F863
    .byte $B8 ; |X XXX   | $F864
    .byte $BA ; |X XXX X | $F865
    .byte $BB ; |X XXX XX| $F866
    .byte $BA ; |X XXX X | $F867
    .byte $BC ; |X XXXX  | $F868
    .byte $BE ; |X XXXXX | $F869
    .byte $BF ; |X XXXXXX| $F86A
    .byte $BE ; |X XXXXX | $F86B
    .byte $B8 ; |X XXX   | $F86C
    .byte $BA ; |X XXX X | $F86D
    .byte $BB ; |X XXX XX| $F86E
    .byte $BA ; |X XXX X | $F86F
    .byte $A0 ; |X X     | $F870
    .byte $A2 ; |X X   X | $F871
    .byte $A3 ; |X X   XX| $F872
    .byte $A2 ; |X X   X | $F873
    .byte $A8 ; |X X X   | $F874
    .byte $AA ; |X X X X | $F875
    .byte $AB ; |X X X XX| $F876
    .byte $AA ; |X X X X | $F877
    .byte $AC ; |X X XX  | $F878
    .byte $AE ; |X X XXX | $F879
    .byte $AF ; |X X XXXX| $F87A
    .byte $AE ; |X X XXX | $F87B
    .byte $A8 ; |X X X   | $F87C
    .byte $AA ; |X X X X | $F87D
    .byte $AB ; |X X X XX| $F87E
    .byte $AA ; |X X X X | $F87F
    .byte $C0 ; |XX      | $F880
    .byte $C2 ; |XX    X | $F881
    .byte $C3 ; |XX    XX| $F882
    .byte $C2 ; |XX    X | $F883
    .byte $C8 ; |XX  X   | $F884
    .byte $CA ; |XX  X X | $F885
    .byte $CB ; |XX  X XX| $F886
    .byte $CA ; |XX  X X | $F887
    .byte $CC ; |XX  XX  | $F888
    .byte $CE ; |XX  XXX | $F889
    .byte $CF ; |XX  XXXX| $F88A
    .byte $CE ; |XX  XXX | $F88B
    .byte $C8 ; |XX  X   | $F88C
    .byte $CA ; |XX  X X | $F88D
    .byte $CB ; |XX  X XX| $F88E
    .byte $CA ; |XX  X X | $F88F
    .byte $E0 ; |XXX     | $F890
    .byte $E2 ; |XXX   X | $F891
    .byte $E3 ; |XXX   XX| $F892
    .byte $E2 ; |XXX   X | $F893
    .byte $E8 ; |XXX X   | $F894
    .byte $EA ; |XXX X X | $F895
    .byte $EB ; |XXX X XX| $F896
    .byte $EA ; |XXX X X | $F897
    .byte $EC ; |XXX XX  | $F898
    .byte $EE ; |XXX XXX | $F899
    .byte $EF ; |XXX XXXX| $F89A
    .byte $EE ; |XXX XXX | $F89B
    .byte $E8 ; |XXX X   | $F89C
    .byte $EA ; |XXX X X | $F89D
    .byte $EB ; |XXX X XX| $F89E
    .byte $EA ; |XXX X X | $F89F
    .byte $F0 ; |XXXX    | $F8A0
    .byte $F2 ; |XXXX  X | $F8A1
    .byte $F3 ; |XXXX  XX| $F8A2
    .byte $F2 ; |XXXX  X | $F8A3
    .byte $F8 ; |XXXXX   | $F8A4
    .byte $FA ; |XXXXX X | $F8A5
    .byte $FB ; |XXXXX XX| $F8A6
    .byte $FA ; |XXXXX X | $F8A7
    .byte $FC ; |XXXXXX  | $F8A8
    .byte $FE ; |XXXXXXX | $F8A9
    .byte $FF ; |XXXXXXXX| $F8AA
    .byte $FE ; |XXXXXXX | $F8AB
    .byte $F8 ; |XXXXX   | $F8AC
    .byte $FA ; |XXXXX X | $F8AD
    .byte $FB ; |XXXXX XX| $F8AE
    .byte $FA ; |XXXXX X | $F8AF
    .byte $E0 ; |XXX     | $F8B0
    .byte $E2 ; |XXX   X | $F8B1
    .byte $E3 ; |XXX   XX| $F8B2
    .byte $E2 ; |XXX   X | $F8B3
    .byte $E8 ; |XXX X   | $F8B4
    .byte $EA ; |XXX X X | $F8B5
    .byte $EB ; |XXX X XX| $F8B6
    .byte $EA ; |XXX X X | $F8B7
    .byte $EC ; |XXX XX  | $F8B8
    .byte $EE ; |XXX XXX | $F8B9
    .byte $EF ; |XXX XXXX| $F8BA
    .byte $EE ; |XXX XXX | $F8BB
    .byte $E8 ; |XXX X   | $F8BC
    .byte $EA ; |XXX X X | $F8BD
    .byte $EB ; |XXX X XX| $F8BE
    .byte $EA ; |XXX X X | $F8BF
    .byte $80 ; |X       | $F8C0
    .byte $82 ; |X     X | $F8C1
    .byte $83 ; |X     XX| $F8C2
    .byte $82 ; |X     X | $F8C3
    .byte $88 ; |X   X   | $F8C4
    .byte $8A ; |X   X X | $F8C5
    .byte $8B ; |X   X XX| $F8C6
    .byte $8A ; |X   X X | $F8C7
    .byte $8C ; |X   XX  | $F8C8
    .byte $8E ; |X   XXX | $F8C9
    .byte $8F ; |X   XXXX| $F8CA
    .byte $8E ; |X   XXX | $F8CB
    .byte $88 ; |X   X   | $F8CC
    .byte $8A ; |X   X X | $F8CD
    .byte $8B ; |X   X XX| $F8CE
    .byte $8A ; |X   X X | $F8CF
    .byte $A0 ; |X X     | $F8D0
    .byte $A2 ; |X X   X | $F8D1
    .byte $A3 ; |X X   XX| $F8D2
    .byte $A2 ; |X X   X | $F8D3
    .byte $A8 ; |X X X   | $F8D4
    .byte $AA ; |X X X X | $F8D5
    .byte $AB ; |X X X XX| $F8D6
    .byte $AA ; |X X X X | $F8D7
    .byte $AC ; |X X XX  | $F8D8
    .byte $AE ; |X X XXX | $F8D9
    .byte $AF ; |X X XXXX| $F8DA
    .byte $AE ; |X X XXX | $F8DB
    .byte $A8 ; |X X X   | $F8DC
    .byte $AA ; |X X X X | $F8DD
    .byte $AB ; |X X X XX| $F8DE
    .byte $AA ; |X X X X | $F8DF
    .byte $B0 ; |X XX    | $F8E0
    .byte $B2 ; |X XX  X | $F8E1
    .byte $B3 ; |X XX  XX| $F8E2
    .byte $B2 ; |X XX  X | $F8E3
    .byte $B8 ; |X XXX   | $F8E4
    .byte $BA ; |X XXX X | $F8E5
    .byte $BB ; |X XXX XX| $F8E6
    .byte $BA ; |X XXX X | $F8E7
    .byte $BC ; |X XXXX  | $F8E8
    .byte $BE ; |X XXXXX | $F8E9
    .byte $BF ; |X XXXXXX| $F8EA
    .byte $BE ; |X XXXXX | $F8EB
    .byte $B8 ; |X XXX   | $F8EC
    .byte $BA ; |X XXX X | $F8ED
    .byte $BB ; |X XXX XX| $F8EE
    .byte $BA ; |X XXX X | $F8EF
    .byte $A0 ; |X X     | $F8F0
    .byte $A2 ; |X X   X | $F8F1
    .byte $A3 ; |X X   XX| $F8F2
    .byte $A2 ; |X X   X | $F8F3
    .byte $A8 ; |X X X   | $F8F4
    .byte $AA ; |X X X X | $F8F5
    .byte $AB ; |X X X XX| $F8F6
    .byte $AA ; |X X X X | $F8F7
    .byte $AC ; |X X XX  | $F8F8
    .byte $AE ; |X X XXX | $F8F9
    .byte $AF ; |X X XXXX| $F8FA
    .byte $AE ; |X X XXX | $F8FB
    .byte $A8 ; |X X X   | $F8FC
    .byte $AA ; |X X X X | $F8FD
    .byte $AB ; |X X X XX| $F8FE
    .byte $AA ; |X X X X | $F8FF
LF900:
    .byte $00 ; |        | $F900
    .byte $01 ; |       X| $F901
    .byte $00 ; |        | $F902
    .byte $00 ; |        | $F903
    .byte $04 ; |     X  | $F904
    .byte $05 ; |     X X| $F905
    .byte $04 ; |     X  | $F906
    .byte $04 ; |     X  | $F907
    .byte $00 ; |        | $F908
    .byte $01 ; |       X| $F909
    .byte $00 ; |        | $F90A
    .byte $00 ; |        | $F90B
    .byte $00 ; |        | $F90C
    .byte $01 ; |       X| $F90D
    .byte $00 ; |        | $F90E
    .byte $00 ; |        | $F90F
    .byte $10 ; |   X    | $F910
    .byte $11 ; |   X   X| $F911
    .byte $10 ; |   X    | $F912
    .byte $10 ; |   X    | $F913
    .byte $14 ; |   X X  | $F914
    .byte $15 ; |   X X X| $F915
    .byte $14 ; |   X X  | $F916
    .byte $14 ; |   X X  | $F917
    .byte $10 ; |   X    | $F918
    .byte $11 ; |   X   X| $F919
    .byte $10 ; |   X    | $F91A
    .byte $10 ; |   X    | $F91B
    .byte $10 ; |   X    | $F91C
    .byte $11 ; |   X   X| $F91D
    .byte $10 ; |   X    | $F91E
    .byte $10 ; |   X    | $F91F
    .byte $00 ; |        | $F920
    .byte $01 ; |       X| $F921
    .byte $00 ; |        | $F922
    .byte $00 ; |        | $F923
    .byte $04 ; |     X  | $F924
    .byte $05 ; |     X X| $F925
    .byte $04 ; |     X  | $F926
    .byte $04 ; |     X  | $F927
    .byte $00 ; |        | $F928
    .byte $01 ; |       X| $F929
    .byte $00 ; |        | $F92A
    .byte $00 ; |        | $F92B
    .byte $00 ; |        | $F92C
    .byte $01 ; |       X| $F92D
    .byte $00 ; |        | $F92E
    .byte $00 ; |        | $F92F
    .byte $00 ; |        | $F930
    .byte $01 ; |       X| $F931
    .byte $00 ; |        | $F932
    .byte $00 ; |        | $F933
    .byte $04 ; |     X  | $F934
    .byte $05 ; |     X X| $F935
    .byte $04 ; |     X  | $F936
    .byte $04 ; |     X  | $F937
    .byte $00 ; |        | $F938
    .byte $01 ; |       X| $F939
    .byte $00 ; |        | $F93A
    .byte $00 ; |        | $F93B
    .byte $00 ; |        | $F93C
    .byte $01 ; |       X| $F93D
    .byte $00 ; |        | $F93E
    .byte $00 ; |        | $F93F
    .byte $40 ; | X      | $F940
    .byte $41 ; | X     X| $F941
    .byte $40 ; | X      | $F942
    .byte $40 ; | X      | $F943
    .byte $44 ; | X   X  | $F944
    .byte $45 ; | X   X X| $F945
    .byte $44 ; | X   X  | $F946
    .byte $44 ; | X   X  | $F947
    .byte $40 ; | X      | $F948
    .byte $41 ; | X     X| $F949
    .byte $40 ; | X      | $F94A
    .byte $40 ; | X      | $F94B
    .byte $40 ; | X      | $F94C
    .byte $41 ; | X     X| $F94D
    .byte $40 ; | X      | $F94E
    .byte $40 ; | X      | $F94F
    .byte $50 ; | X X    | $F950
    .byte $51 ; | X X   X| $F951
    .byte $50 ; | X X    | $F952
    .byte $50 ; | X X    | $F953
    .byte $54 ; | X X X  | $F954
    .byte $55 ; | X X X X| $F955
    .byte $54 ; | X X X  | $F956
    .byte $54 ; | X X X  | $F957
    .byte $50 ; | X X    | $F958
    .byte $51 ; | X X   X| $F959
    .byte $50 ; | X X    | $F95A
    .byte $50 ; | X X    | $F95B
    .byte $50 ; | X X    | $F95C
    .byte $51 ; | X X   X| $F95D
    .byte $50 ; | X X    | $F95E
    .byte $50 ; | X X    | $F95F
    .byte $40 ; | X      | $F960
    .byte $41 ; | X     X| $F961
    .byte $40 ; | X      | $F962
    .byte $40 ; | X      | $F963
    .byte $44 ; | X   X  | $F964
    .byte $45 ; | X   X X| $F965
    .byte $44 ; | X   X  | $F966
    .byte $44 ; | X   X  | $F967
    .byte $40 ; | X      | $F968
    .byte $41 ; | X     X| $F969
    .byte $40 ; | X      | $F96A
    .byte $40 ; | X      | $F96B
    .byte $40 ; | X      | $F96C
    .byte $41 ; | X     X| $F96D
    .byte $40 ; | X      | $F96E
    .byte $40 ; | X      | $F96F
    .byte $40 ; | X      | $F970
    .byte $41 ; | X     X| $F971
    .byte $40 ; | X      | $F972
    .byte $40 ; | X      | $F973
    .byte $44 ; | X   X  | $F974
    .byte $45 ; | X   X X| $F975
    .byte $44 ; | X   X  | $F976
    .byte $44 ; | X   X  | $F977
    .byte $40 ; | X      | $F978
    .byte $41 ; | X     X| $F979
    .byte $40 ; | X      | $F97A
    .byte $40 ; | X      | $F97B
    .byte $40 ; | X      | $F97C
    .byte $41 ; | X     X| $F97D
    .byte $40 ; | X      | $F97E
    .byte $40 ; | X      | $F97F
    .byte $00 ; |        | $F980
    .byte $01 ; |       X| $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $04 ; |     X  | $F984
    .byte $05 ; |     X X| $F985
    .byte $04 ; |     X  | $F986
    .byte $04 ; |     X  | $F987
    .byte $00 ; |        | $F988
    .byte $01 ; |       X| $F989
    .byte $00 ; |        | $F98A
    .byte $00 ; |        | $F98B
    .byte $00 ; |        | $F98C
    .byte $01 ; |       X| $F98D
    .byte $00 ; |        | $F98E
    .byte $00 ; |        | $F98F
    .byte $10 ; |   X    | $F990
    .byte $11 ; |   X   X| $F991
    .byte $10 ; |   X    | $F992
    .byte $10 ; |   X    | $F993
    .byte $14 ; |   X X  | $F994
    .byte $15 ; |   X X X| $F995
    .byte $14 ; |   X X  | $F996
    .byte $14 ; |   X X  | $F997
    .byte $10 ; |   X    | $F998
    .byte $11 ; |   X   X| $F999
    .byte $10 ; |   X    | $F99A
    .byte $10 ; |   X    | $F99B
    .byte $10 ; |   X    | $F99C
    .byte $11 ; |   X   X| $F99D
    .byte $10 ; |   X    | $F99E
    .byte $10 ; |   X    | $F99F
    .byte $00 ; |        | $F9A0
    .byte $01 ; |       X| $F9A1
    .byte $00 ; |        | $F9A2
    .byte $00 ; |        | $F9A3
    .byte $04 ; |     X  | $F9A4
    .byte $05 ; |     X X| $F9A5
    .byte $04 ; |     X  | $F9A6
    .byte $04 ; |     X  | $F9A7
    .byte $00 ; |        | $F9A8
    .byte $01 ; |       X| $F9A9
    .byte $00 ; |        | $F9AA
    .byte $00 ; |        | $F9AB
    .byte $00 ; |        | $F9AC
    .byte $01 ; |       X| $F9AD
    .byte $00 ; |        | $F9AE
    .byte $00 ; |        | $F9AF
    .byte $00 ; |        | $F9B0
    .byte $01 ; |       X| $F9B1
    .byte $00 ; |        | $F9B2
    .byte $00 ; |        | $F9B3
    .byte $04 ; |     X  | $F9B4
    .byte $05 ; |     X X| $F9B5
    .byte $04 ; |     X  | $F9B6
    .byte $04 ; |     X  | $F9B7
    .byte $00 ; |        | $F9B8
    .byte $01 ; |       X| $F9B9
    .byte $00 ; |        | $F9BA
    .byte $00 ; |        | $F9BB
    .byte $00 ; |        | $F9BC
    .byte $01 ; |       X| $F9BD
    .byte $00 ; |        | $F9BE
    .byte $00 ; |        | $F9BF
    .byte $00 ; |        | $F9C0
    .byte $01 ; |       X| $F9C1
    .byte $00 ; |        | $F9C2
    .byte $00 ; |        | $F9C3
    .byte $04 ; |     X  | $F9C4
    .byte $05 ; |     X X| $F9C5
    .byte $04 ; |     X  | $F9C6
    .byte $04 ; |     X  | $F9C7
    .byte $00 ; |        | $F9C8
    .byte $01 ; |       X| $F9C9
    .byte $00 ; |        | $F9CA
    .byte $00 ; |        | $F9CB
    .byte $00 ; |        | $F9CC
    .byte $01 ; |       X| $F9CD
    .byte $00 ; |        | $F9CE
    .byte $00 ; |        | $F9CF
    .byte $10 ; |   X    | $F9D0
    .byte $11 ; |   X   X| $F9D1
    .byte $10 ; |   X    | $F9D2
    .byte $10 ; |   X    | $F9D3
    .byte $14 ; |   X X  | $F9D4
    .byte $15 ; |   X X X| $F9D5
    .byte $14 ; |   X X  | $F9D6
    .byte $14 ; |   X X  | $F9D7
    .byte $10 ; |   X    | $F9D8
    .byte $11 ; |   X   X| $F9D9
    .byte $10 ; |   X    | $F9DA
    .byte $10 ; |   X    | $F9DB
    .byte $10 ; |   X    | $F9DC
    .byte $11 ; |   X   X| $F9DD
    .byte $10 ; |   X    | $F9DE
    .byte $10 ; |   X    | $F9DF
    .byte $00 ; |        | $F9E0
    .byte $01 ; |       X| $F9E1
    .byte $00 ; |        | $F9E2
    .byte $00 ; |        | $F9E3
    .byte $04 ; |     X  | $F9E4
    .byte $05 ; |     X X| $F9E5
    .byte $04 ; |     X  | $F9E6
    .byte $04 ; |     X  | $F9E7
    .byte $00 ; |        | $F9E8
    .byte $01 ; |       X| $F9E9
    .byte $00 ; |        | $F9EA
    .byte $00 ; |        | $F9EB
    .byte $00 ; |        | $F9EC
    .byte $01 ; |       X| $F9ED
    .byte $00 ; |        | $F9EE
    .byte $00 ; |        | $F9EF
    .byte $00 ; |        | $F9F0
    .byte $01 ; |       X| $F9F1
    .byte $00 ; |        | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $04 ; |     X  | $F9F4
    .byte $05 ; |     X X| $F9F5
    .byte $04 ; |     X  | $F9F6
    .byte $04 ; |     X  | $F9F7
    .byte $00 ; |        | $F9F8
    .byte $01 ; |       X| $F9F9
    .byte $00 ; |        | $F9FA
    .byte $00 ; |        | $F9FB
    .byte $00 ; |        | $F9FC
    .byte $01 ; |       X| $F9FD
    .byte $00 ; |        | $F9FE
    .byte $00 ; |        | $F9FF
LFA00:
    .byte $00 ; |        | $FA00
    .byte $40 ; | X      | $FA01
    .byte $C0 ; |XX      | $FA02
    .byte $40 ; | X      | $FA03
    .byte $10 ; |   X    | $FA04
    .byte $50 ; | X X    | $FA05
    .byte $D0 ; |XX X    | $FA06
    .byte $50 ; | X X    | $FA07
    .byte $30 ; |  XX    | $FA08
    .byte $70 ; | XXX    | $FA09
    .byte $F0 ; |XXXX    | $FA0A
    .byte $70 ; | XXX    | $FA0B
    .byte $10 ; |   X    | $FA0C
    .byte $50 ; | X X    | $FA0D
    .byte $D0 ; |XX X    | $FA0E
    .byte $50 ; | X X    | $FA0F
    .byte $04 ; |     X  | $FA10
    .byte $44 ; | X   X  | $FA11
    .byte $C4 ; |XX   X  | $FA12
    .byte $44 ; | X   X  | $FA13
    .byte $14 ; |   X X  | $FA14
    .byte $54 ; | X X X  | $FA15
    .byte $D4 ; |XX X X  | $FA16
    .byte $54 ; | X X X  | $FA17
    .byte $34 ; |  XX X  | $FA18
    .byte $74 ; | XXX X  | $FA19
    .byte $F4 ; |XXXX X  | $FA1A
    .byte $74 ; | XXX X  | $FA1B
    .byte $14 ; |   X X  | $FA1C
    .byte $54 ; | X X X  | $FA1D
    .byte $D4 ; |XX X X  | $FA1E
    .byte $54 ; | X X X  | $FA1F
    .byte $0C ; |    XX  | $FA20
    .byte $4C ; | X  XX  | $FA21
    .byte $CC ; |XX  XX  | $FA22
    .byte $4C ; | X  XX  | $FA23
    .byte $1C ; |   XXX  | $FA24
    .byte $5C ; | X XXX  | $FA25
    .byte $DC ; |XX XXX  | $FA26
    .byte $5C ; | X XXX  | $FA27
    .byte $3C ; |  XXXX  | $FA28
    .byte $7C ; | XXXXX  | $FA29
    .byte $FC ; |XXXXXX  | $FA2A
    .byte $7C ; | XXXXX  | $FA2B
    .byte $1C ; |   XXX  | $FA2C
    .byte $5C ; | X XXX  | $FA2D
    .byte $DC ; |XX XXX  | $FA2E
    .byte $5C ; | X XXX  | $FA2F
    .byte $04 ; |     X  | $FA30
    .byte $44 ; | X   X  | $FA31
    .byte $C4 ; |XX   X  | $FA32
    .byte $44 ; | X   X  | $FA33
    .byte $14 ; |   X X  | $FA34
    .byte $54 ; | X X X  | $FA35
    .byte $D4 ; |XX X X  | $FA36
    .byte $54 ; | X X X  | $FA37
    .byte $34 ; |  XX X  | $FA38
    .byte $74 ; | XXX X  | $FA39
    .byte $F4 ; |XXXX X  | $FA3A
    .byte $74 ; | XXX X  | $FA3B
    .byte $14 ; |   X X  | $FA3C
    .byte $54 ; | X X X  | $FA3D
    .byte $D4 ; |XX X X  | $FA3E
    .byte $54 ; | X X X  | $FA3F
    .byte $01 ; |       X| $FA40
    .byte $41 ; | X     X| $FA41
    .byte $C1 ; |XX     X| $FA42
    .byte $41 ; | X     X| $FA43
    .byte $11 ; |   X   X| $FA44
    .byte $51 ; | X X   X| $FA45
    .byte $D1 ; |XX X   X| $FA46
    .byte $51 ; | X X   X| $FA47
    .byte $31 ; |  XX   X| $FA48
    .byte $71 ; | XXX   X| $FA49
    .byte $F1 ; |XXXX   X| $FA4A
    .byte $71 ; | XXX   X| $FA4B
    .byte $11 ; |   X   X| $FA4C
    .byte $51 ; | X X   X| $FA4D
    .byte $D1 ; |XX X   X| $FA4E
    .byte $51 ; | X X   X| $FA4F
    .byte $05 ; |     X X| $FA50
    .byte $45 ; | X   X X| $FA51
    .byte $C5 ; |XX   X X| $FA52
    .byte $45 ; | X   X X| $FA53
    .byte $15 ; |   X X X| $FA54
    .byte $55 ; | X X X X| $FA55
    .byte $D5 ; |XX X X X| $FA56
    .byte $55 ; | X X X X| $FA57
    .byte $35 ; |  XX X X| $FA58
    .byte $75 ; | XXX X X| $FA59
    .byte $F5 ; |XXXX X X| $FA5A
    .byte $75 ; | XXX X X| $FA5B
    .byte $15 ; |   X X X| $FA5C
    .byte $55 ; | X X X X| $FA5D
    .byte $D5 ; |XX X X X| $FA5E
    .byte $55 ; | X X X X| $FA5F
    .byte $0D ; |    XX X| $FA60
    .byte $4D ; | X  XX X| $FA61
    .byte $CD ; |XX  XX X| $FA62
    .byte $4D ; | X  XX X| $FA63
    .byte $1D ; |   XXX X| $FA64
    .byte $5D ; | X XXX X| $FA65
    .byte $DD ; |XX XXX X| $FA66
    .byte $5D ; | X XXX X| $FA67
    .byte $3D ; |  XXXX X| $FA68
    .byte $7D ; | XXXXX X| $FA69
    .byte $FD ; |XXXXXX X| $FA6A
    .byte $7D ; | XXXXX X| $FA6B
    .byte $1D ; |   XXX X| $FA6C
    .byte $5D ; | X XXX X| $FA6D
    .byte $DD ; |XX XXX X| $FA6E
    .byte $5D ; | X XXX X| $FA6F
    .byte $05 ; |     X X| $FA70
    .byte $45 ; | X   X X| $FA71
    .byte $C5 ; |XX   X X| $FA72
    .byte $45 ; | X   X X| $FA73
    .byte $15 ; |   X X X| $FA74
    .byte $55 ; | X X X X| $FA75
    .byte $D5 ; |XX X X X| $FA76
    .byte $55 ; | X X X X| $FA77
    .byte $35 ; |  XX X X| $FA78
    .byte $75 ; | XXX X X| $FA79
    .byte $F5 ; |XXXX X X| $FA7A
    .byte $75 ; | XXX X X| $FA7B
    .byte $15 ; |   X X X| $FA7C
    .byte $55 ; | X X X X| $FA7D
    .byte $D5 ; |XX X X X| $FA7E
    .byte $55 ; | X X X X| $FA7F
    .byte $03 ; |      XX| $FA80
    .byte $43 ; | X    XX| $FA81
    .byte $C3 ; |XX    XX| $FA82
    .byte $43 ; | X    XX| $FA83
    .byte $13 ; |   X  XX| $FA84
    .byte $53 ; | X X  XX| $FA85
    .byte $D3 ; |XX X  XX| $FA86
    .byte $53 ; | X X  XX| $FA87
    .byte $33 ; |  XX  XX| $FA88
    .byte $73 ; | XXX  XX| $FA89
    .byte $F3 ; |XXXX  XX| $FA8A
    .byte $73 ; | XXX  XX| $FA8B
    .byte $13 ; |   X  XX| $FA8C
    .byte $53 ; | X X  XX| $FA8D
    .byte $D3 ; |XX X  XX| $FA8E
    .byte $53 ; | X X  XX| $FA8F
    .byte $07 ; |     XXX| $FA90
    .byte $47 ; | X   XXX| $FA91
    .byte $C7 ; |XX   XXX| $FA92
    .byte $47 ; | X   XXX| $FA93
    .byte $17 ; |   X XXX| $FA94
    .byte $57 ; | X X XXX| $FA95
    .byte $D7 ; |XX X XXX| $FA96
    .byte $57 ; | X X XXX| $FA97
    .byte $37 ; |  XX XXX| $FA98
    .byte $77 ; | XXX XXX| $FA99
    .byte $F7 ; |XXXX XXX| $FA9A
    .byte $77 ; | XXX XXX| $FA9B
    .byte $17 ; |   X XXX| $FA9C
    .byte $57 ; | X X XXX| $FA9D
    .byte $D7 ; |XX X XXX| $FA9E
    .byte $57 ; | X X XXX| $FA9F
    .byte $0F ; |    XXXX| $FAA0
    .byte $4F ; | X  XXXX| $FAA1
    .byte $CF ; |XX  XXXX| $FAA2
    .byte $4F ; | X  XXXX| $FAA3
    .byte $1F ; |   XXXXX| $FAA4
    .byte $5F ; | X XXXXX| $FAA5
    .byte $DF ; |XX XXXXX| $FAA6
    .byte $5F ; | X XXXXX| $FAA7
    .byte $3F ; |  XXXXXX| $FAA8
    .byte $7F ; | XXXXXXX| $FAA9
    .byte $FF ; |XXXXXXXX| $FAAA
    .byte $7F ; | XXXXXXX| $FAAB
    .byte $1F ; |   XXXXX| $FAAC
    .byte $5F ; | X XXXXX| $FAAD
    .byte $DF ; |XX XXXXX| $FAAE
    .byte $5F ; | X XXXXX| $FAAF
    .byte $07 ; |     XXX| $FAB0
    .byte $47 ; | X   XXX| $FAB1
    .byte $C7 ; |XX   XXX| $FAB2
    .byte $47 ; | X   XXX| $FAB3
    .byte $17 ; |   X XXX| $FAB4
    .byte $57 ; | X X XXX| $FAB5
    .byte $D7 ; |XX X XXX| $FAB6
    .byte $57 ; | X X XXX| $FAB7
    .byte $37 ; |  XX XXX| $FAB8
    .byte $77 ; | XXX XXX| $FAB9
    .byte $F7 ; |XXXX XXX| $FABA
    .byte $77 ; | XXX XXX| $FABB
    .byte $17 ; |   X XXX| $FABC
    .byte $57 ; | X X XXX| $FABD
    .byte $D7 ; |XX X XXX| $FABE
    .byte $57 ; | X X XXX| $FABF
    .byte $01 ; |       X| $FAC0
    .byte $41 ; | X     X| $FAC1
    .byte $C1 ; |XX     X| $FAC2
    .byte $41 ; | X     X| $FAC3
    .byte $11 ; |   X   X| $FAC4
    .byte $51 ; | X X   X| $FAC5
    .byte $D1 ; |XX X   X| $FAC6
    .byte $51 ; | X X   X| $FAC7
    .byte $31 ; |  XX   X| $FAC8
    .byte $71 ; | XXX   X| $FAC9
    .byte $F1 ; |XXXX   X| $FACA
    .byte $71 ; | XXX   X| $FACB
    .byte $11 ; |   X   X| $FACC
    .byte $51 ; | X X   X| $FACD
    .byte $D1 ; |XX X   X| $FACE
    .byte $51 ; | X X   X| $FACF
    .byte $05 ; |     X X| $FAD0
    .byte $45 ; | X   X X| $FAD1
    .byte $C5 ; |XX   X X| $FAD2
    .byte $45 ; | X   X X| $FAD3
    .byte $15 ; |   X X X| $FAD4
    .byte $55 ; | X X X X| $FAD5
    .byte $D5 ; |XX X X X| $FAD6
    .byte $55 ; | X X X X| $FAD7
    .byte $35 ; |  XX X X| $FAD8
    .byte $75 ; | XXX X X| $FAD9
    .byte $F5 ; |XXXX X X| $FADA
    .byte $75 ; | XXX X X| $FADB
    .byte $15 ; |   X X X| $FADC
    .byte $55 ; | X X X X| $FADD
    .byte $D5 ; |XX X X X| $FADE
    .byte $55 ; | X X X X| $FADF
    .byte $0D ; |    XX X| $FAE0
    .byte $4D ; | X  XX X| $FAE1
    .byte $CD ; |XX  XX X| $FAE2
    .byte $4D ; | X  XX X| $FAE3
    .byte $1D ; |   XXX X| $FAE4
    .byte $5D ; | X XXX X| $FAE5
    .byte $DD ; |XX XXX X| $FAE6
    .byte $5D ; | X XXX X| $FAE7
    .byte $3D ; |  XXXX X| $FAE8
    .byte $7D ; | XXXXX X| $FAE9
    .byte $FD ; |XXXXXX X| $FAEA
    .byte $7D ; | XXXXX X| $FAEB
    .byte $1D ; |   XXX X| $FAEC
    .byte $5D ; | X XXX X| $FAED
    .byte $DD ; |XX XXX X| $FAEE
    .byte $5D ; | X XXX X| $FAEF
    .byte $05 ; |     X X| $FAF0
    .byte $45 ; | X   X X| $FAF1
    .byte $C5 ; |XX   X X| $FAF2
    .byte $45 ; | X   X X| $FAF3
    .byte $15 ; |   X X X| $FAF4
    .byte $55 ; | X X X X| $FAF5
    .byte $D5 ; |XX X X X| $FAF6
    .byte $55 ; | X X X X| $FAF7
    .byte $35 ; |  XX X X| $FAF8
    .byte $75 ; | XXX X X| $FAF9
    .byte $F5 ; |XXXX X X| $FAFA
    .byte $75 ; | XXX X X| $FAFB
    .byte $15 ; |   X X X| $FAFC
    .byte $55 ; | X X X X| $FAFD
    .byte $D5 ; |XX X X X| $FAFE
    .byte $55 ; | X X X X| $FAFF
LFB00:
    .byte $00 ; |        | $FB00
    .byte $80 ; |X       | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $20 ; |  X     | $FB04
    .byte $A0 ; |X X     | $FB05
    .byte $20 ; |  X     | $FB06
    .byte $20 ; |  X     | $FB07
    .byte $00 ; |        | $FB08
    .byte $80 ; |X       | $FB09
    .byte $00 ; |        | $FB0A
    .byte $00 ; |        | $FB0B
    .byte $00 ; |        | $FB0C
    .byte $80 ; |X       | $FB0D
    .byte $00 ; |        | $FB0E
    .byte $00 ; |        | $FB0F
    .byte $08 ; |    X   | $FB10
    .byte $88 ; |X   X   | $FB11
    .byte $08 ; |    X   | $FB12
    .byte $08 ; |    X   | $FB13
    .byte $28 ; |  X X   | $FB14
    .byte $A8 ; |X X X   | $FB15
    .byte $28 ; |  X X   | $FB16
    .byte $28 ; |  X X   | $FB17
    .byte $08 ; |    X   | $FB18
    .byte $88 ; |X   X   | $FB19
    .byte $08 ; |    X   | $FB1A
    .byte $08 ; |    X   | $FB1B
    .byte $08 ; |    X   | $FB1C
    .byte $88 ; |X   X   | $FB1D
    .byte $08 ; |    X   | $FB1E
    .byte $08 ; |    X   | $FB1F
    .byte $00 ; |        | $FB20
    .byte $80 ; |X       | $FB21
    .byte $00 ; |        | $FB22
    .byte $00 ; |        | $FB23
    .byte $20 ; |  X     | $FB24
    .byte $A0 ; |X X     | $FB25
    .byte $20 ; |  X     | $FB26
    .byte $20 ; |  X     | $FB27
    .byte $00 ; |        | $FB28
    .byte $80 ; |X       | $FB29
    .byte $00 ; |        | $FB2A
    .byte $00 ; |        | $FB2B
    .byte $00 ; |        | $FB2C
    .byte $80 ; |X       | $FB2D
    .byte $00 ; |        | $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $80 ; |X       | $FB31
    .byte $00 ; |        | $FB32
    .byte $00 ; |        | $FB33
    .byte $20 ; |  X     | $FB34
    .byte $A0 ; |X X     | $FB35
    .byte $20 ; |  X     | $FB36
    .byte $20 ; |  X     | $FB37
    .byte $00 ; |        | $FB38
    .byte $80 ; |X       | $FB39
    .byte $00 ; |        | $FB3A
    .byte $00 ; |        | $FB3B
    .byte $00 ; |        | $FB3C
    .byte $80 ; |X       | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
    .byte $02 ; |      X | $FB40
    .byte $82 ; |X     X | $FB41
    .byte $02 ; |      X | $FB42
    .byte $02 ; |      X | $FB43
    .byte $22 ; |  X   X | $FB44
    .byte $A2 ; |X X   X | $FB45
    .byte $22 ; |  X   X | $FB46
    .byte $22 ; |  X   X | $FB47
    .byte $02 ; |      X | $FB48
    .byte $82 ; |X     X | $FB49
    .byte $02 ; |      X | $FB4A
    .byte $02 ; |      X | $FB4B
    .byte $02 ; |      X | $FB4C
    .byte $82 ; |X     X | $FB4D
    .byte $02 ; |      X | $FB4E
    .byte $02 ; |      X | $FB4F
    .byte $0A ; |    X X | $FB50
    .byte $8A ; |X   X X | $FB51
    .byte $0A ; |    X X | $FB52
    .byte $0A ; |    X X | $FB53
    .byte $2A ; |  X X X | $FB54
    .byte $AA ; |X X X X | $FB55
    .byte $2A ; |  X X X | $FB56
    .byte $2A ; |  X X X | $FB57
    .byte $0A ; |    X X | $FB58
    .byte $8A ; |X   X X | $FB59
    .byte $0A ; |    X X | $FB5A
    .byte $0A ; |    X X | $FB5B
    .byte $0A ; |    X X | $FB5C
    .byte $8A ; |X   X X | $FB5D
    .byte $0A ; |    X X | $FB5E
    .byte $0A ; |    X X | $FB5F
    .byte $02 ; |      X | $FB60
    .byte $82 ; |X     X | $FB61
    .byte $02 ; |      X | $FB62
    .byte $02 ; |      X | $FB63
    .byte $22 ; |  X   X | $FB64
    .byte $A2 ; |X X   X | $FB65
    .byte $22 ; |  X   X | $FB66
    .byte $22 ; |  X   X | $FB67
    .byte $02 ; |      X | $FB68
    .byte $82 ; |X     X | $FB69
    .byte $02 ; |      X | $FB6A
    .byte $02 ; |      X | $FB6B
    .byte $02 ; |      X | $FB6C
    .byte $82 ; |X     X | $FB6D
    .byte $02 ; |      X | $FB6E
    .byte $02 ; |      X | $FB6F
    .byte $02 ; |      X | $FB70
    .byte $82 ; |X     X | $FB71
    .byte $02 ; |      X | $FB72
    .byte $02 ; |      X | $FB73
    .byte $22 ; |  X   X | $FB74
    .byte $A2 ; |X X   X | $FB75
    .byte $22 ; |  X   X | $FB76
    .byte $22 ; |  X   X | $FB77
    .byte $02 ; |      X | $FB78
    .byte $82 ; |X     X | $FB79
    .byte $02 ; |      X | $FB7A
    .byte $02 ; |      X | $FB7B
    .byte $02 ; |      X | $FB7C
    .byte $82 ; |X     X | $FB7D
    .byte $02 ; |      X | $FB7E
    .byte $02 ; |      X | $FB7F
    .byte $00 ; |        | $FB80
    .byte $80 ; |X       | $FB81
    .byte $00 ; |        | $FB82
    .byte $00 ; |        | $FB83
    .byte $20 ; |  X     | $FB84
    .byte $A0 ; |X X     | $FB85
    .byte $20 ; |  X     | $FB86
    .byte $20 ; |  X     | $FB87
    .byte $00 ; |        | $FB88
    .byte $80 ; |X       | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $80 ; |X       | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $08 ; |    X   | $FB90
    .byte $88 ; |X   X   | $FB91
    .byte $08 ; |    X   | $FB92
    .byte $08 ; |    X   | $FB93
    .byte $28 ; |  X X   | $FB94
    .byte $A8 ; |X X X   | $FB95
    .byte $28 ; |  X X   | $FB96
    .byte $28 ; |  X X   | $FB97
    .byte $08 ; |    X   | $FB98
    .byte $88 ; |X   X   | $FB99
    .byte $08 ; |    X   | $FB9A
    .byte $08 ; |    X   | $FB9B
    .byte $08 ; |    X   | $FB9C
    .byte $88 ; |X   X   | $FB9D
    .byte $08 ; |    X   | $FB9E
    .byte $08 ; |    X   | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $80 ; |X       | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $00 ; |        | $FBA3
    .byte $20 ; |  X     | $FBA4
    .byte $A0 ; |X X     | $FBA5
    .byte $20 ; |  X     | $FBA6
    .byte $20 ; |  X     | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $80 ; |X       | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $80 ; |X       | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $80 ; |X       | $FBB1
    .byte $00 ; |        | $FBB2
    .byte $00 ; |        | $FBB3
    .byte $20 ; |  X     | $FBB4
    .byte $A0 ; |X X     | $FBB5
    .byte $20 ; |  X     | $FBB6
    .byte $20 ; |  X     | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $80 ; |X       | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $80 ; |X       | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF
    .byte $00 ; |        | $FBC0
    .byte $80 ; |X       | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $00 ; |        | $FBC3
    .byte $20 ; |  X     | $FBC4
    .byte $A0 ; |X X     | $FBC5
    .byte $20 ; |  X     | $FBC6
    .byte $20 ; |  X     | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $80 ; |X       | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $80 ; |X       | $FBCD
    .byte $00 ; |        | $FBCE
    .byte $00 ; |        | $FBCF
    .byte $08 ; |    X   | $FBD0
    .byte $88 ; |X   X   | $FBD1
    .byte $08 ; |    X   | $FBD2
    .byte $08 ; |    X   | $FBD3
    .byte $28 ; |  X X   | $FBD4
    .byte $A8 ; |X X X   | $FBD5
    .byte $28 ; |  X X   | $FBD6
    .byte $28 ; |  X X   | $FBD7
    .byte $08 ; |    X   | $FBD8
    .byte $88 ; |X   X   | $FBD9
    .byte $08 ; |    X   | $FBDA
    .byte $08 ; |    X   | $FBDB
    .byte $08 ; |    X   | $FBDC
    .byte $88 ; |X   X   | $FBDD
    .byte $08 ; |    X   | $FBDE
    .byte $08 ; |    X   | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $80 ; |X       | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $20 ; |  X     | $FBE4
    .byte $A0 ; |X X     | $FBE5
    .byte $20 ; |  X     | $FBE6
    .byte $20 ; |  X     | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $80 ; |X       | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $80 ; |X       | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $80 ; |X       | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $20 ; |  X     | $FBF4
    .byte $A0 ; |X X     | $FBF5
    .byte $20 ; |  X     | $FBF6
    .byte $20 ; |  X     | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $80 ; |X       | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $00 ; |        | $FBFC
    .byte $80 ; |X       | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
    .byte $50 ; | X X    | $FC00
    .byte $A8 ; |X X X   | $FC01
    .byte $24 ; |  X  X  | $FC02
    .byte $58 ; | X XX   | $FC03
    .byte $24 ; |  X  X  | $FC04
    .byte $D8 ; |XX XX   | $FC05
    .byte $20 ; |  X     | $FC06
    .byte $A8 ; |X X X   | $FC07
    .byte $F8 ; |XXXXX   | $FC08
    .byte $F8 ; |XXXXX   | $FC09
    .byte $70 ; | XXX    | $FC0A
    .byte $70 ; | XXX    | $FC0B
    .byte $20 ; |  X     | $FC0C
    .byte $20 ; |  X     | $FC0D
    .byte $70 ; | XXX    | $FC0E
    .byte $F8 ; |XXXXX   | $FC0F
    .byte $F8 ; |XXXXX   | $FC10
    .byte $F8 ; |XXXXX   | $FC11
    .byte $70 ; | XXX    | $FC12
    .byte $20 ; |  X     | $FC13
    .byte $10 ; |   X    | $FC14
    .byte $28 ; |  X X   | $FC15
    .byte $38 ; |  XXX   | $FC16
    .byte $04 ; |     X  | $FC17
    .byte $38 ; |  XXX   | $FC18
    .byte $BA ; |X XXX X | $FC19
    .byte $12 ; |   X  X | $FC1A
    .byte $08 ; |    X   | $FC1B
    .byte $14 ; |   X X  | $FC1C
    .byte $1C ; |   XXX  | $FC1D
    .byte $20 ; |  X     | $FC1E
    .byte $5C ; | X XXX  | $FC1F
    .byte $5D ; | X XXX X| $FC20
    .byte $48 ; | X  X   | $FC21
    .byte $22 ; |  X   X | $FC22
    .byte $77 ; | XXX XXX| $FC23
    .byte $FF ; |XXXXXXXX| $FC24
    .byte $FF ; |XXXXXXXX| $FC25
    .byte $FF ; |XXXXXXXX| $FC26
    .byte $77 ; | XXX XXX| $FC27
    .byte $22 ; |  X   X | $FC28
    .byte $A8 ; |X X X   | $FC29
    .byte $F8 ; |XXXXX   | $FC2A
    .byte $D8 ; |XX XX   | $FC2B
    .byte $50 ; | X X    | $FC2C
    .byte $50 ; | X X    | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $81 ; |X      X| $FC30
    .byte $5A ; | X XX X | $FC31
    .byte $3C ; |  XXXX  | $FC32
    .byte $DB ; |XX XX XX| $FC33
    .byte $00 ; |        | $FC34
    .byte $81 ; |X      X| $FC35
    .byte $5A ; | X XX X | $FC36
    .byte $3C ; |  XXXX  | $FC37
    .byte $99 ; |X  XX  X| $FC38
    .byte $66 ; | XX  XX | $FC39
    .byte $00 ; |        | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $00 ; |        | $FC3C
    .byte $66 ; | XX  XX | $FC3D
    .byte $99 ; |X  XX  X| $FC3E
    .byte $3C ; |  XXXX  | $FC3F
    .byte $5A ; | X XX X | $FC40
    .byte $49 ; | X  X  X| $FC41
    .byte $52 ; | X X  X | $FC42
    .byte $76 ; | XXX XX | $FC43
    .byte $FF ; |XXXXXXXX| $FC44
    .byte $76 ; | XXX XX | $FC45
    .byte $52 ; | X X  X | $FC46
    .byte $49 ; | X  X  X| $FC47
    .byte $A4 ; |X X  X  | $FC48
    .byte $52 ; | X X  X | $FC49
    .byte $77 ; | XXX XXX| $FC4A
    .byte $F3 ; |XXXX  XX| $FC4B
    .byte $77 ; | XXX XXX| $FC4C
    .byte $52 ; | X X  X | $FC4D
    .byte $A4 ; |X X  X  | $FC4E
    .byte $28 ; |  X X   | $FC4F
    .byte $38 ; |  XXX   | $FC50
    .byte $92 ; |X  X  X | $FC51
    .byte $54 ; | X X X  | $FC52
    .byte $00 ; |        | $FC53
    .byte $00 ; |        | $FC54
    .byte $00 ; |        | $FC55
    .byte $28 ; |  X X   | $FC56
    .byte $38 ; |  XXX   | $FC57
    .byte $54 ; | X X X  | $FC58
    .byte $92 ; |X  X  X | $FC59
    .byte $52 ; | X X  X | $FC5A
    .byte $77 ; | XXX XXX| $FC5B
    .byte $FE ; |XXXXXXX | $FC5C
    .byte $77 ; | XXX XXX| $FC5D
    .byte $52 ; | X X  X | $FC5E
    .byte $92 ; |X  X  X | $FC5F
    .byte $07 ; |     XXX| $FC60
    .byte $0E ; |    XXX | $FC61
    .byte $1D ; |   XXX X| $FC62
    .byte $1B ; |   XX XX| $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $D8 ; |XX XX   | $FC67
    .byte $B8 ; |X XXX   | $FC68
    .byte $70 ; | XXX    | $FC69
    .byte $E0 ; |XXX     | $FC6A
    .byte $70 ; | XXX    | $FC6B
    .byte $B8 ; |X XXX   | $FC6C
    .byte $D8 ; |XX XX   | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $1B ; |   XX XX| $FC71
    .byte $1D ; |   XXX X| $FC72
    .byte $0E ; |    XXX | $FC73
    .byte $07 ; |     XXX| $FC74
    .byte $3F ; |  XXXXXX| $FC75
    .byte $35 ; |  XX X X| $FC76
    .byte $35 ; |  XX X X| $FC77
    .byte $F5 ; |XXXX X X| $FC78
    .byte $B5 ; |X XX X X| $FC79
    .byte $B5 ; |X XX X X| $FC7A
    .byte $FF ; |XXXXXXXX| $FC7B
    .byte $FF ; |XXXXXXXX| $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $20 ; |  X     | $FC84
    .byte $A8 ; |X X X   | $FC85
    .byte $F8 ; |XXXXX   | $FC86
    .byte $F8 ; |XXXXX   | $FC87
    .byte $70 ; | XXX    | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $50 ; | X X    | $FC8B
    .byte $50 ; | X X    | $FC8C
    .byte $F8 ; |XXXXX   | $FC8D
    .byte $F8 ; |XXXXX   | $FC8E
    .byte $70 ; | XXX    | $FC8F
    .byte $00 ; |        | $FC90
    .byte $00 ; |        | $FC91
    .byte $6C ; | XX XX  | $FC92
    .byte $6C ; | XX XX  | $FC93
    .byte $38 ; |  XXX   | $FC94
    .byte $38 ; |  XXX   | $FC95
    .byte $10 ; |   X    | $FC96
    .byte $00 ; |        | $FC97
    .byte $00 ; |        | $FC98
    .byte $C6 ; |XX   XX | $FC99
    .byte $6C ; | XX XX  | $FC9A
    .byte $28 ; |  X X   | $FC9B
    .byte $28 ; |  X X   | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $28 ; |  X X   | $FCA0
    .byte $14 ; |   X X  | $FCA1
    .byte $3E ; |  XXXXX | $FCA2
    .byte $3C ; |  XXXX  | $FCA3
    .byte $3C ; |  XXXX  | $FCA4
    .byte $18 ; |   XX   | $FCA5
    .byte $18 ; |   XX   | $FCA6
    .byte $18 ; |   XX   | $FCA7
    .byte $18 ; |   XX   | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $30 ; |  XX    | $FCAA
    .byte $4C ; | X  XX  | $FCAB
    .byte $38 ; |  XXX   | $FCAC
    .byte $6E ; | XX XXX | $FCAD
    .byte $BF ; |X XXXXXX| $FCAE
    .byte $7E ; | XXXXXX | $FCAF
    .byte $EE ; |XXX XXX | $FCB0
    .byte $7F ; | XXXXXXX| $FCB1
    .byte $FF ; |XXXXXXXX| $FCB2
    .byte $7A ; | XXXX X | $FCB3
    .byte $5C ; | X XXX  | $FCB4
    .byte $22 ; |  X   X | $FCB5
    .byte $18 ; |   XX   | $FCB6
    .byte $3E ; |  XXXXX | $FCB7
    .byte $3C ; |  XXXX  | $FCB8
    .byte $58 ; | X XX   | $FCB9
    .byte $34 ; |  XX X  | $FCBA
    .byte $18 ; |   XX   | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $00 ; |        | $FCBD
    .byte $EE ; |XXX XXX | $FCBE
    .byte $28 ; |  X X   | $FCBF
    .byte $00 ; |        | $FCC0
    .byte $00 ; |        | $FCC1
    .byte $00 ; |        | $FCC2
    .byte $00 ; |        | $FCC3
    .byte $00 ; |        | $FCC4
    .byte $3F ; |  XXXXXX| $FCC5
    .byte $35 ; |  XX X X| $FCC6
    .byte $35 ; |  XX X X| $FCC7
    .byte $F5 ; |XXXX X X| $FCC8
    .byte $B5 ; |X XX X X| $FCC9
    .byte $B5 ; |X XX X X| $FCCA
    .byte $BF ; |X XXXXXX| $FCCB
    .byte $5F ; | X XXXXX| $FCCC
    .byte $55 ; | X X X X| $FCCD
    .byte $55 ; | X X X X| $FCCE
    .byte $55 ; | X X X X| $FCCF
    .byte $35 ; |  XX X X| $FCD0
    .byte $35 ; |  XX X X| $FCD1
    .byte $FF ; |XXXXXXXX| $FCD2
    .byte $95 ; |X  X X X| $FCD3
    .byte $95 ; |X  X X X| $FCD4
    .byte $F5 ; |XXXX X X| $FCD5
    .byte $35 ; |  XX X X| $FCD6
    .byte $35 ; |  XX X X| $FCD7
    .byte $FF ; |XXXXXXXX| $FCD8
    .byte $35 ; |  XX X X| $FCD9
    .byte $35 ; |  XX X X| $FCDA
    .byte $F5 ; |XXXX X X| $FCDB
    .byte $35 ; |  XX X X| $FCDC
    .byte $35 ; |  XX X X| $FCDD
    .byte $FF ; |XXXXXXXX| $FCDE
    .byte $35 ; |  XX X X| $FCDF
    .byte $35 ; |  XX X X| $FCE0
    .byte $F5 ; |XXXX X X| $FCE1
    .byte $95 ; |X  X X X| $FCE2
    .byte $95 ; |X  X X X| $FCE3
    .byte $FF ; |XXXXXXXX| $FCE4
    .byte $B5 ; |X XX X X| $FCE5
    .byte $B5 ; |X XX X X| $FCE6
    .byte $F5 ; |XXXX X X| $FCE7
    .byte $B5 ; |X XX X X| $FCE8
    .byte $B5 ; |X XX X X| $FCE9
    .byte $FF ; |XXXXXXXX| $FCEA
    .byte $D5 ; |XX X X X| $FCEB
    .byte $D5 ; |XX X X X| $FCEC
    .byte $D5 ; |XX X X X| $FCED
    .byte $D5 ; |XX X X X| $FCEE
    .byte $D5 ; |XX X X X| $FCEF
    .byte $FF ; |XXXXXXXX| $FCF0
    .byte $B5 ; |X XX X X| $FCF1
    .byte $B5 ; |X XX X X| $FCF2
    .byte $F5 ; |XXXX X X| $FCF3
    .byte $95 ; |X  X X X| $FCF4
    .byte $95 ; |X  X X X| $FCF5
    .byte $9F ; |X  XXXXX| $FCF6
    .byte $FF ; |XXXXXXXX| $FCF7
    .byte $D5 ; |XX X X X| $FCF8
    .byte $D5 ; |XX X X X| $FCF9
    .byte $F5 ; |XXXX X X| $FCFA
    .byte $B5 ; |X XX X X| $FCFB
    .byte $B5 ; |X XX X X| $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $00 ; |        | $FCFE
    .byte $00 ; |        | $FCFF
LFD00:
    .byte $10 ; |   X    | $FD00
    .byte $10 ; |   X    | $FD01
    .byte $10 ; |   X    | $FD02
    .byte $10 ; |   X    | $FD03
    .byte $10 ; |   X    | $FD04
    .byte $10 ; |   X    | $FD05
    .byte $10 ; |   X    | $FD06
    .byte $10 ; |   X    | $FD07
    .byte $10 ; |   X    | $FD08
    .byte $10 ; |   X    | $FD09
    .byte $10 ; |   X    | $FD0A
    .byte $10 ; |   X    | $FD0B
    .byte $10 ; |   X    | $FD0C
    .byte $16 ; |   X XX | $FD0D
    .byte $16 ; |   X XX | $FD0E
    .byte $16 ; |   X XX | $FD0F
    .byte $16 ; |   X XX | $FD10
    .byte $16 ; |   X XX | $FD11
    .byte $16 ; |   X XX | $FD12
    .byte $16 ; |   X XX | $FD13
    .byte $16 ; |   X XX | $FD14
    .byte $16 ; |   X XX | $FD15
    .byte $16 ; |   X XX | $FD16
    .byte $16 ; |   X XX | $FD17
    .byte $16 ; |   X XX | $FD18
    .byte $16 ; |   X XX | $FD19
    .byte $16 ; |   X XX | $FD1A
    .byte $16 ; |   X XX | $FD1B
    .byte $20 ; |  X     | $FD1C
    .byte $20 ; |  X     | $FD1D
    .byte $20 ; |  X     | $FD1E
    .byte $20 ; |  X     | $FD1F
    .byte $20 ; |  X     | $FD20
    .byte $20 ; |  X     | $FD21
    .byte $20 ; |  X     | $FD22
    .byte $20 ; |  X     | $FD23
    .byte $20 ; |  X     | $FD24
    .byte $20 ; |  X     | $FD25
    .byte $20 ; |  X     | $FD26
    .byte $20 ; |  X     | $FD27
    .byte $20 ; |  X     | $FD28
    .byte $20 ; |  X     | $FD29
    .byte $20 ; |  X     | $FD2A
    .byte $2D ; |  X XX X| $FD2B
    .byte $2D ; |  X XX X| $FD2C
    .byte $2D ; |  X XX X| $FD2D
    .byte $2D ; |  X XX X| $FD2E
    .byte $2D ; |  X XX X| $FD2F
    .byte $2D ; |  X XX X| $FD30
    .byte $2D ; |  X XX X| $FD31
    .byte $2D ; |  X XX X| $FD32
    .byte $2D ; |  X XX X| $FD33
    .byte $2D ; |  X XX X| $FD34
    .byte $2D ; |  X XX X| $FD35
    .byte $2D ; |  X XX X| $FD36
    .byte $2D ; |  X XX X| $FD37
    .byte $2D ; |  X XX X| $FD38
    .byte $2D ; |  X XX X| $FD39
    .byte $3E ; |  XXXXX | $FD3A
    .byte $3E ; |  XXXXX | $FD3B
    .byte $3E ; |  XXXXX | $FD3C
    .byte $3E ; |  XXXXX | $FD3D
    .byte $3E ; |  XXXXX | $FD3E
    .byte $3E ; |  XXXXX | $FD3F
    .byte $3E ; |  XXXXX | $FD40
    .byte $3E ; |  XXXXX | $FD41
    .byte $3E ; |  XXXXX | $FD42
    .byte $3E ; |  XXXXX | $FD43
    .byte $3E ; |  XXXXX | $FD44
    .byte $3E ; |  XXXXX | $FD45
    .byte $3E ; |  XXXXX | $FD46
    .byte $3E ; |  XXXXX | $FD47
    .byte $3E ; |  XXXXX | $FD48
    .byte $52 ; | X X  X | $FD49
    .byte $52 ; | X X  X | $FD4A
    .byte $52 ; | X X  X | $FD4B
    .byte $52 ; | X X  X | $FD4C
    .byte $52 ; | X X  X | $FD4D
    .byte $52 ; | X X  X | $FD4E
    .byte $52 ; | X X  X | $FD4F
    .byte $52 ; | X X  X | $FD50
    .byte $52 ; | X X  X | $FD51
    .byte $52 ; | X X  X | $FD52
    .byte $52 ; | X X  X | $FD53
    .byte $52 ; | X X  X | $FD54
    .byte $52 ; | X X  X | $FD55
    .byte $52 ; | X X  X | $FD56
    .byte $52 ; | X X  X | $FD57
    .byte $6A ; | XX X X | $FD58
    .byte $6A ; | XX X X | $FD59
    .byte $6A ; | XX X X | $FD5A
    .byte $6A ; | XX X X | $FD5B
    .byte $6A ; | XX X X | $FD5C
    .byte $6A ; | XX X X | $FD5D
    .byte $6A ; | XX X X | $FD5E
    .byte $6A ; | XX X X | $FD5F
    .byte $6A ; | XX X X | $FD60
    .byte $6A ; | XX X X | $FD61
    .byte $6A ; | XX X X | $FD62
    .byte $6A ; | XX X X | $FD63
    .byte $6A ; | XX X X | $FD64
    .byte $6A ; | XX X X | $FD65
    .byte $6A ; | XX X X | $FD66
    .byte $8E ; |X   XXX | $FD67
    .byte $8E ; |X   XXX | $FD68
    .byte $8E ; |X   XXX | $FD69
    .byte $8E ; |X   XXX | $FD6A
    .byte $8E ; |X   XXX | $FD6B
    .byte $8E ; |X   XXX | $FD6C
    .byte $8E ; |X   XXX | $FD6D
    .byte $8E ; |X   XXX | $FD6E
    .byte $8E ; |X   XXX | $FD6F
    .byte $8E ; |X   XXX | $FD70
    .byte $8E ; |X   XXX | $FD71
    .byte $8E ; |X   XXX | $FD72
    .byte $8E ; |X   XXX | $FD73
    .byte $8E ; |X   XXX | $FD74
    .byte $8E ; |X   XXX | $FD75
    .byte $B1 ; |X XX   X| $FD76
    .byte $B1 ; |X XX   X| $FD77
    .byte $B1 ; |X XX   X| $FD78
    .byte $B1 ; |X XX   X| $FD79
    .byte $B1 ; |X XX   X| $FD7A
    .byte $B1 ; |X XX   X| $FD7B
    .byte $B1 ; |X XX   X| $FD7C
    .byte $B1 ; |X XX   X| $FD7D
    .byte $00 ; |        | $FD7E
    .byte $02 ; |      X | $FD7F
LFD80:
    .byte $0B ; |    X XX| $FD80
    .byte $0B ; |    X XX| $FD81
    .byte $0B ; |    X XX| $FD82
    .byte $0B ; |    X XX| $FD83
    .byte $0B ; |    X XX| $FD84
    .byte $0B ; |    X XX| $FD85
    .byte $0B ; |    X XX| $FD86
    .byte $0B ; |    X XX| $FD87
    .byte $0B ; |    X XX| $FD88
    .byte $0B ; |    X XX| $FD89
    .byte $0B ; |    X XX| $FD8A
    .byte $0B ; |    X XX| $FD8B
    .byte $0B ; |    X XX| $FD8C
    .byte $12 ; |   X  X | $FD8D
    .byte $12 ; |   X  X | $FD8E
    .byte $12 ; |   X  X | $FD8F
    .byte $12 ; |   X  X | $FD90
    .byte $12 ; |   X  X | $FD91
    .byte $12 ; |   X  X | $FD92
    .byte $12 ; |   X  X | $FD93
    .byte $12 ; |   X  X | $FD94
    .byte $12 ; |   X  X | $FD95
    .byte $12 ; |   X  X | $FD96
    .byte $12 ; |   X  X | $FD97
    .byte $12 ; |   X  X | $FD98
    .byte $12 ; |   X  X | $FD99
    .byte $12 ; |   X  X | $FD9A
    .byte $12 ; |   X  X | $FD9B
    .byte $1C ; |   XXX  | $FD9C
    .byte $1C ; |   XXX  | $FD9D
    .byte $1C ; |   XXX  | $FD9E
    .byte $1C ; |   XXX  | $FD9F
    .byte $1C ; |   XXX  | $FDA0
    .byte $1C ; |   XXX  | $FDA1
    .byte $1C ; |   XXX  | $FDA2
    .byte $1C ; |   XXX  | $FDA3
    .byte $1C ; |   XXX  | $FDA4
    .byte $1C ; |   XXX  | $FDA5
    .byte $1C ; |   XXX  | $FDA6
    .byte $1C ; |   XXX  | $FDA7
    .byte $1C ; |   XXX  | $FDA8
    .byte $1C ; |   XXX  | $FDA9
    .byte $1C ; |   XXX  | $FDAA
    .byte $2A ; |  X X X | $FDAB
    .byte $2A ; |  X X X | $FDAC
    .byte $2A ; |  X X X | $FDAD
    .byte $2A ; |  X X X | $FDAE
    .byte $2A ; |  X X X | $FDAF
    .byte $2A ; |  X X X | $FDB0
    .byte $2A ; |  X X X | $FDB1
    .byte $2A ; |  X X X | $FDB2
    .byte $2A ; |  X X X | $FDB3
    .byte $2A ; |  X X X | $FDB4
    .byte $2A ; |  X X X | $FDB5
    .byte $2A ; |  X X X | $FDB6
    .byte $2A ; |  X X X | $FDB7
    .byte $2A ; |  X X X | $FDB8
    .byte $2A ; |  X X X | $FDB9
    .byte $3B ; |  XXX XX| $FDBA
    .byte $3B ; |  XXX XX| $FDBB
    .byte $3B ; |  XXX XX| $FDBC
    .byte $3B ; |  XXX XX| $FDBD
    .byte $3B ; |  XXX XX| $FDBE
    .byte $3B ; |  XXX XX| $FDBF
    .byte $3B ; |  XXX XX| $FDC0
    .byte $3B ; |  XXX XX| $FDC1
    .byte $3B ; |  XXX XX| $FDC2
    .byte $3B ; |  XXX XX| $FDC3
    .byte $3B ; |  XXX XX| $FDC4
    .byte $3B ; |  XXX XX| $FDC5
    .byte $3B ; |  XXX XX| $FDC6
    .byte $3B ; |  XXX XX| $FDC7
    .byte $3B ; |  XXX XX| $FDC8
    .byte $50 ; | X X    | $FDC9
    .byte $50 ; | X X    | $FDCA
    .byte $50 ; | X X    | $FDCB
    .byte $50 ; | X X    | $FDCC
    .byte $50 ; | X X    | $FDCD
    .byte $50 ; | X X    | $FDCE
    .byte $50 ; | X X    | $FDCF
    .byte $50 ; | X X    | $FDD0
    .byte $50 ; | X X    | $FDD1
    .byte $50 ; | X X    | $FDD2
    .byte $50 ; | X X    | $FDD3
    .byte $50 ; | X X    | $FDD4
    .byte $50 ; | X X    | $FDD5
    .byte $50 ; | X X    | $FDD6
    .byte $50 ; | X X    | $FDD7
    .byte $68 ; | XX X   | $FDD8
    .byte $68 ; | XX X   | $FDD9
    .byte $68 ; | XX X   | $FDDA
    .byte $68 ; | XX X   | $FDDB
    .byte $68 ; | XX X   | $FDDC
    .byte $68 ; | XX X   | $FDDD
    .byte $68 ; | XX X   | $FDDE
    .byte $68 ; | XX X   | $FDDF
    .byte $68 ; | XX X   | $FDE0
    .byte $68 ; | XX X   | $FDE1
    .byte $68 ; | XX X   | $FDE2
    .byte $68 ; | XX X   | $FDE3
    .byte $68 ; | XX X   | $FDE4
    .byte $68 ; | XX X   | $FDE5
    .byte $68 ; | XX X   | $FDE6
    .byte $81 ; |X      X| $FDE7
    .byte $81 ; |X      X| $FDE8
    .byte $81 ; |X      X| $FDE9
    .byte $81 ; |X      X| $FDEA
    .byte $81 ; |X      X| $FDEB
    .byte $81 ; |X      X| $FDEC
    .byte $81 ; |X      X| $FDED
    .byte $81 ; |X      X| $FDEE
    .byte $81 ; |X      X| $FDEF
    .byte $81 ; |X      X| $FDF0
    .byte $81 ; |X      X| $FDF1
    .byte $81 ; |X      X| $FDF2
    .byte $81 ; |X      X| $FDF3
    .byte $81 ; |X      X| $FDF4
    .byte $81 ; |X      X| $FDF5
    .byte $9E ; |X  XXXX | $FDF6
    .byte $9E ; |X  XXXX | $FDF7
    .byte $9E ; |X  XXXX | $FDF8
    .byte $9E ; |X  XXXX | $FDF9
    .byte $9E ; |X  XXXX | $FDFA
    .byte $9E ; |X  XXXX | $FDFB
    .byte $9E ; |X  XXXX | $FDFC
    .byte $9E ; |X  XXXX | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF
    .byte $70 ; | XXX    | $FE00
    .byte $60 ; | XX     | $FE01
LFE02:
    .byte $50 ; | X X    | $FE02
    .byte $40 ; | X      | $FE03
    .byte $30 ; |  XX    | $FE04
    .byte $20 ; |  X     | $FE05
    .byte $10 ; |   X    | $FE06
    .byte $00 ; |        | $FE07
    .byte $F0 ; |XXXX    | $FE08
    .byte $E0 ; |XXX     | $FE09
    .byte $D0 ; |XX X    | $FE0A
    .byte $C0 ; |XX      | $FE0B
    .byte $B0 ; |X XX    | $FE0C
    .byte $A0 ; |X X     | $FE0D
    .byte $90 ; |X  X    | $FE0E
    .byte $71 ; | XXX   X| $FE0F
    .byte $61 ; | XX    X| $FE10
    .byte $51 ; | X X   X| $FE11
    .byte $41 ; | X     X| $FE12
    .byte $31 ; |  XX   X| $FE13
    .byte $21 ; |  X    X| $FE14
    .byte $11 ; |   X   X| $FE15
    .byte $01 ; |       X| $FE16
    .byte $F1 ; |XXXX   X| $FE17
    .byte $E1 ; |XXX    X| $FE18
    .byte $D1 ; |XX X   X| $FE19
    .byte $C1 ; |XX     X| $FE1A
    .byte $B1 ; |X XX   X| $FE1B
    .byte $A1 ; |X X    X| $FE1C
    .byte $91 ; |X  X   X| $FE1D
    .byte $72 ; | XXX  X | $FE1E
    .byte $62 ; | XX   X | $FE1F
    .byte $52 ; | X X  X | $FE20
    .byte $42 ; | X    X | $FE21
    .byte $32 ; |  XX  X | $FE22
    .byte $22 ; |  X   X | $FE23
    .byte $12 ; |   X  X | $FE24
    .byte $02 ; |      X | $FE25
    .byte $F2 ; |XXXX  X | $FE26
    .byte $E2 ; |XXX   X | $FE27
    .byte $D2 ; |XX X  X | $FE28
    .byte $C2 ; |XX    X | $FE29
    .byte $B2 ; |X XX  X | $FE2A
    .byte $A2 ; |X X   X | $FE2B
    .byte $92 ; |X  X  X | $FE2C
    .byte $73 ; | XXX  XX| $FE2D
    .byte $63 ; | XX   XX| $FE2E
    .byte $53 ; | X X  XX| $FE2F
    .byte $43 ; | X    XX| $FE30
    .byte $33 ; |  XX  XX| $FE31
    .byte $23 ; |  X   XX| $FE32
    .byte $13 ; |   X  XX| $FE33
    .byte $03 ; |      XX| $FE34
    .byte $F3 ; |XXXX  XX| $FE35
    .byte $E3 ; |XXX   XX| $FE36
    .byte $D3 ; |XX X  XX| $FE37
    .byte $C3 ; |XX    XX| $FE38
    .byte $B3 ; |X XX  XX| $FE39
    .byte $A3 ; |X X   XX| $FE3A
    .byte $93 ; |X  X  XX| $FE3B
    .byte $74 ; | XXX X  | $FE3C
    .byte $64 ; | XX  X  | $FE3D
    .byte $54 ; | X X X  | $FE3E
    .byte $44 ; | X   X  | $FE3F
    .byte $34 ; |  XX X  | $FE40
    .byte $24 ; |  X  X  | $FE41
    .byte $14 ; |   X X  | $FE42
    .byte $04 ; |     X  | $FE43
    .byte $F4 ; |XXXX X  | $FE44
    .byte $E4 ; |XXX  X  | $FE45
    .byte $D4 ; |XX X X  | $FE46
    .byte $C4 ; |XX   X  | $FE47
    .byte $B4 ; |X XX X  | $FE48
    .byte $A4 ; |X X  X  | $FE49
    .byte $94 ; |X  X X  | $FE4A
    .byte $75 ; | XXX X X| $FE4B
    .byte $65 ; | XX  X X| $FE4C
    .byte $55 ; | X X X X| $FE4D
    .byte $45 ; | X   X X| $FE4E
    .byte $35 ; |  XX X X| $FE4F
    .byte $25 ; |  X  X X| $FE50
    .byte $15 ; |   X X X| $FE51
    .byte $05 ; |     X X| $FE52
    .byte $F5 ; |XXXX X X| $FE53
    .byte $E5 ; |XXX  X X| $FE54
    .byte $D5 ; |XX X X X| $FE55
    .byte $C5 ; |XX   X X| $FE56
    .byte $B5 ; |X XX X X| $FE57
    .byte $A5 ; |X X  X X| $FE58
    .byte $95 ; |X  X X X| $FE59
    .byte $76 ; | XXX XX | $FE5A
    .byte $66 ; | XX  XX | $FE5B
    .byte $56 ; | X X XX | $FE5C
    .byte $46 ; | X   XX | $FE5D
    .byte $36 ; |  XX XX | $FE5E
    .byte $26 ; |  X  XX | $FE5F
    .byte $16 ; |   X XX | $FE60
    .byte $06 ; |     XX | $FE61
    .byte $F6 ; |XXXX XX | $FE62
    .byte $E6 ; |XXX  XX | $FE63
    .byte $D6 ; |XX X XX | $FE64
    .byte $C6 ; |XX   XX | $FE65
    .byte $B6 ; |X XX XX | $FE66
    .byte $A6 ; |X X  XX | $FE67
    .byte $96 ; |X  X XX | $FE68
    .byte $77 ; | XXX XXX| $FE69
    .byte $67 ; | XX  XXX| $FE6A
    .byte $57 ; | X X XXX| $FE6B
    .byte $47 ; | X   XXX| $FE6C
    .byte $37 ; |  XX XXX| $FE6D
    .byte $27 ; |  X  XXX| $FE6E
    .byte $17 ; |   X XXX| $FE6F
    .byte $07 ; |     XXX| $FE70
    .byte $F7 ; |XXXX XXX| $FE71
    .byte $E7 ; |XXX  XXX| $FE72
    .byte $D7 ; |XX X XXX| $FE73
    .byte $C7 ; |XX   XXX| $FE74
    .byte $B7 ; |X XX XXX| $FE75
    .byte $A7 ; |X X  XXX| $FE76
    .byte $97 ; |X  X XXX| $FE77
    .byte $78 ; | XXXX   | $FE78
    .byte $68 ; | XX X   | $FE79
    .byte $58 ; | X XX   | $FE7A
    .byte $48 ; | X  X   | $FE7B
    .byte $38 ; |  XXX   | $FE7C
    .byte $28 ; |  X X   | $FE7D
    .byte $18 ; |   XX   | $FE7E
    .byte $08 ; |    X   | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
LFE82:
    .byte $10 ; |   X    | $FE82
    .byte $10 ; |   X    | $FE83
    .byte $10 ; |   X    | $FE84
    .byte $10 ; |   X    | $FE85
    .byte $10 ; |   X    | $FE86
    .byte $10 ; |   X    | $FE87
    .byte $10 ; |   X    | $FE88
    .byte $10 ; |   X    | $FE89
    .byte $10 ; |   X    | $FE8A
    .byte $10 ; |   X    | $FE8B
    .byte $10 ; |   X    | $FE8C
    .byte $10 ; |   X    | $FE8D
    .byte $10 ; |   X    | $FE8E
    .byte $10 ; |   X    | $FE8F
    .byte $10 ; |   X    | $FE90
    .byte $10 ; |   X    | $FE91
    .byte $10 ; |   X    | $FE92
    .byte $10 ; |   X    | $FE93
    .byte $10 ; |   X    | $FE94
    .byte $10 ; |   X    | $FE95
    .byte $10 ; |   X    | $FE96
    .byte $10 ; |   X    | $FE97
    .byte $10 ; |   X    | $FE98
    .byte $10 ; |   X    | $FE99
    .byte $10 ; |   X    | $FE9A
    .byte $10 ; |   X    | $FE9B
    .byte $10 ; |   X    | $FE9C
    .byte $10 ; |   X    | $FE9D
    .byte $10 ; |   X    | $FE9E
    .byte $15 ; |   X X X| $FE9F
    .byte $15 ; |   X X X| $FEA0
    .byte $15 ; |   X X X| $FEA1
    .byte $15 ; |   X X X| $FEA2
    .byte $10 ; |   X    | $FEA3
    .byte $10 ; |   X    | $FEA4
    .byte $10 ; |   X    | $FEA5
    .byte $10 ; |   X    | $FEA6
    .byte $10 ; |   X    | $FEA7
    .byte $10 ; |   X    | $FEA8
    .byte $10 ; |   X    | $FEA9
    .byte $10 ; |   X    | $FEAA
    .byte $10 ; |   X    | $FEAB
    .byte $10 ; |   X    | $FEAC
    .byte $11 ; |   X   X| $FEAD
    .byte $10 ; |   X    | $FEAE
    .byte $10 ; |   X    | $FEAF
    .byte $10 ; |   X    | $FEB0
    .byte $10 ; |   X    | $FEB1
    .byte $10 ; |   X    | $FEB2
    .byte $10 ; |   X    | $FEB3
    .byte $42 ; | X    X | $FEB4
    .byte $86 ; |X    XX | $FEB5
    .byte $44 ; | X   X  | $FEB6
    .byte $88 ; |X   X   | $FEB7
    .byte $46 ; | X   XX | $FEB8
    .byte $B2 ; |X XX  X | $FEB9
    .byte $36 ; |  XX XX | $FEBA
    .byte $B4 ; |X XX X  | $FEBB
    .byte $38 ; |  XXX   | $FEBC
    .byte $B6 ; |X XX XX | $FEBD
    .byte $D4 ; |XX X X  | $FEBE
    .byte $A6 ; |X X  XX | $FEBF
    .byte $D6 ; |XX X XX | $FEC0
    .byte $A8 ; |X X X   | $FEC1
    .byte $D8 ; |XX XX   | $FEC2
    .byte $44 ; | X   X  | $FEC3
    .byte $86 ; |X    XX | $FEC4
    .byte $46 ; | X   XX | $FEC5
    .byte $88 ; |X   X   | $FEC6
    .byte $48 ; | X  X   | $FEC7
    .byte $E4 ; |XXX  X  | $FEC8
    .byte $86 ; |X    XX | $FEC9
    .byte $E6 ; |XXX  XX | $FECA
    .byte $88 ; |X   X   | $FECB
    .byte $E8 ; |XXX X   | $FECC
    .byte $B4 ; |X XX X  | $FECD
    .byte $86 ; |X    XX | $FECE
    .byte $B6 ; |X XX XX | $FECF
    .byte $88 ; |X   X   | $FED0
    .byte $B8 ; |X XXX   | $FED1
    .byte $14 ; |   X X  | $FED2
    .byte $66 ; | XX  XX | $FED3
    .byte $16 ; |   X XX | $FED4
    .byte $68 ; | XX X   | $FED5
    .byte $18 ; |   XX   | $FED6
    .byte $32 ; |  XX  X | $FED7
    .byte $B6 ; |X XX XX | $FED8
    .byte $34 ; |  XX X  | $FED9
    .byte $B8 ; |X XXX   | $FEDA
    .byte $36 ; |  XX XX | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $00 ; |        | $FEDD
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
    .byte $00 ; |        | $FEEA
    .byte $00 ; |        | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
LFF00:
    .byte $20 ; |  X     | $FF00
    .byte $20 ; |  X     | $FF01
    .byte $20 ; |  X     | $FF02
    .byte $20 ; |  X     | $FF03
    .byte $20 ; |  X     | $FF04
    .byte $20 ; |  X     | $FF05
    .byte $20 ; |  X     | $FF06
    .byte $20 ; |  X     | $FF07
    .byte $20 ; |  X     | $FF08
    .byte $20 ; |  X     | $FF09
    .byte $20 ; |  X     | $FF0A
    .byte $20 ; |  X     | $FF0B
    .byte $20 ; |  X     | $FF0C
    .byte $20 ; |  X     | $FF0D
    .byte $20 ; |  X     | $FF0E
    .byte $20 ; |  X     | $FF0F
    .byte $20 ; |  X     | $FF10
    .byte $20 ; |  X     | $FF11
    .byte $20 ; |  X     | $FF12
    .byte $20 ; |  X     | $FF13
    .byte $20 ; |  X     | $FF14
    .byte $20 ; |  X     | $FF15
    .byte $20 ; |  X     | $FF16
    .byte $20 ; |  X     | $FF17
    .byte $20 ; |  X     | $FF18
    .byte $20 ; |  X     | $FF19
    .byte $20 ; |  X     | $FF1A
    .byte $20 ; |  X     | $FF1B
    .byte $20 ; |  X     | $FF1C
    .byte $25 ; |  X  X X| $FF1D
    .byte $25 ; |  X  X X| $FF1E
    .byte $25 ; |  X  X X| $FF1F
    .byte $25 ; |  X  X X| $FF20
    .byte $20 ; |  X     | $FF21
    .byte $20 ; |  X     | $FF22
    .byte $20 ; |  X     | $FF23
    .byte $20 ; |  X     | $FF24
    .byte $20 ; |  X     | $FF25
    .byte $20 ; |  X     | $FF26
    .byte $20 ; |  X     | $FF27
    .byte $20 ; |  X     | $FF28
    .byte $20 ; |  X     | $FF29
    .byte $20 ; |  X     | $FF2A
    .byte $21 ; |  X    X| $FF2B
    .byte $20 ; |  X     | $FF2C
    .byte $20 ; |  X     | $FF2D
    .byte $20 ; |  X     | $FF2E
    .byte $20 ; |  X     | $FF2F
    .byte $20 ; |  X     | $FF30
    .byte $20 ; |  X     | $FF31
    .byte $05 ; |     X X| $FF32
    .byte $50 ; | X X    | $FF33
    .byte $05 ; |     X X| $FF34
    .byte $50 ; | X X    | $FF35
    .byte $05 ; |     X X| $FF36
    .byte $50 ; | X X    | $FF37
    .byte $05 ; |     X X| $FF38
    .byte $50 ; | X X    | $FF39
    .byte $05 ; |     X X| $FF3A
    .byte $14 ; |   X X  | $FF3B
    .byte $14 ; |   X X  | $FF3C
    .byte $50 ; | X X    | $FF3D
    .byte $05 ; |     X X| $FF3E
    .byte $14 ; |   X X  | $FF3F
    .byte $14 ; |   X X  | $FF40
    .byte $50 ; | X X    | $FF41
    .byte $05 ; |     X X| $FF42
    .byte $05 ; |     X X| $FF43
    .byte $50 ; | X X    | $FF44
    .byte $50 ; | X X    | $FF45
    .byte $05 ; |     X X| $FF46
    .byte $05 ; |     X X| $FF47
    .byte $50 ; | X X    | $FF48
    .byte $50 ; | X X    | $FF49
    .byte $05 ; |     X X| $FF4A
    .byte $01 ; |       X| $FF4B
    .byte $40 ; | X      | $FF4C
    .byte $50 ; | X X    | $FF4D
    .byte $05 ; |     X X| $FF4E
    .byte $01 ; |       X| $FF4F
    .byte $40 ; | X      | $FF50
    .byte $50 ; | X X    | $FF51
    .byte $05 ; |     X X| $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $50 ; | X X    | $FF55
    .byte $05 ; |     X X| $FF56
    .byte $00 ; |        | $FF57
    .byte $00 ; |        | $FF58
    .byte $50 ; | X X    | $FF59
    .byte $05 ; |     X X| $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $50 ; | X X    | $FF5D
    .byte $05 ; |     X X| $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $50 ; | X X    | $FF61
    .byte $05 ; |     X X| $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $50 ; | X X    | $FF65
    .byte $05 ; |     X X| $FF66
    .byte $00 ; |        | $FF67
    .byte $00 ; |        | $FF68
    .byte $50 ; | X X    | $FF69
    .byte $05 ; |     X X| $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $50 ; | X X    | $FF6D
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
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
LFF82:
    .byte $0F ; |    XXXX| $FF82
    .byte $16 ; |   X XX | $FF83
    .byte $28 ; |  X X   | $FF84
    .byte $38 ; |  XXX   | $FF85
    .byte $46 ; | X   XX | $FF86
    .byte $0F ; |    XXXX| $FF87
    .byte $58 ; | X XX   | $FF88
    .byte $68 ; | XX X   | $FF89
    .byte $88 ; |X   X   | $FF8A
    .byte $0F ; |    XXXX| $FF8B
    .byte $98 ; |X  XX   | $FF8C
    .byte $B8 ; |X XXX   | $FF8D
    .byte $C8 ; |XX  X   | $FF8E
    .byte $28 ; |  X X   | $FF8F
    .byte $46 ; | X   XX | $FF90
    .byte $D8 ; |XX XX   | $FF91
    .byte $E6 ; |XXX  XX | $FF92
    .byte $F6 ; |XXXX XX | $FF93
    .byte $0F ; |    XXXX| $FF94
    .byte $28 ; |  X X   | $FF95
    .byte $46 ; | X   XX | $FF96
    .byte $98 ; |X  XX   | $FF97
    .byte $16 ; |   X XX | $FF98
    .byte $58 ; | X XX   | $FF99
    .byte $F6 ; |XXXX XX | $FF9A
    .byte $88 ; |X   X   | $FF9B
LFF9C:
    .byte $00 ; |        | $FF9C
    .byte $00 ; |        | $FF9D
    .byte $01 ; |       X| $FF9E
    .byte $01 ; |       X| $FF9F
    .byte $02 ; |      X | $FFA0
    .byte $02 ; |      X | $FFA1
    .byte $02 ; |      X | $FFA2
    .byte $00 ; |        | $FFA3
    .byte $03 ; |      XX| $FFA4
    .byte $03 ; |      XX| $FFA5
    .byte $03 ; |      XX| $FFA6
    .byte $03 ; |      XX| $FFA7
    .byte $04 ; |     X  | $FFA8
    .byte $04 ; |     X  | $FFA9
    .byte $05 ; |     X X| $FFAA
    .byte $05 ; |     X X| $FFAB
    .byte $05 ; |     X X| $FFAC
    .byte $05 ; |     X X| $FFAD
    .byte $06 ; |     XX | $FFAE
    .byte $06 ; |     XX | $FFAF
    .byte $06 ; |     XX | $FFB0
    .byte $06 ; |     XX | $FFB1
    .byte $07 ; |     XXX| $FFB2
    .byte $07 ; |     XXX| $FFB3
    .byte $07 ; |     XXX| $FFB4
    .byte $07 ; |     XXX| $FFB5
    .byte $08 ; |    X   | $FFB6
    .byte $08 ; |    X   | $FFB7
    .byte $09 ; |    X  X| $FFB8
    .byte $0A ; |    X X | $FFB9
    .byte $0A ; |    X X | $FFBA
    .byte $0A ; |    X X | $FFBB
    .byte $0A ; |    X X | $FFBC
    .byte $0B ; |    X XX| $FFBD
    .byte $0B ; |    X XX| $FFBE
    .byte $0B ; |    X XX| $FFBF
    .byte $0B ; |    X XX| $FFC0
    .byte $0B ; |    X XX| $FFC1
    .byte $0B ; |    X XX| $FFC2
    .byte $0B ; |    X XX| $FFC3
    .byte $0B ; |    X XX| $FFC4
    .byte $0B ; |    X XX| $FFC5
    .byte $0B ; |    X XX| $FFC6
    .byte $08 ; |    X   | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $0A ; |    X X | $FFC9
    .byte $0A ; |    X X | $FFCA
    .byte $0A ; |    X X | $FFCB
    .byte $0A ; |    X X | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
    .byte $00 ; |        | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
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
LFFEA:
    sta    LFFF8                 ; 4
    jmp    LF103                 ; 3
LFFF0:
    jmp    LFFF0                 ; 3
LFFF3:
    jmp    LFFF3                 ; 3
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
LFFF8:
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $D1 ; |XX X   X| $FFFD
    .byte $00 ; |        | $FFFE
    .byte $00 ; |        | $FFFF