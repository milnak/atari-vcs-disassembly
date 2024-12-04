; Disassembly of Empire Strikes Back.bin
; Disassembled Wed Dec 14 15:01:27 2005
; Using DiStella v3.0
;
; Command Line: distella30 Empire Strikes Back.bin
;

        processor 6502

TIA_BASE_READ_ADDRESS = $30
        include "vcs.h"

       ORG $F000
LF000:  ldx #$00
LF002:  sta $F5
    lsr
    lsr
    lsr
    lsr
    sec
    adc $F5
    lsr
    lsr
    lsr
    lsr
    sta $F6
    clc
    adc $F5
    eor #$FF
    asl
    asl
    asl
    asl
    ora $F6
    clc
    adc #$83
    sta HMCLR
    sta HMP0,X
    and #$0F
    tay
    sta WSYNC
LF028:  dey
    bpl LF028
    sta RESP0,X
    sta WSYNC
    sta HMOVE
    rts


START:
    sei
    cld
    ldx #$00
    txa
LF037:  sta VSYNC,X
    txs
    inx
    bne LF037
    stx SWACNT
    stx SWBCNT
    lda SWCHB
    sta $F0
    jsr LF763

    brk
    .byte   $80

LF04D:  lda #$9F
    sta TIM64T
    inc $E4
    bne LF058
    inc $E5
LF058:  jsr LFE03
    lda $EB
    ora $8D
    bne LF0D0
    lda $8C
    beq LF0A5
    bit CXP0FB
    bvc LF083
    lda $B8
    cmp #$02
    bne LF083
    jsr LFD2D
    inc $8C
    jsr LFCB6
    lda #$E0
    ldx $B6
    bmi LF07F
    lda #$20
LF07F:  adc $8A
    sta $8A
LF083:  lda CXM1P
    bpl LF0A5
    lda $CA
    bne LF0A5
    jsr LFCB6
    lda $C4
    adc $8A
    sta $8A
    lda $C1
    adc $87
    sta $87
    lda #$FF
    sta $CA
    cmp $C8
    bne LF0A5
    jsr LFD25
LF0A5:  lda CXPPMM
    bpl LF0D0
    lda $86
    cmp #$27
    bcs LF0E0
    lda $8C
    beq LF0E0
    lda $A7
LF0B5:  bne LF0E0
    lda $EA
    and #$08
    beq LF0E0
    ldx $AE
    lda $98,X
    clc
    adc #$18
    sta $98,X
    ldy #$02
    lda $9D,X
    jsr LFC1B
    jsr LFCCA
LF0D0:  lda CXM0P
    bpl LF0E0
    lda $BC
    cmp #$27
    bcs LF0E0
    jsr LFC0B
    jsr LF9FC
LF0E0:  bit CXM0FB
    bvc LF101
    ldx $B8
    dex
    beq LF0EE
    dex
    beq LF0F6
    bne LF101
LF0EE:  lda CXPPMM
    bmi LF101

    brk
    .byte $0A

    inc $A7
LF0F6:  ldy #$06
    jsr LFCCF
    jsr LF9FC
    jsr LFD2D
LF101:  lda CXP0FB
    bpl LF11F
    lda $86
    cmp #$26
    bcc LF11F
    lda $8D
    bne LF11F
    dec $86
    lda $87
    bmi LF11F
    sbc #$0A
    sta $87
    lda $EB
    bne LF11F

    brk
    .byte   $07

LF11F:  bit CXPPMM
    bvc LF135
    ldx $C8
    inx
    bne LF135
    jsr LFD25
    jsr LF9FC
    sta $CA
    ldy #$08
    jsr LFCCF
LF135:  lda SWCHB
    sta $F7
    eor $F0
    sta $F8
    beq LF14F
    jsr LFCFA
    lda $F8
    ldx $EC
    and LFE70,X
    beq LF14F
    jsr LFD0C
LF14F:  lda $F7
    and #$02
    beq LF18A
    lda $F8
    and #$01
    beq LF1AA
    lda $F7
    and #$01
    beq LF166
    jsr LF76E
    beq LF1AA
LF166:  jsr LF770
    sta $EC
    sta $E2
    sta $E0
    sta $E3
    sta $E1
    lda #$04
    sta $ED
    sta $EE
    lda $EA
    and #$03
    tay
    lda LFFF8,Y
    sta $AF
    sta $B0
    jsr LFBDD
    bne LF1AA
LF18A:  lda $F8
    and #$02
    bne LF194
    dec $F4
    bne LF1AA
LF194:  inc $EA
    lda $EA
    and #$1F
    sta $EA
    jsr LF763
    ldx #$1E
    lda $F7
    lsr
    bcs LF1A8
    ldx #$0A
LF1A8:  stx $F4
LF1AA:  lda $F7
    sta $F0
    jsr LF6E0
    jsr LFD6C
    ldx $EB
    beq LF1CE
    cpx #$04
    bne LF1CC
    lda $E5
    cmp #$02
    bcc LF1CC
    ldx #$00
    stx $8D
    asl
    asl
    asl
    asl
    bne LF1CE
LF1CC:  lda #$F0
LF1CE:  ldx $8D
    beq LF1D4
    lda #$D0
LF1D4:  ldx #$86
    jsr LFD78
    ldx #$86
    jsr LFDDF
    lda $86
    cmp #$43
    bcc LF1EB
    jsr LFCA9
    lda #$42
    sta $86
LF1EB:  cmp #$02
    bcs LF1F6
    lda #$02
    sta $86
    jsr LFCAF
