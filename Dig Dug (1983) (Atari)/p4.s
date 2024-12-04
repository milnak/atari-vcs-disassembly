; Disassembly of xad
; Disassembled Fri Dec 30 02:38:53 2005
; Using DiStella v3.0
;
; Command Line: distella30 xad
;

LFFF7   =   $FFF7

       RORG $F000
LF000:  .byte   $FE
LF001:  .byte   $00,$28,$10,$23,$13,$18,$F2
LF008:  .byte   $E1
LF009:  .byte   $E5
LF00A:  .byte   $13
LF00B:  .byte   $1A,$FE,$00,$20
LF00F:  .byte   $FA
LF010:  .byte   $13
LF011:  .byte   $0C
LF012:  .byte   $18
LF013:  .byte   $E6
LF014:  .byte   $06
LF015:  .byte   $00
LF016:  .byte   $DD,$6E,$10
LF019:  .byte   $DD
LF01A:  .byte   $66
LF01B:  .byte   $11
LF01C:  .byte   $7E
LF01D:  .byte   $B9,$28,$04,$04,$23,$18,$F8,$78,$E1,$D1,$C1,$C9,$C5,$D5,$21,$4D
    .byte   $60,$7E,$47,$1A,$B8,$20,$08,$FE,$00,$28,$11,$23,$13,$18,$F2,$7E
    .byte   $FE,$00,$28,$03,$23,$18,$F8,$D1,$D5
LF046:  .byte   $23
LF047:  .byte   $18,$E5,$23,$D1,$C1,$C9,$44,$30,$00,$44,$38,$00,$44,$30,$00,$44
    .byte   $31,$00,$44,$39,$00,$44,$31,$00,$44,$32,$00,$44,$31,$30,$00,$44
    .byte   $32,$00,$44
LF06A:  .byte   $33 ;.rla
LF06B:  .byte   $00,$44
LF06D:  .byte   $31
LF06E:  .byte   $31
LF06F:  .byte   $00,$44
LF071:  .byte   $33,$00,$44,$34,$00,$44,$31
LF078:  .byte   $32
LF079:  .byte   $00
LF07A:  .byte   $44,$34,$00
LF07D:  .byte   $44
LF07E:  .byte   $35
LF07F:  .byte   $00
LF080:  .byte   $FE
LF081:  .byte   $00,$28,$10,$23,$13,$18,$F2
LF088:  .byte   $E1
LF089:  .byte   $E5
LF08A:  .byte   $13,$1A,$FE,$00,$20
LF08F:  .byte   $FA,$13,$0C,$18,$E6
LF094:  .byte   $06
LF095:  .byte   $00
LF096:  .byte   $DD,$6E,$10,$DD
LF09A:  .byte   $66,$11,$7E
LF09D:  .byte   $B9,$28,$04,$04,$23,$18,$F8,$78,$E1,$D1,$C1,$C9,$C5,$D5,$21,$4D
    .byte   $60,$7E,$47,$1A,$B8,$20,$08,$FE,$00,$28,$11,$23,$13,$18,$F2,$7E
    .byte   $FE,$00,$28,$03,$23,$18,$F8,$D1,$D5,$23,$18,$E5,$23,$D1,$C1,$C9
    .byte   $44,$30,$00,$44,$38,$00,$44,$30,$00,$44,$31,$00,$44,$39,$00,$44
    .byte   $31,$00,$44,$32,$00,$44,$31,$30,$00,$44,$32,$00,$44,$33,$00,$44
    .byte   $31,$31,$00,$44
LF0F1:  .byte   $33,$00,$44,$34,$00,$44,$31
LF0F8:  .byte   $32,$00
LF0FA:  .byte   $44
LF0FB:  .byte   $34,$00
LF0FD:  .byte   $44
LF0FE:  .byte   $35
LF0FF:  .byte   $00,$EA,$EA,$EA

;START:
    sei
    cld
    ldx #$FD
    lda #$00
LF109:  sta WSYNC,X
    dex
    bne LF109
    ldx #$7F
LF110:  sta LF000,X
    dex
    bpl LF110
    inc $80
    lda #$21
    sta CTRLPF
    lda #$2C
    sta TIM64T
LF121:  lda #$00
    sta LF011
    sta LF019
LF129:  ldx #$00
    stx LF010
    stx LF01C
    stx AUDV0
    stx AUDV1
    lda LF08F
    and #$FE
    sta LF00F
    lda #$82
    sta LF015
    lda #$78
    sta LF01B
    inx
    stx LF01A
    bpl LF175
LF14D:  lda #$2C
    sta TIM64T
    lda #$00
    sta GRP0
    sta $DA
    sta $D3
    ldx #$C5
    txs
    lda SWCHB
    lsr
    bcs LF178
    ldy $80
    beq LF169
    ldy #$01
LF169:  sty $80
    lda #$03
    sta LF015
    lda #$FF
    sta LF01A
LF175:  jmp LFFE4
LF178:  lsr
    bcs LF18F
    lda #$10
    sta LF019
    lda $80
    beq LF186
    lda #$01
LF186:  sta $80
    ldy #$01
    sty LF011
    bpl LF129
LF18F:  lda LF09A
    cmp #$FF
    beq LF1A4
    lda LF095
    bpl LF1D7
    lda INPT4
    bmi LF1D7
    lda #$03
    sta LF015
