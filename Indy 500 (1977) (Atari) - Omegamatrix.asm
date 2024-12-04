; Disassembly of indy500.bin
; Disassembled Fri Jun 12 01:26:38 2009
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcIndy.cfg indy500.bin
;
; Indy.cfg contents:
;
;      ORG F000
;      CODE F000 F63A
;      GFX F63B F7FF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
CTRLPF  =  $0A
REFP0   =  $0B
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
VDELP0  =  $25
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXP0FB  =  $32
CXM0FB  =  $34
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    ldx    #0                    ; 2
.loopClear:
    sta    0,X                   ; 4
    sta    SWCHA,X               ; 5
    inx                          ; 2
    bne    .loopClear            ; 2³

    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2

    jsr    LF1FF                 ; 6
    jsr    LF470                 ; 6
    jsr    LF246                 ; 6
LF020:
    jsr    LF096                 ; 6
    jsr    LF3E5                 ; 6
    lda    $BF                   ; 3
    and    #$3F                  ; 2
    bne    LF048                 ; 2³
    inc    $90                   ; 5
    lda    $A3                   ; 3
    beq    LF048                 ; 2³
    lda    $90                   ; 3
    cmp    #$40                  ; 2
    beq    LF043                 ; 2³
    bit    $81                   ; 3
    bvs    LF048                 ; 2³
    ldx    #1                    ; 2
    jsr    LF48D                 ; 6
    bne    LF048                 ; 2³
LF043:
    lda    #0                    ; 2
    jsr    LF474                 ; 6
LF048:
    lda    $A3                   ; 3
    beq    LF087                 ; 2³
    jsr    LF4F7                 ; 6
    jsr    LF2AC                 ; 6
    jsr    LF334                 ; 6
    jsr    LF568                 ; 6
    lda    $80                   ; 3
    cmp    #4                    ; 2
    bcc    LF06F                 ; 2³
    cmp    #$0A                  ; 2
    bcs    LF06F                 ; 2³
    cmp    #8                    ; 2
    bcs    LF078                 ; 2³
    jsr    LF59C                 ; 6
    jsr    LF496                 ; 6
    jmp    LF087                 ; 3

LF06F:
    jsr    LF59C                 ; 6
    jsr    LF41C                 ; 6
    jmp    LF087                 ; 3

LF078:
    jsr    LF5D1                 ; 6
    ldx    $95                   ; 3
    lda    $BF                   ; 3
    and    #$02                  ; 2
    beq    LF087                 ; 2³
    lda    #$FF                  ; 2
    sta    $C3,X                 ; 4
LF087:
    jsr    LF609                 ; 6
    jsr    LF0B5                 ; 6
    jsr    LF1BF                 ; 6
    jsr    LF217                 ; 6
    jmp    LF020                 ; 3

LF096:
    lda    INTIM                 ; 4
    bne    LF096                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$16                  ; 2
    sta    VSYNC                 ; 3
    sta    TIM8T                 ; 4
    inc    $BF                   ; 5
LF0A6:
    lda    INTIM                 ; 4
    bne    LF0A6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    rts                          ; 6

LF0B5:
    lda    #0                    ; 2
    sta    CXCLR                 ; 3
    sta    $A7                   ; 3
    sta    $88                   ; 3
    sta    $89                   ; 3
    lda    #2                    ; 2
    sta    CTRLPF                ; 3
    tsx                          ; 2
    stx    $A0                   ; 3
LF0C6:
    lda    INTIM                 ; 4
    bne    LF0C6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
LF0CF:
    inc    $A7                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $A7                   ; 3
    cmp    #2                    ; 2
    bcc    LF0CF                 ; 2³
LF0D9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $88                   ; 3
    sta    PF1                   ; 3
    ldy    $86                   ; 3
    lda    LF63B,Y               ; 4
    and    #$F0                  ; 2
    sta    $88                   ; 3
    ldy    $84                   ; 3
    lda    LF63B,Y               ; 4
    and    #$0F                  ; 2
    ora    $88                   ; 3
    sta    $88                   ; 3
    lda    $89                   ; 3
    sta    PF1                   ; 3
    ldy    $87                   ; 3
    lda    LF63B,Y               ; 4
    and    #$F0                  ; 2
    sta    $89                   ; 3
    ldy    $85                   ; 3
    lda    LF63B,Y               ; 4
    and    #$0F                  ; 2
    ora    $89                   ; 3
    sta    $89                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    inc    $A7                   ; 5
    lda    $A7                   ; 3
    cmp    #8                    ; 2
    bcs    LF12A                 ; 2³
    lda    $88                   ; 3
    sta    PF1                   ; 3
    inc    $84                   ; 5
    inc    $86                   ; 5
    inc    $85                   ; 5
    inc    $87                   ; 5
    lda    $89                   ; 3
    sta    PF1                   ; 3
    jmp    LF0D9                 ; 3

LF12A:
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    ($00,X)               ; 6
    lda    #$20                  ; 2
    sta    $A7                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
LF138:
    ldx    #$1E                  ; 2
    txs                          ; 2
    sec                          ; 2
    lda    $CD                   ; 3
    sbc    $A7                   ; 3
    and    #$FE                  ; 2
    tax                          ; 2
    and    $C3                   ; 3
    beq    LF14B                 ; 2³
    lda    #0                    ; 2
    beq    LF14D                 ; 3   always branch

LF14B:
    lda    $AF,X                 ; 4
LF14D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    clc                          ; 2
    lda    $98                   ; 3
    sbc    $A7                   ; 3
    and    #$F8                  ; 2
    php                          ; 3
    php                          ; 3
    lda    $A7                   ; 3
    bpl    LF160                 ; 2³
    eor    #$F8                  ; 2
LF160:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    inc    $84                   ; 5
    nop                          ; 2
    lda    $A7                   ; 3
    cmp    $D1                   ; 3
    bcc    LF16F                 ; 2³
    sta    ENABL                 ; 3
LF16F:
    lda    $CE                   ; 3
    sec                          ; 2
    sbc    $A7                   ; 3
    ora    #$01                  ; 2
    tax                          ; 2
    and    $C4                   ; 3
    beq    LF17F                 ; 2³
    lda    #0                    ; 2
    beq    LF181                 ; 3   always branch