LF1F6:  ldx #$89
    jsr LFDDF
    lda $8A
    clc
    bpl LF201
    sec
LF201:  ror
    clc
    adc #$64
    sec
    sbc $89
    tay
    beq LF259
    bpl LF215
    cpy #$FC
    bcs LF25B
    ldy #$FC
    bmi LF25B
LF215:  cpy #$05
    bcc LF21B
    ldy #$04
LF21B:  inc $89
    inc $C3
    inc $B5
    dec $E6
    ldx $E6
    inx
    bne LF230
    dec $E7
    lda $E7
    and #$07
    sta $E7
LF230:  lda $E6
    and #$01
    bne LF256
    ldx #$D7
    lda $E6
    and #$07
    bne LF240
    ldx #$CB
LF240:  clc
    rol VSYNC,X
    ror VBLANK,X
    rol WSYNC,X
    bcc LF24F
    lda VSYNC,X
    ora #$10
    sta VSYNC,X
LF24F:  inx
    inx
    inx
    cpx #$E0
    bne LF240
LF256:  dey
    bne LF21B
LF259:  beq LF2A2
LF25B:  dec $89
    dec $C3
    dec $B5
    inc $E6
    bne LF26D
    inc $E7
    lda $E7
    and #$07
    sta $E7
LF26D:  lda $E6
    and #$01
    beq LF29F
    ldx #$D7
    lda $E6
    and #$07
    cmp #$01
    bne LF27F
    ldx #$CB
LF27F:  clc
    ror WSYNC,X
    rol VBLANK,X
    ror VSYNC,X
    lda VSYNC,X
    and #$08
    beq LF298
    lda WSYNC,X
    ora #$80
    sta WSYNC,X
    lda VSYNC,X
    and #$F0
    sta VSYNC,X
LF298:  inx
    inx
    inx
    cpx #$E0
    bne LF27F
LF29F:  iny
    bne LF25B
LF2A2:  lda $89
    jsr LF000
    ldy $8A
    dey
    bpl LF2AD
    dex
LF2AD:  stx REFP0
LF2AF:  lda INTIM
    bmi LF2AF
    sta WSYNC
    lda #$42
    sta WSYNC
    sta VBLANK
    sta WSYNC
    sta WSYNC
    sta WSYNC
    sta VSYNC
    sta WSYNC
    lda #$00
    sta WSYNC
    sta VSYNC
    lda #$96
    sta TIM64T
    ldy #$00
    lda ($E8),Y
    ldx $EB
    cpx #$04
    bcc LF2E5
    ldx $E5
    bne LF2E5
    ldx $E4
    bmi LF2E5
    txa
    asl
LF2E5:
    sta COLUPF
    lda $EB
    bne LF352
    ldx $8D
    beq LF2F9
    inx
    stx $8D
    cpx #$40
    bne LF2F9
    jsr LF774
LF2F9:  ldx $A7
    beq LF307
    inx
    stx $A7
    cpx #$40
    bne LF307
    jsr LFC42
LF307:  ldx #$04
LF309:  lda $9D,X
    beq LF34C
    cpx $AE
    bne LF315
    lda $A7
    bne LF34C
LF315:  cpx #$04
    beq LF329
    lda $8F,X
    sec
    sbc $8E,X
    tay
    lda $94,X
    sbc $93,X
    bne LF329
    cpy #$C5
    bcc LF34C
LF329:  dec $A2,X
    bne LF34C
    inc $8E,X
    bne LF333
    inc $93,X
LF333:  jsr LFC83
    adc #$03
    sta $A2,X
    cpx $AE
    bne LF34C
    dec $AA
    bpl LF34C
    lda #$03
    sta $AA
    stx $F5

    brk
    .byte $01

    ldx $F5
LF34C:  dex
    bpl LF309
    jsr LF7A2
LF352:  ldx #$04
LF354:  lda $9D,X
    beq LF3B0
    lda $8E,X
    sec
    sbc $E6
    sta $AD
    sta $F5
    lda $93,X
    sbc $E7
    beq LF394
    tay
    iny
    bne LF3B0
    lda $AD
    bpl LF3B0
    clc
    adc #$20
    bmi LF3B0
    eor #$1F
    lsr
    lsr
    tay
    lda LFFB0,Y
    sta $A9
    lda LFFC0,Y
    sta $AB
    lda $AD
    clc
    adc #$A0
    sta $F5
    bne LF3C1
LF38C:  lda #$FF
    sta $A9
    sta $AB
    bne LF3C1
LF394:  lda $AD
    bpl LF38C
    cmp #$A0
    bcs LF3B0
    and #$7F
    eor #$1F
    lsr
    lsr
    tay
    lda LFFB8,Y
    sta $A9
    lda LFFC8,Y
    sta $AB
    jmp LF3C1
LF3B0:  dex
    bpl LF354
    inx
    stx $A9
    stx $AB
    lda $A7
    beq LF3CA
    jsr LFC42
    bne LF3CA
LF3C1:  stx $AE
    lda $F5
    ldx #$01
    jsr LF002
LF3CA:  lda INTIM
    bmi LF3CA
    lda #$00
    sta WSYNC
    sta VBLANK
    lda #$9F
    sta TIM64T
    jsr LF7CC
    jsr LFA8B
    jsr LF9AC
    jsr LFA01
    ldx #$01
LF3E8:  lda $82,X
    sta AUDV0,X
    lsr
    lsr
    lsr
    lsr
    sta AUDC0,X
    lda $84,X
    sta AUDF0,X
    dex
    bpl LF3E8