LF1A4:  ldx #$0D
    lda #$00
LF1A8:  sta $F2,X
    sta LF06F,X
    dex
    bpl LF1A8
    sta LF06D
    sta LF06E
    tax
    sta LF01A
    lda #$01
    ldy LF095
    bmi LF1CC
    stx LF07D
    stx LF07E
    stx LF07F
    asl
    asl
LF1CC:  sta LF000
    ldx #$09
LF1D1:  txa
    sta $85,X
    dex
    bpl LF1D1
LF1D7:  ldy #$FF
    sty $E4
    lda #$F0
    sta $E0
    sta $E2
    bit $F8
    bvs LF1EF
    lda LF080
    and #$10
    beq LF1EF
    jmp LFFF0
LF1EF:  lda #$08
    bit LF095
    beq LF218
    lda LF080
    and #$20
    bne LF272
    ldx LF089
    bpl LF207
    ldy #$11
    jsr LF2C8
LF207:  dex
    stx LF009
    bne LF215
    lda #$F7
    and LF095
    sta LF015
LF215:  jmp LFFE4
LF218:  lda #$02
    bit LF095
    bne LF222
    jmp LF2CF
LF222:  lda LF095
    and #$04
    bne LF264
    sta PF0
LF22B:  lda INTIM
    bne LF22B
    ldx #$02
    stx WSYNC
    stx VSYNC
    stx VBLANK
LF238:  stx WSYNC
    dex
    bpl LF238
    stx WSYNC
    inx
    stx VSYNC
    ldx #$29
    stx TIM64T
LF247:  lda INTIM
    bne LF247
    sta WSYNC
    sta VBLANK
    lda #$DF
    sta TIM64T
    jsr LFC81
LF258:  lda INTIM
    bne LF258
    lda #$2C
    sta TIM64T
    bne LF267
LF264:  jsr LFC81
LF267:  lda LF095
    and #$FD
    sta LF015
    jmp LFFE4
LF272:  ldx LF089
    dex
    stx LF009
    beq LF2A0
    cpx #$60
    bne LF289
    ldy #$07
    lda #$00
LF283:  sta LF071,Y
    dey
    bpl LF283
LF289:  cpx #$54
    bne LF292
    ldy #$12
    jsr LF2C8
LF292:  txa
    lsr
    lsr
    lsr
    lsr
    tax
    lda LFFCF,X
    sta LF014
    bne LF2BC
LF2A0:  lda LF095
    and #$F7
    sta LF015
    lda LF080
    and #$DF
    sta LF000
    tax
    and #$07
    bne LF2B8
    jmp LF121
LF2B8:  dex
    stx LF000
LF2BC:  jmp LFFE4
LF2BF:  .byte   $00,$0B,$16,$12,$CD,$F9
LF2C5:  sta LFFF7
LF2C8:  cpy $D3
    bcc LF2CE
    sty $D3
LF2CE:  rts

LF2CF:  lda $F2
    tax
    and #$07
    tay
    and #$03
    bne LF2DC
    jmp LF843
LF2DC:  txa
    ldx #$00
    and #$18
    lsr
    lsr
    sta $D5
    lda $F3
    and #$01
    clc
    adc $D5
    tax
    lda LFFC7,Y
    and LFFB0,X
    bne LF309
    lda $F3
    lsr
    and #$01
    clc
    adc $D5
    tax
    lda LFFC7,Y
    and LFFB8,X
    beq LF2BC
    jmp LFFED
LF309:  ldx #$02
    lda $F6
    tay
    and #$80
    sta $D1
    tya
    and #$03
    beq LF31C
    sec
    sbc #$01
    bpl LF31D
LF31C:  txa
LF31D:  sta $D2
    tya
    and #$7C
    ora $D2
    sta $F6
    stx $DA
    lda LF095
    bpl LF35E
    lda LF08F
    lsr
    bcs LF336
    jmp LFFE4
LF336:  ldy LF09A
    lda LFB0F,Y
    bpl LF346
    asl
    bpl LF346
    lda LF0FA
    bpl LF349
LF346:  lda LF08A
LF349:  cmp LFB1F,Y
    bne LF358
    cpy #$0F
    bne LF354
    ldy #$03
LF354:  iny
    sty LF01A
LF358:  lda LFB0F,Y
    jmp LF3F0
LF35E:  lda LF095
    lsr
    bcc LF3AD
    lda LF08A
    cmp #$3C
    beq LF378
    cmp #$5C
    bne LF374
    ldy #$13
    jsr LF2C8
LF374:  lda #$BF
    bmi LF3F0
LF378:  lda LF0FA
    cmp #$15
    beq LF383
    lda #$DF
    bmi LF3F0
LF383:  lda #$42
    sta LF014
    lda #$7F
    sta $F1
    lda #$FE
    and LF095
    ora #$08
    sta LF015
    lda $F6
    ora #$80
    sta $F6
    ldy #$06
LF39E:  lda $00F9,Y
    bpl LF3A8
    and #$BF
    sta $00F9,Y
LF3A8:  dey
    bpl LF39E
    bmi LF40A
