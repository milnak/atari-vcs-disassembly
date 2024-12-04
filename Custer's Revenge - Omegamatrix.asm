; Rough Disassembly of Custer's Revenge
; by Omegamatrix
; Using DiStella v3.0
;
;
; Command Line: distella.exe -pasfcCusPAL.cfg CUS4.bin > CusterRev(PAL).asm
;
; CusPAL.cfg contents:
;
;      ORG 3000
;      CODE 3000 3758
;      GFX 3759 3762
;      CODE 3763 38E6
;      GFX 38E7 3FFF
;
; Command Line: distella -pasfcCusNTSC.cfg cusRntsc.bin > CusterRev(NTSC).asm
;
; CusNTSC.cfg contents:
;
;      ORG 3000
;      CODE 3000 3744
;      GFX 3745 374E
;      CODE 374F 38D2
;      GFX 38D3 3FFF


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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
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
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER SWITCHES AND CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PAL         = 0
NTSC        = 1

  IF PAL
UNK_01                  = $BD
UNK_02                  = $48
UNK_03                  = $43
UNK_04                  = $B3
UNK_05                  = $6A
UNK_06                  = $78

COL_01                  = $68
COL_02                  = $B8
COL_03                  = $64
COL_04                  = $38
COL_05                  = $C8


  ELSE NTSC
UNK_01                  = $8D
UNK_02                  = $38
UNK_03                  = $23
UNK_04                  = $83
UNK_05                  = $38
UNK_06                  = $D8

COL_01                  = $48
COL_02                  = $88
COL_03                  = $54
COL_04                  = $E8
COL_05                  = $78

  ENDIF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Note that the PAL rom was disassembled first. The labels, and the
; branches across page boundaries (2³+1) apply to it specifically.
; Also note the verified PAL rom only has 264 scanlines, but did indeed come
; from a PAL cart. The NTSC rom is a little short on scanlines; running at
; 258 scanlines itself.


       ORG $3000

START:
    jmp    L3035                 ; 3
L3003:
    jsr    L336A                 ; 6
    inc    $8C                   ; 5
    lda    $8C                   ; 3
    and    #$01                  ; 2
    beq    L3010                 ; 2³
    inc    $B3                   ; 5
L3010:
    jsr    L388C                 ; 6
    jsr    L36F0                 ; 6
    jsr    L30A5                 ; 6
    jsr    L3817                 ; 6
    jmp    L308C                 ; 3
L301F:
    jsr    L385B                 ; 6
L3022:
    jsr    L3182                 ; 6
    jsr    L3622                 ; 6
    jsr    L38DB                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    jsr    L33B3                 ; 6
    jmp    L3003                 ; 3

L3035:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    lda    #0                    ; 2
L303D:
    sta    VSYNC,X               ; 4
    inx                          ; 2
    bne    L303D                 ; 2³
    sta    SWACNT                ; 4
    sta    SWBCNT                ; 4
    lda    #$30                  ; 2
    sta    $B8                   ; 3
L304C:
    ldy    #0                    ; 2
    lda    ($B7),Y               ; 5
    clc                          ; 2
    adc    $B9                   ; 3
    sta    $B9                   ; 3
    inc    $B7                   ; 5
    bne    L304C                 ; 2³
    inc    $B8                   ; 5
    lda    $B8                   ; 3
    cmp    #$40                  ; 2
    bne    L304C                 ; 2³
    lda    L3F24                 ; 4
    cmp    $B9                   ; 3
    bne    L3081                 ; 2³
    lda    #$1C                  ; 2
    sta    $A3                   ; 3
    lda    #$2D                  ; 2
    sta    $DA                   ; 3
    lda    #UNK_01               ; 2
    sta    $D9                   ; 3
    lda    #$A0                  ; 2
    sta    $D5                   ; 3
    sta    $DC                   ; 3
    lda    #0                    ; 2
    sta    $E6                   ; 3
    jmp    L3003                 ; 3
L3081:
    lda    #9                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDV0                 ; 3
    jmp    START                 ; 3
L308C:
    lda    $D2                   ; 3
    beq    L309E                 ; 2³
    dec    $D5                   ; 5
    bne    L301F                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
    lda    #$A0                  ; 2
    sta    $D5                   ; 3
    sta    $D4                   ; 3
L309E:
    lda    $D9                   ; 3
    sta    $A5                   ; 3
    jmp    L3022                 ; 3
L30A5:
    lda    $8F                   ; 3
    cmp    #2                    ; 2
    bcs    L3104                 ; 2³+1
    lda    $A4                   ; 3
    sbc    #$0F                  ; 2
    sta    $88                   ; 3
    sta    $A0                   ; 3
    sta    $A1                   ; 3
    sta    $A2                   ; 3
    lsr    $84                   ; 5
    bcc    L30C2                 ; 2³
    clc                          ; 2
    lda    #$10                  ; 2
    adc    $A0                   ; 3
    sta    $A0                   ; 3
L30C2:
    lsr    $84                   ; 5
    bcc    L30CD                 ; 2³
    clc                          ; 2
    lda    #$20                  ; 2
    adc    $A1                   ; 3
    sta    $A1                   ; 3
L30CD:
    lsr    $84                   ; 5
    bcc    L30D8                 ; 2³
    clc                          ; 2
    lda    #$40                  ; 2
    adc    $A2                   ; 3
    sta    $A2                   ; 3
L30D8:
    lda    $A3                   ; 3
    sec                          ; 2
    sbc    $88                   ; 3
    and    #$F8                  ; 2
    beq    L3105                 ; 2³+1
    ldx    $E7                   ; 3
    lda    $B1,X                 ; 4
    and    #$03                  ; 2
    beq    L3104                 ; 2³+1
    lda    $A3                   ; 3
    sec                          ; 2
    sbc    $A0                   ; 3
    and    #$F8                  ; 2
    beq    L3105                 ; 2³+1
    lda    $A3                   ; 3
    sec                          ; 2
    sbc    $A1                   ; 3
    and    #$F8                  ; 2
    beq    L3105                 ; 2³+1
    lda    $A3                   ; 3
    sec                          ; 2
    sbc    $A2                   ; 3
    and    #$F8                  ; 2
    beq    L3105                 ; 2³
L3104:
    rts                          ; 6

L3105:
    lda    #$FF                  ; 2
    sta    $8A                   ; 3
    lda    #$0F                  ; 2
    sta    $89                   ; 3
    lda    #$57                  ; 2
    sta    $8F                   ; 3
    rts                          ; 6

L3112:
    ldx    $E7                   ; 3
    lda    INPT4,X               ; 4
    sta    $DD                   ; 3
    jmp    L3138                 ; 3
L311B:
    lda    #0                    ; 2
    sta    $CE                   ; 3
    jmp    L31C9                 ; 3
L3122:
    lda    $B0                   ; 3
    beq    L312A                 ; 2³
    bit    $DB                   ; 3
    bpl    L3135                 ; 2³
L312A:
    lda    #$FF                  ; 2
    sta    $D8                   ; 3
    lda    $CD                   ; 3
    beq    L313C                 ; 2³
    jmp    L3166                 ; 3
L3135:
    jmp    L3112                 ; 3
L3138:
    bit    $DD                   ; 3
    bmi    L319B                 ; 2³
L313C:
    lda    #$60                  ; 2
    sta    $C5                   ; 3
    lda    #$20                  ; 2
    sta    $C6                   ; 3
    lda    #UNK_02               ; 2
    sta    $AA                   ; 3
    lda    $DC                   ; 3
    bne    L3163                 ; 2³
    lda    $CC                   ; 3
    cmp    #4                    ; 2
    bne    L3158                 ; 2³
    lda    #0                    ; 2
    sta    $C9                   ; 3
    sta    $C7                   ; 3
L3158:
    lda    #8                    ; 2
    sta    $CC                   ; 3
    bit    $CD                   ; 3
    bpl    L317C                 ; 2³
L3160:
    sec                          ; 2
    ror    $CD                   ; 5
L3163:
    jmp    L31DA                 ; 3
L3166:
    lda    #8                    ; 2
    sta    $CE                   ; 3
    dec    $C0                   ; 5
    lda    $C0                   ; 3
    ldx    $E7                   ; 3
    and    $B4,X                 ; 4
    bne    L3163                 ; 2³
    dec    $A3                   ; 5
    jmp    L31BB                 ; 3
L3179:
    jmp    L311B                 ; 3
L317C:
    jsr    L3763                 ; 6
    jmp    L3160                 ; 3
L3182:
    jmp    L328E                 ; 3
L3185:
    lda    $A3                   ; 3
    cmp    #$86                  ; 2
    beq    L3122                 ; 2³
    lda    $D8                   ; 3
    bne    L3166                 ; 2³
    lda    $B0                   ; 3
    beq    L31A7                 ; 2³
    lda    $DB                   ; 3
    bne    L31A7                 ; 2³
    lda    $DC                   ; 3
    bne    L3179                 ; 2³
L319B:
    ldx    $E7                   ; 3
    lda    $C2,X                 ; 4
    sta    $DD                   ; 3
    bit    $DD                   ; 3
    bvc    L3166                 ; 2³
    bmi    L3179                 ; 2³
L31A7:
    lda    $A3                   ; 3
    cmp    #$86                  ; 2
    beq    L31C9                 ; 2³
    lda    #0                    ; 2
    sta    $CE                   ; 3
    inc    $C0                   ; 5
    lda    $C0                   ; 3
    and    $B4,X                 ; 4
    bne    L31DA                 ; 2³
    inc    $A3                   ; 5
L31BB:
    lda    $A3                   ; 3
    and    #$01                  ; 2
    bne    L31DA                 ; 2³
    lda    $A3                   ; 3
    and    #$06                  ; 2
    cmp    #6                    ; 2
    bne    L31CF                 ; 2³
L31C9:
    lda    #0                    ; 2
    sta    $CD                   ; 3
    lda    #2                    ; 2
L31CF:
    clc                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    sta    $C5                   ; 3
    lda    #0                    ; 2
    sta    $C6                   ; 3
L31DA:
    lda    $A3                   ; 3
    cmp    #$1C                  ; 2
    bcs    L31EA                 ; 2³
    lda    $D8                   ; 3
    beq    L31E8                 ; 2³
    lda    #0                    ; 2
    sta    $D8                   ; 3
L31E8:
    lda    #$1C                  ; 2
L31EA:
    sta    $A3                   ; 3
    lda    #$3B                  ; 2
    sta    $91                   ; 3
    lda    #$3C                  ; 2
    sta    $93                   ; 3
    lda    $C5                   ; 3
    sta    $90                   ; 3
    lda    $C6                   ; 3
    sta    $92                   ; 3
    lda    $A5                   ; 3
    sta    COLUBK                ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    sta    COLUP1                ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #7                    ; 2
    sta    $81                   ; 3
    lda    #6                    ; 2
    sta    $83                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    ldx    $85                   ; 3
    bit    $D0                   ; 3
    bpl    L3223                 ; 2³
    inx                          ; 2
L3223:
    inx                          ; 2
    cpx    #$3F                  ; 2
    bcc    L322A                 ; 2³
    ldx    #$10                  ; 2
