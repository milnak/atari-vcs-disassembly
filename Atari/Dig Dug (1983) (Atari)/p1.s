; Disassembly of xaa
; Disassembled Fri Dec 30 02:38:39 2005
; Using DiStella v3.0
;
; Command Line: distella30 xaa
;


       RORG $9000
L9000:  .byte   $C3,$69,$CA,$09,$FF,$00,$FB,$00,$F3,$C3,$A3
L900B:  .byte   $B7,$FF,$00,$FB,$00,$FF,$00,$FF,$6A,$FF,$00
L9016:  .byte   $31,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$F3,$C3,$27,$10,$FF,$00,$FF,$00,$C3,$47,$CA,$65,$1F,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $C3,$0B,$CA,$00,$FF,$00,$FF,$00,$FB,$00,$FF
L9071:  .byte   $00,$FF,$00,$FF,$00,$FB,$00,$FF,$00,$FF,$00
L907C:  .byte   $FF
L907D:  .byte   $00
L907E:  .byte   $FF
L907F:  .byte   $22
L9080:  .byte   $C3,$69,$CA,$09,$FF,$00,$FB,$00,$F3,$C3,$A3,$B7,$FF,$00,$FB,$00
    .byte   $FF,$00,$FF,$6A,$FF
L9095:  .byte   $00
L9096:  .byte   $31,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$F3,$C3,$27,$10,$FF,$00,$FF,$00,$C3,$47,$CA,$65,$1F,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
    .byte   $C3,$0B,$CA,$00,$FF,$00,$FF,$00,$FB,$00,$FF
L90F1:  .byte   $00,$FF,$00,$FF,$00,$FB,$00,$FF,$00,$FF,$00
L90FC:  .byte   $FF
L90FD:  .byte   $00
L90FE:  .byte   $FF
L90FF:  .byte   $22

;START:
    lda $FFF9
L9103:  stx $011B
    lda #$9B
    sta $BF
    sta $C1
    sta $C3
    sta $C5
    sta $C7
    lda $F080
    and #$07
    tay
    lda #$03
    sta VDELP0
    sta $0110
    sta RESP1
    sta VDELP1
    sta NUSIZ0
    sta NUSIZ1
    lda L98F4,Y
    sta PF2
    lda L9DF8,Y
    sta HMOVE
    sta PF1
    stx COLUPF
    stx PF0
    ldy #$50
    sec
    lda $80
    bne L9142
    lda #$58
    bne L914E
L9142:  lda $F0FF
    and #$F0
    bne L914D
    sty $BE
    beq L9150
L914D:  lsr
L914E:  sta $BE
L9150:  lda $F0FF
    and #$0F
    bcc L915D
    bne L915D
    sty $C0
    beq L9162
L915D:  asl
    asl
    asl
    sta $C0
L9162:  lda $F0FE
    and #$F0
    bcc L916F
    bne L916F
    sty $C2
    beq L9172
L916F:  lsr
    sta $C2
L9172:  lda $F0FE
    and #$0F
    bcc L917F
    bne L917F
    sty $C4
    beq L9184
L917F:  asl
    asl
    asl
    sta $C4
L9184:  lda $F0FD
    and #$F0
    bcc L9191
    bne L9191
    sty $C6
    beq L9194
L9191:  lsr
    sta $C6
L9194:  ldx #$CD
    txs
    lda #$6C
    pha
    lda #$C6
    pha
    pha
    pha
    lda #$6C
    pha
    lda #$38
    pha
    sta $CE
    ldy #$06
    sty $EC
    lda #$36
    sta COLUP0
    sta COLUP1
    sta WSYNC
L91B3:  sta COLUPF
    lda ($BE),Y
    sta GRP0
    lda ($C0),Y
    sta GRP1
    lda ($C2),Y
    sta GRP0
    lda ($C4),Y
    tax
    lda ($C6),Y
    tay
    lda #$00
    sta COLUPF
    pla
    dec $EC
    stx $011C
    sty GRP0
    sta GRP1
    sta GRP0
    lda #$36
    ldy $EC
    bpl L91B3
    iny
    sty VDELP0
    sty VDELP1
    sty GRP0
    sty GRP1
    sty PF1
    sty PF2
    jmp L9FE4