LF3AD:  lda LF080
    and #$30
    beq LF3BC
    ldy #$04
    jsr LF2C8
    jmp LF40A
LF3BC:  lda INPT4
    bmi LF3D1
    lda $F3
    and #$E0
    cmp #$20
    beq LF3D9
    lda $F6
    ora #$80
    sta $F6
    jmp LFFEA
LF3D1:  lda $F3
    bmi LF3D9
    and #$9F
    sta $F3
LF3D9:  lda SWCHA
    sta $D5
    lda $F1
    eor #$FF
    bit $D5
    bne LF3EE
    ora $D5
    cmp #$FF
    beq LF3EE
    sta $D5
LF3EE:  lda $D5
LF3F0:  bpl LF40D
    asl
    bpl LF410
    asl
    bpl LF416
    asl
    bpl LF413
    lda $F6
    ora #$80
    sta $F6
    lda $F3
    bmi LF40A
    lda #$00
    sta LF079
LF40A:  jmp LFFE4
LF40D:  jmp LF550
LF410:  jmp LF5E0
LF413:  jmp LF4AD
LF416:  lda LF08A
    cmp #$3C
    bcc LF41F
    sbc #$3C
LF41F:  cmp #$30
    bcc LF425
    sbc #$30
LF425:  tax
    lda $F1
    ldy LFF80,X
    beq LF430
    tay
    bne LF3F0
LF430:  cmp #$DF
    bne LF43C
    lda $D1
    bmi LF43C
    lda $D2
    bne LF40A
LF43C:  ldx #$4A
    cpx LF094
    bne LF444
    inx
LF444:  stx LF014
    lda #$DF
    sta $F1
    ldx LF0FA
    dex
    beq LF478
    ldx #$09
    ldy #$18
    lda #$0B
    jsr LFBA2
    bmi LF463
    lda #$EF
    sta $F1
    jmp LF779
LF463:  ldx LF0FA
    dex
    stx LF07A
    txa
    and #$03
    sta $DD
    beq LF47B
    cmp #$03
    beq LF47B
    jsr LF7E4
LF478:  jmp LF66F
LF47B:  txa
    lsr
    sec
    sbc #$01
    sta $D6
    ldy LF08A
    jsr LFC5B
    jsr LF7E4
    ldy $DD
    lda LF08A
    ldx #$00
LF492:  sec
    sbc #$0C
    bmi LF49A
    inx
    bpl LF492
LF49A:  stx $D5
    cpy #$03
    bne LF4A6
    lda #$3C
    sta $D9
    bpl LF4AA
LF4A6:  lda #$0C
    sta $D9
LF4AA:  jmp LF783
LF4AD:  lda LF08A
    cmp #$3C
    bcc LF4B6
    sbc #$3C
LF4B6:  cmp #$30
    bcc LF4BC
    sbc #$30
LF4BC:  tax
    lda $F1
    ldy LFF80,X
    beq LF4C8
    tay
    jmp LF3F0
LF4C8:  cmp #$EF
    bne LF4D7
    lda $D1
    bmi LF4D7
    lda $D2
    beq LF4D7
    jmp LFFE4
LF4D7:  ldx #$48
    cpx LF094
    bne LF4DF
    inx
LF4DF:  stx LF014
    lda #$EF
    sta $F1
    ldx LF0FA
    cpx #$29
    bne LF4F8
    lda #$42
    sta LF014
    lda #$7F
    sta $F1
    bpl LF512
LF4F8:  ldx #$09
    ldy #$18
    lda #$05
    jsr LFBA2
    bpl LF512
    ldx LF0FA
    inx
    stx LF07A
    txa
    and #$02
    bne LF515
    jsr LF7F3
LF512:  jmp LF66F
LF515:  lda LF0FA
    lsr
    sec
    sbc #$01
    sta $D6
    inx
    txa
    lsr
    ldy LF08A
    jsr LFC5B
    jsr LF7F3
    lda LF0FA
    and #$03
    tay
    lda LF08A
    ldx #$00
LF535:  sec
    sbc #$0C
    bmi LF53D
    inx
    bpl LF535
LF53D:  stx $D5
    cpy #$02
    bne LF549
    lda #$30
    sta $D9
    bpl LF54D
LF549:  lda #$F0
    sta $D9
LF54D:  jmp LF783
LF550:  lda LF0FA
    and #$03
    cmp #$01
    beq LF55E
    lda $F1
    jmp LF3F0
LF55E:  ldy $D2
    lda LFFD7,Y
    sta LF014
    lda #$7F
    sta $F1
    ldx LF08A
    cpx #$78
    beq LF5AB
    ldx #$09
    ldy #$11
    txa
    jsr LFBA2
    bmi LF582
    lda #$BF
    sta $F1
    jmp LF779
LF582:  lda $F8
    cmp #$D4
    bcc LF59A
    lda LF0FA
    cmp LF0F8
    bne LF59A
    lda LF08A
    adc #$04
    cmp LF088
    beq LF5AB
LF59A:  ldx LF08A
    inx
    stx LF00A
    txa
    and #$03
    cmp #$01
    beq LF5AE
    jsr LF813
LF5AB:  jmp LF66F
LF5AE:  txa
    clc
    adc #$07
    tay
    lda LF0FA
    lsr
    sta $D6
    jsr LFC21
    jsr LF813
    lda LF08A
    clc
    adc #$03
    ldx #$00
    sec