L322A:
    stx    $85                   ; 3
    lda    $DC                   ; 3
    bne    L3249                 ; 2³
    lda    $D2                   ; 3
    bne    L3249                 ; 2³
    bit    $D0                   ; 3
    bmi    L3249                 ; 2³
    lda    $8C                   ; 3
    ldx    $E7                   ; 3
    and    $B1,X                 ; 4
    bne    L3260                 ; 2³
    ldx    $8F                   ; 3
    dec    $A4                   ; 5
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L325E                 ; 2³
L3249:
    ldx    #$57                  ; 2
    inc    $8E                   ; 5
    lda    $8C                   ; 3
    adc    $8E                   ; 3
    and    #$3F                  ; 2
    tay                          ; 2
    lda    L3D38,Y               ; 4
    sta    $A4                   ; 3
    lda    L3D78,Y               ; 4
    sta    $84                   ; 3
L325E:
    stx    $8F                   ; 3
L3260:
    ldx    $E7                   ; 3
    lda    $B1,X                 ; 4
    and    #$03                  ; 2
    beq    L326A                 ; 2³
    lda    $84                   ; 3
L326A:
    sta    NUSIZ1                ; 3
    lda    $A4                   ; 3
    cmp    #$10                  ; 2
    bcs    L3274                 ; 2³
    lda    #$B0                  ; 2
L3274:
    sta    $A4                   ; 3
    ldx    #1                    ; 2
    jsr    L3396                 ; 6
    lda    #$A8                  ; 2
    ldx    #4                    ; 2
    jsr    L3396                 ; 6
    lda    #0                    ; 2
    sta    $80                   ; 3
    lda    #$14                  ; 2
    ldx    #0                    ; 2
    jsr    L3396                 ; 6
    rts                          ; 6

L328E:
    lda    $B0                   ; 3
    beq    L32AA                 ; 2³
    lda    $DB                   ; 3
    bne    L32AA                 ; 2³
    lda    $D4                   ; 3
    bne    L32CF                 ; 2³
L329A:
    lda    $D0                   ; 3
    bne    L32F4                 ; 2³
    lda    $D3                   ; 3
    bne    L32E4                 ; 2³
    lda    $8A                   ; 3
    bne    L32AD                 ; 2³
    bit    CXP0FB                ; 3
    bmi    L32C2                 ; 2³
L32AA:
    jmp    L3185                 ; 3
L32AD:
    lda    #$A0                  ; 2
    sta    $D6                   ; 3
    lda    #$80                  ; 2
    sta    $D7                   ; 3
    sta    $D3                   ; 3
L32B7:
    lda    #$FF                  ; 2
    sta    $D2                   ; 3
    lda    #0                    ; 2
    sta    $8A                   ; 3
    jmp    L31C9                 ; 3
L32C2:
    lda    #$E0                  ; 2
    sta    $D6                   ; 3
    lda    #$C0                  ; 2
    sta    $D7                   ; 3
    sta    $D3                   ; 3
    jmp    L32B7                 ; 3
L32CF:
    lda    #0                    ; 2
    sta    $C9                   ; 3
    sta    $C7                   ; 3
    sta    $CF                   ; 3
    sta    $D4                   ; 3
    lda    #6                    ; 2
    sta    $CC                   ; 3
    lda    #$80                  ; 2
    sta    $CD                   ; 3
    jmp    L329A                 ; 3
L32E4:
    lda    $CE                   ; 3
    beq    L3317                 ; 2³+1
    lda    #0                    ; 2
L32EA:
    sta    $CE                   ; 3
    lda    #$80                  ; 2
    sta    $D0                   ; 3
    lda    $D6                   ; 3
    sta    $C5                   ; 3
L32F4:
    inc    $D1                   ; 5
    lda    $D1                   ; 3
    cmp    #$20                  ; 2
    bne    L3306                 ; 2³+1
    lda    #0                    ; 2
    sta    $D1                   ; 3
    lda    $D7                   ; 3
    sta    $C5                   ; 3
    inc    $CF                   ; 5
L3306:
    lda    $CF                   ; 3
    cmp    #8                    ; 2
    beq    L331C                 ; 2³
    and    #$01                  ; 2
    beq    L3314                 ; 2³
    lda    $D6                   ; 3
    sta    $C5                   ; 3
L3314:
    jmp    L31DA                 ; 3
L3317:
    lda    #8                    ; 2
    jmp    L32EA                 ; 3
L331C:
    lda    #0                    ; 2
    sta    $CF                   ; 3
    sta    $D1                   ; 3
    sta    $D0                   ; 3
    sta    $D4                   ; 3
    sta    $8A                   ; 3
    sta    $D3                   ; 3
    sta    $CD                   ; 3
    ldx    $E7                   ; 3
    dec    $E8,X                 ; 6
    lda    $E8,X                 ; 4
    bne    L335A                 ; 2³
    lda    $DE                   ; 3
    ror                          ; 2
    bcc    L3348                 ; 2³
    lda    $DE                   ; 3
    and    #$02                  ; 2
    sta    $DE                   ; 3
    lda    $E7                   ; 3
    eor    #$01                  ; 2
    sta    $E7                   ; 3
    jmp    L31E8                 ; 3
L3348:
    lda    #3                    ; 2
    sta    $E8                   ; 3
    sta    $E9                   ; 3
    lda    #$FF                  ; 2
    sta    $DB                   ; 3
    lda    #UNK_04               ; 2
    sta    $D9                   ; 3
    lda    #UNK_03               ; 2
    sta    $DA                   ; 3
L335A:
    lda    $DE                   ; 3
    ror                          ; 2
    bcc    L3367                 ; 2³
    inc    $E7                   ; 5
    lda    $E7                   ; 3
    and    #$01                  ; 2
    sta    $E7                   ; 3
L3367:
    jmp    L31E8                 ; 3
L336A:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    lda    #$27                  ; 2
    sta    TIM64T                ; 4
    rts                          ; 6

L3388:
    ldx    #0                    ; 2
    jmp    L3394                 ; 3

    ldx    #1                    ; 2
    jmp    L3394                 ; 3
    ldx    #4                    ; 2

L3394:
    lda    $A3,X                 ; 4
L3396:
    clc                          ; 2
    adc    #1                    ; 2
    ldy    #0                    ; 2
    sec                          ; 2
L339C:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    L339C                 ; 2³
    eor    #$FF                  ; 2
    sbc    #6                    ; 2
    asl                          ; 2
    sta    WSYNC                 ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
L33AD:
    dey                          ; 2
    bne    L33AD                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

L33B3:
    lda    INTIM                 ; 4
    bne    L33B3                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    ldx    #$4F                  ; 2
L33C4:
    txa                          ; 2
    sec                          ; 2
    sbc    $8F                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    L33D1                 ; 2³
    lda    #0                    ; 2
    beq    L33D4                 ; 2³
L33D1:
    lda    L3D28,Y               ; 4
L33D4:
    sta    WSYNC                 ; 3
    sta    GRP1                  ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L3CE0,Y               ; 4
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    cpx    #$30                  ; 2
    bcs    L33C4                 ; 2³
    lda    #$26                  ; 2
    sta    COLUPF                ; 3
L33EF:
    txa                          ; 2
    sec                          ; 2
    sbc    $85                   ; 3
    tay                          ; 2
    and    #$F8                  ; 2
    beq    L33FC                 ; 2³
    lda    #0                    ; 2
    beq    L33FF                 ; 2³
L33FC:
    lda    L3C48,Y               ; 4
L33FF:
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $8F                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    L3410                 ; 2³
    lda    #0                    ; 2
    beq    L3413                 ; 2³
L3410:
    lda    L3D28,Y               ; 4
L3413:
    sta    GRP1                  ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$10                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L3CE8,Y               ; 4
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    cpx    #$10                  ; 2
    bcs    L33EF                 ; 2³+1
    lda    #COL_01               ; 2
    sta    COLUP0                ; 3
    lda    $DA                   ; 3
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
L3436:
    txa                          ; 2
    sec                          ; 2
    sbc    #0                    ; 2
    tay                          ; 2
    and    #$F8                  ; 2
    beq    L3443                 ; 2³
    lda    #0                    ; 2
    beq    L3446                 ; 2³
L3443:
    lda    L3C40,Y               ; 4
L3446:
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $8F                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    L3457                 ; 2³
    lda    #0                    ; 2
    beq    L345A                 ; 2³
L3457:
    lda    L3D28,Y               ; 4
L345A:
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    L3436                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$20                  ; 2
    sta    CTRLPF                ; 3
    lda    #COL_02               ; 2
    sta    COLUP0                ; 3
    lda    #COL_03               ; 2
    sta    COLUP1                ; 3
    lda    #COL_04               ; 2
    sta    COLUPF                ; 3
    lda    #2                    ; 2
    sta    ENABL                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    lda    #5                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$3C                  ; 2
    sta    TIM8T                 ; 4
    jsr    L3388                 ; 6
    ldx    #1                    ; 2
    lda    #$94                  ; 2
    jsr    L3396                 ; 6
    lda    $CE                   ; 3
    sta    REFP0                 ; 3
L3494:
    lda    INTIM                 ; 4
    bne    L3494                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
L349D:
    lda    $80                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    ($90),Y               ; 5
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    lda    $8B                   ; 3
    beq    L34B0                 ; 2³
    lda    L3CF0,X               ; 4
L34B0:
    sta    PF0                   ; 3
    lda    ($92),Y               ; 5
    sta    GRP1                  ; 3
    dec    $83                   ; 5
    bne    L34CC                 ; 2³
    dec    $81                   ; 5
    ldx    $81                   ; 3
    lda    $A8,X                 ; 4
    sta    COLUP0                ; 3
    lda    L3D10,X               ; 4
    sta    COLUP1                ; 3
    lda    L3D20,X               ; 4
    sta    $83                   ; 3
L34CC:
    inc    $80                   ; 5
    inc    $80                   ; 5
    lda    $80                   ; 3
    sta    WSYNC                 ; 3
    eor    #$40                  ; 2
    bne    L349D                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    PF0                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    ldx    #7                    ; 2
L34E6:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    L34E6                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    jsr    L35CC                 ; 6

  IF PAL
    lda    #8                    ; 2
    sta    TIM64T                ; 4
  ENDIF

    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bit    $C4                   ; 3
    bpl    L351D                 ; 2³
    lda    $B0                   ; 3
    beq    L351D                 ; 2³
    lda    $DB                   ; 3
    beq    L3518                 ; 2³
    ldy    #0                    ; 2
    jmp    L3527                 ; 3
L3518:
    ldy    $E7                   ; 3
    jmp    L3527                 ; 3
L351D:
    jsr    L37E6                 ; 6
    lda    #COL_05               ; 2
    sta    COLUBK                ; 3
    jmp    L352C                 ; 3
L3527:
    lda.wy $A6,Y                 ; 4
    sta    COLUBK                ; 3
L352C:
    jsr    L3790                 ; 6

  IF PAL
L352F:
    lda    INTIM                 ; 4
    bne    L352F                 ; 2³
  ENDIF

    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    jsr    L35EB                 ; 6
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3

  IF PAL
    lda    #8                    ; 2
    sta    TIM64T                ; 4
  ENDIF

    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    #$26                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bit    $C4                   ; 3
    bpl    L3577                 ; 2³
    lda    $B0                   ; 3
    beq    L3577                 ; 2³
    lda    $DB                   ; 3
    beq    L3589                 ; 2³
    lda    $E6                   ; 3
    and    #$01                  ; 2
    beq    L3577                 ; 2³
    ldy    #1                    ; 2
    lda.wy $A6,Y                 ; 4
    sta    COLUBK                ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    L3790                 ; 6
    jmp    L3598                 ; 3