L91ED:  .byte   $11,$3C,$F8,$21,$25,$03,$CD,$18,$02,$D1,$E1,$C9,$E5,$11,$A0,$F8
    .byte   $21,$32,$03,$A9,$00,$85,$F2,$85,$F0,$AC,$84,$02,$D0,$FB,$A0,$06
    .byte   $85,$02,$88,$D0,$FB,$84,$01,$84,$2B,$A2,$FF,$9A,$C8,$84,$D7,$84
    .byte   $02,$88,$84,$1B,$84,$1C,$A9,$80,$85,$20,$A9,$90,$85,$21,$48,$68
    .byte   $48,$68,$EA,$85,$10,$85,$11,$AC,$9A,$F0,$88,$D0,$0E,$AD,$9B,$F0
    .byte   $C9,$45,$90,$07,$A9,$BB,$6D,$9B,$F0,$85,$D7,$85,$02,$85,$2A,$A0
    .byte   $34,$A9,$03,$85,$25,$85,$26,$85,$04,$85,$05,$A2,$09,$CA,$D0,$FD
    .byte   $B9,$5E,$94,$8D,$1B,$01,$B9,$73,$9A,$85,$1C,$B9,$00,$9A,$85,$1B
    .byte   $B9,$7B,$98,$85,$EC,$B9,$98,$99,$85,$06,$85,$07,$84,$EE,$B9,$AF
    .byte   $98,$BE,$A7,$9A,$A4,$EC,$86,$1C,$84,$1B,$85,$1C,$85,$1B,$A4,$EE
    .byte   $88,$C4,$D7,$B0,$CB,$A9,$00,$85,$25,$85,$26,$85,$1B,$85,$1C,$85
    .byte   $04,$85,$05,$85,$0C,$85,$02,$A6,$D7,$E0,$02,$90,$06,$CA,$85,$02
    .byte   $CA,$D0,$FB,$A0,$0E,$85,$02,$88,$D0,$FB,$85,$EE,$A9,$99,$85,$82
    .byte   $85,$84,$85,$D8,$85,$ED,$AC,$9A,$F0,$88,$98,$4A,$B0,$73,$A8,$AE
    .byte   $90,$F0,$E8,$8E,$10,$F0,$8A,$29,$03,$C0,$01,$85,$02,$F0,$23,$AA
    .byte   $D0,$0A,$AD,$9B,$F0,$18,$79,$E9,$95,$8D,$1B,$F0,$AD,$90,$F0,$29
    .byte   $0C,$D0,$05,$09,$04,$8D,$10,$F0,$AD,$9B,$F0,$D9,$E8,$98,$F0,$29
    .byte   $D0,$65,$AA,$D0,$07,$AE,$9C,$F0,$E8,$8E,$1C,$F0,$AD,$90,$F0,$29
    .byte   $0C,$F0,$04,$C9,$0C,$D0,$0A,$AD,$90,$F0,$29,$F3,$09,$04,$8D,$10
    .byte   $F0,$AD,$9C,$F0,$D9,$E8,$98,$D0,$3E,$85,$02,$E6,$EE,$AC,$9A,$F0
    .byte   $C8,$C0,$09,$90,$01,$88,$8C,$1A,$F0,$A9,$04,$8D,$10,$F0,$88,$98
    .byte   $4A,$A8,$AE,$90,$F0,$E8,$8E,$10,$F0,$8A,$D9,$E4,$98,$A9,$01,$85
    .byte   $02,$B0,$04,$85,$02,$90,$19,$AC,$9A,$F0,$C8,$C0,$09,$B0,$03,$8C
    .byte   $1A,$F0,$A9,$04,$8D,$10,$F0,$85,$02,$AD,$90,$F0,$4A,$4A,$29,$03
    .byte   $AC,$9A,$F0,$88,$18,$79,$F5,$9A,$A8,$88,$B9,$EC,$98,$85,$81,$AC
    .byte   $9A,$F0,$88,$98,$4A,$A8,$A5,$EE,$D0,$04,$85,$02,$85,$02,$AD,$9B
    .byte   $F0,$85,$02,$29,$0F,$85,$EE,$A9,$07,$38,$E5,$EE,$29,$0F,$0A,$0A
    .byte   $0A,$0A,$C9,$80,$D0,$0C,$AD,$9B,$F0,$18,$79,$E9,$95,$8D,$1B,$F0
    .byte   $10,$E1,$85,$02,$85,$20,$EA,$EA,$EA,$AD,$9B,$F0,$4A,$4A,$4A,$4A
    .byte   $AA,$F0,$04,$CA,$D0,$FD,$EA,$85,$10,$85,$02,$A9,$7F,$85,$06,$A9
    .byte   $3A,$85,$07,$A9,$00,$85,$21,$AC,$9A,$F0,$C0,$02,$90,$21,$F0,$04
    .byte   $A9,$00,$B0,$29,$AD,$90,$F0,$4A,$90,$0E,$A9,$88,$85,$0C,$85,$21
    .byte   $A9,$7F,$85,$07,$A9,$08,$B0,$15,$AD,$90,$F0,$C9,$14,$B0,$04,$A9
    .byte   $3B,$D0,$0A,$C9,$32,$90,$04,$A2,$05,$86,$05,$A9,$12,$85,$83,$85
    .byte   $02,$A5,$80,$D0,$04,$A9,$50,$D0,$02,$A9,$00,$85,$D7,$A2,$00,$86
    .byte   $D6,$E8,$86,$D5,$C0,$06,$85,$02,$90,$1B,$F0,$04,$A9,$00,$B0,$25
    .byte   $AD,$90,$F0,$4A,$90,$08,$A9,$00,$85,$D5,$A9,$08,$B0,$17,$AD,$90
    .byte   $F0,$C9,$14,$B0,$04,$A9,$1D,$D0,$0C,$C9,$32,$90,$06,$A0,$05,$84
    .byte   $D6,$D0,$F2,$A9,$46,$85,$EC,$4C,$00,$95,$1E,$1C,$1E,$1C,$14,$15
    .byte   $13,$14,$FF,$FF,$FF,$FF,$FF,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
    .byte   $F0,$F0,$F0,$F0,$F0,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$1F,$1F
    .byte   $1F,$1F,$1F,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E
    .byte   $1E,$1F,$1F,$1F,$1F,$1F,$1B,$18,$15,$14,$12,$10,$0E