LF17F:
    lda    $AF,X                 ; 4
LF181:
    sta    GRP1                  ; 3
    lda    ($D3),Y               ; 5
    sta    PF0                   ; 3
    lda    ($D5),Y               ; 5
    sta    PF1                   ; 3
    lda    ($D7),Y               ; 5
    sta    PF2                   ; 3
    clc                          ; 2
    lda    $A7                   ; 3
    adc    #2                    ; 2
    sta    $A7                   ; 3
    cmp    #$DE                  ; 2
    bcc    LF138                 ; 2³
    ldx    $A0                   ; 3
    txs                          ; 2
    lda    #$F0                  ; 2
    sta    $C3                   ; 3
    sta    $C4                   ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    sta    PF0                   ; 3
    lda    #$D2                  ; 2
    sta    TIM8T                 ; 4
    sta    VBLANK                ; 3
    rts                          ; 6

LF1BF:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF1E3                 ; 2³
    lda    #$FF                  ; 2
    sta    $A3                   ; 3
    lda    #0                    ; 2
    ldx    #$20                  ; 2
LF1CD:
    sta    $82,X                 ; 4
    dex                          ; 2
    bpl    LF1CD                 ; 2³
    lda    $BF                   ; 3
    and    #$01                  ; 2
    sta    $BF                   ; 3
    lda    #$60                  ; 2
    bit    $81                   ; 3
    bvs    LF1E0                 ; 2³
    sta    $83                   ; 3
LF1E0:
    lda    #0                    ; 2
    rts                          ; 6

LF1E3:
    lsr                          ; 2
    bcs    LF20F                 ; 2³+1
    lda    $C0                   ; 3
    bne    LF214                 ; 2³+1
    lda    #$1E                  ; 2
    sta    $C0                   ; 3
    lda    $80                   ; 3
    cmp    #$0D                  ; 2
    bcc    LF1F8                 ; 2³
    lda    #$FF                  ; 2
    sta    $80                   ; 3
LF1F8:
    inc    $80                   ; 5
    jsr    LF470                 ; 6
    sta    $83                   ; 3
LF1FF:
    sed                          ; 2
    clc                          ; 2
    lda    $80                   ; 3
    tax                          ; 2
    adc    #1                    ; 2
    sta    $82                   ; 3
    cld                          ; 2
    lda    LF66D,X               ; 4
    sta    $81                   ; 3
    rts                          ; 6

LF20F:
    lda    #0                    ; 2
    sta    $C0                   ; 3
    rts                          ; 6

LF214:
    dec    $C0                   ; 5
    rts                          ; 6

LF217:
    ldy    #$18                  ; 2
    sec                          ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    beq    LF227                 ; 2³
    lda    $81                   ; 3
    and    #$38                  ; 2
    lsr                          ; 2
    tay                          ; 2
LF227:
    ldx    #3                    ; 2
LF229:
    lda    LF7B8,Y               ; 4
    bit    $A3                   ; 3
    bvs    LF232                 ; 2³
    eor    $90                   ; 3
LF232:
    bcc    LF236                 ; 2³
    and    #$0F                  ; 2
LF236:
    sta    COLUP0,X              ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF229                 ; 2³
    lda    SWCHB                 ; 4
    and    #$03                  ; 2
    eor    #$03                  ; 2
    bne    LF246                 ; 2³
    rts                          ; 6

LF246:
    lda    LF6AC                 ; 4
    sta    $D3                   ; 3
    lda    #$F7                  ; 2
    sta    $D4                   ; 3
    sta    $D6                   ; 3
    sta    $D8                   ; 3
    lda    $81                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    cmp    #1                    ; 2
    bne    LF261                 ; 2³
    lda    LF6AD                 ; 4
    sta    $D3                   ; 3
LF261:
    lda    LF6A3,Y               ; 4
    tax                          ; 2
    lda    LF6AE,X               ; 4
    sta    $D5                   ; 3
    lda    LF6B2,Y               ; 4
    sta    $D7                   ; 3
    ldx    #6                    ; 2
    ldy    #6                    ; 2
    lda    $81                   ; 3
    and    #$02                  ; 2
    beq    LF27B                 ; 2³
    ldy    #$0D                  ; 2
LF27B:
    lda    LF78B,Y               ; 4
    sta    $CB,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF27B                 ; 2³
    inx                          ; 2
    jsr    LF537                 ; 6
    inx                          ; 2
    lda    $CC                   ; 3
    jsr    LF537                 ; 6
    ldx    #4                    ; 2
    lda    #$55                  ; 2
    jsr    LF537                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $80                   ; 3
    tay                          ; 2
    lda    LF6B7,Y               ; 4
    tay                          ; 2
    ldx    #3                    ; 2
LF2A2:
    lda    LF799,Y               ; 4
    sta    $C5,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF2A2                 ; 2³
    rts                          ; 6

LF2AC:
    ldx    #1                    ; 2
    lda    SWCHB                 ; 4
    sta    $AC                   ; 3
    lda    SWCHA                 ; 4
    bit    $81                   ; 3
    bvc    LF311                 ; 2³+1
LF2BA:
    and    #$03                  ; 2
    sta    $9E,X                 ; 4
    lda    INPT4,X               ; 4
    bpl    LF2D6                 ; 2³
    lda    $A8,X                 ; 4
    bne    LF31E                 ; 2³+1
    lda    $8A,X                 ; 4
    beq    LF2F0                 ; 2³
    dec    $8A,X                 ; 6
    lda    $C6                   ; 3
    sta    $A8,X                 ; 4
    jsr    LF329                 ; 6
    jmp    LF2F0                 ; 3

LF2D6:
    lda    $A8,X                 ; 4
    bne    LF31E                 ; 2³+1
    lda    $C7                   ; 3
    bit    $AC                   ; 3
    bmi    LF2E3                 ; 2³
    sec                          ; 2
    sbc    #2                    ; 2
LF2E3:
    cmp    $8A,X                 ; 4
    bcc    LF2F0                 ; 2³
    inc    $8A,X                 ; 6
    lda    $C5                   ; 3
    sta    $A8,X                 ; 4
    jsr    LF329                 ; 6
