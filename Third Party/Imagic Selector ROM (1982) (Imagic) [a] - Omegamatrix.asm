; Disassembly of Imagic Kiosk Menu
; By Omegamatrix


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
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
TIMINT  =  $0285
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x3
ram_81             ds 2  ; x1
ram_83             ds 1  ; x6
ram_84             ds 1  ; x4
ram_85             ds 1  ; x8
ram_86             ds 1  ; x1
ram_87             ds 1  ; x7
ram_88             ds 1  ; x1
ram_89             ds 1  ; x7
ram_8A             ds 1  ; x1
ram_8B             ds 1  ; x7
ram_8C             ds 1  ; x1
ram_8D             ds 1  ; x7
ram_8E             ds 1  ; x1
ram_8F             ds 1  ; x7
ram_90             ds 1  ; x1
ram_91             ds 16 ; x1
ram_A1             ds 1  ; x6
ram_A2             ds 1  ; x6
ram_A3             ds 11 ; x4
ram_AE             ds 1  ; x5
ram_AF             ds 1  ; x5
ram_B0             ds 1  ; x6
ram_B1             ds 1  ; x3
ram_B2             ds 1  ; x3
ram_B3             ds 1  ; x3
ram_B4             ds 1  ; x3
ram_B5             ds 1  ; x3
ram_B6             ds 74 ; x3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $1000

    .byte $78,$D8,$A2,$FF,$9A,$E8,$8A,$95,$00,$E8,$D0,$FB,$86,$D3,$A9,$01
    .byte $85,$8E,$85,$C5,$85,$C6,$85,$EF,$20,$AF,$1C,$A9,$02,$85,$01,$85
    .byte $02,$85,$00,$85,$02,$85,$02,$85,$02,$A9,$00,$85,$00,$A9,$2C,$8D
    .byte $96,$02,$AD,$82,$02,$66,$8E,$B0,$04,$4A,$B0,$2F,$2A,$4A,$26,$8E
    .byte $4A,$24,$8C,$90,$04,$26,$8C,$D0,$5A,$10,$15,$A5,$FA,$29,$1F,$85
    .byte $8C,$E6,$8D,$A5,$8D,$C9,$01,$D0,$0F,$A9,$00,$85,$8D,$4C,$68,$10
    .byte $A5,$8C,$45,$FA,$29,$1F,$F0,$E3,$4C,$75,$10,$A9,$01,$85,$8E,$85
    .byte $D3,$85,$F9,$D0,$06,$A9,$00,$85,$F9,$85,$D3,$A9,$0A,$85,$F4,$85
    .byte $F0,$A9,$01,$85,$F7,$20,$AF,$1C,$A9,$00,$85,$EF,$85,$EE,$85,$EC
    .byte $85,$F6,$85,$F5,$85,$A1,$85,$A2,$85,$A3,$85,$DB,$A2,$06,$95,$D4
    .byte $CA,$10,$FB,$A5,$D3,$30,$04,$D0,$2C,$F0,$1A,$C6,$F2,$D0,$16,$C6
    .byte $F3,$D0,$12,$20,$AF,$1C,$A9,$00,$85,$EE,$85,$D3,$85,$F5,$A2,$06
    .byte $95,$D4,$CA,$10,$FB,$A2,$00,$86,$EC,$86,$BE,$86,$C4,$A5,$E0,$D0
    .byte $04,$A5,$0C,$10,$96,$A2,$0A,$A9,$1F,$95,$81,$A9,$64,$95,$80,$CA
    .byte $CA,$10,$F4,$A5,$EF,$F0,$0F,$A2,$0A,$A9,$6E,$95,$80,$18,$69,$0A
    .byte $CA,$CA,$10,$F7,$30,$49,$A5,$F9,$D0,$0C,$A5,$8D,$18,$69,$01,$20
    .byte $E8,$1E,$85,$80,$D0,$39,$A2,$00,$86,$9E,$A2,$02,$A0,$08,$B5,$A1
    .byte $4A,$4A,$4A,$4A,$20,$E8,$1E,$D0,$04,$A5,$9E,$F0,$07,$E6,$9E,$A5
    .byte $8F,$99,$82,$00,$B5,$A1,$29,$0F,$20,$E8,$1E,$D0,$04,$A5,$9E,$F0
    .byte $07,$E6,$9E,$A5,$8F,$99,$80,$00,$CA,$88,$88,$88,$88,$10,$CF,$A2
    .byte $06,$86,$F1,$B5,$D4,$F0,$36,$C9,$05,$F0,$0A,$A5,$FA,$29,$07,$D0
    .byte $10,$F6,$D4,$10,$0C,$C6,$F1,$10,$08,$A5,$F8,$D0,$04,$A9,$FF,$85
    .byte $D3,$B4,$D4,$88,$E0,$06,$D0,$0C,$B9,$52,$1E,$85,$9B,$B9,$57,$1E
    .byte $85,$9C,$D0,$22,$B9,$4D,$1E,$85,$91,$95,$95,$D0,$19,$BC,$38,$1E
    .byte $A5,$FA,$3D,$46,$1E,$D0,$03,$BC,$3F,$1E,$84,$91,$94,$95,$E0,$06
    .byte $D0,$04,$A9,$08,$85,$9C,$CA,$10,$AA,$A9,$1D,$85,$92,$85,$94,$A2
    .byte $02,$A0,$98,$A5,$D3,$30,$0A,$A0,$80,$B5,$DD,$F0,$04,$D6,$DD,$A0
    .byte $88,$94,$93,$CA,$CA,$10,$EA,$A9,$05,$85,$0A,$A9,$30,$85,$0D,$A9
    .byte $00,$85,$08,$85,$0E,$85,$0F,$A9,$03,$85,$A9,$A6,$A9,$B5,$A4,$38
    .byte $E9,$08,$C9,$F7,$90,$02,$A9,$00,$A2,$00,$20,$82,$1E,$A5,$A9,$0A
    .byte $AA,$A5,$8F,$95,$AA,$A5,$90,$95,$AB,$A6,$A9,$B5,$A4,$A2,$01,$20
    .byte $82,$1E,$A5,$A9,$0A,$AA,$A5,$8F,$95,$B2,$A5,$90,$95,$B3,$C6,$A9
    .byte $10,$C9,$A5,$BE,$F0,$04,$A5,$A4,$85,$BE,$A2,$04,$B5,$BA,$20,$C2
    .byte $1F,$CA,$E0,$02,$B0,$F6,$85,$02,$85,$2A,$85,$02,$85,$2B,$A5,$FA
    .byte $29,$07,$D0,$0C,$A5,$C5,$29,$06,$D0,$02,$A9,$02,$49,$A0,$85,$A0
    .byte $A0,$00,$A5,$E0,$F0,$08,$29,$01,$F0,$02,$A0,$0F,$C6,$E0,$84,$09
    .byte $E6,$FA,$D0,$08,$E6,$FB,$D0,$04,$A9,$F3,$85,$FC,$2C,$85,$02,$10
    .byte $FB,$85,$02,$A9,$00,$85,$2C,$85,$01,$85,$04,$85,$05,$A5,$D3,$30
    .byte $07,$A5,$DB,$30,$06,$4C,$02,$14,$4C,$6E,$13,$A5,$FA,$29,$07,$D0
    .byte $20,$E6,$DB,$A5,$DB,$C9,$85,$90,$18,$A2,$03,$A9,$07,$95,$C7,$A9
    .byte $00,$95,$A4,$CA,$10,$F5,$85,$BE,$85,$DB,$85,$BC,$85,$BD,$4C,$04
    .byte $14,$A5,$DB,$29,$07,$AA,$85,$02,$BD,$80,$1C,$85,$AA,$BD,$85,$1C
    .byte $85,$AC,$A9,$1C,$85,$AB,$85,$AD,$BD,$A0,$1C,$85,$AE,$BD,$A5,$1C
    .byte $85,$B0,$BD,$AA,$1C,$85,$B2,$A4,$DC,$B9,$F8,$1F,$38,$FD,$99,$1C
    .byte $85,$B4,$A9,$00,$85,$0D,$A9,$08,$85,$0C,$85,$02,$A9,$3E,$E0,$04
    .byte $D0,$08,$A5,$FA,$29,$0E,$49,$0F,$09,$30,$85,$06,$85,$07,$85,$08
    .byte $85,$02,$A5,$C0,$18,$7D,$8A,$1C,$85,$BF,$18,$7D,$8F,$1C,$85,$BD
    .byte $38,$FD,$94,$1C,$85,$BE,$38,$FD,$9B,$1C,$85,$BC,$A2,$04,$A5,$C0
    .byte $20,$C2,$1F,$CA,$A5,$BF,$20,$C2,$1F,$CA,$A5,$BE,$20,$C2,$1F,$CA
    .byte $A5,$BD,$20,$C2,$1F,$CA,$A5,$BC,$20,$C2,$1F,$85,$02,$85,$2A,$85
    .byte $02,$A2,$C0,$85,$02,$8A,$38,$E5,$B4,$A8,$25,$AE,$D0,$22,$98,$25
    .byte $B0,$F0,$04,$98,$45,$B2,$A8,$B1,$AC,$85,$1D,$85,$1E,$0A,$85,$1F
    .byte $B1,$AA,$CA,$E0,$6B,$F0,$10,$85,$02,$85,$1B,$85,$1C,$4C,$25,$13
    .byte $CA,$E0,$6B,$D0,$CE,$85,$02,$85,$02,$A9,$00,$85,$1B,$85,$1C,$85
    .byte $1D,$85,$1E,$85,$1F,$A5,$E4,$85,$08,$85,$02,$4C,$74,$15,$A0,$AA
    .byte $A5,$FA,$29,$02,$F0,$02,$A0,$B2,$84,$AA,$85,$02,$A9,$1F,$85,$AB
    .byte $A9,$DE,$85,$06,$A9,$00,$85,$E6,$85,$E7,$85,$E8,$A5,$FA,$29,$0F
    .byte $D0,$10,$A5,$E3,$F0,$02,$C6,$E3,$A5,$E3,$A8,$B9,$BA,$1F,$85,$E4
    .byte $85,$E5,$85,$02,$A5,$E2,$D0,$22,$A5,$A1,$A5,$A1,$A5,$A1,$A5,$A1
    .byte $A5,$A1,$A5,$A1,$A5,$A1,$A9,$3F,$85,$E9,$85,$F3,$A9,$8F,$85,$E0
    .byte $85,$EB,$A9,$02,$85,$ED,$A9,$4B,$85,$E1,$C9,$80,$B0,$02,$E6,$E2
    .byte $A5,$E1,$C9,$D2,$B0,$02,$E6,$E1,$A2,$00,$85,$02,$86,$0D,$A5,$E2
    .byte $20,$C2,$1F,$85,$02,$85,$2A,$85,$02,$A2,$C0,$85,$02,$8A,$38,$E5
    .byte $E1,$A8,$29,$F8,$D0,$04,$B1,$AA,$85,$1B,$CA,$E0,$61,$D0,$EC,$4C
    .byte $57,$13,$85,$02,$85,$02,$A9,$1D,$85,$90,$85,$9F,$A9,$C0,$85,$C3
    .byte $A9,$03,$85,$A9,$A2,$1E,$9A,$A5,$A9,$0A,$AA,$B4,$AA,$B5,$AB,$C6
    .byte $C3,$A6,$C3,$85,$02,$E4,$BB,$08,$EC,$BA,$00,$08,$88,$10,$FD,$85
    .byte $20,$85,$10,$85,$02,$68,$68,$C6,$C3,$A6,$C3,$E4,$BB,$08,$E4,$BA
    .byte $08,$68,$68,$A5,$A9,$0A,$AA,$B4,$B2,$B5,$B3,$C6,$C3,$A6,$C3,$85
    .byte $02,$E4,$BB,$08,$EC,$BA,$00,$08,$88,$10,$FD,$85,$21,$85,$11,$85
    .byte $02,$85,$2A,$68,$68,$C6,$C3,$A6,$C3,$E4,$BB,$08,$E4,$BA,$08,$68
    .byte $68,$A2,$FF,$9A,$C6,$C3,$20,$B1,$1E,$A9,$98,$85,$8F,$85,$9E,$A5
    .byte $C7,$10,$0B,$29,$07,$C5,$A9,$D0,$10,$A5,$CF,$4C,$D9,$14,$29,$07
    .byte $C5,$A9,$D0,$05,$A5,$CF,$4C,$EC,$14,$A5,$C8,$10,$0B,$29,$07,$C5
    .byte $A9,$D0,$10,$A5,$D0,$4C,$D9,$14,$29,$07,$C5,$A9,$D0,$05,$A5,$D0
    .byte $4C,$EC,$14,$A5,$C9,$10,$0B,$29,$07,$C5,$A9,$D0,$10,$A5,$D1,$4C
    .byte $D9,$14,$29,$07,$C5,$A9,$D0,$05,$A5,$D1,$4C,$EC,$14,$A5,$CA,$10
    .byte $13,$29,$07,$C5,$A9,$D0,$1E,$A5,$D2,$85,$9E,$18,$69,$08,$85,$8F
    .byte $A0,$08,$D0,$11,$29,$07,$C5,$A9,$D0,$0B,$A5,$D2,$85,$8F,$18,$69
    .byte $08,$85,$9E,$A0,$00,$84,$0B,$84,$0C,$A2,$1E,$9A,$A6,$C3,$A0,$07
    .byte $AD,$1F,$1E,$85,$02,$85,$06,$85,$07,$B1,$8F,$85,$1B,$B1,$9E,$85
    .byte $1C,$E4,$BB,$08,$E4,$BA,$08,$68,$68,$B9,$17,$1E,$CA,$88,$10,$E3
    .byte $85,$02,$A9,$00,$85,$1B,$85,$1C,$E4,$BB,$08,$E4,$BA,$08,$68,$68
    .byte $86,$C3,$C6,$A9,$30,$03,$4C,$14,$14,$85,$02,$C6,$C3,$A6,$C3,$E4
    .byte $BB,$08,$E4,$BA,$08,$68,$68,$A9,$10,$85,$0A,$A0,$02,$A5,$D3,$F0
    .byte $04,$A5,$BE,$D0,$01,$A8,$A5,$FA,$29,$01,$D0,$01,$A8,$84,$1F,$A9
    .byte $00,$85,$0D,$A5,$E4,$25,$FC,$85,$08,$C6,$C3,$A2,$FF,$9A,$20,$B1
    .byte $1E,$20,$B1,$1E,$A2,$1E,$9A,$A9,$00,$85,$04,$85,$05,$85,$1D,$85
    .byte $1E,$85,$0B,$A9,$14,$85,$0A,$A0,$08,$84,$0C,$A6,$C3,$85,$02,$88
    .byte $10,$FD,$85,$10,$E4,$BB,$08,$E4,$BA,$08,$68,$68,$CA,$A0,$0D,$85
    .byte $02,$88,$10,$FD,$85,$11,$E4,$BB,$08,$E4,$BA,$08,$68,$68,$CA,$A9
    .byte $60,$85,$20,$A9,$10,$85,$21,$85,$02,$85,$2A,$E4,$BB,$08,$E4,$BA
    .byte $08,$68,$68,$CA,$A0,$07,$AD,$2F,$1E,$85,$06,$AD,$27,$1E,$85,$02
    .byte $85,$07,$B1,$91,$85,$1B,$B1,$93,$85,$1C,$E4,$BB,$08,$E4,$BA,$08
    .byte $68,$68,$B9,$27,$1E,$85,$06,$B9,$1F,$1E,$CA,$88,$10,$E0,$85,$02
    .byte $A9,$00,$85,$1B,$85,$1C,$E4,$BB,$08,$E4,$BA,$08,$68,$68,$A9,$00
    .byte $85,$0C,$A5,$E6,$85,$0F,$A0,$08,$A2,$FF,$9A,$85,$02,$85,$10,$88
    .byte $10,$FD,$85,$11,$A9,$00,$85,$1D,$85,$1E,$A9,$30,$85,$20,$A9,$50
    .byte $85,$21,$A5,$95,$85,$91,$A5,$96,$85,$93,$85,$02,$85,$2A,$A0,$07
    .byte $AE,$37,$1E,$AD,$27,$1E,$85,$02,$85,$06,$86,$07,$B1,$91,$85,$1B
    .byte $B1,$93,$85,$1C,$B9,$1F,$1E,$BE,$2F,$1E,$88,$10,$E9,$85,$02,$A5
    .byte $A0,$85,$09,$A9,$00,$85,$1B,$85,$1C,$A5,$E7,$85,$0D,$A5,$E8,$85
    .byte $0F,$A5,$A0,$49,$04,$A0,$06,$85,$02,$85,$09,$88,$10,$FD,$85,$10
    .byte $A5,$A0,$A0,$0C,$85,$02,$85,$09,$88,$10,$FD,$85,$11,$A9,$D0,$85
    .byte $20,$A9,$50,$85,$21,$A9,$A0,$85,$09,$A5,$97,$85,$91,$A5,$98,$85
    .byte $93,$85,$02,$85,$2A,$A5,$E5,$25,$FC,$85,$08,$A9,$BC,$85,$06,$A9
    .byte $7E,$85,$07,$A0,$07,$85,$02,$B1,$91,$85,$1B,$B1,$93,$85,$1C,$88
    .byte $10,$F3,$85,$02,$A9,$00,$85,$1B,$85,$1C,$A9,$F8,$85,$0F,$A9,$08
    .byte $85,$0C,$A0,$05,$85,$02,$88,$10,$FD,$85,$10,$85,$11,$A9,$B0,$85
    .byte $20,$A9,$C0,$85,$21,$A5,$99,$85,$91,$85,$02,$85,$2A,$A0,$07,$85
    .byte $02,$B1,$91,$85,$1B,$85,$1C,$B9,$00,$1E,$85,$06,$85,$07,$88,$10
    .byte $EE,$85,$02,$A9,$00,$85,$1B,$85,$1C,$A9,$70,$85,$0D,$A9,$07,$85
    .byte $0E,$A9,$FB,$85,$0F,$A0,$09,$85,$02,$88,$10,$FD,$85,$10,$85,$11
    .byte $A9,$D0,$85,$20,$A9,$E0,$85,$21,$A5,$9A,$85,$91,$85,$02,$85,$2A
    .byte $A0,$07,$85,$02,$C0,$03,$B0,$0C,$A9,$F0,$85,$0D,$A9,$0F,$85,$0E
    .byte $A9,$FF,$85,$0F,$B1,$91,$85,$1B,$85,$1C,$B9,$08,$1E,$85,$06,$85
    .byte $07,$88,$10,$DE,$85,$02,$A9,$00,$85,$1B,$85,$1C,$85,$0C,$A0,$04
    .byte $85,$02,$88,$10,$FD,$85,$10,$85,$11,$A9,$20,$85,$20,$A9,$30,$85
    .byte $21,$A5,$9B,$85,$91,$A5,$9C,$85,$93,$85,$02,$85,$2A,$A0,$07,$85
    .byte $02,$B1,$91,$85,$1B,$B1,$93,$85,$1C,$B9,$10,$1E,$85,$06,$85,$07
    .byte $88,$10,$EC,$85,$02,$85,$2B,$A9,$FF,$85,$0E,$A9,$00,$85,$1B,$85
    .byte $1C,$85,$1D,$85,$1E,$85,$1F,$A9,$00,$85,$09,$A0,$06,$85,$02,$88
    .byte $10,$FB,$A9,$00,$85,$0A,$A9,$3E,$25,$FC,$85,$07,$85,$06,$A9,$03
    .byte $85,$04,$85,$05,$A0,$06,$85,$02,$88,$10,$FD,$EA,$85,$10,$85,$11
    .byte $A9,$00,$85,$21,$A9,$F0,$85,$20,$A9,$01,$85,$25,$85,$26,$85,$02
    .byte $85,$2A,$A9,$C2,$25,$FC,$85,$08,$A9,$09,$85,$91,$A4,$91,$B1,$8A
    .byte $85,$1B,$85,$02,$B1,$88,$85,$1C,$B1,$86,$85,$1B,$B1,$84,$85,$93
    .byte $B1,$82,$AA,$B1,$80,$A8,$A5,$93,$85,$1C,$86,$1B,$84,$1C,$84,$1B

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³
    lda    #1                    ; 2
    sta    CTRLPF                ; 3

    jsr    L1B88                 ; 6