L949A:  .byte   $0D,$0D,$0D,$0D,$04,$04,$04,$04,$1C,$19,$16,$15,$13,$11,$0F,$0E
    .byte   $0F,$10,$0F,$10,$11,$10,$11,$12,$11,$12,$13,$14,$14,$0D,$0D,$0E
    .byte   $0F,$0E,$0F,$10,$0F,$10,$11,$10,$11,$12,$13,$13,$0C,$0C
L94C8:  .byte   $06,$06,$06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$08,$08
L94D8:  .byte   $05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$08
L94E7:  .byte   $08,$18,$3F,$3F,$04,$08,$08,$0A,$18,$09,$14,$08,$05,$1F,$06,$0C
    .byte   $17,$15,$10,$3F,$08,$7E,$B7,$C8,$CD,$85,$02,$A2,$06,$CA,$D0,$FD
    .byte   $85,$11,$A0,$0A,$84,$EE,$A2,$00,$A9,$1B,$85,$D9,$A9,$96,$85,$DA
    .byte   $85,$02,$85,$2A,$D0,$09,$EA,$EA,$EA,$4C,$3F,$95,$EA,$90,$0D,$85
    .byte   $02,$A9,$00,$C0,$0A,$90,$F5,$EC,$9C,$F0,$D0,$EA,$B1,$81,$88,$10
    .byte   $07,$A0,$0A,$85,$1B,$6C,$D9,$00,$8D,$1B,$01,$6C,$D9,$00,$A9,$00
    .byte   $85,$1C,$85,$20,$A9,$24,$85,$07,$A9,$06,$85,$EE,$A9,$90,$85,$21
    .byte   $A9,$62,$85,$D9,$A9,$95,$85,$DA,$4C,$34,$96,$A9,$7E,$85,$D9,$A9
    .byte   $95,$85,$DA,$85,$11,$E8,$A9,$00,$85,$0C,$85,$05,$85,$25,$85,$26
    .byte   $85,$02,$85,$2A,$4C,$2A,$95,$A9,$00,$85,$D9,$A9,$96,$85,$DA,$4C
    .byte   $34,$96,$A9,$00,$85,$1C,$85,$20,$A5,$D5,$F0,$02,$A9,$80,$85,$21
    .byte   $A9,$A6,$85,$D9,$A9,$95,$85,$DA,$A9,$7F,$85,$07,$4C,$34,$96,$A9
    .byte   $CA,$85,$D9,$A9,$95,$85,$DA,$A9,$0A,$85,$EE,$E8,$A5,$D6,$85,$11
    .byte   $85,$05,$A5,$D5,$F0,$06,$A9,$D8,$85,$07,$A9,$00,$85,$02,$85,$2A
    .byte   $4C,$2A,$95,$A9,$D5,$85,$D9,$A9,$95,$85,$DA,$4C,$34,$96,$84,$EF
    .byte   $A4,$EE,$B1,$EC,$88,$84,$EE,$A4,$EF,$85,$1C,$E0,$22,$F0,$52,$4C
    .byte   $34,$96,$FF,$00,$01