L3577:
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    #$2D                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$78                  ; 2
    jsr    L35C0                 ; 6
    jmp    L3598                 ; 3
L3589:
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    ldx    $E7                   ; 3
    lda    $A6,X                 ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    L37F5                 ; 6

L3598:
  IF PAL
    lda    INTIM                 ; 4
    bne    L3598                 ; 2³
  ENDIF

    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    jsr    L35EB                 ; 6
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    ldx    #$17                  ; 2
L35BA:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    L35BA                 ; 2³
    rts                          ; 6

L35C0:
    ldx    #$0A                  ; 2
    sec                          ; 2
L35C3:
    sta    $94,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L35C3                 ; 2³
    rts                          ; 6

L35CC:
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    ldy    #7                    ; 2
    sta    WSYNC                 ; 3
L35DE:
    dey                          ; 2
    bne    L35DE                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    rts                          ; 6

L35EB:
    lda    #6                    ; 2
    sta    $87                   ; 3
L35EF:
    ldy    $87                   ; 3
    lda    ($94),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    lda    ($96),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($98),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9A),Y               ; 5
    sta    $86                   ; 3
    lda    ($9C),Y               ; 5
    tax                          ; 2
    lda    ($9E),Y               ; 5
    tay                          ; 2
    lda    $86                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    $87                   ; 5
    bpl    L35EF                 ; 2³+1
    sta    WSYNC                 ; 3
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    rts                          ; 6

L3622:
    lda    SWCHA                 ; 4
    sta    $C2                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $C3                   ; 3
    lda    SWCHB                 ; 4
    sta    $C1                   ; 3
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    sta    $C4                   ; 3
    bit    $C4                   ; 3
    bpl    L365A                 ; 2³
    bvc    L365D                 ; 2³
    lda    $DB                   ; 3
    bne    L3645                 ; 2³
    lda    $B0                   ; 3
    bne    L3649                 ; 2³
L3645:
    bit    INPT4                 ; 3
    bpl    L365D                 ; 2³
L3649:
    lda    #0                    ; 2
    sta    $DF                   ; 3
    sta    $B6                   ; 3
    lda    $DB                   ; 3
    beq    L3659                 ; 2³
    lda    #0                    ; 2
    sta    $B1                   ; 3
    sta    $B2                   ; 3
L3659:
    rts                          ; 6

L365A:
    jmp    L36C9                 ; 3
L365D:
    jmp    L3660                 ; 3
L3660:
    lda    $E6                   ; 3
    sta    $DE                   ; 3
    lda    $DC                   ; 3
    bne    L3670                 ; 2³
    lda    #0                    ; 2
    sta    $CC                   ; 3
    sta    $C9                   ; 3
    sta    $C7                   ; 3
L3670:
    lda    #$FF                  ; 2
    sta    $B0                   ; 3
    sta    $DC                   ; 3
    lda    #$2D                  ; 2
    sta    $DA                   ; 3
    lda    #UNK_01               ; 2
    sta    $D9                   ; 3
    lda    #$1C                  ; 2
    sta    $A3                   ; 3
    lda    #3                    ; 2
    sta    $E8                   ; 3
    sta    $E9                   ; 3
    lda    #3                    ; 2
    sta    $82                   ; 3
    sta    $B1                   ; 3
    sta    $B2                   ; 3
    bit    $C1                   ; 3
    bvs    L3696                 ; 2³
    lsr    $B1                   ; 5
L3696:
    bit    $C1                   ; 3
    bmi    L369C                 ; 2³
    lsr    $B2                   ; 5
L369C:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    $EE                   ; 3
    sta    $EF                   ; 3
    sta    $EC                   ; 3
    sta    $ED                   ; 3
    sta    $EA                   ; 3
    sta    $EB                   ; 3
    sta    $DB                   ; 3
    sta    $E7                   ; 3
    sta    $E5                   ; 3
    sta    $E3                   ; 3
    sta    $E4                   ; 3
    sta    $8A                   ; 3
    sta    $D0                   ; 3
    sta    $D2                   ; 3
    sta    $D3                   ; 3
    sta    $D4                   ; 3
    sta    $CF                   ; 3
    sta    $D1                   ; 3
    lda    #$A0                  ; 2
    sta    $D5                   ; 3
    rts                          ; 6

L36C9:
    inc    $B6                   ; 5
    lda    $B6                   ; 3
    and    #$3F                  ; 2
    beq    L36D5                 ; 2³
    lda    $DF                   ; 3
    bne    L36EF                 ; 2³
L36D5:
    inc    $E6                   ; 5
    lda    #0                    ; 2
    sta    $DC                   ; 3
    sta    $B0                   ; 3
    sta    $DB                   ; 3
    sta    $C9                   ; 3
    sta    $C7                   ; 3
    lda    #$1C                  ; 2
    sta    $DF                   ; 3
    lda    #UNK_04               ; 2
    sta    $D9                   ; 3
    lda    #UNK_03               ; 2
    sta    $DA                   ; 3
L36EF:
    rts                          ; 6

L36F0:
    bit    $DC                   ; 3
    bmi    L370C                 ; 2³+1
    lda    $B0                   ; 3
    beq    L3750                 ; 2³+1
    lda    $DB                   ; 3
    bne    L3750                 ; 2³+1
    lda    $D2                   ; 3
    bne    L3750                 ; 2³
    bit    $CD                   ; 3
    bmi    L370C                 ; 2³
    lda    $C7                   ; 3
    bne    L370C                 ; 2³
    lda    #4                    ; 2
    sta    $CC                   ; 3
L370C:
    ldx    $CC                   ; 3
    lda    L3759,X               ; 4
    sta    $CA                   ; 3
    lda    L375A,X               ; 4
    sta    $CB                   ; 3
    lda    $C7                   ; 3
    bne    L3727                 ; 2³
    bit    $C9                   ; 3
    bmi    L3758                 ; 2³
    sec                          ; 2
    ror    $C9                   ; 5
    sta    $C8                   ; 3
    bcc    L3736                 ; 2³
L3727:
    dec    $C7                   ; 5
    bne    L3758                 ; 2³
    lda    #4                    ; 2
    sta    AUDV0                 ; 3
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
L3736:
    ldy    $C8                   ; 3
    ldx    #0                    ; 2
L373A:
    lda    ($CA),Y               ; 5
    sta    AUDC0,X               ; 4
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #6                    ; 2
    bne    L373A                 ; 2³
    lda    ($CA),Y               ; 5
    iny                          ; 2
    sty    $C8                   ; 3
    sta    $C7                   ; 3
    cmp    #0                    ; 2
    bne    L3758                 ; 2³
L3750:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    $C9                   ; 3
    sta    $DC                   ; 3
L3758:
    rts                          ; 6

L3759:
    .byte $00 ; |        | $3759
L375A:
    .byte $3E ; |  XXXXX | $375A
    .byte $90 ; |X  X    | $375B
    .byte $3E ; |  XXXXX | $375C
    .byte $C0 ; |XX      | $375D
    .byte $3E ; |  XXXXX | $375E
    .byte $E4 ; |XXX  X  | $375F
    .byte $3E ; |  XXXXX | $3760
    .byte $08 ; |    X   | $3761
    .byte $3F ; |  XXXXXX| $3762
L3763:
    lda    $DB                   ; 3
    bne    L378F                 ; 2³
    ldx    #0                    ; 2
    lda    $E7                   ; 3
    beq    L376E                 ; 2³
    inx                          ; 2
L376E:
    sed                          ; 2
    clc                          ; 2
    lda    $EE,X                 ; 4
    adc    #1                    ; 2
    sta    $EE,X                 ; 4
    lda    $EC,X                 ; 4
    adc    #0                    ; 2
    sta    $EC,X                 ; 4
    jmp    L3785                 ; 3

    lda    $EA,X                 ; 4
    adc    #0                    ; 2
    sta    $EA,X                 ; 4

L3785:
    cld                          ; 2
    lda    #0                    ; 2
    sta    $EA                   ; 3
    sta    $EB                   ; 3
    jsr    L389F                 ; 6
L378F:
    rts                          ; 6

L3790:
    lda    #0                    ; 2
    tax                          ; 2
    sta    $E0                   ; 3
L3795:
    stx    $E1                   ; 3
    lda.wy $EA,Y                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    beq    L37A3                 ; 2³
    inc    $E0                   ; 5
L37A3:
    lda    $E0                   ; 3
    bne    L37A9                 ; 2³
    ldx    #$0A                  ; 2
L37A9:
    lda    L3DC0,X               ; 4
    ldx    $E1                   ; 3
    sta    $94,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    stx    $E1                   ; 3
    lda.wy $EA,Y                 ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    beq    L37BE                 ; 2³
    inc    $E0                   ; 5
L37BE:
    lda    $E0                   ; 3
    bne    L37C4                 ; 2³
    ldx    #$0A                  ; 2
L37C4:
    lda    L3DC0,X               ; 4
    ldx    $E1                   ; 3
    sta    $94,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpy    #6                    ; 2
    bcc    L3795                 ; 2³
    lda    $E0                   ; 3
    bne    L37DB                 ; 2³
    lda    #$90                  ; 2
    sta    $9E                   ; 3
L37DB:
    lda    #$3C                  ; 2
    ldx    #$0A                  ; 2
L37DF:
    sta    $95,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L37DF                 ; 2³
    rts                          ; 6

L37E6:
    lda    $E6                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    inx                          ; 2
    stx    $EE                   ; 3
    lda    #0                    ; 2
    sta    $EC                   ; 3
    sta    $EA                   ; 3
    rts                          ; 6

L37F5:
    ldx    #$0A                  ; 2
    lda    #$88                  ; 2
L37F9:
    sta    $94,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    L37F9                 ; 2³
    lda    $E7                   ; 3
    beq    L3808                 ; 2³
    ldy    $E9                   ; 3
    jmp    L380A                 ; 3
L3808:
    ldy    $E8                   ; 3
L380A:
    dey                          ; 2
L380B:
    beq    L3816                 ; 2³
    lda    #$80                  ; 2
    sta    $A0,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bne    L380B                 ; 2³
L3816:
    rts                          ; 6

L3817:
    lda    $B0                   ; 3
    beq    L3825                 ; 2³
    lda    $DB                   ; 3
    bne    L3825                 ; 2³
    lda    $E6                   ; 3
    and    #$02                  ; 2
    beq    L3842                 ; 2³
L3825:
    lda    $8C                   ; 3
    bne    L383E                 ; 2³
    inc    $8D                   ; 5
    lda    $8D                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    jmp    L383F                 ; 3

    lda    $A3                   ; 3
    tay                          ; 2
    cmp    #$4F                  ; 2
    bcc    L383F                 ; 2³
    cpy    #$6A                  ; 2
    bcs    L383F                 ; 2³
L383E:
    rts                          ; 6

L383F:
    lda    L3DB8,X               ; 4
L3842:
    sta    $8B                   ; 3
    jmp    L383E                 ; 3
L3847:
    lda    #$0F                  ; 2
    jmp    L3873                 ; 3