MainLoop:
    ldx    #2                    ; 2
    stx    VBLANK                ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3   start Vsync
    stx    WSYNC                 ; 3
    stx    WSYNC                 ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    stx    VSYNC                 ; 3   end Vsync
    lda    #0                    ; 2
    sta    VBLANK                ; 3

    lda    #$2C                  ; 2
    sta    TIM64T                ; 4

    inc    ram_80                ; 5
    bne    L1832                 ; 2³
    inc    ram_81                ; 5
L1832:
    lda    ram_A1                ; 3
    cmp    #$06                  ; 2
    beq    L1889                 ; 2³
    lda    ram_80                ; 3
    and    #$01                  ; 2
    bne    L1873                 ; 2³
    lda    ram_AF                ; 3
    cmp    #$FF                  ; 2
    beq    L184A                 ; 2³
    sec                          ; 2
    ror    ram_AF                ; 5
    jmp    L1873                 ; 3

L184A:
    lda    #$00                  ; 2
    sta    ram_AF                ; 3
    lda    ram_A1                ; 3
    asl                          ; 2
    tax                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_A2,X              ; 4
    lda    #$1E                  ; 2
    sta    ram_A3,X              ; 4
    inc    ram_A1                ; 5
    lda    ram_A1                ; 3
    cmp    #$06                  ; 2
    bne    L1869                 ; 2³
    lda    #$02                  ; 2
    sta    ram_B0                ; 3
    bne    L1889                 ; 3   always branch