L95EC:  .byte   $01,$00,$0D,$0D,$00,$01,$00,$04,$00,$00,$00,$00,$0D,$0D,$00,$00
    .byte   $0D,$0D,$0D,$0D,$84,$EF,$A4,$EE,$B1,$D7,$88,$84,$EE,$A4,$EF,$85
    .byte   $1C,$E0,$14,$D0,$23,$A9,$89,$85,$D9,$A9,$95,$85,$DA,$D0,$19,$84
    .byte   $EF,$A4,$EE,$B1,$83,$88,$84,$EE,$A4,$EF,$85,$1C,$E0,$0A,$D0,$08
    .byte   $A9,$45,$85,$D9,$A9,$95,$85,$DA,$E8,$4C,$26,$95,$85,$02,$A9,$00
    .byte   $85,$1B,$85,$1C,$85,$1B,$A0,$1E,$85,$02,$88,$D0,$FB,$85,$02,$A9
    .byte   $A0,$85,$20,$A9,$B0,$8D,$21,$01,$A2,$04,$CA,$D0,$FD,$EA,$85,$10
    .byte   $85,$11,$85,$02,$85,$2A,$A9,$03,$85,$04,$85,$05,$85,$25,$85,$26
    .byte   $A0,$18,$8C,$EE,$01,$A2,$06,$CA,$D0,$FD,$84,$EE,$4C,$00,$97,$00
    .byte   $00,$77,$51,$73,$51,$77,$00,$00,$00,$98,$98,$98,$18,$18,$18,$18
    .byte   $18,$18,$98,$98,$18,$18,$18,$18,$43,$41,$77,$55,$75,$00,$00,$00
    .byte   $00,$00,$04,$04,$0C,$0C,$FC,$F8,$18,$18,$10,$B0,$B0,$E0,$E3,$E3
    .byte   $43
L96AD:  .byte   $01,$01,$8C,$8C,$8C,$8D,$8D,$8D,$06,$06,$8B,$8B,$8B,$8F,$8F,$8F
    .byte   $03,$03,$8C,$8C,$8C,$8D,$8D,$8D,$0A,$0A,$0F,$0F,$0F,$8E,$8E,$8E
L96CD:  .byte   $05,$04,$03,$02,$10,$08,$06,$04,$04,$06,$08,$10,$10,$20,$20,$30
    .byte   $30,$40,$40,$50,$50,$60,$60,$70,$70,$80,$00,$00,$17,$11,$17,$15
    .byte   $17,$00,$00,$00,$61,$61,$63,$63,$67,$7E,$7E,$7F,$67,$63,$61,$63
    .byte   $77,$7E,$3C,$A4,$EE,$B9,$5B,$9A,$8D,$1B,$01,$B9,$94,$96,$85,$1C
    .byte   $B9,$DC,$9A,$85,$1B,$B9,$E7,$96,$85,$EC,$98,$0A,$65,$F2,$85,$06
    .byte   $85,$07,$B9,$7B,$96,$BE,$63,$98,$A4,$EC,$86,$1C,$84,$1B,$85,$1C
    .byte   $85,$1B,$C6,$EE,$10,$CD,$A2,$00,$86,$04,$86,$05,$86,$1B,$86,$1C
    .byte   $86,$1B,$86,$25,$86,$26,$85,$02,$24,$3C,$10,$0D,$4E,$82,$02,$B0
    .byte   $0B,$A5,$80,$F0,$02,$A9,$01,$85,$80,$4C,$DC,$97,$E6,$F2,$AD,$99
    .byte   $F0,$F0,$08,$38,$E9,$01,$8D,$19,$F0,$10,$4D,$AD,$82,$02,$29,$02
    .byte   $D0,$46,$85,$02,$AC,$91,$F0,$D0,$30,$8C,$10,$F0,$8C,$1C,$F0,$C8
    .byte   $8C,$11,$F0,$8C,$1A,$F0,$A9,$78,$8D,$1B,$F0,$AD,$8F,$F0,$29,$FE
    .byte   $8D,$0F,$F0,$A9,$82,$8D,$15,$F0,$85,$02,$A9,$10,$8D,$19,$F0,$A5
    .byte   $80,$F0,$02,$A9,$01,$85,$80,$10,$4B,$A5,$80,$85,$02,$49,$01,$85
    .byte   $80,$A9,$10,$8D,$19,$F0,$D0,$3C,$A5,$F2,$D0,$34,$E6,$F0,$A5,$F0
    .byte   $C9,$04,$90,$2C,$AC,$91,$F0,$D0,$27,$AD,$8F,$F0,$09,$01,$85,$02
    .byte   $8D,$0F,$F0,$A5,$80,$F0,$02,$A9,$01,$85,$80,$A9,$82,$D0,$06,$85
    .byte   $02,$85,$02,$A9,$03,$8D,$15,$F0,$A9,$FF,$8D,$1A,$F0,$4C,$E4,$9F
    .byte   $85,$02,$85,$02,$A9,$2C,$8D,$96,$02,$AD,$84,$02,$D0,$FB,$A2,$02
    .byte   $86,$02,$86,$00,$86,$01,$86,$02,$86,$02,$86,$02,$86,$02,$A2,$00
    .byte   $86,$00,$A2,$2C,$8E,$96,$02,$4C,$06,$92