LF3F9:  lda INTIM
    bmi LF3F9
    sta WSYNC
    stx $F7
    ldy #$01
    lda ($E8),Y
    sta COLUBK
    lda $E4
    asl
    ldx $A7
    bne LF41C
    ldx $AE
    lda $98,X
    lsr
    lsr
    lsr
    clc
    adc #$06
    tay
    lda ($E8),Y
LF41C:  sta COLUP1
    lda $E4
    ldx $8C
    beq LF42C
    ldy #$04
    dex
    beq LF42A
    iny
LF42A:  lda ($E8),Y
LF42C:  sta COLUP0
    ldy #$03
    lda ($E8),Y
    sta $F6
    ldx $B8
    cpx #$02
    bcs LF43C
    lda $E4
LF43C:  sta $F5
    sta WSYNC
    lda #$30
    sta NUSIZ0
    lda #$37
    sta NUSIZ1
    lda #$20
    sta CTRLPF
    lda $A8
    lsr
    tay
    lda LFE5A,Y
    sta $FA
    lda $8D
    lsr
    lsr
    lsr
    lsr
    asl
    asl
    adc #$46
    sta $FC
    lda #$FE
    sta $FB
    sta $FD
    sta CXCLR
    sta WSYNC
LF46B:  jsr LF6AD
    sta WSYNC
    lda $F7
    sec
    sbc #$08
    bne LF46B
    sta $F8
LF479:  jsr LF6AD
    ldy $F8
    lda $00CB,Y
    iny
    sta WSYNC
    sta PF0
    lda $00CB,Y
    sta PF1
    iny
    lda $00CB,Y
    sta PF2
    iny
    sty $F8
    jsr LF6AD
    lda $F7
    sec
    sbc #$10
    sta WSYNC
    bne LF479
    sta PF0
    sta PF1
    sta PF2
    lda #$14
    sta CTRLPF
    lda $F5
    sta COLUPF
LF4AE:  jsr LF6AD
    lda $F7
    sec
    sbc #$1A
    tay
    and #$F0
    beq LF4BF
    lda #$00
    beq LF4C3
LF4BF:  lda ($FA),Y
    and $A9
LF4C3:  sta WSYNC
    sta GRP1
    lda $F7
    cmp #$26
    bne LF4AE
    jsr LF6AD
    sta HMCLR
    lda #$C0
    sta HMP1
    ldx #$35
    ldy $AA
    lda LFE5E,Y
    sta $FA
    ldy #$00
    lda ($FA),Y
    and $AB
    sta WSYNC
    sta HMOVE
    stx NUSIZ1
    sta GRP1
    ldy #$02
    lda ($E8),Y
    sta COLUBK
LF4F3:  jsr LF6AD
    lda $F7
    sec
    sbc #$26
    tay
    and #$F0
    beq LF504
    lda #$00
    beq LF508
LF504:  lda ($FA),Y
    and $AB
LF508:  sta WSYNC
    sta GRP1
    lda $F7
    sec
    sbc #$3E
    bne LF4F3
    sta $F8
    lda $F6
    sta COLUPF
LF519:  jsr LF6AD
    ldy $F8
    lda $00D7,Y
    iny
    sta WSYNC
    sta PF0
    lda $00D7,Y
    sta PF1
    iny
    lda $00D7,Y
    sta PF2
    iny
    sty $F8
    jsr LF6AD
    lda $F7
    cmp #$44
    bne LF519
    ldy #$03
    lda ($E8),Y
    sta WSYNC
    sta COLUBK
    ldx #$FF
    stx PF0
    inx
    stx PF1
    stx PF2
    stx GRP0
    stx ENAM1
    stx REFP0
    lda #$05
    sta CTRLPF
    sta NUSIZ1
    ldy #$0D
    lda ($E8),Y
    sta COLUP0
    sta COLUP1
    lda #$10
    sta NUSIZ0
    lda $E6
    lsr
    lsr
    lsr
    lsr
    sta $F5
    lda $E7
    asl
    asl
    asl
    asl
    ora $F5
    adc #$10
    inx
    jsr LF002
    ldx $F1
    dex
    bpl LF583
    ldx #$04
LF583:  stx $F1
    sta WSYNC
    lda $8E,X
    lsr
    lsr
    lsr
    lsr
    sta $F5
    lda $93,X
    asl
    asl
    asl
    asl
    ora $F5
    adc #$11
    ldx #$02
    jsr LF002
    ldy #$0C
    lda ($E8),Y
    sta COLUBK
    ldx #$0D
LF5A6:  sta WSYNC
    lda LFECE,X
    sta ENAM0
    and #$F8
    sta GRP1
    dex
    bpl LF5A6
    ldy #$03
    lda ($E8),Y
    sta COLUBK
    ldx $EC
    ldy $EB
    dey
    bne LF5C3
    ldx #$02
LF5C3:  lda LFFE3,X
    sta $F9
    lda LFFE0,X
    sta $F5
    jsr LF000
    lda $F5
    clc
    adc #$08
    inx
    jsr LF002
    ldy #$0E
    lda ($E8),Y
    sta COLUP0
    sta COLUP1
    stx NUSIZ0
    stx NUSIZ1
    stx CTRLPF
    lda #$50
    sta $F5
    sta $F6
    sta $F7
    sta $F8
    sta WSYNC
    ldx $EB
    dex
    beq LF62D
    dex
    dex
    beq LF65C
    ldx $EC
    ldy #$00
LF600:  lda $E0,X
    and #$0F
    asl
    asl
    asl
    sta $00F6,Y
    lda $E0,X
    and #$F0
    lsr
    sta $00F5,Y
    inx
    inx
    iny
    iny
    cpy #$04
    bcc LF600
    sta WSYNC
    ldx #$00