LF2F0:
    lda    $9E,X                 ; 4
    asl                          ; 2
    asl                          ; 2
    ora    $AA,X                 ; 4
    tay                          ; 2
    lda    $CF,X                 ; 4
    cmp    $A1,X                 ; 4
    bne    LF323                 ; 2³+1
    lda    LF7A9,Y               ; 4
    sta    $91,X                 ; 4
LF302:
    clc                          ; 2
    adc    $CF,X                 ; 4
    and    #$0F                  ; 2
    sta    $CF,X                 ; 4
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $AA,X                 ; 4
    jsr    LF3AD                 ; 6
LF311:
    asl    $AC                   ; 5
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    dex                          ; 2
    beq    LF2BA                 ; 2³+1
    rts                          ; 6

LF31E:
    dec    $A8,X                 ; 6
    jmp    LF2F0                 ; 3

LF323:
    lda    LF7A9,Y               ; 4
    jmp    LF302                 ; 3

LF329:
    lda    $8A,X                 ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LF69B,Y               ; 4
    sta    $8C,X                 ; 4
    rts                          ; 6

LF334:
    ldx    #1                    ; 2
LF336:
    lda    $8A,X                 ; 4
    and    #$08                  ; 2
    beq    LF33F                 ; 2³
    jsr    LF351                 ; 6
LF33F:
    lda    $8C,X                 ; 4
    sec                          ; 2
    bmi    LF345                 ; 2³
    clc                          ; 2
LF345:
    rol                          ; 2
    sta    $8C,X                 ; 4
    bcc    LF34D                 ; 2³
    jsr    LF351                 ; 6
LF34D:
    dex                          ; 2
    beq    LF336                 ; 2³
    rts                          ; 6

LF351:
    inc    $C9,X                 ; 6
    sta    HMCLR                 ; 3
    lda    $A1,X                 ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    and    #$03                  ; 2
    bne    LF364                 ; 2³
    lda    $C9,X                 ; 4
    and    #$03                  ; 2
    beq    LF3AC                 ; 2³
LF364:
    lda    $C9,X                 ; 4
    and    #$01                  ; 2
    beq    LF36C                 ; 2³
    lda    #$10                  ; 2
LF36C:
    ora    $A1,X                 ; 4
    tay                          ; 2
    lda    LF67B,Y               ; 4
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    sec                          ; 2
    sbc    #8                    ; 2
    sta    $AE                   ; 3
    clc                          ; 2
    adc    $CD,X                 ; 4
    sta    $CD,X                 ; 4
    bit    $AE                   ; 3
    bmi    LF38C                 ; 2³
    cmp    #$E8                  ; 2
    bcc    LF392                 ; 2³
    lda    #$2E                  ; 2
    bne    LF392                 ; 3   always branch

LF38C:
    cmp    #$28                  ; 2
    bcs    LF392                 ; 2³
    lda    #$DD                  ; 2
LF392:
    sta    $CD,X                 ; 4
    sta    VDELP0,X              ; 4
    lda    LF67B,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #8                    ; 2
    bcc    LF3A4                 ; 2³
    ora    #$F0                  ; 2
    clc                          ; 2
LF3A4:
    adc    $CB,X                 ; 4
    sta    $CB,X                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF3AC:
    rts                          ; 6

LF3AD:
    lda    $8A,X                 ; 4
    cmp    $C8                   ; 3
    bcc    LF3DD                 ; 2³
    lda    $93,X                 ; 4
    bne    LF3E2                 ; 2³
    lda    $CF,X                 ; 4
    cmp    $A1,X                 ; 4
    beq    LF3D4                 ; 2³
    lda    $91,X                 ; 4
    bmi    LF3D8                 ; 2³
    inc    $A1,X                 ; 6
LF3C3:
    lda    $A1,X                 ; 4
    and    #$0F                  ; 2
    sta    $A1,X                 ; 4
    lda    $80                   ; 3
    cmp    #$0A                  ; 2
    lda    $8A,X                 ; 4
    bcs    LF3D5                 ; 2³
    lsr                          ; 2
LF3D2:
    sta    $93,X                 ; 4
LF3D4:
    rts                          ; 6

LF3D5:
    asl                          ; 2
    bne    LF3D2                 ; 2³
LF3D8:
    dec    $A1,X                 ; 6
    jmp    LF3C3                 ; 3

LF3DD:
    lda    $CF,X                 ; 4
    sta    $A1,X                 ; 4
    rts                          ; 6

LF3E2:
    dec    $93,X                 ; 6
    rts                          ; 6

LF3E5:
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    $CF,X                 ; 4
    sta    REFP0,X               ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    cmp    #$3F                  ; 2
    clc                          ; 2
    bmi    LF3F9                 ; 2³
    sec                          ; 2
    eor    #$47                  ; 2
LF3F9:
    tay                          ; 2
    stx    $9D                   ; 3
    txa                          ; 2
    eor    #$0E                  ; 2
    tax                          ; 2
LF400:
    txa                          ; 2
    and    #$01                  ; 2
    beq    LF40D                 ; 2³
    bit    $81                   ; 3
    bvs    LF40D                 ; 2³
    lda    #0                    ; 2
    beq    LF410                 ; 3   always branch

LF40D:
    lda    LF6DF,Y               ; 4
LF410:
    sta    $AF,X                 ; 4
    bcc    LF416                 ; 2³
    dey                          ; 2
    dey                          ; 2
LF416:
    iny                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF400                 ; 2³
    rts                          ; 6

LF41C:
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    $96,X                 ; 4
    asl                          ; 2
    bpl    LF464                 ; 2³
    lda    $CD,X                 ; 4
    cmp    #$80                  ; 2
    lda    #0                    ; 2
    bcs    LF430                 ; 2³
    lda    #1                    ; 2
LF430:
    sta    $9D                   ; 3
    lda    $CB,X                 ; 4
    cmp    #$CD                  ; 2
    lda    $9D                   ; 3
    bcc    LF43C                 ; 2³
    ora    #$02                  ; 2
LF43C:
    tay                          ; 2
    lda    LF6A8,Y               ; 4
    ora    $8E,X                 ; 4
    sta    $8E,X                 ; 4
    cmp    #$0F                  ; 2
    bne    LF463                 ; 2³
    lda    CXP0FB,X              ; 4
    and    #$40                  ; 2
    beq    LF46B                 ; 2³
    lda    $96,X                 ; 4
    bmi    LF463                 ; 2³
    lda    #$C6                  ; 2
    sta    $96,X                 ; 4
    sta    $CB,X                 ; 4
    lda    #0                    ; 2
    sta    $8E,X                 ; 4
    jsr    LF47F                 ; 6
    cmp    #$25                  ; 2
    beq    LF470                 ; 2³