L1869:
    asl                          ; 2
    tax                          ; 2
    lda    #$91                  ; 2
    sta    ram_A2,X              ; 4
    lda    #$00                  ; 2
    sta    ram_A3,X              ; 4
L1873:
    lda    ram_A1                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldx    #$00                  ; 2
    tay                          ; 2
L187C:
    lda    ImagicGfx,Y           ; 4
    and    ram_AF                ; 3
    sta    ram_91,X              ; 4
    iny                          ; 2
    inx                          ; 2
    cpx    #$10                  ; 2
    bne    L187C                 ; 2³
L1889:
    lda    ram_B0                ; 3
    beq    L18BA                 ; 2³
    lda    ram_B0                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L1BFD,Y               ; 4
    sta    ram_B1                ; 3
    inc    ram_B0                ; 5
    bne    L18A1                 ; 2³
    lda    #$01                  ; 2
    sta    ram_AE                ; 3
L18A1:
    ldy    #$00                  ; 2
    lda    ram_B0                ; 3
    and    #$04                  ; 2
    beq    L18AB                 ; 2³
    ldy    #$70                  ; 2
L18AB:
    tya                          ; 2
    ldy    #$00                  ; 2
L18AE:
    sta.wy ram_A2,Y              ; 5
    clc                          ; 2
    adc    #$10                  ; 2
    iny                          ; 2
    iny                          ; 2
    cpy    #$0C                  ; 2
    bne    L18AE                 ; 2³
L18BA:
    lda    ram_AE                ; 3
    beq    L1915                 ; 2³+1
    lda    ram_80                ; 3
    and    #$07                  ; 2
    bne    L1915                 ; 2³+1
    inc    ram_AE                ; 5
    lda    ram_AE                ; 3
    cmp    #$04                  ; 2
    bne    L18D2                 ; 2³
    lda    #$88                  ; 2
    sta    ram_B2                ; 3
    bne    L1915                 ; 3+1   always branch

L18D2:
    cmp    #$0C                  ; 2
    bne    L18DC                 ; 2³
    lda    #$44                  ; 2
    sta    ram_B3                ; 3
    bne    L1915                 ; 3+1   always branch

L18DC:
    cmp    #$14                  ; 2
    bne    L18E6                 ; 2³
    lda    #$A8                  ; 2
    sta    ram_B5                ; 3
    bne    L1915                 ; 3+1   always branch

L18E6:
    cmp    #$1C                  ; 2
    bne    L18F0                 ; 2³
    lda    #$C8                  ; 2
    sta    ram_B6                ; 3
    bne    L1915                 ; 3+1   always branch

L18F0:
    cmp    #$24                  ; 2
    bne    L18FA                 ; 2³
    lda    #$38                  ; 2
    sta    ram_B4                ; 3
    bne    L1915                 ; 3+1   always branch

L18FA:
    cmp    #$3E                  ; 2
    bne    L1915                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_A1                ; 3
    sta    ram_AE                ; 3
    sta    ram_AF                ; 3
    sta    ram_B0                ; 3
    sta    ram_B2                ; 3
    sta    ram_B3                ; 3
    sta    ram_B4                ; 3
    sta    ram_B6                ; 3
    sta    ram_B5                ; 3
    jsr    L1B88                 ; 6
L1915:
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldy    #$06                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
L191F:
    dey                          ; 2
    bpl    L191F                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
L192F:
    bit    TIMINT                ; 4
    bpl    L192F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$4C                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    lda    #$01                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    ldy    #$08                  ; 2
L1948:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    L1948                 ; 2³
    lda    #$42                  ; 2
    sta    COLUBK                ; 3
    ldy    #$03                  ; 2
L1953:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    L1953                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1BA3                 ; 6
    jsr    L1B53                 ; 6
    ldy    #$04                  ; 2
L1962:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    L1962                 ; 2³
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$36                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LoadFavoritePtrs      ; 6
    lda    #$3C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    L1B53                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1A                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$C2                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$82                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$62                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    lda    #$10                  ; 2
    sta    PF0                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    ram_B1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$0B                  ; 2
L19EB:
    lda    ram_A2,X              ; 4
    sta    ram_85,X              ; 4
    dex                          ; 2
    bpl    L19EB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$0F                  ; 2
    sta    ram_83                ; 3
L19F8:
    ldy    ram_83                ; 3
    lda    (ram_85),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_87),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_89),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8B),Y            ; 5
    sta    ram_84                ; 3
    lda    (ram_8D),Y            ; 5
    tax                          ; 2
    lda    (ram_8F),Y            ; 5
    tay                          ; 2
    lda    ram_84                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_83                ; 5
    bpl    L19F8                 ; 2³+1

    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #>Activision1         ; 2
    jsr    LoadHighPtr           ; 6
    lda    #<Activision1         ; 2
    sta    ram_85                ; 3
    lda    #<Activision2         ; 2
    sta    ram_87                ; 3
    lda    #<Activision3         ; 2
    sta    ram_89                ; 3
    lda    #<Activision4         ; 2
    sta    ram_8B                ; 3
    lda    #<Activision5         ; 2
    sta    ram_8D                ; 3
    lda    #<Activision6         ; 2
    sta    ram_8F                ; 3
    lda    ram_B2                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    lda    #<Atari1              ; 2
    sta    ram_85                ; 3
    lda    #<Atari2              ; 2
    sta    ram_87                ; 3
    lda    #<Atari3              ; 2
    sta    ram_89                ; 3
    lda    #<Atari4              ; 2
    sta    ram_8B                ; 3
    lda    #<Atari5              ; 2
    sta    ram_8D                ; 3
    lda    #<Atari6              ; 2
    sta    ram_8F                ; 3
    lda    ram_B3                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    jsr    L1BA3                 ; 6
    lda    #>Coleco1             ; 2
    jsr    LoadHighPtr           ; 6
    jsr    LoadColecoPtrs        ; 6
    lda    ram_B5                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    jsr    L1BE4                 ; 6
    lda    ram_B6                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    lda    ram_B4                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1BA3                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    ldy    #$09                  ; 2
L1AC3:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    L1AC3                 ; 2³
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    lda    #>PlayYour1           ; 2   also "Favorite", and "Video Game" high ptrs
    jsr    LoadHighPtr           ; 6
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    jsr    L1BE4                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L1B53                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$42                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    ldy    #$05                  ; 2
L1AF7:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    L1AF7                 ; 2³
    lda    #$08                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    lda    #$36                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1A                  ; 2
    sta    COLUPF                ; 3
    lda    #$3F                  ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$C2                  ; 2
    sta    COLUPF                ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
L1B4B:
    bit    TIMINT                ; 4
    bpl    L1B4B                 ; 2³
    jmp    MainLoop              ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1B53 SUBROUTINE ;x8
    lda    #7                    ; 2
    sta    ram_83                ; 3
L1B57:
    ldy    ram_83                ; 3
    lda    (ram_85),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_87),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_89),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8B),Y            ; 5
    sta    ram_84                ; 3
    lda    (ram_8D),Y            ; 5
    tax                          ; 2
    lda    (ram_8F),Y            ; 5
    tay                          ; 2
    lda    ram_84                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_83                ; 5
    bpl    L1B57                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1B88 SUBROUTINE ;x2
    lda    #<L1E60               ; 2
    ldy    #>L1E60               ; 2
    ldx    #10                   ; 2
L1B8E:
    sty    ram_A3,X              ; 4
    sta    ram_A2,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L1B8E                 ; 2³
    lda    #$91                  ; 2
    sta    ram_A2                ; 3
    lda    #$00                  ; 2
    sta    ram_A3                ; 3
    lda    #$2C                  ; 2
    sta    ram_B1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;share pointers for "Play Your" gfx

L1BA3 SUBROUTINE ;X3
    lda    #<Mnetwork1           ; 2
    sta    ram_85                ; 3
    lda    #<Mnetwork2           ; 2
    sta    ram_87                ; 3
    lda    #<Mnetwork3           ; 2
    sta    ram_89                ; 3
    lda    #<Mnetwork4           ; 2
    sta    ram_8B                ; 3
    lda    #<Mnetwork5           ; 2
    sta    ram_8D                ; 3
    lda    #<Mnetwork6           ; 2
    sta    ram_8F                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda    #$1F                  ; 2  never reached?

LoadHighPtr SUBROUTINE ;x3
    sta    ram_86                ; 3
    sta    ram_88                ; 3
    sta    ram_8A                ; 3
    sta    ram_8C                ; 3
    sta    ram_8E                ; 3
    sta    ram_90                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SUBROUTINE x2

;share pointers for "Favorite" gfx

LoadFavoritePtrs:
LoadColecoPtrs:
    lda    #<Coleco1             ; 2
    sta    ram_85                ; 3
    lda    #<Coleco2             ; 2
    sta    ram_87                ; 3
    lda    #<Coleco3             ; 2
    sta    ram_89                ; 3
    lda    #<Coleco4             ; 2
    sta    ram_8B                ; 3
    lda    #<Coleco5             ; 2
    sta    ram_8D                ; 3
    lda    #<Coleco6             ; 2
    sta    ram_8F                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;share pointers for "Video Game" gfx

