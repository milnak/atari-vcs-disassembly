; Kung-Fu Master by Activision
;
; 2 button support for Genesis controllers
; added by Omegamatrix
;
;  version 1:
;  - added basic 2 button support, roms has a few bugs
;
;  version 2:
;  (these haven't been tested yet!!
;  - fixed the controls so down and punch button will do a low punch.
;  - fixed the rom so multiple punches, kicks can be done by the firebuttons only.
;
;  version 3:
;  - fixed a branch bug that caused a boss from dying so easily.
;
;
;   Assumptions, i.e. possible sources of error (my own as well as the original game):
;   - found an AND instruction testing the overflow flag, see LF364
;   - cleared overflow flag to create unconditional branches, see LFC86
;   - used BRK to save 16 bytes, this routine is used to bankswitch, see BreakCode
;
;
;   Bank 0 is unchanged except for value loaded into Vblank, all changes occur in Bank 1
;
;
; Disassembly done using Distella 3.0
;
; KungFu1.cfg contents:
;
;      ORG D000
;      CODE D000 D0B6
;      GFX D0B7 D0B7
;      CODE D0B8 D3D4
;      GFX D3D5 D3D5
;      CODE D3D6 D3D7
;      GFX D3D8 D3D8
;      CODE D3D9 D590
;      GFX D591 D5BB
;      CODE D5BC D805
;      GFX D806 DDFF
;      CODE DE00 DE3E
;      GFX DE3F DFEB
;      CODE DFEC DFFB
;      GFX DFFC DFFF
;
;
; KungFu2.cfg contents:
;
;      ORG F000
;      CODE F000 F133
;      GFX F134 F134
;      CODE F135 F2B8
;      GFX F2B9 F2B9
;      CODE F2BA F56D
;      GFX F56E F56E
;      CODE F56F F5DE
;      GFX F5DF F5DF
;      CODE F5E0 F69B
;      GFX F69C F69C
;      CODE F69D F704
;      GFX F705 F705
;      CODE F706 F932
;      GFX F933 F933
;      CODE F934 F9DC
;      GFX F9DD F9DD
;      CODE F9DE FB45
;      GFX FB46 FB46
;      CODE FB47 FBF5
;      GFX FBF6 FBF6
;      CODE FBF7 FBFF
;      GFX FC00 FC00
;      CODE FC01 FC0D
;      GFX FC0E FC0E
;      CODE FC0F FC1A
;      GFX FC1B FC1B
;      CODE FC1C FC6C
;      GFX FC6D FC6D
;      CODE FC6E FC84
;      GFX FC85 FC85
;      CODE FC86 FE6E
;      GFX FE6F FFEB
;      CODE FFEC FFFB
;      GFX FFFC FFFF

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
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
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
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXP1FB  =  $03
CXPPMM  =  $07
INPT1   =  $09
INPT3   =  $0B
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
LFE6D   =   $FE6D


BANK_0       = $FFF8
BANK_1       = $FFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;1 = on, 0 = off

NEWCODE = 1    ; when this is set to zero, the new code is gone, and space filled in


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
frameCounter          = $80

scoreBCD              = $98  ; $98 - $9A
Timer                 = $9B  ; $9B - $9C
LifeBarPlayerPF2      = $CB
LifeBarPlayerBallPos  = $D8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $D000

START_Bank0:
    sei
    bit    BANK_1                ; bankswitch, clear ram

    nop                          ; free bytes
    nop
    nop
    nop
    nop
    nop
    nop
    nop

LD00C:
    bit    $CF                   ; 3
    bpl    LD020                 ; 2³
    bvs    LD029                 ; 2³
    ldx    $D2                   ; 3
    inx                          ; 2
    stx    scoreBCD+2            ; 3
    ldx    #0                    ; 2
    stx    scoreBCD              ; 3
    stx    scoreBCD+1            ; 3
    jmp    LD07E                 ; 3

LD020:
    bvs    LD025                 ; 2³
    jsr    LD7AE                 ; 6
LD025:
    ldx    #0                    ; 2
    bit    $A2                   ; 3
LD029:
    bmi    LD07E                 ; 2³
    bvc    LD02E                 ; 2³
    inx                          ; 2
LD02E:
    ldy    $B8                   ; 3
    dec    $BA                   ; 5
    bpl    LD05F                 ; 2³
    iny                          ; 2
    tya                          ; 2
    cmp    LDFD3,X               ; 4
    bcc    LD058                 ; 2³
    cmp    #$10                  ; 2
    bcs    LD07E                 ; 2³
    dec    $BB                   ; 5
    bpl    LD056                 ; 2³
    lda    $BB                   ; 3
    cmp    LDFD5,X               ; 4
    bcs    LD058                 ; 2³
    dec    $B9                   ; 5
    bpl    LD052                 ; 2³
    lda    #9                    ; 2
    sta    $B9                   ; 3
LD052:
    lda    #2                    ; 2
    sta    $BB                   ; 3
LD056:
    ldy    #0                    ; 2
LD058:
    sty    $B8                   ; 3
    lda    LDCFE,X               ; 4
    sta    $BA                   ; 3
LD05F:
    ldx    $B9                   ; 3
    lda    LDFD7,X               ; 4
    sta    $F7                   ; 3
    lda    #$D9                  ; 2
    sta    $F8                   ; 3
    lda    ($F7),Y               ; 5
    ldx    #1                    ; 2
    jsr    LD7F7                 ; 6
    bit    $A2                   ; 3
    bvc    LD082                 ; 2³
    dex                          ; 2
    lda    LD90F,Y               ; 4
    jsr    LD7F7                 ; 6
    bne    LD082                 ; 3   always branch

LD07E:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
LD082:
    ldy    $C0                   ; 3
    bne    LD089                 ; 2³
LD086:
    jmp    LD105                 ; 3

LD089:
    dec    $BE                   ; 5
    beq    LD086                 ; 2³
    lda    IndirectLoJumpTab,Y   ; 4
    sta    $F7                   ; 3
    lda    #>LD09B               ; 2   high pointer
    sta    $F8                   ; 3
    ldx    #$08                  ; 2
    jmp.ind ($00F7)              ; 5

LD09B:  ; indirect jump
    lda    LDAFD,Y               ; 4
    sta    AUDF0                 ; 3
    bne    LD10D                 ; 2³+1
LD0A2:  ; indirect jump
    stx    AUDF0                 ; 3
    bne    LD0F2                 ; 2³

LD0A6:  ; indirect jump
    ldy    #$1B                  ; 2
    sty    $B8                   ; 3
    lda    #$FF                  ; 2
    sta    $BA                   ; 3
LD0AE:  ; indirect jump
    ldy    #$1B                  ; 2
    lda    frameCounter          ; 3
    and    #$02                  ; 2
    bne    LD0B8                 ; 2³
    iny                          ; 2
    .byte $24 ; BIT opcode, skip 1 byte
LD0B8:
    dey                          ; 2
    sty    AUDF0                 ; 3
    ldx    $BE                   ; 3
    cpx    #$0C                  ; 2
    bcc    LD10D                 ; 2³+1
    ldx    #$0C                  ; 2
    bne    LD10D                 ; 2³+1

LD0C5:  ; indirect jump
    lda    #$10                  ; 2
    sta    AUDF0                 ; 3
    ldy    $BE                   ; 3
    ldx    LD84E,Y               ; 4
    jmp    LD10D                 ; 3

LD0D1: ;indirect jump
    stx    AUDF0                 ; 3
    lda    #6                    ; 2
    sec                          ; 2
    sbc    $BE                   ; 3
    tax                          ; 2
    jmp    LD10D                 ; 3

LD0DC: ;indirect jump
    lda    #$1D                  ; 2
    sta    AUDF0                 ; 3
    bne    LD0F2                 ; 2³

LD0E2: ;indirect jump
    lda    #$1D                  ; 2
    sta    AUDF0                 ; 3
    ldy    #2                    ; 2
    lda    frameCounter          ; 3
    and    #$02                  ; 2
    bne    LD0F0                 ; 2³
    ldy    #6                    ; 2
LD0F0:  ; indirect jump also
    sty    AUDC0                 ; 3
LD0F2:
    ldx    $BE                   ; 3
    bne    LD10D                 ; 2³+1
LD0F6:  ; indirect jump
    ldx    #$10                  ; 2
    lda    $BE                   ; 3
    cmp    #6                    ; 2
    bcs    LD0FF                 ; 2³
    tax                          ; 2
LD0FF:
    stx    AUDF0                 ; 3
    ldx    #6                    ; 2
    bne    LD10D                 ; 3   always branch

LD105:
    ldx    #0                    ; 2
    stx    $C0                   ; 3
    bit    $A2                   ; 3
    bvs    LD10F                 ; 2³
LD10D:
    stx    AUDV0                 ; 3
LD10F:
    inc    frameCounter          ; 5
    bne    LD126                 ; 2³
    inc    $83                   ; 5
    lda    $83                   ; 3
    and    #$C7                  ; 2
    sta    $83                   ; 3
    and    #$07                  ; 2
    bne    LD126                 ; 2³
    inc    $82                   ; 5
    bne    LD126                 ; 2³
    sec                          ; 2
    ror    $82                   ; 5
LD126:
    lda    $81                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $81                   ; 3
    asl                          ; 2
    rol    $81                   ; 5
    ldx    #6                    ; 2
LD132:
    lda    $C6,X                 ; 4   $CC
    cpx    #5                    ; 2
    bcc    LD13A                 ; 2³
    adc    #$4E                  ; 2
LD13A:
    ldy    #$FD                  ; 2
    sec                          ; 2
LD13D:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LD13D                 ; 2³
    sty    $D3,X                 ; 4   writes to $D9
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    and    #$F0                  ; 2
    ora    $D3,X                 ; 4
    sta    $D3,X                 ; 4   writes to $D9
    dex                          ; 2
    bpl    LD132                 ; 2³
    ldx    #4                    ; 2
LD157:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    scoreBCD,X            ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy $E0,Y                 ; 5
    lda    scoreBCD,X            ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $E2,Y                 ; 5
    dex                          ; 2
    bpl    LD157                 ; 2³
    inx                          ; 2
    ldy    #$9D                  ; 2
LD173:
    lda    $E0,X                 ; 4
    beq    LD17F                 ; 2³
    cpx    #$0C                  ; 2
    bcs    LD18B                 ; 2³
    ldx    #$0C                  ; 2
    bne    LD173                 ; 3   always branch

LD17F:
    cpx    #$0A                  ; 2
    beq    LD185                 ; 2³
    sty    $E0,X                 ; 4
LD185:
    inx                          ; 2
    inx                          ; 2
    cpx    #$12                  ; 2
    bcc    LD173                 ; 2³
LD18B:
    bit    $CE                   ; 3
    bvs    LD1A4                 ; 2³
    ldy    #9                    ; 2
    ldx    #$12                  ; 2
LD193:
    lda    LDEF5,Y               ; 4
    bit    frameCounter          ; 3
    bpl    LD19D                 ; 2³
    lda    LD905,Y               ; 4
LD19D:
    sta    $E0,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    LD193                 ; 2³
LD1A4:
    lda    $82                   ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$02                  ; 2

.waitVblank:
    ldx    INTIM
    bne    .waitVblank

    sta    WSYNC
;---------------------------------------
    sta    HMOVE
    sta    VBLANK                ; Vblank ends
    lda    #4                    ; Dark grey
    sta    COLUBK
    ldx    #<BlankDigit          ; 2
    stx    $F4                   ; 3
    bit    $CE                   ; 3
    bvs    LD1CA                 ; 2³
    ldx    #$20                  ; 2
    bit    frameCounter          ; 3
    bmi    LD1CA                 ; 2³
    ldx    #$38                  ; 2
LD1CA:
    stx    $F9                   ; 3   $D9, $20, or $38
    ldx    #$DF                  ; high nibble
    sta    REFP0                 ; no reflect
    sta    REFP1                 ; no reflect
    stx    VDELP0                ; delay
    sta    WSYNC
;---------------------------------------
    sta    HMOVE                 ;3  @3
    stx    $FA                   ;3  @6
    stx    VDELP1                ;3  @9    delay
    ldy    #$F3                  ;2  @11
    lda    #$0C                  ;2  @13   grey color for timer
    sta    COLUP0                ;3  @16
    sta    COLUP1                ;3  @19
    sty    NUSIZ0                ;3  @22
    sty    NUSIZ1                ;3  @25
    sta    RESP0                 ;3  @28
    sta    RESP1                 ;3  @31
    sty    HMP0                  ;3  @34
    jsr    SixDigitDisplay       ;6  @40   draw timer

    ldx    #$0C                  ;2  @22
    bit    $CE                   ; 3
    bvc    LD1FF                 ; 2³
    ldx    #$CC                  ; 2   green color for score, player 0
    lda    $85                   ; 3
    beq    LD1FF                 ; 2³
    ldx    #$4A                  ; 2   red color for score, player 1
LD1FF:
    stx    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    $EA                   ; 3
    sta    $F9                   ; 3
    lda    $EB                   ; 3
    sta    $FA                   ; 3
    ldx    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD211:
    lda    $E2,X                 ; 4   load score pointers
    sta    $EC,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD211                 ; 2³
    lda    $E0                   ; 3
    sta    $F4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    $F7                   ;3  @6    delay
    lda.w  $F7                   ;4  @10   delay
    jsr    Waste12Cylces         ;12 @22   delay
    jsr    Waste12Cylces         ;12 @34   delay
    jsr    SixDigitDisplay       ;6  @40   draw score

    lda    #$30                  ;2  @22   ball 8 clocks wide
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VDELP0                ; 3   no delay
    sta    VDELP1                ; 3

    ldy    $85                   ; 3
    ldx    $9F,Y                 ; 4
    lda    $A2                   ; 3
    lsr                          ; 2
    bcs    LD250                 ; 2³
    bit    $A2                   ; 3
    bvs    LD250                 ; 2³
    bmi    LD251                 ; 2³
    lda    frameCounter          ; 3
    and    #$20                  ; 2
    bne    LD251                 ; 2³
LD250:
    dex                          ; 2
LD251:
    lda    LD5A5,X               ; 4
    sta    NUSIZ0                ; 3
    sta    $F7                   ; 3
    ldy    #$42                  ; 2   color, red dots
    lda    #$C0                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    lda    LD5B5,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUP0                ; 3
    sta    $F6                   ; 3
    sta    $F8                   ; 3
    ldy    $85                   ; 3
    lda.wy $9D,Y                 ; 4
    beq    LD276                 ; 2³
    bpl    LD27A                 ; 2³
LD276:
    lda    #$9D                  ; 2
    bne    LD27D                 ; 3   always branch

LD27A:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LD27D:
    sta    $F9                   ; 3
    lda    #$DF                  ; 2
    sta    $FA                   ; 3
    lda    #4                    ; 2   make playfield same color as background...
    sta    COLUPF                ; 3
    lda    #$15                  ; 2
    sta    PF1                   ; 3
    lda    #$0A                  ; 2
    sta    PF2                   ; 3
    ldy    #7                    ; 2
    sta    HMCLR                 ; 3
LD293:
    lda    #$42                  ; 2   what for?
    sta    COLUP1                ; 3
    lda    LDBF1,Y               ; 4
    bit    $F7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bpl    LD2A4                 ; 2³
    bmi    LD2A6                 ; 3   always branch

LD2A4:
    sta    GRP0                  ; 3
LD2A6:
    ldx    LD97F,Y               ; 4
    stx    COLUPF                ; 3
    ldx    $F6                   ; 3
    stx    NUSIZ1                ; 3
    bit    $F8                   ; 3
    bpl    LD2B5                 ; 2³
    lda    #0                    ; 2
LD2B5:
    sta    GRP1                  ; 3
    ldx    #4                    ; 2
    nop                          ; 2
    lda    ($F9),Y               ; 5
    stx    NUSIZ1                ; 3
    sta    GRP1                  ; 3
    lda    #$0C                  ; 2
    sta    COLUP1                ; 3
    stx    COLUPF                ; 3
    dey                          ; 2
    bpl    LD293                 ; 2³

    iny                          ; 2
    sty    GRP0                  ; 3   clear
    sty    GRP1                  ; 3
    lda    #4                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUPF                ; 3
    dey                          ; 2
    sty    PF0                   ; 3   fill all, hide ball
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    #$84                  ; 2   blue
    sta    COLUBK                ; 3
    ldx    #$30                  ; 2
    lda    #$0C                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    CTRLPF                ; 3   ball 8 clocks
    stx    NUSIZ1                ; 3   1 copy player 0
    inx                          ; 2
    sta    VDELP0                ; 3   no delay
    stx    NUSIZ0                ; 3   2 copies close
    sta    COLUP0                ; 3   light grey
    sta    COLUP1                ; 3
    sta    VDELP1                ; 3   no delay
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $CB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LifeBarTab,X          ; 4
    sta    $F9                   ; 3
    lda    LifeBarPlayerBallPos  ; 3   $D8 the ball smoothes out the end of the players life bar
    sta    $FA                   ; 3
    ldy    #$FF                  ; 2
    sty    ENABL                 ; 3   ball is enabled, but hidden
    lda    #<PlayerGfxOne        ; 2   #$A5  low  pointers for "Player"
    sta    $EC                   ; 3
    lda    #<PlayerGfxTwo        ; 2   #$AA
    sta    $EE                   ; 3
    lda    #<PlayerGfxThree      ; 2   #$AF
    sta    $F0                   ; 3
    lda    #$1C                  ; 2   color, player lifebar
    sta    $F7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $FA                   ; 3   ball position, makes up player life bar
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $FA                   ; 3
LD32A:
    dex                          ; 2
    bpl    LD32A                 ; 2³
    sta.w  RESBL                 ; 4
    sta    HMBL                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    ldy    #4                    ; 2
    jsr    DrawLifeBar           ; 6   draw "Player" lifebar
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #4                    ; 2
    sta    COLUBK                ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    #<EnemyGfxOne         ; 2   #$B4
    sta    $EC                   ; 3
    lda    #<EnemyGfxTwo         ; 2   #$B9
    sta    $EE                   ; 3
    lda    #<EnemyGfxThree       ; 2   #$BE
    sta    $F0                   ; 3
    lda    #$44                  ; 2   color, enemy lifebar
    sta    $F7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    sty    PF1                   ; 3
    lda    #$84                  ; 2   blue
    sta    COLUBK                ; 3
    lda    $CC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LifeBarTab,X          ; 4
    sta    $F9                   ; 3
    lda    $D9                   ; 3   $D9 Enemy life bar
    sta    $FA                   ; 3
    sty    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $FA                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $FA                   ; 3
LD381:
    dex                          ; 2
    bpl    LD381                 ; 2³
    sta.w  RESBL                 ; 4
    sta    HMBL                  ; 3
    ldy    #4                    ; 2
    jsr    DrawLifeBar           ; 6   draw "Enemy" lifebar
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #4                    ; 2
    sta    COLUBK                ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    ENABL                 ; 3
    sty    PF2                   ; 3
    sty    NUSIZ0                ; 3
    lda    #$30                  ; 2
    sta.w  NUSIZ1                ; 4
    lda    #$10                  ; 2
    sty    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    lda    #$B0                  ; 2
    sta    HMM1                  ; 3
    lda    $D5                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda.w  frameCounter          ; 4
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    ldy    $DE                   ; 3
    bmi    LD3D6                 ; 2³
    cpy    #6                    ; 2
    beq    LD3D9                 ; 2³
    lda    #2                    ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LD3D6:
    ora    #$40                  ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LD3D9:
    ora    #$18                  ; 2
    sta    COLUPF                ; 3
    ldy    $91                   ; 3
    sty    CTRLPF                ; 3
    lda    #0                    ; 2
    ldy    #$0A                  ; 2
    sty    ENAM1                 ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    $D5                   ; 3
    sta.w  HMP1                  ; 4
LD3F2:
    dex                          ; 2
    bpl    LD3F2                 ; 2³
    sta    RESP1                 ; 3
LD3F7:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD87B,Y               ; 4
    sta    COLUBK                ; 3
    dey                          ; 2
    bpl    LD3F7                 ; 2³
    lda    $D3                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $D4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta.w  HMP0                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sec                          ; 2
LD411:
    dey                          ; 2
    bpl    LD411                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D3                   ; 3
    sta    HMM0                  ; 3
    ldy    #$1C                  ; 2
    lda    #$67                  ; 2
LD420:
    dex                          ; 2
    bpl    LD420                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUBK                ; 3
    sty    COLUP0                ; 3
    sbc    $A3                   ; 3
    tay                          ; 2
    lda    #$C0                  ; 2
    sta    GRP0                  ; 3
    lda    #$16                  ; 2
    sta    NUSIZ0                ; 3
    sta    ENAM0                 ; 3
    sta    HMCLR                 ; 3
    sta    HMP0                  ; 3
    lda    #$23                  ; 2
    sec                          ; 2
    sbc    $B7                   ; 3
    sta    $E0                   ; 3
    lda    $C4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    tax                          ; 2
    lda    LD59F,X               ; 4
    sta    $F7                   ; 3
    lda    LD5A2,X               ; 4
    sta    $F8                   ; 3
    lda    $F7                   ; 3
    ldx    #$14                  ; 2
    sta    HMCLR                 ; 3
LD45C:
    lda    ($A6),Y               ; 5
    sta    $F9                   ; 3
    cpx    #5                    ; 2
    txs                          ; 2
    lda    LD8F0,X               ; 4
    tax                          ; 2
    lda    #$86                  ; 2
    bcs    LD470                 ; 2³
    lda    #0                    ; 2
    sta    $F9                   ; 3
    txa                          ; 2
LD470:
    cpy    $B4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    stx    COLUP0                ; 3
    bcs    LD484                 ; 2³
    lda    $F9                   ; 3
    sta    GRP1                  ; 3
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
LD484:
    tsx                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LD45C                 ; 2³
    inx                          ; 2
    stx    ENAM0                 ; 3
    stx    GRP0                  ; 3
    lda    $D6                   ; 3
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    dey                          ; 2
    dey                          ; 2
    sty    $F9                   ; 3
    lda    $D7                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1C                  ; 2
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    COLUP1                ; 3
LD4AA:
    dey                          ; 2
    bpl    LD4AA                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$87                  ; 2
    sty    VDELP0                ; 3
    iny                          ; 2
    sty    GRP1                  ; 3
LD4B8:
    dex                          ; 2
    bpl    LD4B8                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    ldy    $F9                   ; 3
    cpy    $B4                   ; 3
    bcs    LD4D1                 ; 2³
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
LD4D1:
    dey                          ; 2
    lda    $DA                   ; 3
    sta    REFP0                 ; 3
    sta    ENAM1                 ; 3
    lda    $DC                   ; 3
    sta    REFP1                 ; 3
    lda    $BF                   ; 3
    ora    #$30                  ; 2
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    cpy    $B4                   ; 3
    bcs    LD4EC                 ; 2³
    lda    ($A6),Y               ; 5
LD4EC:
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
    dey                          ; 2
    sta    CXCLR                 ; 3
    sty    $F9                   ; 3
    ldx    #$1C                  ; 2
    bne    LD509                 ; 3   always branch

LD501:
    lda    $F7                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    beq    LD523                 ; 3   always branch

LD509:
    txa                          ; 2
    tay                          ; 2
    lda    ($AC),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B0),Y               ; 5
    ldy    $F9                   ; 3
    cpy    $B4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUP0                ; 3
    bcs    LD501                 ; 2³
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
    lda    ($A6),Y               ; 5
LD523:
    sta    GRP1                  ; 3
    dec    $F9                   ; 5
    dex                          ; 2
    bne    LD509                 ; 2³
    txa                          ; 2
    tay                          ; 2
    lda    ($AC),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($B0),Y               ; 5
    ldy    $F9                   ; 3
    dec    $F9                   ; 5
    cpy    $B4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUP0                ; 3
    bcs    LD54B                 ; 2³
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
LD548:
    jmp.ind ($00F7)              ; 5

LD54B:
    stx    GRP1                  ; 3
    lda    $F7                   ; 3
    lda    $F7                   ; 3
    lda    $F7                   ; 3
    jmp    LD548                 ; 3

    ldy    #$23                  ; 2
    ldx    $E0                   ; 3
LD55A:
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    cpx    #5                    ; 2
    bcs    LD58B                 ; 2³
    lda    $8B,X                 ; 4
    sta    HMBL                  ; 3
    sta    ENABL                 ; 3
LD568:
    txs                          ; 2
    lda    ($A8),Y               ; 5
    sta    HMP0                  ; 3
    tax                          ; 2
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
    sta    HMOVE                 ; 3
    stx    NUSIZ0                ; 3
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($AE),Y               ; 5
    sta.w  COLUP0                ; 4
    tsx                          ; 2
    dex                          ; 2
    dey                          ; 2
    cpy    #4                    ; 2
    bcs    LD55A                 ; 2³
    ldx    #3                    ; 2
    jmp    LD641                 ; 3

LD58B:
    lda    $F7                   ; 3
    lda    $F7                   ; 3
    bcs    LD568                 ; 3   always branch

LD591:
    .byte $00 ; |        | $D591
    .byte $00 ; |        | $D592
    .byte $00 ; |        | $D593
    .byte $00 ; |        | $D594
    .byte $1C ; |   XXX  | $D595
    .byte $1A ; |   XX X | $D596
    .byte $1A ; |   XX X | $D597
    .byte $18 ; |   XX   | $D598
    .byte $32 ; |  XX  X | $D599
    .byte $32 ; |  XX  X | $D59A
    .byte $32 ; |  XX  X | $D59B
    .byte $32 ; |  XX  X | $D59C
    .byte $32 ; |  XX  X | $D59D
    .byte $32 ; |  XX  X | $D59E
LD59F:
    .byte $56 ; | X X XX | $D59F
    .byte $BC ; |X XXXX  | $D5A0
    .byte $11 ; |   X   X| $D5A1
LD5A2:
    .byte $D5 ; |XX X X X| $D5A2
    .byte $D5 ; |XX X X X| $D5A3
    .byte $D6 ; |XX X XX | $D5A4
LD5A5:
    .byte $FF ; |XXXXXXXX| $D5A5
    .byte $00 ; |        | $D5A6
    .byte $00 ; |        | $D5A7
    .byte $01 ; |       X| $D5A8
    .byte $01 ; |       X| $D5A9
    .byte $03 ; |      XX| $D5AA
    .byte $03 ; |      XX| $D5AB
LifeBarTab:
    .byte $00 ; |        | $D5AC
    .byte $03 ; |      XX| $D5AD   life bars
    .byte $0F ; |    XXXX| $D5AE
    .byte $3F ; |  XXXXXX| $D5AF
    .byte $FF ; |XXXXXXXX| $D5B0
    .byte $FF ; |XXXXXXXX| $D5B1
    .byte $FF ; |XXXXXXXX| $D5B2
    .byte $FF ; |XXXXXXXX| $D5B3
    .byte $FF ; |XXXXXXXX| $D5B4
LD5B5:
    .byte $FF ; |XXXXXXXX| $D5B5
    .byte $FF ; |XXXXXXXX| $D5B6
    .byte $00 ; |        | $D5B7
    .byte $00 ; |        | $D5B8
    .byte $01 ; |       X| $D5B9
    .byte $01 ; |       X| $D5BA
    .byte $03 ; |      XX| $D5BB

    ldy    #$23                  ; 2
LD5BE:
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A8),Y               ; 5
    sta    HMP0                  ; 3
    tax                          ; 2
    lda    ($AA),Y               ; 5
    sta    HMP1                  ; 3
    sta    NUSIZ1                ; 3
    lda    ($AE),Y               ; 5
    sta    COLUP0                ; 3
    lda    ($B2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUP1                ; 3
    stx    NUSIZ0                ; 3
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    cpy    #4                    ; 2
    bcs    LD5BE                 ; 2³
    bcc    LD5E6                 ; 3   always branch

LD5E6:
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A8),Y               ; 5
    sta    HMP0                  ; 3
    tax                          ; 2
    lda    ($AA),Y               ; 5
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    NUSIZ1                ; 3
    stx    NUSIZ0                ; 3
    lda    LDD00,Y               ; 4
    sta    COLUBK                ; 3
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LD5E6                 ; 2³+1
    bmi    LD66E                 ; 3   always branch

LD609:
    lda    $F7                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #0                    ; 2
    beq    LD637                 ; 3   always branch


    ldx    #$23                  ; 2
    lda    $F7                   ; 3
    nop                          ; 2
    nop                          ; 2