LF463:
    rts                          ; 6

LF464:
    lda    CXP0FB,X              ; 4
    and    #$40                  ; 2
    sta    $96,X                 ; 4
    rts                          ; 6

LF46B:
    lda    #$40                  ; 2
    sta    $96,X                 ; 4
    rts                          ; 6

LF470:
    lda    #0                    ; 2
    sta    $98                   ; 3
LF474:
    sta    $A3                   ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $90                   ; 3
    sta    $BF                   ; 3
    rts                          ; 6

LF47F:
    lda    #0                    ; 2
    sta    $90                   ; 3
    sed                          ; 2
    clc                          ; 2
    lda    $82,X                 ; 4
    adc    #1                    ; 2
LF489:
    sta    $82,X                 ; 4
    cld                          ; 2
    rts                          ; 6

LF48D:
    sed                          ; 2
    lda    $83                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    jmp    LF489                 ; 3

LF496:
    sta    HMCLR                 ; 3
    lda    $8E                   ; 3
    beq    LF4EF                 ; 2³
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    CXM0FB,X              ; 4
    bmi    LF4DF                 ; 2³
    lda    $99,X                 ; 4
    bne    LF4E6                 ; 2³
    lda    CXM0P,X               ; 4
    asl                          ; 2
    bpl    LF4B1                 ; 2³
    jsr    LF4B2                 ; 6
LF4B1:
    rts                          ; 6

LF4B2:
    lda    #8                    ; 2
    sta    $99,X                 ; 4
    jsr    LF47F                 ; 6
    cmp    #$50                  ; 2
    beq    LF4E9                 ; 2³
    lda    $BF                   ; 3
LF4BF:
    and    #$7F                  ; 2
    adc    #$40                  ; 2
    sta    $98                   ; 3
    eor    $AF,X                 ; 4
    and    #$7F                  ; 2
    adc    #$10                  ; 2
LF4CB:
    sta    $D2                   ; 3
    sta    $8E                   ; 3
    ldx    #2                    ; 2
    pha                          ; 3
    jsr    LF537                 ; 6
    inx                          ; 2
    pla                          ; 4
    jsr    LF537                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LF4DF:
    lda    $BF                   ; 3
    adc    #$0A                  ; 2
    jmp    LF4BF                 ; 3

LF4E6:
    dec    $99,X                 ; 6
    rts                          ; 6

LF4E9:
    lda    #0                    ; 2
    jsr    LF474                 ; 6
    rts                          ; 6

LF4EF:
    lda    #$84                  ; 2
    sta    $98                   ; 3
    lda    #$56                  ; 2
    bne    LF4CB                 ; 2³
LF4F7:
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    stx    $9D                   ; 3
    lda    $9B,X                 ; 4
    bne    LF533                 ; 2³
    lda    $99,X                 ; 4
    bne    LF52F                 ; 2³
    lda    $8A,X                 ; 4
    lsr                          ; 2
    tay                          ; 2
    bne    LF519                 ; 2³
    lda    $C1,X                 ; 4
    beq    LF515                 ; 2³
    dec    $C1,X                 ; 6
    jmp    LF51D                 ; 3

LF515:
    ldy    #6                    ; 2
    bne    LF51D                 ; 3   always branch

LF519:
    lda    #$3F                  ; 2
    sta    $C1,X                 ; 4
LF51D:
    lda    LF6D7,Y               ; 4
    sta    AUDV0,X               ; 4
LF522:
    lda    LF6C5,Y               ; 4
    ora    $9D                   ; 3
    sta    AUDF0,X               ; 4
    lda    LF6CE,Y               ; 4
    sta    AUDC0,X               ; 4
    rts                          ; 6

LF52F:
    ldy    #7                    ; 2
    bne    LF51D                 ; 3   always branch

LF533:
    ldy    #8                    ; 2
    bne    LF522                 ; 3   always branch

LF537:
    clc                          ; 2
    adc    #$31                  ; 2
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    pla                          ; 4
    and    #$0F                  ; 2
    sty    $9D                   ; 3
    clc                          ; 2
    adc    $9D                   ; 3
    cmp    #$0E                  ; 2
    bcc    LF550                 ; 2³
    sec                          ; 2
    sbc    #$0E                  ; 2
    iny                          ; 2
LF550:
    cmp    #8                    ; 2
    eor    #$0F                  ; 2
    bcs    LF559                 ; 2³
    adc    #1                    ; 2
    dey                          ; 2
LF559:
    iny                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
LF560:
    dey                          ; 2
    bne    LF560                 ; 2³
    sta    RESP0,X               ; 4
    sta    HMP0,X                ; 4
    rts                          ; 6

LF568:
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    CXP0FB,X              ; 4
    bpl    LF58B                 ; 2³
    lda    $81                   ; 3
    and    #$02                  ; 2
    bne    LF590                 ; 2³
    lda    $A4,X                 ; 4
    bne    LF590                 ; 2³
    inc    $A4,X                 ; 6
    lda    #0                    ; 2
    sta    $8A,X                 ; 4
    jsr    LF329                 ; 6
    lda    #$0F                  ; 2
    sta    $9B,X                 ; 4
    sta    AUDV0,X               ; 4
LF58A:
    rts                          ; 6

LF58B:
    lda    #0                    ; 2
    sta    $A4,X                 ; 4
    rts                          ; 6

LF590:
    lda    #2                    ; 2
    cmp    $8A,X                 ; 4
    bcs    LF58A                 ; 2³
    lsr    $8A,X                 ; 6
    jsr    LF329                 ; 6
    rts                          ; 6