L1BE4 SUBROUTINE ;x2
    lda    #<ParkerBros1         ; 2
    sta    ram_85                ; 3
    lda    #<ParkerBros2         ; 2
    sta    ram_87                ; 3
    lda    #<ParkerBros3         ; 2
    sta    ram_89                ; 3
    lda    #<ParkerBros4         ; 2
    sta    ram_8B                ; 3
    lda    #<ParkerBros5         ; 2
    sta    ram_8D                ; 3
    lda    #<ParkerBros6         ; 2
    sta    ram_8F                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1BFD:
    .byte $2C ; |  X XX  | $1BFD
    .byte $2A ; |  X X X | $1BFE
    .byte $28 ; |  X X   | $1BFF
    .byte $38 ; |  XXX   | $1C00
    .byte $48 ; | X  X   | $1C01
    .byte $58 ; | X XX   | $1C02
    .byte $68 ; | XX X   | $1C03
    .byte $78 ; | XXXX   | $1C04
    .byte $88 ; |X   X   | $1C05
    .byte $28 ; |  X X   | $1C06
    .byte $2A ; |  X X X | $1C07
    .byte $2C ; |  X XX  | $1C08
    .byte $2C ; |  X XX  | $1C09
    .byte $2F ; |  X XXXX| $1C0A
    .byte $2F ; |  X XXXX| $1C0B
    .byte $2C ; |  X XX  | $1C0C




    .byte $00 ; |        | $1C0D
    .byte $00 ; |        | $1C0E
    .byte $00 ; |        | $1C0F
    .byte $00 ; |        | $1C10
    .byte $00 ; |        | $1C11
    .byte $00 ; |        | $1C12
    .byte $00 ; |        | $1C13
    .byte $00 ; |        | $1C14
    .byte $00 ; |        | $1C15
    .byte $00 ; |        | $1C16
    .byte $00 ; |        | $1C17
    .byte $00 ; |        | $1C18
    .byte $00 ; |        | $1C19
    .byte $00 ; |        | $1C1A
    .byte $00 ; |        | $1C1B
    .byte $00 ; |        | $1C1C
    .byte $00 ; |        | $1C1D
    .byte $00 ; |        | $1C1E
    .byte $00 ; |        | $1C1F
    .byte $00 ; |        | $1C20
    .byte $00 ; |        | $1C21
    .byte $00 ; |        | $1C22
    .byte $00 ; |        | $1C23
    .byte $00 ; |        | $1C24
    .byte $00 ; |        | $1C25
    .byte $00 ; |        | $1C26
    .byte $00 ; |        | $1C27
    .byte $00 ; |        | $1C28
    .byte $00 ; |        | $1C29
    .byte $00 ; |        | $1C2A
    .byte $00 ; |        | $1C2B
    .byte $00 ; |        | $1C2C
    .byte $00 ; |        | $1C2D
    .byte $00 ; |        | $1C2E
    .byte $00 ; |        | $1C2F
    .byte $00 ; |        | $1C30
    .byte $00 ; |        | $1C31
    .byte $00 ; |        | $1C32
    .byte $00 ; |        | $1C33
    .byte $00 ; |        | $1C34
    .byte $00 ; |        | $1C35
    .byte $00 ; |        | $1C36
    .byte $00 ; |        | $1C37
    .byte $00 ; |        | $1C38
    .byte $00 ; |        | $1C39
    .byte $00 ; |        | $1C3A
    .byte $00 ; |        | $1C3B
    .byte $00 ; |        | $1C3C
    .byte $00 ; |        | $1C3D
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
    .byte $00 ; |        | $1C48
    .byte $00 ; |        | $1C49
    .byte $00 ; |        | $1C4A
    .byte $00 ; |        | $1C4B
    .byte $00 ; |        | $1C4C
    .byte $00 ; |        | $1C4D
    .byte $00 ; |        | $1C4E
    .byte $00 ; |        | $1C4F
    .byte $00 ; |        | $1C50
    .byte $00 ; |        | $1C51
    .byte $00 ; |        | $1C52
    .byte $00 ; |        | $1C53
    .byte $00 ; |        | $1C54
    .byte $00 ; |        | $1C55
    .byte $00 ; |        | $1C56
    .byte $00 ; |        | $1C57
    .byte $00 ; |        | $1C58
    .byte $00 ; |        | $1C59
    .byte $00 ; |        | $1C5A
    .byte $00 ; |        | $1C5B
    .byte $00 ; |        | $1C5C
    .byte $00 ; |        | $1C5D
    .byte $00 ; |        | $1C5E
    .byte $00 ; |        | $1C5F
    .byte $00 ; |        | $1C60
    .byte $00 ; |        | $1C61
    .byte $00 ; |        | $1C62
    .byte $00 ; |        | $1C63
    .byte $00 ; |        | $1C64
    .byte $00 ; |        | $1C65
    .byte $00 ; |        | $1C66
    .byte $00 ; |        | $1C67
    .byte $00 ; |        | $1C68
    .byte $00 ; |        | $1C69
    .byte $00 ; |        | $1C6A
    .byte $00 ; |        | $1C6B
    .byte $00 ; |        | $1C6C
    .byte $00 ; |        | $1C6D
    .byte $00 ; |        | $1C6E
    .byte $00 ; |        | $1C6F
    .byte $00 ; |        | $1C70
    .byte $00 ; |        | $1C71
    .byte $00 ; |        | $1C72
    .byte $00 ; |        | $1C73
    .byte $00 ; |        | $1C74
    .byte $00 ; |        | $1C75
    .byte $00 ; |        | $1C76
    .byte $00 ; |        | $1C77
    .byte $00 ; |        | $1C78
    .byte $00 ; |        | $1C79
    .byte $00 ; |        | $1C7A
    .byte $00 ; |        | $1C7B
    .byte $00 ; |        | $1C7C
    .byte $00 ; |        | $1C7D
    .byte $00 ; |        | $1C7E
    .byte $00 ; |        | $1C7F
    .byte $00 ; |        | $1C80
    .byte $00 ; |        | $1C81
    .byte $00 ; |        | $1C82
    .byte $00 ; |        | $1C83
    .byte $00 ; |        | $1C84
    .byte $00 ; |        | $1C85
    .byte $00 ; |        | $1C86
    .byte $00 ; |        | $1C87
    .byte $00 ; |        | $1C88
    .byte $00 ; |        | $1C89
    .byte $00 ; |        | $1C8A
    .byte $00 ; |        | $1C8B
    .byte $00 ; |        | $1C8C
    .byte $00 ; |        | $1C8D
    .byte $00 ; |        | $1C8E
    .byte $00 ; |        | $1C8F
    .byte $00 ; |        | $1C90
    .byte $00 ; |        | $1C91
    .byte $00 ; |        | $1C92
    .byte $00 ; |        | $1C93
    .byte $00 ; |        | $1C94
    .byte $00 ; |        | $1C95
    .byte $00 ; |        | $1C96
    .byte $00 ; |        | $1C97
    .byte $00 ; |        | $1C98
    .byte $00 ; |        | $1C99
    .byte $00 ; |        | $1C9A
    .byte $00 ; |        | $1C9B
    .byte $00 ; |        | $1C9C
    .byte $00 ; |        | $1C9D
    .byte $00 ; |        | $1C9E
    .byte $00 ; |        | $1C9F
    .byte $00 ; |        | $1CA0
    .byte $00 ; |        | $1CA1
    .byte $00 ; |        | $1CA2
    .byte $00 ; |        | $1CA3
    .byte $00 ; |        | $1CA4
    .byte $00 ; |        | $1CA5
    .byte $00 ; |        | $1CA6
    .byte $00 ; |        | $1CA7
    .byte $00 ; |        | $1CA8
    .byte $00 ; |        | $1CA9
    .byte $00 ; |        | $1CAA
    .byte $00 ; |        | $1CAB
    .byte $00 ; |        | $1CAC
    .byte $00 ; |        | $1CAD
    .byte $00 ; |        | $1CAE
    .byte $00 ; |        | $1CAF
    .byte $00 ; |        | $1CB0
    .byte $00 ; |        | $1CB1
    .byte $00 ; |        | $1CB2
    .byte $00 ; |        | $1CB3
    .byte $00 ; |        | $1CB4
    .byte $00 ; |        | $1CB5
    .byte $00 ; |        | $1CB6
    .byte $00 ; |        | $1CB7
    .byte $00 ; |        | $1CB8
    .byte $00 ; |        | $1CB9
    .byte $00 ; |        | $1CBA
    .byte $00 ; |        | $1CBB
    .byte $00 ; |        | $1CBC
    .byte $00 ; |        | $1CBD
    .byte $00 ; |        | $1CBE
    .byte $00 ; |        | $1CBF
    .byte $00 ; |        | $1CC0
    .byte $00 ; |        | $1CC1
    .byte $00 ; |        | $1CC2
    .byte $00 ; |        | $1CC3
    .byte $00 ; |        | $1CC4
    .byte $00 ; |        | $1CC5
    .byte $00 ; |        | $1CC6
    .byte $00 ; |        | $1CC7
    .byte $00 ; |        | $1CC8
    .byte $00 ; |        | $1CC9
    .byte $00 ; |        | $1CCA
    .byte $00 ; |        | $1CCB
    .byte $00 ; |        | $1CCC
    .byte $00 ; |        | $1CCD
    .byte $00 ; |        | $1CCE
    .byte $00 ; |        | $1CCF
    .byte $00 ; |        | $1CD0
    .byte $00 ; |        | $1CD1
    .byte $00 ; |        | $1CD2
    .byte $00 ; |        | $1CD3
    .byte $00 ; |        | $1CD4
    .byte $00 ; |        | $1CD5
    .byte $00 ; |        | $1CD6
    .byte $00 ; |        | $1CD7
    .byte $00 ; |        | $1CD8
    .byte $00 ; |        | $1CD9
    .byte $00 ; |        | $1CDA
    .byte $00 ; |        | $1CDB
    .byte $00 ; |        | $1CDC
    .byte $00 ; |        | $1CDD
    .byte $00 ; |        | $1CDE
    .byte $00 ; |        | $1CDF
    .byte $00 ; |        | $1CE0
    .byte $00 ; |        | $1CE1
    .byte $00 ; |        | $1CE2
    .byte $00 ; |        | $1CE3
    .byte $00 ; |        | $1CE4
    .byte $00 ; |        | $1CE5
    .byte $00 ; |        | $1CE6
    .byte $00 ; |        | $1CE7
    .byte $00 ; |        | $1CE8
    .byte $00 ; |        | $1CE9
    .byte $00 ; |        | $1CEA
    .byte $00 ; |        | $1CEB
    .byte $00 ; |        | $1CEC
    .byte $00 ; |        | $1CED
    .byte $00 ; |        | $1CEE
    .byte $00 ; |        | $1CEF
    .byte $00 ; |        | $1CF0
    .byte $00 ; |        | $1CF1
    .byte $00 ; |        | $1CF2
    .byte $00 ; |        | $1CF3
    .byte $00 ; |        | $1CF4
    .byte $00 ; |        | $1CF5
    .byte $00 ; |        | $1CF6
    .byte $00 ; |        | $1CF7
    .byte $00 ; |        | $1CF8
    .byte $00 ; |        | $1CF9
    .byte $00 ; |        | $1CFA
    .byte $00 ; |        | $1CFB
    .byte $00 ; |        | $1CFC
    .byte $00 ; |        | $1CFD
    .byte $00 ; |        | $1CFE
    .byte $00 ; |        | $1CFF


       ORG $1D00


;        XX   XX
;       XXXX XXXX   X  X XXX XXX X   X XXXX XXXX X  X
;       XX XXX XX   XX X X    X  X   X X  X X  X X XX
;       XX XXX XX   XXXX XX   X  X X X X  X XXXX XXX
;       XX  X  XX   X XX X    X  XXXXX X  X X X  XXX
;       XX     XX   X  X X    X  XX XX X  X X XX X XX
;       XX     XX   X  X XXX  X  X   X XXXX X  X X  X
;       XX     XX

Mnetwork1:
    .byte $30 ; |  XX    | $1D00
    .byte $30 ; |  XX    | $1D01
    .byte $30 ; |  XX    | $1D02
    .byte $32 ; |  XX  X | $1D03
    .byte $37 ; |  XX XXX| $1D04
    .byte $37 ; |  XX XXX| $1D05
    .byte $3D ; |  XXXX X| $1D06
    .byte $18 ; |   XX   | $1D07