L384C:
    lda    #8                    ; 2
    jmp    L3873                 ; 3
L3851:
    lda    #4                    ; 2
    jmp    L3873                 ; 3
L3856:
    lda    #2                    ; 2
    jmp    L3873                 ; 3
L385B:
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $D5                   ; 3
    cmp    #$60                  ; 2
    bcs    L3847                 ; 2³
    cmp    #$50                  ; 2
    bcs    L384C                 ; 2³
    cmp    #$30                  ; 2
    bcs    L3851                 ; 2³
    cmp    #$20                  ; 2
    bcs    L3856                 ; 2³
    lda    #0                    ; 2
L3873:
    sta    AUDV1                 ; 3
    lda    $8C                   ; 3
    sta    AUDF1                 ; 3
    and    #$07                  ; 2
    bne    L388B                 ; 2³
    lda    $8C                   ; 3
    and    #$08                  ; 2
    beq    L3887                 ; 2³
    lda    #UNK_01               ; 2
    bne    L3889                 ; 2³
L3887:
    lda    #UNK_05               ; 2
L3889:
    sta    $A5                   ; 3
L388B:
    rts                          ; 6

L388C:
    ldx    #7                    ; 2
L388E:
    lda    L3D00,X               ; 4
    sta    $A8,X                 ; 4
    dex                          ; 2
    bpl    L388E                 ; 2³
    lda    #UNK_02               ; 2
    sta    $A6                   ; 3
    lda    #UNK_06               ; 2
    sta    $A7                   ; 3
    rts                          ; 6

L389F:
    inc    $E3,X                 ; 6
    lda    $E3,X                 ; 4
    cmp    #$32                  ; 2
    bne    L38CC                 ; 2³
    lda    #0                    ; 2
    sta    $E3,X                 ; 4
    jsr    L38CD                 ; 6
    lda    #$1C                  ; 2
    sta    $A3                   ; 3
    jsr    L311B                 ; 6
    lda    $8C                   ; 3
    and    #$3F                  ; 2
    tay                          ; 2
    lda    L3D38,Y               ; 4
    sta    $A4                   ; 3
    lda    L3D78,Y               ; 4
    sta    $84                   ; 3
    lda    #$57                  ; 2
    sta    $8F                   ; 3
    ldx    $E7                   ; 3
    lsr    $B1,X                 ; 6
L38CC:
    rts                          ; 6

L38CD:
    ldx    $E7                   ; 3
    clc                          ; 2
    lda    $E8,X                 ; 4
    adc    #1                    ; 2
    cmp    #7                    ; 2
    beq    L38DA                 ; 2³
    sta    $E8,X                 ; 4
L38DA:
    rts                          ; 6

L38DB:
    ldx    $E7                   ; 3
    lda    $B1,X                 ; 4
    cmp    #7                    ; 2
    bne    L38E4                 ; 2³
    lsr                          ; 2