LF59C:
    lda    CXPPMM                ; 3
    bpl    LF5CC                 ; 2³
    lda    $A6                   ; 3
    bne    LF5CB                 ; 2³
    inc    $A6                   ; 5
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    inc    $CF,X                 ; 6
    inc    $A1,X                 ; 6
    lsr    $8A,X                 ; 6
    jsr    LF329                 ; 6
    txa                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    dec    $CF,X                 ; 6
    dec    $A1,X                 ; 6
    lsr    $8A,X                 ; 6
    jsr    LF329                 ; 6
    lda    #$0F                  ; 2
    sta    $9B                   ; 3
    sta    $9C                   ; 3
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
LF5CB:
    rts                          ; 6

LF5CC:
    lda    #0                    ; 2
    sta    $A6                   ; 3
    rts                          ; 6

LF5D1:
    lda    $99                   ; 3
    ora    $9A                   ; 3
    bne    LF5EF                 ; 2³
    lda    CXPPMM                ; 3
    bmi    LF5FB                 ; 2³
    lda    $BF                   ; 3
    and    #$3F                  ; 2
    bne    LF5EA                 ; 2³
    ldx    $95                   ; 3
    jsr    LF47F                 ; 6
    cmp    #$99                  ; 2
    beq    LF5EB                 ; 2³
LF5EA:
    rts                          ; 6

LF5EB:
    jsr    LF470                 ; 6
    rts                          ; 6

LF5EF:
    lda    #0                    ; 2
    ldx    $AD                   ; 3
    sta    $8A,X                 ; 4
    jsr    LF329                 ; 6
    dec    $99,X                 ; 6
    rts                          ; 6

LF5FB:
    lda    $95                   ; 3
    sta    $AD                   ; 3
    tax                          ; 2
    eor    #$01                  ; 2
    sta    $95                   ; 3
    lda    #$3F                  ; 2
    sta    $99,X                 ; 4
    rts                          ; 6

LF609:
    lda    $BF                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    $9B,X                 ; 4
    beq    LF619                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    sta    AUDV0,X               ; 4
    sta    $9B,X                 ; 4
LF619:
    ldx    #1                    ; 2
LF61B:
    lda    $82,X                 ; 4
    and    #$0F                  ; 2
    sta    $9D                   ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $9D                   ; 3
    sta    $84,X                 ; 4
    lda    $82,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $9D                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $9D                   ; 3
    sta    $86,X                 ; 4
    dex                          ; 2
    beq    LF61B                 ; 2³
    rts                          ; 6

LF63B:
    .byte $0E ; |    XXX | $F63B
    .byte $0A ; |    X X | $F63C
    .byte $0A ; |    X X | $F63D
    .byte $0A ; |    X X | $F63E
    .byte $0E ; |    XXX | $F63F
    .byte $22 ; |  X   X | $F640
    .byte $22 ; |  X   X | $F641
    .byte $22 ; |  X   X | $F642
    .byte $22 ; |  X   X | $F643
    .byte $22 ; |  X   X | $F644
    .byte $EE ; |XXX XXX | $F645
    .byte $22 ; |  X   X | $F646
    .byte $EE ; |XXX XXX | $F647
    .byte $88 ; |X   X   | $F648
    .byte $EE ; |XXX XXX | $F649
    .byte $EE ; |XXX XXX | $F64A
    .byte $22 ; |  X   X | $F64B
    .byte $66 ; | XX  XX | $F64C
    .byte $22 ; |  X   X | $F64D
    .byte $EE ; |XXX XXX | $F64E
    .byte $AA ; |X X X X | $F64F
    .byte $AA ; |X X X X | $F650
    .byte $EE ; |XXX XXX | $F651
    .byte $22 ; |  X   X | $F652
    .byte $22 ; |  X   X | $F653
    .byte $EE ; |XXX XXX | $F654
    .byte $88 ; |X   X   | $F655
    .byte $EE ; |XXX XXX | $F656
    .byte $22 ; |  X   X | $F657
    .byte $EE ; |XXX XXX | $F658
    .byte $EE ; |XXX XXX | $F659
    .byte $88 ; |X   X   | $F65A
    .byte $EE ; |XXX XXX | $F65B
    .byte $AA ; |X X X X | $F65C
    .byte $EE ; |XXX XXX | $F65D
    .byte $EE ; |XXX XXX | $F65E
    .byte $22 ; |  X   X | $F65F
    .byte $22 ; |  X   X | $F660
    .byte $22 ; |  X   X | $F661
    .byte $22 ; |  X   X | $F662
    .byte $EE ; |XXX XXX | $F663
    .byte $AA ; |X X X X | $F664
    .byte $EE ; |XXX XXX | $F665
    .byte $AA ; |X X X X | $F666
    .byte $EE ; |XXX XXX | $F667
    .byte $EE ; |XXX XXX | $F668
    .byte $AA ; |X X X X | $F669
    .byte $EE ; |XXX XXX | $F66A
    .byte $22 ; |  X   X | $F66B
    .byte $EE ; |XXX XXX | $F66C
LF66D:
    .byte $48 ; | X  X   | $F66D
    .byte $08 ; |    X   | $F66E
    .byte $D1 ; |XX X   X| $F66F
    .byte $91 ; |X  X   X| $F670
    .byte $5A ; | X XX X | $F671
    .byte $1A ; |   XX X | $F672
    .byte $DB ; |XX XX XX| $F673
    .byte $9B ; |X  XX XX| $F674
    .byte $62 ; | XX   X | $F675
    .byte $E3 ; |XXX   XX| $F676
    .byte $6C ; | XX XX  | $F677
    .byte $2C ; |  X XX  | $F678
    .byte $E8 ; |XXX X   | $F679
    .byte $A8 ; |X X X   | $F67A
LF67B:
    .byte $F8 ; |XXXXX   | $F67B
    .byte $F7 ; |XXXX XXX| $F67C
    .byte $F6 ; |XXXX XX | $F67D
    .byte $06 ; |     XX | $F67E
    .byte $06 ; |     XX | $F67F
    .byte $06 ; |     XX | $F680
    .byte $16 ; |   X XX | $F681
    .byte $17 ; |   X XXX| $F682
    .byte $18 ; |   XX   | $F683
    .byte $19 ; |   XX  X| $F684
    .byte $1A ; |   XX X | $F685
    .byte $0A ; |    X X | $F686
    .byte $0A ; |    X X | $F687
    .byte $0A ; |    X X | $F688
    .byte $FA ; |XXXXX X | $F689
    .byte $F9 ; |XXXXX  X| $F68A
    .byte $F8 ; |XXXXX   | $F68B
    .byte $F7 ; |XXXX XXX| $F68C
    .byte $F6 ; |XXXX XX | $F68D
    .byte $F6 ; |XXXX XX | $F68E
    .byte $06 ; |     XX | $F68F
    .byte $16 ; |   X XX | $F690
    .byte $16 ; |   X XX | $F691
    .byte $17 ; |   X XXX| $F692
    .byte $18 ; |   XX   | $F693
    .byte $19 ; |   XX  X| $F694
    .byte $1A ; |   XX X | $F695
    .byte $1A ; |   XX X | $F696
    .byte $0A ; |    X X | $F697
    .byte $FA ; |XXXXX X | $F698
    .byte $FA ; |XXXXX X | $F699
    .byte $F9 ; |XXXXX  X| $F69A