L9817:  sta $D4
    lda $F095
    and #$83
    bne L9861
    lda $D4
    sed
    clc
    adc $F0FD
    sta $F07D
    tya
    adc $F0FE
    sta $F07E
    bcc L9861
    lda #$00
    adc $F0FF
    sta $F07F
    cmp #$21
    bcs L9861
    cmp #$02
    beq L984B
    and #$0F
    beq L984B
    cmp #$05
    bne L9861
L984B:  cld
    lda $F080
    and #$07
    cmp #$07
    beq L9861
    ldy $F080
    iny
    sty $F000
    ldy #$0F
    jmp L99F3
L9861:  cld
    rts

L9863:  .byte   $80,$80,$AB,$AA,$BA,$22,$27,$22,$00,$00,$02,$02,$06,$06,$FE,$FC
    .byte   $8C,$8C,$88,$D8,$D8,$70,$70,$70,$20,$07,$0F,$1F,$1F,$3F,$3F,$7E
    .byte   $7C,$78,$78,$78,$78,$78,$78,$78,$78,$7C,$7E,$3F,$3F,$1F,$1F,$0F
    .byte   $07,$00,$00,$00,$00,$3F,$7F,$FF,$FF,$FF,$F8,$F0,$E0,$C0,$C3,$C3
    .byte   $C3,$C3,$C0,$C0,$C0,$E0,$F0,$F8,$FF,$FF,$FF,$7F,$3F,$F0,$F8,$FC
    .byte   $FE,$FF,$1F,$0F,$0F,$0F,$7F,$7F,$7F,$7F,$00,$00,$00,$00,$0F,$1F
    .byte   $FF,$FE,$FC,$F8,$F0,$00,$00,$00,$00,$80,$C0,$E0,$F0,$F8,$F8,$78
    .byte   $78,$78,$F8,$F8,$F8,$F8,$00,$00,$00,$00,$78,$F8,$F8,$F0,$E0,$C0
    .byte   $80,$50,$01,$50,$50,$28,$18,$50,$69,$78,$83,$8E,$31,$27,$57,$62
    .byte   $6D
L98F4:  .byte   $00,$00,$00,$00,$00,$01,$05,$15,$6D,$61,$6E,$64,$00,$00,$00,$00
    .byte   $00,$00,$00,$00,$00,$00,$00,$06,$89,$50,$20,$00,$00,$00,$00,$E7
    .byte   $3C,$7E,$FF,$DB,$DB,$99,$FF,$7E,$3C,$7C,$F7,$FB,$7E,$76,$FA,$1C
    .byte   $1C,$FC,$68,$10,$0A,$4A,$86,$94,$94,$94,$D4,$F4,$76,$08,$49,$81
    .byte   $97,$94,$94,$D5,$F5,$77,$0C,$00,$36,$24,$24,$3C,$7E,$ED,$ED,$C9
    .byte   $7E,$3C,$7E,$FF,$FF,$FF,$7F,$FB,$FD,$0D,$FC,$6C,$38,$6C,$6C,$7C
    .byte   $54,$BA,$C6,$38,$30,$78,$74,$42,$00,$3C,$E0,$C0,$FC,$70,$30,$26
    .byte   $78,$74,$42,$00,$3C,$E0,$C0,$FC,$70,$6C,$48,$78,$74,$46,$00,$3C
    .byte   $E0,$C0,$FC,$70,$1C,$0C,$1E,$2E,$42,$00,$3C,$07,$03,$3F,$0E,$0C
    .byte   $64,$1E,$2E,$42,$00,$3C,$07,$03,$3F,$0E,$36,$12,$1E,$2E,$62,$00
    .byte   $3C,$07,$03,$3F,$0E,$32,$32,$32,$32,$32,$32,$32,$32,$32,$32,$32
    .byte   $32,$32,$34,$34,$34,$34,$34,$34,$34,$34,$34,$34,$34,$34,$34,$26
    .byte   $26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$2A,$2A
    .byte   $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
L99CC:  .byte   $2A,$20,$41,$21,$E0,$21,$20,$21,$00,$40,$00,$40,$61,$61,$40,$C0
    .byte   $61,$C1,$61
L99DF:  .byte   $81,$9E,$9E,$9E,$99,$94,$9E,$9E,$9E,$9E,$9E,$94,$9E,$9B,$9E,$9E
    .byte   $9D,$9D,$94,$9D
L99F3:  cpy $D3
    bcc L99F9
    sty $D3
L99F9:  rts

L99FA:  .byte   $CD,$D3,$05,$D1,$E1,$C5,$2A,$0F,$0F,$1F,$1F,$3E,$3E,$3C,$3C,$3C
    .byte   $3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$00
    .byte   $00,$00,$00,$07,$07,$07,$07,$87,$87,$C7,$C7,$C7,$C7,$C7,$C7,$C7
    .byte   $C7,$C7,$C7,$C7,$C7,$87,$87,$07,$07,$07