L38E4:
    sta    $B4,X                 ; 4
    rts                          ; 6


  IF PAL
    REPEAT ($3B00 - *)
      .byte $00
    REPEND

  ELSE NTSC
    REPEAT ($3B00 - *)
      .byte $30
    REPEND
  ENDIF


       ORG $3B00

    .byte $00 ; |        | $3B00
    .byte $28 ; |  X X   | $3B01
    .byte $38 ; |  XXX   | $3B02
    .byte $38 ; |  XXX   | $3B03
    .byte $FE ; |XXXXXXX | $3B04
    .byte $38 ; |  XXX   | $3B05
    .byte $3C ; |  XXXX  | $3B06
    .byte $34 ; |  XX X  | $3B07
    .byte $30 ; |  XX    | $3B08
    .byte $1C ; |   XXX  | $3B09
    .byte $70 ; | XXX    | $3B0A
    .byte $90 ; |X  X    | $3B0B
    .byte $30 ; |  XX    | $3B0C
    .byte $78 ; | XXXX   | $3B0D
    .byte $FD ; |XXXXXX X| $3B0E
    .byte $BF ; |X XXXXXX| $3B0F
    .byte $B8 ; |X XXX   | $3B10
    .byte $F8 ; |XXXXX   | $3B11
    .byte $38 ; |  XXX   | $3B12
    .byte $78 ; | XXXX   | $3B13
    .byte $78 ; | XXXX   | $3B14
    .byte $7F ; | XXXXXXX| $3B15
    .byte $38 ; |  XXX   | $3B16
    .byte $18 ; |   XX   | $3B17
    .byte $28 ; |  X X   | $3B18
    .byte $28 ; |  X X   | $3B19
    .byte $44 ; | X   X  | $3B1A
    .byte $44 ; | X   X  | $3B1B
    .byte $C6 ; |XX   XX | $3B1C
    .byte $C6 ; |XX   XX | $3B1D
    .byte $C6 ; |XX   XX | $3B1E
    .byte $A5 ; |X X  X X| $3B1F
    .byte $00 ; |        | $3B20
    .byte $28 ; |  X X   | $3B21
    .byte $38 ; |  XXX   | $3B22
    .byte $38 ; |  XXX   | $3B23
    .byte $FE ; |XXXXXXX | $3B24
    .byte $38 ; |  XXX   | $3B25
    .byte $3C ; |  XXXX  | $3B26
    .byte $34 ; |  XX X  | $3B27
    .byte $30 ; |  XX    | $3B28
    .byte $1C ; |   XXX  | $3B29
    .byte $90 ; |X  X    | $3B2A
    .byte $70 ; | XXX    | $3B2B
    .byte $10 ; |   X    | $3B2C
    .byte $38 ; |  XXX   | $3B2D
    .byte $7C ; | XXXXX  | $3B2E
    .byte $FC ; |XXXXXX  | $3B2F
    .byte $B7 ; |X XX XXX| $3B30
    .byte $B8 ; |X XXX   | $3B31
    .byte $38 ; |  XXX   | $3B32
    .byte $79 ; | XXXX  X| $3B33
    .byte $7A ; | XXXX X | $3B34
    .byte $7C ; | XXXXX  | $3B35
    .byte $38 ; |  XXX   | $3B36
    .byte $38 ; |  XXX   | $3B37
    .byte $10 ; |   X    | $3B38
    .byte $10 ; |   X    | $3B39
    .byte $10 ; |   X    | $3B3A
    .byte $10 ; |   X    | $3B3B
    .byte $30 ; |  XX    | $3B3C
    .byte $30 ; |  XX    | $3B3D
    .byte $30 ; |  XX    | $3B3E
    .byte $28 ; |  X X   | $3B3F
    .byte $00 ; |        | $3B40
    .byte $28 ; |  X X   | $3B41
    .byte $38 ; |  XXX   | $3B42
    .byte $38 ; |  XXX   | $3B43
    .byte $FE ; |XXXXXXX | $3B44
    .byte $38 ; |  XXX   | $3B45
    .byte $3C ; |  XXXX  | $3B46
    .byte $34 ; |  XX X  | $3B47
    .byte $30 ; |  XX    | $3B48
    .byte $1C ; |   XXX  | $3B49
    .byte $70 ; | XXX    | $3B4A
    .byte $90 ; |X  X    | $3B4B
    .byte $30 ; |  XX    | $3B4C
    .byte $78 ; | XXXX   | $3B4D
    .byte $7C ; | XXXXX  | $3B4E
    .byte $BE ; |X XXXXX | $3B4F
    .byte $BA ; |X XXX X | $3B50
    .byte $B9 ; |X XXX  X| $3B51
    .byte $38 ; |  XXX   | $3B52
    .byte $78 ; | XXXX   | $3B53
    .byte $78 ; | XXXX   | $3B54
    .byte $7F ; | XXXXXXX| $3B55
    .byte $38 ; |  XXX   | $3B56
    .byte $18 ; |   XX   | $3B57
    .byte $28 ; |  X X   | $3B58
    .byte $28 ; |  X X   | $3B59
    .byte $44 ; | X   X  | $3B5A
    .byte $44 ; | X   X  | $3B5B
    .byte $C6 ; |XX   XX | $3B5C
    .byte $C6 ; |XX   XX | $3B5D
    .byte $C6 ; |XX   XX | $3B5E
    .byte $A5 ; |X X  X X| $3B5F
    .byte $28 ; |  X X   | $3B60
    .byte $38 ; |  XXX   | $3B61
    .byte $3E ; |  XXXXX | $3B62
    .byte $F0 ; |XXXX    | $3B63
    .byte $00 ; |        | $3B64
    .byte $38 ; |  XXX   | $3B65
    .byte $3C ; |  XXXX  | $3B66
    .byte $34 ; |  XX X  | $3B67
    .byte $30 ; |  XX    | $3B68
    .byte $1C ; |   XXX  | $3B69
    .byte $38 ; |  XXX   | $3B6A
    .byte $48 ; | X  X   | $3B6B
    .byte $18 ; |   XX   | $3B6C
    .byte $3C ; |  XXXX  | $3B6D
    .byte $3A ; |  XXX X | $3B6E
    .byte $3C ; |  XXXX  | $3B6F
    .byte $1C ; |   XXX  | $3B70
    .byte $0C ; |    XX  | $3B71
    .byte $0C ; |    XX  | $3B72
    .byte $BE ; |X XXXXX | $3B73
    .byte $FE ; |XXXXXXX | $3B74
    .byte $0E ; |    XXX | $3B75
    .byte $0C ; |    XX  | $3B76
    .byte $1C ; |   XXX  | $3B77
    .byte $18 ; |   XX   | $3B78
    .byte $30 ; |  XX    | $3B79
    .byte $60 ; | XX     | $3B7A
    .byte $40 ; | X      | $3B7B
    .byte $60 ; | XX     | $3B7C
    .byte $60 ; | XX     | $3B7D
    .byte $60 ; | XX     | $3B7E
    .byte $50 ; | X X    | $3B7F
    .byte $00 ; |        | $3B80
    .byte $28 ; |  X X   | $3B81
    .byte $38 ; |  XXX   | $3B82
    .byte $38 ; |  XXX   | $3B83
    .byte $FE ; |XXXXXXX | $3B84
    .byte $38 ; |  XXX   | $3B85
    .byte $78 ; | XXXX   | $3B86
    .byte $58 ; | X XX   | $3B87
    .byte $18 ; |   XX   | $3B88
    .byte $70 ; | XXX    | $3B89
    .byte $16 ; |   X XX | $3B8A
    .byte $18 ; |   XX   | $3B8B
    .byte $18 ; |   XX   | $3B8C
    .byte $1C ; |   XXX  | $3B8D
    .byte $36 ; |  XX XX | $3B8E
    .byte $32 ; |  XX  X | $3B8F
    .byte $76 ; | XXX XX | $3B90
    .byte $74 ; | XXX X  | $3B91
    .byte $70 ; | XXX    | $3B92
    .byte $78 ; | XXXX   | $3B93
    .byte $38 ; |  XXX   | $3B94
    .byte $78 ; | XXXX   | $3B95
    .byte $B0 ; |X XX    | $3B96
    .byte $B0 ; |X XX    | $3B97
    .byte $20 ; |  X     | $3B98
    .byte $20 ; |  X     | $3B99
    .byte $20 ; |  X     | $3B9A
    .byte $20 ; |  X     | $3B9B
    .byte $30 ; |  XX    | $3B9C
    .byte $30 ; |  XX    | $3B9D
    .byte $30 ; |  XX    | $3B9E
    .byte $50 ; | X X    | $3B9F
    .byte $14 ; |   X X  | $3BA0
    .byte $1C ; |   XXX  | $3BA1
    .byte $1C ; |   XXX  | $3BA2
    .byte $7F ; | XXXXXXX| $3BA3
    .byte $00 ; |        | $3BA4
    .byte $1C ; |   XXX  | $3BA5
    .byte $3C ; |  XXXX  | $3BA6
    .byte $0C ; |    XX  | $3BA7
    .byte $2C ; |  X XX  | $3BA8
    .byte $3C ; |  XXXX  | $3BA9
    .byte $09 ; |    X  X| $3BAA
    .byte $0E ; |    XXX | $3BAB
    .byte $1C ; |   XXX  | $3BAC
    .byte $9E ; |X  XXXX | $3BAD
    .byte $6E ; | XX XXX | $3BAE
    .byte $0E ; |    XXX | $3BAF
    .byte $3F ; |  XXXXXX| $3BB0
    .byte $3F ; |  XXXXXX| $3BB1
    .byte $36 ; |  XX XX | $3BB2
    .byte $18 ; |   XX   | $3BB3
    .byte $0C ; |    XX  | $3BB4
    .byte $04 ; |     X  | $3BB5
    .byte $08 ; |    X   | $3BB6
    .byte $00 ; |        | $3BB7
    .byte $00 ; |        | $3BB8
    .byte $00 ; |        | $3BB9
    .byte $00 ; |        | $3BBA
    .byte $00 ; |        | $3BBB
    .byte $30 ; |  XX    | $3BBC
    .byte $30 ; |  XX    | $3BBD
    .byte $30 ; |  XX    | $3BBE
    .byte $50 ; | X X    | $3BBF
    .byte $00 ; |        | $3BC0
    .byte $28 ; |  X X   | $3BC1
    .byte $38 ; |  XXX   | $3BC2
    .byte $38 ; |  XXX   | $3BC3
    .byte $FE ; |XXXXXXX | $3BC4
    .byte $38 ; |  XXX   | $3BC5
    .byte $78 ; | XXXX   | $3BC6
    .byte $58 ; | X XX   | $3BC7
    .byte $18 ; |   XX   | $3BC8
    .byte $70 ; | XXX    | $3BC9
    .byte $16 ; |   X XX | $3BCA
    .byte $18 ; |   XX   | $3BCB
    .byte $3C ; |  XXXX  | $3BCC
    .byte $7E ; | XXXXXX | $3BCD
    .byte $FB ; |XXXXX XX| $3BCE
    .byte $B9 ; |X XXX  X| $3BCF
    .byte $BB ; |X XXX XX| $3BD0
    .byte $B4 ; |X XX X  | $3BD1
    .byte $B0 ; |X XX    | $3BD2
    .byte $B8 ; |X XXX   | $3BD3
    .byte $38 ; |  XXX   | $3BD4
    .byte $38 ; |  XXX   | $3BD5
    .byte $70 ; | XXX    | $3BD6
    .byte $B0 ; |X XX    | $3BD7
    .byte $90 ; |X  X    | $3BD8
    .byte $10 ; |   X    | $3BD9
    .byte $10 ; |   X    | $3BDA
    .byte $10 ; |   X    | $3BDB
    .byte $30 ; |  XX    | $3BDC
    .byte $30 ; |  XX    | $3BDD
    .byte $30 ; |  XX    | $3BDE
    .byte $50 ; | X X    | $3BDF
    .byte $00 ; |        | $3BE0
    .byte $28 ; |  X X   | $3BE1
    .byte $38 ; |  XXX   | $3BE2
    .byte $38 ; |  XXX   | $3BE3
    .byte $FE ; |XXXXXXX | $3BE4
    .byte $38 ; |  XXX   | $3BE5
    .byte $78 ; | XXXX   | $3BE6
    .byte $58 ; | X XX   | $3BE7
    .byte $18 ; |   XX   | $3BE8
    .byte $70 ; | XXX    | $3BE9
    .byte $18 ; |   XX   | $3BEA
    .byte $16 ; |   X XX | $3BEB
    .byte $3C ; |  XXXX  | $3BEC
    .byte $7E ; | XXXXXX | $3BED
    .byte $FB ; |XXXXX XX| $3BEE
    .byte $B9 ; |X XXX  X| $3BEF
    .byte $BB ; |X XXX XX| $3BF0
    .byte $B4 ; |X XX X  | $3BF1
    .byte $30 ; |  XX    | $3BF2
    .byte $38 ; |  XXX   | $3BF3
    .byte $38 ; |  XXX   | $3BF4
    .byte $38 ; |  XXX   | $3BF5
    .byte $F0 ; |XXXX    | $3BF6
    .byte $30 ; |  XX    | $3BF7
    .byte $10 ; |   X    | $3BF8
    .byte $10 ; |   X    | $3BF9
    .byte $10 ; |   X    | $3BFA
    .byte $10 ; |   X    | $3BFB
    .byte $30 ; |  XX    | $3BFC
    .byte $30 ; |  XX    | $3BFD
    .byte $30 ; |  XX    | $3BFE
    .byte $50 ; | X X    | $3BFF
    .byte $01 ; |       X| $3C00
    .byte $01 ; |       X| $3C01
    .byte $02 ; |      X | $3C02
    .byte $02 ; |      X | $3C03
    .byte $04 ; |     X  | $3C04
    .byte $1C ; |   XXX  | $3C05
    .byte $1C ; |   XXX  | $3C06
    .byte $2E ; |  X XXX | $3C07
    .byte $3E ; |  XXXXX | $3C08
    .byte $0E ; |    XXX | $3C09
    .byte $1C ; |   XXX  | $3C0A
    .byte $08 ; |    X   | $3C0B
    .byte $1C ; |   XXX  | $3C0C
    .byte $3E ; |  XXXXX | $3C0D
    .byte $7B ; | XXXX XX| $3C0E
    .byte $F9 ; |XXXXX  X| $3C0F
    .byte $79 ; | XXXX  X| $3C10
    .byte $1B ; |   XX XX| $3C11
    .byte $1C ; |   XXX  | $3C12
    .byte $1E ; |   XXXX | $3C13
    .byte $0F ; |    XXXX| $3C14
    .byte $0F ; |    XXXX| $3C15
    .byte $06 ; |     XX | $3C16
    .byte $04 ; |     X  | $3C17
    .byte $04 ; |     X  | $3C18
    .byte $04 ; |     X  | $3C19
    .byte $04 ; |     X  | $3C1A
    .byte $04 ; |     X  | $3C1B
    .byte $04 ; |     X  | $3C1C
    .byte $04 ; |     X  | $3C1D
    .byte $04 ; |     X  | $3C1E
    .byte $1C ; |   XXX  | $3C1F
    .byte $10 ; |   X    | $3C20
    .byte $10 ; |   X    | $3C21
    .byte $08 ; |    X   | $3C22
    .byte $08 ; |    X   | $3C23
    .byte $04 ; |     X  | $3C24
    .byte $1C ; |   XXX  | $3C25
    .byte $1C ; |   XXX  | $3C26
    .byte $2E ; |  X XXX | $3C27
    .byte $36 ; |  XX XX | $3C28
    .byte $06 ; |     XX | $3C29
    .byte $1C ; |   XXX  | $3C2A
    .byte $08 ; |    X   | $3C2B
    .byte $1C ; |   XXX  | $3C2C
    .byte $3E ; |  XXXXX | $3C2D
    .byte $7B ; | XXXX XX| $3C2E
    .byte $F9 ; |XXXXX  X| $3C2F
    .byte $71 ; | XXX   X| $3C30
    .byte $31 ; |  XX   X| $3C31
    .byte $32 ; |  XX  X | $3C32
    .byte $F8 ; |XXXXX   | $3C33
    .byte $FC ; |XXXXXX  | $3C34
    .byte $FC ; |XXXXXX  | $3C35
    .byte $38 ; |  XXX   | $3C36
    .byte $00 ; |        | $3C37
    .byte $00 ; |        | $3C38
    .byte $00 ; |        | $3C39
    .byte $00 ; |        | $3C3A
    .byte $00 ; |        | $3C3B
    .byte $00 ; |        | $3C3C
    .byte $00 ; |        | $3C3D
    .byte $00 ; |        | $3C3E
    .byte $00 ; |        | $3C3F
L3C40:
    .byte $EE ; |XXX XXX | $3C40
    .byte $6C ; | XX XX  | $3C41
    .byte $7C ; | XXXXX  | $3C42
    .byte $38 ; |  XXX   | $3C43
    .byte $38 ; |  XXX   | $3C44
    .byte $10 ; |   X    | $3C45
    .byte $38 ; |  XXX   | $3C46
    .byte $44 ; | X   X  | $3C47