LD617:
    txa                          ; 2
    tay                          ; 2
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A8),Y               ; 5
    sta    HMP0                  ; 3
    txs                          ; 2
    tax                          ; 2
    lda    ($AE),Y               ; 5
    ldy    $F9                   ; 3
    cpy    $B4                   ; 3
    sta    COLUP0                ; 3
    sta    HMOVE                 ; 3
    stx    NUSIZ0                ; 3
    bcs    LD609                 ; 2³
    lda    ($B2),Y               ; 5
    sta    COLUP1                ; 3
    lda    ($A6),Y               ; 5
LD637:
    sta    GRP1                  ; 3
    dec    $F9                   ; 5
    tsx                          ; 2
    dex                          ; 2
    cpx    #4                    ; 2
    bcs    LD617                 ; 2³
LD641:
    txa                          ; 2
    tay                          ; 2
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A8),Y               ; 5
    sta    HMP0                  ; 3
    txs                          ; 2
    tax                          ; 2
    lda    LDD00,Y               ; 4
    ldy    $F9                   ; 3
    cpy    $B4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    bcs    LD66A                 ; 2³
    lda    ($A6),Y               ; 5
LD65E:
    sta    GRP1                  ; 3
    stx    NUSIZ0                ; 3
    dec    $F9                   ; 5
    tsx                          ; 2
    dex                          ; 2
    bpl    LD641                 ; 2³
    bmi    LD66E                 ; 3   always branch

LD66A:
    lda    #0                    ; 2
    beq    LD65E                 ; 3   always branch

LD66E:
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #$30                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM1                 ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    COLUP1                ; 3
    sta    NUSIZ1                ; 3
    lda    CXPPMM                ; 3
    and    #$80                  ; 2
    ora    WSYNC                 ; 3
;---------------------------------------
    sta    $F6                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $85                   ; 3
    ldy    $9F,X                 ; 4
    lda    #<LD88D               ; 2
    dey                          ; 2
    sty    $F9                   ; 3
    beq    LD69F                 ; 2³
    lda    #<LD87F               ; 2
LD69F:
    sta    $F7                   ; 3
    lda    #>LD87F               ; 2   LD88D as well
    sta    $F8                   ; 3
    lda    $D3                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $D4                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
LD6BD:
    dey                          ; 2
    bpl    LD6BD                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$26                  ; 2
    sta    COLUBK                ; 3
    ldy    #0                    ; 2
    lda    $F7                   ; 3
LD6CC:
    dex                          ; 2
    bpl    LD6CC                 ; 2³
    sta    RESP1                 ; 3
LD6D1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDD03,Y               ; 4
    sta    COLUBK                ; 3
    lda    LDD75,Y               ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #6                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$1C                  ; 2
    sta    ENAM1                 ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    iny                          ; 2
    cpy    #$13                  ; 2
    bcc    LD6D1                 ; 2³
    ldy    #$0D                  ; 2
LD6F6:
    ldx    LDAD3,Y               ; 4
    lda    $F9                   ; 3
    beq    LD6FF                 ; 2³
    ldx    #0                    ; 2
LD6FF:
    lda    ($F7),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    LD591,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    dey                          ; 2
    bpl    LD6F6                 ; 2³+1
    lda    #$1E                  ; 2
    ldx    #$02 ; 82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3
    ldy    SWCHA                 ; 4
    iny                          ; 2
    beq    LD72A                 ; 2³
    ldy    #0                    ; 2
    sty    $82                   ; 3
LD72A:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LD75E                 ; 2³
    lsr                          ; 2
    bcs    LD770                 ; 2³
    lda    $D0                   ; 3
    beq    LD73B                 ; 2³
    dec    $D0                   ; 5
    bpl    LD77C                 ; 2³
LD73B:
    lda    $D2                   ; 3
    eor    #$01                  ; 2
    sta    $D2                   ; 3
    sty    $C0                   ; 3
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    lda    #$80                  ; 2
    sta    $CF                   ; 3
    sty    $85                   ; 3
    lsr                          ; 2
    bit    $CE                   ; 3
    bvs    LD758                 ; 2³
    sta    $CE                   ; 3
    sty    Timer                 ; 3
    sty    Timer+1               ; 3
LD758:
    ldy    #$25                  ; 2
    sta    $A2                   ; 3
    bne    LD770                 ; 3   always branch

LD75E:
    bit    $CE                   ; 3
    bmi    LD77C                 ; 2³
    lda    #$C0                  ; 2
    sta    $CE                   ; 3
    sta    $CF                   ; 3
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    iny                          ; 2
    jmp    LDFF2                 ; 3

LD770:
    sty    $D0                   ; 3
    bit    $CE                   ; 3
    bpl    LD77C                 ; 2³
    sty    $CF                   ; 3
    lda    #$40                  ; 2
    sta    $CE                   ; 3
LD77C:
    ldy    #0                    ; 2
    jmp    LDFF2                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawLifeBar SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($EC),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F0),Y               ; 5
    ldx    $F9                   ; 3   draw life bar
    stx    PF2                   ; 3
    sta    GRP0                  ; 3
    lda    $F7                   ; 3
    sta    COLUPF                ; 3
    lda    #$C0                  ; 2
    sta    PF0                   ; 3
    ldx    #4                    ; 2
    lda    #$FF                  ; 2
    stx.w  COLUPF                ; 4
    sta    PF0                   ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    bpl    DrawLifeBar           ; 2³
LD7AD:
    rts                          ; 6

LD7AE:
    lda    $A2                   ; 3
    lsr                          ; 2
    bcs    LD7AD                 ; 2³
    lda    $C5                   ; 3
    beq    LD7BF                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LD7BF                 ; 2³
    dec    $C5                   ; 5
LD7BF:
    lda    $CC                   ; 3
    beq    LD7CF                 ; 2³
    cmp    #$27                  ; 2
    bcs    LD7CF                 ; 2³
    lda    frameCounter          ; 3
    and    #$3F                  ; 2
    bne    LD7CF                 ; 2³
    inc    $CC                   ; 5
LD7CF:
    bit    $BD                   ; 3
    bpl    LD7F6                 ; 2³
    lda    $B6                   ; 3
    bmi    LD7F6                 ; 2³
    ldx    $BF                   ; 3
    lda    frameCounter          ; 3
    and    LD91F,X               ; 4
    bne    LD7F6                 ; 2³
    dec    $CB                   ; 5
    bne    LD7F6                 ; 2³
    sta    $CB                   ; 3
    ldy    #9                    ; 2
    sty    $C0                   ; 3
    lda    #$27                  ; 2
    sta    $BE                   ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #1                    ; 2
    sta    $A2                   ; 3
LD7F6:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD7F7 SUBROUTINE
    sta    AUDF0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0C                  ; 2
    sta    AUDC0,X               ; 4
    lda    LDBFE,X               ; 4
    sta    AUDV0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $D806
    .byte $54 ; | X X X  | $D807
    .byte $38 ; |  XXX   | $D808
    .byte $7C ; | XXXXX  | $D809
    .byte $FE ; |XXXXXXX | $D80A
    .byte $BA ; |X XXX X | $D80B
    .byte $10 ; |   X    | $D80C
    .byte $7C ; | XXXXX  | $D80D
    .byte $54 ; | X X X  | $D80E
    .byte $FE ; |XXXXXXX | $D80F
    .byte $FE ; |XXXXXXX | $D810
    .byte $FE ; |XXXXXXX | $D811
    .byte $BA ; |X XXX X | $D812
    .byte $10 ; |   X    | $D813
    .byte $7C ; | XXXXX  | $D814
    .byte $54 ; | X X X  | $D815
    .byte $D6 ; |XX X XX | $D816
    .byte $92 ; |X  X  X | $D817
    .byte $38 ; |  XXX   | $D818
    .byte $7C ; | XXXXX  | $D819
    .byte $38 ; |  XXX   | $D81A
    .byte $10 ; |   X    | $D81B
    .byte $7C ; | XXXXX  | $D81C
    .byte $FE ; |XXXXXXX | $D81D
    .byte $C6 ; |XX   XX | $D81E
    .byte $54 ; | X X X  | $D81F
    .byte $10 ; |   X    | $D820
    .byte $38 ; |  XXX   | $D821
    .byte $7C ; | XXXXX  | $D822
    .byte $7C ; | XXXXX  | $D823
    .byte $7C ; | XXXXX  | $D824
    .byte $C6 ; |XX   XX | $D825
    .byte $92 ; |X  X  X | $D826
    .byte $38 ; |  XXX   | $D827
    .byte $38 ; |  XXX   | $D828
    .byte $7C ; | XXXXX  | $D829
    .byte $7C ; | XXXXX  | $D82A
    .byte $38 ; |  XXX   | $D82B
    .byte $00 ; |        | $D82C
    .byte $1C ; |   XXX  | $D82D
    .byte $3E ; |  XXXXX | $D82E
    .byte $76 ; | XXX XX | $D82F
    .byte $63 ; | XX   XX| $D830
    .byte $63 ; | XX   XX| $D831
    .byte $F1 ; |XXXX   X| $D832
    .byte $C1 ; |XX     X| $D833
    .byte $C0 ; |XX      | $D834
    .byte $70 ; | XXX    | $D835
    .byte $60 ; | XX     | $D836
    .byte $78 ; | XXXX   | $D837
    .byte $50 ; | X X    | $D838
    .byte $50 ; | X X    | $D839
    .byte $28 ; |  X X   | $D83A
    .byte $3C ; |  XXXX  | $D83B
    .byte $38 ; |  XXX   | $D83C
    .byte $2C ; |  X XX  | $D83D
    .byte $38 ; |  XXX   | $D83E
    .byte $70 ; | XXX    | $D83F
    .byte $58 ; | X XX   | $D840
    .byte $70 ; | XXX    | $D841
    .byte $38 ; |  XXX   | $D842
    .byte $2C ; |  X XX  | $D843
    .byte $38 ; |  XXX   | $D844
    .byte $1E ; |   XXXX | $D845
    .byte $14 ; |   X X  | $D846
    .byte $0E ; |    XXX | $D847
    .byte $1E ; |   XXXX | $D848
    .byte $FC ; |XXXXXX  | $D849
    .byte $1F ; |   XXXXX| $D84A
    .byte $3E ; |  XXXXX | $D84B
    .byte $FB ; |XXXXX XX| $D84C
    .byte $8E ; |X   XXX | $D84D
LD84E:
    .byte $06 ; |     XX | $D84E
    .byte $00 ; |        | $D84F
    .byte $01 ; |       X| $D850
    .byte $02 ; |      X | $D851
    .byte $03 ; |      XX| $D852
    .byte $02 ; |      X | $D853
    .byte $00 ; |        | $D854
    .byte $00 ; |        | $D855
    .byte $10 ; |   X    | $D856
    .byte $02 ; |      X | $D857
    .byte $9C ; |X  XXX  | $D858
    .byte $3E ; |  XXXXX | $D859
    .byte $7E ; | XXXXXX | $D85A
    .byte $63 ; | XX   XX| $D85B
    .byte $63 ; | XX   XX| $D85C
    .byte $F3 ; |XXXX  XX| $D85D
    .byte $C1 ; |XX     X| $D85E
    .byte $C0 ; |XX      | $D85F
    .byte $74 ; | XXX X  | $D860
    .byte $62 ; | XX   X | $D861
    .byte $78 ; | XXXX   | $D862
    .byte $53 ; | X X  XX| $D863
    .byte $52 ; | X X  X | $D864
    .byte $28 ; |  X X   | $D865
    .byte $BC ; |X XXXX  | $D866
    .byte $B9 ; |X XXX  X| $D867
    .byte $2D ; |  X XX X| $D868
    .byte $39 ; |  XXX  X| $D869
    .byte $72 ; | XXX  X | $D86A
    .byte $58 ; | X XX   | $D86B
    .byte $70 ; | XXX    | $D86C
    .byte $39 ; |  XXX  X| $D86D
    .byte $2D ; |  X XX X| $D86E
    .byte $B8 ; |X XXX   | $D86F
    .byte $DE ; |XX XXXX | $D870
    .byte $14 ; |   X X  | $D871
    .byte $8E ; |X   XXX | $D872
    .byte $0E ; |    XXX | $D873
    .byte $FC ; |XXXXXX  | $D874
    .byte $5F ; | X XXXXX| $D875
    .byte $3E ; |  XXXXX | $D876
    .byte $FB ; |XXXXX XX| $D877
    .byte $8E ; |X   XXX | $D878
    .byte $26 ; |  X  XX | $D879
    .byte $30 ; |  XX    | $D87A
LD87B:
    .byte $44 ; | X   X  | $D87B
    .byte $44 ; | X   X  | $D87C
    .byte $00 ; |        | $D87D
    .byte $00 ; |        | $D87E
LD87F:
    .byte $C6 ; |XX   XX | $D87F
    .byte $C4 ; |XX   X  | $D880
    .byte $C4 ; |XX   X  | $D881
    .byte $C2 ; |XX    X | $D882
    .byte $02 ; |      X | $D883
    .byte $C6 ; |XX   XX | $D884
    .byte $C4 ; |XX   X  | $D885
    .byte $C2 ; |XX    X | $D886
    .byte $02 ; |      X | $D887
    .byte $C6 ; |XX   XX | $D888
    .byte $C4 ; |XX   X  | $D889
    .byte $02 ; |      X | $D88A
    .byte $C4 ; |XX   X  | $D88B
    .byte $C2 ; |XX    X | $D88C
LD88D:
    .byte $86 ; |X    XX | $D88D
    .byte $86 ; |X    XX | $D88E
    .byte $86 ; |X    XX | $D88F
    .byte $86 ; |X    XX | $D890
    .byte $86 ; |X    XX | $D891
    .byte $86 ; |X    XX | $D892
    .byte $84 ; |X    X  | $D893
    .byte $84 ; |X    X  | $D894
    .byte $82 ; |X     X | $D895
    .byte $82 ; |X     X | $D896
    .byte $80 ; |X       | $D897
    .byte $80 ; |X       | $D898
    .byte $80 ; |X       | $D899
    .byte $80 ; |X       | $D89A
    .byte $CA ; |XX  X X | $D89B
    .byte $CA ; |XX  X X | $D89C
    .byte $CA ; |XX  X X | $D89D
    .byte $CA ; |XX  X X | $D89E
    .byte $CA ; |XX  X X | $D89F
    .byte $CA ; |XX  X X | $D8A0
    .byte $CA ; |XX  X X | $D8A1
    .byte $CA ; |XX  X X | $D8A2
    .byte $CA ; |XX  X X | $D8A3
    .byte $CA ; |XX  X X | $D8A4
    .byte $CA ; |XX  X X | $D8A5
    .byte $CA ; |XX  X X | $D8A6
    .byte $CA ; |XX  X X | $D8A7
    .byte $CC ; |XX  XX  | $D8A8
    .byte $CA ; |XX  X X | $D8A9
    .byte $CC ; |XX  XX  | $D8AA
    .byte $C8 ; |XX  X   | $D8AB
    .byte $CC ; |XX  XX  | $D8AC
    .byte $C8 ; |XX  X   | $D8AD
    .byte $CC ; |XX  XX  | $D8AE
    .byte $CA ; |XX  X X | $D8AF
    .byte $CC ; |XX  XX  | $D8B0
    .byte $CA ; |XX  X X | $D8B1
    .byte $CA ; |XX  X X | $D8B2
    .byte $CA ; |XX  X X | $D8B3
    .byte $CA ; |XX  X X | $D8B4
    .byte $CA ; |XX  X X | $D8B5
    .byte $C8 ; |XX  X   | $D8B6
    .byte $D8 ; |XX XX   | $D8B7
    .byte $DA ; |XX XX X | $D8B8
    .byte $DA ; |XX XX X | $D8B9
    .byte $D8 ; |XX XX   | $D8BA
    .byte $D8 ; |XX XX   | $D8BB
    .byte $D6 ; |XX X XX | $D8BC
    .byte $0E ; |    XXX | $D8BD
    .byte $0E ; |    XXX | $D8BE
    .byte $0E ; |    XXX | $D8BF
    .byte $0E ; |    XXX | $D8C0
    .byte $0E ; |    XXX | $D8C1
    .byte $0E ; |    XXX | $D8C2
    .byte $0E ; |    XXX | $D8C3
    .byte $0E ; |    XXX | $D8C4
    .byte $0E ; |    XXX | $D8C5
    .byte $0C ; |    XX  | $D8C6
    .byte $0C ; |    XX  | $D8C7
    .byte $0C ; |    XX  | $D8C8
    .byte $0C ; |    XX  | $D8C9
    .byte $0C ; |    XX  | $D8CA
    .byte $0C ; |    XX  | $D8CB
    .byte $0C ; |    XX  | $D8CC
    .byte $0C ; |    XX  | $D8CD
    .byte $0C ; |    XX  | $D8CE
    .byte $0C ; |    XX  | $D8CF
    .byte $0C ; |    XX  | $D8D0
    .byte $0C ; |    XX  | $D8D1
    .byte $0C ; |    XX  | $D8D2
    .byte $0C ; |    XX  | $D8D3
    .byte $0E ; |    XXX | $D8D4
    .byte $0E ; |    XXX | $D8D5
    .byte $0E ; |    XXX | $D8D6
    .byte $0E ; |    XXX | $D8D7
    .byte $0C ; |    XX  | $D8D8
    .byte $0C ; |    XX  | $D8D9
    .byte $0C ; |    XX  | $D8DA
    .byte $0E ; |    XXX | $D8DB
    .byte $0E ; |    XXX | $D8DC
    .byte $0E ; |    XXX | $D8DD
    .byte $0E ; |    XXX | $D8DE
    .byte $0E ; |    XXX | $D8DF
    .byte $0E ; |    XXX | $D8E0
    .byte $0E ; |    XXX | $D8E1
    .byte $0E ; |    XXX | $D8E2
    .byte $0E ; |    XXX | $D8E3
    .byte $36 ; |  XX XX | $D8E4
    .byte $38 ; |  XXX   | $D8E5
    .byte $38 ; |  XXX   | $D8E6
    .byte $3A ; |  XXX X | $D8E7
    .byte $3A ; |  XXX X | $D8E8
    .byte $3C ; |  XXXX  | $D8E9
    .byte $3C ; |  XXXX  | $D8EA
    .byte $3A ; |  XXX X | $D8EB
    .byte $3A ; |  XXX X | $D8EC
    .byte $38 ; |  XXX   | $D8ED
    .byte $38 ; |  XXX   | $D8EE
    .byte $36 ; |  XX XX | $D8EF
LD8F0:
    .byte $42 ; | X    X | $D8F0
    .byte $42 ; | X    X | $D8F1
    .byte $42 ; | X    X | $D8F2
    .byte $1C ; |   XXX  | $D8F3
    .byte $1C ; |   XXX  | $D8F4
    .byte $44 ; | X   X  | $D8F5
    .byte $18 ; |   XX   | $D8F6
    .byte $44 ; | X   X  | $D8F7
    .byte $18 ; |   XX   | $D8F8
    .byte $44 ; | X   X  | $D8F9
    .byte $18 ; |   XX   | $D8FA
    .byte $44 ; | X   X  | $D8FB
    .byte $18 ; |   XX   | $D8FC
    .byte $44 ; | X   X  | $D8FD
    .byte $18 ; |   XX   | $D8FE
    .byte $44 ; | X   X  | $D8FF
    .byte $18 ; |   XX   | $D900
    .byte $44 ; | X   X  | $D901
    .byte $18 ; |   XX   | $D902
    .byte $44 ; | X   X  | $D903
    .byte $18 ; |   XX   | $D904
LD905:
    .byte $9D ; |X  XXX X| $D905
    .byte $9D ; |X  XXX X| $D906
    .byte $9D ; |X  XXX X| $D907
    .byte $C3 ; |XX    XX| $D908
    .byte $CB ; |XX  X XX| $D909
    .byte $9D ; |X  XXX X| $D90A
    .byte $78 ; | XXXX   | $D90B
    .byte $08 ; |    X   | $D90C
    .byte $48 ; | X  X   | $D90D
    .byte $40 ; | X      | $D90E
LD90F:
    .byte $6D ; | XX XX X| $D90F
    .byte $6F ; | XX XXXX| $D910
    .byte $72 ; | XXX  X | $D911
    .byte $74 ; | XXX X  | $D912
    .byte $77 ; | XXX XXX| $D913
    .byte $7B ; | XXXX XX| $D914
    .byte $77 ; | XXX XXX| $D915
    .byte $77 ; | XXX XXX| $D916
    .byte $7B ; | XXXX XX| $D917
    .byte $00 ; |        | $D918
    .byte $00 ; |        | $D919
    .byte $00 ; |        | $D91A
    .byte $72 ; | XXX  X | $D91B
    .byte $00 ; |        | $D91C
    .byte $6F ; | XX XXXX| $D91D
    .byte $6D ; | XX XX X| $D91E
LD91F:
    .byte $0F ; |    XXXX| $D91F
    .byte $07 ; |     XXX| $D920
    .byte $07 ; |     XXX| $D921
    .byte $03 ; |      XX| $D922
    .byte $00 ; |        | $D923
    .byte $10 ; |   X    | $D924
    .byte $38 ; |  XXX   | $D925
    .byte $7C ; | XXXXX  | $D926
    .byte $FE ; |XXXXXXX | $D927
    .byte $BA ; |X XXX X | $D928
    .byte $10 ; |   X    | $D929
    .byte $7C ; | XXXXX  | $D92A
    .byte $44 ; | X   X  | $D92B
    .byte $C6 ; |XX   XX | $D92C
    .byte $92 ; |X  X  X | $D92D
    .byte $38 ; |  XXX   | $D92E
    .byte $7C ; | XXXXX  | $D92F
    .byte $38 ; |  XXX   | $D930
    .byte $10 ; |   X    | $D931
    .byte $7C ; | XXXXX  | $D932
    .byte $FE ; |XXXXXXX | $D933
    .byte $C6 ; |XX   XX | $D934
    .byte $54 ; | X X X  | $D935
    .byte $10 ; |   X    | $D936
    .byte $38 ; |  XXX   | $D937
    .byte $7C ; | XXXXX  | $D938
    .byte $7C ; | XXXXX  | $D939
    .byte $7C ; | XXXXX  | $D93A
    .byte $C4 ; |XX   X  | $D93B
    .byte $92 ; |X  X  X | $D93C
    .byte $38 ; |  XXX   | $D93D
    .byte $38 ; |  XXX   | $D93E
    .byte $7C ; | XXXXX  | $D93F
    .byte $7C ; | XXXXX  | $D940
    .byte $38 ; |  XXX   | $D941
    .byte $00 ; |        | $D942
    .byte $90 ; |X  X    | $D943
    .byte $A8 ; |X X X   | $D944
    .byte $AA ; |X X X X | $D945
    .byte $AD ; |X X XX X| $D946
    .byte $AD ; |X X XX X| $D947
    .byte $D5 ; |XX X X X| $D948
    .byte $B5 ; |X XX X X| $D949
    .byte $FD ; |XXXXXX X| $D94A
    .byte $F9 ; |XXXXX  X| $D94B
    .byte $F1 ; |XXXX   X| $D94C
    .byte $FE ; |XXXXXXX | $D94D
    .byte $FE ; |XXXXXXX | $D94E
    .byte $F0 ; |XXXX    | $D94F
    .byte $B8 ; |X XXX   | $D950
    .byte $F8 ; |XXXXX   | $D951
    .byte $9C ; |X  XXX  | $D952
    .byte $CC ; |XX  XX  | $D953
    .byte $6C ; | XX XX  | $D954
    .byte $E8 ; |XXX X   | $D955
    .byte $F8 ; |XXXXX   | $D956
    .byte $70 ; | XXX    | $D957
    .byte $60 ; | XX     | $D958
    .byte $34 ; |  XX X  | $D959
    .byte $30 ; |  XX    | $D95A
    .byte $3C ; |  XXXX  | $D95B
    .byte $1C ; |   XXX  | $D95C
    .byte $18 ; |   XX   | $D95D
    .byte $00 ; |        | $D95E
    .byte $28 ; |  X X   | $D95F
    .byte $10 ; |   X    | $D960
    .byte $38 ; |  XXX   | $D961
    .byte $7C ; | XXXXX  | $D962
    .byte $38 ; |  XXX   | $D963
    .byte $10 ; |   X    | $D964
    .byte $7C ; | XXXXX  | $D965
    .byte $44 ; | X   X  | $D966
    .byte $82 ; |X     X | $D967
    .byte $10 ; |   X    | $D968
    .byte $38 ; |  XXX   | $D969
    .byte $FE ; |XXXXXXX | $D96A
    .byte $44 ; | X   X  | $D96B
    .byte $10 ; |   X    | $D96C
    .byte $10 ; |   X    | $D96D
    .byte $38 ; |  XXX   | $D96E
    .byte $7C ; | XXXXX  | $D96F
    .byte $7C ; | XXXXX  | $D970
    .byte $38 ; |  XXX   | $D971
    .byte $00 ; |        | $D972
    .byte $18 ; |   XX   | $D973
    .byte $38 ; |  XXX   | $D974
    .byte $5E ; | X XXXX | $D975
    .byte $5E ; | X XXXX | $D976
    .byte $EF ; |XXX XXXX| $D977
    .byte $EF ; |XXX XXXX| $D978
    .byte $F7 ; |XXXX XXX| $D979
    .byte $F7 ; |XXXX XXX| $D97A
    .byte $7A ; | XXXX X | $D97B
    .byte $7A ; | XXXX X | $D97C
    .byte $3C ; |  XXXX  | $D97D
    .byte $18 ; |   XX   | $D97E