L9A34:  .byte   $07,$A0,$09,$09,$00,$93,$9C,$8E,$DC,$F4,$B0,$57,$05,$73,$00,$48
    .byte   $17,$2D,$B8
L9A47:  .byte   $7C,$00,$51,$51,$00,$A2,$00,$C4,$00,$00,$00,$00,$97,$92,$00,$00
    .byte   $00,$68,$A9,$B9,$00,$00,$77,$45,$77,$00,$00,$00,$00,$00,$04,$04
    .byte   $06,$06,$07,$03,$03,$03,$01,$01,$01,$00,$00,$00,$00,$E0,$F0,$F8
    .byte   $F8,$FC,$FC,$7E,$3E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$3E,$7E,$FC
    .byte   $FC,$F8,$F8,$F0,$E0,$00,$00,$00,$00,$FC,$FE,$FF,$FF,$FF,$1F,$0F
    .byte   $07,$03,$03,$03,$03,$03,$03,$03,$03,$07,$0F,$1F,$FF,$FF,$FF,$FE
    .byte   $FC,$F0,$F0,$F8,$F8,$7C,$7C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C
    .byte   $3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$3C,$00,$00,$00,$00,$E0,$E0,$E0
    .byte   $E0,$E1,$E1,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E1
    .byte   $E1,$E0,$E0,$E0,$E0,$01,$00,$4B,$4A,$6B,$00,$08,$00,$00,$00,$62
    .byte   $62,$63,$63,$63,$61,$61,$61,$60,$60,$60,$60,$FC,$FC,$FC,$00,$00
    .byte   $03,$03,$05,$05,$05,$00,$DB,$0D,$C3,$38,$6C,$C6,$C6,$C6,$6C,$38
    .byte   $00,$7E,$18,$18,$18,$18,$38,$18,$00,$FE,$C0,$E0,$3C,$06,$C6,$7C
    .byte   $00,$FC,$06,$06,$7C,$06,$06,$FC,$00,$0C,$0C,$0C,$FE,$CC,$CC,$CC
    .byte   $00,$FC,$06,$06,$FC,$C0,$C0,$FC,$00,$7C,$C6,$C6,$FC,$C0,$C0,$7C
    .byte   $00,$30,$30,$18,$18,$0C,$06,$FE,$00,$7C,$C6,$C6,$7C,$C6,$C6,$7C
    .byte   $00,$7C,$06,$06,$7E,$C6,$C6,$7C,$00,$00,$00,$00,$00,$00,$00,$00
    .byte   $00,$38,$6C,$6C,$7C,$54,$BA,$C6
L9B5F:  .byte   $00,$04,$04,$04,$00,$01,$0D,$07,$04,$04,$04,$00,$04,$04,$04,$04
    .byte   $0D,$04,$0D,$04,$17,$00,$17,$00,$1C,$00,$17,$00,$14,$00,$12,$00
    .byte   $11,$00,$0F,$00,$0D,$00,$0D,$00,$0D,$00,$0D,$00,$00,$00,$00,$00
    .byte   $00,$00,$00,$0B,$00,$0F,$00,$00,$00,$0F,$00,$0B,$00,$0F,$00,$00
    .byte   $00,$0F,$00,$0B,$00,$0F,$00,$00,$00,$0F,$00,$00,$00,$0F,$00,$0F
    .byte   $00,$0F,$A5,$F6,$A8,$29,$60,$C9,$60,$D0,$3C,$98,$29,$1C,$C9,$1C
    .byte   $F0,$35,$4A,$4A,$AA,$BD,$96,$F0,$10,$2D,$BD,$F1,$F0,$CD,$FA,$F0
    .byte   $D0,$25,$BD,$81,$F0,$CD,$8A,$F0,$D0,$1D,$A9,$40,$9D,$16,$F0,$A9
    .byte   $00,$9D,$71,$F0,$A6,$80,$E0,$13,$90,$02,$A2,$12,$BC,$D4,$96,$20
    .byte   $17,$98,$A0,$0E,$20,$F3,$99,$4C,$F6,$9C
L9BF9:  ldx #$06
L9BFB:  lda $F9,X
    bpl L9C07
    lda $F096,X
    tay
    and #$08
    bne L9C0A
L9C07:  jmp L9CF0
L9C0A:  tya
    and #$C0
    lsr
    lsr
    lsr
    sta $EC
    tya
    and #$07
    cmp #$07
    bne L9C8A
    ldy #$00
    lda $F0F1,X
    adc #$04
L9C20:  sec
    sbc #$0C
    bmi L9C28
    iny
    bpl L9C20