L3C48:
    .byte $00 ; |        | $3C48
    .byte $38 ; |  XXX   | $3C49
    .byte $7C ; | XXXXX  | $3C4A
    .byte $FE ; |XXXXXXX | $3C4B
    .byte $FE ; |XXXXXXX | $3C4C
    .byte $7C ; | XXXXX  | $3C4D
    .byte $38 ; |  XXX   | $3C4E
    .byte $00 ; |        | $3C4F
    .byte $89 ; |X   X  X| $3C50
    .byte $A8 ; |X X X   | $3C51
    .byte $A8 ; |X X X   | $3C52
    .byte $D8 ; |XX XX   | $3C53
    .byte $D9 ; |XX XX  X| $3C54
    .byte $8A ; |X   X X | $3C55
    .byte $8A ; |X   X X | $3C56
    .byte $00 ; |        | $3C57
    .byte $C7 ; |XX   XXX| $3C58
    .byte $88 ; |X   X   | $3C59
    .byte $80 ; |X       | $3C5A
    .byte $87 ; |X    XXX| $3C5B
    .byte $48 ; | X  X   | $3C5C
    .byte $28 ; |  X X   | $3C5D
    .byte $27 ; |  X  XXX| $3C5E
    .byte $00 ; |        | $3C5F
    .byte $1C ; |   XXX  | $3C60
    .byte $88 ; |X   X   | $3C61
    .byte $88 ; |X   X   | $3C62
    .byte $08 ; |    X   | $3C63
    .byte $08 ; |    X   | $3C64
    .byte $AA ; |X X X X | $3C65
    .byte $3E ; |  XXXXX | $3C66
    .byte $00 ; |        | $3C67
    .byte $71 ; | XXX   X| $3C68
    .byte $22 ; |  X   X | $3C69
    .byte $22 ; |  X   X | $3C6A
    .byte $22 ; |  X   X | $3C6B
    .byte $22 ; |  X   X | $3C6C
    .byte $22 ; |  X   X | $3C6D
    .byte $71 ; | XXX   X| $3C6E
    .byte $00 ; |        | $3C6F
    .byte $A7 ; |X X  XXX| $3C70
    .byte $48 ; | X  X   | $3C71
    .byte $A8 ; |X X X   | $3C72
    .byte $28 ; |  X X   | $3C73
    .byte $28 ; |  X X   | $3C74
    .byte $28 ; |  X X   | $3C75
    .byte $C8 ; |XX  X   | $3C76
    .byte $00 ; |        | $3C77
    .byte $3E ; |  XXXXX | $3C78
    .byte $A0 ; |X X     | $3C79
    .byte $A0 ; |X X     | $3C7A
    .byte $BC ; |X XXXX  | $3C7B
    .byte $A0 ; |X X     | $3C7C
    .byte $A0 ; |X X     | $3C7D
    .byte $BE ; |X XXXXX | $3C7E
    .byte $00 ; |        | $3C7F
    .byte $08 ; |    X   | $3C80
    .byte $08 ; |    X   | $3C81
    .byte $38 ; |  XXX   | $3C82
    .byte $28 ; |  X X   | $3C83
    .byte $28 ; |  X X   | $3C84
    .byte $08 ; |    X   | $3C85
    .byte $08 ; |    X   | $3C86
    .byte $00 ; |        | $3C87
    .byte $00 ; |        | $3C88
    .byte $00 ; |        | $3C89
    .byte $00 ; |        | $3C8A
    .byte $00 ; |        | $3C8B
    .byte $00 ; |        | $3C8C
    .byte $00 ; |        | $3C8D
    .byte $00 ; |        | $3C8E
    .byte $00 ; |        | $3C8F
    .byte $3C ; |  XXXX  | $3C90
    .byte $66 ; | XX  XX | $3C91
    .byte $66 ; | XX  XX | $3C92
    .byte $66 ; | XX  XX | $3C93
    .byte $66 ; | XX  XX | $3C94
    .byte $66 ; | XX  XX | $3C95
    .byte $3C ; |  XXXX  | $3C96
    .byte $00 ; |        | $3C97
    .byte $7E ; | XXXXXX | $3C98
    .byte $18 ; |   XX   | $3C99
    .byte $18 ; |   XX   | $3C9A
    .byte $18 ; |   XX   | $3C9B
    .byte $18 ; |   XX   | $3C9C
    .byte $18 ; |   XX   | $3C9D
    .byte $78 ; | XXXX   | $3C9E
    .byte $38 ; |  XXX   | $3C9F
    .byte $7E ; | XXXXXX | $3CA0
    .byte $60 ; | XX     | $3CA1
    .byte $60 ; | XX     | $3CA2
    .byte $3C ; |  XXXX  | $3CA3
    .byte $06 ; |     XX | $3CA4
    .byte $46 ; | X   XX | $3CA5
    .byte $7C ; | XXXXX  | $3CA6
    .byte $00 ; |        | $3CA7
    .byte $3C ; |  XXXX  | $3CA8
    .byte $46 ; | X   XX | $3CA9
    .byte $06 ; |     XX | $3CAA
    .byte $0C ; |    XX  | $3CAB
    .byte $06 ; |     XX | $3CAC
    .byte $46 ; | X   XX | $3CAD
    .byte $3C ; |  XXXX  | $3CAE
    .byte $00 ; |        | $3CAF
    .byte $0C ; |    XX  | $3CB0
    .byte $0C ; |    XX  | $3CB1
    .byte $7E ; | XXXXXX | $3CB2
    .byte $4C ; | X  XX  | $3CB3
    .byte $2C ; |  X XX  | $3CB4
    .byte $1C ; |   XXX  | $3CB5
    .byte $0C ; |    XX  | $3CB6
    .byte $00 ; |        | $3CB7
    .byte $7C ; | XXXXX  | $3CB8
    .byte $46 ; | X   XX | $3CB9
    .byte $06 ; |     XX | $3CBA
    .byte $7C ; | XXXXX  | $3CBB
    .byte $60 ; | XX     | $3CBC
    .byte $60 ; | XX     | $3CBD
    .byte $7E ; | XXXXXX | $3CBE
    .byte $00 ; |        | $3CBF
    .byte $3C ; |  XXXX  | $3CC0
    .byte $66 ; | XX  XX | $3CC1
    .byte $66 ; | XX  XX | $3CC2
    .byte $7C ; | XXXXX  | $3CC3
    .byte $60 ; | XX     | $3CC4
    .byte $62 ; | XX   X | $3CC5
    .byte $3C ; |  XXXX  | $3CC6
    .byte $00 ; |        | $3CC7
    .byte $18 ; |   XX   | $3CC8
    .byte $18 ; |   XX   | $3CC9
    .byte $08 ; |    X   | $3CCA
    .byte $04 ; |     X  | $3CCB
    .byte $02 ; |      X | $3CCC
    .byte $62 ; | XX   X | $3CCD
    .byte $7E ; | XXXXXX | $3CCE
    .byte $00 ; |        | $3CCF
    .byte $3C ; |  XXXX  | $3CD0
    .byte $66 ; | XX  XX | $3CD1
    .byte $66 ; | XX  XX | $3CD2
    .byte $3C ; |  XXXX  | $3CD3
    .byte $66 ; | XX  XX | $3CD4
    .byte $66 ; | XX  XX | $3CD5
    .byte $3C ; |  XXXX  | $3CD6
    .byte $00 ; |        | $3CD7
    .byte $3C ; |  XXXX  | $3CD8
    .byte $46 ; | X   XX | $3CD9
    .byte $06 ; |     XX | $3CDA
    .byte $3E ; |  XXXXX | $3CDB
    .byte $66 ; | XX  XX | $3CDC
    .byte $66 ; | XX  XX | $3CDD
    .byte $3C ; |  XXXX  | $3CDE
    .byte $00 ; |        | $3CDF
L3CE0:
    .byte $00 ; |        | $3CE0
    .byte $01 ; |       X| $3CE1
    .byte $03 ; |      XX| $3CE2
    .byte $01 ; |       X| $3CE3
    .byte $0C ; |    XX  | $3CE4
    .byte $3E ; |  XXXXX | $3CE5
    .byte $18 ; |   XX   | $3CE6
    .byte $00 ; |        | $3CE7
L3CE8:
    .byte $FF ; |XXXXXXXX| $3CE8
    .byte $FF ; |XXXXXXXX| $3CE9
    .byte $7F ; | XXXXXXX| $3CEA
    .byte $3F ; |  XXXXXX| $3CEB
    .byte $17 ; |   X XXX| $3CEC
    .byte $17 ; |   X XXX| $3CED
    .byte $06 ; |     XX | $3CEE
    .byte $06 ; |     XX | $3CEF
L3CF0:
    .byte $00 ; |        | $3CF0
    .byte $00 ; |        | $3CF1
    .byte $00 ; |        | $3CF2
    .byte $00 ; |        | $3CF3
    .byte $00 ; |        | $3CF4
    .byte $00 ; |        | $3CF5
    .byte $00 ; |        | $3CF6
    .byte $00 ; |        | $3CF7
    .byte $40 ; | X      | $3CF8
    .byte $40 ; | X      | $3CF9
    .byte $50 ; | X X    | $3CFA
    .byte $50 ; | X X    | $3CFB
    .byte $70 ; | XXX    | $3CFC
    .byte $40 ; | X      | $3CFD
    .byte $40 ; | X      | $3CFE
    .byte $40 ; | X      | $3CFF

L3D00:
  IF PAL
    .byte $46 ; | X   XX | $3D00  colors
    .byte $4A ; | X  X X | $3D01
    .byte $4A ; | X  X X | $3D02
    .byte $4A ; | X  X X | $3D03
    .byte $68 ; | XX X   | $3D04
    .byte $4A ; | X  X X | $3D05
    .byte $4A ; | X  X X | $3D06
    .byte $00 ; |        | $3D07
    .byte $00 ; |        | $3D08  free bytes
    .byte $00 ; |        | $3D09
    .byte $00 ; |        | $3D0A
    .byte $00 ; |        | $3D0B
    .byte $00 ; |        | $3D0C
    .byte $00 ; |        | $3D0D
    .byte $00 ; |        | $3D0E
    .byte $00 ; |        | $3D0F
  ELSE NTSC
    .byte $26 ; |  X  XX | $3D00  colors
    .byte $3A ; |  XXX X | $3D01
    .byte $3A ; |  XXX X | $3D02
    .byte $3A ; |  XXX X | $3D03
    .byte $48 ; | X  X   | $3D04
    .byte $3A ; |  XXX X | $3D05
    .byte $3A ; |  XXX X | $3D06
    .byte $00 ; |        | $3D07
    .byte $30 ; |  XX    | $3D08  free bytes
    .byte $30 ; |  XX    | $3D09
    .byte $30 ; |  XX    | $3D0A
    .byte $30 ; |  XX    | $3D0B
    .byte $30 ; |  XX    | $3D0C
    .byte $30 ; |  XX    | $3D0D
    .byte $30 ; |  XX    | $3D0E
    .byte $30 ; |  XX    | $3D0F
  ENDIF

L3D10:
  IF PAL
    .byte $48 ; | X  X   | $3D10  colors
    .byte $48 ; | X  X   | $3D11
    .byte $48 ; | X  X   | $3D12
    .byte $48 ; | X  X   | $3D13
    .byte $48 ; | X  X   | $3D14
    .byte $48 ; | X  X   | $3D15
    .byte $00 ; |        | $3D16
    .byte $00 ; |        | $3D17
    .byte $00 ; |        | $3D18  free bytes
    .byte $00 ; |        | $3D19
    .byte $00 ; |        | $3D1A
    .byte $00 ; |        | $3D1B
    .byte $00 ; |        | $3D1C
    .byte $00 ; |        | $3D1D
    .byte $00 ; |        | $3D1E
    .byte $00 ; |        | $3D1F
  ELSE NTSC
    .byte $38 ; |  XXX   | $3D10  colors
    .byte $38 ; |  XXX   | $3D11
    .byte $38 ; |  XXX   | $3D12
    .byte $38 ; |  XXX   | $3D13
    .byte $38 ; |  XXX   | $3D14
    .byte $38 ; |  XXX   | $3D15
    .byte $00 ; |        | $3D16
    .byte $00 ; |        | $3D17
    .byte $30 ; |  XX    | $3D18  free bytes
    .byte $30 ; |  XX    | $3D19
    .byte $30 ; |  XX    | $3D1A
    .byte $30 ; |  XX    | $3D1B
    .byte $30 ; |  XX    | $3D1C
    .byte $30 ; |  XX    | $3D1D
    .byte $30 ; |  XX    | $3D1E
    .byte $30 ; |  XX    | $3D1F
  ENDIF

L3D20:
    .byte $04 ; |     X  | $3D20
    .byte $06 ; |     XX | $3D21
    .byte $03 ; |      XX| $3D22
    .byte $07 ; |     XXX| $3D23
    .byte $02 ; |      X | $3D24
    .byte $03 ; |      XX| $3D25
    .byte $02 ; |      X | $3D26
    .byte $00 ; |        | $3D27
L3D28:
    .byte $80 ; |X       | $3D28
    .byte $80 ; |X       | $3D29
    .byte $80 ; |X       | $3D2A
    .byte $40 ; | X      | $3D2B
    .byte $40 ; | X      | $3D2C
    .byte $40 ; | X      | $3D2D
    .byte $20 ; |  X     | $3D2E
    .byte $20 ; |  X     | $3D2F
    .byte $20 ; |  X     | $3D30
    .byte $10 ; |   X    | $3D31
    .byte $10 ; |   X    | $3D32
    .byte $10 ; |   X    | $3D33
    .byte $08 ; |    X   | $3D34
    .byte $08 ; |    X   | $3D35
    .byte $08 ; |    X   | $3D36
    .byte $00 ; |        | $3D37