Mnetwork2:
    .byte $60 ; | XX     | $1D08
    .byte $62 ; | XX   X | $1D09
    .byte $62 ; | XX   X | $1D0A
    .byte $62 ; | XX   X | $1D0B
    .byte $63 ; | XX   XX| $1D0C
    .byte $63 ; | XX   XX| $1D0D
    .byte $E2 ; |XXX   X | $1D0E
    .byte $C0 ; |XX      | $1D0F
Mnetwork3:
    .byte $00 ; |        | $1D10
    .byte $5C ; | X XXX  | $1D11
    .byte $50 ; | X X    | $1D12
    .byte $D0 ; |XX X    | $1D13
    .byte $D8 ; |XX XX   | $1D14
    .byte $50 ; | X X    | $1D15
    .byte $5D ; | X XXX X| $1D16
    .byte $00 ; |        | $1D17
Mnetwork4:
    .byte $00 ; |        | $1D18
    .byte $91 ; |X  X   X| $1D19
    .byte $9B ; |X  XX XX| $1D1A
    .byte $9F ; |X  XXXXX| $1D1B
    .byte $95 ; |X  X X X| $1D1C
    .byte $91 ; |X  X   X| $1D1D
    .byte $D1 ; |XX X   X| $1D1E
    .byte $00 ; |        | $1D1F
Mnetwork5:
    .byte $00 ; |        | $1D20
    .byte $7A ; | XXXX X | $1D21
    .byte $4A ; | X  X X | $1D22
    .byte $4A ; | X  X X | $1D23
    .byte $4B ; | X  X XX| $1D24
    .byte $4A ; | X  X X | $1D25
    .byte $7B ; | XXXX XX| $1D26
    .byte $00 ; |        | $1D27
Mnetwork6:
    .byte $00 ; |        | $1D28
    .byte $52 ; | X X  X | $1D29
    .byte $D6 ; |XX X XX | $1D2A
    .byte $9C ; |X  XXX  | $1D2B
    .byte $DC ; |XX XXX  | $1D2C
    .byte $56 ; | X X XX | $1D2D
    .byte $D2 ; |XX X  X | $1D2E
    .byte $00 ; |        | $1D2F

;      XXXXXX  XXXXXX  XX     XXXXXX  XXXXXXX  XXXXXX
;     XXX     XXX   XX XX     XX     XXX      XXX   XX
;     XX      XX     X XX     XX     XX       XX     X
;     XX      XX     X XX     XXXXX  XX       XX     X
;     XX      XX     X XX     XX     XX       XX     X
;     XX      XX     X XX     XX     XX       XX     X
;     XXX     XXX   XX XX     XX     XXX      XXX   XX
;      XXXXXX  XXXXXX  XXXXXX XXXXXX  XXXXXXX  XXXXXX

Coleco1:
    .byte $7E ; | XXXXXX | $1D30
    .byte $E0 ; |XXX     | $1D31
    .byte $C0 ; |XX      | $1D32
    .byte $C0 ; |XX      | $1D33
    .byte $C0 ; |XX      | $1D34
    .byte $C0 ; |XX      | $1D35
    .byte $E0 ; |XXX     | $1D36
    .byte $7E ; | XXXXXX | $1D37
Coleco2:
    .byte $7E ; | XXXXXX | $1D38
    .byte $E3 ; |XXX   XX| $1D39
    .byte $C1 ; |XX     X| $1D3A
    .byte $C1 ; |XX     X| $1D3B
    .byte $C1 ; |XX     X| $1D3C
    .byte $C1 ; |XX     X| $1D3D
    .byte $E3 ; |XXX   XX| $1D3E
    .byte $7E ; | XXXXXX | $1D3F
Coleco3:
    .byte $7E ; | XXXXXX | $1D40
    .byte $60 ; | XX     | $1D41
    .byte $60 ; | XX     | $1D42
    .byte $60 ; | XX     | $1D43
    .byte $60 ; | XX     | $1D44
    .byte $60 ; | XX     | $1D45
    .byte $60 ; | XX     | $1D46
    .byte $60 ; | XX     | $1D47
Coleco4:
    .byte $FC ; |XXXXXX  | $1D48
    .byte $C1 ; |XX     X| $1D49
    .byte $C1 ; |XX     X| $1D4A
    .byte $C1 ; |XX     X| $1D4B
    .byte $F9 ; |XXXXX  X| $1D4C
    .byte $C1 ; |XX     X| $1D4D
    .byte $C1 ; |XX     X| $1D4E
    .byte $FC ; |XXXXXX  | $1D4F
Coleco5:
    .byte $FE ; |XXXXXXX | $1D50
    .byte $C0 ; |XX      | $1D51
    .byte $80 ; |X       | $1D52
    .byte $80 ; |X       | $1D53
    .byte $80 ; |X       | $1D54
    .byte $80 ; |X       | $1D55
    .byte $C0 ; |XX      | $1D56
    .byte $FE ; |XXXXXXX | $1D57
Coleco6:
    .byte $7E ; | XXXXXX | $1D58
    .byte $E3 ; |XXX   XX| $1D59
    .byte $C1 ; |XX     X| $1D5A
    .byte $C1 ; |XX     X| $1D5B
    .byte $C1 ; |XX     X| $1D5C
    .byte $C1 ; |XX     X| $1D5D
    .byte $E3 ; |XXX   XX| $1D5E
    .byte $7E ; | XXXXXX | $1D5F

;     XXX   XX  XXX  X  X XXX XXX   XXX  XXX  XXX XX
;     X XX X  X X XX X XX X   X XX  X XX X XX X X X
;     X  X X  X X  X X X  X   X  X  X  X X  X X X X
;     X XX X  X X XX XXX  X   X XX  XXXX X XX X X XX
;     XXX  XXXX XXX  XXX  XXX XXX   X XX XXX  X X  X
;     X    X  X X X  X X  X   X X   X  X X X  X X  X
;     X    X  X X XX X XX X   X XX  X XX X XX X X  X
;     X    X  X X  X X  X XXX X  X  XXX  X  X XXX XX X

ParkerBros1:
    .byte $84 ; |X    X  | $1D60
    .byte $84 ; |X    X  | $1D61
    .byte $84 ; |X    X  | $1D62
    .byte $E7 ; |XXX  XXX| $1D63
    .byte $B4 ; |X XX X  | $1D64
    .byte $94 ; |X  X X  | $1D65
    .byte $B4 ; |X XX X  | $1D66
    .byte $E3 ; |XXX   XX| $1D67
ParkerBros2:
    .byte $A5 ; |X X  X X| $1D68
    .byte $AD ; |X X XX X| $1D69
    .byte $A9 ; |X X X  X| $1D6A
    .byte $B9 ; |X XXX  X| $1D6B
    .byte $AD ; |X X XX X| $1D6C
    .byte $A5 ; |X X  X X| $1D6D
    .byte $AD ; |X X XX X| $1D6E
    .byte $39 ; |  XXX  X| $1D6F
ParkerBros3:
    .byte $2E ; |  X XXX | $1D70
    .byte $68 ; | XX X   | $1D71
    .byte $48 ; | X  X   | $1D72
    .byte $CE ; |XX  XXX | $1D73
    .byte $C8 ; |XX  X   | $1D74
    .byte $48 ; | X  X   | $1D75
    .byte $68 ; | XX X   | $1D76
    .byte $2E ; |  X XXX | $1D77
ParkerBros4:
    .byte $93 ; |X  X  XX| $1D78
    .byte $B2 ; |X XX  X | $1D79
    .byte $A2 ; |X X   X | $1D7A
    .byte $E2 ; |XXX   X | $1D7B
    .byte $B3 ; |X XX  XX| $1D7C
    .byte $92 ; |X  X  X | $1D7D
    .byte $B2 ; |X XX  X | $1D7E
    .byte $E3 ; |XXX   XX| $1D7F
ParkerBros5:
    .byte $92 ; |X  X  X | $1D80
    .byte $D6 ; |XX X XX | $1D81
    .byte $54 ; | X X X  | $1D82
    .byte $DC ; |XX XXX  | $1D83
    .byte $D6 ; |XX X XX | $1D84
    .byte $52 ; | X X  X | $1D85
    .byte $D6 ; |XX X XX | $1D86
    .byte $9C ; |X  XXX  | $1D87
ParkerBros6:
    .byte $ED ; |XXX XX X| $1D88
    .byte $A4 ; |X X  X  | $1D89
    .byte $A4 ; |X X  X  | $1D8A
    .byte $A4 ; |X X  X  | $1D8B
    .byte $AC ; |X X XX  | $1D8C
    .byte $A8 ; |X X X   | $1D8D
    .byte $A8 ; |X X X   | $1D8E
    .byte $EC ; |XXX XX  | $1D8F



    .byte $00 ; |        | $1D90
    .byte $00 ; |        | $1D91
    .byte $00 ; |        | $1D92
    .byte $00 ; |        | $1D93
    .byte $00 ; |        | $1D94
    .byte $00 ; |        | $1D95
    .byte $00 ; |        | $1D96
    .byte $00 ; |        | $1D97
    .byte $00 ; |        | $1D98
    .byte $00 ; |        | $1D99
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
    .byte $00 ; |        | $1DAB
    .byte $00 ; |        | $1DAC
    .byte $00 ; |        | $1DAD
    .byte $00 ; |        | $1DAE
    .byte $00 ; |        | $1DAF
    .byte $00 ; |        | $1DB0
    .byte $00 ; |        | $1DB1
    .byte $00 ; |        | $1DB2
    .byte $00 ; |        | $1DB3
    .byte $00 ; |        | $1DB4
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
    .byte $00 ; |        | $1DC6
    .byte $00 ; |        | $1DC7
    .byte $00 ; |        | $1DC8
    .byte $00 ; |        | $1DC9
    .byte $00 ; |        | $1DCA
    .byte $00 ; |        | $1DCB
    .byte $00 ; |        | $1DCC
    .byte $00 ; |        | $1DCD
    .byte $00 ; |        | $1DCE
    .byte $00 ; |        | $1DCF
    .byte $00 ; |        | $1DD0
    .byte $00 ; |        | $1DD1
    .byte $00 ; |        | $1DD2
    .byte $00 ; |        | $1DD3
    .byte $00 ; |        | $1DD4
    .byte $00 ; |        | $1DD5
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
    .byte $00 ; |        | $1DE6
    .byte $00 ; |        | $1DE7
    .byte $00 ; |        | $1DE8
    .byte $00 ; |        | $1DE9
    .byte $00 ; |        | $1DEA
    .byte $00 ; |        | $1DEB
    .byte $00 ; |        | $1DEC
    .byte $00 ; |        | $1DED
    .byte $00 ; |        | $1DEE
    .byte $00 ; |        | $1DEF
    .byte $00 ; |        | $1DF0
    .byte $00 ; |        | $1DF1
    .byte $00 ; |        | $1DF2
    .byte $00 ; |        | $1DF3
    .byte $00 ; |        | $1DF4
    .byte $00 ; |        | $1DF5
    .byte $00 ; |        | $1DF6
    .byte $00 ; |        | $1DF7
    .byte $00 ; |        | $1DF8
    .byte $00 ; |        | $1DF9
    .byte $00 ; |        | $1DFA
    .byte $00 ; |        | $1DFB
    .byte $00 ; |        | $1DFC
    .byte $00 ; |        | $1DFD
    .byte $00 ; |        | $1DFE
    .byte $00 ; |        | $1DFF


       ORG $1E00