LD97F:
    .byte $04 ; |     X  | $D97F
    .byte $86 ; |X    XX | $D980
    .byte $86 ; |X    XX | $D981
    .byte $86 ; |X    XX | $D982
    .byte $86 ; |X    XX | $D983
    .byte $86 ; |X    XX | $D984
    .byte $04 ; |     X  | $D985
    .byte $04 ; |     X  | $D986
    .byte $C0 ; |XX      | $D987
    .byte $C0 ; |XX      | $D988
    .byte $C0 ; |XX      | $D989
    .byte $C0 ; |XX      | $D98A
    .byte $C2 ; |XX    X | $D98B
    .byte $C2 ; |XX    X | $D98C
    .byte $C4 ; |XX   X  | $D98D
    .byte $C4 ; |XX   X  | $D98E
    .byte $C4 ; |XX   X  | $D98F
    .byte $C4 ; |XX   X  | $D990
    .byte $C4 ; |XX   X  | $D991
    .byte $C2 ; |XX    X | $D992
    .byte $C2 ; |XX    X | $D993
    .byte $00 ; |        | $D994
    .byte $18 ; |   XX   | $D995
    .byte $3C ; |  XXXX  | $D996
    .byte $3C ; |  XXXX  | $D997
    .byte $7E ; | XXXXXX | $D998
    .byte $7E ; | XXXXXX | $D999
    .byte $E7 ; |XXX  XXX| $D99A
    .byte $DB ; |XX XX XX| $D99B
    .byte $BD ; |X XXXX X| $D99C
    .byte $E7 ; |XXX  XXX| $D99D
    .byte $5A ; | X XX X | $D99E
    .byte $5A ; | X XX X | $D99F
    .byte $24 ; |  X  X  | $D9A0
    .byte $18 ; |   XX   | $D9A1
    .byte $00 ; |        | $D9A2
    .byte $3C ; |  XXXX  | $D9A3
    .byte $7E ; | XXXXXX | $D9A4
    .byte $E7 ; |XXX  XXX| $D9A5
    .byte $C3 ; |XX    XX| $D9A6
    .byte $81 ; |X      X| $D9A7
    .byte $D3 ; |XX X  XX| $D9A8
    .byte $42 ; | X    X | $D9A9
    .byte $08 ; |    X   | $D9AA
    .byte $22 ; |  X   X | $D9AB
    .byte $10 ; |   X    | $D9AC
    .byte $00 ; |        | $D9AD
    .byte $3C ; |  XXXX  | $D9AE
    .byte $7E ; | XXXXXX | $D9AF
    .byte $E7 ; |XXX  XXX| $D9B0
    .byte $C3 ; |XX    XX| $D9B1
    .byte $81 ; |X      X| $D9B2
    .byte $80 ; |X       | $D9B3
    .byte $10 ; |   X    | $D9B4
    .byte $04 ; |     X  | $D9B5
    .byte $81 ; |X      X| $D9B6
    .byte $00 ; |        | $D9B7
    .byte $38 ; |  XXX   | $D9B8
    .byte $7D ; | XXXXX X| $D9B9
    .byte $E7 ; |XXX  XXX| $D9BA
    .byte $C2 ; |XX    X | $D9BB
    .byte $D0 ; |XX X    | $D9BC
    .byte $80 ; |X       | $D9BD
    .byte $42 ; | X    X | $D9BE
    .byte $00 ; |        | $D9BF
    .byte $1B ; |   XX XX| $D9C0
    .byte $3B ; |  XXX XX| $D9C1
    .byte $7F ; | XXXXXXX| $D9C2
    .byte $6E ; | XX XXX | $D9C3
    .byte $66 ; | XX  XX | $D9C4
    .byte $30 ; |  XX    | $D9C5
    .byte $30 ; |  XX    | $D9C6
    .byte $60 ; | XX     | $D9C7
    .byte $60 ; | XX     | $D9C8
    .byte $60 ; | XX     | $D9C9
    .byte $00 ; |        | $D9CA
    .byte $00 ; |        | $D9CB
    .byte $33 ; |  XX  XX| $D9CC
    .byte $73 ; | XXX  XX| $D9CD
    .byte $FE ; |XXXXXXX | $D9CE
    .byte $DE ; |XX XXXX | $D9CF
    .byte $CC ; |XX  XX  | $D9D0
    .byte $60 ; | XX     | $D9D1
    .byte $60 ; | XX     | $D9D2
    .byte $60 ; | XX     | $D9D3
    .byte $C0 ; |XX      | $D9D4
    .byte $C0 ; |XX      | $D9D5
    .byte $C0 ; |XX      | $D9D6
    .byte $80 ; |X       | $D9D7
    .byte $7B ; | XXXX XX| $D9D8
    .byte $00 ; |        | $D9D9
    .byte $7B ; | XXXX XX| $D9DA
    .byte $7E ; | XXXXXX | $D9DB
    .byte $7B ; | XXXX XX| $D9DC
    .byte $77 ; | XXX XXX| $D9DD
    .byte $7B ; | XXXX XX| $D9DE
    .byte $7E ; | XXXXXX | $D9DF
    .byte $74 ; | XXX X  | $D9E0
    .byte $00 ; |        | $D9E1
    .byte $74 ; | XXX X  | $D9E2
    .byte $77 ; | XXX XXX| $D9E3
    .byte $74 ; | XXX X  | $D9E4
    .byte $71 ; | XXX   X| $D9E5
    .byte $74 ; | XXX X  | $D9E6
    .byte $77 ; | XXX XXX| $D9E7
    .byte $72 ; | XXX  X | $D9E8
    .byte $00 ; |        | $D9E9
    .byte $72 ; | XXX  X | $D9EA
    .byte $74 ; | XXX X  | $D9EB
    .byte $72 ; | XXX  X | $D9EC
    .byte $6F ; | XX XXXX| $D9ED
    .byte $72 ; | XXX  X | $D9EE
    .byte $74 ; | XXX X  | $D9EF
    .byte $7B ; | XXXX XX| $D9F0
    .byte $00 ; |        | $D9F1
    .byte $7B ; | XXXX XX| $D9F2
    .byte $77 ; | XXX XXX| $D9F3
    .byte $77 ; | XXX XXX| $D9F4
    .byte $00 ; |        | $D9F5
    .byte $72 ; | XXX  X | $D9F6
    .byte $72 ; | XXX  X | $D9F7
    .byte $00 ; |        | $D9F8
    .byte $72 ; | XXX  X | $D9F9
    .byte $6F ; | XX XXXX| $D9FA
    .byte $6D ; | XX XX X| $D9FB
    .byte $72 ; | XXX  X | $D9FC
    .byte $00 ; |        | $D9FD
    .byte $6F ; | XX XXXX| $D9FE
    .byte $6D ; | XX XX X| $D9FF
    .byte $00 ; |        | $DA00
    .byte $30 ; |  XX    | $DA01
    .byte $38 ; |  XXX   | $DA02
    .byte $0C ; |    XX  | $DA03
    .byte $18 ; |   XX   | $DA04
    .byte $3C ; |  XXXX  | $DA05
    .byte $7C ; | XXXXX  | $DA06
    .byte $78 ; | XXXX   | $DA07
    .byte $78 ; | XXXX   | $DA08
    .byte $70 ; | XXX    | $DA09
    .byte $70 ; | XXX    | $DA0A
    .byte $30 ; |  XX    | $DA0B
    .byte $18 ; |   XX   | $DA0C
    .byte $68 ; | XX X   | $DA0D
    .byte $74 ; | XXX X  | $DA0E
    .byte $34 ; |  XX X  | $DA0F
    .byte $24 ; |  X  X  | $DA10
    .byte $24 ; |  X  X  | $DA11
    .byte $2C ; |  X XX  | $DA12
    .byte $2C ; |  X XX  | $DA13
    .byte $64 ; | XX  X  | $DA14
    .byte $6C ; | XX XX  | $DA15
    .byte $6C ; | XX XX  | $DA16
    .byte $6C ; | XX XX  | $DA17
    .byte $7C ; | XXXXX  | $DA18
    .byte $7A ; | XXXX X | $DA19
    .byte $3A ; |  XXX X | $DA1A
    .byte $16 ; |   X XX | $DA1B
    .byte $23 ; |  X   XX| $DA1C
    .byte $73 ; | XXX  XX| $DA1D
    .byte $71 ; | XXX   X| $DA1E
    .byte $7A ; | XXXX X | $DA1F
    .byte $9A ; |X  XX X | $DA20
    .byte $F8 ; |XXXXX   | $DA21
    .byte $78 ; | XXXX   | $DA22
    .byte $70 ; | XXX    | $DA23
    .byte $00 ; |        | $DA24
    .byte $18 ; |   XX   | $DA25
    .byte $1C ; |   XXX  | $DA26
    .byte $06 ; |     XX | $DA27
    .byte $0C ; |    XX  | $DA28
    .byte $1E ; |   XXXX | $DA29
    .byte $3E ; |  XXXXX | $DA2A
    .byte $3C ; |  XXXX  | $DA2B
    .byte $3C ; |  XXXX  | $DA2C
    .byte $38 ; |  XXX   | $DA2D
    .byte $38 ; |  XXX   | $DA2E
    .byte $18 ; |   XX   | $DA2F
    .byte $1C ; |   XXX  | $DA30
    .byte $3C ; |  XXXX  | $DA31
    .byte $3E ; |  XXXXX | $DA32
    .byte $3E ; |  XXXXX | $DA33
    .byte $1E ; |   XXXX | $DA34
    .byte $B2 ; |X XX  X | $DA35
    .byte $E6 ; |XXX  XX | $DA36
    .byte $36 ; |  XX XX | $DA37
    .byte $1A ; |   XX X | $DA38
    .byte $2E ; |  X XXX | $DA39
    .byte $36 ; |  XX XX | $DA3A
    .byte $36 ; |  XX XX | $DA3B
    .byte $3E ; |  XXXXX | $DA3C
    .byte $3C ; |  XXXX  | $DA3D
    .byte $1C ; |   XXX  | $DA3E
    .byte $08 ; |    X   | $DA3F
    .byte $10 ; |   X    | $DA40
    .byte $38 ; |  XXX   | $DA41
    .byte $38 ; |  XXX   | $DA42
    .byte $3C ; |  XXXX  | $DA43
    .byte $4C ; | X  XX  | $DA44
    .byte $7C ; | XXXXX  | $DA45
    .byte $3C ; |  XXXX  | $DA46
    .byte $38 ; |  XXX   | $DA47

    .byte $00 ; |        | $DA48
    .byte $C6 ; |XX   XX | $DA49
    .byte $63 ; | XX   XX| $DA4A
    .byte $21 ; |  X    X| $DA4B
    .byte $66 ; | XX  XX | $DA4C
    .byte $E6 ; |XXX  XX | $DA4D
    .byte $E7 ; |XXX  XXX| $DA4E
    .byte $E7 ; |XXX  XXX| $DA4F
    .byte $CE ; |XX  XXX | $DA50
    .byte $CC ; |XX  XX  | $DA51
    .byte $EE ; |XXX XXX | $DA52
    .byte $EE ; |XXX XXX | $DA53
    .byte $7E ; | XXXXXX | $DA54
    .byte $7F ; | XXXXXXX| $DA55
    .byte $7F ; | XXXXXXX| $DA56
    .byte $3F ; |  XXXXXX| $DA57
    .byte $1F ; |   XXXXX| $DA58
    .byte $1F ; |   XXXXX| $DA59
    .byte $0F ; |    XXXX| $DA5A
    .byte $0D ; |    XX X| $DA5B
    .byte $1E ; |   XXXX | $DA5C
    .byte $3F ; |  XXXXXX| $DA5D
    .byte $57 ; | X X XXX| $DA5E
    .byte $EF ; |XXX XXXX| $DA5F
    .byte $FF ; |XXXXXXXX| $DA60
    .byte $DF ; |XX XXXXX| $DA61
    .byte $8F ; |X   XXXX| $DA62
    .byte $C6 ; |XX   XX | $DA63
    .byte $C8 ; |XX  X   | $DA64
    .byte $1C ; |   XXX  | $DA65
    .byte $1C ; |   XXX  | $DA66
    .byte $1E ; |   XXXX | $DA67
    .byte $26 ; |  X  XX | $DA68
    .byte $3E ; |  XXXXX | $DA69
    .byte $1E ; |   XXXX | $DA6A
    .byte $1C ; |   XXX  | $DA6B
    .byte $00 ; |        | $DA6C
    .byte $66 ; | XX  XX | $DA6D
    .byte $E7 ; |XXX  XXX| $DA6E
    .byte $E1 ; |XXX    X| $DA6F
    .byte $26 ; |  X  XX | $DA70
    .byte $67 ; | XX  XXX| $DA71
    .byte $E7 ; |XXX  XXX| $DA72
    .byte $EE ; |XXX XXX | $DA73
    .byte $EE ; |XXX XXX | $DA74
    .byte $6E ; | XX XXX | $DA75
    .byte $74 ; | XXX X  | $DA76
    .byte $7C ; | XXXXX  | $DA77
    .byte $7E ; | XXXXXX | $DA78
    .byte $3F ; |  XXXXXX| $DA79
    .byte $3F ; |  XXXXXX| $DA7A
    .byte $3D ; |  XXXX X| $DA7B
    .byte $1C ; |   XXX  | $DA7C
    .byte $1C ; |   XXX  | $DA7D
    .byte $CD ; |XX  XX X| $DA7E
    .byte $FD ; |XXXXXX X| $DA7F
    .byte $FD ; |XXXXXX X| $DA80
    .byte $3D ; |  XXXX X| $DA81
    .byte $3B ; |  XXX XX| $DA82
    .byte $3B ; |  XXX XX| $DA83
    .byte $3A ; |  XXX X | $DA84
    .byte $1E ; |   XXXX | $DA85
    .byte $1E ; |   XXXX | $DA86
    .byte $0C ; |    XX  | $DA87
    .byte $10 ; |   X    | $DA88
    .byte $38 ; |  XXX   | $DA89
    .byte $38 ; |  XXX   | $DA8A
    .byte $3C ; |  XXXX  | $DA8B
    .byte $4C ; | X  XX  | $DA8C
    .byte $7C ; | XXXXX  | $DA8D
    .byte $3C ; |  XXXX  | $DA8E
    .byte $38 ; |  XXX   | $DA8F

    .byte $00 ; |        | $DA90
    .byte $18 ; |   XX   | $DA91
    .byte $1C ; |   XXX  | $DA92
    .byte $06 ; |     XX | $DA93
    .byte $0C ; |    XX  | $DA94
    .byte $1E ; |   XXXX | $DA95
    .byte $3E ; |  XXXXX | $DA96
    .byte $3C ; |  XXXX  | $DA97
    .byte $3C ; |  XXXX  | $DA98
    .byte $38 ; |  XXX   | $DA99
    .byte $38 ; |  XXX   | $DA9A
    .byte $18 ; |   XX   | $DA9B
    .byte $0C ; |    XX  | $DA9C
    .byte $34 ; |  XX X  | $DA9D
    .byte $3A ; |  XXX X | $DA9E
    .byte $1A ; |   XX X | $DA9F
    .byte $12 ; |   X  X | $DAA0
    .byte $12 ; |   X  X | $DAA1
    .byte $16 ; |   X XX | $DAA2
    .byte $16 ; |   X XX | $DAA3
    .byte $32 ; |  XX  X | $DAA4
    .byte $36 ; |  XX XX | $DAA5
    .byte $36 ; |  XX XX | $DAA6
    .byte $36 ; |  XX XX | $DAA7
    .byte $3E ; |  XXXXX | $DAA8
    .byte $3C ; |  XXXX  | $DAA9
    .byte $1C ; |   XXX  | $DAAA
    .byte $08 ; |    X   | $DAAB
    .byte $10 ; |   X    | $DAAC
    .byte $38 ; |  XXX   | $DAAD
    .byte $38 ; |  XXX   | $DAAE
    .byte $3C ; |  XXXX  | $DAAF
    .byte $4C ; | X  XX  | $DAB0
    .byte $7C ; | XXXXX  | $DAB1
    .byte $3C ; |  XXXX  | $DAB2

    .byte $38 ; |  XXX   | $DAB3
    .byte $00 ; |        | $DAB4
    .byte $00 ; |        | $DAB5
    .byte $00 ; |        | $DAB6
    .byte $00 ; |        | $DAB7
    .byte $0C ; |    XX  | $DAB8
    .byte $0C ; |    XX  | $DAB9
    .byte $0C ; |    XX  | $DABA
    .byte $0C ; |    XX  | $DABB
    .byte $0C ; |    XX  | $DABC
    .byte $0C ; |    XX  | $DABD
    .byte $0C ; |    XX  | $DABE
    .byte $0C ; |    XX  | $DABF
    .byte $0C ; |    XX  | $DAC0
    .byte $0C ; |    XX  | $DAC1
    .byte $0C ; |    XX  | $DAC2
    .byte $00 ; |        | $DAC3
    .byte $00 ; |        | $DAC4
    .byte $0C ; |    XX  | $DAC5
    .byte $0C ; |    XX  | $DAC6
    .byte $0C ; |    XX  | $DAC7
    .byte $0C ; |    XX  | $DAC8
    .byte $0C ; |    XX  | $DAC9
    .byte $0C ; |    XX  | $DACA
    .byte $0C ; |    XX  | $DACB
    .byte $0C ; |    XX  | $DACC
    .byte $0C ; |    XX  | $DACD
    .byte $0C ; |    XX  | $DACE
    .byte $2A ; |  X X X | $DACF
    .byte $2A ; |  X X X | $DAD0
    .byte $2A ; |  X X X | $DAD1
    .byte $00 ; |        | $DAD2
LDAD3:
    .byte $00 ; |        | $DAD3
    .byte $00 ; |        | $DAD4
    .byte $00 ; |        | $DAD5
    .byte $00 ; |        | $DAD6

    .byte $3C ; |  XXXX  | $DAD7
    .byte $7E ; | XXXXXX | $DAD8
    .byte $66 ; | XX  XX | $DAD9
    .byte $24 ; |  X  X  | $DADA
    .byte $18 ; |   XX   | $DADB
    .byte $18 ; |   XX   | $DADC
    .byte $18 ; |   XX   | $DADD
    .byte $18 ; |   XX   | $DADE
    .byte $18 ; |   XX   | $DADF
    .byte $18 ; |   XX   | $DAE0
    .byte $00 ; |        | $DAE1
    .byte $08 ; |    X   | $DAE2
    .byte $1C ; |   XXX  | $DAE3
    .byte $08 ; |    X   | $DAE4
    .byte $00 ; |        | $DAE5
    .byte $00 ; |        | $DAE6
    .byte $00 ; |        | $DAE7
    .byte $00 ; |        | $DAE8
    .byte $00 ; |        | $DAE9
    .byte $4E ; | X  XXX | $DAEA
    .byte $2E ; |  X XXX | $DAEB
    .byte $F6 ; |XXXX XX | $DAEC
    .byte $74 ; | XXX X  | $DAED
    .byte $28 ; |  X X   | $DAEE
    .byte $D0 ; |XX X    | $DAEF
    .byte $00 ; |        | $DAF0
    .byte $04 ; |     X  | $DAF1
    .byte $16 ; |   X XX | $DAF2
    .byte $3A ; |  XXX X | $DAF3
    .byte $3A ; |  XXX X | $DAF4
    .byte $16 ; |   X XX | $DAF5
    .byte $2C ; |  X XX  | $DAF6
    .byte $00 ; |        | $DAF7
    .byte $4E ; | X  XXX | $DAF8
    .byte $2C ; |  X XX  | $DAF9
    .byte $F7 ; |XXXX XXX| $DAFA
    .byte $77 ; | XXX XXX| $DAFB
    .byte $2E ; |  X XXX | $DAFC
LDAFD:
    .byte $DC ; |XX XXX  | $DAFD
    .byte $05 ; |     X X| $DAFE
    .byte $04 ; |     X  | $DAFF

    .byte $00 ; |        | $DB00
    .byte $E4 ; |XXX  X  | $DB01
    .byte $62 ; | XX   X | $DB02
    .byte $66 ; | XX  XX | $DB03
    .byte $6E ; | XX XXX | $DB04
    .byte $7C ; | XXXXX  | $DB05
    .byte $78 ; | XXXX   | $DB06
    .byte $3A ; |  XXX X | $DB07
    .byte $3E ; |  XXXXX | $DB08
    .byte $3E ; |  XXXXX | $DB09
    .byte $FE ; |XXXXXXX | $DB0A
    .byte $FE ; |XXXXXXX | $DB0B
    .byte $FE ; |XXXXXXX | $DB0C
    .byte $3C ; |  XXXX  | $DB0D
    .byte $1C ; |   XXX  | $DB0E
    .byte $18 ; |   XX   | $DB0F
    .byte $18 ; |   XX   | $DB10
    .byte $18 ; |   XX   | $DB11
    .byte $38 ; |  XXX   | $DB12
    .byte $38 ; |  XXX   | $DB13
    .byte $10 ; |   X    | $DB14
    .byte $00 ; |        | $DB15
    .byte $18 ; |   XX   | $DB16
    .byte $14 ; |   X X  | $DB17
    .byte $08 ; |    X   | $DB18
    .byte $18 ; |   XX   | $DB19
    .byte $18 ; |   XX   | $DB1A
    .byte $1C ; |   XXX  | $DB1B
    .byte $1C ; |   XXX  | $DB1C
    .byte $7C ; | XXXXX  | $DB1D
    .byte $6C ; | XX XX  | $DB1E
    .byte $34 ; |  XX X  | $DB1F
    .byte $3C ; |  XXXX  | $DB20
    .byte $3C ; |  XXXX  | $DB21
    .byte $3C ; |  XXXX  | $DB22
    .byte $1C ; |   XXX  | $DB23
    .byte $18 ; |   XX   | $DB24
    .byte $18 ; |   XX   | $DB25
    .byte $18 ; |   XX   | $DB26
    .byte $38 ; |  XXX   | $DB27
    .byte $38 ; |  XXX   | $DB28
    .byte $10 ; |   X    | $DB29
    .byte $00 ; |        | $DB2A
    .byte $0C ; |    XX  | $DB2B
    .byte $18 ; |   XX   | $DB2C
    .byte $30 ; |  XX    | $DB2D
    .byte $38 ; |  XXX   | $DB2E
    .byte $3C ; |  XXXX  | $DB2F
    .byte $2C ; |  X XX  | $DB30
    .byte $2C ; |  X XX  | $DB31
    .byte $34 ; |  XX X  | $DB32
    .byte $38 ; |  XXX   | $DB33
    .byte $18 ; |   XX   | $DB34
    .byte $18 ; |   XX   | $DB35
    .byte $38 ; |  XXX   | $DB36
    .byte $30 ; |  XX    | $DB37
    .byte $10 ; |   X    | $DB38
    .byte $00 ; |        | $DB39
    .byte $10 ; |   X    | $DB3A
    .byte $30 ; |  XX    | $DB3B
    .byte $38 ; |  XXX   | $DB3C
    .byte $18 ; |   XX   | $DB3D
    .byte $18 ; |   XX   | $DB3E
    .byte $38 ; |  XXX   | $DB3F
    .byte $34 ; |  XX X  | $DB40
    .byte $2C ; |  X XX  | $DB41
    .byte $2C ; |  X XX  | $DB42
    .byte $3C ; |  XXXX  | $DB43
    .byte $38 ; |  XXX   | $DB44
    .byte $30 ; |  XX    | $DB45
    .byte $18 ; |   XX   | $DB46
    .byte $0C ; |    XX  | $DB47
    .byte $00 ; |        | $DB48
    .byte $C8 ; |XX  X   | $DB49
    .byte $C8 ; |XX  X   | $DB4A
    .byte $C8 ; |XX  X   | $DB4B
    .byte $C8 ; |XX  X   | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $32 ; |  XX  X | $DB4E
    .byte $32 ; |  XX  X | $DB4F
    .byte $32 ; |  XX  X | $DB50
    .byte $3E ; |  XXXXX | $DB51
    .byte $3E ; |  XXXXX | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $3E ; |  XXXXX | $DB56
    .byte $3E ; |  XXXXX | $DB57
    .byte $32 ; |  XX  X | $DB58
    .byte $32 ; |  XX  X | $DB59
    .byte $32 ; |  XX  X | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $C8 ; |XX  X   | $DB5C
    .byte $C8 ; |XX  X   | $DB5D
    .byte $C8 ; |XX  X   | $DB5E
    .byte $C8 ; |XX  X   | $DB5F
    .byte $00 ; |        | $DB60
    .byte $0A ; |    X X | $DB61
    .byte $0A ; |    X X | $DB62
    .byte $0A ; |    X X | $DB63
    .byte $0A ; |    X X | $DB64
    .byte $0A ; |    X X | $DB65
    .byte $0A ; |    X X | $DB66
    .byte $0A ; |    X X | $DB67
    .byte $0A ; |    X X | $DB68
    .byte $0A ; |    X X | $DB69
    .byte $0C ; |    XX  | $DB6A
    .byte $0C ; |    XX  | $DB6B
    .byte $0C ; |    XX  | $DB6C
    .byte $00 ; |        | $DB6D
    .byte $0C ; |    XX  | $DB6E
    .byte $0A ; |    X X | $DB6F
    .byte $0A ; |    X X | $DB70
    .byte $0A ; |    X X | $DB71
    .byte $0A ; |    X X | $DB72
    .byte $0A ; |    X X | $DB73
    .byte $0A ; |    X X | $DB74
    .byte $0A ; |    X X | $DB75
    .byte $0A ; |    X X | $DB76
    .byte $0A ; |    X X | $DB77
    .byte $2A ; |  X X X | $DB78
    .byte $2A ; |  X X X | $DB79
    .byte $2A ; |  X X X | $DB7A
    .byte $00 ; |        | $DB7B
    .byte $00 ; |        | $DB7C
    .byte $0C ; |    XX  | $DB7D
    .byte $00 ; |        | $DB7E
    .byte $00 ; |        | $DB7F
    .byte $54 ; | X X X  | $DB80
    .byte $5C ; | X XXX  | $DB81
    .byte $DF ; |XX XXXXX| $DB82
    .byte $DA ; |XX XX X | $DB83
    .byte $EC ; |XXX XX  | $DB84
    .byte $DC ; |XX XXX  | $DB85
    .byte $FE ; |XXXXXXX | $DB86
    .byte $7F ; | XXXXXXX| $DB87
    .byte $3F ; |  XXXXXX| $DB88
    .byte $1E ; |   XXXX | $DB89
    .byte $1E ; |   XXXX | $DB8A
    .byte $1E ; |   XXXX | $DB8B
    .byte $1F ; |   XXXXX| $DB8C
    .byte $1F ; |   XXXXX| $DB8D
    .byte $FC ; |XXXXXX  | $DB8E
    .byte $BD ; |X XXXX X| $DB8F
    .byte $FD ; |XXXXXX X| $DB90
    .byte $FF ; |XXXXXXXX| $DB91
    .byte $3E ; |  XXXXX | $DB92
    .byte $FC ; |XXXXXX  | $DB93
    .byte $6C ; | XX XX  | $DB94
    .byte $0C ; |    XX  | $DB95
    .byte $1C ; |   XXX  | $DB96
    .byte $1C ; |   XXX  | $DB97
    .byte $1E ; |   XXXX | $DB98
    .byte $26 ; |  X  XX | $DB99
    .byte $3E ; |  XXXXX | $DB9A
    .byte $1E ; |   XXXX | $DB9B
    .byte $1C ; |   XXX  | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $C8 ; |XX  X   | $DBA3
    .byte $C8 ; |XX  X   | $DBA4
    .byte $C8 ; |XX  X   | $DBA5
    .byte $C8 ; |XX  X   | $DBA6
    .byte $C8 ; |XX  X   | $DBA7
    .byte $00 ; |        | $DBA8
    .byte $32 ; |  XX  X | $DBA9
    .byte $32 ; |  XX  X | $DBAA
    .byte $32 ; |  XX  X | $DBAB
    .byte $32 ; |  XX  X | $DBAC
    .byte $32 ; |  XX  X | $DBAD
    .byte $32 ; |  XX  X | $DBAE
    .byte $3E ; |  XXXXX | $DBAF
    .byte $3E ; |  XXXXX | $DBB0

    .byte $3E ; |  XXXXX | $DBB1
    .byte $00 ; |        | $DBB2
    .byte $00 ; |        | $DBB3
    .byte $00 ; |        | $DBB4
    .byte $64 ; | XX  X  | $DBB5
    .byte $AA ; |X X X X | $DBB6
    .byte $AA ; |X X X X | $DBB7
    .byte $AA ; |X X X X | $DBB8
    .byte $AA ; |X X X X | $DBB9
    .byte $AA ; |X X X X | $DBBA
    .byte $AA ; |X X X X | $DBBB
    .byte $AA ; |X X X X | $DBBC
    .byte $AA ; |X X X X | $DBBD
    .byte $AA ; |X X X X | $DBBE
    .byte $AA ; |X X X X | $DBBF
    .byte $AA ; |X X X X | $DBC0
    .byte $AA ; |X X X X | $DBC1
    .byte $62 ; | XX   X | $DBC2
    .byte $62 ; | XX   X | $DBC3
    .byte $62 ; | XX   X | $DBC4
    .byte $62 ; | XX   X | $DBC5
    .byte $62 ; | XX   X | $DBC6
    .byte $62 ; | XX   X | $DBC7
    .byte $62 ; | XX   X | $DBC8
    .byte $62 ; | XX   X | $DBC9
    .byte $62 ; | XX   X | $DBCA
    .byte $62 ; | XX   X | $DBCB
    .byte $62 ; | XX   X | $DBCC
    .byte $38 ; |  XXX   | $DBCD
    .byte $38 ; |  XXX   | $DBCE
    .byte $38 ; |  XXX   | $DBCF
    .byte $00 ; |        | $DBD0
    .byte $00 ; |        | $DBD1
    .byte $00 ; |        | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $00 ; |        | $DBD4
    .byte $00 ; |        | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $00 ; |        | $DBDA
    .byte $00 ; |        | $DBDB
    .byte $00 ; |        | $DBDC
    .byte $0C ; |    XX  | $DBDD
    .byte $02 ; |      X | $DBDE
    .byte $02 ; |      X | $DBDF
    .byte $02 ; |      X | $DBE0
    .byte $02 ; |      X | $DBE1
    .byte $02 ; |      X | $DBE2
    .byte $02 ; |      X | $DBE3
    .byte $02 ; |      X | $DBE4
    .byte $02 ; |      X | $DBE5
    .byte $02 ; |      X | $DBE6
    .byte $02 ; |      X | $DBE7
    .byte $38 ; |  XXX   | $DBE8
    .byte $38 ; |  XXX   | $DBE9
    .byte $38 ; |  XXX   | $DBEA
    .byte $02 ; |      X | $DBEB
    .byte $02 ; |      X | $DBEC
    .byte $0F ; |    XXXX| $DBED
    .byte $02 ; |      X | $DBEE
    .byte $02 ; |      X | $DBEF
    .byte $02 ; |      X | $DBF0
LDBF1:
    .byte $00 ; |        | $DBF1
    .byte $3C ; |  XXXX  | $DBF2
    .byte $3C ; |  XXXX  | $DBF3
    .byte $3C ; |  XXXX  | $DBF4
    .byte $3C ; |  XXXX  | $DBF5
    .byte $3C ; |  XXXX  | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $40 ; | X      | $DBF9
    .byte $40 ; | X      | $DBFA
    .byte $40 ; | X      | $DBFB
    .byte $40 ; | X      | $DBFC
    .byte $00 ; |        | $DBFD