L3D38:
    .byte $AC ; |X X XX  | $3D38
    .byte $54 ; | X X X  | $3D39
    .byte $9C ; |X  XXX  | $3D3A
    .byte $5C ; | X XXX  | $3D3B
    .byte $84 ; |X    X  | $3D3C
    .byte $6C ; | XX XX  | $3D3D
    .byte $9C ; |X  XXX  | $3D3E
    .byte $4C ; | X  XX  | $3D3F
    .byte $44 ; | X   X  | $3D40
    .byte $AC ; |X X XX  | $3D41
    .byte $74 ; | XXX X  | $3D42
    .byte $A4 ; |X X  X  | $3D43
    .byte $AC ; |X X XX  | $3D44
    .byte $5C ; | X XXX  | $3D45
    .byte $6C ; | XX XX  | $3D46
    .byte $8C ; |X   XX  | $3D47
    .byte $7C ; | XXXXX  | $3D48
    .byte $44 ; | X   X  | $3D49
    .byte $7C ; | XXXXX  | $3D4A
    .byte $7C ; | XXXXX  | $3D4B
    .byte $4C ; | X  XX  | $3D4C
    .byte $A4 ; |X X  X  | $3D4D
    .byte $64 ; | XX  X  | $3D4E
    .byte $84 ; |X    X  | $3D4F
    .byte $5C ; | X XXX  | $3D50
    .byte $74 ; | XXX X  | $3D51
    .byte $94 ; |X  X X  | $3D52
    .byte $AC ; |X X XX  | $3D53
    .byte $AC ; |X X XX  | $3D54
    .byte $84 ; |X    X  | $3D55
    .byte $5C ; | X XXX  | $3D56
    .byte $64 ; | XX  X  | $3D57
    .byte $6C ; | XX XX  | $3D58
    .byte $74 ; | XXX X  | $3D59
    .byte $74 ; | XXX X  | $3D5A
    .byte $6C ; | XX XX  | $3D5B
    .byte $74 ; | XXX X  | $3D5C
    .byte $AC ; |X X XX  | $3D5D
    .byte $54 ; | X X X  | $3D5E
    .byte $94 ; |X  X X  | $3D5F
    .byte $44 ; | X   X  | $3D60
    .byte $4C ; | X  XX  | $3D61
    .byte $5C ; | X XXX  | $3D62
    .byte $64 ; | XX  X  | $3D63
    .byte $9C ; |X  XXX  | $3D64
    .byte $94 ; |X  X X  | $3D65
    .byte $AC ; |X X XX  | $3D66
    .byte $7C ; | XXXXX  | $3D67
    .byte $9C ; |X  XXX  | $3D68
    .byte $9C ; |X  XXX  | $3D69
    .byte $AC ; |X X XX  | $3D6A
    .byte $AC ; |X X XX  | $3D6B
    .byte $4C ; | X  XX  | $3D6C
    .byte $8C ; |X   XX  | $3D6D
    .byte $8C ; |X   XX  | $3D6E
    .byte $84 ; |X    X  | $3D6F
    .byte $64 ; | XX  X  | $3D70
    .byte $74 ; | XXX X  | $3D71
    .byte $7C ; | XXXXX  | $3D72
    .byte $94 ; |X  X X  | $3D73
    .byte $AC ; |X X XX  | $3D74
    .byte $6C ; | XX XX  | $3D75
    .byte $54 ; | X X X  | $3D76
    .byte $4C ; | X  XX  | $3D77
L3D78:
    .byte $00 ; |        | $3D78
    .byte $01 ; |       X| $3D79
    .byte $01 ; |       X| $3D7A
    .byte $06 ; |     XX | $3D7B
    .byte $03 ; |      XX| $3D7C
    .byte $04 ; |     X  | $3D7D
    .byte $01 ; |       X| $3D7E
    .byte $01 ; |       X| $3D7F
    .byte $06 ; |     XX | $3D80
    .byte $00 ; |        | $3D81
    .byte $03 ; |      XX| $3D82
    .byte $00 ; |        | $3D83
    .byte $00 ; |        | $3D84
    .byte $03 ; |      XX| $3D85
    .byte $01 ; |       X| $3D86
    .byte $03 ; |      XX| $3D87
    .byte $03 ; |      XX| $3D88
    .byte $03 ; |      XX| $3D89
    .byte $00 ; |        | $3D8A
    .byte $00 ; |        | $3D8B
    .byte $06 ; |     XX | $3D8C
    .byte $00 ; |        | $3D8D
    .byte $04 ; |     X  | $3D8E
    .byte $00 ; |        | $3D8F
    .byte $01 ; |       X| $3D90
    .byte $03 ; |      XX| $3D91
    .byte $01 ; |       X| $3D92
    .byte $00 ; |        | $3D93
    .byte $00 ; |        | $3D94
    .byte $02 ; |      X | $3D95
    .byte $06 ; |     XX | $3D96
    .byte $02 ; |      X | $3D97
    .byte $06 ; |     XX | $3D98
    .byte $01 ; |       X| $3D99
    .byte $03 ; |      XX| $3D9A
    .byte $02 ; |      X | $3D9B
    .byte $03 ; |      XX| $3D9C
    .byte $00 ; |        | $3D9D
    .byte $06 ; |     XX | $3D9E
    .byte $01 ; |       X| $3D9F
    .byte $03 ; |      XX| $3DA0
    .byte $06 ; |     XX | $3DA1
    .byte $04 ; |     X  | $3DA2
    .byte $03 ; |      XX| $3DA3
    .byte $01 ; |       X| $3DA4
    .byte $01 ; |       X| $3DA5
    .byte $00 ; |        | $3DA6
    .byte $03 ; |      XX| $3DA7
    .byte $01 ; |       X| $3DA8
    .byte $01 ; |       X| $3DA9
    .byte $00 ; |        | $3DAA
    .byte $00 ; |        | $3DAB
    .byte $06 ; |     XX | $3DAC
    .byte $03 ; |      XX| $3DAD
    .byte $02 ; |      X | $3DAE
    .byte $03 ; |      XX| $3DAF
    .byte $06 ; |     XX | $3DB0
    .byte $03 ; |      XX| $3DB1
    .byte $02 ; |      X | $3DB2
    .byte $01 ; |       X| $3DB3
    .byte $00 ; |        | $3DB4
    .byte $03 ; |      XX| $3DB5
    .byte $03 ; |      XX| $3DB6
    .byte $01 ; |       X| $3DB7
L3DB8:
    .byte $00 ; |        | $3DB8
    .byte $01 ; |       X| $3DB9
    .byte $00 ; |        | $3DBA
    .byte $00 ; |        | $3DBB
    .byte $01 ; |       X| $3DBC
    .byte $00 ; |        | $3DBD
    .byte $01 ; |       X| $3DBE
    .byte $01 ; |       X| $3DBF