LF61E:  lda $F5,X
    bne LF66E
    lda #$50
    sta $F5,X
    inx
    cpx #$03
    bmi LF61E
    bpl LF66E
LF62D:  sta WSYNC
    ldy #$00
    ldx $EA
    inx
    txa
    ldx #$58
    cmp #$11
    bcc LF63D
    ldx #$60
LF63D:  stx $F5
LF63F:  cmp #$0A
    bcc LF649
    iny
    sec
    sbc #$0A
    bpl LF63F
LF649:  sta WSYNC
    asl
    asl
    asl
    sta $F8
    tya
    asl
    asl
    asl
    bne LF658
    lda #$50
LF658:  sta $F7
    bne LF66E
LF65C:  sta WSYNC
    ldx $EC
LF660:  ldy $ED,X
LF662:  dey
    bmi LF66C
    lda #$68
    sta $00F5,Y
    bne LF662
LF66C:  sta WSYNC
LF66E:  ldx #$07
    txs
    sta WSYNC
    ldy $F9
LF675:  dey
    bpl LF675
LF678:  ldy $F5
    lda LFF00,Y
    sta GRP0
    ldy $F6
    lda LFF00,Y
    sta GRP1
    ldy $F7
    lda LFF00,Y
    tax
    ldy $F8
    lda LFF00,Y
    stx GRP0
    sta GRP1
    inc $F5
    inc $F6
    inc $F7
    inc $F8
    inc $F9
    tsx
    dex
    txs
    bpl LF678
    sta WSYNC
    stx PF1
    stx PF2
    jmp LF04D
LF6AD:  inc $F7
    ldx #$1F
    txs
    lda $F7
    sec
    sbc $86
    tay
    and #$FC
    beq LF6C0
    ldx #$00
    beq LF6C3
LF6C0:  lda ($FC),Y
    tax
LF6C3:  lda $B2
    sec
    sbc $F7
    and #$FE
    sta WSYNC
    php
    stx GRP0
    lda $C0
    sec
    sbc $F7
    and $C8
    php
    lda $BC
    eor $F7
    php
    ldx #$FD
    txs
    rts

LF6E0:  ldx $EB
    beq LF762
    dex
    beq LF74A
    dex
    beq LF70B
    dex
    beq LF733
    lda $E4
    ora #$80
    tax
    inx
    bne LF74A
    lda $EA
    cmp #$10
    bcc LF74A
    lda $EC
    eor #$01
    sta $EC
    tax
    lda $ED,X
    bmi LF74A
    jsr LFBDD
    bne LF76E
LF70B:  lda $E4
    cmp #$3C
    bcc LF762
    dec $F4
    bpl LF76E
    inc $F4
    ldx $EC
    dec $ED,X
    bmi LF778
    lda $EA
    cmp #$10
    bcc LF76E
    lda $EC
    eor #$01
    tax
    lda $ED,X
    bmi LF72E
    stx $EC
LF72E:  jsr LFBDD
    bne LF76E
LF733:  lda $E5
    bne LF73D
    lda $E4
    cmp #$1E
    bcc LF74A
LF73D:  jsr LFD6C
    and #$F0
    cmp #$F0
    bne LF76A
    lda INPT4,X
    bpl LF76A
LF74A:  lda $F3
    bne LF756
    lda $E5
    cmp #$1E
    bcc LF762
    sta $F3
LF756:  lda $E4
    bne LF762
    ldx $E8
    inx
    txa
    and #$7F
    sta $E8
LF762:  rts

LF763:  jsr LFBDD
    lda #$01
    bne LF784
LF76A:  lda #$00
    beq LF784

LF76E:  brk
    .byte $0d

LF770:
    lda #$03
    bne LF784
LF774:  lda #$02
    bne LF78E

LF778:  brk
    .byte   $0F

    lda #$FF
    ldx $EC
    sta $ED,X
    lda #$04
    bne LF78E
LF784:  sta $EB
    jsr LFBCB
    jsr LFC8A
    beq LF790
LF78E:  sta $EB
LF790:  jsr LF9F8
    jsr LFA6F
    jsr LFCFA
    lda #$00
    sta $E4
    sta $E5
    sta $F3
    rts

LF7A2:  ldx #$04
    lda $9D,X
    beq LF7CB
    lda $93,X
    cmp #$07
    bne LF7CB
    lda $8E,X
    tax
    cpx #$E0
    bcs LF778
    lda #$3F
    cpx #$A0
    bcc LF7C5
    lda $E4
    and #$07
    bne LF7C3
    sta COLUPF
LF7C3:  lda #$1F
LF7C5:  and $E4
    bne LF7CB

    brk
    .byte $05

LF7CB:
    rts

LF7CC:  lda $E4
    and #$03
    tax
    bne LF7D6
    jmp LF8CB
LF7D6:  lda $EB
    beq LF7DB
    rts

LF7DB:  dex
    beq LF811
    dex
    beq LF836
    ldx #$FF
    stx $F5
    inx
LF7E6:  lda $9D,X
    bne LF7EC
    stx $F5
LF7EC:  ldy $93,X
    dey
    beq LF835
    inx
    cpx #$05
    bcc LF7E6
    ldx $F5
    cpx #$FF
    beq LF835
    ldy #$00
    sty $98,X
    sty $8E,X
    iny
    sty $A2,X
    sty $93,X
    ldy $EC
    lda $00AF,Y
    sta $9D,X
    jmp LFC6A
LF811:  dec $AC
    bne LF835
    ldx $AE
    jsr LFC83
    adc #$02
    sta $AC
    ldx #$00
    lda $86