LDBFE:
    .byte $02 ; |      X | $DBFE
    .byte $01 ; |       X| $DBFF

    .byte $00 ; |        | $DC00
    .byte $05 ; |     X X| $DC01
    .byte $15 ; |   X X X| $DC02
    .byte $05 ; |     X X| $DC03
    .byte $05 ; |     X X| $DC04
    .byte $05 ; |     X X| $DC05
    .byte $15 ; |   X X X| $DC06
    .byte $05 ; |     X X| $DC07
    .byte $E5 ; |XXX  X X| $DC08
    .byte $35 ; |  XX X X| $DC09
    .byte $00 ; |        | $DC0A
    .byte $F0 ; |XXXX    | $DC0B
    .byte $00 ; |        | $DC0C
    .byte $00 ; |        | $DC0D
    .byte $00 ; |        | $DC0E
    .byte $00 ; |        | $DC0F
    .byte $00 ; |        | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $00 ; |        | $DC13
    .byte $00 ; |        | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $00 ; |        | $DC17
    .byte $00 ; |        | $DC18
    .byte $00 ; |        | $DC19
    .byte $00 ; |        | $DC1A
    .byte $00 ; |        | $DC1B
    .byte $00 ; |        | $DC1C
    .byte $00 ; |        | $DC1D
    .byte $00 ; |        | $DC1E
    .byte $00 ; |        | $DC1F
    .byte $00 ; |        | $DC20
    .byte $00 ; |        | $DC21
    .byte $00 ; |        | $DC22
    .byte $00 ; |        | $DC23
    .byte $10 ; |   X    | $DC24
    .byte $00 ; |        | $DC25
    .byte $D0 ; |XX X    | $DC26
    .byte $10 ; |   X    | $DC27
    .byte $00 ; |        | $DC28
    .byte $10 ; |   X    | $DC29
    .byte $E0 ; |XXX     | $DC2A
    .byte $E5 ; |XXX  X X| $DC2B
    .byte $25 ; |  X  X X| $DC2C
    .byte $35 ; |  XX X X| $DC2D
    .byte $00 ; |        | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $00 ; |        | $DC31
    .byte $00 ; |        | $DC32
    .byte $00 ; |        | $DC33
    .byte $00 ; |        | $DC34
    .byte $F0 ; |XXXX    | $DC35
    .byte $00 ; |        | $DC36
    .byte $05 ; |     X X| $DC37
    .byte $45 ; | X   X X| $DC38
    .byte $00 ; |        | $DC39
    .byte $F0 ; |XXXX    | $DC3A
    .byte $00 ; |        | $DC3B
    .byte $00 ; |        | $DC3C
    .byte $F0 ; |XXXX    | $DC3D

    .byte $00 ; |        | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $00 ; |        | $DC40
    .byte $00 ; |        | $DC41
    .byte $00 ; |        | $DC42
    .byte $00 ; |        | $DC43
    .byte $00 ; |        | $DC44
    .byte $00 ; |        | $DC45
    .byte $00 ; |        | $DC46
    .byte $00 ; |        | $DC47
    .byte $00 ; |        | $DC48
    .byte $00 ; |        | $DC49
    .byte $00 ; |        | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $00 ; |        | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $00 ; |        | $DC52
    .byte $00 ; |        | $DC53
    .byte $00 ; |        | $DC54
    .byte $00 ; |        | $DC55
    .byte $00 ; |        | $DC56
    .byte $00 ; |        | $DC57
    .byte $00 ; |        | $DC58
    .byte $00 ; |        | $DC59
    .byte $00 ; |        | $DC5A
    .byte $00 ; |        | $DC5B
    .byte $00 ; |        | $DC5C
    .byte $00 ; |        | $DC5D
    .byte $00 ; |        | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $00 ; |        | $DC60
    .byte $00 ; |        | $DC61
    .byte $00 ; |        | $DC62
    .byte $00 ; |        | $DC63
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $00 ; |        | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $00 ; |        | $DC69
    .byte $00 ; |        | $DC6A
    .byte $10 ; |   X    | $DC6B
    .byte $00 ; |        | $DC6C
    .byte $F0 ; |XXXX    | $DC6D
    .byte $E0 ; |XXX     | $DC6E
    .byte $F5 ; |XXXX X X| $DC6F
    .byte $05 ; |     X X| $DC70
    .byte $F5 ; |XXXX X X| $DC71
    .byte $05 ; |     X X| $DC72
    .byte $05 ; |     X X| $DC73
    .byte $F5 ; |XXXX X X| $DC74
    .byte $35 ; |  XX X X| $DC75
    .byte $00 ; |        | $DC76
    .byte $00 ; |        | $DC77
    .byte $00 ; |        | $DC78
    .byte $00 ; |        | $DC79
    .byte $00 ; |        | $DC7A
    .byte $00 ; |        | $DC7B
    .byte $00 ; |        | $DC7C
    .byte $10 ; |   X    | $DC7D
    .byte $00 ; |        | $DC7E
    .byte $78 ; | XXXX   | $DC7F
    .byte $70 ; | XXX    | $DC80
    .byte $60 ; | XX     | $DC81
    .byte $60 ; | XX     | $DC82
    .byte $F0 ; |XXXX    | $DC83
    .byte $F0 ; |XXXX    | $DC84
    .byte $F0 ; |XXXX    | $DC85
    .byte $70 ; | XXX    | $DC86
    .byte $70 ; | XXX    | $DC87
    .byte $78 ; | XXXX   | $DC88
    .byte $38 ; |  XXX   | $DC89
    .byte $38 ; |  XXX   | $DC8A
    .byte $38 ; |  XXX   | $DC8B
    .byte $38 ; |  XXX   | $DC8C
    .byte $3C ; |  XXXX  | $DC8D
    .byte $44 ; | X   X  | $DC8E
    .byte $42 ; | X    X | $DC8F
    .byte $3F ; |  XXXXXX| $DC90
    .byte $7F ; | XXXXXXX| $DC91
    .byte $F9 ; |XXXXX  X| $DC92
    .byte $1B ; |   XX XX| $DC93
    .byte $3F ; |  XXXXXX| $DC94
    .byte $29 ; |  X X  X| $DC95
    .byte $7D ; | XXXXX X| $DC96
    .byte $CF ; |XX  XXXX| $DC97
    .byte $C7 ; |XX   XXX| $DC98
    .byte $86 ; |X    XX | $DC99
    .byte $04 ; |     X  | $DC9A
    .byte $0E ; |    XXX | $DC9B
    .byte $0E ; |    XXX | $DC9C
    .byte $0F ; |    XXXX| $DC9D
    .byte $13 ; |   X  XX| $DC9E
    .byte $1F ; |   XXXXX| $DC9F
    .byte $0F ; |    XXXX| $DCA0
    .byte $0E ; |    XXX | $DCA1
    .byte $00 ; |        | $DCA2
    .byte $C6 ; |XX   XX | $DCA3
    .byte $63 ; | XX   XX| $DCA4
    .byte $21 ; |  X    X| $DCA5
    .byte $66 ; | XX  XX | $DCA6
    .byte $E6 ; |XXX  XX | $DCA7
    .byte $E7 ; |XXX  XXX| $DCA8
    .byte $E7 ; |XXX  XXX| $DCA9
    .byte $CE ; |XX  XXX | $DCAA
    .byte $CC ; |XX  XX  | $DCAB
    .byte $EE ; |XXX XXX | $DCAC
    .byte $EE ; |XXX XXX | $DCAD
    .byte $7E ; | XXXXXX | $DCAE
    .byte $7F ; | XXXXXXX| $DCAF
    .byte $7F ; | XXXXXXX| $DCB0
    .byte $3F ; |  XXXXXX| $DCB1
    .byte $1E ; |   XXXX | $DCB2
    .byte $1E ; |   XXXX | $DCB3
    .byte $1E ; |   XXXX | $DCB4
    .byte $1F ; |   XXXXX| $DCB5
    .byte $1F ; |   XXXXX| $DCB6
    .byte $FC ; |XXXXXX  | $DCB7
    .byte $BD ; |X XXXX X| $DCB8
    .byte $FD ; |XXXXXX X| $DCB9
    .byte $FF ; |XXXXXXXX| $DCBA
    .byte $3E ; |  XXXXX | $DCBB
    .byte $FC ; |XXXXXX  | $DCBC
    .byte $6C ; | XX XX  | $DCBD
    .byte $0C ; |    XX  | $DCBE
    .byte $1C ; |   XXX  | $DCBF
    .byte $1C ; |   XXX  | $DCC0
    .byte $1E ; |   XXXX | $DCC1
    .byte $26 ; |  X  XX | $DCC2
    .byte $3E ; |  XXXXX | $DCC3
    .byte $1E ; |   XXXX | $DCC4
    .byte $1C ; |   XXX  | $DCC5
    .byte $00 ; |        | $DCC6
    .byte $00 ; |        | $DCC7
    .byte $00 ; |        | $DCC8
    .byte $00 ; |        | $DCC9
    .byte $00 ; |        | $DCCA
    .byte $00 ; |        | $DCCB
    .byte $40 ; | X      | $DCCC
    .byte $40 ; | X      | $DCCD
    .byte $40 ; | X      | $DCCE
    .byte $40 ; | X      | $DCCF
    .byte $40 ; | X      | $DCD0
    .byte $40 ; | X      | $DCD1
    .byte $40 ; | X      | $DCD2
    .byte $40 ; | X      | $DCD3
    .byte $40 ; | X      | $DCD4
    .byte $40 ; | X      | $DCD5
    .byte $40 ; | X      | $DCD6
    .byte $40 ; | X      | $DCD7
    .byte $40 ; | X      | $DCD8
    .byte $40 ; | X      | $DCD9
    .byte $00 ; |        | $DCDA
    .byte $00 ; |        | $DCDB
    .byte $00 ; |        | $DCDC
    .byte $00 ; |        | $DCDD
    .byte $00 ; |        | $DCDE
    .byte $00 ; |        | $DCDF
    .byte $00 ; |        | $DCE0
    .byte $00 ; |        | $DCE1
    .byte $00 ; |        | $DCE2
    .byte $00 ; |        | $DCE3
    .byte $00 ; |        | $DCE4
    .byte $00 ; |        | $DCE5
    .byte $00 ; |        | $DCE6
    .byte $00 ; |        | $DCE7
    .byte $00 ; |        | $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $F0 ; |XXXX    | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $10 ; |   X    | $DCED
    .byte $80 ; |X       | $DCEE
    .byte $15 ; |   X X X| $DCEF
    .byte $05 ; |     X X| $DCF0
    .byte $15 ; |   X X X| $DCF1
    .byte $05 ; |     X X| $DCF2
    .byte $05 ; |     X X| $DCF3
    .byte $15 ; |   X X X| $DCF4
    .byte $75 ; | XXX X X| $DCF5
    .byte $00 ; |        | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $00 ; |        | $DCFB
    .byte $00 ; |        | $DCFC
    .byte $F0 ; |XXXX    | $DCFD
LDCFE:
    .byte $05 ; |     X X| $DCFE
    .byte $06 ; |     XX | $DCFF
LDD00:
    .byte $26 ; |  X  XX | $DD00
    .byte $00 ; |        | $DD01
    .byte $26 ; |  X  XX | $DD02
LDD03:
    .byte $26 ; |  X  XX | $DD03
    .byte $1C ; |   XXX  | $DD04
    .byte $42 ; | X    X | $DD05
    .byte $42 ; | X    X | $DD06
    .byte $42 ; | X    X | $DD07
    .byte $42 ; | X    X | $DD08
    .byte $1C ; |   XXX  | $DD09
    .byte $00 ; |        | $DD0A
    .byte $42 ; | X    X | $DD0B
    .byte $42 ; | X    X | $DD0C
    .byte $42 ; | X    X | $DD0D
    .byte $42 ; | X    X | $DD0E
    .byte $42 ; | X    X | $DD0F
    .byte $42 ; | X    X | $DD10
    .byte $42 ; | X    X | $DD11
    .byte $42 ; | X    X | $DD12
    .byte $42 ; | X    X | $DD13
    .byte $42 ; | X    X | $DD14
    .byte $00 ; |        | $DD15
    .byte $05 ; |     X X| $DD16
    .byte $45 ; | X   X X| $DD17
    .byte $00 ; |        | $DD18
    .byte $F0 ; |XXXX    | $DD19
    .byte $00 ; |        | $DD1A
    .byte $00 ; |        | $DD1B
    .byte $F0 ; |XXXX    | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $00 ; |        | $DD20
    .byte $F0 ; |XXXX    | $DD21
    .byte $00 ; |        | $DD22
    .byte $30 ; |  XX    | $DD23
    .byte $F0 ; |XXXX    | $DD24
    .byte $00 ; |        | $DD25
    .byte $F0 ; |XXXX    | $DD26
    .byte $80 ; |X       | $DD27
    .byte $25 ; |  X  X X| $DD28
    .byte $E5 ; |XXX  X X| $DD29
    .byte $75 ; | XXX X X| $DD2A
    .byte $00 ; |        | $DD2B
    .byte $00 ; |        | $DD2C
    .byte $00 ; |        | $DD2D
    .byte $00 ; |        | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $00 ; |        | $DD30
    .byte $00 ; |        | $DD31
    .byte $10 ; |   X    | $DD32
    .byte $00 ; |        | $DD33
    .byte $00 ; |        | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $00 ; |        | $DD37
    .byte $00 ; |        | $DD38
    .byte $05 ; |     X X| $DD39
    .byte $65 ; | XX  X X| $DD3A
    .byte $00 ; |        | $DD3B
    .byte $10 ; |   X    | $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $10 ; |   X    | $DD3F
    .byte $00 ; |        | $DD40
    .byte $00 ; |        | $DD41
    .byte $00 ; |        | $DD42
    .byte $00 ; |        | $DD43
    .byte $10 ; |   X    | $DD44
    .byte $00 ; |        | $DD45
    .byte $D0 ; |XX X    | $DD46
    .byte $10 ; |   X    | $DD47
    .byte $00 ; |        | $DD48
    .byte $10 ; |   X    | $DD49
    .byte $E0 ; |XXX     | $DD4A
    .byte $E5 ; |XXX  X X| $DD4B
    .byte $25 ; |  X  X X| $DD4C
    .byte $35 ; |  XX X X| $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $F0 ; |XXXX    | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $00 ; |        | $DD58
    .byte $00 ; |        | $DD59
    .byte $00 ; |        | $DD5A
    .byte $00 ; |        | $DD5B
    .byte $05 ; |     X X| $DD5C
    .byte $F5 ; |XXXX X X| $DD5D
    .byte $05 ; |     X X| $DD5E
    .byte $05 ; |     X X| $DD5F
    .byte $05 ; |     X X| $DD60
    .byte $F5 ; |XXXX X X| $DD61
    .byte $05 ; |     X X| $DD62
    .byte $25 ; |  X  X X| $DD63
    .byte $75 ; | XXX X X| $DD64
    .byte $00 ; |        | $DD65
    .byte $10 ; |   X    | $DD66
    .byte $00 ; |        | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $00 ; |        | $DD6C
    .byte $00 ; |        | $DD6D
    .byte $00 ; |        | $DD6E
    .byte $00 ; |        | $DD6F
    .byte $00 ; |        | $DD70
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $00 ; |        | $DD73
    .byte $00 ; |        | $DD74
LDD75:
    .byte $00 ; |        | $DD75
    .byte $00 ; |        | $DD76
    .byte $00 ; |        | $DD77
    .byte $00 ; |        | $DD78
    .byte $00 ; |        | $DD79
    .byte $00 ; |        | $DD7A
    .byte $00 ; |        | $DD7B
    .byte $00 ; |        | $DD7C
    .byte $00 ; |        | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $E7 ; |XXX  XXX| $DD7F
    .byte $A5 ; |X X  X X| $DD80
    .byte $A5 ; |X X  X X| $DD81
    .byte $A5 ; |X X  X X| $DD82
    .byte $A5 ; |X X  X X| $DD83
    .byte $81 ; |X      X| $DD84
    .byte $FF ; |XXXXXXXX| $DD85
    .byte $00 ; |        | $DD86
    .byte $00 ; |        | $DD87
    .byte $00 ; |        | $DD88
    .byte $00 ; |        | $DD89
    .byte $05 ; |     X X| $DD8A
    .byte $65 ; | XX  X X| $DD8B
    .byte $00 ; |        | $DD8C
    .byte $10 ; |   X    | $DD8D
    .byte $00 ; |        | $DD8E
    .byte $00 ; |        | $DD8F
    .byte $10 ; |   X    | $DD90
    .byte $00 ; |        | $DD91
    .byte $00 ; |        | $DD92
    .byte $00 ; |        | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $00 ; |        | $DD96
    .byte $00 ; |        | $DD97
    .byte $00 ; |        | $DD98
    .byte $00 ; |        | $DD99
    .byte $00 ; |        | $DD9A
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
    .byte $01 ; |       X| $DDAE
    .byte $01 ; |       X| $DDAF
    .byte $01 ; |       X| $DDB0
    .byte $06 ; |     XX | $DDB1
    .byte $07 ; |     XXX| $DDB2
    .byte $07 ; |     XXX| $DDB3
    .byte $0F ; |    XXXX| $DDB4
    .byte $1E ; |   XXXX | $DDB5
    .byte $3E ; |  XXXXX | $DDB6
    .byte $3C ; |  XXXX  | $DDB7
    .byte $5C ; | X XXX  | $DDB8
    .byte $EC ; |XXX XX  | $DDB9
    .byte $EE ; |XXX XXX | $DDBA
    .byte $7F ; | XXXXXXX| $DDBB
    .byte $3F ; |  XXXXXX| $DDBC
    .byte $1F ; |   XXXXX| $DDBD
    .byte $1F ; |   XXXXX| $DDBE
    .byte $07 ; |     XXX| $DDBF
    .byte $0D ; |    XX X| $DDC0
    .byte $1E ; |   XXXX | $DDC1
    .byte $3F ; |  XXXXXX| $DDC2
    .byte $57 ; | X X XXX| $DDC3
    .byte $EF ; |XXX XXXX| $DDC4
    .byte $FF ; |XXXXXXXX| $DDC5
    .byte $DF ; |XX XXXXX| $DDC6
    .byte $8F ; |X   XXXX| $DDC7
    .byte $C6 ; |XX   XX | $DDC8
    .byte $C8 ; |XX  X   | $DDC9
    .byte $1C ; |   XXX  | $DDCA
    .byte $1C ; |   XXX  | $DDCB
    .byte $1E ; |   XXXX | $DDCC
    .byte $26 ; |  X  XX | $DDCD
    .byte $3E ; |  XXXXX | $DDCE
    .byte $1E ; |   XXXX | $DDCF
    .byte $1C ; |   XXX  | $DDD0

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
    .byte $F0 ; |XXXX    | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $30 ; |  XX    | $DDF0
    .byte $F0 ; |XXXX    | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $F0 ; |XXXX    | $DDF3
    .byte $80 ; |X       | $DDF4
    .byte $25 ; |  X  X X| $DDF5
    .byte $E5 ; |XXX  X X| $DDF6
    .byte $75 ; | XXX X X| $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $10 ; |   X    | $DDFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SixDigitDisplay SUBROUTINE
    ldy    #6                    ;2  @42
    sty    $F8                   ;3  @45
    lda    $F7                   ;3  @48
    clc                          ;2  @50
    bcc    .skipHmoveClear       ;3  @53   always branch

.loopSixDigitDisplay:
    sta    HMCLR                 ;3  @53
.skipHmoveClear:
    ldy    $F8                   ;3  @56
    lda    ($F9),Y               ;5  @61
    sta    $F7                   ;3  @64
    lda    ($F2),Y               ;5  @69
    tax                          ;2  @71
    lda    ($F4),Y               ;5  @76
;---------------------------------------
    sta    HMOVE                 ;3  @3
    sta    GRP0                  ;3  @6
    lda    ($EC),Y               ;5  @11
    sta    GRP1                  ;3  @14
    lda    ($EE),Y               ;5  @19
    sta    GRP0                  ;3  @22
    lda    ($F0),Y               ;5  @27
    ldy    $F7                   ;3  @30
    sta    GRP1                  ;3  @33
    stx    GRP0                  ;3  @36
    sty    GRP1                  ;3  @39
    sta    GRP0                  ;3  @42
    dec    $F8                   ;5  @47
    bpl    .loopSixDigitDisplay  ;2³ @49/50

    sta    WSYNC
;---------------------------------------
    sta    HMOVE                 ;3  @3
    lda    #0                    ;2  @5
    sta    GRP0                  ;3  @8
    sta    GRP1                  ;3  @11
    sta    GRP0                  ;3  @14
Waste12Cylces SUBROUTINE
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $DE3F
    .byte $18 ; |   XX   | $DE40
    .byte $3C ; |  XXXX  | $DE41
    .byte $3C ; |  XXXX  | $DE42
    .byte $3C ; |  XXXX  | $DE43
    .byte $3C ; |  XXXX  | $DE44
    .byte $18 ; |   XX   | $DE45
    .byte $00 ; |        | $DE46
    .byte $00 ; |        | $DE47
    .byte $00 ; |        | $DE48
    .byte $00 ; |        | $DE49
    .byte $18 ; |   XX   | $DE4A
    .byte $3C ; |  XXXX  | $DE4B
    .byte $1E ; |   XXXX | $DE4C
    .byte $7C ; | XXXXX  | $DE4D
    .byte $FF ; |XXXXXXXX| $DE4E
    .byte $FE ; |XXXXXXX | $DE4F
    .byte $7F ; | XXXXXXX| $DE50
    .byte $FF ; |XXXXXXXX| $DE51
    .byte $3C ; |  XXXX  | $DE52
    .byte $7E ; | XXXXXX | $DE53
    .byte $3C ; |  XXXX  | $DE54
    .byte $18 ; |   XX   | $DE55
    .byte $40 ; | X      | $DE56
    .byte $40 ; | X      | $DE57
    .byte $42 ; | X    X | $DE58
    .byte $42 ; | X    X | $DE59
    .byte $44 ; | X   X  | $DE5A
    .byte $44 ; | X   X  | $DE5B
    .byte $44 ; | X   X  | $DE5C
    .byte $42 ; | X    X | $DE5D
    .byte $42 ; | X    X | $DE5E
    .byte $40 ; | X      | $DE5F
    .byte $40 ; | X      | $DE60
    .byte $40 ; | X      | $DE61
    .byte $0E ; |    XXX | $DE62
    .byte $0C ; |    XX  | $DE63
    .byte $0A ; |    X X | $DE64
    .byte $0C ; |    XX  | $DE65
    .byte $0C ; |    XX  | $DE66
    .byte $0E ; |    XXX | $DE67
    .byte $0E ; |    XXX | $DE68
    .byte $0C ; |    XX  | $DE69
    .byte $0C ; |    XX  | $DE6A
    .byte $0A ; |    X X | $DE6B
    .byte $0A ; |    X X | $DE6C
    .byte $0A ; |    X X | $DE6D
    .byte $00 ; |        | $DE6E
    .byte $80 ; |X       | $DE6F
    .byte $18 ; |   XX   | $DE70
    .byte $3D ; |  XXXX X| $DE71
    .byte $24 ; |  X  X  | $DE72
    .byte $7E ; | XXXXXX | $DE73
    .byte $81 ; |X      X| $DE74
    .byte $81 ; |X      X| $DE75
    .byte $7E ; | XXXXXX | $DE76
    .byte $24 ; |  X  X  | $DE77
    .byte $3C ; |  XXXX  | $DE78
    .byte $59 ; | X XX  X| $DE79
    .byte $00 ; |        | $DE7A
    .byte $18 ; |   XX   | $DE7B
    .byte $01 ; |       X| $DE7C
    .byte $20 ; |  X     | $DE7D
    .byte $45 ; | X   X X| $DE7E
    .byte $5A ; | X XX X | $DE7F
    .byte $BD ; |X XXXX X| $DE80
    .byte $BD ; |X XXXX X| $DE81
    .byte $5A ; | X XX X | $DE82
    .byte $26 ; |  X  XX | $DE83
    .byte $40 ; | X      | $DE84
    .byte $02 ; |      X | $DE85
    .byte $18 ; |   XX   | $DE86
    .byte $00 ; |        | $DE87
    .byte $44 ; | X   X  | $DE88
    .byte $01 ; |       X| $DE89
    .byte $00 ; |        | $DE8A
    .byte $80 ; |X       | $DE8B
    .byte $19 ; |   XX  X| $DE8C
    .byte $3C ; |  XXXX  | $DE8D
    .byte $3C ; |  XXXX  | $DE8E
    .byte $98 ; |X  XX   | $DE8F
    .byte $00 ; |        | $DE90
    .byte $A0 ; |X X     | $DE91
    .byte $05 ; |     X X| $DE92
    .byte $00 ; |        | $DE93
    .byte $18 ; |   XX   | $DE94
    .byte $01 ; |       X| $DE95
    .byte $20 ; |  X     | $DE96
    .byte $45 ; | X   X X| $DE97
    .byte $42 ; | X    X | $DE98
    .byte $81 ; |X      X| $DE99
    .byte $81 ; |X      X| $DE9A
    .byte $42 ; | X    X | $DE9B
    .byte $26 ; |  X  XX | $DE9C
    .byte $40 ; | X      | $DE9D
    .byte $02 ; |      X | $DE9E
    .byte $18 ; |   XX   | $DE9F
    .byte $00 ; |        | $DEA0
    .byte $44 ; | X   X  | $DEA1
    .byte $01 ; |       X| $DEA2
    .byte $00 ; |        | $DEA3
    .byte $80 ; |X       | $DEA4
    .byte $01 ; |       X| $DEA5
    .byte $40 ; | X      | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $81 ; |X      X| $DEA8
    .byte $08 ; |    X   | $DEA9
    .byte $20 ; |  X     | $DEAA
    .byte $04 ; |     X  | $DEAB
    .byte $00 ; |        | $DEAC
    .byte $54 ; | X X X  | $DEAD
    .byte $5C ; | X XXX  | $DEAE
    .byte $DF ; |XX XXXXX| $DEAF
    .byte $DA ; |XX XX X | $DEB0
    .byte $EC ; |XXX XX  | $DEB1
    .byte $DC ; |XX XXX  | $DEB2
    .byte $FE ; |XXXXXXX | $DEB3
    .byte $7F ; | XXXXXXX| $DEB4
    .byte $3F ; |  XXXXXX| $DEB5
    .byte $1F ; |   XXXXX| $DEB6
    .byte $1F ; |   XXXXX| $DEB7
    .byte $07 ; |     XXX| $DEB8
    .byte $0D ; |    XX X| $DEB9
    .byte $1E ; |   XXXX | $DEBA
    .byte $3F ; |  XXXXXX| $DEBB
    .byte $57 ; | X X XXX| $DEBC
    .byte $EF ; |XXX XXXX| $DEBD
    .byte $DF ; |XX XXXXX| $DEBE
    .byte $DF ; |XX XXXXX| $DEBF
    .byte $8F ; |X   XXXX| $DEC0
    .byte $C6 ; |XX   XX | $DEC1
    .byte $C8 ; |XX  X   | $DEC2
    .byte $1C ; |   XXX  | $DEC3
    .byte $1C ; |   XXX  | $DEC4
    .byte $1E ; |   XXXX | $DEC5
    .byte $26 ; |  X  XX | $DEC6
    .byte $3E ; |  XXXXX | $DEC7
    .byte $1E ; |   XXXX | $DEC8
    .byte $1C ; |   XXX  | $DEC9
    .byte $00 ; |        | $DECA
    .byte $00 ; |        | $DECB
    .byte $00 ; |        | $DECC
    .byte $00 ; |        | $DECD
    .byte $00 ; |        | $DECE
    .byte $00 ; |        | $DECF
    .byte $08 ; |    X   | $DED0
    .byte $00 ; |        | $DED1
    .byte $1C ; |   XXX  | $DED2
    .byte $BE ; |X XXXXX | $DED3
    .byte $7E ; | XXXXXX | $DED4
    .byte $63 ; | XX   XX| $DED5
    .byte $63 ; | XX   XX| $DED6
    .byte $F3 ; |XXXX  XX| $DED7
    .byte $C1 ; |XX     X| $DED8
    .byte $C0 ; |XX      | $DED9
    .byte $75 ; | XXX X X| $DEDA
    .byte $60 ; | XX     | $DEDB
    .byte $78 ; | XXXX   | $DEDC
    .byte $52 ; | X X  X | $DEDD
    .byte $50 ; | X X    | $DEDE
    .byte $28 ; |  X X   | $DEDF
    .byte $3C ; |  XXXX  | $DEE0
    .byte $B9 ; |X XXX  X| $DEE1
    .byte $AC ; |X X XX  | $DEE2
    .byte $38 ; |  XXX   | $DEE3
    .byte $70 ; | XXX    | $DEE4
    .byte $58 ; | X XX   | $DEE5
    .byte $72 ; | XXX  X | $DEE6
    .byte $38 ; |  XXX   | $DEE7
    .byte $2C ; |  X XX  | $DEE8
    .byte $38 ; |  XXX   | $DEE9
    .byte $1E ; |   XXXX | $DEEA
    .byte $54 ; | X X X  | $DEEB
    .byte $0E ; |    XXX | $DEEC
    .byte $0E ; |    XXX | $DEED
    .byte $FC ; |XXXXXX  | $DEEE
    .byte $5F ; | X XXXXX| $DEEF
    .byte $3E ; |  XXXXX | $DEF0
    .byte $FB ; |XXXXX XX| $DEF1
    .byte $8E ; |X   XXX | $DEF2
    .byte $06 ; |     XX | $DEF3
    .byte $10 ; |   X    | $DEF4