LF69B:
    .byte $00 ; |        | $F69B
    .byte $01 ; |       X| $F69C
    .byte $11 ; |   X   X| $F69D
    .byte $25 ; |  X  X X| $F69E
    .byte $55 ; | X X X X| $F69F
    .byte $DA ; |XX XX X | $F6A0
    .byte $EE ; |XXX XXX | $F6A1
    .byte $EF ; |XXX XXXX| $F6A2
LF6A3:
    .byte $00 ; |        | $F6A3
    .byte $03 ; |      XX| $F6A4
    .byte $00 ; |        | $F6A5
    .byte $02 ; |      X | $F6A6
    .byte $01 ; |       X| $F6A7
LF6A8:
    .byte $08 ; |    X   | $F6A8
    .byte $01 ; |       X| $F6A9
    .byte $04 ; |     X  | $F6AA
    .byte $02 ; |      X | $F6AB
LF6AC:
    .byte $1B ; |   XX XX| $F6AC
LF6AD:
    .byte $1C ; |   XXX  | $F6AD
LF6AE:
    .byte $28 ; |  X X   | $F6AE
    .byte $34 ; |  XX X  | $F6AF
    .byte $3A ; |  XXX X | $F6B0
    .byte $46 ; | X   XX | $F6B1
LF6B2:
    .byte $51 ; | X X   X| $F6B2
    .byte $5D ; | X XXX X| $F6B3
    .byte $69 ; | XX X  X| $F6B4
    .byte $6F ; | XX XXXX| $F6B5
    .byte $7B ; | XXXX XX| $F6B6
LF6B7:
    .byte $03 ; |      XX| $F6B7
    .byte $03 ; |      XX| $F6B8
    .byte $0B ; |    X XX| $F6B9
    .byte $0B ; |    X XX| $F6BA
    .byte $03 ; |      XX| $F6BB
    .byte $03 ; |      XX| $F6BC
    .byte $0B ; |    X XX| $F6BD
    .byte $0B ; |    X XX| $F6BE
    .byte $03 ; |      XX| $F6BF
    .byte $0B ; |    X XX| $F6C0
    .byte $07 ; |     XXX| $F6C1
    .byte $07 ; |     XXX| $F6C2
    .byte $0F ; |    XXXX| $F6C3
    .byte $0F ; |    XXXX| $F6C4
LF6C5:
    .byte $0E ; |    XXX | $F6C5
    .byte $08 ; |    X   | $F6C6
    .byte $06 ; |     XX | $F6C7
    .byte $04 ; |     X  | $F6C8
    .byte $1A ; |   XX X | $F6C9
    .byte $18 ; |   XX   | $F6CA
    .byte $0F ; |    XXXX| $F6CB
    .byte $00 ; |        | $F6CC
    .byte $37 ; |  XX XXX| $F6CD
LF6CE:
    .byte $02 ; |      X | $F6CE
    .byte $02 ; |      X | $F6CF
    .byte $02 ; |      X | $F6D0
    .byte $02 ; |      X | $F6D1
    .byte $07 ; |     XXX| $F6D2
    .byte $07 ; |     XXX| $F6D3
    .byte $02 ; |      X | $F6D4
    .byte $0A ; |    X X | $F6D5
    .byte $08 ; |    X   | $F6D6
LF6D7:
    .byte $0C ; |    XX  | $F6D7
    .byte $0C ; |    XX  | $F6D8
    .byte $0C ; |    XX  | $F6D9
    .byte $09 ; |    X  X| $F6DA
    .byte $06 ; |     XX | $F6DB
    .byte $08 ; |    X   | $F6DC
    .byte $06 ; |     XX | $F6DD
    .byte $0A ; |    X X | $F6DE