LF822:  cmp LFFF0,X
    bcc LF82A
    inx
    bne LF822
LF82A:  cpx $A8
    beq LF835
    bcs LF833
    dec $A8
    rts

LF833:  inc $A8
LF835:  rts

LF836:  lda $A9
    beq LF88B
    lda $A7
    ora $C6
    bne LF88B
    dec $C9
    bne LF88B
    sta $C2
    sta $C5
    sta $CA
    lda #$02
    sta $C6
    ldy $A8
    jsr LFE03
    and #$03
    clc
    adc LFE62,Y
    sta $C1
    bpl LF862
    adc #$28
    jmp LF868
LF862:  sta $C4
    lda #$28
    sbc $C4
LF868:  sta $C4
    lda $AD
    clc
    adc #$20
    sta $C3
    cmp $89
    bcc LF87B
    lda $C4
    eor #$FF
    sta $C4
LF87B:  lda $A8
    lsr
    clc
    adc #$1E
    ldx $F2
    bpl LF887
    adc #$01
LF887:  sta $C0

    brk
    .byte $06

LF88B:
    lda $8D
    bne LF8CA

    lda $E4
    and #$FC
    bne LF8AC
    lda $E5
    and #$1F
    cmp #$10
    beq LF8A2
    cmp #$15
    beq LF8C6
    rts

LF8A2:  lda #$00
    sta $8C
    lda #$02
    sta $EF

    brk
    .byte   $80

LF8AC:  and #$3C
    cmp #$10
    bne LF8CA
    lda $8C
    cmp #$02
    bcc LF8CA
    lda $EF
    beq LF8CA
    lda $86
    cmp #$42
    bne LF8CA
    dec $EF

    brk
    .byte   $0C

LF8C6:  lda #$01
    sta $8C
LF8CA:  rts

LF8CB:  ldx #$01
LF8CD:  ldy $80,X
    beq LF946
    bpl LF8D9
    lda $E4
    and #$07
    beq LF946
LF8D9:  lda $84,X
    and #$1F
    sta $F5
    lda $84,X
    sec
    sbc #$20
    and #$E0
    sta $F6
    bne LF936
    ldy $80,X
    bmi LF94A
    lda LFF80,Y
    and #$E0
    sta $F6
    lda LFF90,Y
    and #$0F
    sta $F8
    lda LFF90,Y
    lsr
    lsr
    lsr
    lsr
    clc
    adc $82,X
    and #$0F
    cmp $F8
    beq LF93E
    sta $F7
    lda $82,X
    and #$F0
    ora $F7
    sta $82,X
    lda LFFA0,Y
    and #$1F
    sta $F8
    lda LFFA0,Y
    lsr
    lsr
    lsr
    lsr
    lsr
    cmp #$04
    bcc LF92B
    ora #$F8
LF92B:  clc
    adc $F5
    and #$1F
    cmp $F8
    beq LF93E
    sta $F5
LF936:  lda $F5
    ora $F6
    sta $84,X
    bne LF946
LF93E:  lda #$00
    sta $80,X
    sta $82,X
    sta $84,X
LF946:  dex
    bpl LF8CD
    rts

LF94A:  lda $EB
    cmp #$04
    bcs LF93E
    inc $80,X
    lda $80,X
    and #$1F
    tay
    cmp #$12
    bne LF96D
    ldy $8C
    bne LF93E
    lda $80,X
    clc
    adc #$0E
    cmp #$E0
    beq LF93E
    sta $80,X
    and #$1F
    tay
LF96D:  jsr LF99B
    bne LF946
    plp
    tsx
    inx
    dec VSYNC,X
    lda ($00,X)
    tay
    ldx #$00
    lda $80
    cmp $81
    bcc LF983
    inx
LF983:  tya
    bmi LF997
    cmp $80,X
    bcc LF996
    sty $80,X
    lda LFF70,Y
    sta $82,X
    lda LFF80,Y
    sta $84,X
LF996:  rts

LF997:  sta $80,X
    ldy #$00
LF99B:  lda LFEEE,Y
    sta $84,X
    lda LFEDC,Y
    ldy $8C
    bne LF9A9
    and #$F7
LF9A9:  sta $82,X
    rts

LF9AC:  lda $EB
    ora $8D
    bne LF9FC
    lda $BF
    beq LF9B8
    dec $BF
LF9B8:  ldy $BC
    iny
    bne LF9DE
    ldx $EC
    lda INPT4,X
    bpl LF9C6
    sty $BF
    rts

LF9C6:  lda $BF
    bne LFA00
    jsr LF9F8

    brk
    .byte   $03

    ldx $86
    inx
    stx $BC
    lda $8A
    sta $BE
    ldx $89
    inx
    txa
    bne LF9F1
LF9DE:  lda #$F8
    ldx $BE
    beq LF9E8
    bmi LF9E8
    lda #$08
LF9E8:  clc
    adc $BD
    beq LF9FC
    cmp #$9A
    bcs LF9FC
LF9F1:  sta $BD
    ldx #$02
    jmp LF002
LF9F8:  lda #$14
    sta $BF
LF9FC:  lda #$FF
    sta $BC
LFA00:  rts

LFA01:  ldx $C6
    bne LFA06
    rts

LFA06:  lda $C0
    and #$7F
    sta $C0
    cpx #$03
    beq LFA39
    lda $86
    sec
    sbc $C0
    bpl LFA19
    eor #$FF
LFA19:  sta $F5
    lda $89
    clc
    sbc $C3
    bpl LFA24
    eor #$FF