;          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;       XXX                                      XXX
;      XXX  XX XX    XX   XX    XXXXX  XX   XXX   XXX
;      XX   XX XXX  XXX  XXXX  XX   XX XX  XXXXX   XX
;      XX   XX XXXXXXXX  X  X  XX   XX XX XX  XX   XX
;     XX    XX XXXXXXXX XX  XX XX      XX XX        XX
;     XX    XX XXXXXXXX XXXXXX XX  XXX XX XX        XX
;     XX    XX XX XX XX XXXXXX XX  XXX XX XX        XX
;     XXX   XX XX XX XX XX  XX XX   XX XX XX        XX
;      XX   XX XX    XX XX  XX XX   XX XX XX  XX   XX
;      XX   XX XX    XX XX  XX XX  XXX XX XXXXXX   XX
;      XXX  XX XX    XX XX  XX  XXXXX  XX   XXX   XXX
;       XXX                                      XXX
;        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

ImagicGfx:

Imagic1:
    .byte $07 ; |     XXX| $1E00
    .byte $1F ; |   XXXXX| $1E01
    .byte $38 ; |  XXX   | $1E02
    .byte $73 ; | XXX  XX| $1E03
    .byte $63 ; | XX   XX| $1E04
    .byte $63 ; | XX   XX| $1E05
    .byte $E3 ; |XXX   XX| $1E06
    .byte $C3 ; |XX    XX| $1E07
    .byte $C3 ; |XX    XX| $1E08
    .byte $C3 ; |XX    XX| $1E09
    .byte $63 ; | XX   XX| $1E0A
    .byte $63 ; | XX   XX| $1E0B
    .byte $73 ; | XXX  XX| $1E0C
    .byte $38 ; |  XXX   | $1E0D
    .byte $1F ; |   XXXXX| $1E0E
    .byte $07 ; |     XXX| $1E0F
Imagic2:
    .byte $FF ; |XXXXXXXX| $1E10
    .byte $FF ; |XXXXXXXX| $1E11
    .byte $00 ; |        | $1E12
    .byte $61 ; | XX    X| $1E13
    .byte $61 ; | XX    X| $1E14
    .byte $61 ; | XX    X| $1E15
    .byte $6D ; | XX XX X| $1E16
    .byte $6D ; | XX XX X| $1E17
    .byte $7F ; | XXXXXXX| $1E18
    .byte $7F ; | XXXXXXX| $1E19
    .byte $7F ; | XXXXXXX| $1E1A
    .byte $73 ; | XXX  XX| $1E1B
    .byte $61 ; | XX    X| $1E1C
    .byte $00 ; |        | $1E1D
    .byte $FF ; |XXXXXXXX| $1E1E
    .byte $FF ; |XXXXXXXX| $1E1F
Imagic3:
    .byte $FF ; |XXXXXXXX| $1E20
    .byte $FF ; |XXXXXXXX| $1E21
    .byte $00 ; |        | $1E22
    .byte $B3 ; |X XX  XX| $1E23
    .byte $B3 ; |X XX  XX| $1E24
    .byte $B3 ; |X XX  XX| $1E25
    .byte $B3 ; |X XX  XX| $1E26
    .byte $BF ; |X XXXXXX| $1E27
    .byte $BF ; |X XXXXXX| $1E28
    .byte $B3 ; |X XX  XX| $1E29
    .byte $92 ; |X  X  X | $1E2A
    .byte $9E ; |X  XXXX | $1E2B
    .byte $8C ; |X   XX  | $1E2C
    .byte $00 ; |        | $1E2D
    .byte $FF ; |XXXXXXXX| $1E2E
    .byte $FF ; |XXXXXXXX| $1E2F
Imagic4:
    .byte $FF ; |XXXXXXXX| $1E30
    .byte $FF ; |XXXXXXXX| $1E31
    .byte $00 ; |        | $1E32
    .byte $3E ; |  XXXXX | $1E33
    .byte $67 ; | XX  XXX| $1E34
    .byte $63 ; | XX   XX| $1E35
    .byte $63 ; | XX   XX| $1E36
    .byte $67 ; | XX  XXX| $1E37
    .byte $67 ; | XX  XXX| $1E38
    .byte $60 ; | XX     | $1E39
    .byte $63 ; | XX   XX| $1E3A
    .byte $63 ; | XX   XX| $1E3B
    .byte $3E ; |  XXXXX | $1E3C
    .byte $00 ; |        | $1E3D
    .byte $FF ; |XXXXXXXX| $1E3E
    .byte $FF ; |XXXXXXXX| $1E3F
Imagic5:
    .byte $FF ; |XXXXXXXX| $1E40
    .byte $FF ; |XXXXXXXX| $1E41
    .byte $00 ; |        | $1E42
    .byte $63 ; | XX   XX| $1E43
    .byte $6F ; | XX XXXX| $1E44
    .byte $6C ; | XX XX  | $1E45
    .byte $6C ; | XX XX  | $1E46
    .byte $6C ; | XX XX  | $1E47
    .byte $6C ; | XX XX  | $1E48
    .byte $6C ; | XX XX  | $1E49
    .byte $6C ; | XX XX  | $1E4A
    .byte $67 ; | XX  XXX| $1E4B
    .byte $63 ; | XX   XX| $1E4C
    .byte $00 ; |        | $1E4D
    .byte $FF ; |XXXXXXXX| $1E4E
    .byte $FF ; |XXXXXXXX| $1E4F
Imagic6:
    .byte $E0 ; |XXX     | $1E50
    .byte $F8 ; |XXXXX   | $1E51
    .byte $1C ; |   XXX  | $1E52
    .byte $8E ; |X   XXX | $1E53
    .byte $C6 ; |XX   XX | $1E54
    .byte $C6 ; |XX   XX | $1E55
    .byte $03 ; |      XX| $1E56
    .byte $03 ; |      XX| $1E57
    .byte $03 ; |      XX| $1E58
    .byte $03 ; |      XX| $1E59
    .byte $C6 ; |XX   XX | $1E5A
    .byte $C6 ; |XX   XX | $1E5B
    .byte $8E ; |X   XXX | $1E5C
    .byte $1C ; |   XXX  | $1E5D
    .byte $F8 ; |XXXXX   | $1E5E
    .byte $E0 ; |XXX     | $1E5F


L1E60:
    .byte $00 ; |        | $1E60
    .byte $00 ; |        | $1E61
    .byte $00 ; |        | $1E62
    .byte $00 ; |        | $1E63
    .byte $00 ; |        | $1E64
    .byte $00 ; |        | $1E65
    .byte $00 ; |        | $1E66
    .byte $00 ; |        | $1E67
    .byte $00 ; |        | $1E68
    .byte $00 ; |        | $1E69
    .byte $00 ; |        | $1E6A
    .byte $00 ; |        | $1E6B
    .byte $00 ; |        | $1E6C
    .byte $00 ; |        | $1E6D
    .byte $00 ; |        | $1E6E
    .byte $00 ; |        | $1E6F


;          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;      XXXXX  X  XXXX  XXX  XXXX     XX  XXX   XXXXXX
;      XXXXX  X   XX   XX    XX  XXX  X  XX     XXXXX
;      XXXXX  X        XX XX XX  XXX  X  X  XX  XXXXX
;     XXXXXX  X        X  XX  X  XXXXXX  X  XXXXXXXXXX
;     XXXXXX  X        X      X  XX   X  X  XXXXXXXXXX
;     XXXXXX  X  X  X  X      X  XX   X  X  XXXXXXXXXX
;     XXXXXX  X  X  X  X  XX  X  XXX  X  X  XXXXXXXXXX
;      XXXXX  X  XXXX  X  XX  X  XXX  X  X  XX  XXXXX
;      XXXXX  X  XXXX  X  XX  X  XX   X  X      XXXXX
;      XXXXX  X  XXXX  X  XX  XX     XX  XXX   XXXXXX
;       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


ImagicInverted1:
    .byte $07 ; |     XXX| $1E70
    .byte $1F ; |   XXXXX| $1E71
    .byte $3F ; |  XXXXXX| $1E72
    .byte $7C ; | XXXXX  | $1E73
    .byte $7C ; | XXXXX  | $1E74
    .byte $7C ; | XXXXX  | $1E75
    .byte $FC ; |XXXXXX  | $1E76
    .byte $FC ; |XXXXXX  | $1E77
    .byte $FC ; |XXXXXX  | $1E78
    .byte $FC ; |XXXXXX  | $1E79
    .byte $7C ; | XXXXX  | $1E7A
    .byte $7C ; | XXXXX  | $1E7B
    .byte $7C ; | XXXXX  | $1E7C
    .byte $3F ; |  XXXXXX| $1E7D
    .byte $1F ; |   XXXXX| $1E7E
    .byte $07 ; |     XXX| $1E7F
ImagicInverted2:
    .byte $FF ; |XXXXXXXX| $1E80
    .byte $FF ; |XXXXXXXX| $1E81
    .byte $FF ; |XXXXXXXX| $1E82
    .byte $9E ; |X  XXXX | $1E83
    .byte $9E ; |X  XXXX | $1E84
    .byte $9E ; |X  XXXX | $1E85
    .byte $92 ; |X  X  X | $1E86
    .byte $92 ; |X  X  X | $1E87
    .byte $80 ; |X       | $1E88
    .byte $80 ; |X       | $1E89
    .byte $80 ; |X       | $1E8A
    .byte $8C ; |X   XX  | $1E8B
    .byte $9E ; |X  XXXX | $1E8C
    .byte $FF ; |XXXXXXXX| $1E8D
    .byte $FF ; |XXXXXXXX| $1E8E
    .byte $FF ; |XXXXXXXX| $1E8F
ImagicInverted3:
    .byte $FF ; |XXXXXXXX| $1E90
    .byte $FF ; |XXXXXXXX| $1E91
    .byte $FF ; |XXXXXXXX| $1E92
    .byte $4C ; | X  XX  | $1E93
    .byte $4C ; | X  XX  | $1E94
    .byte $4C ; | X  XX  | $1E95
    .byte $4C ; | X  XX  | $1E96
    .byte $40 ; | X      | $1E97
    .byte $40 ; | X      | $1E98
    .byte $4C ; | X  XX  | $1E99
    .byte $6D ; | XX XX X| $1E9A
    .byte $61 ; | XX    X| $1E9B
    .byte $73 ; | XXX  XX| $1E9C
    .byte $FF ; |XXXXXXXX| $1E9D
    .byte $FF ; |XXXXXXXX| $1E9E
    .byte $FF ; |XXXXXXXX| $1E9F