L9C28:  lda #$40
    and $F096,X
    beq L9C3B
    lda $F1
    and #$C0
    cmp #$C0
    beq L9C3B
    iny
    iny
    iny
    iny
L9C3B:  lda L96CD,Y
    tay
    lda #$00
    jsr L9817
    ldy #$0A
    jsr L99F3
    lda $F6
    and #$1C
    cmp #$1C
    bne L9C5F
    txa
    asl
    asl
    ora #$E3
    and $F6
    sta $F6
    lda #$00
    sta $F016,X
L9C5F:  lda #$00
    sta $F9,X
    sta $F071,X
    dec $F4
    lda $F4
    and #$07
    cmp #$01
    bne L9C7F
    lda $80
    beq L9C7A
    lda $F3
    ora #$02
    sta $F3
L9C7A:  ldy #$0D
    jsr L99F3
L9C7F:  lda #$3F
    and $F3
    ora #$20
    sta $F3
    jmp L9CF0
L9C8A:  cpx $DD
    bne L9CAC
    lda $F3
    bpl L9CAC
    and #$60
    cmp #$40
    beq L9CAC
    bcs L9CA0
    lda $F0
    and #$0F
    bne L9CF0
L9CA0:  lda $F3
    and #$9F
    sta $F3
    tya
    clc
    adc #$01
    bne L9CBB
L9CAC:  tya
    and #$07
    beq L9CCC
    lda $F0
    and #$1F
    bne L9CF0
    tya
    sec
    sbc #$01
L9CBB:  sta $F016,X
    and #$07
    clc
    adc $EC
    tay
    lda L96AD,Y
    sta $F00B,X
    bne L9CF0
L9CCC:  lda $F5
    and #$03
    sta $D5
    lda $F9,X
    and #$30
    lsr
    lsr
    lsr
    lsr
    cmp $D5
    bne L9CF0
    tya
    and #$F0
    sta $F016,X
    lda $F9,X
    and #$BF
    sta $F9,X
    lda #$7F
    and $F3
    sta $F3
L9CF0:  dex
    bmi L9CF6
    jmp L9BFB
L9CF6:  jsr L9F00
    jmp L9FF0
L9CFC:  .byte   $20,$53,$63,$72,$00,$00,$13,$00,$13,$00,$13,$00,$00,$00,$13,$00
    .byte   $13,$00,$13,$00,$00,$00,$13,$00,$13,$00,$13,$0F,$00,$12,$00,$11
    .byte   $00,$12,$00,$0E,$00,$12,$00,$11,$00,$12,$00,$0D,$00,$12,$00,$11
    .byte   $00,$12,$11,$10,$0F,$00,$12,$11,$00,$14,$12,$00,$17,$14,$00,$18
    .byte   $17,$17,$00,$0B,$0B
L9D41:  .byte   $17,$03,$02,$02,$00,$03,$03,$03,$00,$03,$04,$07,$04,$04,$07,$05
    .byte   $03,$04,$00
L9D54:  .byte   $04,$00,$02,$02,$00,$03,$00,$03,$00,$00,$00,$00,$07,$03,$00,$00
    .byte   $03,$04,$00,$04,$00,$00,$00,$14,$00,$00,$13,$00,$00,$12,$00,$00
    .byte   $10,$00,$00,$0F,$00,$00,$00,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$0F
    .byte   $0F,$0F,$12,$12,$12,$12,$0F,$0F,$12,$12,$12,$12,$0F,$0F,$0D,$0D
    .byte   $12,$00,$12,$00,$12,$12,$12,$12,$14,$14,$17,$17,$17,$17,$16,$16
    .byte   $16,$16,$1F,$1F,$1F,$1F,$16,$16,$1F,$1F,$1F,$1F,$16,$16,$16,$16
    .byte   $14,$00,$14,$00,$14,$14,$14,$12,$12,$10,$10,$0F,$0F,$14,$14,$0F
    .byte   $0F,$14,$14,$0F,$0F,$14,$14,$0F,$0F,$14,$14,$0F,$0F,$14,$14,$0F
    .byte   $0F,$14,$14,$0F,$0F,$14,$14,$0F,$0F,$14,$14,$11,$11,$14,$00,$14
    .byte   $00,$14,$00,$11,$11,$14,$14,$11,$11,$14,$14,$10,$10,$14,$14,$10
    .byte   $10,$14,$14,$10