LFA24:  clc
    adc $F5
    sta $F5
    cmp #$08
    bcs LFA42
    jsr LFE03
    and #$07
    cmp $F5
    bcc LFA42
    jsr LFD25
LFA39:  ldx #$C0
    jsr LFD3A
    beq LFA6F
    bne LFA4C
LFA42:  ldx #$C0
    jsr LFDDF
    ldx #$C3
    jsr LFDDF
LFA4C:  lda $C0
    cmp #$01
    bcc LFA6F
    cmp #$44
    bcs LFA6F
    lda $C3
    beq LFA6F
    cmp #$C0
    bcs LFA6F
    cmp #$9A
    bcc LFA68
    lda $C0
    ora #$80
    sta $C0
LFA68:  lda $C3
    ldx #$03
    jmp LF002
LFA6F:  ldx $AE
    jsr LFC83
    asl
    sta $F5
    jsr LFE03
    and #$07
    sec
    adc $F5
    sta $C9
    ldx #$00
    stx $C6
    dex
    stx $C0
    stx $C8
    rts

LFA8B:  lda $EB
    beq LFA92
    jmp LFB18
LFA92:  lda $B2
    and #$7F
    sta $B2
    ldy $AE
    ldx $B8
    beq LFAB1
    dex
    beq LFAD4
    dex
    bne LFAA7
    jmp LFB2E
LFAA7:  ldx #$B2
    jsr LFD3A
    beq LFB18
    jmp LFB99
LFAB1:  lda $A7
    bne LFB18
    lda $A9
    beq LFB1B
    lda $E4
    and #$03
    bne LFB1B
    dec $B9
    bne LFB1B
    inc $B8
LFAC5:  sty $BB
    lda $98,X
    adc #$28
    sta $B9
    jsr LFE03
    and #$07
    sta $BA
LFAD4:  cpy $BB
    beq LFADE
    lda $F2
    bpl LFAC5
    bmi LFB18
LFADE:  lda $A9
    bne LFAE5
    jmp LFBBF
LFAE5:  lda $A7
    bne LFB18
    lda $E4
    and #$03
    bne LFB1C
    dec $B9
    bne LFB1C
    lda $EA
    and #$04
    beq LFB18
    jsr LFE03
    ldx $EC
    lda $AF,X
    asl
    adc #$46
    cmp $F2
    bcs LFB18
    inc $B8
    ldx $EC
    lda $AF,X
    eor #$3F
    adc #$1E
    sta $B9

    brk
    .byte   $0B

    jmp LFB99
LFB18:  jmp LFBCB
LFB1B:  rts

LFB1C:  ldy $BA
    lda LFFD0,Y
    sta $B2
    lda LFFD8,Y
    clc
    adc $AD
    sta $B5
    jmp LFB99
LFB2E:  lda $E4
    and #$07
    bne LFB4E
    dec $B9
    beq LFB18

    brk
    .byte   $02

    jsr LFE03
    bpl LFB43
    inc $B2
    inc $B2
LFB43:  dec $B2
    asl
    bpl LFB4C
    inc $B5
    inc $B5
LFB4C:  dec $B5
LFB4E:  jsr LFE03
    ldx $EC
    lda $AF,X
    asl
    adc #$28
    cmp $F2
    bcs LFB77
    lda #$E0
    ldx $B2
    cpx $86
    bcs LFB66
    lda #$D0
LFB66:  ldx $B5
    cpx $89
    bcs LFB70
    and #$70
    bne LFB72
LFB70:  and #$B0
LFB72:  ldx #$B2
    jsr LFD78
LFB77:  ldx $B5
    txa
    clc
    adc #$20
    cmp #$B6
    bcc LFB85
    dex
    dex
    dex
    dex
LFB85:  cmp #$34
    bcs LFB8D
    inx
    inx
    inx
    inx
LFB8D:  stx $B5
    ldx #$B2
    jsr LFDDF
    ldx #$B5
    jsr LFDDF
LFB99:  ldx #$00
    lda #$12
    cmp $B2
    bcc LFBA5
    sta $B2
    stx $B3
LFBA5:  lda #$3B
    cmp $B2
    bcs LFBAF
    sta $B2
    stx $B3
LFBAF:  lda $B5
    beq LFBBF
    cmp #$E0
    bcs LFBBF
    cmp #$C0
    bcs LFBCB
    cmp #$9F
    bcc LFBC6
LFBBF:  lda $B2
    ora #$80
    sta $B2
    rts

LFBC6:  ldx #$04
    jmp LF002
LFBCB:  ldx #$00
    stx $B8
    dex
LFBD0:  stx $B2
    ldx $AE
    lda $98,X
    eor #$3F
    adc #$28
    sta $B9
    rts

LFBDD:  ldx #$00
    stx $B1
    stx $A7
    stx $F4
    inx
    stx $AC
    inx
    stx $B1
    ldy #$04
    sty $AE
LFBEF:  ldx #$00
    stx $8E,Y
    stx $98,Y
    inx
    stx $A2,Y
    tya
    tax
    inx
    stx $93,Y
    ldx $EC
    lda $AF,X
    sta $009D,Y
    jsr LFC6A
    dey
    bpl LFBEF
    rts

LFC0B:  ldy #$00
    ldx $AE
    inc $98,X
    lda $98,X
    and #$07
    bne LFC2D
    lda $9D,X
    lsr
    lsr
LFC1B:  lsr
    clc
    adc $9D,X
    sta $9D,X
    cmp #$10
    bcs LFC27
    inc $9D,X
LFC27:  lda $98,X
    cmp #$30
    bcs LFC33