LDEF5:
    .byte $9D ; |X  XXX X| $DEF5
    .byte $50 ; | X X    | $DEF6
    .byte $58 ; | X XX   | $DEF7
    .byte $60 ; | XX     | $DEF8
    .byte $68 ; | XX X   | $DEF9
    .byte $70 ; | XXX    | $DEFA
    .byte $78 ; | XXXX   | $DEFB
    .byte $08 ; |    X   | $DEFC
    .byte $48 ; | X  X   | $DEFD
    .byte $40 ; | X      | $DEFE
    .byte $00 ; |        | $DEFF
    .byte $3C ; |  XXXX  | $DF00
    .byte $66 ; | XX  XX | $DF01
    .byte $66 ; | XX  XX | $DF02
    .byte $66 ; | XX  XX | $DF03
    .byte $66 ; | XX  XX | $DF04
    .byte $66 ; | XX  XX | $DF05
    .byte $3C ; |  XXXX  | $DF06
    .byte $00 ; |        | $DF07
    .byte $3C ; |  XXXX  | $DF08
    .byte $18 ; |   XX   | $DF09
    .byte $18 ; |   XX   | $DF0A
    .byte $18 ; |   XX   | $DF0B
    .byte $18 ; |   XX   | $DF0C
    .byte $38 ; |  XXX   | $DF0D
    .byte $18 ; |   XX   | $DF0E
    .byte $00 ; |        | $DF0F
    .byte $7E ; | XXXXXX | $DF10
    .byte $60 ; | XX     | $DF11
    .byte $60 ; | XX     | $DF12
    .byte $3C ; |  XXXX  | $DF13
    .byte $06 ; |     XX | $DF14
    .byte $46 ; | X   XX | $DF15
    .byte $3C ; |  XXXX  | $DF16
    .byte $00 ; |        | $DF17
    .byte $3C ; |  XXXX  | $DF18
    .byte $46 ; | X   XX | $DF19
    .byte $06 ; |     XX | $DF1A
    .byte $0C ; |    XX  | $DF1B
    .byte $06 ; |     XX | $DF1C
    .byte $46 ; | X   XX | $DF1D
    .byte $3C ; |  XXXX  | $DF1E
    .byte $00 ; |        | $DF1F
    .byte $0C ; |    XX  | $DF20
    .byte $0C ; |    XX  | $DF21
    .byte $7E ; | XXXXXX | $DF22
    .byte $4C ; | X  XX  | $DF23
    .byte $2C ; |  X XX  | $DF24
    .byte $1C ; |   XXX  | $DF25
    .byte $0C ; |    XX  | $DF26
    .byte $00 ; |        | $DF27
    .byte $7C ; | XXXXX  | $DF28
    .byte $46 ; | X   XX | $DF29
    .byte $06 ; |     XX | $DF2A
    .byte $7C ; | XXXXX  | $DF2B
    .byte $60 ; | XX     | $DF2C
    .byte $60 ; | XX     | $DF2D
    .byte $7E ; | XXXXXX | $DF2E
    .byte $00 ; |        | $DF2F
    .byte $3C ; |  XXXX  | $DF30
    .byte $66 ; | XX  XX | $DF31
    .byte $66 ; | XX  XX | $DF32
    .byte $7C ; | XXXXX  | $DF33
    .byte $60 ; | XX     | $DF34
    .byte $62 ; | XX   X | $DF35
    .byte $3C ; |  XXXX  | $DF36
    .byte $00 ; |        | $DF37
    .byte $18 ; |   XX   | $DF38
    .byte $18 ; |   XX   | $DF39
    .byte $18 ; |   XX   | $DF3A
    .byte $0C ; |    XX  | $DF3B
    .byte $06 ; |     XX | $DF3C
    .byte $42 ; | X    X | $DF3D
    .byte $7E ; | XXXXXX | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $3C ; |  XXXX  | $DF40
    .byte $66 ; | XX  XX | $DF41
    .byte $66 ; | XX  XX | $DF42
    .byte $3C ; |  XXXX  | $DF43
    .byte $66 ; | XX  XX | $DF44
    .byte $66 ; | XX  XX | $DF45
    .byte $3C ; |  XXXX  | $DF46
    .byte $00 ; |        | $DF47
    .byte $3C ; |  XXXX  | $DF48
    .byte $46 ; | X   XX | $DF49
    .byte $06 ; |     XX | $DF4A
    .byte $3E ; |  XXXXX | $DF4B
    .byte $66 ; | XX  XX | $DF4C
    .byte $66 ; | XX  XX | $DF4D
    .byte $3C ; |  XXXX  | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $61 ; | XX    X| $DF50
    .byte $31 ; |  XX   X| $DF51
    .byte $1F ; |   XXXXX| $DF52
    .byte $0D ; |    XX X| $DF53
    .byte $07 ; |     XXX| $DF54
    .byte $03 ; |      XX| $DF55
    .byte $01 ; |       X| $DF56
    .byte $00 ; |        | $DF57
    .byte $6A ; | XX X X | $DF58
    .byte $4A ; | X  X X | $DF59
    .byte $4A ; | X  X X | $DF5A
    .byte $4A ; | X  X X | $DF5B
    .byte $6A ; | XX X X | $DF5C
    .byte $08 ; |    X   | $DF5D
    .byte $7F ; | XXXXXXX| $DF5E
    .byte $00 ; |        | $DF5F
    .byte $85 ; |X    X X| $DF60
    .byte $C4 ; |XX   X  | $DF61
    .byte $E5 ; |XXX  X X| $DF62
    .byte $B5 ; |X XX X X| $DF63
    .byte $99 ; |X  XX  X| $DF64
    .byte $8C ; |X   XX  | $DF65
    .byte $87 ; |X    XXX| $DF66
    .byte $00 ; |        | $DF67
    .byte $D7 ; |XX X XXX| $DF68
    .byte $55 ; | X X X X| $DF69
    .byte $D5 ; |XX X X X| $DF6A
    .byte $15 ; |   X X X| $DF6B
    .byte $D7 ; |XX X XXX| $DF6C
    .byte $00 ; |        | $DF6D
    .byte $F0 ; |XXXX    | $DF6E
    .byte $00 ; |        | $DF6F
    .byte $48 ; | X  X   | $DF70
    .byte $58 ; | X XX   | $DF71
    .byte $78 ; | XXXX   | $DF72
    .byte $68 ; | XX X   | $DF73
    .byte $48 ; | X  X   | $DF74
    .byte $00 ; |        | $DF75
    .byte $00 ; |        | $DF76
    .byte $00 ; |        | $DF77
    .byte $3C ; |  XXXX  | $DF78
    .byte $42 ; | X    X | $DF79
    .byte $5A ; | X XX X | $DF7A
    .byte $52 ; | X X  X | $DF7B
    .byte $5A ; | X XX X | $DF7C
    .byte $42 ; | X    X | $DF7D
    .byte $3C ; |  XXXX  | $DF7E
    .byte $00 ; |        | $DF7F
    .byte $82 ; |X     X | $DF80
    .byte $C2 ; |XX    X | $DF81
    .byte $61 ; | XX    X| $DF82
    .byte $61 ; | XX    X| $DF83
    .byte $31 ; |  XX   X| $DF84
    .byte $3B ; |  XXX XX| $DF85
    .byte $1F ; |   XXXXX| $DF86
    .byte $0D ; |    XX X| $DF87
    .byte $0E ; |    XXX | $DF88
    .byte $2E ; |  X XXX | $DF89
    .byte $2E ; |  X XXX | $DF8A
    .byte $6D ; | XX XX X| $DF8B
    .byte $DD ; |XX XXX X| $DF8C
    .byte $DD ; |XX XXX X| $DF8D
    .byte $FD ; |XXXXXX X| $DF8E
    .byte $DB ; |XX XX XX| $DF8F
    .byte $7B ; | XXXX XX| $DF90
    .byte $7A ; | XXXX X | $DF91
    .byte $3E ; |  XXXXX | $DF92
    .byte $1E ; |   XXXX | $DF93
    .byte $0C ; |    XX  | $DF94
    .byte $10 ; |   X    | $DF95
    .byte $38 ; |  XXX   | $DF96
    .byte $38 ; |  XXX   | $DF97
    .byte $3C ; |  XXXX  | $DF98
    .byte $4C ; | X  XX  | $DF99
    .byte $7C ; | XXXXX  | $DF9A
    .byte $3C ; |  XXXX  | $DF9B
    .byte $38 ; |  XXX   | $DF9C
BlankDigit:
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
    .byte $00 ; |        | $DFA0
    .byte $00 ; |        | $DFA1
    .byte $00 ; |        | $DFA2
    .byte $00 ; |        | $DFA3
    .byte $00 ; |        | $DFA4
PlayerGfxOne:
    .byte $8E ; |X   XXX | $DFA5
    .byte $88 ; |X   X   | $DFA6
    .byte $E8 ; |XXX X   | $DFA7
    .byte $A8 ; |X X X   | $DFA8
    .byte $E8 ; |XXX X   | $DFA9
PlayerGfxTwo:
    .byte $A4 ; |X X  X  | $DFAA
    .byte $A4 ; |X X  X  | $DFAB
    .byte $EE ; |XXX XXX | $DFAC
    .byte $AA ; |X X X X | $DFAD
    .byte $EA ; |XXX X X | $DFAE
PlayerGfxThree:
    .byte $EA ; |XXX X X | $DFAF
    .byte $8C ; |X   XX  | $DFB0
    .byte $CE ; |XX  XXX | $DFB1
    .byte $8A ; |X   X X | $DFB2
    .byte $EE ; |XXX XXX | $DFB3
EnemyGfxOne:
    .byte $3A ; |  XXX X | $DFB4
    .byte $23 ; |  X   XX| $DFB5
    .byte $33 ; |  XX  XX| $DFB6
    .byte $23 ; |  X   XX| $DFB7
    .byte $3A ; |  XXX X | $DFB8
EnemyGfxTwo:
    .byte $BA ; |X XXX X | $DFB9
    .byte $A2 ; |X X   X | $DFBA
    .byte $B3 ; |X XX  XX| $DFBB
    .byte $A3 ; |X X   XX| $DFBC
    .byte $BA ; |X XXX X | $DFBD
EnemyGfxThree:
    .byte $90 ; |X  X    | $DFBE
    .byte $90 ; |X  X    | $DFBF
    .byte $B8 ; |X XXX   | $DFC0
    .byte $A8 ; |X X X   | $DFC1
    .byte $A8 ; |X X X   | $DFC2

    .byte $EA ; |XXX X X | $DFC3
    .byte $4A ; | X  X X | $DFC4
    .byte $4A ; | X  X X | $DFC5
    .byte $4C ; | X  XX  | $DFC6
    .byte $4A ; | X  X X | $DFC7
    .byte $4A ; | X  X X | $DFC8
    .byte $EE ; |XXX XXX | $DFC9
    .byte $00 ; |        | $DFCA
    .byte $EA ; |XXX X X | $DFCB
    .byte $8A ; |X   X X | $DFCC
    .byte $8A ; |X   X X | $DFCD
    .byte $EE ; |XXX XXX | $DFCE
    .byte $8E ; |X   XXX | $DFCF
    .byte $8E ; |X   XXX | $DFD0
    .byte $EA ; |XXX X X | $DFD1
    .byte $00 ; |        | $DFD2
LDFD3:
    .byte $04 ; |     X  | $DFD3
    .byte $0C ; |    XX  | $DFD4
LDFD5:
    .byte $FC ; |XXXXXX  | $DFD5
    .byte $FB ; |XXXXX XX| $DFD6
LDFD7:
    .byte $E0 ; |XXX     | $DFD7
    .byte $E8 ; |XXX X   | $DFD8
    .byte $D8 ; |XX XX   | $DFD9
    .byte $D8 ; |XX XX   | $DFDA
    .byte $E0 ; |XXX     | $DFDB
    .byte $E0 ; |XXX     | $DFDC
    .byte $D8 ; |XX XX   | $DFDD
    .byte $D8 ; |XX XX   | $DFDE
    .byte $D8 ; |XX XX   | $DFDF
    .byte $D8 ; |XX XX   | $DFE0

IndirectLoJumpTab:
    .byte <LD0F0         ; $DFE1   $D0xx
    .byte <LD09B         ; $DFE2
    .byte <LD09B         ; $DFE3
    .byte <LD0A2         ; $DFE4
    .byte <LD0F6         ; $DFE5
    .byte <LD0C5         ; $DFE6
    .byte <LD0D1         ; $DFE7
    .byte <LD0DC         ; $DFE8
    .byte <LD0E2         ; $DFE9
    .byte <LD0A6         ; $DFEA
    .byte <LD0AE         ; $DFEB

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    LD00C                 ; 3

LDFF2:
    bit    BANK_1                ; 4
LDFF5:
    jmp    $FFF5                 ; 3

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

       ORG $1FFC
      RORG $DFFC

    .word START_Bank0
    .word START_Bank0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $F000

LF0D4:
    jmp    LF194                 ; 3    this was moved

START_Bank1:
    sei                          ; 2
;    bit    BANK_1                ; 4    save 3 bytes
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    stx    $CF                   ; 3
    inx                          ; 2   X=0, clear
    stx    $CE                   ; 3
    stx    $D2                   ; 3
LF00F:
    lda    #0                    ; 2
LF011:
    sta    0,X                   ; 4
    inx                          ; 2
    cpx    #$CE                  ; 2
    bcc    LF011                 ; 2³
    ldy    #$31                  ; 2
    jsr    LFA7F                 ; 6
    lda    $81                   ; 3
    bne    LF032                 ; 2³
    sta    $9D                   ; 3   A=0, clear
    sta    $9E                   ; 3
    sta    $CB                   ; 3   no life bar for player,
    sta    $CC                   ; 3   no life bar for enemy
    inc    $81                   ; 5
    bne    LF032                 ; 2³
LF02D:
    ldx    #$82                  ; 2
    tya                          ; 2
    bne    LF00F                 ; 2³

LF032:
    ldy    INTIM                 ; 4
    bne    LF032                 ; 2³

;    ldx    #$82                  ; 2
;    sta    WSYNC                 ; 3
;    stx    VSYNC                 ; 3
;    sta    WSYNC                 ; 3
;    sta    WSYNC                 ; 3
;    sta    WSYNC                 ; 3
;    dex                          ; 2
;    stx    VSYNC                 ; 3

;save 5 bytes
    lda    #$0E
.loopVsync:
    sta    WSYNC                 ;     3 scalines of vsync
;-------------------------------------
    sta    VSYNC
    lsr
    bne    .loopVsync

    lda    #$32;1                  ; 2
;save 2 bytes
;    sta    WSYNC                 ; 3
    sta    TIM64T                ; 4
    ldx    $85                   ; 3
    lda    $CF                   ; 3
    bpl    LF063                 ; 2³
    cmp    #$FF                  ; 2
    bne    LF060                 ; 2³
    lda    frameCounter          ; 3
    and    #$7F                  ; 2
    bne    LF060                 ; 2³
    jsr    LFE58                 ; 6
LF060:
;    jmp    LFA54                 ; 3
    brk


LF085:
    jsr    LFE58                 ; 6
LF088:
    jsr    LFA72                 ; 6
    lda    #$10                  ; 2
    sta    $B8                   ; 3
LF08F:
    bit    $A2                   ; 3
    bmi    LF0D7                 ; 2³
    bvc    LF0D4                 ; 2³
    lda    $B8                   ; 3
    cmp    #$0F                  ; 2
    bcc    LF0D1                 ; 2³
    lda    $BA                   ; 3
    bpl    LF0D1                 ; 2³
    ldy    #5                    ; 2
    jsr    LFA57                 ; 6
    lda    $CA                   ; 3
    cmp    #$83                  ; 2
    beq    LF0BB                 ; 2³
    lda    $9F,X                 ; 4
    lsr                          ; 2
    bcc    LF0B5                 ; 2³
    jsr    LFABB                 ; 6
;    jmp    LFA54                 ; 3
    brk

LF0B5:
    jsr    LFB4D                 ; 6
;    jmp    LFA54                 ; 3
    brk

LF063:
    lda    $A2                   ; 3
    lsr                          ; 2
    bcc    LF08F                 ; 2³
    lda    $C0                   ; 3
    cmp    #9                    ; 2
    beq    LF0D1                 ; 2³
    dec    $9D,X                 ; 6
    lda    $D2                   ; 3
    beq    LF07D                 ; 2³
    txa                          ; 2
    eor    #$01                  ; 2
    tay                          ; 2
    lda.wy $9D,Y                 ; 4
    bpl    LF085                 ; 2³
LF07D:
    lda    $9D,X                 ; 4
    bpl    LF088                 ; 2³
    sta    $CF                   ; 3
;    bmi    LF0D1                 ; 3   always branch
    brk




LF0BB:
    jsr    LFD4D                 ; 6
    lda    #4                    ; 2
    sta    $B8                   ; 3
    ldx    #0                    ; 2
    stx    $A2                   ; 3
    dex                          ; 2
    stx    $BA                   ; 3
    lda    #$0A                  ; 2
    sta    $B9                   ; 3
    lda    #$FB                  ; 2
    sta    $BB                   ; 3
LF0D1:
;    jmp    LFA54                 ; 3
    brk



LF0D7:
    ldy    $94                   ; 3
    beq    LF0DF                 ; 2³
    dec    $94                   ; 5
    bne    LF0D1                 ; 2³
LF0DF:
    lda    $9F,X                 ; 4
    tay                          ; 2
    lsr                          ; 2
    lda    $A2                   ; 3
    and    #$02                  ; 2
    bne    LF11F                 ; 2³+1
    bcc    LF0F3                 ; 2³
    inc    $CA                   ; 5
    jsr    LFAF5                 ; 6
    jmp    LF0F8                 ; 3

LF0F3:
    dec    $CA                   ; 5
    jsr    LFB92                 ; 6
LF0F8:
    ldx    $CA                   ; 3
    cpx    #$82                  ; 2
    beq    LF119                 ; 2³+1
    cpy    #5                    ; 2
    bcc    LF0D1                 ; 2³+1
    cpx    #$69                  ; 2
    bcc    LF0D1                 ; 2³+1
    ldx    #6                    ; 2
    jsr    LFDB5                 ; 6
    lda    #$10                  ; 2
    sta    $A3                   ; 3
    sta    $DC                   ; 3
    lda    #2                    ; 2
    sta    $C4                   ; 3
    inc    $C8                   ; 5
    bne    LF0D1                 ; 2³+1
LF119:
    lda    #$82                  ; 2
    sta    $A2                   ; 3
;    bne    LF0D1                 ; 3+1   always branch
    brk

LF11F:
    lda    $CA                   ; 3
    jsr    LFBDC                 ; 6
    bcc    LF142                 ; 2³
    cpy    #5                    ; 2
    bne    LF12E                 ; 2³
    cmp    #$54                  ; 2
    bcc    LF142                 ; 2³
LF12E:
    tya                          ; 2
    lsr                          ; 2
    bcc    LF135                 ; 2³
    dec    $CA                   ; 5
    .byte $2C ; BIT opcode, skip 2 bytes
LF135:
    inc    $CA                   ; 5
    jsr    LFB32                 ; 6
    ldy    #5                    ; 2
    jsr    LFA57                 ; 6
LF13F:
;    jmp    LFA54                 ; 3
    brk

LF142:
    lda    $CB                   ; 3   any life bar left for player?
    beq    LF15B                 ; 2³  no, branch
    lda    frameCounter          ; 3
    and    #$03                  ; 2   slow the decrease in life bar by 4 frames
    bne    LF13F                 ; 2³
    dec    $CB                   ; 5
    ldy    #1                    ; 2
    jsr    LFA57                 ; 6
;    lda    #1                    ; 2
    jsr    LFE16                 ; 6
;    jmp    LFA54                 ; 3
    brk

LF15B:
    lda    #$16                  ; 2
    jsr    LFDF9                 ; 6
    bcs    LF180                 ; 2³
    ldx    $85                   ; 3
    ldy    $9F,X                 ; 4
    iny                          ; 2
    cpy    #6                    ; 2
    bcc    LF178                 ; 2³
    ldy    #1                    ; 2
    lda    $A1                   ; 3
    cmp    #$FF                  ; 2
    beq    LF178                 ; 2³
    clc                          ; 2
    adc    #$20                  ; 2
    sta    $A1                   ; 3
LF178:
    sty    $9F,X                 ; 4
    jsr    LFA72                 ; 6
;    jmp    LFA54                 ; 3
    brk

LF180:
    ldy    #2                    ; 2
    jsr    LFA57                 ; 6
    lda    #$60                  ; 2
    ldx    #2                    ; 2
    jsr    LFE18                 ; 6
;    lda    #1                    ; 2
    jsr    LFE16                 ; 6
;    jmp    LFA54                 ; 3
    brk

LF194:
    ldy    $85                   ; 3   check player 0, or player 1?
    lda    SWCHA                 ; 4
    ora    JoystickBlockTab,Y    ; 4   nullify other joystick, check the current players joystick only...
    ldx    #16-1                 ; 2
.loopCheckJoysticks:
    cmp    JoyDirectionTab,X     ; 4
    beq    LF1B2                 ; 2³  check if any directions are pressed
    dex                          ; 2
    bpl    .loopCheckJoysticks   ; 2³

;---------------------------------------

  IF NEWCODE

;this new code checks the firebuttons for a punch or kick,
;when no direction is being pressed...
;
; knowns:
; - Y=0 if it's P0, and Y=1 when P1
; - register $DA holds enable for REFPx (for either P0, P1 at this point)
;     so facing left $DA = #$00, and facing right $DA = #$80
; - no direction is currently being pressed
; - if no button is pressed, routine conitinues where it did before the hack,
;      with "X" and "Y" holding original values. "A" gets reloaded before being used.
;
;
;32 bytes required

    lda.wy INPT4,Y               ; check button B, punch takes priority over kick
    bmi    .checkForKick1        ; branch if punch button not pressed...

;more efficient
    lda    $DA                   ; holds value for REFPx register, left = $00, right = $80
    lsr                          ; bit 3 is now in bit 2 postion, 0000 0x00
    ora    #$02                  ; if player is facing left A=2, right A=6
    bne    .replaceX             ; always branch

;;    ldx    #2                    ; punch high (left)
;;    lda    $DA                   ; but is player facing left?
;;    beq    .buttonpressed        ; - yes, branch
;;    ldx    #6                    ; - no, so punch high (right)
;;    bne    .buttonpressed        ; always branch

.checkForKick1:
    cpy    #0                    ; is it player 1?
    bne    .checkP1              ; - yes, branch
    lda    INPT1                 ; - no, check button C, P0
    jmp    .checkKickLeftRight

.checkP1:
    lda    INPT3                 ; - no, check button C, P1
.checkKickLeftRight:
    bmi    .bugFixFirebuttons    ; button not pressed... clear regsiter $CD for multiple punches and kicks


;more efficient
    lda    $DA                   ; holds value for REFPx register, left = $00, right = $80
    lsr                          ; bit 3 is now in bit 2 postion, 0000 0x00
    ora    #$01                  ; if player is facing left A=1, right A=5
    bne    .replaceX             ; always branch

;;    ldx    #1                    ; kick high (left)
;;    lda    $DA                   ; but is the player facing left?
;;    beq    .buttonpressed        ; - yes, branch
;;    ldx    #5                    ; - no, so kick high (right)
;;    bne    .buttonpressed        ; always branch

   ENDIF

;---------------------------------------

   IF !NEWCODE

    lda    $BC                   ; 3
    bne    LF1FA                 ; 2³
    jsr    LFD4D                 ; 6
    lda    #$40                  ; 2
    jmp    LF220                 ; 3

  ENDIF

LF1B2:
    cpx    #8                    ; 2
    bcc    .skipNormalization    ; 2³
    txa                          ; 2
    sbc    #8                    ; 2
    tax                          ; 2   X can now be used for both players
.skipNormalization:
    cpx    #7                    ; 2   is joystick being pushed up, i.e. player should jump
    beq    LF1FD                 ; 2³  - yes, branch

;---------------------------------------
;this will be no longer used, save 5 bytes

  IF !NEWCODE

    lda.wy INPT4,Y               ; 4   check firebutton 1 or 2
    bmi    LF1FD                 ; 2³  branch if no firebutton

  ENDIF

;---------------------------------------

  IF NEWCODE

; this new code checks both buttons, and updates X
; to make it work with new directions being added.
; i.e. left-down and right-down will now work for a
;   low kick when the kick button is pressed.
;
; knowns:
; - Y=0 if it's P0, and Y=1 when P1
; - at least one direction is currently being pressed
; - if no button is pressed, routine conitinues where it did before the hack,
;      with "X" and "Y" holding original values. "A" gets reloaded before being used.
;
;57 bytes required

    lda.wy INPT4,Y
    bmi    .checkForKick2        ; branch if neither punch button not pressed

;    cpx    #0                    ;
;    beq    .checkForKick2        ; branch if low kick or squat pressed, this can't be checked in punch code!

    cpx    #0
    bne    .checkOtherPunches
    ldx    #3
    lda    $DA
    beq    .buttonpressed
    inx
    bne    .buttonpressed         ; always branch


.checkOtherPunches:
;X current values range from 1 to 6
    lda    PunchTab-1,X          ; get new value, transfer to X below
    bpl    .replaceX             ; always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Original values for X...
;
; 0 - down       - squat, or low kick
; 1 - left       - move left, or high kick left
; 2 - left-up    - punch high left
; 3 - left-down  - punch low left
; 4 - right-down - punch low right
; 5 - right      - move right, or high kick right
; 6 - right-up   - punch high right
; 7 - up         - jump
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PunchTab:
    .byte $02   ; 1 - punch high left
    .byte $02   ; 2 - punch high left
    .byte $03   ; 3 - punch low left
    .byte $04   ; 4 - punch low right
    .byte $06   ; 5 - punch high right
    .byte $06   ; 6 - punch high right
KickTab:
    .byte $00   ; 0 - low kick
    .byte $01   ; 1 - kick high left
    .byte $01   ; 2 - kick high left
    .byte $00   ; 3 - low kick
    .byte $00   ; 4 - low kick
    .byte $05   ; 5 - kick high right
    .byte $05   ; 6 - kick high right

.checkForKick2:
    cpy    #1                    ; is it player 1?
    beq    .checkP1Instead       ; - yes, branch
    lda    INPT1                 ;
    jmp    .continue

.bugFixFirebuttons:
    lda    #0
    sta    $CD

  ENDIF

   IF NEWCODE

;old code that was moved to do a branch
    lda    $BC                   ; 3
    bne    LF1FA                 ; 2³
    jsr    LFD4D                 ; 6
    lda    #$40                  ; 2
    jmp    LF220                 ; 3

  ENDIF

  IF NEWCODE

.checkP1Instead:
    lda    INPT3                 ;
.continue:
    bmi    LF1FD                 ; branch if neither button pressed
    lda    KickTab,X             ;
.replaceX:
    tax

  ENDIF

;---------------------------------------