LF5C8:  sbc #$0C
    bmi LF5CF
    inx
    bpl LF5C8
LF5CF:  adc #$0C
    ora #$FC
    cmp #$FC
    bne LF5AB
    lda #$28
    sta $D9
    stx $D5
    jmp LF783
LF5E0:  lda LF0FA
    and #$03
    cmp #$01
    beq LF5EE
    lda $F1
    jmp LF3F0
LF5EE:  ldy $D2
    lda LFFDA,Y
    sta LF014
    lda #$BF
    sta $F1
    ldx LF08A
    beq LF639
    ldx #$09
    ldy #$1F
    txa
    jsr LFBA2
    bmi LF610
    lda #$7F
    sta $F1
    jmp LF779
LF610:  lda $F8
    cmp #$D4
    bcc LF628
    lda LF0FA
    cmp LF0F8
    bne LF628
    lda LF088
    adc #$04
    cmp LF08A
    beq LF639
LF628:  ldx LF08A
    dex
    stx LF00A
    txa
    and #$03
    cmp #$03
    beq LF63C
    jsr LF824
LF639:  jmp LF66F
LF63C:  txa
    and #$FC
    tay
    lda LF0FA
    lsr
    sta $D6
    jsr LFC21
    jsr LF824
    lda LF08A
    sec
    sbc #$04
    bmi LF66F
    ldx #$00
LF656:  sbc #$0C
    bmi LF65D
    inx
    bpl LF656
LF65D:  adc #$0C
    and #$03
    cmp #$03
    bne LF66F
    lda #$14
    sta $D9
    inx
    stx $D5
    jmp LF783
LF66F:  lda $F3
    lsr
    bcc LF679
    lda #$00
    sta LF079
LF679:  lda #$7F
    and $F3
    sta $F3
    lda LF080
    and #$F7
    sta LF000
    lda $F1
    rol
    bcc LF6B2
    rol
    bcc LF695
    rol
    bcs LF698
    jmp LF770
LF695:  jmp LF732
LF698:  ldx #$09
    ldy #$18
    lda #$03
    jsr LFBA2
    bpl LF6AE
LF6A3:  ldx #$09
    ldy #$18
    lda #$05
    jsr LFBA2
    bmi LF714
LF6AE:  lda #$40
    bpl LF6EC
LF6B2:  lda #$50
    and LF095
    bne LF717
    ldx #$09
    ldy #$11
    lda #$05
    jsr LFBA2
    bmi LF6DB
    sty $DD
    lda LFF50,Y
    clc
    adc #$05
    lsr
    tax
    lda LFF58,Y
    clc
    adc #$1C
    tay
    txa
    jsr LFBED
    beq LF6E8
LF6DB:  ldx #$09
    ldy #$15
    lda #$05
    jsr LFBA2
    bmi LF6A3
    bpl LF6EA
LF6E8:  ldy $DD
LF6EA:  lda #$20
LF6EC:  bit $F8
    bmi LF6FA
    ora LF095
    sta LF015
    sty $F8
    bpl LF714
LF6FA:  bvs LF706
    lda $F8
    and #$07
    sta $D5
    cpy $D5
    beq LF714
LF706:  ora LF095
    sta LF015
    tya
    asl
    asl
    asl
    ora $F4
    sta $F4
LF714:  jmp LFFE4
LF717:  lda $F8
    bmi LF72A
    ora #$80
    sta $F8
    lda LF095
    and #$8F
    sta LF015
LF727:  jmp LFFE4
LF72A:  lda $F4
    ora #$80
    sta $F4
    bmi LF727
LF732:  lda #$60
    and LF095
    bne LF717
    ldx #$09
    ldy #$1F
    lda #$05
    jsr LFBA2
    bmi LF75B
    sty $DD
    lda LFF50,Y
    clc
    adc #$05
    lsr
    tax
    lda LFF58,Y
    clc
    adc #$18
    tay
    txa
    jsr LFBED
    beq LF769
LF75B:  ldx #$09
    ldy #$1B
    lda #$05
    jsr LFBA2
    bpl LF76B
    jmp LF6A3
LF769:  ldy $DD
LF76B:  lda #$10
    jmp LF6EC
LF770:  lda #$70
    and LF095
    bne LF717
    beq LF714
LF779:  lda LF080
    ora #$08
    sta LF000
    bne LF714
LF783:  lda $D6
    tax
    lsr
    bcc LF78A
    inx
LF78A:  txa
    clc
    adc #$04
    sta $D6
    bit $D9
    bpl LF79B
    ldx $D5
    ldy $D6
    jsr LFB2F
LF79B:  asl $D9
    bpl LF7A7
    ldx $D5
    dex
    ldy $D6
    jsr LFB2F
LF7A7:  asl $D9
    bpl LF7B4
    ldx $D5
    ldy $D6
    dey
    dey
    jsr LFB2F
LF7B4:  asl $D9
    bpl LF7C2
    ldx $D5
    dex
    ldy $D6
    dey
    dey
    jsr LFB2F
LF7C2:  asl $D9
    bpl LF7D1
    ldx $D5
    lda $D6
    sec
    sbc #$04
    tay
    jsr LFB2F