ImagicInverted4:
    .byte $FF ; |XXXXXXXX| $1EA0
    .byte $FF ; |XXXXXXXX| $1EA1
    .byte $FF ; |XXXXXXXX| $1EA2
    .byte $C1 ; |XX     X| $1EA3
    .byte $98 ; |X  XX   | $1EA4
    .byte $9C ; |X  XXX  | $1EA5
    .byte $9C ; |X  XXX  | $1EA6
    .byte $98 ; |X  XX   | $1EA7
    .byte $98 ; |X  XX   | $1EA8
    .byte $9F ; |X  XXXXX| $1EA9
    .byte $9C ; |X  XXX  | $1EAA
    .byte $9C ; |X  XXX  | $1EAB
    .byte $C1 ; |XX     X| $1EAC
    .byte $FF ; |XXXXXXXX| $1EAD
    .byte $FF ; |XXXXXXXX| $1EAE
    .byte $FF ; |XXXXXXXX| $1EAF
ImagicInverted5:
    .byte $FF ; |XXXXXXXX| $1EB0
    .byte $FF ; |XXXXXXXX| $1EB1
    .byte $FF ; |XXXXXXXX| $1EB2
    .byte $9C ; |X  XXX  | $1EB3
    .byte $90 ; |X  X    | $1EB4
    .byte $93 ; |X  X  XX| $1EB5
    .byte $93 ; |X  X  XX| $1EB6
    .byte $93 ; |X  X  XX| $1EB7
    .byte $93 ; |X  X  XX| $1EB8
    .byte $93 ; |X  X  XX| $1EB9
    .byte $93 ; |X  X  XX| $1EBA
    .byte $98 ; |X  XX   | $1EBB
    .byte $9C ; |X  XXX  | $1EBC
    .byte $FF ; |XXXXXXXX| $1EBD
    .byte $FF ; |XXXXXXXX| $1EBE
    .byte $FF ; |XXXXXXXX| $1EBF
ImagicInverted6:
    .byte $E0 ; |XXX     | $1EC0
    .byte $F8 ; |XXXXX   | $1EC1
    .byte $FC ; |XXXXXX  | $1EC2
    .byte $7E ; | XXXXXX | $1EC3
    .byte $3E ; |  XXXXX | $1EC4
    .byte $3E ; |  XXXXX | $1EC5
    .byte $FF ; |XXXXXXXX| $1EC6
    .byte $FF ; |XXXXXXXX| $1EC7
    .byte $FF ; |XXXXXXXX| $1EC8
    .byte $FF ; |XXXXXXXX| $1EC9
    .byte $3E ; |  XXXXX | $1ECA
    .byte $3E ; |  XXXXX | $1ECB
    .byte $7E ; | XXXXXX | $1ECC
    .byte $FC ; |XXXXXX  | $1ECD
    .byte $F8 ; |XXXXX   | $1ECE
    .byte $E0 ; |XXX     | $1ECF

    .byte $00 ; |        | $1ED0
    .byte $00 ; |        | $1ED1
    .byte $00 ; |        | $1ED2
    .byte $00 ; |        | $1ED3
    .byte $00 ; |        | $1ED4
    .byte $00 ; |        | $1ED5
    .byte $00 ; |        | $1ED6
    .byte $00 ; |        | $1ED7
    .byte $00 ; |        | $1ED8
    .byte $00 ; |        | $1ED9
    .byte $00 ; |        | $1EDA
    .byte $00 ; |        | $1EDB
    .byte $00 ; |        | $1EDC
    .byte $00 ; |        | $1EDD
    .byte $00 ; |        | $1EDE
    .byte $00 ; |        | $1EDF
    .byte $00 ; |        | $1EE0
    .byte $00 ; |        | $1EE1
    .byte $00 ; |        | $1EE2
    .byte $00 ; |        | $1EE3
    .byte $00 ; |        | $1EE4
    .byte $00 ; |        | $1EE5
    .byte $00 ; |        | $1EE6
    .byte $00 ; |        | $1EE7
    .byte $00 ; |        | $1EE8
    .byte $00 ; |        | $1EE9
    .byte $00 ; |        | $1EEA
    .byte $00 ; |        | $1EEB
    .byte $00 ; |        | $1EEC
    .byte $00 ; |        | $1EED
    .byte $00 ; |        | $1EEE
    .byte $00 ; |        | $1EEF
    .byte $00 ; |        | $1EF0
    .byte $00 ; |        | $1EF1
    .byte $00 ; |        | $1EF2
    .byte $00 ; |        | $1EF3
    .byte $00 ; |        | $1EF4
    .byte $00 ; |        | $1EF5
    .byte $00 ; |        | $1EF6
    .byte $00 ; |        | $1EF7
    .byte $00 ; |        | $1EF8
    .byte $00 ; |        | $1EF9
    .byte $00 ; |        | $1EFA
    .byte $00 ; |        | $1EFB
    .byte $00 ; |        | $1EFC
    .byte $00 ; |        | $1EFD
    .byte $00 ; |        | $1EFE
    .byte $00 ; |        | $1EFF


       ORG $1F00


;     XXXX  X    XXX  X   X    X   X  XXX  X   X XXXX
;     X  XX X   XX XX X   X    X   X XX XX X   X X  XX
;     X   X X   X   X X   X    X   X X   X X   X X   X
;     X  XX X   X   X XX XX    XX XX X   X X   X X  XX
;     XXXX  X   XXXXX  XXX      XXX  X   X X   X XXXX
;     X     X   X   X   X        X   X   X X   X X  X
;     X     X   X   X   X        X   XX XX XX XX X  X
;     X     XXX X   X   X        X    XXX   XXX  X  X

PlayYour1:
    .byte $83 ; |X     XX| $1F00
    .byte $82 ; |X     X | $1F01
    .byte $82 ; |X     X | $1F02
    .byte $F2 ; |XXXX  X | $1F03
    .byte $9A ; |X  XX X | $1F04
    .byte $8A ; |X   X X | $1F05
    .byte $9A ; |X  XX X | $1F06
    .byte $F2 ; |XXXX  X | $1F07
PlayYour2:
    .byte $A2 ; |X X   X | $1F08
    .byte $22 ; |  X   X | $1F09
    .byte $22 ; |  X   X | $1F0A
    .byte $3E ; |  XXXXX | $1F0B
    .byte $22 ; |  X   X | $1F0C
    .byte $22 ; |  X   X | $1F0D
    .byte $36 ; |  XX XX | $1F0E
    .byte $1C ; |   XXX  | $1F0F
PlayYour3:
    .byte $20 ; |  X     | $1F10
    .byte $20 ; |  X     | $1F11
    .byte $20 ; |  X     | $1F12
    .byte $70 ; | XXX    | $1F13
    .byte $D8 ; |XX XX   | $1F14
    .byte $88 ; |X   X   | $1F15
    .byte $88 ; |X   X   | $1F16
    .byte $88 ; |X   X   | $1F17
PlayYour4:
    .byte $10 ; |   X    | $1F18
    .byte $11 ; |   X   X| $1F19
    .byte $11 ; |   X   X| $1F1A
    .byte $39 ; |  XXX  X| $1F1B
    .byte $6D ; | XX XX X| $1F1C
    .byte $45 ; | X   X X| $1F1D
    .byte $45 ; | X   X X| $1F1E
    .byte $44 ; | X   X  | $1F1F
PlayYour5:
    .byte $E3 ; |XXX   XX| $1F20
    .byte $B6 ; |X XX XX | $1F21
    .byte $14 ; |   X X  | $1F22
    .byte $14 ; |   X X  | $1F23
    .byte $14 ; |   X X  | $1F24
    .byte $14 ; |   X X  | $1F25
    .byte $B4 ; |X XX X  | $1F26
    .byte $E4 ; |XXX  X  | $1F27
PlayYour6:
    .byte $92 ; |X  X  X | $1F28
    .byte $D2 ; |XX X  X | $1F29
    .byte $52 ; | X X  X | $1F2A
    .byte $5E ; | X XXXX | $1F2B
    .byte $53 ; | X X  XX| $1F2C
    .byte $51 ; | X X   X| $1F2D
    .byte $53 ; | X X  XX| $1F2E
    .byte $5E ; | X XXXX | $1F2F


;        XXXXX  XXX  X   X  XXX  XXXX  X XXXXX XXXX
;        X     XX XX X   X XX XX X  XX X   X   X
;        X     X   X X   X X   X X   X X   X   X
;        X     X   X XX XX X   X X  XX X   X   X
;        XXXX  XXXXX  X X  X   X XXXX  X   X   XXX
;        X     X   X  X X  X   X X  X  X   X   X
;        X     X   X  XXX  XX XX X  X  X   X   X
;        X     X   X   X    XXX  X  X  X   X   XXXX

Favorite1:
    .byte $10 ; |   X    | $1F30
    .byte $10 ; |   X    | $1F31
    .byte $10 ; |   X    | $1F32
    .byte $1E ; |   XXXX | $1F33
    .byte $10 ; |   X    | $1F34
    .byte $10 ; |   X    | $1F35
    .byte $10 ; |   X    | $1F36
    .byte $1F ; |   XXXXX| $1F37
Favorite2:
    .byte $44 ; | X   X  | $1F38
    .byte $44 ; | X   X  | $1F39
    .byte $44 ; | X   X  | $1F3A
    .byte $7C ; | XXXXX  | $1F3B
    .byte $45 ; | X   X X| $1F3C
    .byte $45 ; | X   X X| $1F3D
    .byte $6D ; | XX XX X| $1F3E
    .byte $39 ; |  XXX  X| $1F3F
Favorite3:
    .byte $43 ; | X    XX| $1F40
    .byte $E6 ; |XXX  XX | $1F41
    .byte $A4 ; |X X  X  | $1F42
    .byte $A4 ; |X X  X  | $1F43
    .byte $B4 ; |X XX X  | $1F44
    .byte $14 ; |   X X  | $1F45
    .byte $16 ; |   X XX | $1F46
    .byte $13 ; |   X  XX| $1F47
Favorite4:
    .byte $92 ; |X  X  X | $1F48
    .byte $D2 ; |XX X  X | $1F49
    .byte $52 ; | X X  X | $1F4A
    .byte $5E ; | X XXXX | $1F4B
    .byte $53 ; | X X  XX| $1F4C
    .byte $51 ; | X X   X| $1F4D
    .byte $D3 ; |XX X  XX| $1F4E
    .byte $9E ; |X  XXXX | $1F4F