.buttonpressed:
    bit    $CD                   ; 3
    bmi    LF1FA                 ; 2³
    sec                          ; 2
    ror    $CD                   ; 5
    lda    $B5                   ; 3
    bpl    LF1FA                 ; 2³
    lda    $BC                   ; 3
    bne    LF1FA                 ; 2³
    stx    $B5                   ; 3
    lda    LFF68,X               ; 4
    ldy    #$B9                  ; 2
    ldx    #0                    ; 2
    and    #$C0                  ; 2
    beq    LF1E8                 ; 2³
    bpl    LF1E6                 ; 2³
    ldx    #8                    ; 2
    asl                          ; 2
    bpl    LF1E8                 ; 2³
LF1E6:
    ldy    #$B3                  ; 2
LF1E8:
    sty    $AE                   ; 3
    ldy    $B5                   ; 3
    beq    LF1F0                 ; 2³
    stx    $DA                   ; 3
LF1F0:
    lda    #$0A                  ; 2
    sta    $8A                   ; 3
    ldx    LFE84,Y               ; 4
    jsr    LFD63                 ; 6
LF1FA:
    jmp    LF25F                 ; 3

LF1FD:
    clc                          ; 2
    ror    $CD                   ; 5
    lda    LFFC8,X               ; 4
    sta    $F9                   ; 3
    ldy    $BC                   ; 3
    bne    LF25F                 ; 2³
    ldy    $B5                   ; 3
    bpl    LF25F                 ; 2³
    lsr                          ; 2
    bcs    LF224                 ; 2³
    lsr                          ; 2
    bcc    LF231                 ; 2³
    bit    $84                   ; 3
    bmi    LF25F                 ; 2³
    inc    $BC                   ; 5
    ldx    #6                    ; 2
    jsr    LFD57                 ; 6
    lda    #$80                  ; 2
LF220:
    sta    $84                   ; 3
    bne    LF25F                 ; 3   always branch

LF224:
    lda    #$40                  ; 2
    sta    $84                   ; 3
    lda    #$B9                  ; 2
    sta    $AE                   ; 3
    ldx    #1                    ; 2
    jsr    LFD63                 ; 6
LF231:
    bit    $F9                   ; 3
    bvs    LF24C                 ; 2³
    bpl    LF25F                 ; 2³
    jsr    LFABC                 ; 6
    bit    $BD                   ; 3
    bpl    LF25F                 ; 2³
    bit    $92                   ; 3
    bmi    LF25F                 ; 2³
;    inc    $C5                   ; 5
;    inc    $C5                   ; 5
    lda    #$80                  ; 2
;    sta    $92                   ; 3
    bne    MF259 ; LF25F                 ; 3   always branch

LF24C:
    jsr    LFB4E                 ; 6
    bit    $BD                   ; 3
    bpl    LF25F                 ; 2³
    bit    $92                   ; 3
    bvs    LF25F                 ; 2³
;    inc    $C5                   ; 5
;    inc    $C5                   ; 5
;    lda    #$40                  ; 2
;    sta    $92                   ; 3
    lda    #$40
MF259:
    sta    $92
    inc    $C5
    inc    $C5

LF25F:
    lda    $A2                   ; 3
    and    #$10                  ; 2
    beq    LF282                 ; 2³
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF27F                 ; 2³
    inc    $94                   ; 5
    lda    $94                   ; 3
    cmp    #3                    ; 2
    bcc    LF27A                 ; 2³
    jsr    LFC1F                 ; 6
    sta    $BD                   ; 3
    beq    LF27F                 ; 3   always branch

LF27A:
    adc    #7                    ; 2
    jsr    LFDB4                 ; 6
LF27F:
    jmp    LF98D                 ; 3

LF282:
    bit    $F6                   ; 3
    bvc    LF292                 ; 2³
    lda    $91                   ; 3
    cmp    #$24                  ; 2
    bne    LF28F                 ; 2³
    jsr    LFBCF                 ; 6
LF28F:
    jmp    LF2ED                 ; 3

LF292:
    bmi    LF2A3                 ; 2³
LF294:
    ldy    $BD                   ; 3
    bpl    LF2FA                 ; 2³
    ldx    $BF                   ; 3
    lda    $C5                   ; 3
    cmp    LFE79,X               ; 4
    bcc    LF2FA                 ; 2³
    sty    $C5                   ; 3
LF2A3:
    ldy    $BF                   ; 3
    ldx    LFFD0,Y               ; 4
LF2A8:
    lda    $C8                   ; 3
    clc                          ; 2
    adc    LFF2F,X               ; 4
    sta    $F7                   ; 3
    sec                          ; 2
    ldy    $DA                   ; 3
    bne    LF2BA                 ; 2³
    lda    $CA                   ; 3
    sbc    $F7                   ; 3
    .byte $2C ; BIT opcode, skip 2 bytes
LF2BA:
    sbc    $CA                   ; 3
    cmp    #$F9                  ; 2
    bcs    LF2D3                 ; 2³
    cmp    #7                    ; 2
    bcc    LF2D3                 ; 2³
    cmp    #$0E                  ; 2
    bcc    LF2CD                 ; 2³
    dex                          ; 2
    bpl    LF2A8                 ; 2³
    bmi    LF2FA                 ; 3   always branch

LF2CD:
    stx    $F9                   ; 3
    lda    $B5                   ; 3
    bpl    LF343                 ; 2³+1
LF2D3:
    bit    $C5                   ; 3
    stx    $F9                   ; 3
    bmi    LF318                 ; 2³+1
    lda    $B6                   ; 3
    bmi    LF31B                 ; 2³+1
    cmp    #1                    ; 2
    bne    LF2FD                 ; 2³
    ldy    $A3                   ; 3
    cpy    #$11                  ; 2
    bcc    LF2FD                 ; 2³
    lda    $BC                   ; 3
    bne    LF318                 ; 2³+1
    sta    $90                   ; 3
LF2ED:
    ldy    #7                    ; 2
LF2EF:
    jsr    LFBE6                 ; 6
    bvs    LF2FA                 ; 2³
LF2F4:
    jsr    LFA57                 ; 6
    jsr    LFAA5                 ; 6
LF2FA:
    jmp    LF42A                 ; 3

LF2FD:
    cmp    #3                    ; 2
    bcc    LF315                 ; 2³
    jsr    LFC61                 ; 6
    lsr                          ; 2
    bcc    LF2FA                 ; 2³+1
    lda    $94                   ; 3
    bmi    LF2FA                 ; 2³+1
LF30B:
    lda    $C3                   ; 3
    bne    LF2FA                 ; 2³+1
    inc    $C3                   ; 5
    ldy    #3                    ; 2
    bne    LF2F4                 ; 3+1   always branch

LF315:
    jmp    LF294                 ; 3

LF318:
    jmp    LF3D8                 ; 3

LF31B:
    cmp    #$80                  ; 2
    bne    LF32B                 ; 2³
    lda    $A6                   ; 3
    cmp    #$72                  ; 2
    beq    LF337                 ; 2³
    lda    $C4                   ; 3
    bne    LF2FA                 ; 2³+1
    beq    LF2ED                 ; 3+1   always branch

LF32B:
    cmp    #$81                  ; 2
    beq    LF337                 ; 2³
    cmp    #$83                  ; 2
    beq    LF2ED                 ; 2³+1
    lda    $94                   ; 3
    bne    LF2ED                 ; 2³+1
LF337:
    lda    #$10                  ; 2
    sta    $A2                   ; 3
    lda    #$FF                  ; 2
    sta    $94                   ; 3
    ldy    #3                    ; 2
    bne    LF2EF                 ; 3+1   always branch

LF343:
    jsr    LFBE6                 ; 6
    bvs    LF364                 ; 2³
    ldy    $B6                   ; 3
    bmi    LF3B2                 ; 2³
    beq    LF367                 ; 2³
    bit    $BD                   ; 3
    bpl    LF357                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    LF364                 ; 2³
LF357:
    cpy    #1                    ; 2
    bne    LF370                 ; 2³
    ldy    $B5                   ; 3
;    lda    LFF68,Y               ; 4   removed this code as it has no effect...
;    and    #$40                  ; 2
    bvc    LF3D8                 ; 2³   AND does not affect overflow flag, this might be an error in original game
LF364:
    jmp    LF42A                 ; 3

LF367:
    bit    $C1                   ; 3
    bmi    LF3D8                 ; 2³
    dec    $C1                   ; 5
    jmp    LF425                 ; 3

LF370:
    cpy    #3                    ; 2
    bcc    LF3D8                 ; 2³
    jsr    LFC61                 ; 6
    ldx    $94                   ; 3
    bmi    LF384                 ; 2³
    cpx    #5                    ; 2
    bcc    LF384                 ; 2³
    lsr                          ; 2
    bcs    LF30B                 ; 2³
    bcc    LF38F                 ; 3   always branch

LF384:
    lsr                          ; 2
    bcc    LF38F                 ; 2³
    lda    $CA                   ; 3
    sbc    $C8                   ; 3
    cmp    #$0D                  ; 2
    bcs    LF3AF                 ; 2³
LF38F:
    ldy    $B6                   ; 3
    cpy    #6                    ; 2
    bne    LF39B                 ; 2³
    lda    $B5                   ; 3
    cmp    #4                    ; 2
    bne    LF3AF                 ; 2³
LF39B:
    lda    $CC                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    beq    LF3A4                 ; 2³
    bcs    LF3AB                 ; 2³
LF3A4:
    ldy    #$0A                  ; 2
    jsr    LFA57                 ; 6
    lda    #0                    ; 2
LF3AB:
    sta    $CC                   ; 3
    beq    LF3D8                 ; 2³
LF3AF:
    jmp    LF425                 ; 3

LF3B2:
    cpy    #$81                  ; 2
    beq    LF337                 ; 2³
    cpy    #$80                  ; 2
    bne    LF3CD                 ; 2³
    lda    $A6                   ; 3
    cmp    #$72                  ; 2
    beq    LF3D8                 ; 2³
    bit    $DF                   ; 3
    bmi    LF364                 ; 2³
    sec                          ; 2
    ror    $DF                   ; 5
    lda    #4                    ; 2
    sta    $94                   ; 3
;    bne    LF3D8                 ; 3   always branch



LF3D8:
    bit    $BD                   ; 3
    bmi    LF3FB                 ; 2³
    ldx    $B5                   ; 3
    lda    $B6                   ; 3
    bpl    LF3E5                 ; 2³
    sec                          ; 2
    sbc    #$78                  ; 2
LF3E5:
    asl                          ; 2
    tay                          ; 2
    lda    LFF68,X               ; 4
    lsr                          ; 2
    bcc    LF3EE                 ; 2³
    iny                          ; 2
LF3EE:
    ldx    #1                    ; 2
    lda    LFFD4,Y               ; 4
    bpl    LF3F8                 ; 2³
    and    #$7F                  ; 2
    dex                          ; 2
LF3F8:
    jsr    LFE18                 ; 6
LF3FB:
    lda    #0                    ; 2
    sta    $BD                   ; 3
    sta    $C5                   ; 3
    lda    $BF                   ; 3
    beq    LF419                 ; 2³
    lda    $F9                   ; 3
    asl                          ; 2
    asl                          ; 2
    adc    $BF                   ; 3
    tay                          ; 2
    lda    LFF2F,Y               ; 4
    tay                          ; 2
    and    #$03                  ; 2
    sta    $DB                   ; 3
    jsr    LFD0D                 ; 6
    bne    LF425                 ; 2³
LF419:
    lda    $B6                   ; 3
    bmi    LF422                 ; 2³
    jsr    LFC39                 ; 6
    beq    LF425                 ; 3   always branch


;moved to save bytes
LF3CD:
    cpy    #$83                  ; 2
    bcs    LF3D8                 ; 2³
    lda    $94                   ; 3
    beq    LF3D8                 ; 2³
    jmp    LF2ED                 ; 3



LF422:
    jsr    LFC1F                 ; 6
LF425:
    ldy    #3                    ; 2
    jsr    LFA57                 ; 6
LF42A:
    lda    $93                   ; 3
    beq    LF433                 ; 2³
    dec    $93                   ; 5
LF430:
    jmp    LF575                 ; 3

LF433:
    bit    $B6                   ; 3
    bvc    LF430                 ; 2³
    bit    $A2                   ; 3
    bmi    LF430                 ; 2³
    lda    $81                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    cpx    #3                    ; 2
    bne    LF445                 ; 2³
    dex                          ; 2
LF445:
    jsr    LFC61                 ; 6
    ldy    $86                   ; 3
    cpy    #6                    ; 2
    bcc    LF4BB                 ; 2³
    lsr                          ; 2
    bcs    LF4BB                 ; 2³
    sta    $F7                   ; 3
    jsr    LFBDA                 ; 6
    lda    $F7                   ; 3
    bcs    LF4B8                 ; 2³
    lsr                          ; 2
    bcs    LF4A4                 ; 2³
    ldx    $81                   ; 3
    cpx    #$40                  ; 2
    bcc    LF47B                 ; 2³
    cpx    #$CC                  ; 2
    bcs    LF47B                 ; 2³
    txa                          ; 2
    sbc    $CA                   ; 3
    cmp    #$10                  ; 2
    bcc    LF4B8                 ; 2³
    cmp    #$EF                  ; 2
    bcs    LF4B8                 ; 2³
    stx    $C8                   ; 3
    ldx    #$0A                  ; 2
    ldy    #0                    ; 2
    tya                          ; 2
    beq    LF48C                 ; 3   always branch

LF47B:
    jsr    LFC08                 ; 6
    cpy    #$0A                  ; 2
    bcc    LF485                 ; 2³
    jsr    LFC08                 ; 6
LF485:
    ldx    #$0C                  ; 2
    ldy    #3                    ; 2
    jsr    LFC12                 ; 6
LF48C:
    sta    $DB                   ; 3
    sty    $94                   ; 3
    jsr    LFBEF                 ; 6
    lda    #$83                  ; 2
    sta    $B6                   ; 3
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$10                  ; 2
    bcs    LF4A1                 ; 2³
    adc    #$20                  ; 2
LF4A1:
    jmp    LF4D0                 ; 3

LF4A4:
    sta    $94                   ; 3
    lda    $81                   ; 3
    cmp    #$47                  ; 2
    bcc    LF4B8                 ; 2³
    cmp    #$C5                  ; 2
    bcs    LF4B8                 ; 2³
    ldy    $DA                   ; 3
    bne    LF4BE                 ; 2³
    cmp    #$6E                  ; 2
    bcc    LF4C2                 ; 2³
LF4B8:
    jmp    LF575                 ; 3

LF4BB:
    jmp    LF4D7                 ; 3

LF4BE:
    cmp    #$9E                  ; 2
    bcc    LF4B8                 ; 2³
LF4C2:
    sta    $C8                   ; 3
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $B6                   ; 3
    txa                          ; 2
    clc                          ; 2
    adc    #3                    ; 2
    tax                          ; 2
    lda    #$67                  ; 2
LF4D0:
    jsr    LFDB5                 ; 6
    ldx    #2                    ; 2
    bne    LF54B                 ; 3+1   always branch

LF4D7:
    lda    #0                    ; 2
    sta    $DB                   ; 3
    sta    $BF                   ; 3
    jsr    LFC61                 ; 6
    ldy    $86                   ; 3
    cpy    #3                    ; 2
    bcc    LF512                 ; 2³+1
    cpy    #$0A                  ; 2
    bcs    LF517                 ; 2³+1
LF4EA:
    cpy    #2                    ; 2
    bcc    LF4F5                 ; 2³
    cpy    #$0B                  ; 2
    bcs    LF4F5                 ; 2³
    lda    $81                   ; 3
    asl                          ; 2
LF4F5:
    jsr    LFDB5                 ; 6
    jsr    LFBF8                 ; 6
    jsr    LFC08                 ; 6
    jsr    LFC61                 ; 6
    cpx    #1                    ; 2
    bne    LF54D                 ; 2³
    cmp    #2                    ; 2
    bcc    LF556                 ; 2³
    jsr    LFBDA                 ; 6
    bcs    LF556                 ; 2³
    ldy    #$10                  ; 2
    bne    LF563                 ; 3   always branch

LF512:
    lsr                          ; 2
    bcs    LF4EA                 ; 2³+1
    bcc    LF51A                 ; 3   always branch

LF517:
    lsr                          ; 2
    bcc    LF4EA                 ; 2³+1
LF51A:
    lda    $CC                   ; 3
    beq    LF4EA                 ; 2³+1
    jsr    LFBDA                 ; 6
    bcs    LF575                 ; 2³
    ldy    $85                   ; 3
    ldx    $9F,Y                 ; 4
    dex                          ; 2
    txa                          ; 2
    lsr                          ; 2
    jsr    LFBF8                 ; 6
    jsr    LFC08                 ; 6
    lda    #$CC                  ; 2
    sta    $B2                   ; 3
    txa                          ; 2
    ldx    #1                    ; 2
    bcc    LF53A                 ; 2³
    dex                          ; 2
LF53A:
    clc                          ; 2
    adc    #3                    ; 2
    sta    $B6                   ; 3
    lda    #3                    ; 2
    sta    $B4                   ; 3
    lda    #$DA                  ; 2
    sta    $A7                   ; 3
    sta    $94                   ; 3
    lda    #$2F                  ; 2
LF54B:
    bne    LF571                 ; 3   always branch

LF54D:
    bcs    LF55C                 ; 2³
    lda    $81                   ; 3
    cmp    MFEBA-1,Y             ; 4
    bcc    LF558                 ; 2³
LF556:
    ldx    #2                    ; 2
LF558:
    lda    #0                    ; 2
    beq    LF55F                 ; 3   always branch

LF55C:
    jsr    LFC12                 ; 6
LF55F:
    ldy    #$2F                  ; 2
    sta    $DB                   ; 3
LF563:
    stx    $B6                   ; 3
    tya                          ; 2
    jsr    LFDB5                 ; 6
    cpx    #1                    ; 2
    bne    LF56F                 ; 2³
    inx                          ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LF56F:
    ldx    #0                    ; 2
LF571:
    sta    $A3                   ; 3
    stx    $C4                   ; 3
LF575:
    lda    $C8                   ; 3
    cmp    #$31                  ; 2
    beq    LF5A0                 ; 2³
    bit    $BD                   ; 3
    bmi    LF5A0                 ; 2³
    lda    $B6                   ; 3
    bpl    LF586                 ; 2³
    jmp    LF7B3                 ; 3

LF586:
    cmp    #1                    ; 2
    bne    LF590                 ; 2³
    ldx    $A3                   ; 3
    cpx    #$11                  ; 2
    bcs    LF5A3                 ; 2³
LF590:
    cmp    #3                    ; 2
    bcc    LF597                 ; 2³
    jmp    LF629                 ; 3

LF597:
    jsr    LFD2E                 ; 6
    bcs    LF5A3                 ; 2³
    lda    #$80                  ; 2
    sta    $BD                   ; 3
LF5A0:
    jmp    LF98D                 ; 3

LF5A3:
    lda    $B6                   ; 3
    beq    LF5AA                 ; 2³
LF5A7:
    jmp    LF6E7                 ; 3

LF5AA:
    lda    $D1                   ; 3
    beq    LF5FF                 ; 2³
    jsr    LFC61                 ; 6
    tax                          ; 2
    lda    frameCounter          ; 3
    and    LFFC3,X               ; 4
    bne    LF5A0                 ; 2³
    dec    $D1                   ; 5
    beq    LF5F6                 ; 2³
    jsr    LFBDA                 ; 6
    bcs    LF5A0                 ; 2³
    lda    $81                   ; 3
    cmp    #$70                  ; 2
    bcs    LF5A0                 ; 2³
    lda    $94                   ; 3
    beq    LF612                 ; 2³+1
    dec    $94                   ; 5
    bne    LF5A0                 ; 2³
    jsr    LFE4F                 ; 6
    sty    $B7                   ; 3
    lda    $C8                   ; 3
    ldx    $DC                   ; 3
    stx    $90                   ; 3
    bne    LF5E0                 ; 2³
    sbc    #5                    ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LF5E0:
    adc    #6                    ; 2
    sta    $C9                   ; 3
    lda    #$24                  ; 2
    sta    $91                   ; 3
    ldy    #4                    ; 2
    jsr    LFD9C                 ; 6
;    ldy    #6                    ; 2   save bytes
    jsr    MFA55 ; LFA57                 ; 6
    ldy    #$90                  ; 2
    bne    LF615                 ; 3+1   always branch

LF5F6:
    clc                          ; 2
    lda    $DA                   ; 3
    bne    LF5FC                 ; 2³
    sec                          ; 2
LF5FC:
    jsr    LFBF8                 ; 6
LF5FF:
    lda    $81                   ; 3
    cmp    #$10                  ; 2
    bcs    LF5A7                 ; 2³+1
    ldy    $C8                   ; 3
    cpy    #$47                  ; 2
    bcc    LF5A7                 ; 2³+1
    cpy    #$BA                  ; 2
    bcs    LF5A7                 ; 2³+1
    asl                          ; 2
    sta    $D1                   ; 3
LF612:
    jsr    LFE45                 ; 6
LF615:
    sty    $A6                   ; 3
    ldy    #0                    ; 2
    lda    $C8                   ; 3
    cmp    $CA                   ; 3
    bcs    LF621                 ; 2³
    ldy    #8                    ; 2
LF621:
    sty    $DC                   ; 3
    lda    #3                    ; 2
    sta    $94                   ; 3
    bne    LF63A                 ; 3   always branch

LF629:
    jsr    LFC61                 ; 6
    tay                          ; 2
    lsr                          ; 2
    ldx    $94                   ; 3
    bmi    LF65B                 ; 2³
    beq    LF6AA                 ; 2³
    dec    $94                   ; 5
LF636:
    lda    #1                    ; 2
    sta    $D1                   ; 3
LF63A:
    jmp    LF98D                 ; 3

LF63D:
    tya                          ; 2
    lsr                          ; 2
    bcc    LF64E                 ; 2³
    jsr    LFD2E                 ; 6
    bcc    LF63A                 ; 2³
    lda    $C8                   ; 3
    cmp    #$50                  ; 2
    bcc    LF654                 ; 2³
    bcs    LF636                 ; 3   always branch

LF64E:
    lda    $C8                   ; 3
    cmp    #$A0                  ; 2
    bcc    LF636                 ; 2³
LF654:
    lda    $D1                   ; 3
    bne    LF636                 ; 2³
    jmp    LF78A                 ; 3

LF65B:
    lda    $81                   ; 3
    cmp    LFE72,Y               ; 4
    bcs    LF63D                 ; 2³
    ldx    #6                    ; 2
    tya                          ; 2
    lsr                          ; 2
    bcs    LF679                 ; 2³
    jsr    LFBDA                 ; 6
    bcs    LF63D                 ; 2³
    stx    $94                   ; 3
    ldx    #9                    ; 2
    jsr    LFE45                 ; 6
    bcc    LF69F                 ; 2³
    inx                          ; 2
    bcs    LF69F                 ; 3   always branch

LF679:
    asl                          ; 2
    asl                          ; 2
    sta    $F7                   ; 3
    lda    $CA                   ; 3
    sec                          ; 2
    sbc    $C8                   ; 3
    cmp    #$0F                  ; 2
    bcs    LF63D                 ; 2³
    stx    $94                   ; 3
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    adc    $F7                   ; 3
    tay                          ; 2
    ldx    LFE79,Y               ; 4
    cpy    #$0A                  ; 2
    ldy    #$D2                  ; 2
    bcs    LF6A1                 ; 2³
    cmp    #2                    ; 2
    bcc    LF6A1                 ; 2³
    .byte $2C ; BIT opcode, skip 2 bytes
LF69D:
    ldx    #7                    ; 2
LF69F:
    ldy    #$CC                  ; 2
LF6A1:
    sty    $B2                   ; 3
    ldy    #2                    ; 2
    jsr    LFD65                 ; 6
    bcs    LF636                 ; 3   always branch

LF6AA:
    stx    $C3                   ; 3
    dec    $94                   ; 5
    bcs    LF69D                 ; 2³
    ldy    #1                    ; 2
    ldx    #$24                  ; 2
    lsr                          ; 2
    bcc    LF6BA                 ; 2³
    iny                          ; 2
    ldx    #$14                  ; 2
LF6BA:
    stx    $91                   ; 3
    lda    $81                   ; 3
    lsr                          ; 2
    lda    #0                    ; 2
    ror                          ; 2
    sta    $90                   ; 3
    jsr    LFD9C                 ; 6
    lda    $C8                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $C9                   ; 3
    jsr    LFE4F                 ; 6
    sty    $B7                   ; 3
    beq    LF6DC                 ; 2³
    lda    #$40                  ; 2
    cpx    #$24                  ; 2
    bne    LF6DC                 ; 2³
    asl                          ; 2
LF6DC:
    ora    $90                   ; 3
    sta    $90                   ; 3
;    ldy    #6                    ; 2   save bytes
    jsr    MFA55 ; LFA57                 ; 6
    bne    LF69D                 ; 2³
LF6E7:
    jsr    LFC61                 ; 6
    ldy    $86                   ; 3
    lsr                          ; 2
    bcc    LF6F5                 ; 2³
    cpy    #$0A                  ; 2
    bcs    LF6F9                 ; 2³
    bcc    LF715                 ; 3+1   always branch

LF75A:
    dec    $A3                   ; 5
    dec    $A3                   ; 5
    lda    $A3                   ; 3
    cmp    #$11                  ; 2
    bcs    LF76E                 ; 2³
    lda    #0                    ; 2
    ldy    #$16                  ; 2
    sty    $90                   ; 3
    ldx    #$A0                  ; 2
    bne    LF782                 ; 3   always branch

LF715:
    lda    $B6                   ; 3
    cmp    #1                    ; 2
    bne    LF78A                 ; 2³
    lda    $A3                   ; 3
    cmp    #$11                  ; 2
    bcs    LF744                 ; 2³
    sec                          ; 2
    bit    $DF                   ; 3
    bmi    LF72D                 ; 2³
    lda    $CA                   ; 3
    sbc    $C8                   ; 3
    jmp    LF731                 ; 3

LF72D:
    lda    $C8                   ; 3
    sbc    $CA                   ; 3
LF731:
    cmp    #$E9                  ; 2
    bcc    LF78A                 ; 2³
    lda    $81                   ; 3
    ldy    $85                   ; 3
    ldx    $9F,Y                 ; 4
    cmp    LFE6D,X               ; 4
    bcs    LF78A                 ; 2³
    inc    $A3                   ; 5
    bne    LF757                 ; 2³
LF744:
    jsr    LFC7F                 ; 6
    bit    $90                   ; 3
    bmi    LF75A                 ; 2³
    inc    $A3                   ; 5
    inc    $A3                   ; 5
    lda    $A3                   ; 3
    cmp    #$30                  ; 2
    bcc    LF76E                 ; 2³
    ror    $90                   ; 5
LF757:
    jmp    LF98D                 ; 3



LF76E:
    ldy    #$0F                  ; 2
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF757                 ; 2³
    ldx    #$47                  ; 2
    lda    #$2A                  ; 2
    cmp    $A6                   ; 3
    bne    LF782                 ; 2³
    lda    #$39                  ; 2
    ldx    #$52                  ; 2
LF782:
    stx    $B2                   ; 3
    sta    $A6                   ; 3
    sty    $B4                   ; 3
    bne    LF757                 ; 3   always branch

LF6F5:
    cpy    #3                    ; 2
    bcs    LF715                 ; 2³+1
LF6F9:
    lda    $CC                   ; 3
    beq    LF715                 ; 2³+1
    lda    #$80                  ; 2
    bit    $DF                   ; 3
    bcc    LF706                 ; 2³
    bne    LF715                 ; 2³
    .byte $2C ; BIT opcode, skip 2 bytes
LF706:
    beq    LF715                 ; 2³
    eor    $DF                   ; 3
    sta    $DF                   ; 3
    lda    $DC                   ; 3
    eor    #$08                  ; 2
    sta    $DC                   ; 3
;    jmp    LF78A                 ; 3

LF78A:
    jsr    LFC7F                 ; 6
    jsr    LFC67                 ; 6
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF7AA                 ; 2³
    ldy    $B6                   ; 3
    cpy    #3                    ; 2
    bcc    LF79E                 ; 2³
    ldy    #0                    ; 2
LF79E:
    lda    LFEC4,Y               ; 4
    cmp    $A6                   ; 3
    bne    LF7A8                 ; 2³
    lda    LFF83,Y               ; 4
LF7A8:
    sta    $A6                   ; 3