L3DC0:
    .byte $90 ; |X  X    | $3DC0
    .byte $98 ; |X  XX   | $3DC1
    .byte $A0 ; |X X     | $3DC2
    .byte $A8 ; |X X X   | $3DC3
    .byte $B0 ; |X XX    | $3DC4
    .byte $B8 ; |X XXX   | $3DC5
    .byte $C0 ; |XX      | $3DC6
    .byte $C8 ; |XX  X   | $3DC7
    .byte $D0 ; |XX X    | $3DC8
    .byte $D8 ; |XX XX   | $3DC9
    .byte $88 ; |X   X   | $3DCA

  IF PAL
    REPEAT ($3E00 - *)
      .byte $00
    REPEND

  ELSE NTSC
    REPEAT ($3E00 - *)
      .byte $30
    REPEND
  ENDIF

    .byte $05 ; |     X X| $3E00
    .byte $1E ; |   XXXX | $3E01
    .byte $0A ; |    X X | $3E02
    .byte $0C ; |    XX  | $3E03
    .byte $05 ; |     X X| $3E04
    .byte $1E ; |   XXXX | $3E05
    .byte $00 ; |        | $3E06
    .byte $04 ; |     X  | $3E07
    .byte $05 ; |     X X| $3E08
    .byte $1E ; |   XXXX | $3E09
    .byte $0A ; |    X X | $3E0A
    .byte $04 ; |     X  | $3E0B
    .byte $05 ; |     X X| $3E0C
    .byte $1E ; |   XXXX | $3E0D
    .byte $00 ; |        | $3E0E
    .byte $04 ; |     X  | $3E0F
    .byte $05 ; |     X X| $3E10
    .byte $1E ; |   XXXX | $3E11
    .byte $0A ; |    X X | $3E12
    .byte $04 ; |     X  | $3E13
    .byte $05 ; |     X X| $3E14
    .byte $1E ; |   XXXX | $3E15
    .byte $00 ; |        | $3E16
    .byte $04 ; |     X  | $3E17
    .byte $05 ; |     X X| $3E18
    .byte $1E ; |   XXXX | $3E19
    .byte $0A ; |    X X | $3E1A
    .byte $0C ; |    XX  | $3E1B
    .byte $05 ; |     X X| $3E1C
    .byte $1E ; |   XXXX | $3E1D
    .byte $00 ; |        | $3E1E
    .byte $04 ; |     X  | $3E1F
    .byte $05 ; |     X X| $3E20
    .byte $1E ; |   XXXX | $3E21
    .byte $0A ; |    X X | $3E22
    .byte $04 ; |     X  | $3E23
    .byte $05 ; |     X X| $3E24
    .byte $1E ; |   XXXX | $3E25
    .byte $00 ; |        | $3E26
    .byte $04 ; |     X  | $3E27
    .byte $05 ; |     X X| $3E28
    .byte $1E ; |   XXXX | $3E29
    .byte $0A ; |    X X | $3E2A
    .byte $08 ; |    X   | $3E2B
    .byte $05 ; |     X X| $3E2C
    .byte $14 ; |   X X  | $3E2D
    .byte $0A ; |    X X | $3E2E
    .byte $10 ; |   X    | $3E2F
    .byte $05 ; |     X X| $3E30
    .byte $18 ; |   XX   | $3E31
    .byte $0A ; |    X X | $3E32
    .byte $10 ; |   X    | $3E33
    .byte $05 ; |     X X| $3E34
    .byte $14 ; |   X X  | $3E35
    .byte $0A ; |    X X | $3E36
    .byte $10 ; |   X    | $3E37
    .byte $05 ; |     X X| $3E38
    .byte $18 ; |   XX   | $3E39
    .byte $0A ; |    X X | $3E3A
    .byte $10 ; |   X    | $3E3B
    .byte $05 ; |     X X| $3E3C
    .byte $14 ; |   X X  | $3E3D
    .byte $0A ; |    X X | $3E3E
    .byte $10 ; |   X    | $3E3F
    .byte $05 ; |     X X| $3E40
    .byte $18 ; |   XX   | $3E41
    .byte $0A ; |    X X | $3E42
    .byte $10 ; |   X    | $3E43
    .byte $05 ; |     X X| $3E44
    .byte $1E ; |   XXXX | $3E45
    .byte $0A ; |    X X | $3E46
    .byte $0C ; |    XX  | $3E47
    .byte $05 ; |     X X| $3E48
    .byte $1E ; |   XXXX | $3E49
    .byte $00 ; |        | $3E4A
    .byte $04 ; |     X  | $3E4B
    .byte $05 ; |     X X| $3E4C
    .byte $1E ; |   XXXX | $3E4D
    .byte $0A ; |    X X | $3E4E
    .byte $04 ; |     X  | $3E4F
    .byte $05 ; |     X X| $3E50
    .byte $1E ; |   XXXX | $3E51
    .byte $00 ; |        | $3E52
    .byte $04 ; |     X  | $3E53
    .byte $05 ; |     X X| $3E54
    .byte $1E ; |   XXXX | $3E55
    .byte $0A ; |    X X | $3E56
    .byte $04 ; |     X  | $3E57
    .byte $05 ; |     X X| $3E58
    .byte $1E ; |   XXXX | $3E59
    .byte $00 ; |        | $3E5A
    .byte $04 ; |     X  | $3E5B
    .byte $05 ; |     X X| $3E5C
    .byte $1E ; |   XXXX | $3E5D
    .byte $0A ; |    X X | $3E5E
    .byte $0C ; |    XX  | $3E5F
    .byte $05 ; |     X X| $3E60
    .byte $1E ; |   XXXX | $3E61
    .byte $00 ; |        | $3E62
    .byte $04 ; |     X  | $3E63
    .byte $05 ; |     X X| $3E64
    .byte $1E ; |   XXXX | $3E65
    .byte $0A ; |    X X | $3E66
    .byte $04 ; |     X  | $3E67
    .byte $05 ; |     X X| $3E68
    .byte $1E ; |   XXXX | $3E69
    .byte $00 ; |        | $3E6A
    .byte $04 ; |     X  | $3E6B
    .byte $05 ; |     X X| $3E6C
    .byte $1E ; |   XXXX | $3E6D
    .byte $0A ; |    X X | $3E6E
    .byte $08 ; |    X   | $3E6F
    .byte $05 ; |     X X| $3E70
    .byte $14 ; |   X X  | $3E71
    .byte $0A ; |    X X | $3E72
    .byte $10 ; |   X    | $3E73
    .byte $05 ; |     X X| $3E74
    .byte $18 ; |   XX   | $3E75
    .byte $0A ; |    X X | $3E76
    .byte $10 ; |   X    | $3E77
    .byte $05 ; |     X X| $3E78
    .byte $14 ; |   X X  | $3E79
    .byte $0A ; |    X X | $3E7A
    .byte $10 ; |   X    | $3E7B
    .byte $05 ; |     X X| $3E7C
    .byte $18 ; |   XX   | $3E7D
    .byte $0A ; |    X X | $3E7E
    .byte $10 ; |   X    | $3E7F
    .byte $05 ; |     X X| $3E80
    .byte $14 ; |   X X  | $3E81
    .byte $0A ; |    X X | $3E82
    .byte $10 ; |   X    | $3E83
    .byte $05 ; |     X X| $3E84
    .byte $18 ; |   XX   | $3E85
    .byte $0A ; |    X X | $3E86
    .byte $10 ; |   X    | $3E87
    .byte $05 ; |     X X| $3E88
    .byte $1E ; |   XXXX | $3E89
    .byte $0A ; |    X X | $3E8A
    .byte $20 ; |  X     | $3E8B
    .byte $05 ; |     X X| $3E8C
    .byte $1E ; |   XXXX | $3E8D
    .byte $00 ; |        | $3E8E
    .byte $40 ; | X      | $3E8F
    .byte $0D ; |    XX X| $3E90
    .byte $15 ; |   X X X| $3E91
    .byte $0A ; |    X X | $3E92
    .byte $2C ; |  X XX  | $3E93
    .byte $0D ; |    XX X| $3E94
    .byte $18 ; |   XX   | $3E95
    .byte $0A ; |    X X | $3E96
    .byte $2C ; |  X XX  | $3E97
    .byte $0D ; |    XX X| $3E98
    .byte $1C ; |   XXX  | $3E99
    .byte $0A ; |    X X | $3E9A
    .byte $0B ; |    X XX| $3E9B
    .byte $0D ; |    XX X| $3E9C
    .byte $18 ; |   XX   | $3E9D
    .byte $00 ; |        | $3E9E
    .byte $0B ; |    X XX| $3E9F
    .byte $0D ; |    XX X| $3EA0
    .byte $1C ; |   XXX  | $3EA1
    .byte $0A ; |    X X | $3EA2
    .byte $0B ; |    X XX| $3EA3
    .byte $0D ; |    XX X| $3EA4
    .byte $1C ; |   XXX  | $3EA5
    .byte $00 ; |        | $3EA6
    .byte $0B ; |    X XX| $3EA7
    .byte $0D ; |    XX X| $3EA8
    .byte $1C ; |   XXX  | $3EA9
    .byte $0A ; |    X X | $3EAA
    .byte $2C ; |  X XX  | $3EAB
    .byte $0D ; |    XX X| $3EAC
    .byte $1F ; |   XXXXX| $3EAD
    .byte $0A ; |    X X | $3EAE
    .byte $16 ; |   X XX | $3EAF
    .byte $0D ; |    XX X| $3EB0
    .byte $1C ; |   XXX  | $3EB1
    .byte $0A ; |    X X | $3EB2
    .byte $0B ; |    X XX| $3EB3
    .byte $0D ; |    XX X| $3EB4
    .byte $1C ; |   XXX  | $3EB5
    .byte $00 ; |        | $3EB6
    .byte $0B ; |    X XX| $3EB7
    .byte $0D ; |    XX X| $3EB8
    .byte $1C ; |   XXX  | $3EB9
    .byte $0A ; |    X X | $3EBA
    .byte $2C ; |  X XX  | $3EBB
    .byte $00 ; |        | $3EBC
    .byte $00 ; |        | $3EBD
    .byte $00 ; |        | $3EBE
    .byte $00 ; |        | $3EBF
    .byte $06 ; |     XX | $3EC0
    .byte $0E ; |    XXX | $3EC1
    .byte $0F ; |    XXXX| $3EC2
    .byte $03 ; |      XX| $3EC3
    .byte $06 ; |     XX | $3EC4
    .byte $0E ; |    XXX | $3EC5
    .byte $00 ; |        | $3EC6
    .byte $12 ; |   X  X | $3EC7
    .byte $06 ; |     XX | $3EC8
    .byte $0E ; |    XXX | $3EC9
    .byte $08 ; |    X   | $3ECA
    .byte $03 ; |      XX| $3ECB
    .byte $06 ; |     XX | $3ECC
    .byte $0E ; |    XXX | $3ECD
    .byte $00 ; |        | $3ECE
    .byte $12 ; |   X  X | $3ECF
    .byte $06 ; |     XX | $3ED0
    .byte $0E ; |    XXX | $3ED1
    .byte $08 ; |    X   | $3ED2
    .byte $03 ; |      XX| $3ED3
    .byte $06 ; |     XX | $3ED4
    .byte $0E ; |    XXX | $3ED5
    .byte $00 ; |        | $3ED6
    .byte $12 ; |   X  X | $3ED7
    .byte $06 ; |     XX | $3ED8
    .byte $0E ; |    XXX | $3ED9
    .byte $08 ; |    X   | $3EDA
    .byte $03 ; |      XX| $3EDB
    .byte $06 ; |     XX | $3EDC
    .byte $0E ; |    XXX | $3EDD
    .byte $00 ; |        | $3EDE
    .byte $12 ; |   X  X | $3EDF
    .byte $00 ; |        | $3EE0
    .byte $00 ; |        | $3EE1
    .byte $00 ; |        | $3EE2
    .byte $00 ; |        | $3EE3
    .byte $0D ; |    XX X| $3EE4
    .byte $1C ; |   XXX  | $3EE5
    .byte $0A ; |    X X | $3EE6
    .byte $14 ; |   X X  | $3EE7
    .byte $0D ; |    XX X| $3EE8
    .byte $1C ; |   XXX  | $3EE9
    .byte $00 ; |        | $3EEA
    .byte $04 ; |     X  | $3EEB
    .byte $0D ; |    XX X| $3EEC
    .byte $1C ; |   XXX  | $3EED
    .byte $0A ; |    X X | $3EEE
    .byte $08 ; |    X   | $3EEF
    .byte $0D ; |    XX X| $3EF0
    .byte $15 ; |   X X X| $3EF1
    .byte $0A ; |    X X | $3EF2
    .byte $50 ; | X X    | $3EF3
    .byte $0D ; |    XX X| $3EF4
    .byte $15 ; |   X X X| $3EF5
    .byte $00 ; |        | $3EF6
    .byte $10 ; |   X    | $3EF7
    .byte $0D ; |    XX X| $3EF8
    .byte $1C ; |   XXX  | $3EF9
    .byte $0A ; |    X X | $3EFA
    .byte $18 ; |   XX   | $3EFB
    .byte $0D ; |    XX X| $3EFC
    .byte $15 ; |   X X X| $3EFD
    .byte $0A ; |    X X | $3EFE
    .byte $08 ; |    X   | $3EFF
    .byte $0D ; |    XX X| $3F00
    .byte $10 ; |   X    | $3F01
    .byte $0A ; |    X X | $3F02
    .byte $40 ; | X      | $3F03
    .byte $00 ; |        | $3F04
    .byte $00 ; |        | $3F05
    .byte $00 ; |        | $3F06
    .byte $00 ; |        | $3F07
    .byte $0D ; |    XX X| $3F08
    .byte $15 ; |   X X X| $3F09
    .byte $0A ; |    X X | $3F0A
    .byte $08 ; |    X   | $3F0B
    .byte $0D ; |    XX X| $3F0C
    .byte $10 ; |   X    | $3F0D
    .byte $0A ; |    X X | $3F0E
    .byte $08 ; |    X   | $3F0F
    .byte $0D ; |    XX X| $3F10
    .byte $0C ; |    XX  | $3F11
    .byte $0A ; |    X X | $3F12
    .byte $08 ; |    X   | $3F13
    .byte $0D ; |    XX X| $3F14
    .byte $0A ; |    X X | $3F15
    .byte $0A ; |    X X | $3F16
    .byte $10 ; |   X    | $3F17
    .byte $0D ; |    XX X| $3F18
    .byte $0C ; |    XX  | $3F19
    .byte $0A ; |    X X | $3F1A
    .byte $08 ; |    X   | $3F1B
    .byte $0D ; |    XX X| $3F1C
    .byte $0A ; |    X X | $3F1D
    .byte $0A ; |    X X | $3F1E
    .byte $20 ; |  X     | $3F1F
    .byte $00 ; |        | $3F20
    .byte $00 ; |        | $3F21
    .byte $00 ; |        | $3F22
    .byte $00 ; |        | $3F23

L3F24:

  IF PAL
    .byte $00 ; |        | $3F24
    .byte $52 ; | X X  X | $3F25
  REPEAT ($3FF8 - *)
    .byte $00
  REPEND


  ELSE NTSC
    .byte $00 ; |        | $3F24
    .byte $BE ; |X XXXXX | $3F25
  REPEAT ($3FF8 - *)
    .byte $30
  REPEND
  ENDIF

       ORG $3FF8

    .word START,START,START,START