LF7D1:  asl $D9
    bpl LF7E1
    ldx $D5
    dex
    lda $D6
    sec
    sbc #$04
    tay
    jsr LFB2F
LF7E1:  jmp LF66F
LF7E4:  lda $F3
    lsr
    bcs LF80F
    ldx LF0FA
    dex
    bmi LF80F
    ldy #$CC
    bne LF802
LF7F3:  lda $F3
    lsr
    bcs LF80F
    ldx LF0FA
    inx
    cpx #$2C
    bcs LF80F
    ldy #$07
LF802:  lda LF08A
    sta LF009
    sty LF013
LF80B:  stx LF079
    rts

LF80F:  ldx #$00
    beq LF80B
LF813:  lda $F3
    lsr
    bcs LF83F
    ldx LF08A
    cpx #$78
    bcs LF83F
    inx
    ldy #$CA
    bne LF832
LF824:  lda $F3
    lsr
    bcs LF83F
    ldx LF08A
    dex
    dex
    bmi LF83F
    ldy #$CB
LF832:  sty LF013
    stx LF009
    lda LF0FA
LF83B:  sta LF079
    rts

LF83F:  lda #$00
    beq LF83B
LF843:  lda #$01
    sta $DA
    sta $CA
    lda $F8
    bpl LF883
    bit $F8
    bvs LF886
    and #$07
    tax
    lda #$18
    clc
    adc LFF58,X
    sta LF008
    lda #$09
    clc
    adc LFF50,X
    sta LF078
    lda #$05
    sta LF012
    lda LFFC0,X
    eor #$FF
    and $8F
    sta $8F
    lda #$C0
    sta $F8
    lda $F7
    ora #$78
    sta $F7
    ldy #$0B
    jsr LF2C8
LF883:  jmp LFA5D
LF886:  and #$3F
    cmp #$10
    bcs LF89D
    ldy #$05
    lda #$04
    bit $F8
    bne LF896
    ldy #$85
LF896:  sty LF012
LF899:  inc $F8
    bne LF883
LF89D:  cmp #$20
    bne LF8A4
    jmp LF9BE
LF8A4:  cmp #$14
    bcc LF8BF
    cmp #$1C
    bcc LF8B0
    lda #$89
    bne LF8BA
LF8B0:  cmp #$18
    bcc LF8B8
    lda #$87
    bne LF8BA
LF8B8:  lda #$05
LF8BA:  sta LF012
    bne LF899
LF8BF:  ldx #$09
    jsr LFE6C
    bmi LF8E1
    lda LF080
    ora #$20
    sta LF000
    ldx LF0F8
    dex
    dex
    stx LF07A
    lda $F3
    and #$1F
    sta $F3
    lda #$00
    sta LF079
LF8E1:  ldy #$00
    ldx #$06
LF8E5:  lda $F9,X
    bpl LF908
    jsr LFE6C
    bmi LF908
    iny
    lda LF0F8
    sec
    sbc #$02
    sta LF071,X
    lda $F9,X
    ora #$40
    sta $F9,X
    lda LF096,X
    and #$F0
    ora #$10
    sta LF016,X
LF908:  dex
    bpl LF8E5
    sty $D6
    ldx #$07
    ldy #$18
    lda #$0B
    jsr LFBA2
    bpl LF943
    ldy LF0F8
    dey
    beq LF943
    tya
    and #$03
    beq LF929
    cmp #$03
    beq LF97A
    bne LF98A
LF929:  dey
    tya
    lsr
    ldy LF088
    jsr LFBED
    beq LF98A
    ldy LF088
    lda LF0F8
    sec
    sbc #$04
    lsr
    jsr LFC0F
    beq LF946
LF943:  jmp LF9A0
LF946:  ldy LF088
    lda LF0F8
    sec
    sbc #$02
    lsr
    sta $D8
    ldx $F3
    jsr LFC5B
    stx $F3
    lda LF088
    ldx #$00
LF95E:  sec
    sbc #$0C
    bmi LF966
    inx
    bpl LF95E
LF966:  stx $D5
    ldy $D8
    iny
    jsr LFB2F
    ldx $D5
    dex
    ldy $D8
    iny
    jsr LFB2F
    jmp LF98A
LF97A:  ldy LF0F8
    dey
    dey
    dey
    tya
    lsr
    ldy LF088
    jsr LFC0F
    bne LF9A0
LF98A:  lda $F8
    cmp #$D3
    bne LF992
    lda #$CF
LF992:  clc
    adc #$01
    sta $F8
    ldy LF0F8
    dey
    sty LF078
    bpl LF9BB
LF9A0:  lda #$40
    bit $F6
    beq LF9A8
    lda #$20
LF9A8:  ora $F6
    sta $F6
    ldy #$06
    lda $D6
    beq LF9B4
    ldy #$05
LF9B4:  jsr LF2C8
    lda #$D4
    sta $F8
LF9BB:  jmp LFA5D
LF9BE:  ldy #$00
    sty $CA
    ldx #$06
LF9C4:  lda $F9,X
    bpl LF9EF
    lda LF096,X
    and #$10
    beq LF9EF
    iny
    lda $F6
    and #$1C
    cmp #$1C
    bne LF9E6
    txa
    asl
    asl
    ora #$E3
    and $F6
    sta $F6
    lda #$00
    sta LF016,X