LF7AA:
    jmp    LF98D                 ; 3

;LF7AD:
;    jmp    LF841                 ; 3

LF7B0:
    jmp    LF8E4                 ; 3

LF7B3:
    ldx    $94                   ; 3
    ldy    $A3                   ; 3
    and    #$07                  ; 2
    beq    LF7B0                 ; 2³
    cmp    #2                    ; 2
    bcs    LF841 ; LF7AD                 ; 2³   removal of LDY #8 below made this branch possible, too many bytes in-between before
    cpy    #$40                  ; 2
    bcc    LF7CE                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    sta    $D1                   ; 3
    dec    $A3                   ; 5
    dec    $A3                   ; 5
    bne    MF7FE ; MF861 ; LF830                 ; 2³+1
LF7CE:
    lda    $A6                   ; 3
    cmp    #$49                  ; 2
    bne    LF801                 ; 2³+1
    dec    $D1                   ; 5
    bne    LF7E0                 ; 2³
;    ldy    #8                    ; 2   moved to routine
    jsr    MFA51 ; LFA57                 ; 6
    jmp    LF80B                 ; 3

LF7E0:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcs    MF861 ; LF830                 ; 2³+1
    ldx    $87                   ; 3
    inx                          ; 2
    cpx    #4                    ; 2
    bcc    LF7EE                 ; 2³
    ldx    #0                    ; 2
LF7EE:
    stx    $87                   ; 3
    tya                          ; 2
    clc                          ; 2
    adc    LFF46,X               ; 4
    sta    $A3                   ; 3
    lda    $C8                   ; 3
    clc                          ; 2
    adc    LFF45,X               ; 4
    sta    $C8                   ; 3
MF7FE:
    bne    MF861 ; LF830                 ; 2³
LF801:
    cpx    #4                    ; 2
    bcs    LF823                 ; 2³
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    MF861 ; LF830                 ; 2³
LF80B:
    txa                          ; 2
    clc                          ; 2
    adc    #$13                  ; 2
    tax                          ; 2
    jsr    LFDC8                 ; 6
    lda    #$61                  ; 2
    sta    $B2                   ; 3
    inc    $94                   ; 5
    cpx    #$15                  ; 2
    bne    MF861 ; LF830                 ; 2³
    lda    $81                   ; 3
    asl                          ; 2
    jsr    LFBF8                 ; 6
LF823:
    dec    $A3                   ; 5
    dec    $A3                   ; 5
    lda    $A3                   ; 3
    cmp    #2                    ; 2
;    bcs    LF833                 ; 2³
    bcc    MF85E ; LF82D


;moved to save bytes
LF833:
    jsr    LFC79                 ; 6
    jsr    LFC67                 ; 6
    lda    $C8                   ; 3
    cmp    #$31                  ; 2
    bne    MF861 ; LF830                 ; 2³
    beq    MF85E ; LF82D                 ; 3   always branch


;LF82D:
;    jsr    LFC1F                 ; 6
;LF830:
;    jmp    LF98D                 ; 3



LF841:
    cmp    #3                    ; 2
    beq    LF899                 ; 2³
    cpy    #$10                  ; 2
    bcc    LF84F                 ; 2³
    dec    $A3                   ; 5
    dec    $A3                   ; 5
    bne    MF861 ; LF896                 ; 2³
LF84F:
    cpx    #4                    ; 2
    bcc    LF876                 ; 2³
    jsr    LFC79                 ; 6
    jsr    LFC67                 ; 6
    lda    $C8                   ; 3
    cmp    #$31                  ; 2
    bne    LF864                 ; 2³
MF85E:
    jsr    LFC1F                 ; 6
;    beq    LF896                 ; 3   always branch
MF861:
    jmp    LF98D


LF864:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    MF861 ; LF896                 ; 2³
    lda    #$CB                  ; 2
    cmp    $A6                   ; 3
    bne    LF872                 ; 2³
    lda    #$BF                  ; 2
LF872:
    sta    $A6                   ; 3
    bne    MF861 ; LF896                 ; 2³
LF876:
    cpx    #1                    ; 2
    bne    LF87F                 ; 2³
    ldy    #4                    ; 2
    jsr    LFA57                 ; 6
LF87F:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    MF861 ; LF896                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    #$17                  ; 2
    tax                          ; 2
    jsr    LFDC8                 ; 6
    inc    $94                   ; 5
    cpx    #$19                  ; 2
    bne    MF861 ; LF896                 ; 2³
    jsr    LFBEF                 ; 6
;LF896:
;    jmp    LF98D                 ; 3
    beq    MF861  ; always branch

LF899:
    cpx    #3                    ; 2
    bcs    LF8AE                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF8AB                 ; 2³
    inc    $94                   ; 5
    txa                          ; 2
    adc    #$0A                  ; 2
    jsr    LFDB4                 ; 6
LF8AB:
    jmp    LF98D                 ; 3

LF8AE:
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LF8B6                 ; 2³
    jsr    LFC7F                 ; 6
LF8B6:
    ldx    $A3                   ; 3
    lda    $81                   ; 3
    cmp    #$30                  ; 2
    bcs    LF8D2                 ; 2³
    lda    frameCounter          ; 3
    and    #$40                  ; 2
    beq    LF8CC                 ; 2³
    cpx    #$3F                  ; 2
    bcs    LF8D2                 ; 2³
    inc    $A3                   ; 5
    bne    LF8D2                 ; 2³
LF8CC:
    cpx    #$11                  ; 2
    bcc    LF8D2                 ; 2³
    dec    $A3                   ; 5
LF8D2:
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF8AB                 ; 2³
    ldx    #$F7                  ; 2
    cpx    $A6                   ; 3
    bne    LF8E0                 ; 2³
    ldx    #$E9                  ; 2
LF8E0:
    stx    $A6                   ; 3
    bne    LF8AB                 ; 3   always branch

LF8E4:
    cpy    #$0E                  ; 2
    bcc    LF8F7                 ; 2³
    lda    $C4                   ; 3
    beq    LF8F7                 ; 2³
    lda    #$40                  ; 2
    sta    $87                   ; 3
    dec    $A3                   ; 5
    dec    $A3                   ; 5
LF8F4:
    jmp    LF98D                 ; 3

LF8F7:
    cpx    #6                    ; 2
    beq    LF950                 ; 2³+1
    txa                          ; 2
    bne    LF907                 ; 2³+1
    bit    $DF                   ; 3
    bmi    LF907                 ; 2³
;    ldy    #8                    ; 2
    jsr    MFA51 ; LFA57                 ; 6
LF907:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF8F4                 ; 2³+1
    txa                          ; 2
    clc                          ; 2
    adc    #$0D                  ; 2
    tax                          ; 2
    jsr    LFDC3                 ; 6

    lda    #$BC                  ; 2
    sta    $B2                   ; 3
    lda    #2                    ; 2
    sta    $C4                   ; 3

    ldy    #0                    ; 2
    lda    $CA                   ; 3
    cmp    $C8                   ; 3
    bcc    LF927                 ; 2³
    ldy    #8                    ; 2
LF927:
    sty    $DC                   ; 3
    lda    #$0D                  ; 2
    sta    $A3                   ; 3
    bit    $DF                   ; 3
    bpl    LF934                 ; 2³
    dec    $94                   ; 5
    .byte $2C ; BIT opcode, skip 2 bytes
LF934:
    inc    $94                   ; 5
    lda    $94                   ; 3
    cmp    #$FE                  ; 2
    beq    LF98A                 ; 2³
    cmp    #6                    ; 2
    bne    LF98D                 ; 2³

    lda    #$9A                  ; 2
    sta    $B2                   ; 3
    lda    #0                    ; 2
    sta    $C4                   ; 3
    lda    #$2F                  ; 2
    sta    $A3                   ; 3
    lda    #3                    ; 2
    sta    $B4                   ; 3

LF950:
    dec    $87                   ; 5
    beq    LF980                 ; 2³
    ldy    #$67                  ; 2
    lda    $87                   ; 3
    cmp    #5                    ; 2
    bcc    LF97B                 ; 2³    branch if less than 5, but greater than #$FF, negative flag is clear
    cmp    #$20                  ; 2
    bcs    LF98D                 ; 2³
    lda    $C8                   ; 3
    ldy    #1                    ; 2
    ldx    $DC                   ; 3
    beq    LF96D                 ; 2³
    dey                          ; 2
    adc    #4                    ; 2
    bcc    LF970                 ; 2³
LF96D:
    sec                          ; 2
    sbc    #5                    ; 2
LF970:
    sta    $C9                   ; 3
    lda    #$34                  ; 2
    sta    $91                   ; 3
    jsr    LFD9C                 ; 6
    ldy    #$1C                  ; 2   negative flag is clear
LF97B:
    sty    $B7                   ; 3
;    jmp    LF98D                 ; 3
    bpl    LF98D  ; always branch

LF980:
;    lda    #4                    ; 2
;    sta    $94                   ; 3
;    sec                          ; 2
;    ror    $DF                   ; 5
;    jmp    LF98D                 ; 3


    sec
    ror    $DF
    lda    #4
    sta    $94
    bne    LF98D                 ; always branch


LF98A:
    jsr    LFC1F                 ; 6
LF98D:
    lda    $BC                   ; 3
    beq    LF9B0                 ; 2³
    jsr    LFDD3                 ; 6
    lda    $BC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFF49,Y               ; 4
    and    frameCounter          ; 3
    bne    LF9A3                 ; 2³
    jsr    LFDD3                 ; 6
LF9A3:
    ldx    $BC                   ; 3
    cpx    #2                    ; 2
    bcs    LF9B0                 ; 2³
    ldx    #0                    ; 2
    stx    $BC                   ; 3
    jsr    LFD4D                 ; 6
LF9B0:
    jsr    LFBDA                 ; 6
    bcc    LFA28                 ; 2³+1
    ldy    $DE                   ; 3
    bmi    LFA28                 ; 2³+1
    beq    LFA14                 ; 2³+1
    ldx    $C9                   ; 3
    cpy    #6                    ; 2
    bne    LF9CD                 ; 2³
    cpx    #$50                  ; 2
    bcc    LFA25                 ; 2³+1
    lda    $B7                   ; 3
    cmp    #5                    ; 2
    bcs    LF9D5                 ; 2³
    bcc    LFA25                 ; 3+1   always branch

LF9CD:
    cpx    #$5A                  ; 2
    bcc    LF9E2                 ; 2³
    cpx    #$69                  ; 2
    bcs    LF9EE                 ; 2³
LF9D5:
    bit    $90                   ; 3
    bmi    LF9EE                 ; 2³
    bvc    LF9DE                 ; 2³
    inc    $B7                   ; 5
    .byte $2C ; BIT opcode, skip 2 bytes
LF9DE:
    dec    $B7                   ; 5
    bne    LF9EE                 ; 2³
LF9E2:
    lda    #8                    ; 2
    bit    $90                   ; 3
    bne    LF9EE                 ; 2³
    sta    $C2                   ; 3
    eor    $90                   ; 3
    sta    $90                   ; 3
LF9EE:
    cpy    #6                    ; 2
    beq    LFA14                 ; 2³+1
    ldy    #2                    ; 2
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    bne    LFA07                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LFA05                 ; 2³
;    ldy    #6                    ; 2
    jsr    MFA55 ; LFA57                 ; 6
LFA05:
    ldy    #3                    ; 2
LFA07:
    jsr    LFDA0                 ; 6
    bit    CXP1FB                ; 3
    bvc    LFA14                 ; 2³
    lda    $B6                   ; 3
    cmp    #4                    ; 2
    beq    LFA25                 ; 2³
LFA14:
    jsr    LFD18                 ; 6
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LFA20                 ; 2³
    jsr    LFD18                 ; 6
LFA20:
    jsr    LFBDA                 ; 6
    bcs    LFA28                 ; 2³
LFA25:
    jsr    LFBCF                 ; 6
LFA28:
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LFA38                 ; 2³
    lda    #1                    ; 2
    jsr    LFDF9                 ; 6
    bcs    LFA38                 ; 2³
    jsr    LFAAE                 ; 6
LFA38:
    ldy    $B5                   ; 3
    bmi    LFA54                 ; 2³
    dec    $8A                   ; 5
    bne    LFA54                 ; 2³
    sty    $C2                   ; 3
    lda    LFF68,Y               ; 4
    and    #$40                  ; 2
    beq    LFA4F                 ; 2³
    jsr    LFD4D                 ; 6
;    jmp    LFA54                 ; 3
    brk

LFA4F:
    ldx    #1                    ; 2
    jsr    LFD4F                 ; 6
LFA54:
;    jmp    LFFEC                 ; 3    bankswitch
    brk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MFA55 x 3
;LFA57 x 14

;note this doesn't save bytes directly,
;but does allowed some shuffling around that did save some bytes
MFA51 SUBROUTINE
    ldy   #8
    bne   LFA57 ; always branch

;this one does save bytes...
MFA55 SUBROUTINE
    ldy    #6
LFA57 SUBROUTINE
    cpy    $C0                   ; 3
    beq    LFA71                 ; 2³
    lda    $C0                   ; 3
    cmp    #9                    ; 2
    bcc    LFA65                 ; 2³
    cpy    #9                    ; 2
    bne    LFA71                 ; 2³
LFA65:
    sty    $C0                   ; 3
    lda    LFF18,Y               ; 4
    sta    $BE                   ; 3
    lda    LFF22,Y               ; 4
    sta    AUDC0                 ; 3
LFA71:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFA72 x 2
;LFA7F x 1

LFA72 SUBROUTINE
    lda    #$20                  ; 2
    sta    Timer                 ; 3
    asl                          ; 2
    sta    $A2                   ; 3   #$40
    lda    #0                    ; 2
    sta    Timer+1               ; 3
    ldy    #$2A                  ; 2
LFA7F SUBROUTINE
    ldx    #$31                  ; 2
LFA81:
    lda    LFF8A,X               ; 4
    sta    $9B,X                 ; 4   Timer?
    dex                          ; 2
    dey                          ; 2
    bpl    LFA81                 ; 2³
    tya                          ;   A=$FF

    ldx    #$16                  ; 2
;    lda    #$DF                  ; 2   high pointers, can use #$FF instead
LFA8E:
    sta    $E1,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bne    LFA8E                 ; 2³
    jsr    LFC61                 ; 6
    lsr                          ; 2
    lda    #$D1                  ; 2
    bcs    LFAA0                 ; 2³
    ldx    #$0C                  ; 2
    lda    #$31                  ; 2
LFAA0:
    stx    $86                   ; 3
    sta    $CA                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFAA5 x 1
;LFAAE x 1

LFAA5 SUBROUTINE
    lda    $CB                   ; 3
    sec                          ; 2
    sbc    #7                    ; 2
    beq    LFAAE                 ; 2³
    bcs    LFAB8                 ; 2³
LFAAE SUBROUTINE
    ldy    #9                    ; 2
    jsr    LFA57                 ; 6
    lda    #1                    ; 2
    sta    $A2                   ; 3
    lsr                          ; 2
LFAB8:
    sta    $CB                   ; 3
    rts                          ; 6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFABB x 1
;LFABC x 1
;LFAF5 x 1
;LFB32 x 1
;LFB4D x 1
;LFB4E x 1
;LFB92 x 1

LFABB SUBROUTINE
    clc                          ; 2
LFABC SUBROUTINE
    lda    #0                    ; 2
    sta    $DA                   ; 3
    bcs    LFB47 ; LFAE8                 ; 2³
    bit    $BD                   ; 3
    bmi    LFB47 ; LFAE8                 ; 2³
    jsr    LFD24                 ; 6
    bcs    LFAD1                 ; 2³
    jsr    LFC61                 ; 6
    lsr                          ; 2
    bcs    LFB4C                 ; 2³+1
LFAD1:
    lda    $86                   ; 3
    beq    LFAEB                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LFAF5                 ; 2³
    lda    $CA                   ; 3
    cmp    #$3A                  ; 2
    bcs    LFAF1                 ; 2³
    jsr    LFC61                 ; 6
    lsr                          ; 2
    bcc    LFB4C                 ; 2³+1
;    jmp    LFB81                 ; 3
    bcs    LFB81 ; always branch, save 1 byte

;LFAE8:
;    jmp    LFB47                 ; 3

;moved to save 3 bytes
LFB18:
    cpx    #$80                  ; 2
    beq    LFB23                 ; 2³
    lda    $94                   ; 3
    cmp    StartOfData-$77,X ;  LFDF8,X               ; 4
    bcs    LFB2E                 ; 2³
LFB23:
    inc    $C8                   ; 5
    lda    $C8                   ; 3
    cmp    #$D2                  ; 2
    bcc    LFB2E                 ; 2³
    jsr    LFC1F                 ; 6
LFB2E:
    lda    $A2                   ; 3
    bmi    LFB4C                 ; 2³
LFB32 SUBROUTINE
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LFB4C                 ; 2³
    lda    #$B3                  ; 2
    sta    $AE                   ; 3
    ldx    #7                    ; 2
    lda    $A4                   ; 3
    cmp    #$6C                  ; 2
    bne    LFB49                 ; 2³
    ldx    #8                    ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LFB47:
    ldx    $DD                   ; 3
LFB49:
    jmp    LFD63                 ; 3



LFAEB:
    lda    $CA                   ; 3
    cmp    #$83                  ; 2
    bcc    LFAF5                 ; 2³
LFAF1:
    dec    $CA                   ; 5
    bne    LFB2E                 ; 2³+1
LFAF5 SUBROUTINE
    ldx    #1                    ; 2
LFAF7:
    inc    $C6,X                 ; 6
    lda    $C6,X                 ; 4
    cmp    #$D2                  ; 2
    bcc    LFB05                 ; 2³+1
    lda    #$32                  ; 2
    sta    $C6,X                 ; 4
    inc    $86                   ; 5
LFB05:
    dex                          ; 2
    bpl    LFAF7                 ; 2³+1
    ldx    $B6                   ; 3
    bmi    LFB18                 ; 2³
    beq    LFB12                 ; 2³
    cpx    #3                    ; 2
    bcc    LFB2E                 ; 2³
LFB12:
    lda    $D1                   ; 3
    beq    LFB2E                 ; 2³
    bne    LFB23                 ; 3   always branch



LFB4C:
    rts                          ; 6



LFB73:
    cpx    #$C8                  ; 2
    bcs    LFB7B                 ; 2³
LFB77:
    inc    $CA                   ; 5
    bne    LFB2E                 ; 2³
LFB7B:
    jsr    LFC61                 ; 6
    lsr                          ; 2
    bcs    LFB4C ; LFBCE                 ; 2³
LFB81:
    lda    #$80                  ; 2
    sta    $B6                   ; 3
    jsr    LFC1F                 ; 6
    sec                          ; 2
    ror    $A2                   ; 5
    lda    #$30                  ; 2
    sta    $94                   ; 3
    jmp    LFD4D                 ; 3


;moved to save 2 bytes
LFB4D SUBROUTINE
    clc                          ; 2
LFB4E SUBROUTINE
    lda    #8                    ; 2
    sta    $DA                   ; 3
    bcs    LFB47                 ; 2³
    bit    $BD                   ; 3
    bmi    LFB47                 ; 2³
    jsr    LFD24                 ; 6
    bcs    LFB63                 ; 2³
    jsr    LFC61                 ; 6
    lsr                          ; 2
    bcc    LFB4C ; LFBCE                 ; 2³
LFB63:
    ldx    $CA                   ; 3
    lda    $86                   ; 3
    beq    LFB73                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LFB92                 ; 2³
    cpx    #$83                  ; 2
;    bcs    LFB92                 ; 2³
    bcc    LFB77                 ; 2³


LFB92 SUBROUTINE
    ldx    #1                    ; 2
LFB94:
    dec    $C6,X                 ; 6
    lda    $C6,X                 ; 4
    cmp    #$32                  ; 2
    bcs    LFBA2                 ; 2³
    lda    #$D1                  ; 2
    sta    $C6,X                 ; 4
    dec    $86                   ; 5
LFBA2:
    dex                          ; 2
    bpl    LFB94                 ; 2³
    ldx    $B6                   ; 3
    bmi    LFBB5                 ; 2³
    beq    LFBAF                 ; 2³
    cpx    #3                    ; 2
    bcc    LFBCB                 ; 2³
LFBAF:
    lda    $D1                   ; 3
    beq    LFBCB                 ; 2³
    bne    LFBC0                 ; 3   always branch

LFBB5:
    cpx    #$80                  ; 2
    beq    LFBC0                 ; 2³
    lda    $94                   ; 3
    cmp    StartOfData-$77,X ;  LFDF8,X               ; 4
    bcs    LFBCB                 ; 2³
LFBC0:
    dec    $C8                   ; 5
    lda    $C8                   ; 3
    cmp    #$32                  ; 2
    bcs    LFBCB                 ; 2³
    jsr    LFC1F                 ; 6
LFBCB:
    jmp    LFB2E                 ; 3

;LFBCE:
;    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFBDA x 8
;LFBDC x 2

LFBDA SUBROUTINE
    lda    $C9                   ; 3
LFBDC SUBROUTINE
    cmp    #$D1                  ; 2
    bcs    LFBE4                 ; 2³
    cmp    #$32                  ; 2
    bcs    LFBE5                 ; 2³
LFBE4:
    clc                          ; 2
LFBE5:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFC08 x 4

LFC08 SUBROUTINE
    bcc    LFC0F                 ; 2³
    lda    #$D1                  ; 2
    sta    $C8                   ; 3
    .byte $2C ; BIT opcode, skip 2 bytes
LFC0F:
    inc    $C8                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFC12 x 2

LFC12 SUBROUTINE
    jsr    LFBDA                 ; 6
    bcs    LFC1C                 ; 2³
    lda    $81                   ; 3
    and    #$03                  ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LFC1C:
    lda    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFBEF x 2
;LFBF8 x 4

LFBEF SUBROUTINE
    lda    $CA                   ; 3
    cmp    $C8                   ; 3
    bcc    LFBF7                 ; 2³
    clc                          ; 2    switching carry conditions
    .byte $24 ; BIT opcode, skip 1 byte
LFBF7:
    sec                          ; 2
LFBF8 SUBROUTINE
    lda    #0                    ; 2
    bcs    LFC01                 ; 2³+1
    lda    #$80                  ; 2
    ldy    #8                    ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LFC01:
    ldy    #0                    ; 2
    sty    $DC                   ; 3
    sta    $DF                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFBCF x 2
;moved...

LFBCF SUBROUTINE
    lda    #$67                  ; 2
    sta    $B7                   ; 3
    lda    #$31                  ; 2
    sta    $C9                   ; 3
;    sta    $C2                   ; 3
;    rts                          ; 6
    bne    MFC5E     ; always branch

;LFBE6 x 2
;moved...

LFBE6 SUBROUTINE
    bit    $C2                   ; 3
    bvs    LFC60 ; MFC5E ; LFBEE                 ; 2³   BUG FIX!!  my bad
    lda    #$40                  ; 2
;    sta    $C2                   ; 3
;LFBEE:
;    rts                          ; 6
    bne    MFC5E     ; always branch


;LFC1F x 8
;LFC39 x 1
;LFC61 x 14
;LFC67 x 3
;LFC79 x 2
;LFC7F x 3
;LFD0D x 1

LFC1F SUBROUTINE
    lda    #$31                  ; 2
    ldx    #$67                  ; 2
    sta    $C8                   ; 3
    stx    $A3                   ; 3
    ldy    $B6                   ; 3
    cpy    #$80                  ; 2
    bne    LFC31                 ; 2³
    sta    $C9                   ; 3
    stx    $B7                   ; 3
LFC31:
    lda    #0                    ; 2
    sta    $BF                   ; 3
    sta    $87                   ; 3
    beq    LFC46                 ; 3   always branch

LFC39 SUBROUTINE
    lda    #$31                  ; 2
    sta    $C8                   ; 3
    jsr    LFC61                 ; 6
    tay                          ; 2
    lda    $81                   ; 3
    and    LFE8A,Y               ; 4
LFC46:
    sta    $93                   ; 3
    lda    #$40                  ; 2
    sta    $B6                   ; 3
    lda    #$3E                  ; 2
    sta    $AA                   ; 3
    lda    #$DC                  ; 2
    sta    $AB                   ; 3
    lda    #0                    ; 2
    sta    $A2                   ; 3
;    sta    $C1                   ; 3
;    sta    $C2                   ; 3
;    sta    $D1                   ; 3
;    sta    $DF                   ; 3
    sta    $C1
    sta    $D1
    sta    $DF
MFC5E:
    sta    $C2
LFC60:
    rts                          ; 6

LFC61 SUBROUTINE
    ldy    $85                   ; 3
    lda.wy $9F,Y                 ; 4
    rts                          ; 6

LFC67 SUBROUTINE
    lda    $B6                   ; 3
    bne    LFC6E                 ; 2³
    lda    #$1F                  ; 2
    .byte $2C ; BIT opcode, skip 2 bytes
LFC6E:
    lda    $A1                   ; 3
    clc                          ; 2
    adc    $87                   ; 3
    sta    $87                   ; 3
;    bcc    LFC60                 ; 2³
    bcs    LFC7F                 ; 2³
    rts                          ;   changed this to RTS, save a byte

LFC79 SUBROUTINE
    lda    #0                    ; 2
    sta    $BF                   ; 3
    sta    $DB                   ; 3
LFC7F SUBROUTINE
    bit    $DF                   ; 3
    bmi    LFC86                 ; 2³
    dec    $C8                   ; 5
    .byte $2C ; BIT opcode, skip 2 bytes
LFC86:
    inc    $C8                   ; 5
    lda    $C8                   ; 3
    jsr    LFBDC                 ; 6
    bcc    LFC39                 ; 2³
    tay                          ; 2
    ldx    $DB                   ; 3
    beq    LFC60                 ; 2³
    bit    $DF                   ; 3
    clv                          ;     added to save bytes, I think the BIT was intended for negative flag in this case

    bmi    LFCBC                 ; 2³
    cpy    #$C0                  ; 2
    bne    LFCA2                 ; 2³
    lda    LFFBF,X               ; 4
;    jmp    LFCB3                 ; 3
    bvc    LFCB3                 ; always branch

LFCA2:
    cpy    #$B0                  ; 2
    bne    LFCAC                 ; 2³
    lda    LFFC1,X               ; 4
;    jmp    LFCB3                 ; 3
    bvc    LFCB3                 ; always branch


LFCBC:
    cpy    #$42                  ; 2
    bne    LFCC6                 ; 2³
    lda    LFFBB,X               ; 4
;    jmp    LFCE1                 ; 3
    bvc    LFCE1                 ; always branch

LFCC6:
    cpy    #$52                  ; 2
    bne    LFCD0                 ; 2³
    lda    LFFBD,X               ; 4
;    jmp    LFCE1                 ; 3
    bvc    LFCE1                 ; always branch

LFCD0:
    cpy    #$B0                  ; 2
    bne    LFCDA                 ; 2³
    lda    LFFBF,X               ; 4
;    jmp    LFCE1                 ; 3
    bvc    LFCE1                 ; always branch

LFCDA:
    cpy    #$C0                  ; 2
    bne    LFD17                 ; 2³+1
    lda    LFF32,X               ; 4
LFCE1:
    cpy    #$80                  ; 2
    tay                          ; 2
    and    #$03                  ; 2
    bcs    LFCED                 ; 2³
LFCE8:
    cpx    $BF                   ; 3
;    jmp    LFCEF                 ; 3
    bvc    LFCEF                 ; always branch


;moved to save 2 bytes
LFCAC:
    cpy    #$33                  ; 2
    bcs    LFD17                 ; 2³+1
    lda    LFF2F,X               ; 4
LFCB3:
    cpy    #$80                  ; 2
    tay                          ; 2
    and    #$03                  ; 2
    bcs    LFCE8                 ; 2³
;    bcc    LFCED                 ; 3   always branch


LFCED:
    cmp    $BF                   ; 3
LFCEF:
    beq    LFCFF                 ; 2³
    ldx    $BF                   ; 3
    cpy    #$F3                  ; 2
    bne    LFD0D                 ; 2³+1
    cpx    #0                    ; 2
    bne    LFD0D                 ; 2³+1
    lda    #1                    ; 2
    bne    LFD0D                 ; 3+1   always branch

LFCFF:
    cpy    #$11                  ; 2
    bne    LFD17                 ; 2³
    ldx    $BF                   ; 3
    cpx    #1                    ; 2
    bne    LFD17                 ; 2³
    lda    #0                    ; 2
    sta    $DB                   ; 3