LFC2D:  jsr LFCCF

    brk
    .byte   $04

    rts

LFC33:  ldy #$04
    jsr LFCCF

    brk
    .byte $0a

    inc $A7
    ldx $B8
    dex
    beq LFBCB
    rts

LFC42:  ldx $AE
    beq LFC5D
LFC46:  lda $8D,X
    sta $8E,X
    lda $92,X
    sta $93,X
    lda $97,X
    sta $98,X
    lda $A1,X
    sta $A2,X
    lda $9C,X
    sta $9D,X
    dex
    bne LFC46
LFC5D:  stx $9D
    stx $A7
    lda #$08
    sta $93
    lda #$32
    sta $8E
    rts

LFC6A:  dec $B1
    bne LFC82
    ldx $EC
    lda $AF,X
    lsr
    lsr
    lsr
    sta $F5
    lda $AF,X
    sec
    sbc $F5
    sta $AF,X
    lda #$02
    sta $B1
LFC82:  rts

LFC83:  lda $9D,X
    lsr
    lsr
    lsr
    clc
    rts

LFC8A:  lda #$3A
    sta $86
    lda #$64
    sta $89
    sta $E6
    lda #$07
    sta $E7
    jsr LFD0C
    ldx #$00
    stx $8D
    inx
    stx $8C
    inx
    stx $EF
    inx
    inx
    stx $AE
LFCA9:  ldx #$00
    stx $8A
    stx $8B
LFCAF:  ldx #$00
    stx $87
    stx $88
    rts

LFCB6:  inc $8C
    ldx $8C
    dex
    dex
    beq LFCC9
    dex
    jsr LFE03
    cmp LFE6A,X
    bcs LFCCA

    brk
    .byte   $07

LFCC9:  rts

LFCCA:  brk
    .byte $09

    inc $8D
    rts

LFCCF:
    ldx $EC
    lda $E0,x
    lsr
    lsr
    lsr
    lsr
    sta $F5
    sed
    clc
    lda $E2,X
    adc LFFE7,Y
    sta $E2,X
    lda $E0,X
    adc LFFE6,Y
    sta $E0,X
    lsr
    lsr
    lsr
    lsr
    cmp $F5
    beq LFCF8
    lsr
    bcs LFCF8

    brk
    .byte $0e

    inc $F4
LFCF8:  cld
    rts

LFCFA:  lda #$FE
    sta $E9
    ldx #$28
    lda SWCHB
    and #$08
    beq LFD09
    ldx #$37
LFD09:  stx $E8
    rts

LFD0C:  ldx #$14
LFD0E:  lda LFE13,X
    sta $CB,X
    dex
    bpl LFD0E
    lda SWCHB
    ldx $EC
    and LFE70,X
    beq LFD24
    lda #$1F
    sta $DF
LFD24:  rts

LFD25:  ldx #$C0
    lda #$FC
    sta COLUPF,X
    bne LFD2F
LFD2D:  ldx #$B2
LFD2F:  lda #$03
    sta COLUP0,X
    lda #$00
    sta COLUP1,X

    brk
    .byte $08

    rts

LFD3A:  lda COLUP1,X
    beq LFD51
    and #$03
    tay
    lda VSYNC,X
    sec
    sbc LFE72,Y
    sta VSYNC,X
    lda RSYNC,X
    sec
    sbc LFE76,Y
    sta RSYNC,X
LFD51:  inc COLUP1,X
    lda COLUP1,X
    cmp #$20
    beq LFD6B
    and #$03
    tay
    lda VSYNC,X
    adc LFE72,Y
    sta VSYNC,X
    lda RSYNC,X
    clc
    adc LFE76,Y
    sta RSYNC,X
LFD6B:  rts

LFD6C:  lda SWCHA
    ldx $EC
    beq LFD77
    asl
    asl
    asl
    asl
LFD77:  rts

LFD78:  tay
    lda VSYNC,X
    cmp #$42
    bcs LFD98
    tya
    asl
    bcc LFD90
    asl
    bcs LFD98
    dec NUSIZ0,X
    bmi LFD98
    dec NUSIZ0,X
    dec NUSIZ0,X
    bvc LFD98
LFD90:  inc NUSIZ0,X
    bpl LFD98
    inc NUSIZ0,X
    inc NUSIZ0,X
LFD98:  tya
    asl
    asl
    asl
    bcc LFDB0
    asl
    bcc LFDAC
    lda $E4
    lsr
    bcc LFDB2
    lda VBLANK,X
    beq LFDB2
    bmi LFDB0
LFDAC:  dec VBLANK,X
    dec VBLANK,X
LFDB0:  inc VBLANK,X
LFDB2:  lda VBLANK,X
    cmp #$F4
    bcs LFDC8
    cmp #$0C
    bcc LFDC8
    cmp #$80
    bcc LFDC4
    lda #$F4
    bne LFDC6
LFDC4:  lda #$0C
LFDC6:  sta VBLANK,X
LFDC8:  lda NUSIZ0,X
    cmp #$C0
    bcs LFDDE
    cmp #$40
    bcc LFDDE
    cmp #$80
    bcc LFDDA
    lda #$C0
    bne LFDDC
LFDDA:  lda #$40
LFDDC:  sta NUSIZ0,X
LFDDE:  rts

LFDDF:  lda VBLANK,X
    clc
    adc WSYNC,X
    cmp #$08
    bcc LFE00
    cmp #$F8
    bcs LFE00
    cmp #$80
    bcs LFDF9
LFDF0:  inc VSYNC,X
    sec
    sbc #$10
    bpl LFDF0
    bmi LFE00