LF9E6:  lda #$00
    sta $F9,X
    sta LF071,X
    dec $F4
LF9EF:  dex
    bpl LF9C4
    tya
    beq LFA24
    sec
    sbc #$01
    asl
    tax
    lda LFF72,X
    inx
    ldy LFF72,X
    jsr LFE94
    ldy LFF72,X
    dex
    lda LFF72,X
    jsr LFE94
    lda $F4
    and #$07
    cmp #$01
    bne LFA24
    ldy $80
    beq LFA1F
    asl
    ora $F3
    sta $F3
LFA1F:  ldy #$0D
    jsr LF2C8
LFA24:  lda #$00
    sta $F8
    sta LF078
    lda LF095
    and #$70
    beq LFA53
    lda $F4
    lsr
    lsr
    lsr
    and #$07
    sta $F8
    bit $F4
    bpl LFA4D
    lda $F8
    ora #$80
    sta $F8
    lda LF095
    and #$8F
    sta LF015
LFA4D:  lda $F4
    and #$47
    sta $F4
LFA53:  lda #$20
    and LF080
    beq LFA5D
    jmp LFFF0
LFA5D:  lda $F6
    tay
    and #$60
    cmp #$60
    bne LFA6D
    tya
    and #$1C
    cmp #$1C
    bne LFA70
LFA6D:  jmp LFAF9
LFA70:  lsr
    lsr
    and #$07
    tax
    lda LF096,X
    and #$40
    bne LFAF9
    lda #$20
    and LF096,X
    bne LFA98
    lda #$20
    sta LF016,X
    lda LF0FB
    clc
    adc #$01
    and #$07
    ora LF096,X
    sta LF016,X
    bne LFAF9
LFA98:  lda LF096,X
    bmi LFADF
    lda LF0FB
    and #$07
    sta $DD
    lda LF096,X
    and #$07
    cmp $DD
    bne LFAF9
    ldy $80
    cpy #$13
    bcc LFAB5
    ldy #$12
LFAB5:  lda LFAFC,Y
    sta LF00B,X
    lda #$3C
    sta LF001,X
    lda #$15
    sta LF071,X
    lda #$80
    ora LF096,X
    and #$F8
    sta LF016,X
    lda LF0FB
    clc
    adc #$03
    and #$07
    ora LF096,X
    sta LF016,X
    bne LFAF9
LFADF:  lda LF0FB
    and #$07
    sta $DD
    lda LF096,X
    and #$07
    cmp $DD
    bne LFAF9
    lda #$00
    sta LF071,X
    lda #$40
    sta LF016,X
LFAF9:  jmp LFFDE
LFAFC:  .byte   $83,$83,$0B,$0C,$C1,$C1,$C2,$C2,$C3,$C3,$C4,$C4,$C0,$C0,$C5,$C5
    .byte   $0D,$0D,$C7
LFB0F:  .byte   $DF,$BF,$EF,$7F,$EF,$7F,$DF,$7F,$DF,$BF,$EF,$EF,$7F,$DF,$BF,$EF
LFB1F:  .byte   $11,$18,$15,$24,$1C,$54,$11,$78,$05,$3C,$0A,$25,$54,$01,$00,$11
LFB2F:  lda #$9D
    sta $DF
    tya
    cmp #$01
    bcc LFBA1
    cmp #$13
    bcs LFBA1
    asl
    asl
    adc $DF
    sta $DF
    txa
    bmi LFBA1
    cmp #$0A
    bcs LFBA1
    cmp #$05
    bcc LFB53
    lda $DF
    adc #$01
    sta $DF
LFB53:  txa
    asl
    asl
    asl
    sta $E3
    ldx #$03
LFB5B:  ldy #$00
    lda ($DF),Y
    ora ($E3),Y
    cmp ($E3),Y
    bne LFBA1
    iny
    lda ($DF),Y
    ora ($E3),Y
    cmp ($E3),Y
    bne LFBA1
    dex
    beq LFB80
    lda $DF
    sec
    sbc #$04
    sta $DF
    lda $E3
    adc #$01
    sta $E3
    bne LFB5B
LFB80:  lda $DF
    clc
    adc #$04
    sta $DF
    sec
    sbc #$80
    sta $E1
    lda $E3
    adc #$01
    sta $E3
    ldy #$00
    lda ($DF),Y
    and ($E3),Y
    sta ($E1),Y
    iny
    lda ($DF),Y
    and ($E3),Y
    sta ($E1),Y
LFBA1:  rts

LFBA2:  sty $E5
    sta $E6
    ldy #$07
LFBA8:  lda $E5
    clc
    adc LFF58,Y
    cmp LF081,X
    bne LFBC7
    lda LFFC0,Y
    and $8F
    beq LFBC9
    lda $E6
    clc
    adc LFF50,Y
    cmp LF0F1,X
    bne LFBC9
    beq LFBCC
LFBC7:  dey
    dey
LFBC9:  dey
    bpl LFBA8
LFBCC:  rts

LFBCD:  .byte   $7F,$BF,$DF,$EF,$F7,$FB,$FD,$FE,$FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
    .byte   $7F,$BF,$DF,$EF,$F7,$FB,$FD,$FE,$FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