LF6DF:
    .byte $EE ; |XXX XXX | $F6DF
    .byte $EE ; |XXX XXX | $F6E0
    .byte $44 ; | X   X  | $F6E1
    .byte $7F ; | XXXXXXX| $F6E2
    .byte $7F ; | XXXXXXX| $F6E3
    .byte $44 ; | X   X  | $F6E4
    .byte $EE ; |XXX XXX | $F6E5
    .byte $EE ; |XXX XXX | $F6E6
    .byte $18 ; |   XX   | $F6E7
    .byte $D8 ; |XX XX   | $F6E8
    .byte $CB ; |XX  X XX| $F6E9
    .byte $5E ; | X XXXX | $F6EA
    .byte $7E ; | XXXXXX | $F6EB
    .byte $64 ; | XX  X  | $F6EC
    .byte $36 ; |  XX XX | $F6ED
    .byte $36 ; |  XX XX | $F6EE
    .byte $30 ; |  XX    | $F6EF
    .byte $32 ; |  XX  X | $F6F0
    .byte $CC ; |XX  XX  | $F6F1
    .byte $DC ; |XX XXX  | $F6F2
    .byte $3B ; |  XXX XX| $F6F3
    .byte $33 ; |  XX  XX| $F6F4
    .byte $0C ; |    XX  | $F6F5
    .byte $0C ; |    XX  | $F6F6
    .byte $04 ; |     X  | $F6F7
    .byte $CC ; |XX  XX  | $F6F8
    .byte $F8 ; |XXXXX   | $F6F9
    .byte $1F ; |   XXXXX| $F6FA
    .byte $DB ; |XX XX XX| $F6FB
    .byte $F0 ; |XXXX    | $F6FC
    .byte $3E ; |  XXXXX | $F6FD
    .byte $06 ; |     XX | $F6FE
    .byte $18 ; |   XX   | $F6FF
    .byte $DB ; |XX XX XX| $F700
    .byte $FF ; |XXXXXXXX| $F701
    .byte $DB ; |XX XX XX| $F702
    .byte $18 ; |   XX   | $F703
    .byte $DB ; |XX XX XX| $F704
    .byte $FF ; |XXXXXXXX| $F705
    .byte $C3 ; |XX    XX| $F706
    .byte $20 ; |  X     | $F707
    .byte $33 ; |  XX  XX| $F708
    .byte $1F ; |   XXXXX| $F709
    .byte $F8 ; |XXXXX   | $F70A
    .byte $DB ; |XX XX XX| $F70B
    .byte $0F ; |    XXXX| $F70C
    .byte $7C ; | XXXXX  | $F70D
    .byte $60 ; | XX     | $F70E
    .byte $0C ; |    XX  | $F70F
    .byte $4C ; | X  XX  | $F710
    .byte $33 ; |  XX  XX| $F711
    .byte $3B ; |  XXX XX| $F712
    .byte $DC ; |XX XXX  | $F713
    .byte $CC ; |XX  XX  | $F714
    .byte $30 ; |  XX    | $F715
    .byte $30 ; |  XX    | $F716
    .byte $18 ; |   XX   | $F717
    .byte $1B ; |   XX XX| $F718
    .byte $D3 ; |XX X  XX| $F719
    .byte $7A ; | XXXX X | $F71A
    .byte $3E ; |  XXXXX | $F71B
    .byte $26 ; |  X  XX | $F71C
    .byte $6C ; | XX XX  | $F71D
    .byte $6C ; | XX XX  | $F71E
    .byte $F0 ; |XXXX    | $F71F
    .byte $F0 ; |XXXX    | $F720
    .byte $70 ; | XXX    | $F721
    .byte $30 ; |  XX    | $F722
    .byte $30 ; |  XX    | $F723
    .byte $30 ; |  XX    | $F724
    .byte $30 ; |  XX    | $F725
    .byte $30 ; |  XX    | $F726
    .byte $30 ; |  XX    | $F727
    .byte $30 ; |  XX    | $F728
    .byte $30 ; |  XX    | $F729
    .byte $30 ; |  XX    | $F72A
    .byte $F0 ; |XXXX    | $F72B
    .byte $FF ; |XXXXXXXX| $F72C
    .byte $00 ; |        | $F72D
    .byte $00 ; |        | $F72E
    .byte $00 ; |        | $F72F
    .byte $00 ; |        | $F730
    .byte $00 ; |        | $F731
    .byte $00 ; |        | $F732
    .byte $01 ; |       X| $F733
    .byte $01 ; |       X| $F734
    .byte $01 ; |       X| $F735
    .byte $01 ; |       X| $F736
    .byte $01 ; |       X| $F737
    .byte $FF ; |XXXXXXXX| $F738
    .byte $00 ; |        | $F739
    .byte $00 ; |        | $F73A
    .byte $00 ; |        | $F73B
    .byte $00 ; |        | $F73C
    .byte $00 ; |        | $F73D
    .byte $00 ; |        | $F73E
    .byte $00 ; |        | $F73F
    .byte $00 ; |        | $F740
    .byte $00 ; |        | $F741
    .byte $00 ; |        | $F742
    .byte $00 ; |        | $F743
    .byte $03 ; |      XX| $F744
    .byte $03 ; |      XX| $F745
    .byte $00 ; |        | $F746
    .byte $00 ; |        | $F747
    .byte $00 ; |        | $F748
    .byte $00 ; |        | $F749
    .byte $FF ; |XXXXXXXX| $F74A
    .byte $00 ; |        | $F74B
    .byte $00 ; |        | $F74C
    .byte $00 ; |        | $F74D
    .byte $00 ; |        | $F74E
    .byte $00 ; |        | $F74F
    .byte $03 ; |      XX| $F750
    .byte $00 ; |        | $F751
    .byte $00 ; |        | $F752
    .byte $00 ; |        | $F753
    .byte $00 ; |        | $F754
    .byte $FF ; |XXXXXXXX| $F755
    .byte $E0 ; |XXX     | $F756
    .byte $C0 ; |XX      | $F757
    .byte $80 ; |X       | $F758
    .byte $00 ; |        | $F759
    .byte $00 ; |        | $F75A
    .byte $00 ; |        | $F75B
    .byte $01 ; |       X| $F75C
    .byte $03 ; |      XX| $F75D
    .byte $07 ; |     XXX| $F75E
    .byte $FF ; |XXXXXXXX| $F75F
    .byte $FF ; |XXXXXXXX| $F760
    .byte $FF ; |XXXXXXXX| $F761
    .byte $00 ; |        | $F762
    .byte $00 ; |        | $F763
    .byte $00 ; |        | $F764
    .byte $00 ; |        | $F765
    .byte $00 ; |        | $F766
    .byte $FF ; |XXXXXXXX| $F767
    .byte $E0 ; |XXX     | $F768
    .byte $C0 ; |XX      | $F769
    .byte $80 ; |X       | $F76A
    .byte $80 ; |X       | $F76B
    .byte $80 ; |X       | $F76C
    .byte $F0 ; |XXXX    | $F76D
    .byte $00 ; |        | $F76E
    .byte $00 ; |        | $F76F
    .byte $00 ; |        | $F770
    .byte $00 ; |        | $F771
    .byte $00 ; |        | $F772
    .byte $00 ; |        | $F773
    .byte $00 ; |        | $F774
    .byte $00 ; |        | $F775
    .byte $00 ; |        | $F776
    .byte $00 ; |        | $F777
    .byte $00 ; |        | $F778
    .byte $80 ; |X       | $F779
    .byte $80 ; |X       | $F77A
    .byte $00 ; |        | $F77B
    .byte $00 ; |        | $F77C
    .byte $00 ; |        | $F77D
    .byte $00 ; |        | $F77E
    .byte $FF ; |XXXXXXXX| $F77F
    .byte $00 ; |        | $F780
    .byte $00 ; |        | $F781
    .byte $00 ; |        | $F782
    .byte $00 ; |        | $F783
    .byte $00 ; |        | $F784
    .byte $00 ; |        | $F785
    .byte $00 ; |        | $F786
    .byte $00 ; |        | $F787
    .byte $00 ; |        | $F788
    .byte $07 ; |     XXX| $F789
    .byte $FF ; |XXXXXXXX| $F78A