LFDF9:  dec VSYNC,X
    clc
    adc #$10
    bmi LFDF9
LFE00:  sta WSYNC,X
    rts

LFE03:  lda $F2
    asl
    asl
    asl
    asl
    clc
    adc $F2
    clc
    adc #$01
    sta $F2
    rts

LFE12:  .byte   $DD
LFE13:  .byte   $F0,$FF,$C7,$D0,$FE,$02,$80,$F8,$00,$00,$E0,$00,$00,$03,$01,$00
    .byte   $EF,$03,$C0,$FF,$07,$0C,$0E,$0C,$00,$00,$08,$00,$02,$04,$06,$08
    .byte   $0A,$0E,$00,$0E
    .byte   $4E,$8E,$8C,$60
    .byte   $54,$3A,$02,$A6,$66,$56,$36,$2A
    .byte   $3E,$00,$1E,$3C,$FF,$70,$00,$18,$5A,$30,$00,$24,$A5,$48,$00,$22
    .byte   $40,$08,$00,$00,$00,$00,$00
LFE5A:  .byte   $7A,$87,$94,$A1
LFE5E:  .byte   $AE,$AE,$AE,$BE
LFE62:  .byte   $F4,$F7,$FA,$FD,$00,$03,$06,$09
LFE6A:  .byte   $C8,$96,$64,$32,$00,$00
LFE70:  .byte   $40,$80
LFE72:  .byte   $00,$00,$FE,$02
LFE76:  .byte   $FC,$04,$00,$00,$30,$30,$7A,$FF,$FF,$FF,$FA,$F8,$F8,$F8,$68,$48
    .byte   $48,$30,$30,$78,$FA,$FF,$FF,$FF,$FA,$F8,$F8,$68,$48,$48,$30,$30
    .byte   $78,$F8,$FA,$FF,$FF,$FF,$FA,$F8,$68,$48,$48,$30,$30,$78,$F8,$F8
    .byte   $FA,$FF,$FF,$FF,$FA,$68,$48,$48,$77,$77,$77,$55,$DD,$DD,$BB,$BB
    .byte   $AA,$AA,$AA,$AA,$AA,$BA,$FF,$00,$C6,$C6,$C6,$C6,$C6,$C6,$E7,$E7
    .byte   $A5,$A5,$A5,$A5,$A5,$E7,$F7,$00
LFECE:  .byte   $00,$00,$00,$F8,$88,$00,$02,$02,$00,$00,$88,$F8,$00,$00
LFEDC:  .byte   $C0,$CC,$CC,$CC,$CC,$CC,$CC,$4C,$CC,$CC,$CC,$CC,$4C,$CC,$CC,$CC
    .byte   $CC,$CC
LFEEE:  .byte   $60,$7B,$D4,$6D,$2F,$30,$32,$DF,$6D,$2F,$30,$32,$DF,$6D,$2F,$30
    .byte   $2F,$D2
LFF00:  .byte   $1C,$22,$63,$63,$63,$22,$1C,$00,$04,$0C,$1C,$0C,$0C,$0C,$7F,$00
    .byte   $3E,$03,$03,$3E,$60,$60,$7F,$00,$7E,$03,$03,$3E,$03,$03,$7E,$00
    .byte   $02,$06,$0E,$16,$26,$7F,$06,$00,$7E,$60,$60,$3E,$03,$03,$7E,$00
    .byte   $3E,$60,$60,$7E,$63,$63,$3E,$00,$7F,$61,$03,$06,$0C,$18,$30,$00
    .byte   $3E,$63,$63,$3E,$63,$63,$3E,$00,$3E,$63,$63,$3F,$03,$03,$3E,$00
    .byte   $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$1C,$1C,$1C,$08,$08,$00
    .byte   $22,$00,$77,$77,$77,$22,$22,$00,$00,$1E,$1E,$7F,$7F,$0E,$0E,$00
LFF70:  .byte   $00,$2A,$F8,$8B,$8B,$F8,$8C,$8C,$8E,$8E,$8F,$8B,$6C,$CD,$4F,$8F
LFF80:  .byte   $00,$44,$24,$20,$2A,$2A,$20,$22,$2F,$34,$58,$20,$48,$28,$75,$A5
LFF90:  .byte   $00,$00,$00,$F7,$E6,$1F,$F2,$FA,$F8,$F7,$F8,$F1,$F8,$F8,$FA,$F8
LFFA0:  .byte   $00,$25,$28,$28,$30,$E4,$2F,$0F,$38,$3B,$3F,$0F,$0F,$00,$00,$3C
LFFB0:  .byte   $7F,$3F,$1F,$0F,$07,$03,$01,$00
LFFB8:  .byte   $00,$80,$C0,$E0,$F0,$F8,$FC,$FE
LFFC0:  .byte   $FF,$3F,$0F,$03,$00,$00,$00,$00
LFFC8:  .byte   $00,$00,$C0,$F0,$FC,$FF,$FF,$FF
LFFD0:  .byte   $1E,$1E,$1E,$23,$23,$23,$23,$1C
LFFD8:  .byte   $14,$14,$14,$14,$14,$14,$14,$0A
LFFE0:  .byte   $28,$64,$46
LFFE3:  .byte   $0E,$12,$10
LFFE6:  .byte   $00
LFFE7:  .byte   $01,$00,$25,$00,$50,$01,$00,$00,$10
LFFF0:  .byte   $12,$17,$1C,$21,$26,$2B,$30,$63
LFFF8:  .byte   $40,$30,$20,$12,$32,$F0,$72,$F9