LFBED:  asl
    asl
    sta $DF
    tya
    lsr
    lsr
    sta $EC
    lsr
    lsr
    lsr
    clc
    adc $DF
    sta $DF
    tay
LFBFF:  lda LF09D,Y
    sta $D0
    ldy $EC
    lda LFBCD,Y
    ora $D0
    cmp LFBCD,Y
LFC0E:  rts

LFC0F:  jsr LFBED
    bne LFC0E
    ldy $DF
    inc $EC
    lda $EC
    and #$07
    bne LFBFF
    iny
    bpl LFBFF
LFC21:  asl
    asl
    sta $DF
    tya
    lsr
    lsr
    sta $EC
    lsr
    lsr
    lsr
    clc
    adc $DF
    sta $DF
    tay
    lda LF09D,Y
    sta $D0
    lda #$01
    ora $F3
    sta $F3
    ldy $EC
    lda LFBCD,Y
    and $D0
    cmp $D0
    beq LFC80
    ldy $DF
    sta LF01D,Y
    lda #$FE
    and $F3
    sta $F3
    ldy #$00
    lda #$05
    jmp LFE94
LFC5B:  jsr LFC21
    ldy $DF
    inc $EC
    lda $EC
    and #$07
    bne LFC6B
    iny
    sty $DF
LFC6B:  lda LF09D,Y
    sta $D0
    ldy $EC
    lda LFBCD,Y
    and $D0
    cmp $D0
    beq LFC80
    ldy $DF
    sta LF01D,Y
LFC80:  rts

LFC81:  lda #$01
    ldx LF095
    bpl LFC8C
    ldx #$00
    beq LFCB3
LFC8C:  ldx $80
    cpx #$7F
    bcc LFC9E
    lda $F2
    and #$1F
    tax
    lda $80
    sec
    sbc #$6F
    bpl LFCB3
LFC9E:  stx $D5
    dex
    bmi LFCB5
    cpx #$0F
    bcc LFCB5
    lda $80
    and #$FC
    sta $D5
    lda $80
    sbc $D5
    adc #$0B
LFCB3:  sta $D5
LFCB5:  lda #$04
    bit LF095
    bne LFD21
    txa
    bpl LFCC0
    inx
LFCC0:  sec
    sbc #$0C
    bpl LFCC0
    adc #$0C
    lsr
    lsr
    tax
    lda LF2BF,X
    sta $EB
    ldx #$4F
    lda #$FF
LFCD3:  sta LF01D,X
    dex
    bpl LFCD3
    ldy $D5
    lda LFF60,Y
    cpy #$10
    bcc LFCE4
    and $F2
LFCE4:  sta $8F
    ldx #$07
LFCE8:  lda LFFC0,X
    and $8F
    beq LFCFF
    lda #$18
    clc
    adc LFF58,X
    tay
    lda #$09
    adc LFF50,X
    lsr
    jsr LFC5B
LFCFF:  dex
    bpl LFCE8
    lda #$0F
    sta LF046
    sta LF047
    lda LF095
    lsr
    bcs LFD21
    lda #$0B
    sta $D8
LFD14:  ldy #$3C
    jsr LFC5B
    inc $D8
    lda $D8
    cmp #$14
    bne LFD14
LFD21:  ldy $D5
    tya
    ldx LFEE0,Y
    stx $EE
    asl
    asl
    asl
    tax
    jsr LF2C5
    cpy #$10
    bcc LFD39
    lda $F2
    sta $EE
    rol
LFD39:  sta $F0
    inx
    txa
    clc
    adc #$07
    sta $D9
    lda #$00
    sta $DD
    sta $D6
LFD48:  jsr LF2C5
    sta $DE
    bne LFD52
    jmp LFDF7
LFD52:  ldy $DD
    and #$0F
    asl
    asl
    asl
    sta $D7
    lsr
    clc
    adc $D7
    sta $D7
    sta LF001,Y
    lda $DE
    lsr
    lsr
    lsr
    lsr
    asl
    sta $D8
    asl
    adc #$01
    sta LF071,Y
    lda #$04
    bit LF095
    beq LFDA2
    lda $00F9,Y
    bmi LFD86
    lda #$00
    sta LF071,Y
    bpl LFDF7
LFD86:  inc $D6
    lda #$80
    sta $00F9,Y
    lda LF096,Y
    and #$40
    sta LF016,Y
    beq LFD9B
    lda #$06
    bpl LFD9D
LFD9B:  lda #$01
LFD9D:  sta LF00B,Y
    bpl LFDF7
LFDA2:  lsr $EE
    bcs LFDAF
    lda #$01
    sta LF00B,Y
    lda #$00
    beq LFDB6
LFDAF:  lda #$06
    sta LF00B,Y
    lda #$40
LFDB6:  sta LF016,Y
    lda LF095
    lsr
    bcc LFDC3
    lda #$C0
    bmi LFDC5
LFDC3:  lda #$80
LFDC5:  sta $00F9,Y
    inc $D6
    lsr $F0
    bcs LFDE6
    lda #$03
    sta $DE
LFDD2:  lda $D8
    ldy $D7
    jsr LFC5B
    lda $D7
    clc
    adc #$08
    sta $D7
    dec $DE
    bpl LFDD2
    bmi LFDF7