LF78B:
    .byte $86 ; |X    XX | $F78B
    .byte $86 ; |X    XX | $F78C
    .byte $C0 ; |XX      | $F78D
    .byte $D2 ; |XX X  X | $F78E
    .byte $08 ; |    X   | $F78F
    .byte $08 ; |    X   | $F790
    .byte $80 ; |X       | $F791
    .byte $1C ; |   XXX  | $F792
    .byte $88 ; |X   X   | $F793
    .byte $CA ; |XX  X X | $F794
    .byte $44 ; | X   X  | $F795
    .byte $00 ; |        | $F796
    .byte $08 ; |    X   | $F797
    .byte $FF ; |XXXXXXXX| $F798
LF799:
    .byte $0F ; |    XXXX| $F799
    .byte $07 ; |     XXX| $F79A
    .byte $08 ; |    X   | $F79B
    .byte $05 ; |     X X| $F79C
    .byte $1F ; |   XXXXX| $F79D
    .byte $0F ; |    XXXX| $F79E
    .byte $08 ; |    X   | $F79F
    .byte $03 ; |      XX| $F7A0
    .byte $08 ; |    X   | $F7A1
    .byte $04 ; |     X  | $F7A2
    .byte $0A ; |    X X | $F7A3
    .byte $0F ; |    XXXX| $F7A4
    .byte $18 ; |   XX   | $F7A5
    .byte $0A ; |    X X | $F7A6
    .byte $08 ; |    X   | $F7A7
    .byte $03 ; |      XX| $F7A8
LF7A9:
    .byte $00 ; |        | $F7A9
    .byte $FF ; |XXXXXXXX| $F7AA
    .byte $01 ; |       X| $F7AB
    .byte $00 ; |        | $F7AC
    .byte $01 ; |       X| $F7AD
    .byte $00 ; |        | $F7AE
    .byte $00 ; |        | $F7AF
    .byte $FF ; |XXXXXXXX| $F7B0
    .byte $FF ; |XXXXXXXX| $F7B1
    .byte $00 ; |        | $F7B2
    .byte $00 ; |        | $F7B3
    .byte $01 ; |       X| $F7B4
    .byte $00 ; |        | $F7B5
    .byte $01 ; |       X| $F7B6
    .byte $FF ; |XXXXXXXX| $F7B7
LF7B8:
    .byte $00 ; |        | $F7B8
    .byte $DA ; |XX XX X | $F7B9
    .byte $3A ; |  XXX X | $F7BA
    .byte $27 ; |  X  XXX| $F7BB
    .byte $74 ; | XXX X  | $F7BC
    .byte $5A ; | X XX X | $F7BD
    .byte $98 ; |X  XX   | $F7BE
    .byte $36 ; |  XX XX | $F7BF
    .byte $E4 ; |XXX  X  | $F7C0
    .byte $7A ; | XXXX X | $F7C1
    .byte $E8 ; |XXX X   | $F7C2
    .byte $2A ; |  X X X | $F7C3
    .byte $33 ; |  XX  XX| $F7C4
    .byte $EA ; |XXX X X | $F7C5
    .byte $9A ; |X  XX X | $F7C6
    .byte $46 ; | X   XX | $F7C7
    .byte $00 ; |        | $F7C8
    .byte $16 ; |   X XX | $F7C9
    .byte $66 ; | XX  XX | $F7CA
    .byte $98 ; |X  XX   | $F7CB
    .byte $09 ; |    X  X| $F7CC
    .byte $0F ; |    XXXX| $F7CD
    .byte $00 ; |        | $F7CE
    .byte $08 ; |    X   | $F7CF
    .byte $0A ; |    X X | $F7D0
    .byte $11 ; |   X   X| $F7D1
    .byte $77 ; | XXX XXX| $F7D2
    .byte $77 ; | XXX XXX| $F7D3
    .byte $05 ; |     X X| $F7D4
    .byte $22 ; |  X   X | $F7D5
    .byte $44 ; | X   X  | $F7D6
    .byte $11 ; |   X   X| $F7D7
    .byte $11 ; |   X   X| $F7D8
    .byte $11 ; |   X   X| $F7D9
    .byte $55 ; | X X X X| $F7DA
    .byte $11 ; |   X   X| $F7DB
    .byte $55 ; | X X X X| $F7DC
    .byte $11 ; |   X   X| $F7DD
    .byte $05 ; |     X X| $F7DE
    .byte $22 ; |  X   X | $F7DF
    .byte $77 ; | XXX XXX| $F7E0
    .byte $33 ; |  XX  XX| $F7E1
    .byte $77 ; | XXX XXX| $F7E2
    .byte $77 ; | XXX XXX| $F7E3
    .byte $77 ; | XXX XXX| $F7E4
    .byte $11 ; |   X   X| $F7E5
    .byte $77 ; | XXX XXX| $F7E6
    .byte $77 ; | XXX XXX| $F7E7
    .byte $05 ; |     X X| $F7E8
    .byte $22 ; |  X   X | $F7E9
    .byte $11 ; |   X   X| $F7EA
    .byte $11 ; |   X   X| $F7EB
    .byte $55 ; | X X X X| $F7EC
    .byte $44 ; | X   X  | $F7ED
    .byte $44 ; | X   X  | $F7EE
    .byte $11 ; |   X   X| $F7EF
    .byte $55 ; | X X X X| $F7F0
    .byte $55 ; | X X X X| $F7F1
    .byte $07 ; |     XXX| $F7F2
    .byte $22 ; |  X   X | $F7F3
    .byte $77 ; | XXX XXX| $F7F4
    .byte $77 ; | XXX XXX| $F7F5
    .byte $55 ; | X X X X| $F7F6
    .byte $77 ; | XXX XXX| $F7F7
    .byte $77 ; | XXX XXX| $F7F8
    .byte $77 ; | XXX XXX| $F7F9
    .byte $77 ; | XXX XXX| $F7FA
    .byte $77 ; | XXX XXX| $F7FB

       ORG $F7FC

    .word START,START