LFD0D SUBROUTINE
    sta    $BF                   ; 3
    tya                          ; 2
    and    #$F0                  ; 2
    clc                          ; 2
    adc    $C8                   ; 3
    sta    $C8                   ; 3
LFD17:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD18 x 2

LFD18 SUBROUTINE
    lda    $90                   ; 3
    and    #$08                  ; 2
    beq    LFD21                 ; 2³
    inc    $C9                   ; 5
    rts                          ; 6

LFD21:
    dec    $C9                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD24 x 2
;LFD2E x 2

LFD24 SUBROUTINE
    lda    $B6                   ; 3
    cmp    #3                    ; 2
    bcc    LFD4B                 ; 2³
    cmp    #8                    ; 2
    bcs    LFD4B                 ; 2³
LFD2E SUBROUTINE
    lda    $C8                   ; 3
    sec                          ; 2
    sbc    $CA                   ; 3
    cmp    #9                    ; 2
    bcc    LFD4A                 ; 2³
    ldx    $BF                   ; 3
    lda    $C8                   ; 3
    clc                          ; 2
    adc    LFF87,X               ; 4
    sta    $F8                   ; 3
    lda    $CA                   ; 3
    sec                          ; 2
    sbc    $F8                   ; 3
    cmp    #9                    ; 2
;    bcs    LFD4B                 ; 2³   useless
LFD4A:
    rts                          ; 6

LFD4B:
    sec                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD4D x 4, also jumped to
;LFD4F x 1
;LFD57 x 1
;LFD63 x 2, also jumped t0
;LFD65 x 1

LFD4D SUBROUTINE
    ldx    #5                    ; 2
LFD4F SUBROUTINE
    ldy    #$FF                  ; 2
    sty    $B5                   ; 3
    cpx    #5                    ; 2
    bne    LFD63                 ; 2³
LFD57 SUBROUTINE
    lda    #$B3                  ; 2
    sta    $AE                   ; 3
    lda    #$D1                  ; 2
    sta    $AC                   ; 3
    lda    #$D7                  ; 2
    sta    $B0                   ; 3
LFD63 SUBROUTINE
    ldy    #0                    ; 2
LFD65 SUBROUTINE
    stx    $DD                   ; 3
    lda    LFF3B,X               ; 4
    sta.wy $A4,Y                 ; 5
    lda    LFEE2,X               ; 4
    sta.wy $A5,Y                 ; 5
    cpx    #5                    ; 2
    lda    #$3E                  ; 2
    ldx    #$DC                  ; 2
    bcs    LFD95                 ; 2³
    lda.wy $DA,Y                 ; 4
    beq    LFD82                 ; 2³
    lda    #1                    ; 2
LFD82:
    sta    $FA                   ; 3
    lda    $DD                   ; 3
    asl                          ; 2
    adc    $FA                   ; 3
    tax                          ; 2
    lda    LFF6F,X               ; 4
    sta    $F7                   ; 3
    lda    LFF79,X               ; 4
    tax                          ; 2
    lda    $F7                   ; 3
LFD95:
    sta.wy $A8,Y                 ; 5
    stx    $A9,Y                 ; 4
    sec                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD9C x 3
;LFDA0 x 1

LFD9C SUBROUTINE
    lda    $B6                   ; 3
    sta    $DE                   ; 3
LFDA0 SUBROUTINE
    lda    LFEBF,Y               ; 4
    sta    $F7                   ; 3
    lda    #$FF                  ; 2
    sta    $F8                   ; 3
    ldy    #4                    ; 2
LFDAB:
    lda    ($F7),Y               ; 5
    sta.wy $8B,Y                 ; 5
    dey                          ; 2
    bpl    LFDAB                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFDB4 x 2
;LFDB5 x 4
;LFDC3 x 1
;LFDC8 x 2

LFDB4 SUBROUTINE
    tax                          ; 2
LFDB5 SUBROUTINE
    ldy    LFEFF,X               ; 4
    sty    $B2                   ; 3
    ldy    LFF0C,X               ; 4
    sty    $B3                   ; 3
    ldy    #0                    ; 2
    sty    $D1                   ; 3
LFDC3 SUBROUTINE
    ldy    LFEEC,X               ; 4
    sty    $A7                   ; 3
LFDC8 SUBROUTINE
    ldy    LFEC7,X               ; 4
    sty    $A6                   ; 3
    ldy    LFE8F,X               ; 4
    sty    $B4                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFDD3 x 2

LFDD3 SUBROUTINE
    bit    $84                   ; 3
    bvc    LFDE2                 ; 2³
    dec    $BC                   ; 5
    inc    $A4                   ; 5
    inc    $AC                   ; 5
    inc    $AE                   ; 5
    inc    $B0                   ; 5
    rts                          ; 6

LFDE2:
    inc    $BC                   ; 5
    lda    $BC                   ; 3
    cmp    #$19                  ; 2
    bcc    LFDF0                 ; 2³
    lda    $84                   ; 3
    ora    #$40                  ; 2
    sta    $84                   ; 3
LFDF0:
    dec    $A4                   ; 5
    dec    $AC                   ; 5
    dec    $AE                   ; 5
    dec    $B0                   ; 5
;LFDF8:                                  ; false label
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFDF9 x 2

LFDF9 SUBROUTINE
    sta    $F7                   ; 3
    sed                          ; 2
    sec                          ; 2
    lda    Timer+1               ; 3
    sbc    $F7                   ; 3
    sta    Timer+1               ; 3
    bcs    LFE0D                 ; 2³
    lda    Timer                 ; 3
    sbc    #0                    ; 2
    sta    Timer                 ; 3
    cld                          ; 2
    rts                          ; 6

LFE0D:
    bne    LFE14                 ; 2³
    lda    Timer                 ; 3
    bne    LFE14                 ; 2³
    clc                          ; 2
LFE14:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE16 x 2
;LFE18 x 2

LFE16 SUBROUTINE
    ldx    #1                    ; 2
    txa                          ;    A=1, save 3 bytes
LFE18 SUBROUTINE
    sed                          ; 2
    clc                          ; 2
LFE1A:
    adc    scoreBCD,X            ; 4
    sta    scoreBCD,X            ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LFE1A                 ; 2³
    cld                          ; 2
    bcc    LFE2E                 ; 2³
    stx    scoreBCD              ; 3   X=$FF
    stx    scoreBCD+1            ; 3
    stx    scoreBCD+2            ; 3
    stx    $CF                   ; 3
LFE2E:
    ldx    $85                   ; 3
    lda    scoreBCD              ; 3
    cmp    #7                    ; 2
    bne    LFE44                 ; 2³
    lda    scoreBCD+1            ; 3
    cmp    #$50                  ; 2
    bcc    LFE44                 ; 2³
    lda    $88,X                 ; 4
    bmi    LFE44                 ; 2³
    ror    $88,X                 ; 6
    inc    $9D,X                 ; 6
LFE44:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE45 x 2

LFE45 SUBROUTINE
    lda    frameCounter          ; 3
    asl                          ; 2
    ldy    #0                    ; 2
    bcs    LFE4E                 ; 2³
    ldy    #$24                  ; 2
LFE4E:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE4F x 2

LFE4F SUBROUTINE
    ldy    #$1D                  ; 2
    lda    $A6                   ; 3
    beq    LFE57                 ; 2³
    ldy    #6                    ; 2
LFE57:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE58 x 2

LFE58 SUBROUTINE
    lda    $D2                   ; 3
    beq    LFE6E                 ; 2³
    txa                          ; 2
    eor    #$01                  ; 2
    sta    $85                   ; 3
    ldx    #2                    ; 2
LFE63:
    lda    scoreBCD,X            ; 4   swapping
    ldy    $95,X                 ; 4
    sta    $95,X                 ; 4
    sty    scoreBCD,X            ; 4
    dex                          ; 2
    bpl    LFE63                 ; 2³
LFE6E:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    NOP ; free byte (reserve 1)
    NOP ; free byte (reserve 2)
    NOP ; free byte (reserve 3)

;this is some space filler, when NEWCODE = 0

  IF !NEWCODE

; bytes needed are:   32 + 57 - 5 = 84

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
    NOP ; free byte
    NOP ; free byte  78
    NOP ; free byte
    NOP ; free byte  80
    NOP ; free byte
    NOP ; free byte  82
    NOP ; free byte
    NOP ; free byte  84

    ENDIF


       ORG $2E6F
      RORG $FE6F


StartOfData:
    .byte $05 ; |     X X| $FE6F
    .byte $20 ; |  X     | $FE70
    .byte $30 ; |  XX    | $FE71
LFE72:
    .byte $60 ; | XX     | $FE72
    .byte $10 ; |   X    | $FE73
    .byte $20 ; |  X     | $FE74
    .byte $10 ; |   X    | $FE75
    .byte $10 ; |   X    | $FE76
    .byte $10 ; |   X    | $FE77
    .byte $FF ; |XXXXXXXX| $FE78
LFE79:
    .byte $04 ; |     X  | $FE79
    .byte $04 ; |     X  | $FE7A
    .byte $03 ; |      XX| $FE7B
    .byte $03 ; |      XX| $FE7C
    .byte $03 ; |      XX| $FE7D
    .byte $02 ; |      X | $FE7E
    .byte $02 ; |      X | $FE7F
    .byte $03 ; |      XX| $FE80
    .byte $02 ; |      X | $FE81
    .byte $03 ; |      XX| $FE82
    .byte $04 ; |     X  | $FE83
LFE84:
    .byte $00 ; |        | $FE84
    .byte $02 ; |      X | $FE85
    .byte $03 ; |      XX| $FE86
    .byte $04 ; |     X  | $FE87
    .byte $04 ; |     X  | $FE88
    .byte $02 ; |      X | $FE89
LFE8A:
    .byte $03 ; |      XX| $FE8A
    .byte $3F ; |  XXXXXX| $FE8B
    .byte $1F ; |   XXXXX| $FE8C
    .byte $0F ; |    XXXX| $FE8D
    .byte $07 ; |     XXX| $FE8E
LFE8F:
    .byte $03 ; |      XX| $FE8F
    .byte $16 ; |   X XX | $FE90
    .byte $03 ; |      XX| $FE91
    .byte $0D ; |    XX X| $FE92
    .byte $0D ; |    XX X| $FE93
    .byte $0E ; |    XXX | $FE94
    .byte $1C ; |   XXX  | $FE95
    .byte $0C ; |    XX  | $FE96
    .byte $0D ; |    XX X| $FE97
    .byte $0C ; |    XX  | $FE98
    .byte $04 ; |     X  | $FE99
    .byte $07 ; |     XXX| $FE9A
    .byte $07 ; |     XXX| $FE9B
    .byte $14 ; |   X X  | $FE9C
    .byte $1F ; |   XXXXX| $FE9D
    .byte $26 ; |  X  XX | $FE9E
    .byte $27 ; |  X  XXX| $FE9F
    .byte $27 ; |  X  XXX| $FEA0
    .byte $00 ; |        | $FEA1
    .byte $0C ; |    XX  | $FEA2
    .byte $0D ; |    XX X| $FEA3
    .byte $0C ; |    XX  | $FEA4
    .byte $0B ; |    X XX| $FEA5
    .byte $0B ; |    X XX| $FEA6
    .byte $0A ; |    X X | $FEA7
    .byte $08 ; |    X   | $FEA8
    .byte $0D ; |    XX X| $FEA9
JoyDirectionTab:
    .byte $DF ; |XX XXXXX| $FEAA   P0 down       - squat, or low kick
    .byte $BF ; |X XXXXXX| $FEAB   P0 left       - move left, or high kick left
    .byte $AF ; |X X XXXX| $FEAC   P0 left-up    - punch high left
    .byte $9F ; |X  XXXXX| $FEAD   P0 left-down  - punch low left
    .byte $5F ; | X XXXXX| $FEAE   P0 right-down - punch low right
    .byte $7F ; | XXXXXXX| $FEAF   P0 right      - move right, or high kick right
    .byte $6F ; | XX XXXX| $FEB0   P0 right-up   - punch high right
    .byte $EF ; |XXX XXXX| $FEB1   P0 up         - jump

    .byte $FD ; |XXXXXX X| $FEB2   P1 down       - squat, or low kick
    .byte $FB ; |XXXXX XX| $FEB3   P1 left       - move left, or high kick left
    .byte $FA ; |XXXXX X | $FEB4   P1 left-up    - punch high left
    .byte $F9 ; |XXXXX  X| $FEB5   P1 left-down  - punch low left
    .byte $F5 ; |XXXX X X| $FEB6   P1 right-down - punch low right
    .byte $F7 ; |XXXX XXX| $FEB7   P1 right      - move right, or high kick right
    .byte $F6 ; |XXXX XX | $FEB8   P1 right-up   - punch high right
    .byte $FE ; |XXXXXXX | $FEB9   P1 up         - jump

MFEBA:
    .byte $70 ; | XXX    | $FEBA
    .byte $90 ; |X  X    | $FEBB
    .byte $B0 ; |X XX    | $FEBC
    .byte $D0 ; |XX X    | $FEBD
    .byte $F0 ; |XXXX    | $FEBE
LFEBF:
    .byte $50 ; | X X    | $FEBF
    .byte $55 ; | X X X X| $FEC0
    .byte $5A ; | X XX X | $FEC1
    .byte $5F ; | X XXXXX| $FEC2
    .byte $64 ; | XX  X  | $FEC3
LFEC4:
    .byte $6C ; | XX XX  | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $6C ; | XX XX  | $FEC6
LFEC7:
    .byte $6C ; | XX XX  | $FEC7
    .byte $00 ; |        | $FEC8
    .byte $6C ; | XX XX  | $FEC9
    .byte $72 ; | XXX  X | $FECA
    .byte $49 ; | X  X  X| $FECB
    .byte $94 ; |X  X X  | $FECC
    .byte $42 ; | X    X | $FECD
    .byte $6E ; | XX XXX | $FECE
    .byte $93 ; |X  X  XX| $FECF
    .byte $A0 ; |X X     | $FED0
    .byte $E1 ; |XXX    X| $FED1
    .byte $F0 ; |XXXX    | $FED2
    .byte $F7 ; |XXXX XXX| $FED3
    .byte $5E ; | X XXXX | $FED4
    .byte $23 ; |  X   XX| $FED5
    .byte $06 ; |     XX | $FED6
    .byte $54 ; | X X X  | $FED7
    .byte $CE ; |XX  XXX | $FED8
    .byte $2C ; |  X XX  | $FED9
    .byte $6E ; | XX XXX | $FEDA
    .byte $7A ; | XXXX X | $FEDB
    .byte $87 ; |X    XXX| $FEDC
    .byte $3F ; |  XXXXXX| $FEDD
    .byte $A2 ; |X X   X | $FEDE
    .byte $AD ; |X X XX X| $FEDF
    .byte $B7 ; |X XX XXX| $FEE0
    .byte $CB ; |XX  X XX| $FEE1
LFEE2:
    .byte $DF ; |XX XXXXX| $FEE2
    .byte $DE ; |XX XXXX | $FEE3
    .byte $DC ; |XX XXX  | $FEE4
    .byte $DC ; |XX XXX  | $FEE5
    .byte $DB ; |XX XX XX| $FEE6
    .byte $DA ; |XX XX X | $FEE7
    .byte $DD ; |XX XXX X| $FEE8
    .byte $DA ; |XX XX X | $FEE9
    .byte $DA ; |XX XX X | $FEEA
    .byte $DA ; |XX XX X | $FEEB
LFEEC:
    .byte $DA ; |XX XX X | $FEEC
    .byte $DB ; |XX XX XX| $FEED
    .byte $DA ; |XX XX X | $FEEE
    .byte $D9 ; |XX XX  X| $FEEF
    .byte $DE ; |XX XXXX | $FEF0
    .byte $D9 ; |XX XX  X| $FEF1
    .byte $D9 ; |XX XX  X| $FEF2
    .byte $DE ; |XX XXXX | $FEF3
    .byte $DE ; |XX XXXX | $FEF4
    .byte $DE ; |XX XXXX | $FEF5
    .byte $DA ; |XX XX X | $FEF6
    .byte $DA ; |XX XX X | $FEF7
    .byte $DA ; |XX XX X | $FEF8
    .byte $D9 ; |XX XX  X| $FEF9
    .byte $D9 ; |XX XX  X| $FEFA
    .byte $D8 ; |XX XX   | $FEFB
    .byte $D8 ; |XX XX   | $FEFC
    .byte $DE ; |XX XXXX | $FEFD
    .byte $D8 ; |XX XX   | $FEFE
LFEFF:
    .byte $5C ; | X XXX  | $FEFF
    .byte $A0 ; |X X     | $FF00
    .byte $B1 ; |X XX   X| $FF01
    .byte $E3 ; |XXX   XX| $FF02
    .byte $55 ; | X X X X| $FF03
    .byte $86 ; |X    XX | $FF04
    .byte $C5 ; |XX   X X| $FF05
    .byte $61 ; | XX    X| $FF06
    .byte $61 ; | XX    X| $FF07
    .byte $61 ; | XX    X| $FF08
    .byte $F7 ; |XXXX XXX| $FF09
    .byte $F7 ; |XXXX XXX| $FF0A
    .byte $F7 ; |XXXX XXX| $FF0B
LFF0C:
    .byte $DB ; |XX XX XX| $FF0C
    .byte $DB ; |XX XX XX| $FF0D
    .byte $DB ; |XX XX XX| $FF0E
    .byte $D8 ; |XX XX   | $FF0F
    .byte $DE ; |XX XXXX | $FF10
    .byte $D9 ; |XX XX  X| $FF11
    .byte $DC ; |XX XXX  | $FF12
    .byte $DE ; |XX XXXX | $FF13
    .byte $DE ; |XX XXXX | $FF14
    .byte $DE ; |XX XXXX | $FF15
    .byte $DB ; |XX XX XX| $FF16
    .byte $DB ; |XX XX XX| $FF17
LFF18:
    .byte $DB ; |XX XX XX| $FF18
    .byte $04 ; |     X  | $FF19
    .byte $03 ; |      XX| $FF1A
    .byte $0A ; |    X X | $FF1B
    .byte $09 ; |    X  X| $FF1C
    .byte $07 ; |     XXX| $FF1D
    .byte $06 ; |     XX | $FF1E
    .byte $06 ; |     XX | $FF1F
    .byte $10 ; |   X    | $FF20
    .byte $27 ; |  X  XXX| $FF21
LFF22:
    .byte $27 ; |  X  XXX| $FF22
    .byte $0C ; |    XX  | $FF23
    .byte $0C ; |    XX  | $FF24
    .byte $08 ; |    X   | $FF25
    .byte $04 ; |     X  | $FF26
    .byte $08 ; |    X   | $FF27
    .byte $08 ; |    X   | $FF28
    .byte $0C ; |    XX  | $FF29
    .byte $02 ; |      X | $FF2A
    .byte $0C ; |    XX  | $FF2B
    .byte $0C ; |    XX  | $FF2C
JoystickBlockTab:
    .byte $0F ; |    XXXX| $FF2D
    .byte $F0 ; |XXXX    | $FF2E
LFF2F:
    .byte $00 ; |        | $FF2F
    .byte $10 ; |   X    | $FF30
    .byte $20 ; |  X     | $FF31
LFF32:
    .byte $11 ; |   X   X| $FF32
    .byte $00 ; |        | $FF33
    .byte $00 ; |        | $FF34
    .byte $00 ; |        | $FF35
    .byte $02 ; |      X | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $01 ; |       X| $FF3A
LFF3B:
    .byte $7F ; | XXXXXXX| $FF3B
    .byte $AC ; |X X XX  | $FF3C
    .byte $7E ; | XXXXXX | $FF3D
    .byte $A2 ; |X X   X | $FF3E
    .byte $7F ; | XXXXXXX| $FF3F
    .byte $48 ; | X  X   | $FF40
    .byte $AD ; |X X XX X| $FF41
    .byte $6C ; | XX XX  | $FF42
    .byte $90 ; |X  X    | $FF43
    .byte $24 ; |  X  X  | $FF44
LFF45:
    .byte $00 ; |        | $FF45
LFF46:
    .byte $FE ; |XXXXXXX | $FF46
    .byte $00 ; |        | $FF47
    .byte $02 ; |      X | $FF48
LFF49:
    .byte $00 ; |        | $FF49
    .byte $00 ; |        | $FF4A
    .byte $01 ; |       X| $FF4B
    .byte $01 ; |       X| $FF4C
    .byte $03 ; |      XX| $FF4D
    .byte $03 ; |      XX| $FF4E
    .byte $07 ; |     XXX| $FF4F
    .byte $00 ; |        | $FF50
    .byte $D2 ; |XX X  X | $FF51
    .byte $D2 ; |XX X  X | $FF52
    .byte $D2 ; |XX X  X | $FF53
    .byte $D2 ; |XX X  X | $FF54
    .byte $00 ; |        | $FF55
    .byte $32 ; |  XX  X | $FF56
    .byte $32 ; |  XX  X | $FF57
    .byte $32 ; |  XX  X | $FF58
    .byte $32 ; |  XX  X | $FF59
    .byte $00 ; |        | $FF5A
    .byte $F2 ; |XXXX  X | $FF5B
    .byte $02 ; |      X | $FF5C
    .byte $12 ; |   X  X | $FF5D
    .byte $02 ; |      X | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $12 ; |   X  X | $FF60
    .byte $02 ; |      X | $FF61
    .byte $F2 ; |XXXX  X | $FF62
    .byte $02 ; |      X | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $12 ; |   X  X | $FF66
    .byte $12 ; |   X  X | $FF67
LFF68:
    .byte $00 ; |        | $FF68
    .byte $40 ; | X      | $FF69
    .byte $41 ; | X     X| $FF6A
    .byte $01 ; |       X| $FF6B
    .byte $81 ; |X      X| $FF6C
    .byte $C0 ; |XX      | $FF6D
    .byte $C1 ; |XX     X| $FF6E
LFF6F:
    .byte $5B ; | X XX XX| $FF6F
    .byte $00 ; |        | $FF70
    .byte $36 ; |  XX XX | $FF71
    .byte $89 ; |X   X  X| $FF72
    .byte $DA ; |XX XX X | $FF73
    .byte $5A ; | X XX X | $FF74
    .byte $DC ; |XX XXX  | $FF75
    .byte $12 ; |   X  X | $FF76
    .byte $15 ; |   X X X| $FF77
    .byte $38 ; |  XXX   | $FF78
LFF79:
    .byte $DD ; |XX XXX X| $FF79
    .byte $DC ; |XX XXX  | $FF7A
    .byte $DC ; |XX XXX  | $FF7B
    .byte $DD ; |XX XXX X| $FF7C
    .byte $DC ; |XX XXX  | $FF7D
    .byte $DC ; |XX XXX  | $FF7E
    .byte $DD ; |XX XXX X| $FF7F
    .byte $DC ; |XX XXX  | $FF80
    .byte $DD ; |XX XXX X| $FF81
    .byte $DD ; |XX XXX X| $FF82
LFF83:
    .byte $90 ; |X  X    | $FF83
    .byte $15 ; |   X X X| $FF84
    .byte $90 ; |X  X    | $FF85
    .byte $90 ; |X  X    | $FF86
LFF87:
    .byte $00 ; |        | $FF87
    .byte $10 ; |   X    | $FF88
    .byte $20 ; |  X     | $FF89
LFF8A:
    .byte $20 ; |  X     | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $03 ; |      XX| $FF8C
    .byte $03 ; |      XX| $FF8D
    .byte $01 ; |       X| $FF8E
    .byte $01 ; |       X| $FF8F
    .byte $1F ; |   XXXXX| $FF90
    .byte $40 ; | X      | $FF91
    .byte $2F ; |  X XXXX| $FF92
    .byte $6C ; | XX XX  | $FF93
    .byte $DA ; |XX XX X | $FF94
    .byte $6C ; | XX XX  | $FF95
    .byte $DA ; |XX XX X | $FF96
    .byte $3E ; |  XXXXX | $FF97
    .byte $DC ; |XX XXX  | $FF98
    .byte $3E ; |  XXXXX | $FF99
    .byte $DC ; |XX XXX  | $FF9A
    .byte $D1 ; |XX X   X| $FF9B
    .byte $DD ; |XX XXX X| $FF9C
    .byte $B3 ; |X XX  XX| $FF9D
    .byte $DA ; |XX XX X | $FF9E
    .byte $D7 ; |XX X XXX| $FF9F
    .byte $DA ; |XX XX X | $FFA0
    .byte $B1 ; |X XX   X| $FFA1
    .byte $DB ; |XX XX XX| $FFA2
    .byte $03 ; |      XX| $FFA3
    .byte $FF ; |XXXXXXXX| $FFA4
    .byte $40 ; | X      | $FFA5
    .byte $67 ; | XX  XXX| $FFA6
    .byte $0B ; |    X XX| $FFA7
    .byte $0B ; |    X XX| $FFA8
    .byte $FF ; |XXXXXXXX| $FFA9
    .byte $FB ; |XXXXX XX| $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $00 ; |        | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $02 ; |      X | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $BF ; |X XXXXXX| $FFB5
    .byte $5F ; | X XXXXX| $FFB6
    .byte $31 ; |  XX   X| $FFB7
    .byte $31 ; |  XX   X| $FFB8
    .byte $31 ; |  XX   X| $FFB9
    .byte $27 ; |  X  XXX| $FFBA
LFFBB:
    .byte $27 ; |  X  XXX| $FFBB
    .byte $F1 ; |XXXX   X| $FFBC
LFFBD:
    .byte $00 ; |        | $FFBD
    .byte $F3 ; |XXXX  XX| $FFBE
LFFBF:
    .byte $E2 ; |XXX   X | $FFBF
    .byte $01 ; |       X| $FFC0
LFFC1:
    .byte $00 ; |        | $FFC1
    .byte $01 ; |       X| $FFC2
LFFC3:
    .byte $02 ; |      X | $FFC3
    .byte $03 ; |      XX| $FFC4
    .byte $03 ; |      XX| $FFC5
    .byte $01 ; |       X| $FFC6
    .byte $01 ; |       X| $FFC7
LFFC8:
    .byte $01 ; |       X| $FFC8
    .byte $80 ; |X       | $FFC9
    .byte $80 ; |X       | $FFCA
    .byte $81 ; |X      X| $FFCB
    .byte $41 ; | X     X| $FFCC
    .byte $40 ; | X      | $FFCD
    .byte $40 ; | X      | $FFCE
    .byte $02 ; |      X | $FFCF
LFFD0:
    .byte $00 ; |        | $FFD0
    .byte $01 ; |       X| $FFD1
    .byte $02 ; |      X | $FFD2
    .byte $02 ; |      X | $FFD3
LFFD4:
    .byte $05 ; |     X X| $FFD4
    .byte $08 ; |    X   | $FFD5
    .byte $02 ; |      X | $FFD6
    .byte $03 ; |      XX| $FFD7
    .byte $01 ; |       X| $FFD8
    .byte $02 ; |      X | $FFD9
    .byte $20 ; |  X     | $FFDA
    .byte $20 ; |  X     | $FFDB
    .byte $30 ; |  XX    | $FFDC
    .byte $30 ; |  XX    | $FFDD
    .byte $30 ; |  XX    | $FFDE
    .byte $30 ; |  XX    | $FFDF
    .byte $50 ; | X X    | $FFE0
    .byte $50 ; | X X    | $FFE1
    .byte $81 ; |X      X| $FFE2
    .byte $81 ; |X      X| $FFE3
    .byte $20 ; |  X     | $FFE4
    .byte $20 ; |  X     | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $03 ; |      XX| $FFE8
    .byte $02 ; |      X | $FFE9
    .byte $05 ; |     X X| $FFEA
    .byte $06 ; |     XX | $FFEB

LFFEC:
    bit    BANK_0                ; 4

;doesn't seem to be used... space filler
;LFFEF:
;    jmp    $DFEF                 ; 3
;    nop                          ; 2
;    nop                          ; 2
;    nop                          ; 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;instead of going to LFA54, save 16 bytes
;takes 16-19 cycles longer then before...(old way was two nested jumps = 6 cycles)

BreakCode SUBROUTINE
    pla            ; 4   reset stack pointer, accumulator gets reloaded before ever used
    pla            ; 4
    pla            ; 4
    jmp   LFFEC    ; 3   bankswitch, goto LD00C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    jmp    LF02D                 ; 3

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

       ORG $2FFC
      RORG $FFFC

    .word START_Bank1
    .word BreakCode ; START_Bank1