Favorite5:
    .byte $44 ; | X   X  | $1F50
    .byte $44 ; | X   X  | $1F51
    .byte $44 ; | X   X  | $1F52
    .byte $44 ; | X   X  | $1F53
    .byte $44 ; | X   X  | $1F54
    .byte $44 ; | X   X  | $1F55
    .byte $44 ; | X   X  | $1F56
    .byte $5F ; | X XXXXX| $1F57
Favorite6:
    .byte $78 ; | XXXX   | $1F58
    .byte $40 ; | X      | $1F59
    .byte $40 ; | X      | $1F5A
    .byte $70 ; | XXX    | $1F5B
    .byte $40 ; | X      | $1F5C
    .byte $40 ; | X      | $1F5D
    .byte $40 ; | X      | $1F5E
    .byte $78 ; | XXXX   | $1F5F

;     X   X X XXX  XXXX  XXX     XXXX  XXX  X   X XXXX
;     X   X X X XX X    XX XX   XX  X XX XX XX XX X
;     X   X X X  X X    X   X   X     X   X XXXXX X
;     XX XX X X  X X    X   X   X  XX X   X X X X X
;      X X  X X  X XXX  X   X   X   X XXXXX X   X XXX
;      X X  X X  X X    X   X   X   X X   X X   X X
;      XXX  X X XX X    XX XX   XX  X X   X X   X X
;       X   X XXX  XXXX  XXX     XXXX X   X X   X XXXX

VideoGame1:
    .byte $22 ; |  X   X | $1F60
    .byte $72 ; | XXX  X | $1F61
    .byte $52 ; | X X  X | $1F62
    .byte $52 ; | X X  X | $1F63
    .byte $DA ; |XX XX X | $1F64
    .byte $8A ; |X   X X | $1F65
    .byte $8A ; |X   X X | $1F66
    .byte $8A ; |X   X X | $1F67
VideoGame2:
    .byte $E7 ; |XXX  XXX| $1F68
    .byte $B4 ; |X XX X  | $1F69
    .byte $94 ; |X  X X  | $1F6A
    .byte $97 ; |X  X XXX| $1F6B
    .byte $94 ; |X  X X  | $1F6C
    .byte $94 ; |X  X X  | $1F6D
    .byte $B4 ; |X XX X  | $1F6E
    .byte $E7 ; |XXX  XXX| $1F6F
VideoGame3:
    .byte $9C ; |X  XXX  | $1F70
    .byte $36 ; |  XX XX | $1F71
    .byte $22 ; |  X   X | $1F72
    .byte $22 ; |  X   X | $1F73
    .byte $22 ; |  X   X | $1F74
    .byte $22 ; |  X   X | $1F75
    .byte $36 ; |  XX XX | $1F76
    .byte $9C ; |X  XXX  | $1F77
VideoGame4:
    .byte $1E ; |   XXXX | $1F78
    .byte $32 ; |  XX  X | $1F79
    .byte $22 ; |  X   X | $1F7A
    .byte $22 ; |  X   X | $1F7B
    .byte $26 ; |  X  XX | $1F7C
    .byte $20 ; |  X     | $1F7D
    .byte $32 ; |  XX  X | $1F7E
    .byte $1E ; |   XXXX | $1F7F
VideoGame5:
    .byte $8A ; |X   X X | $1F80
    .byte $8A ; |X   X X | $1F81
    .byte $8A ; |X   X X | $1F82
    .byte $FA ; |XXXXX X | $1F83
    .byte $8A ; |X   X X | $1F84
    .byte $8B ; |X   X XX| $1F85
    .byte $DB ; |XX XX XX| $1F86
    .byte $72 ; | XXX  X | $1F87
VideoGame6:
    .byte $2F ; |  X XXXX| $1F88
    .byte $28 ; |  X X   | $1F89
    .byte $28 ; |  X X   | $1F8A
    .byte $2E ; |  X XXX | $1F8B
    .byte $A8 ; |X X X   | $1F8C
    .byte $E8 ; |XXX X   | $1F8D
    .byte $68 ; | XX X   | $1F8E
    .byte $2F ; |  X XXXX| $1F8F

;           X     XXXXXXXXXX   XXXXXXXXXX
;          XXX        X    X   X
;          X X   XXXX X  X XX XX X XXXX X XXXX X  X
;         X   X  X    X  X  X X  X X    X X  X XX X
;         X   X  X    X  X  XXX  X XXXX X X  X XXXX
;        XXXXXXX X    X  X   X   X    X X X  X X XX
;        X     X XXXX X  X   X   X    X X X  X X  X
;        X     X XXXX X  X   X   X XXXX X XXXX X  X

Activision1:
    .byte $10 ; |   X    | $1F90
    .byte $10 ; |   X    | $1F91
    .byte $1F ; |   XXXXX| $1F92
    .byte $08 ; |    X   | $1F93
    .byte $08 ; |    X   | $1F94
    .byte $05 ; |     X X| $1F95
    .byte $07 ; |     XXX| $1F96
    .byte $02 ; |      X | $1F97
Activision2:
    .byte $5E ; | X XXXX | $1F98
    .byte $5E ; | X XXXX | $1F99
    .byte $D0 ; |XX X    | $1F9A
    .byte $90 ; |X  X    | $1F9B
    .byte $90 ; |X  X    | $1F9C
    .byte $1E ; |   XXXX | $1F9D
    .byte $00 ; |        | $1F9E
    .byte $0F ; |    XXXX| $1F9F
Activision3:
    .byte $91 ; |X  X   X| $1FA0
    .byte $91 ; |X  X   X| $1FA1
    .byte $91 ; |X  X   X| $1FA2
    .byte $93 ; |X  X  XX| $1FA3
    .byte $92 ; |X  X  X | $1FA4
    .byte $96 ; |X  X XX | $1FA5
    .byte $84 ; |X    X  | $1FA6
    .byte $FC ; |XXXXXX  | $1FA7
Activision4:
    .byte $17 ; |   X XXX| $1FA8
    .byte $10 ; |   X    | $1FA9
    .byte $10 ; |   X    | $1FAA
    .byte $97 ; |X  X XXX| $1FAB
    .byte $94 ; |X  X X  | $1FAC
    .byte $D7 ; |XX X XXX| $1FAD
    .byte $40 ; | X      | $1FAE
    .byte $7F ; | XXXXXXX| $1FAF
Activision5:
    .byte $AF ; |X X XXXX| $1FB0
    .byte $A9 ; |X X X  X| $1FB1
    .byte $A9 ; |X X X  X| $1FB2
    .byte $A9 ; |X X X  X| $1FB3
    .byte $29 ; |  X X  X| $1FB4
    .byte $AF ; |X X XXXX| $1FB5
    .byte $00 ; |        | $1FB6
    .byte $E0 ; |XXX     | $1FB7
Activision6:
    .byte $48 ; | X  X   | $1FB8
    .byte $48 ; | X  X   | $1FB9
    .byte $58 ; | X XX   | $1FBA
    .byte $78 ; | XXXX   | $1FBB
    .byte $68 ; | XX X   | $1FBC
    .byte $48 ; | X  X   | $1FBD
    .byte $00 ; |        | $1FBE
    .byte $00 ; |        | $1FBF

;            XX    XXXXXXXX    XX      XXXXXX    XX
;           XXXX   XXXXXXXX   XXXX     XX   XX   XX
;          XX  XX     XX     XX  XX    XX    XX  XX
;          XX  XX     XX     XX  XX    XX   XX   XX
;         XX    XX    XX    XX    XX   XXXXXX    XX
;        XXXXXXXXXX   XX   XXXXXXXXXX  XX  XX    XX
;        XX      XX   XX   XX      XX  XX   XX   XX
;        XX      XX   XX   XX      XX  XX    XX  XX

Atari1:
    .byte $18 ; |   XX   | $1FC0
    .byte $18 ; |   XX   | $1FC1
    .byte $1F ; |   XXXXX| $1FC2
    .byte $0C ; |    XX  | $1FC3
    .byte $06 ; |     XX | $1FC4
    .byte $06 ; |     XX | $1FC5
    .byte $03 ; |      XX| $1FC6
    .byte $01 ; |       X| $1FC7
Atari2:
    .byte $18 ; |   XX   | $1FC8
    .byte $18 ; |   XX   | $1FC9
    .byte $F8 ; |XXXXX   | $1FCA
    .byte $30 ; |  XX    | $1FCB
    .byte $60 ; | XX     | $1FCC
    .byte $60 ; | XX     | $1FCD
    .byte $C7 ; |XX   XXX| $1FCE
    .byte $87 ; |X    XXX| $1FCF
Atari3:
    .byte $C6 ; |XX   XX | $1FD0
    .byte $C6 ; |XX   XX | $1FD1
    .byte $C7 ; |XX   XXX| $1FD2
    .byte $C3 ; |XX    XX| $1FD3
    .byte $C1 ; |XX     X| $1FD4
    .byte $C1 ; |XX     X| $1FD5
    .byte $F8 ; |XXXXX   | $1FD6
    .byte $F8 ; |XXXXX   | $1FD7
Atari4:
    .byte $06 ; |     XX | $1FD8
    .byte $06 ; |     XX | $1FD9
    .byte $FE ; |XXXXXXX | $1FDA
    .byte $0C ; |    XX  | $1FDB
    .byte $98 ; |X  XX   | $1FDC
    .byte $98 ; |X  XX   | $1FDD
    .byte $F0 ; |XXXX    | $1FDE
    .byte $60 ; | XX     | $1FDF
Atari5:
    .byte $61 ; | XX    X| $1FE0
    .byte $63 ; | XX   XX| $1FE1
    .byte $66 ; | XX  XX | $1FE2
    .byte $7E ; | XXXXXX | $1FE3
    .byte $63 ; | XX   XX| $1FE4
    .byte $61 ; | XX    X| $1FE5
    .byte $63 ; | XX   XX| $1FE6
    .byte $7E ; | XXXXXX | $1FE7
Atari6:
    .byte $98 ; |X  XX   | $1FE8
    .byte $18 ; |   XX   | $1FE9
    .byte $18 ; |   XX   | $1FEA
    .byte $18 ; |   XX   | $1FEB
    .byte $18 ; |   XX   | $1FEC
    .byte $98 ; |X  XX   | $1FED
    .byte $18 ; |   XX   | $1FEE
    .byte $18 ; |   XX   | $1FEF

    .byte $00 ; |        | $1FF0
    .byte $00 ; |        | $1FF1
    .byte $00 ; |        | $1FF2
    .byte $00 ; |        | $1FF3
    .byte $00 ; |        | $1FF4
    .byte $00 ; |        | $1FF5
    .byte $00 ; |        | $1FF6
    .byte $00 ; |        | $1FF7
    .byte $00 ; |        | $1FF8
    .byte $00 ; |        | $1FF9

       ORG $1FFA

    .word START
    .word START
    .word START