LFDE6:  lda #$04
    sta $DE
LFDEA:  lda $D8
    ldy $D7
    jsr LFC5B
    inc $D8
    dec $DE
    bpl LFDEA
LFDF7:  inx
    inc $DD
    cpx $D9
    beq LFE01
    jmp LFD48
LFE01:  lda #$04
    and LF095
    bne LFE21
    lda $F6
    and #$83
    sta $F6
    lda #$1C
    ldy $D6
    cpy #$07
    bcs LFE1D
    ldy #$00
    sty LF01C
    lda #$18
LFE1D:  ora $F6
    sta $F6
LFE21:  lda LF080
    and #$F7
    sta LF000
    lda $F4
    and #$F8
    ora $D6
    sta $F4
    lda $F3
    and #$1C
    ora #$01
    sta $F3
    lda #$7F
    sta LF009
    lda LF095
    ror
    bcs LFE5C
    rol
    ora #$08
    sta LF015
    lda $F6
    ora #$80
    sta $F6
    lda #$7F
    sta $F1
    lda #$42
    ldx #$3C
    ldy #$15
    bpl LFE62
LFE5C:  lda #$46
    ldx #$78
    ldy #$29
LFE62:  sta LF014
    stx LF00A
    sty LF07A
    rts

LFE6C:  lda LF088
    sec
    sbc LF081,X
    bpl LFE7A
    eor #$FF
    clc
    adc #$01
LFE7A:  cmp #$05
    bcs LFE91
    lda LF0F8
    clc
    adc #$01
    sec
    sbc LF0F1,X
    bmi LFE91
    cmp #$05
    bcs LFE91
    lda #$00
    rts

LFE91:  lda #$FF
    rts

LFE94:  sta $D4
    lda LF095
    and #$83
    bne LFEDE
    lda $D4
    sed
    clc
    adc LF0FD
    sta LF07D
    tya
    adc LF0FE
    sta LF07E
    bcc LFEDE
    lda #$00
    adc LF0FF
    sta LF07F
    cmp #$21
    bcs LFEDE
    cmp #$02
    beq LFEC8
    and #$0F
    beq LFEC8
    cmp #$05
    bne LFEDE
LFEC8:  cld
    lda LF080
    and #$07
    cmp #$07
    beq LFEDE
    ldy LF080
    iny
    sty LF000
    ldy #$0F
    jmp LF2C8
LFEDE:  cld
    rts

LFEE0:  .byte   $01,$08,$06,$0C,$14,$38,$1E,$0E,$51,$78,$3C,$1C,$2D,$2A,$6C,$61
    .byte   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte   $8F,$FF,$AF,$FF,$8F,$FF,$DF,$FF,$F1,$FF,$F5,$FF,$F1,$FF,$FB,$FF
    .byte   $FE,$FC,$FE,$FD,$FE,$FC,$FF,$FE,$FF,$E3,$FF,$EB,$FF,$E3,$FF,$F7
    .byte   $FF,$1F,$FF,$5F,$FF,$1F,$FF,$BF,$1F,$FF,$5F,$FF,$1F,$FF,$BF,$FF
    .byte   $E3,$FF,$EB,$FF,$E3,$FF,$F7,$FF,$FC,$FE,$FD,$FE,$FC,$FE,$FE,$FF
    .byte   $FF,$F1,$FF,$F5,$FF,$F1,$FF,$FB,$FF,$8F,$FF,$AF,$FF,$8F,$FF,$DF
LFF50:  .byte   $00,$08,$04,$10,$18,$0C,$14,$1C
LFF58:  .byte   $30,$30,$00,$00,$00,$48,$48,$48
LFF60:  .byte   $61,$98,$D2,$39,$CD,$AD,$6C,$D2,$59,$C9,$6C,$E1,$DC,$63,$F0,$53
    .byte   $D9,$47
LFF72:  .byte   $00,$05,$50,$12,$00,$20,$00,$30,$00,$40,$00,$50,$00,$60
LFF80:  .byte   $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$00,$01,$02,$03
    .byte   $04,$05,$06,$07,$08,$09,$0A,$0B,$00,$01,$02,$03,$04,$05,$06,$07
    .byte   $08,$09,$0A,$0B,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B
LFFB0:  .byte   $42,$4A,$84,$84,$20,$24,$22,$22
LFFB8:  .byte   $24,$A4,$22,$2A,$42,$CA,$44,$44
LFFC0:  .byte   $80,$20,$40,$08,$02,$10,$04
LFFC7:  .byte   $01,$02,$04,$08,$10,$20,$40,$80
LFFCF:  .byte   $10,$81,$C8,$C8,$C8,$C9,$C9,$C9
LFFD7:  .byte   $42,$41,$40
LFFDA:  .byte   $46,$45,$44,$00
LFFDE:  lda LFFF8
    brk
    brk
    brk
LFFE4:  lda LFFF8
    jmp LF14D
LFFEA:  lda LFFF8
LFFED:  lda LFFF8
LFFF0:  lda LFFF8
    brk
    brk
    brk
    bcs $1006A
LFFF8:  and #$00
    brk
    brk
    .byte   $03 ;.slo
    sbc ($00),Y
    brk