L9DF8:  .byte   $00,$80,$A0,$A8,$AA,$AA,$AA,$AA,$12,$11,$10,$0F,$0D,$0F,$12,$15
    .byte   $19,$0F,$00,$0F,$00,$0F,$0F,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F
    .byte   $00,$0F,$00,$0F,$00,$0F,$0F,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$12
    .byte   $12,$11,$11,$11,$00,$11,$11,$11,$00,$11,$11,$12,$12,$11,$11,$0F
    .byte   $0F,$11,$11,$11,$00,$11,$11,$11,$00,$11,$11,$12,$12,$11,$11,$10
    .byte   $17,$14,$12,$17,$1F,$00,$0D,$00,$0F,$0F,$0F,$0F,$00,$0F,$0F,$0F
    .byte   $00,$10,$10,$10,$00,$10,$10,$10,$00,$11,$11,$11,$00,$11,$11,$11
    .byte   $00,$12,$12,$12,$00,$12,$12,$12,$00,$13,$13,$13,$00,$13,$13,$13
    .byte   $00,$13,$13,$13,$00,$13,$13,$13,$00,$14,$14,$14,$00,$14,$14,$14
    .byte   $00,$12,$12,$12,$00,$10,$10,$10,$0F,$0F,$0E,$0E,$0D,$0D,$0E,$0E
    .byte   $11,$14,$18,$0E,$14,$12,$14,$13,$0F,$0E,$0F,$0E,$0F,$0E,$0F,$0E
    .byte   $0F,$0E,$0F,$0E,$1F,$1E,$1F,$1E,$1F,$1E,$1F,$1E,$1F,$1E,$1F,$1E
    .byte   $0F,$0E,$0F,$10,$11,$10,$0E,$0D,$0E,$0F,$0E,$0F
L9EC4:  .byte   $0A,$00,$0A,$00,$0A,$00,$0A,$00,$0A,$00,$0A,$00,$0A,$00,$0A,$00
    .byte   $04,$04,$04,$04,$04,$04,$04,$04,$1A,$1A,$19,$19,$18,$18,$17,$17
    .byte   $16,$16,$15,$15,$14,$14,$13,$13,$12,$12,$17,$18,$19,$1A,$1B,$1C
    .byte   $0B,$08,$06,$0B,$08,$06,$0B,$08,$06,$31,$04,$ED
L9F00:  lda $F095
    bmi L9F2B
    lda $F0FC
    and #$1F
    cmp $D3
    bcs L9F19
    lda $F5
    and #$03
    sta $F5
    lda $D3
    sta $F07C
L9F19:  tax
    beq L9F33
    lda $F0FC
    tay
    and #$E0
    beq L9F2C
    tya
    sec
    sbc #$20
    sta $F07C
L9F2B:  rts

L9F2C:  lda $F5
    lsr
    lsr
    cmp L94E7,X
L9F33:  beq L9FA5
    cpx #$02
    beq L9F3D
    cpx #$03
    bne L9F41
L9F3D:  ldy $F6
    bmi L9FA5
L9F41:  tay
    lda L99DF,X
    sta $ED
    lda L9A34,X
    sta $EC
    lda ($EC),Y
    sta AUDF0
    beq L9F61
    lda L9D41,X
    bne L9F61
    lda L9EC4,Y
    cpx #$08
    beq L9F61
    lda L94C8,Y
L9F61:  sta AUDV0
    lda L9B5F,X
    bne L9F6B
    lda L949A,Y
L9F6B:  sta AUDC0
    lda L99CC,X
    and #$01
    bne L9F78
    sta AUDV1
    beq L9F92
L9F78:  lda L9A47,X
    sta $EC
    lda ($EC),Y
    sta AUDF1
    beq L9F8B
    lda L9D54,X
    bne L9F8B
    lda L94D8,Y
L9F8B:  sta AUDV1
    lda L95EC,X
    sta AUDC1
L9F92:  lda $F5
    clc
    adc #$04
    sta $F5
    lda L99CC,X
    and #$E0
    ora $F0FC
    sta $F07C
L9FA4:  rts

L9FA5:  lda #$00
    sta AUDV0
    sta AUDV1
    sta $F07C
    lda $F095
    and #$0B
    bne L9FA4
    cpx #$05
    bcs L9FD4
    lda $F6
    bmi L9FCC
    ldy #$02
    tya
    bit $F3
    beq L9FC6
    ldy #$03
L9FC6:  jsr L99F3
    jmp L9F00
L9FCC:  cpx #$04
    beq L9FD8
    cpx #$01
    beq L9FD8
L9FD4:  ldy #$04
    bpl L9FC6
L9FD8:  ldy #$01
    bpl L9FC6
    dex
    and ($4C,X)
    brk
    .byte   $92 ;.jam
    jmp L9CF6
L9FE4:  lda $FFF9
    jmp L9BF9
L9FEA:  .byte   $56,$EB,$ED,$4C,$B1,$9B
L9FF0:  lda $FFF7
    jmp L9103
L9FF6:  .byte   $B0
L9FF7:  .byte   $72,$29
L9FF9:  .byte   $00,$00,$D3,$00,$91,$FA,$D3
