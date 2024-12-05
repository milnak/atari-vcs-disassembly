; Rough Disassembly of Dancing Plate (Puzzy) PAL
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcDPpuz.cfg DPpuz.bin > DancingPlate(re)Puzzy.asm
;
; DPpuz.cfg contents:
;
;      ORG 7000
;      CODE 7000 75F7
;      GFX 75F8 7615
;      CODE 7616 7940
;      DATA 7941 7C7F
;      GFX 7C80 7CE7
;      DATA 7CE8 7CFF
;      GFX 7D00 7DE7
;      DATA 7DE8 7DFF
;      GFX 7E00 7EE3
;      DATA 7EE4 7EFF
;      GFX 7F00 7F7B
;      DATA 7F7C 7FFB
;      GFX 7FFC 7FFF

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
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXP0FB  =  $02
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; only one on at a time!
; 0 = off, 1 = on

PUZZY        = 1
BITCORP      = 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $7000

START:
    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
L7005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    L7005                 ; 2³

    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    jsr    L78B3                 ; 6
L7013:
    jsr    L791A                 ; 6
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $84                   ; 3
    cmp    #$88                  ; 2
    bcs    L7057                 ; 2³
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    L7062                 ; 2³
    ldx    $85                   ; 3
    inx                          ; 2
    cpx    #9                    ; 2
    bcc    L7032                 ; 2³
    ldx    #1                    ; 2
L7032:
    stx    $85                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $87                   ; 3
    sta    $88                   ; 3
    sta    $89                   ; 3
    sta    $8A                   ; 3
    sta    $8C                   ; 3
    sta    $8E                   ; 3
    sta    $90                   ; 3
    sta    $92                   ; 3
    lda    $85                   ; 3
    jsr    L77CE                 ; 6
    sta    $94                   ; 3
    lda    #$88                  ; 2
    sta    $84                   ; 3
    bne    L708D                 ; 3   always branch

L7057:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    L7062                 ; 2³
    lda    #$80                  ; 2
    sta    $84                   ; 3
L7062:
    lda    $84                   ; 3
    bne    L708D                 ; 2³
    jsr    L7538                 ; 6
    dec    $82                   ; 5
    bpl    L708D                 ; 2³
    ldx    $83                   ; 3
    bne    L7073                 ; 2³
    ldx    #$60                  ; 2
L7073:
    dex                          ; 2
    lda    $80                   ; 3
    sta    $82                   ; 3
    lda    #2                    ; 2
    sta    AUDV1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    L7D88,X               ; 4
    sta    AUDF1                 ; 3
    bne    L708B                 ; 2³
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
L708B:
    stx    $83                   ; 3
L708D:
    lda    $E8                   ; 3
    and    #$01                  ; 2
    beq    L7100                 ; 2³+1
    lda    #4                    ; 2
    ldx    #0                    ; 2
    jsr    L78F0                 ; 6
    lda    #$42                  ; 2
    ldx    #1                    ; 2
    jsr    L78F0                 ; 6
    lda    #9                    ; 2
    ldx    #2                    ; 2
    jsr    L78F0                 ; 6
    lda    #$47                  ; 2
    ldx    #3                    ; 2
    jsr    L78F0                 ; 6
    lda    $B6                   ; 3
    sta    $D4                   ; 3
    jsr    L70F6                 ; 6
    sta    $E9                   ; 3
    lda    $AA                   ; 3
    sta    $D6                   ; 3
    jsr    L70F6                 ; 6
    sta    $EA                   ; 3
    lda    $9E                   ; 3
    sta    $D8                   ; 3
    lda    $A7                   ; 3
    sta    $DA                   ; 3
    beq    L70CF                 ; 2³
    cmp    $9E                   ; 3
    bcc    L70D1                 ; 2³
L70CF:
    lda    $9E                   ; 3
L70D1:
    jsr    L70F6                 ; 6
    sta    $EB                   ; 3
    lda    $B3                   ; 3
    sta    $DC                   ; 3
    jsr    L70F6                 ; 6
    sta    $EC                   ; 3
    lda    $B7                   ; 3
    sta    $DE                   ; 3
    lda    $AB                   ; 3
    sta    $E0                   ; 3
    lda    $9F                   ; 3
    sta    $E2                   ; 3
    lda    $A8                   ; 3
    sta    $E4                   ; 3
    lda    $B4                   ; 3
    sta    $E6                   ; 3
    jmp    L7161                 ; 3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L70F6 SUBROUTINE
    sta    $D3                   ; 3
    lsr                          ; 2
    adc    $D3                   ; 3
    adc    #$1C                  ; 2
    ora    #$0A                  ; 2
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7100:
    lda    #$13                  ; 2
    ldx    #0                    ; 2
    jsr    L78F0                 ; 6
    lda    #$50                  ; 2
    ldx    #1                    ; 2
    jsr    L78F0                 ; 6
    lda    #$18                  ; 2
    ldx    #2                    ; 2
    jsr    L78F0                 ; 6
    lda    #$55                  ; 2
    ldx    #3                    ; 2
    jsr    L78F0                 ; 6
    lda    $B0                   ; 3
    sta    $D4                   ; 3
    jsr    L70F6                 ; 6
    sta    $E9                   ; 3
    lda    $A4                   ; 3
    sta    $D6                   ; 3
    jsr    L70F6                 ; 6
    sta    $EA                   ; 3
    lda    $A1                   ; 3
    sta    $D8                   ; 3
    jsr    L70F6                 ; 6
    sta    $EB                   ; 3
    lda    $AD                   ; 3
    sta    $DA                   ; 3
    lda    $B9                   ; 3
    sta    $DC                   ; 3
    beq    L7145                 ; 2³
    cmp    $AD                   ; 3
    bcc    L7148                 ; 2³
L7145:
    lda.w  $AD                   ; 4
L7148:
    jsr    L70F6                 ; 6
    sta    $EC                   ; 3
    lda    $B1                   ; 3
    sta    $DE                   ; 3
    lda    $A5                   ; 3
    sta    $E0                   ; 3
    lda    $A2                   ; 3
    sta    $E2                   ; 3
    lda    $AE                   ; 3
    sta    $E4                   ; 3
    lda    $BA                   ; 3
    sta    $E6                   ; 3
L7161:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #2                    ; 2
    sta    NUSIZ0                ; 3
    lda    #6                    ; 2
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
L7171:
    lda    INTIM                 ; 4
    bne    L7171                 ; 2³
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    ldx    #$19                  ; 2
L717C:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L7C9A,X               ; 4
    sta    PF0                   ; 3
    lda    L7C80,X               ; 4
    sta    COLUPF                ; 3
    lda    L7CB4,X               ; 4
    sta    PF1                   ; 3
    lda    L7CCE,X               ; 4
    sta    PF2                   ; 3
    cpx    #$11                  ; 2
    bcs    L71A0                 ; 2³
    lda    #$62                  ; 2
    cpx    #$0B                  ; 2
    bcs    L719E                 ; 2³
    lda    #$A0                  ; 2
L719E:
    sta    COLUBK                ; 3
L71A0:
    dex                          ; 2
    bpl    L717C                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    CTRLPF                ; 3
    ldx    #$1C                  ; 2
L71B1:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L71B1                 ; 2³
    ldy    #7                    ; 2
    ldx    #$68                  ; 2
    lda    $E8                   ; 3
    and    #$01                  ; 2
    beq    L71EF                 ; 2³
L71C0:
    lda    $E9                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    lda    ($D8),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($D4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($D6),Y               ; 5
    sta    GRP0                  ; 3
    lda    $EA                   ; 3
    sta    COLUP0                ; 3
    lda    $EB                   ; 3
    sta    COLUP1                ; 3
    lda    ($DA),Y               ; 5
    sta.w  GRP1                  ; 4
    nop                          ; 2
    lda    ($DC),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EC                   ; 3
    sta    COLUP1                ; 3
    dey                          ; 2
    bpl    L71C0                 ; 2³
    ldy    #7                    ; 2
    bpl    L7226                 ; 3+1   always branch

L71EF:
    ldx    #9                    ; 2
L71F1:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    L71F1                 ; 2³
    ldx    #$5E                  ; 2
L71F8:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($D8),Y               ; 5
    sta    GRP1                  ; 3
    lda    $E9                   ; 3
    sta    COLUP0                ; 3
    lda    ($D4),Y               ; 5
    sta    GRP0                  ; 3
    nop                          ; 2
    lda    ($D6),Y               ; 5
    sta    GRP0                  ; 3
    lda    $EA                   ; 3
    sta    COLUP0                ; 3
    lda    $EB                   ; 3
    sta    COLUP1                ; 3
    lda    ($DA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $EC                   ; 3
    sta    COLUP1                ; 3
    lda    ($DC),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    L71F8                 ; 2³+1
    ldy    #7                    ; 2
L7224:
    sta    WSYNC                 ; 3
;---------------------------------------
L7226:
    lda    #$D2                  ; 2
    sta    COLUP0                ; 3
    sta.w  COLUP1                ; 4
    lda    ($DE),Y               ; 5
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    nop                          ; 2
    lda    ($E0),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E2),Y               ; 5
    sta    GRP1                  ; 3
    dex                          ; 2
    nop                          ; 2
    lda    ($E4),Y               ; 5
    sta.w  GRP1                  ; 4
    lda    ($E6),Y               ; 5
    sta.w  GRP1                  ; 4
    dey                          ; 2
    bpl    L7224                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    CXCLR                 ; 3
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    sty    $CF                   ; 3
    lda    $97                   ; 3
    sta    REFP0                 ; 3
    lda    #$0C                  ; 2
    sta    $D0                   ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
    lda    #$78                  ; 2
    sta    COLUPF                ; 3
    lda    #5                    ; 2
    sta    TIM64T                ; 4
    lda    $CA                   ; 3
    stx    $D1                   ; 3
    ldx    #0                    ; 2
    jsr    L78F0                 ; 6
    ldx    $D1                   ; 3
L727C:
    lda    INTIM                 ; 4
    bne    L727C                 ; 2³
L7281:
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    sta    $D2                   ; 3
    ldy    $D0                   ; 3
    bmi    L72AE                 ; 2³
    lda.wy $BC,Y                 ; 4
    sta    $D2                   ; 3
    lda.wy $BB,Y                 ; 4
    cmp    #$90                  ; 2
    bcc    L7298                 ; 2³
    dex                          ; 2
L7298:
    stx    $D1                   ; 3
    ldx    #4                    ; 2
    jsr    L78F0                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $D1                   ; 3
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dec    $D0                   ; 5
    dec    $D0                   ; 5
    dec    $D0                   ; 5
L72AE:
    dex                          ; 2
    beq    L72EB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    cpx    #$15                  ; 2
    bcs    L72D7                 ; 2³
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    NUSIZ0                ; 3
    txa                          ; 2
    tay                          ; 2
    lda    ($CB),Y               ; 5
    sta    GRP0                  ; 3
    lda    #$88                  ; 2
    cpx    #$10                  ; 2
    bcs    L72D5                 ; 2³
    lda    #$BC                  ; 2
    cpx    #8                    ; 2
    bcs    L72D5                 ; 2³
    lda    #$88                  ; 2
L72D5:
    sta    COLUP0                ; 3
L72D7:
    lda    $CF                   ; 3
    dec    $CF                   ; 5
    beq    L7281                 ; 2³
    cpx    $D2                   ; 3
    bne    L72E9                 ; 2³
    lda    #8                    ; 2
    sta    $CF                   ; 3
    lda    #$FF                  ; 2
    sta    ENABL                 ; 3
L72E9:
    bne    L72AE                 ; 3   always branch

L72EB:
    stx    ENABL                 ; 3
    stx    GRP0                  ; 3
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    lda    #$28                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$10                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    ldy    #4                    ; 2
    ldx    $86                   ; 3   test the number of lives
    beq    L731C                 ; 2³  - branch if zero (if you are dead)
    cpx    #8                    ; 2   otherwise compare to eight lives
    bcc    L730E                 ; 2³  - branch if less then eight lives
    ldx    #8                    ; 2   otherwise cap the limit to eight lives
;=======================================

  IF PUZZY
  
;In the Puzzy version the Lives Display disappears if you get more than 8 lives.
;However you don't die, as that is triggered in another part of the code. Once
;the score rolls over another 10,000 your Lives Display shows one life, and if
;a block hits the ground on that one life you legitimately die.
  
    sta    $86                   ; 3   this should have been STX.
    
  ELSE BITCORP
  
    stx    $86                   ; 3   the Bit Corp version fixes this bad glitch
    
  ENDIF
  
;=======================================
L730E:
    sec                          ; 2
    ror                          ; 2
    ror                          ; 2
    dex                          ; 2
    beq    L731C                 ; 2³
    dey                          ; 2
    bne    L730E                 ; 2³
    tay                          ; 2
    lda    #0                    ; 2
    beq    L7321                 ; 3   always branch

L731C:
    tay                          ; 2
    lda    #0                    ; 2
    beq    L7327                 ; 3   always branch

L7321:
    sec                          ; 2
    rol                          ; 2
    rol                          ; 2
    dex                          ; 2
    bne    L7321                 ; 2³
L7327:
    tax                          ; 2
    lda    #6                    ; 2
    sta    $D3                   ; 3
L732C:
    sta    WSYNC                 ; 3
;---------------------------------------
    dec.w  $D3                   ; 6
    beq    L7350                 ; 2³
    lda    #0                    ; 2
    sta.w  PF0                   ; 4
    sty.w  PF1                   ; 4
    stx.w  PF2                   ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta.w  PF1                   ; 4
    sta.w  PF2                   ; 4
    jmp    L732C                 ; 3

L7350:
    sta    WSYNC                 ; 3
;---------------------------------------
L7352:
    lda    INTIM                 ; 4
    bne    L7352                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    L77D5                 ; 6
    lda    #$20                  ; 2
    ldx    #0                    ; 2
    jsr    L78F0                 ; 6
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$28                  ; 2
    ldx    #1                    ; 2
    jsr    L78F0                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$0C                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
;=======================================
  IF PUZZY
;skips the top line of logo
    ldx    #7                    ; 2   causes the "thin" appearance to the top of the Z's in PUZZY, this looks unintended as other Puzzy games have logos that are full height
  ELSE BITCORP
;Bit Corp rom fixes it
    ldx    #8                    ; 2   the full logo height is needed or the top of the Bit Corp logo would be cut off too
  ENDIF
;=======================================
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    
L7390:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    L7F58,X               ; 4   draw logo
    sta    GRP0                  ; 3
    lda    L7F61,X               ; 4
    sta    GRP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    L7F73,X               ; 4
    tay                          ; 2
    lda    L7F6A,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    HMCLR                 ; 3
    dex                          ; 2
    bpl    L7390                 ; 2³
    
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    inc    $E8                   ; 5
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    beq    L73F4                 ; 2³
    lda    $84                   ; 3
    bne    L742E                 ; 2³+1
    jsr    L74AB                 ; 6
    jsr    L785D                 ; 6
    lda    $E8                   ; 3
    and    #$01                  ; 2
    beq    L73D8                 ; 2³
    jsr    L7643                 ; 6
    jsr    L7616                 ; 6
    jmp    L7013                 ; 3

L73D8:
    lda    $E8                   ; 3
    and    #$07                  ; 2
    bne    L73E4                 ; 2³
    jsr    L776B                 ; 6
    jmp    L7013                 ; 3

L73E4:
    cmp    #2                    ; 2
    bne    L73EE                 ; 2³
    jsr    L788E                 ; 6
    jmp    L7013                 ; 3

L73EE:
    jsr    L7616                 ; 6
    jmp    L7013                 ; 3

L73F4:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    L742B                 ; 2³+1
    jsr    L749A                 ; 6
    lda    #$99                  ; 2
    sta    $87                   ; 3
    sta    $88                   ; 3
    lda    #$90                  ; 2
    sta    $89                   ; 3
    jsr    L776B                 ; 6
    lda    #4                    ; 2   start with 4 lives
    sta    $86                   ; 3
    lda    #$A0                  ; 2
    sta    $9D                   ; 3
    lda    #$80                  ; 2
    sta    $9E                   ; 3
    lda    #$30                  ; 2
    sta    $9F                   ; 3
    lda    #1                    ; 2
    sta    $82                   ; 3
    lda    #0                    ; 2
    sta    $83                   ; 3
    lda    #8                    ; 2
    sta    $80                   ; 3
    lda    #$48                  ; 2
    sta    $84                   ; 3
L742B:
    jmp    L7013                 ; 3

L742E:
    cmp    #1                    ; 2
    beq    L7439                 ; 2³
    cmp    #$48                  ; 2
    beq    L7451                 ; 2³
    jmp    L7013                 ; 3

L7439:
    lda    #0                    ; 2
    sta    $84                   ; 3
    dec    $86                   ; 5   take away one life
    beq    L7444                 ; 2³  - branch if no lives left
    jmp    L7013                 ; 3

L7444:
    lda    #$40                  ; 2
    sta    $84                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    jmp    L7013                 ; 3

L7451:
    lda    #$7F                  ; 2
    sta    $CB                   ; 3
    lda    #$40                  ; 2
    sta    $CA                   ; 3
    lda    $85                   ; 3
    cmp    #3                    ; 2
    bcc    L746B                 ; 2³
    cmp    #5                    ; 2
    bcc    L746F                 ; 2³
    cmp    #8                    ; 2
    bcc    L7473                 ; 2³
    ldx    #7                    ; 2
    bne    L7485                 ; 3   always branch

L746B:
    ldx    #4                    ; 2
    bne    L7475                 ; 3   always branch

L746F:
    ldx    #5                    ; 2
    bne    L7475                 ; 3   always branch

L7473:
    ldx    #6                    ; 2
L7475:
    cmp    #7                    ; 2
    beq    L748D                 ; 2³
    cmp    #6                    ; 2
    beq    L7485                 ; 2³
    cmp    #5                    ; 2
    beq    L7489                 ; 2³
    and    #$01                  ; 2
    beq    L748D                 ; 2³
L7485:
    lda    #$1A                  ; 2
    bne    L748F                 ; 3   always branch

L7489:
    lda    #$17                  ; 2
    bne    L748F                 ; 3   always branch

L748D:
    lda    #$1D                  ; 2
L748F:
    sta    $81                   ; 3
    stx    $9C                   ; 3
    lda    #0                    ; 2
    sta    $84                   ; 3
    jmp    L7013                 ; 3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L749A SUBROUTINE
    lda    #0                    ; 2
    ldx    #$1D                  ; 2
L749E:
    sta    $9D,X                 ; 4
    dex                          ; 2
    bpl    L749E                 ; 2³
    ldx    #$0E                  ; 2
L74A5:
    sta    $BB,X                 ; 4
    dex                          ; 2
    bpl    L74A5                 ; 2³
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L74AB SUBROUTINE
    lda    $82                   ; 3
    bne    L74CE                 ; 2³
    lda    $83                   ; 3
    bne    L74CE                 ; 2³
    ldx    #0                    ; 2
L74B5:
    lda    $9F,X                 ; 4
    beq    L74C2                 ; 2³
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    $81                   ; 3
    bcs    L74CE                 ; 2³
    bcc    L74B5                 ; 3   always branch

L74C2:
    lda    #$FF                  ; 2
    sta    $9D,X                 ; 4
    lda    #$80                  ; 2
    sta    $9E,X                 ; 4
    lda    #$30                  ; 2
    sta    $9F,X                 ; 4
L74CE:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;middle of a long subroutine,
;starts at L7538 below
    
L74CF:
    sec                          ; 2
    lda    $9D,X                 ; 4
    sbc    $9C                   ; 3
    sta    $9D,X                 ; 4
    bcs    L74DF                 ; 2³
    lda    #$40                  ; 2
    sta    $9E,X                 ; 4
    jmp    L7537                 ; 3

L74DF:
    lda    $9E,X                 ; 4
    cmp    #$68                  ; 2
    beq    L74F7                 ; 2³
    cmp    #$60                  ; 2
    beq    L74FD                 ; 2³
    cmp    #$58                  ; 2
    beq    L7503                 ; 2³+1
    cmp    #$50                  ; 2
    beq    L7509                 ; 2³+1
    ldy    #$68                  ; 2
    lda    #$68                  ; 2
    bne    L7532                 ; 3+1  always branch

L74F7:
    ldy    #$60                  ; 2
    lda    #$60                  ; 2
    bne    L7532                 ; 3+1  always branch

L74FD:
    ldy    #$58                  ; 2
    lda    #$58                  ; 2
    bne    L7532                 ; 3   always branch

L7503:
    ldy    #$50                  ; 2
    lda    #$50                  ; 2
    bne    L7532                 ; 3   always branch

L7509:
    ldy    #$48                  ; 2
    lda    #$48                  ; 2
    bne    L7532                 ; 3   always branch

L750F:
    bcc    L74CF                 ; 3+1  always branch

L7511:
    sec                          ; 2
    lda    $9D,X                 ; 4
    sbc    $9C                   ; 3
    sta    $9D,X                 ; 4
    bcs    L7521                 ;
    lda    #$68                  ; 2
    sta    $9E,X                 ; 4
    jmp    L7537                 ; 3

L7521:
    lda.wx $9E,X                 ; 4
    cmp    #$78                  ; 2
    beq    L752E                 ; 2³
    ldy    #$68                  ; 2
    lda    #$78                  ; 2
    bne    L7532                 ; 3   always branch

L752E:
    ldy    #$70                  ; 2
    lda    #$70                  ; 2
L7532:
    sta    $9E,X                 ; 4
    tya                          ; 2
    sta    $9F,X                 ; 4
L7537:
    rts                          ; 6


L7538 SUBROUTINE
    ldx    $9B                   ; 3
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L7541                 ; 2³
    ldx    #$1B                  ; 2
L7541:
    stx    $9B                   ; 3
    lda    $9F,X                 ; 4
    beq    L7537                 ; 2³
    cmp    #8                    ; 2
    beq    L7537                 ; 2³
    lda    $9E,X                 ; 4
    cmp    #$48                  ; 2
    bcc    L7570                 ; 2³
    cmp    #$70                  ; 2
    bcc    L750F                 ; 2³
    cmp    #$80                  ; 2
    bcc    L7511                 ; 2³
    sec                          ; 2
    lda    $9D,X                 ; 4
    sbc    $9C                   ; 3
    sta    $9D,X                 ; 4
    bcs    L7567                 ; 2³
    lda    #$78                  ; 2
    sta    $9E,X                 ; 4
    rts                          ; 6

L7567:
    lda    #$80                  ; 2
    sta    $9E,X                 ; 4
    lda    #$30                  ; 2
    sta    $9F,X                 ; 4
    rts                          ; 6

L7570:
    sec                          ; 2
    lda    $9D,X                 ; 4
    sbc    $9C                   ; 3
    bcc    L75BD                 ; 2³
L7577:
    sta    $9D,X                 ; 4
    lda    $9E,X                 ; 4
    cmp    #$40                  ; 2
    beq    L7599                 ; 2³
    cmp    #$38                  ; 2
    beq    L759F                 ; 2³
    cmp    #$30                  ; 2
    beq    L75A5                 ; 2³
    cmp    #$28                  ; 2
    beq    L75AB                 ; 2³
    cmp    #$20                  ; 2
    beq    L75B1                 ; 2³
    cmp    #$18                  ; 2
    beq    L75B7                 ; 2³
    ldy    #$40                  ; 2
    lda    #$40                  ; 2
    beq    L7532                 ; 2   never branch... potential bug
L7599:
    ldy    #$38                  ; 2
    lda    #$38                  ; 2
L759D:
    bne    L7532                 ; 3   always branch

L759F:
    ldy    #$30                  ; 2
    lda    #$30                  ; 2
    bne    L7532                 ; 3   always branch

L75A5:
    ldy    #$28                  ; 2
    lda    #$28                  ; 2
    bne    L7532                 ; 3   always branch

L75AB:
    ldy    #$20                  ; 2
    lda    #$20                  ; 2
    bne    L7532                 ; 3   always branch

L75B1:
    ldy    #$18                  ; 2
    lda    #$18                  ; 2
    bne    L759D                 ; 3   always branch

L75B7:
    ldy    #$10                  ; 2
    lda    #$10                  ; 2
    bne    L759D                 ; 3   always branch

L75BD:
    ldy    #$56                  ; 2
    lda    $9B                   ; 3
    and    #$01                  ; 2
    beq    L75C7                 ; 2³
    ldy    #$4D                  ; 2
L75C7:
    tya                          ; 2
    sec                          ; 2
    sbc    #$0C                  ; 2
    cmp.w  $C8                   ; 4
    bcs    L75D4                 ; 2³
L75D0:
    lda    #4                    ; 2
    bne    L7577                 ; 3   always branch

L75D4:
    lda.w  $BC                   ; 4
    bne    L75D0                 ; 2³
    ldx    #0                    ; 2
L75DB:
    lda    $BE,X                 ; 4
    sta    $BB,X                 ; 4
    inx                          ; 2
    cpx    #$0C                  ; 2
    bne    L75DB                 ; 2³
    ldx    $9B                   ; 3
    sty    $C8                   ; 3
    stx    $C9                   ; 3
    lda    L75FA,X               ; 4
    sta    $C7                   ; 3
    lda    #8                    ; 2
    sta    $9E,X                 ; 4
    lda    #8                    ; 2
    sta    $9F,X                 ; 4
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;data used by the L7538 and L7643 SUBROUTINES

L75F8:
    .byte $40 ; | X      | $75F8
L75F9:
    .byte $44 ; | X   X  | $75F9
L75FA:
    .byte $42 ; | X    X | $75FA
    .byte $4E ; | X  XXX | $75FB
    .byte $52 ; | X X  X | $75FC
    .byte $50 ; | X X    | $75FD
    .byte $32 ; |  XX  X | $75FE
    .byte $36 ; |  XX XX | $75FF
    .byte $34 ; |  XX X  | $7600
    .byte $60 ; | XX     | $7601
    .byte $64 ; | XX  X  | $7602
    .byte $62 ; | XX   X | $7603
    .byte $22 ; |  X   X | $7604
    .byte $26 ; |  X  XX | $7605
    .byte $24 ; |  X  X  | $7606
    .byte $6E ; | XX XXX | $7607
    .byte $72 ; | XXX  X | $7608
    .byte $70 ; | XXX    | $7609
    .byte $12 ; |   X  X | $760A
    .byte $16 ; |   X XX | $760B
    .byte $14 ; |   X X  | $760C
    .byte $80 ; |X       | $760D
    .byte $84 ; |X    X  | $760E
    .byte $82 ; |X     X | $760F
    .byte $02 ; |      X | $7610
    .byte $06 ; |     XX | $7611
    .byte $04 ; |     X  | $7612
    .byte $8E ; |X   XXX | $7613
    .byte $92 ; |X  X  X | $7614
    .byte $90 ; |X  X    | $7615

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
L7616 SUBROUTINE
    ldx    #$0D                  ; 2
L7618:
    lda    $BB,X                 ; 4
    beq    L763D                 ; 2³
    cmp    #$11                  ; 2
    bcs    L763B                 ; 2³
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDV0                 ; 3
    lda    #1                    ; 2
    sta    $84                   ; 3
    sta    $BB,X                 ; 4
    lda    $BC,X                 ; 4
    stx    $D3                   ; 3
    tax                          ; 2
    lda    #0                    ; 2
    sta    $9E,X                 ; 4
    sta    $9F,X                 ; 4
    ldx    $D3                   ; 3
L763B:
    dec    $BB,X                 ; 6
L763D:
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L7618                 ; 2³
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;single long subroutine, has 8 exits (RTS)

L7643 SUBROUTINE
    lda    $9A                   ; 3
    cmp    #7                    ; 2
    bne    L764A                 ; 2³
    rts                          ; 6

L764A:
    inc    $99                   ; 5
    jsr    L7736                 ; 6
    ldx    $CA                   ; 3
    lda    SWCHA                 ; 4
    asl                          ; 2
    bcs    L7698                 ; 2³
    lda    #0                    ; 2
    sta    $97                   ; 3
    inx                          ; 2
L765C:
    lda    $CB                   ; 3
    cmp    #$BB                  ; 2
    beq    L7692                 ; 2³
    cmp    #$CF                  ; 2
    beq    L7692                 ; 2³
    lda    $99                   ; 3
    and    #$01                  ; 2
    bne    L768C                 ; 2³
    lda    $CB                   ; 3
    cmp    #$93                  ; 2
    bne    L7688                 ; 2³
    lda    $98                   ; 3
    bne    L767F                 ; 2³
    lda    #1                    ; 2
    sta    $98                   ; 3
    lda    #$7F                  ; 2
    jmp    L768A                 ; 3

L767F:
    lda    #0                    ; 2
    sta    $98                   ; 3
    lda    #$A7                  ; 2
    jmp    L768A                 ; 3

L7688:
    lda    #$93                  ; 2
L768A:
    sta    $CB                   ; 3
L768C:
    jsr    L7729                 ; 6
L768F:
    jmp    L76A3                 ; 3

L7692:
    jsr    L774D                 ; 6
    jmp    L76A3                 ; 3

L7698:
    asl                          ; 2
    bcs    L768F                 ; 2³
    dex                          ; 2
    lda    #8                    ; 2
    sta    $97                   ; 3
    jmp    L765C                 ; 3

L76A3:
    cpx    #1                    ; 2
    bcc    L76AF                 ; 2³
    cpx    #$98                  ; 2
    bcc    L76B1                 ; 2³
    ldx    #$98                  ; 2
    bne    L76B1                 ; 3   always branch

L76AF:
    ldx    #1                    ; 2
L76B1:
    stx    $CA                   ; 3
    txa                          ; 2
    ldx    #0                    ; 2
L76B6:
    cmp    L75F8,X               ; 4
    bcc    L76C0                 ; 2³
    cmp    L75F9,X               ; 4
    bcc    L76D7                 ; 2³
L76C0:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$1E                  ; 2
    bcc    L76B6                 ; 2³
    lda    $CB                   ; 3
    cmp    #$BB                  ; 2
    beq    L76D2                 ; 2³
    cmp    #$CF                  ; 2
    beq    L76D2                 ; 2³
    rts                          ; 6

L76D2:
    lda    #$93                  ; 2
    sta    $CB                   ; 3
    rts                          ; 6

L76D7:
    lda    $E8                   ; 3
    and    #$08                  ; 2
    beq    L76E2                 ; 2³
    lda    #$BB                  ; 2
    jmp    L76E4                 ; 3

L76E2:
    lda    #$CF                  ; 2
L76E4:
    sta    $CB                   ; 3
    lda.w  INPT4                 ; 4
    and    #$80                  ; 2
    beq    L76EE                 ; 2³
    rts                          ; 6

L76EE:
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #5                    ; 2
    sta    AUDF0                 ; 3
    lda    $E8                   ; 3
    and    #$04                  ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    $9D,X                 ; 4
    adc    #$0A                  ; 2
    sta    $9D,X                 ; 4
    bcc    L7719                 ; 2³
    lda    $9E,X                 ; 4
    beq    L7719                 ; 2³
    cmp    #$48                  ; 2
    bcc    L771A                 ; 2³
    cmp    #$70                  ; 2
    bcc    L771F                 ; 2³
    cmp    #$80                  ; 2
    bcc    L7724                 ; 2³
    lda    #$FF                  ; 2
    sta    $9D,X                 ; 4
L7719:
    rts                          ; 6

L771A:
    lda    #$68                  ; 2
    sta    $9E,X                 ; 4
    rts                          ; 6

L771F:
    lda    #$78                  ; 2
    sta    $9E,X                 ; 4
    rts                          ; 6

L7724:
    lda    #$80                  ; 2
    sta    $9E,X                 ; 4
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7729 SUBROUTINE
    lda    $99                   ; 3
    and    #$07                  ; 2
    cmp    #2                    ; 2
    beq    L7756                 ; 2³  go to 2nd half of subroutine
    cmp    #6                    ; 2
    beq    L775C                 ; 2³  go to 2nd half of subroutine
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L7736 SUBROUTINE
    dec    $96                   ; 5
    dec    $96                   ; 5
    dec    $96                   ; 5
    dec    $96                   ; 5
    dec    $96                   ; 5
    lda    $96                   ; 3
    cmp    #$80                  ; 2
    bcc    L7748                 ; 2³
    lda    #0                    ; 2
L7748:
    sta    AUDV0                 ; 3
    sta    $96                   ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;kill audio

L774D SUBROUTINE
    lda    #0                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDV0                 ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;continued from L7729 SUBROUTINE

L7756:
    lda    #$1A                  ; 2
    sta    AUDF0                 ; 3
    bne    L7760                 ; 3   always branch

L775C:
    lda    #$1B                  ; 2
    sta    AUDF0                 ; 3
L7760:
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lda    #7                    ; 2
    sta    AUDV0                 ; 3
    sta    $96                   ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L776B SUBROUTINE
    clc                          ; 2
    sed                          ; 2
    lda    $89                   ; 3
    adc    #$10                  ; 2
    sta    $89                   ; 3
    lda    $88                   ; 3
    adc    #0                    ; 2
    sta    $88                   ; 3
    lda    $87                   ; 3
    adc    #0                    ; 2
    sta    $87                   ; 3
    cld                          ; 2
    lda    $88                   ; 3
    ora    $89                   ; 3
    bne    L7788                 ; 2³
    inc    $86                   ; 5   increase lives
L7788:
    lda    $87                   ; 3
    beq    L7794                 ; 2³
    lda    #4                    ; 2
    cmp    $9C                   ; 3
    bne    L7794                 ; 2³
    inc    $9C                   ; 5
L7794:
    lda    $87                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $8A                   ; 3
    lda    $87                   ; 3
    and    #$0F                  ; 2
    jsr    L77CE                 ; 6
    sta    $8C                   ; 3
    lda    $88                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $8E                   ; 3
    lda    $88                   ; 3
    and    #$0F                  ; 2
    jsr    L77CE                 ; 6
    sta    $90                   ; 3
    lda    $89                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    $92                   ; 3
    lda    $89                   ; 3
    and    #$0F                  ; 2
    jsr    L77CE                 ; 6
    sta    $94                   ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L77CE SUBROUTINE
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;display the score

L77D5 SUBROUTINE
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    COLUBK                ; 3
    lda    #$18                  ; 2
    ldx    #0                    ; 2
    jsr    L78F0                 ; 6
    lda    #$48                  ; 2
    ldx    #1                    ; 2
    jsr    L78F0                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldy    #7                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$86                  ; 2
    sta    COLUBK                ; 3
    lda    #2                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #0                    ; 2
    lda    $8A                   ; 3
    cmp    #8                    ; 2
    bne    L782F                 ; 2³
    stx    $8A                   ; 3
    lda    $8C                   ; 3
    cmp    #8                    ; 2
    bne    L782F                 ; 2³
    stx    $8C                   ; 3
    lda    $8E                   ; 3
    cmp    #8                    ; 2
    bne    L782F                 ; 2³
    stx    $8E                   ; 3
    lda    $90                   ; 3
    cmp    #8                    ; 2
    bne    L782F                 ; 2³
    stx    $90                   ; 3
    lda    $92                   ; 3
    cmp    #8                    ; 2
    bne    L782F                 ; 2³
    stx    $92                   ; 3
    
;draw score
L782F:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($8A),Y               ; 5
    lda    ($8A),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($90),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($8E),Y               ; 5
    tax                          ; 2
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    nop                          ; 2
    stx    GRP0                  ; 3
    lda    ($92),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($94),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    L782F                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L785D SUBROUTINE
    lda    CXP0FB                ; 3
    and    #$40                  ; 2
    beq    L788D                 ; 2³
    ldx    #0                    ; 2
L7865:
    lda    $BC,X                 ; 4
    bne    L7872                 ; 2³
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$0F                  ; 2
    bcc    L7865                 ; 2³
    bcs    L788D                 ; 3   always branch

L7872:
    stx    $D3                   ; 3
    lda    $BD,X                 ; 4
    tax                          ; 2
    lda    #$80                  ; 2
    sta    $9D,X                 ; 4
    lda    #$68                  ; 2
    sta    $9E,X                 ; 4
    lda    #$68                  ; 2
    sta    $9F,X                 ; 4
    lda    #0                    ; 2
    ldx    $D3                   ; 3
    sta    $BB,X                 ; 4
    sta    $BC,X                 ; 4
    sta    $BD,X                 ; 4
L788D:
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L788E SUBROUTINE
    ldy    #0                    ; 2
    ldx    #$1C                  ; 2
L7892:
    lda    $9D,X                 ; 4
    beq    L789B                 ; 2³
    cmp    #$48                  ; 2
    bcs    L789B                 ; 2³
    iny                          ; 2
L789B:
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    L7892                 ; 2³
    lda    #6                    ; 2
    cpy    #4                    ; 2
    bcc    L78B0                 ; 2³
    cpy    #6                    ; 2
    bcc    L78AE                 ; 2³
    lda    #4                    ; 2
    bne    L78B0                 ; 3   always branch

L78AE:
    lda    #5                    ; 2
L78B0:
    sta    $80                   ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;intialization, note that the high nybble
;pointers all use $Fx instead of $7x.

L78B3 SUBROUTINE
    lda    #$FD                  ; 2
    sta    $D5                   ; 3
    sta    $D7                   ; 3
    sta    $D9                   ; 3
    sta    $DB                   ; 3
    sta    $DD                   ; 3
    lda    #$FE                  ; 2
    sta    $DF                   ; 3
    sta    $E1                   ; 3
    sta    $E3                   ; 3
    sta    $E5                   ; 3
    sta    $E7                   ; 3
    sta    $CC                   ; 3
    lda    #$FF                  ; 2
    sta    $8B                   ; 3
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    sta    $91                   ; 3
    sta    $93                   ; 3
    sta    $95                   ; 3
    lda    #$80                  ; 2
    sta    $84                   ; 3
    lda    #1                    ; 2
    sta    $85                   ; 3
    lda    #$10                  ; 2
    sta    $94                   ; 3
    lda    #$7F                  ; 2
    sta    $CB                   ; 3
    lda    #$40                  ; 2
    sta    $CA                   ; 3
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;horizontal repostioning

L78F0 SUBROUTINE
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta.w  $D3                   ; 4
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc.w  $D3                   ; 4
    cmp    #$0F                  ; 2
    bcc    L790A                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
L790A:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
L7914:
    dey                          ; 2
    bpl    L7914                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;vertical blanking

L791A SUBROUTINE
    lda    INTIM                 ; 4
    bne    L791A                 ; 2³
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    COLUPF                ; 3
;=======================================
  IF PUZZY
    lda    #$41                  ; 2   compensate for the one scanline less scanline in the logo...
  ELSE BITCORP
    lda    #$40                  ; 2   or take away a scanline, ensure scanlines are an even number, keep the PAL TV screen from turning B&W
  ENDIF
;=======================================
    sta    TIM64T                ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      $7941 - $7C7F GARBAGE CODE ONE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$DE
    .byte $29,$EE,$85,$DE,$60,$A5,$DE,$F0,$11,$C9,$80,$B0,$14,$C9,$40,$B0
    .byte $90,$C9,$20,$B0,$65,$C9,$10,$B0,$BF,$60,$A9,$00,$85,$19,$85,$1A
    .byte $60,$29,$08,$F0,$12,$A5,$DE,$29,$F7,$85,$DE,$A9,$04,$85,$DC,$A9
    .byte $0A,$85,$F4,$A9,$FF,$85,$DA,$A9,$08,$85,$15,$A6,$DC,$AD,$DA,$00
    .byte $DD,$DC,$FF,$90,$0E,$CA,$30,$16,$86,$DC,$BD,$DC,$FF,$85,$19,$A9
    .byte $15,$85,$DA,$85,$17,$E6,$DA,$A5,$DE,$29,$37,$4C,$92,$F9,$A5,$F4
    .byte $85,$19,$09,$10,$85,$17,$C6,$F4,$30,$09,$A5,$DE,$29,$33,$85,$DE
    .byte $4C,$92,$F9,$A5,$DE,$29,$77,$4C,$8E,$F9,$29,$02,$F0,$12,$A5,$DE
    .byte $29,$FD,$85,$DE,$A9,$04,$85,$DD,$A9,$0D,$85,$F4,$A9,$FF,$85,$DB
    .byte $A9,$08,$85,$16,$A6,$DD,$AD,$DB,$00,$DD,$E2,$FF,$90,$0E,$CA,$30
    .byte $10,$86,$DD,$BD,$E2,$FF,$85,$1A,$A9,$14,$85,$DB,$85,$18,$E6,$DB
    .byte $60,$A5,$F4,$85,$1A,$09,$10,$85,$18,$C6,$F4,$30,$07,$A5,$DE,$29
    .byte $DD,$85,$DE,$60,$A5,$DE,$29,$11,$4C,$96,$F9,$A9,$48,$A2,$00,$20
    .byte $D5,$FE,$A9,$00,$85,$1B,$85,$1C,$A9,$50,$A2,$01,$20,$D5,$FE,$85
    .byte $02,$85,$2A,$A9,$00,$85,$0D,$85,$0E,$85,$0F,$20,$E3,$FC,$A9,$1C
    .byte $85,$06,$85,$07,$A0,$07,$85,$02,$B1,$85,$85,$1B,$B1,$87,$85,$1C
    .byte $85,$2B,$88,$10,$F1,$60,$A5,$B2,$C9,$07,$D0,$2D,$C6,$8A,$D0,$04
    .byte $A9,$07,$85,$8A,$A5,$E0,$C9,$14,$90,$04,$A9,$20,$D0,$07,$C9,$0A
    .byte $90,$03,$18,$69,$06,$85,$89,$4A,$4A,$4A,$4A,$20,$BB,$FA,$85,$85
    .byte $A5,$89,$29,$0F,$20,$BB,$FA,$85,$87,$60,$0A,$0A,$0A,$18,$69,$08
    .byte $60,$A9,$00,$85,$C4,$85,$C7,$85,$D4,$85,$DE,$A9,$4C,$85,$BC,$A9
    .byte $37,$85,$BD,$20,$F8,$F3,$20,$81,$FE,$A9,$61,$85,$89,$A9,$01,$85
    .byte $8A,$A5,$E8,$C9,$02,$F0,$07,$B0,$0A,$A9,$B1,$4C,$F6,$FA,$A9,$51
    .byte $4C,$F6,$FA,$A9,$01,$85,$E9,$85,$EA,$60,$A9,$28,$A2,$00,$20,$D5
    .byte $FE,$A9,$58,$A2,$01,$20,$D5,$FE,$85,$02,$85,$2A,$A2,$2A,$A5,$E1
    .byte $C9,$02,$90,$02,$A2,$78,$86,$06,$86,$07,$A9,$03,$85,$04,$A9,$01
    .byte $85,$05,$A0,$07,$85,$02,$85,$2B,$B1,$9F,$8D,$1B,$00,$B1,$A5,$85
    .byte $1C,$B1,$A1,$B1,$A1,$B1,$A1,$85,$1B,$B1,$A3,$85,$1B,$EA,$B1,$A7
    .byte $85,$1C,$85,$1C,$88,$D0,$DD,$A9,$00,$85,$1B,$85,$1C,$A5,$E8,$C9
    .byte $02,$F0,$06,$B0,$08,$A9,$86,$D0,$06,$A9,$B8,$D0,$02,$A9,$86,$85
    .byte $07,$60,$A2,$02,$A0,$08,$B5,$81,$29,$F0,$4A,$69,$08,$99,$9F,$00
    .byte $B5,$81,$29,$0F,$20,$BB,$FA,$99,$A1,$00,$A9,$FC,$99,$A0,$00,$99
    .byte $A2,$00,$88,$88,$88,$88,$CA,$10,$DD,$A5,$E1,$C9,$01,$F0,$0C,$A5
    .byte $A5,$85,$9F,$A5,$A7,$85,$A1,$A5,$A9,$85,$A3,$A9,$08,$85,$A5,$85
    .byte $A7,$A2,$00,$A9,$08,$C5,$9F,$D0,$14,$86,$9F,$C5,$A1,$D0,$0E,$86
    .byte $A1,$C5,$A3,$D0,$08,$86,$A3,$C5,$A5,$D0,$02,$86,$A5,$60,$A5,$AC
    .byte $18,$A2,$02,$F8,$7D,$81,$00,$95,$81,$A9,$00,$CA,$D0,$F6,$D8,$A5
    .byte $AD,$18,$A2,$01,$F8,$75,$AE,$95,$AE,$95,$B0,$A9,$00,$CA,$10,$F5
    .byte $D8,$A2,$04,$18,$06,$B1,$26,$B0,$CA,$D0,$F8,$A5,$B0,$85,$81,$A5
    .byte $82,$29,$0F,$05,$B1,$85,$82,$20,$63,$FB,$60,$FF,$FF,$FF,$FF,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$3C,$66,$66,$66,$66,$66,$3C,$00
    .byte $3C,$18,$18,$18,$18,$38,$18,$00,$7E,$60,$60,$3C,$06,$46,$3C,$00
    .byte $3C,$46,$06,$1C,$06,$46,$3C,$00,$0C,$0C,$7E,$6C,$3C,$1C,$0C,$00
    .byte $7C,$06,$06,$7C,$60,$60,$7E,$00,$3C,$66,$66,$7C,$60,$62,$3C,$00
    .byte $18,$18,$18,$0C,$06,$66,$7E,$00,$3C,$66,$66,$3C,$66,$66,$3C,$00
    .byte $3C,$46,$06,$3E,$66,$66,$3C,$00,$00,$00,$CD,$3B,$F7,$3B,$CD,$00
    .byte $00,$00,$B3,$DC,$EF,$DC,$B3,$00,$00,$00,$FF,$6E,$DB,$7E,$99,$00
    .byte $00,$00,$99,$7E,$DB,$6E,$FF,$00,$00,$00,$CD,$36,$FA,$36,$CD

  ELSE BITCORP

    .byte $B5,$9F,$F0,$F0,$C9,$08,$F0,$EC,$B5,$9E,$C9,$48,$90,$1F,$C9,$70
    .byte $90,$BA,$C9,$80,$90,$B8,$38,$B5,$9D,$E5,$9C,$95,$9D,$B0,$05,$A9
    .byte $78,$95,$9E,$60,$A9,$80,$95,$9E,$A9,$30,$95,$9F,$60,$38,$B5,$9D
    .byte $E5,$9C,$90,$46,$95,$9D,$B5,$9E,$C9,$40,$F0,$1A,$C9,$38,$F0,$1C
    .byte $C9,$30,$F0,$1E,$C9,$28,$F0,$20,$C9,$20,$F0,$22,$C9,$18,$F0,$24
    .byte $61,$7F,$85,$1C,$EA,$EA,$EA,$EA,$EA,$BD,$73,$7F,$A8,$BD,$6A,$7F
    .byte $85,$1B,$84,$1C,$85,$2B,$CA,$10,$DF,$A9,$2C,$8D,$96,$02,$E6,$E8
    .byte $AD,$82,$02,$29,$01,$F0,$35,$A5,$84,$D0,$6B,$20,$AB,$74,$20,$5D
    .byte $78,$A5,$E8,$29,$01,$F0,$09,$20,$43,$76,$20,$16,$76,$4C,$13,$70
    .byte $A5,$E8,$29,$07,$D0,$06,$20,$6B,$77,$4C,$13,$70,$C9,$02,$D0,$06
    .byte $20,$8E,$78,$4C,$13,$70,$20,$16,$76,$4C,$13,$70,$AD,$82,$02,$29
    .byte $01,$D0,$30,$20,$9A,$74,$A9,$99,$85,$87,$85,$88,$A9,$90,$85,$89
    .byte $20,$6B,$77,$A9,$04,$85,$86,$A9,$A0,$85,$9D,$A9,$80,$85,$9E,$A9
    .byte $30,$85,$9F,$A9,$01,$85,$82,$A9,$00,$85,$83,$A9,$08,$85,$80,$A9
    .byte $48,$85,$84,$4C,$13,$70,$C9,$01,$F0,$07,$C9,$48,$F0,$1B,$4C,$13
    .byte $70,$A9,$00,$85,$84,$C6,$86,$F0,$03,$00,$13,$70,$A9,$40,$85,$84
    .byte $A9,$00,$85,$19,$85,$1A,$4C,$13,$70,$A9,$7F,$85,$CB,$A9,$40,$85
    .byte $CA,$A5,$85,$C9,$03,$90,$0C,$C9,$05,$90,$0C,$C9,$08,$90,$0C,$A2
    .byte $07,$D0,$1A,$A2,$04,$D0,$06,$A2,$05,$D0,$02,$A2,$06,$C9,$07,$F0
    .byte $14,$C9,$06,$F0,$08,$C9,$05,$F0,$08,$29,$01,$F0,$08,$A9,$1A,$D0
    .byte $06,$A9,$17,$D0,$02,$A9,$1D,$85,$81,$86,$9C,$A9,$00,$85,$84,$4C
    .byte $13,$70,$A9,$00,$A2,$1D,$95,$9D,$CA,$10,$FB,$A2,$0E,$95,$BB,$CA
    .byte $10,$FB,$60,$A5,$82,$D0,$1F,$A5,$83,$D0,$1B,$A2,$00,$B5,$9F,$F0
    .byte $09,$E8,$E8,$E8,$E4,$81,$B0,$0E,$90,$F3,$A9,$FF,$95,$9D,$A9,$80
    .byte $95,$9E,$A9,$30,$95,$9F,$60,$38,$B5,$9D,$E5,$9C,$95,$9D,$B0,$07
    .byte $A9,$40,$95,$9E,$4C,$37,$75,$B5,$9E,$C9,$68,$F0,$12,$C9,$60,$F0
    .byte $14,$C9,$58,$F0,$16,$C9,$50,$F0,$18,$A0,$68,$A9,$68,$D0,$3B,$A0
    .byte $60,$A9,$60,$D0,$35,$A0,$58,$A9,$58,$D0,$2F,$A0,$50,$A9,$50,$D0
    .byte $29,$A0,$48,$A9,$48,$D0,$23,$90,$BE,$38,$B5,$9D,$E5,$9C,$95,$9D
    .byte $B0,$07,$A9,$68,$95,$9E,$4C,$37,$75,$BD,$9E,$00,$C9,$78,$F0,$06
    .byte $A0,$68,$A9,$78,$D0,$04,$A0,$70,$A9,$70,$95,$9E,$98,$95,$9F,$60
    .byte $A6,$9B,$CA,$CA,$CA,$10,$02,$A2,$1B,$86,$9B,$B5,$9F,$F0,$F0,$C9
    .byte $08,$F0,$EC,$B5,$9E,$C9,$48,$90,$1F,$C9,$70,$90,$BA,$C9,$80,$90
    .byte $B8,$38,$B5,$9D,$E5,$9C,$95,$9D,$B0,$05,$A9,$78,$95,$9E,$60,$A9
    .byte $80,$95,$9E,$A9,$30,$95,$9F,$60,$38,$B5,$9D,$E5,$9C,$90,$46,$95
    .byte $9D,$B5,$9E,$C9,$40,$F0,$1A,$C9,$38,$F0,$1C,$C9,$30,$F0,$1E,$C9
    .byte $28,$F0,$20,$C9,$20,$F0,$22,$C9,$18,$F0,$24,$A0,$40,$A9,$40,$F0
    .byte $99,$A0,$38,$A9,$38,$D0,$93,$A0,$30,$A9,$30,$D0,$8D,$A0,$28,$A9
    .byte $28,$D0,$87,$A0,$20,$A9,$20,$D0,$81,$A0,$18,$A9,$18,$D0,$E6,$A0
    .byte $10,$A9,$10,$D0,$E0,$A0,$56,$A5,$9B,$29,$01,$F0,$02,$A0,$4D,$98
    .byte $38,$E9,$0C,$CD,$C8,$00,$B0,$04,$A9,$04,$D0,$A3,$AD,$BC,$00,$D0
    .byte $F7,$A2,$00,$B5,$BE,$95,$BB,$E8,$E0,$0C,$D0,$F7,$A6,$9B,$84,$C8
    .byte $86,$C9,$BD,$FA,$75,$85,$C7,$A9,$08,$95,$9E,$A9,$08,$95,$9F,$60
    .byte $40,$44,$42,$4E,$52,$50,$32,$36,$34,$60,$64,$62,$22,$26,$24,$6E
    .byte $72,$70,$12,$16,$14,$80,$84,$82,$02,$06,$04,$8E,$92,$90,$A2,$0D
    .byte $B5,$BB,$F0,$21,$C9,$11,$B0,$1B,$A9,$08,$85,$15,$85,$17,$85,$19
    .byte $A9,$01,$85,$84,$95,$BB,$B5,$BC,$86,$D3,$AA,$A9,$00,$95,$9E,$95
    .byte $9F,$A6,$D3,$D6,$BB,$CA,$CA,$CA,$10,$D6,$60,$A5,$9A,$C9,$07,$D0
    .byte $01,$60,$E6,$99,$20,$36,$77,$A6,$CA,$AD,$80,$02,$0A,$B0,$41,$A9
    .byte $00,$85,$97,$E8,$A5,$CB,$C9,$BB,$F0,$30,$C9,$CF,$F0,$2C,$A5,$99
    .byte $29,$01,$D0,$20,$A5,$CB,$C9,$93,$D0,$16,$A5,$98,$D0,$09,$A9,$01
    .byte $85,$98,$A9,$7F,$4C,$8A,$76,$A9,$00,$85,$98,$A9,$A7,$4C,$8A

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



       ORG $7C80

L7C80:
    .byte $2C ; |  X XX  | $7C80
    .byte $2C ; |  X XX  | $7C81
    .byte $2B ; |  X X XX| $7C82
    .byte $2B ; |  X X XX| $7C83
    .byte $2B ; |  X X XX| $7C84
    .byte $2B ; |  X X XX| $7C85
    .byte $2A ; |  X X X | $7C86
    .byte $2A ; |  X X X | $7C87
    .byte $2A ; |  X X X | $7C88
    .byte $2A ; |  X X X | $7C89
    .byte $29 ; |  X X  X| $7C8A
    .byte $29 ; |  X X  X| $7C8B
    .byte $29 ; |  X X  X| $7C8C
    .byte $29 ; |  X X  X| $7C8D
    .byte $28 ; |  X X   | $7C8E
    .byte $28 ; |  X X   | $7C8F
    .byte $28 ; |  X X   | $7C90
    .byte $28 ; |  X X   | $7C91
    .byte $27 ; |  X  XXX| $7C92
    .byte $27 ; |  X  XXX| $7C93
    .byte $27 ; |  X  XXX| $7C94
    .byte $26 ; |  X  XX | $7C95
    .byte $26 ; |  X  XX | $7C96
    .byte $26 ; |  X  XX | $7C97
    .byte $25 ; |  X  X X| $7C98
    .byte $25 ; |  X  X X| $7C99
L7C9A:
    .byte $10 ; |   X    | $7C9A
    .byte $10 ; |   X    | $7C9B
    .byte $10 ; |   X    | $7C9C
    .byte $30 ; |  XX    | $7C9D
    .byte $30 ; |  XX    | $7C9E
    .byte $F0 ; |XXXX    | $7C9F
    .byte $FF ; |XXXXXXXX| $7CA0
    .byte $FF ; |XXXXXXXX| $7CA1
    .byte $FF ; |XXXXXXXX| $7CA2
    .byte $FF ; |XXXXXXXX| $7CA3
    .byte $F0 ; |XXXX    | $7CA4
    .byte $10 ; |   X    | $7CA5
    .byte $D0 ; |XX X    | $7CA6
    .byte $50 ; | X X    | $7CA7
    .byte $50 ; | X X    | $7CA8
    .byte $40 ; | X      | $7CA9
    .byte $FF ; |XXXXXXXX| $7CAA
    .byte $FF ; |XXXXXXXX| $7CAB
    .byte $F0 ; |XXXX    | $7CAC
    .byte $70 ; | XXX    | $7CAD
    .byte $30 ; |  XX    | $7CAE
    .byte $30 ; |  XX    | $7CAF
    .byte $F0 ; |XXXX    | $7CB0
    .byte $D0 ; |XX X    | $7CB1
    .byte $70 ; | XXX    | $7CB2
    .byte $F0 ; |XXXX    | $7CB3
L7CB4:
    .byte $00 ; |        | $7CB4
    .byte $00 ; |        | $7CB5
    .byte $00 ; |        | $7CB6
    .byte $02 ; |      X | $7CB7
    .byte $07 ; |     XXX| $7CB8
    .byte $0F ; |    XXXX| $7CB9
    .byte $9F ; |X  XXXXX| $7CBA
    .byte $FF ; |XXXXXXXX| $7CBB
    .byte $FF ; |XXXXXXXX| $7CBC
    .byte $FF ; |XXXXXXXX| $7CBD
    .byte $FF ; |XXXXXXXX| $7CBE
    .byte $10 ; |   X    | $7CBF
    .byte $D6 ; |XX X XX | $7CC0
    .byte $54 ; | X X X  | $7CC1
    .byte $D7 ; |XX X XXX| $7CC2
    .byte $10 ; |   X    | $7CC3
    .byte $FF ; |XXXXXXXX| $7CC4
    .byte $FF ; |XXXXXXXX| $7CC5
    .byte $FF ; |XXXXXXXX| $7CC6
    .byte $0E ; |    XXX | $7CC7
    .byte $07 ; |     XXX| $7CC8
    .byte $02 ; |      X | $7CC9
    .byte $07 ; |     XXX| $7CCA
    .byte $8D ; |X   XX X| $7CCB
    .byte $07 ; |     XXX| $7CCC
    .byte $02 ; |      X | $7CCD
L7CCE:
    .byte $00 ; |        | $7CCE
    .byte $00 ; |        | $7CCF
    .byte $00 ; |        | $7CD0
    .byte $00 ; |        | $7CD1
    .byte $80 ; |X       | $7CD2
    .byte $E1 ; |XXX    X| $7CD3
    .byte $F3 ; |XXXX  XX| $7CD4
    .byte $FF ; |XXXXXXXX| $7CD5
    .byte $FF ; |XXXXXXXX| $7CD6
    .byte $FF ; |XXXXXXXX| $7CD7
    .byte $FF ; |XXXXXXXX| $7CD8
    .byte $81 ; |X      X| $7CD9
    .byte $BD ; |X XXXX X| $7CDA
    .byte $A5 ; |X X  X X| $7CDB
    .byte $B5 ; |X XX X X| $7CDC
    .byte $84 ; |X    X  | $7CDD
    .byte $FF ; |XXXXXXXX| $7CDE
    .byte $FF ; |XXXXXXXX| $7CDF
    .byte $FF ; |XXXXXXXX| $7CE0
    .byte $30 ; |  XX    | $7CE1
    .byte $61 ; | XX    X| $7CE2
    .byte $C0 ; |XX      | $7CE3
    .byte $80 ; |X       | $7CE4
    .byte $01 ; |       X| $7CE5
    .byte $00 ; |        | $7CE6
    .byte $00 ; |        | $7CE7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      $7CE8 - $7CFF GARBAGE CODE TWO
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

  ELSE BITCORP

    .byte $FF,$FF,$95,$9E,$60,$A9,$80,$95,$9E,$A9,$30,$95,$9F,$60,$38,$B5
    .byte $9D,$E5,$9C,$90,$46,$95,$9D,$FF

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



       ORG $7D00

    .byte $00 ; |        | $7D00
    .byte $00 ; |        | $7D01
    .byte $00 ; |        | $7D02
    .byte $00 ; |        | $7D03
    .byte $00 ; |        | $7D04
    .byte $00 ; |        | $7D05
    .byte $00 ; |        | $7D06
    .byte $00 ; |        | $7D07
    .byte $00 ; |        | $7D08
    .byte $00 ; |        | $7D09
    .byte $00 ; |        | $7D0A
    .byte $00 ; |        | $7D0B
    .byte $00 ; |        | $7D0C
    .byte $00 ; |        | $7D0D
    .byte $00 ; |        | $7D0E
    .byte $00 ; |        | $7D0F
    .byte $62 ; | XX   X | $7D10
    .byte $7A ; | XXXX X | $7D11
    .byte $FC ; |XXXXXX  | $7D12
    .byte $FE ; |XXXXXXX | $7D13
    .byte $7F ; | XXXXXXX| $7D14
    .byte $7F ; | XXXXXXX| $7D15
    .byte $3F ; |  XXXXXX| $7D16
    .byte $1E ; |   XXXX | $7D17
    .byte $06 ; |     XX | $7D18
    .byte $1E ; |   XXXX | $7D19
    .byte $3F ; |  XXXXXX| $7D1A
    .byte $7F ; | XXXXXXX| $7D1B
    .byte $FE ; |XXXXXXX | $7D1C
    .byte $FE ; |XXXXXXX | $7D1D
    .byte $FC ; |XXXXXX  | $7D1E
    .byte $78 ; | XXXX   | $7D1F
    .byte $27 ; |  X  XXX| $7D20
    .byte $2F ; |  X XXXX| $7D21
    .byte $2F ; |  X XXXX| $7D22
    .byte $3E ; |  XXXXX | $7D23
    .byte $7C ; | XXXXX  | $7D24
    .byte $FC ; |XXXXXX  | $7D25
    .byte $30 ; |  XX    | $7D26
    .byte $00 ; |        | $7D27
    .byte $47 ; | X   XXX| $7D28
    .byte $4F ; | X  XXXX| $7D29
    .byte $5F ; | X XXXXX| $7D2A
    .byte $7E ; | XXXXXX | $7D2B
    .byte $7E ; | XXXXXX | $7D2C
    .byte $FC ; |XXXXXX  | $7D2D
    .byte $F8 ; |XXXXX   | $7D2E
    .byte $38 ; |  XXX   | $7D2F
    .byte $08 ; |    X   | $7D30
    .byte $3C ; |  XXXX  | $7D31
    .byte $7E ; | XXXXXX | $7D32
    .byte $FF ; |XXXXXXXX| $7D33
    .byte $FF ; |XXXXXXXX| $7D34
    .byte $FF ; |XXXXXXXX| $7D35
    .byte $7E ; | XXXXXX | $7D36
    .byte $3C ; |  XXXX  | $7D37
    .byte $D0 ; |XX X    | $7D38
    .byte $F0 ; |XXXX    | $7D39
    .byte $F8 ; |XXXXX   | $7D3A
    .byte $7E ; | XXXXXX | $7D3B
    .byte $7E ; | XXXXXX | $7D3C
    .byte $3F ; |  XXXXXX| $7D3D
    .byte $1F ; |   XXXXX| $7D3E
    .byte $1C ; |   XXX  | $7D3F
    .byte $E4 ; |XXX  X  | $7D40
    .byte $F4 ; |XXXX X  | $7D41
    .byte $34 ; |  XX X  | $7D42
    .byte $3C ; |  XXXX  | $7D43
    .byte $1E ; |   XXXX | $7D44
    .byte $0F ; |    XXXX| $7D45
    .byte $06 ; |     XX | $7D46
    .byte $00 ; |        | $7D47
    .byte $20 ; |  X     | $7D48
    .byte $38 ; |  XXX   | $7D49
    .byte $7C ; | XXXXX  | $7D4A
    .byte $FE ; |XXXXXXX | $7D4B
    .byte $FF ; |XXXXXXXX| $7D4C
    .byte $7E ; | XXXXXX | $7D4D
    .byte $3C ; |  XXXX  | $7D4E
    .byte $18 ; |   XX   | $7D4F
    .byte $30 ; |  XX    | $7D50
    .byte $20 ; |  X     | $7D51
    .byte $26 ; |  X  XX | $7D52
    .byte $3F ; |  XXXXXX| $7D53
    .byte $3E ; |  XXXXX | $7D54
    .byte $7C ; | XXXXX  | $7D55
    .byte $F0 ; |XXXX    | $7D56
    .byte $00 ; |        | $7D57
    .byte $20 ; |  X     | $7D58
    .byte $28 ; |  X X   | $7D59
    .byte $3F ; |  XXXXXX| $7D5A
    .byte $7E ; | XXXXXX | $7D5B
    .byte $FC ; |XXXXXX  | $7D5C
    .byte $F8 ; |XXXXX   | $7D5D
    .byte $30 ; |  XX    | $7D5E
    .byte $00 ; |        | $7D5F
    .byte $04 ; |     X  | $7D60
    .byte $14 ; |   X X  | $7D61
    .byte $FC ; |XXXXXX  | $7D62
    .byte $7E ; | XXXXXX | $7D63
    .byte $3F ; |  XXXXXX| $7D64
    .byte $1F ; |   XXXXX| $7D65
    .byte $0C ; |    XX  | $7D66
    .byte $00 ; |        | $7D67
    .byte $04 ; |     X  | $7D68
    .byte $04 ; |     X  | $7D69
    .byte $64 ; | XX  X  | $7D6A
    .byte $FC ; |XXXXXX  | $7D6B
    .byte $7C ; | XXXXX  | $7D6C
    .byte $3E ; |  XXXXX | $7D6D
    .byte $0F ; |    XXXX| $7D6E
    .byte $00 ; |        | $7D6F
    .byte $20 ; |  X     | $7D70
    .byte $20 ; |  X     | $7D71
    .byte $23 ; |  X   XX| $7D72
    .byte $26 ; |  X  XX | $7D73
    .byte $3E ; |  XXXXX | $7D74
    .byte $7C ; | XXXXX  | $7D75
    .byte $E0 ; |XXX     | $7D76
    .byte $80 ; |X       | $7D77
    .byte $06 ; |     XX | $7D78
    .byte $06 ; |     XX | $7D79
    .byte $C2 ; |XX    X | $7D7A
    .byte $62 ; | XX   X | $7D7B
    .byte $7E ; | XXXXXX | $7D7C
    .byte $3E ; |  XXXXX | $7D7D
    .byte $07 ; |     XXX| $7D7E
    .byte $01 ; |       X| $7D7F
    .byte $08 ; |    X   | $7D80
    .byte $08 ; |    X   | $7D81
    .byte $08 ; |    X   | $7D82
    .byte $08 ; |    X   | $7D83
    .byte $3C ; |  XXXX  | $7D84
    .byte $FF ; |XXXXXXXX| $7D85
    .byte $00 ; |        | $7D86
    .byte $00 ; |        | $7D87
L7D88:
    .byte $13 ; |   X  XX| $7D88
    .byte $00 ; |        | $7D89
    .byte $13 ; |   X  XX| $7D8A
    .byte $13 ; |   X  XX| $7D8B
    .byte $11 ; |   X   X| $7D8C
    .byte $11 ; |   X   X| $7D8D
    .byte $0F ; |    XXXX| $7D8E
    .byte $0F ; |    XXXX| $7D8F
    .byte $0E ; |    XXX | $7D90
    .byte $0F ; |    XXXX| $7D91
    .byte $11 ; |   X   X| $7D92
    .byte $13 ; |   X  XX| $7D93
    .byte $0F ; |    XXXX| $7D94
    .byte $0C ; |    XX  | $7D95
    .byte $0B ; |    X XX| $7D96
    .byte $0C ; |    XX  | $7D97
    .byte $00 ; |        | $7D98
    .byte $0B ; |    X XX| $7D99
    .byte $0B ; |    X XX| $7D9A
    .byte $0B ; |    X XX| $7D9B
    .byte $00 ; |        | $7D9C
    .byte $0B ; |    X XX| $7D9D
    .byte $00 ; |        | $7D9E
    .byte $0B ; |    X XX| $7D9F
    .byte $13 ; |   X  XX| $7DA0
    .byte $0F ; |    XXXX| $7DA1
    .byte $0C ; |    XX  | $7DA2
    .byte $0C ; |    XX  | $7DA3
    .byte $13 ; |   X  XX| $7DA4
    .byte $0F ; |    XXXX| $7DA5
    .byte $0C ; |    XX  | $7DA6
    .byte $0C ; |    XX  | $7DA7
    .byte $11 ; |   X   X| $7DA8
    .byte $00 ; |        | $7DA9
    .byte $11 ; |   X   X| $7DAA
    .byte $11 ; |   X   X| $7DAB
    .byte $13 ; |   X  XX| $7DAC
    .byte $11 ; |   X   X| $7DAD
    .byte $0F ; |    XXXX| $7DAE
    .byte $0F ; |    XXXX| $7DAF
    .byte $0E ; |    XXX | $7DB0
    .byte $0F ; |    XXXX| $7DB1
    .byte $11 ; |   X   X| $7DB2
    .byte $13 ; |   X  XX| $7DB3
    .byte $0F ; |    XXXX| $7DB4
    .byte $0C ; |    XX  | $7DB5
    .byte $0B ; |    X XX| $7DB6
    .byte $0C ; |    XX  | $7DB7
    .byte $00 ; |        | $7DB8
    .byte $0B ; |    X XX| $7DB9
    .byte $0B ; |    X XX| $7DBA
    .byte $0B ; |    X XX| $7DBB
    .byte $00 ; |        | $7DBC
    .byte $0B ; |    X XX| $7DBD
    .byte $00 ; |        | $7DBE
    .byte $0B ; |    X XX| $7DBF
    .byte $13 ; |   X  XX| $7DC0
    .byte $0F ; |    XXXX| $7DC1
    .byte $0C ; |    XX  | $7DC2
    .byte $0C ; |    XX  | $7DC3
    .byte $13 ; |   X  XX| $7DC4
    .byte $0F ; |    XXXX| $7DC5
    .byte $0C ; |    XX  | $7DC6
    .byte $0C ; |    XX  | $7DC7
    .byte $13 ; |   X  XX| $7DC8
    .byte $00 ; |        | $7DC9
    .byte $13 ; |   X  XX| $7DCA
    .byte $13 ; |   X  XX| $7DCB
    .byte $1A ; |   XX X | $7DCC
    .byte $1A ; |   XX X | $7DCD
    .byte $11 ; |   X   X| $7DCE
    .byte $11 ; |   X   X| $7DCF
    .byte $13 ; |   X  XX| $7DD0
    .byte $13 ; |   X  XX| $7DD1
    .byte $0F ; |    XXXX| $7DD2
    .byte $0F ; |    XXXX| $7DD3
    .byte $0C ; |    XX  | $7DD4
    .byte $0C ; |    XX  | $7DD5
    .byte $0B ; |    X XX| $7DD6
    .byte $0B ; |    X XX| $7DD7
    .byte $00 ; |        | $7DD8
    .byte $1A ; |   XX X | $7DD9
    .byte $13 ; |   X  XX| $7DDA
    .byte $13 ; |   X  XX| $7DDB
    .byte $0F ; |    XXXX| $7DDC
    .byte $0F ; |    XXXX| $7DDD
    .byte $11 ; |   X   X| $7DDE
    .byte $11 ; |   X   X| $7DDF
    .byte $0F ; |    XXXX| $7DE0
    .byte $0F ; |    XXXX| $7DE1
    .byte $0C ; |    XX  | $7DE2
    .byte $0C ; |    XX  | $7DE3
    .byte $09 ; |    X  X| $7DE4
    .byte $09 ; |    X  X| $7DE5
    .byte $0C ; |    XX  | $7DE6
    .byte $0C ; |    XX  | $7DE7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      $7DE8 - $7DFF GARBAGE CODE THREE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

  ELSE BITCORP

    .byte $FF,$FF,$F9,$75,$90,$17,$E8,$E8,$E8,$E0,$1E,$90,$EF,$A5,$CB,$C9
    .byte $BB,$F0,$05,$C9,$CF,$F0,$01,$FF

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



       ORG $7E00

    .byte $08 ; |    X   | $7E00
    .byte $08 ; |    X   | $7E01
    .byte $08 ; |    X   | $7E02
    .byte $08 ; |    X   | $7E03
    .byte $08 ; |    X   | $7E04
    .byte $08 ; |    X   | $7E05
    .byte $08 ; |    X   | $7E06
    .byte $08 ; |    X   | $7E07
    .byte $08 ; |    X   | $7E08
    .byte $08 ; |    X   | $7E09
    .byte $08 ; |    X   | $7E0A
    .byte $08 ; |    X   | $7E0B
    .byte $08 ; |    X   | $7E0C
    .byte $08 ; |    X   | $7E0D
    .byte $08 ; |    X   | $7E0E
    .byte $08 ; |    X   | $7E0F
    .byte $08 ; |    X   | $7E10
    .byte $08 ; |    X   | $7E11
    .byte $08 ; |    X   | $7E12
    .byte $08 ; |    X   | $7E13
    .byte $0C ; |    XX  | $7E14
    .byte $04 ; |     X  | $7E15
    .byte $04 ; |     X  | $7E16
    .byte $06 ; |     XX | $7E17
    .byte $08 ; |    X   | $7E18
    .byte $18 ; |   XX   | $7E19
    .byte $10 ; |   X    | $7E1A
    .byte $10 ; |   X    | $7E1B
    .byte $10 ; |   X    | $7E1C
    .byte $30 ; |  XX    | $7E1D
    .byte $20 ; |  X     | $7E1E
    .byte $20 ; |  X     | $7E1F
    .byte $08 ; |    X   | $7E20
    .byte $08 ; |    X   | $7E21
    .byte $08 ; |    X   | $7E22
    .byte $08 ; |    X   | $7E23
    .byte $08 ; |    X   | $7E24
    .byte $10 ; |   X    | $7E25
    .byte $10 ; |   X    | $7E26
    .byte $10 ; |   X    | $7E27
    .byte $08 ; |    X   | $7E28
    .byte $18 ; |   XX   | $7E29
    .byte $10 ; |   X    | $7E2A
    .byte $30 ; |  XX    | $7E2B
    .byte $20 ; |  X     | $7E2C
    .byte $20 ; |  X     | $7E2D
    .byte $60 ; | XX     | $7E2E
    .byte $40 ; | X      | $7E2F
    .byte $08 ; |    X   | $7E30
    .byte $08 ; |    X   | $7E31
    .byte $08 ; |    X   | $7E32
    .byte $08 ; |    X   | $7E33
    .byte $08 ; |    X   | $7E34
    .byte $08 ; |    X   | $7E35
    .byte $08 ; |    X   | $7E36
    .byte $08 ; |    X   | $7E37
    .byte $08 ; |    X   | $7E38
    .byte $08 ; |    X   | $7E39
    .byte $08 ; |    X   | $7E3A
    .byte $18 ; |   XX   | $7E3B
    .byte $10 ; |   X    | $7E3C
    .byte $10 ; |   X    | $7E3D
    .byte $10 ; |   X    | $7E3E
    .byte $10 ; |   X    | $7E3F
    .byte $08 ; |    X   | $7E40
    .byte $08 ; |    X   | $7E41
    .byte $08 ; |    X   | $7E42
    .byte $08 ; |    X   | $7E43
    .byte $0C ; |    XX  | $7E44
    .byte $0C ; |    XX  | $7E45
    .byte $04 ; |     X  | $7E46
    .byte $04 ; |     X  | $7E47
    .byte $08 ; |    X   | $7E48
    .byte $08 ; |    X   | $7E49
    .byte $18 ; |   XX   | $7E4A
    .byte $10 ; |   X    | $7E4B
    .byte $10 ; |   X    | $7E4C
    .byte $30 ; |  XX    | $7E4D
    .byte $20 ; |  X     | $7E4E
    .byte $20 ; |  X     | $7E4F
    .byte $08 ; |    X   | $7E50
    .byte $08 ; |    X   | $7E51
    .byte $08 ; |    X   | $7E52
    .byte $08 ; |    X   | $7E53
    .byte $10 ; |   X    | $7E54
    .byte $10 ; |   X    | $7E55
    .byte $10 ; |   X    | $7E56
    .byte $10 ; |   X    | $7E57
    .byte $08 ; |    X   | $7E58
    .byte $08 ; |    X   | $7E59
    .byte $08 ; |    X   | $7E5A
    .byte $08 ; |    X   | $7E5B
    .byte $08 ; |    X   | $7E5C
    .byte $10 ; |   X    | $7E5D
    .byte $30 ; |  XX    | $7E5E
    .byte $20 ; |  X     | $7E5F
    .byte $08 ; |    X   | $7E60
    .byte $08 ; |    X   | $7E61
    .byte $08 ; |    X   | $7E62
    .byte $08 ; |    X   | $7E63
    .byte $08 ; |    X   | $7E64
    .byte $08 ; |    X   | $7E65
    .byte $0C ; |    XX  | $7E66
    .byte $04 ; |     X  | $7E67
    .byte $08 ; |    X   | $7E68
    .byte $08 ; |    X   | $7E69
    .byte $08 ; |    X   | $7E6A
    .byte $08 ; |    X   | $7E6B
    .byte $0C ; |    XX  | $7E6C
    .byte $04 ; |     X  | $7E6D
    .byte $04 ; |     X  | $7E6E
    .byte $04 ; |     X  | $7E6F
    .byte $08 ; |    X   | $7E70
    .byte $08 ; |    X   | $7E71
    .byte $08 ; |    X   | $7E72
    .byte $08 ; |    X   | $7E73
    .byte $18 ; |   XX   | $7E74
    .byte $10 ; |   X    | $7E75
    .byte $10 ; |   X    | $7E76
    .byte $30 ; |  XX    | $7E77
    .byte $FF ; |XXXXXXXX| $7E78
    .byte $FF ; |XXXXXXXX| $7E79
    .byte $FF ; |XXXXXXXX| $7E7A
    .byte $FF ; |XXXXXXXX| $7E7B
    .byte $FF ; |XXXXXXXX| $7E7C
    .byte $FF ; |XXXXXXXX| $7E7D
    .byte $FF ; |XXXXXXXX| $7E7E
    .byte $FF ; |XXXXXXXX| $7E7F
    .byte $1C ; |   XXX  | $7E80
    .byte $18 ; |   XX   | $7E81
    .byte $18 ; |   XX   | $7E82
    .byte $18 ; |   XX   | $7E83
    .byte $18 ; |   XX   | $7E84
    .byte $18 ; |   XX   | $7E85
    .byte $98 ; |X  XX   | $7E86
    .byte $FC ; |XXXXXX  | $7E87
    .byte $FC ; |XXXXXX  | $7E88
    .byte $38 ; |  XXX   | $7E89
    .byte $38 ; |  XXX   | $7E8A
    .byte $79 ; | XXXX  X| $7E8B
    .byte $3B ; |  XXX XX| $7E8C
    .byte $7E ; | XXXXXX | $7E8D
    .byte $2C ; |  X XX  | $7E8E
    .byte $10 ; |   X    | $7E8F
    .byte $38 ; |  XXX   | $7E90
    .byte $BC ; |X XXXX  | $7E91
    .byte $78 ; | XXXX   | $7E92
    .byte $18 ; |   XX   | $7E93
    .byte $6C ; | XX XX  | $7E94
    .byte $48 ; | X  X   | $7E95
    .byte $48 ; | X  X   | $7E96
    .byte $48 ; | X  X   | $7E97
    .byte $48 ; | X  X   | $7E98
    .byte $48 ; | X  X   | $7E99
    .byte $48 ; | X  X   | $7E9A
    .byte $7C ; | XXXXX  | $7E9B
    .byte $6C ; | XX XX  | $7E9C
    .byte $34 ; |  XX X  | $7E9D
    .byte $34 ; |  XX X  | $7E9E
    .byte $6C ; | XX XX  | $7E9F
    .byte $5C ; | X XXX  | $7EA0
    .byte $78 ; | XXXX   | $7EA1
    .byte $68 ; | XX X   | $7EA2
    .byte $10 ; |   X    | $7EA3
    .byte $38 ; |  XXX   | $7EA4
    .byte $BC ; |X XXXX  | $7EA5
    .byte $78 ; | XXXX   | $7EA6
    .byte $18 ; |   XX   | $7EA7
    .byte $03 ; |      XX| $7EA8
    .byte $83 ; |X     XX| $7EA9
    .byte $C2 ; |XX    X | $7EAA
    .byte $42 ; | X    X | $7EAB
    .byte $46 ; | X   XX | $7EAC
    .byte $64 ; | XX  X  | $7EAD
    .byte $3C ; |  XXXX  | $7EAE
    .byte $3C ; |  XXXX  | $7EAF
    .byte $78 ; | XXXX   | $7EB0
    .byte $78 ; | XXXX   | $7EB1
    .byte $0C ; |    XX  | $7EB2
    .byte $74 ; | XXX X  | $7EB3
    .byte $D4 ; |XX X X  | $7EB4
    .byte $FC ; |XXXXXX  | $7EB5
    .byte $6E ; | XX XXX | $7EB6
    .byte $13 ; |   X  XX| $7EB7
    .byte $39 ; |  XXX  X| $7EB8
    .byte $BD ; |X XXXX X| $7EB9
    .byte $F8 ; |XXXXX   | $7EBA
    .byte $18 ; |   XX   | $7EBB
    .byte $1C ; |   XXX  | $7EBC
    .byte $18 ; |   XX   | $7EBD
    .byte $18 ; |   XX   | $7EBE
    .byte $18 ; |   XX   | $7EBF
    .byte $18 ; |   XX   | $7EC0
    .byte $98 ; |X  XX   | $7EC1
    .byte $FC ; |XXXXXX  | $7EC2
    .byte $FC ; |XXXXXX  | $7EC3
    .byte $3E ; |  XXXXX | $7EC4
    .byte $7E ; | XXXXXX | $7EC5
    .byte $FC ; |XXXXXX  | $7EC6
    .byte $BC ; |X XXXX  | $7EC7
    .byte $F8 ; |XXXXX   | $7EC8
    .byte $6C ; | XX XX  | $7EC9
    .byte $16 ; |   X XX | $7ECA
    .byte $3A ; |  XXX X | $7ECB
    .byte $BE ; |X XXXXX | $7ECC
    .byte $7B ; | XXXX XX| $7ECD
    .byte $19 ; |   XX  X| $7ECE
    .byte $03 ; |      XX| $7ECF
    .byte $EE ; |XXX XXX | $7ED0
    .byte $CC ; |XX  XX  | $7ED1
    .byte $CC ; |XX  XX  | $7ED2
    .byte $CC ; |XX  XX  | $7ED3
    .byte $EC ; |XXX XX  | $7ED4
    .byte $7C ; | XXXXX  | $7ED5
    .byte $3C ; |  XXXX  | $7ED6
    .byte $26 ; |  X  XX | $7ED7
    .byte $1B ; |   XX XX| $7ED8
    .byte $37 ; |  XX XXX| $7ED9
    .byte $6E ; | XX XXX | $7EDA
    .byte $7C ; | XXXXX  | $7EDB
    .byte $7C ; | XXXXX  | $7EDC
    .byte $2E ; |  X XXX | $7EDD
    .byte $13 ; |   X  XX| $7EDE
    .byte $39 ; |  XXX  X| $7EDF
    .byte $BD ; |X XXXX X| $7EE0
    .byte $79 ; | XXXX  X| $7EE1
    .byte $1B ; |   XX XX| $7EE2
    .byte $06 ; |     XX | $7EE3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      $7EE4 - $7EFF GARBAGE CODE FOUR
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

  ELSE BITCORP

    .byte $FF,$09,$0C,$0C,$FF,$FF,$F9,$75,$90,$17,$E8,$E8,$E8,$E0,$1E,$90
    .byte $EF,$A5,$CB,$C9,$BB,$F0,$05,$C9,$CF,$F0,$01,$FF

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



       ORG $7F00

    .byte $00 ; |        | $7F00
    .byte $00 ; |        | $7F01
    .byte $00 ; |        | $7F02
    .byte $00 ; |        | $7F03
    .byte $00 ; |        | $7F04
    .byte $00 ; |        | $7F05
    .byte $00 ; |        | $7F06
    .byte $00 ; |        | $7F07
    .byte $00 ; |        | $7F08
    .byte $3C ; |  XXXX  | $7F09
    .byte $66 ; | XX  XX | $7F0A
    .byte $66 ; | XX  XX | $7F0B
    .byte $66 ; | XX  XX | $7F0C
    .byte $66 ; | XX  XX | $7F0D
    .byte $66 ; | XX  XX | $7F0E
    .byte $3C ; |  XXXX  | $7F0F
    .byte $00 ; |        | $7F10
    .byte $3C ; |  XXXX  | $7F11
    .byte $18 ; |   XX   | $7F12
    .byte $18 ; |   XX   | $7F13
    .byte $18 ; |   XX   | $7F14
    .byte $18 ; |   XX   | $7F15
    .byte $38 ; |  XXX   | $7F16
    .byte $18 ; |   XX   | $7F17
    .byte $00 ; |        | $7F18
    .byte $7E ; | XXXXXX | $7F19
    .byte $60 ; | XX     | $7F1A
    .byte $60 ; | XX     | $7F1B
    .byte $3C ; |  XXXX  | $7F1C
    .byte $06 ; |     XX | $7F1D
    .byte $46 ; | X   XX | $7F1E
    .byte $3C ; |  XXXX  | $7F1F
    .byte $00 ; |        | $7F20
    .byte $3C ; |  XXXX  | $7F21
    .byte $46 ; | X   XX | $7F22
    .byte $06 ; |     XX | $7F23
    .byte $1C ; |   XXX  | $7F24
    .byte $06 ; |     XX | $7F25
    .byte $46 ; | X   XX | $7F26
    .byte $3C ; |  XXXX  | $7F27
    .byte $00 ; |        | $7F28
    .byte $0C ; |    XX  | $7F29
    .byte $0C ; |    XX  | $7F2A
    .byte $7E ; | XXXXXX | $7F2B
    .byte $6C ; | XX XX  | $7F2C
    .byte $3C ; |  XXXX  | $7F2D
    .byte $1C ; |   XXX  | $7F2E
    .byte $0C ; |    XX  | $7F2F
    .byte $00 ; |        | $7F30
    .byte $7C ; | XXXXX  | $7F31
    .byte $06 ; |     XX | $7F32
    .byte $06 ; |     XX | $7F33
    .byte $7C ; | XXXXX  | $7F34
    .byte $60 ; | XX     | $7F35
    .byte $60 ; | XX     | $7F36
    .byte $7E ; | XXXXXX | $7F37
    .byte $00 ; |        | $7F38
    .byte $3C ; |  XXXX  | $7F39
    .byte $66 ; | XX  XX | $7F3A
    .byte $66 ; | XX  XX | $7F3B
    .byte $7C ; | XXXXX  | $7F3C
    .byte $60 ; | XX     | $7F3D
    .byte $62 ; | XX   X | $7F3E
    .byte $3C ; |  XXXX  | $7F3F
    .byte $00 ; |        | $7F40
    .byte $18 ; |   XX   | $7F41
    .byte $18 ; |   XX   | $7F42
    .byte $18 ; |   XX   | $7F43
    .byte $0C ; |    XX  | $7F44
    .byte $06 ; |     XX | $7F45
    .byte $66 ; | XX  XX | $7F46
    .byte $7E ; | XXXXXX | $7F47
    .byte $00 ; |        | $7F48
    .byte $3C ; |  XXXX  | $7F49
    .byte $66 ; | XX  XX | $7F4A
    .byte $66 ; | XX  XX | $7F4B
    .byte $3C ; |  XXXX  | $7F4C
    .byte $66 ; | XX  XX | $7F4D
    .byte $66 ; | XX  XX | $7F4E
    .byte $3C ; |  XXXX  | $7F4F
    .byte $00 ; |        | $7F50
    .byte $3C ; |  XXXX  | $7F51
    .byte $46 ; | X   XX | $7F52
    .byte $06 ; |     XX | $7F53
    .byte $3E ; |  XXXXX | $7F54
    .byte $66 ; | XX  XX | $7F55
    .byte $66 ; | XX  XX | $7F56
    .byte $3C ; |  XXXX  | $7F57

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      LOGOS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

L7F58:
    .byte $00 ; |        | $7F58
    .byte $38 ; |  XXX   | $7F59
    .byte $38 ; |  XXX   | $7F5A
    .byte $3E ; |  XXXXX | $7F5B
    .byte $3E ; |  XXXXX | $7F5C
    .byte $3A ; |  XXX X | $7F5D
    .byte $7A ; | XXXX X | $7F5E
    .byte $7E ; | XXXXXX | $7F5F
    .byte $7E ; | XXXXXX | $7F60   this byte is never used
L7F61:
    .byte $00 ; |        | $7F61
    .byte $FB ; |XXXXX XX| $7F62
    .byte $FB ; |XXXXX XX| $7F63
    .byte $FB ; |XXXXX XX| $7F64
    .byte $E9 ; |XXX X  X| $7F65
    .byte $E8 ; |XXX X   | $7F66
    .byte $E8 ; |XXX X   | $7F67
    .byte $EB ; |XXX X XX| $7F68
    .byte $EB ; |XXX X XX| $7F69   this byte is never used
L7F6A:
    .byte $00 ; |        | $7F6A
    .byte $EF ; |XXX XXXX| $7F6B
    .byte $EF ; |XXX XXXX| $7F6C
    .byte $EF ; |XXX XXXX| $7F6D
    .byte $04 ; |     X  | $7F6E
    .byte $82 ; |X     X | $7F6F
    .byte $41 ; | X     X| $7F70
    .byte $EF ; |XXX XXXX| $7F71
    .byte $EF ; |XXX XXXX| $7F72   this byte is never used
L7F73:
    .byte $00 ; |        | $7F73
    .byte $8C ; |X   XX  | $7F74
    .byte $8C ; |X   XX  | $7F75
    .byte $BC ; |X XXXX  | $7F76
    .byte $3E ; |  XXXXX | $7F77
    .byte $3A ; |  XXX X | $7F78
    .byte $3A ; |  XXX X | $7F79
    .byte $BA ; |X XXX X | $7F7A
    .byte $BA ; |X XXX X | $7F7B   this byte is never used

  ELSE BITCORP

L7F58:
    .byte $00 ; |        | $7F58
    .byte $31 ; |  XX   X| $7F59
    .byte $49 ; | X  X  X| $7F5A
    .byte $B5 ; |X XX X X| $7F5B
    .byte $A5 ; |X X  X X| $7F5C
    .byte $A5 ; |X X  X X| $7F5D
    .byte $B5 ; |X XX X X| $7F5E
    .byte $49 ; | X  X  X| $7F5F
    .byte $31 ; |  XX   X| $7F60
L7F61:
    .byte $00 ; |        | $7F61
    .byte $D2 ; |XX X  X | $7F62
    .byte $D2 ; |XX X  X | $7F63
    .byte $52 ; | X X  X | $7F64
    .byte $D2 ; |XX X  X | $7F65
    .byte $92 ; |X  X  X | $7F66
    .byte $D2 ; |XX X  X | $7F67
    .byte $57 ; | X X XXX| $7F68
    .byte $D7 ; |XX X XXX| $7F69
L7F6A:
    .byte $00 ; |        | $7F6A
    .byte $37 ; |  XX XXX| $7F6B
    .byte $37 ; |  XX XXX| $7F6C
    .byte $37 ; |  XX XXX| $7F6D
    .byte $25 ; |  X  X X| $7F6E
    .byte $25 ; |  X  X X| $7F6F
    .byte $25 ; |  X  X X| $7F70
    .byte $37 ; |  XX XXX| $7F71
    .byte $37 ; |  XX XXX| $7F72
L7F73:
    .byte $00 ; |        | $7F73
    .byte $54 ; | X X X  | $7F74
    .byte $54 ; | X X X  | $7F75
    .byte $64 ; | XX  X  | $7F76
    .byte $77 ; | XXX XXX| $7F77
    .byte $77 ; | XXX XXX| $7F78
    .byte $55 ; | X X X X| $7F79
    .byte $55 ; | X X X X| $7F7A
    .byte $77 ; | XXX XXX| $7F7B

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      $7F7C - $7FFB GARBAGE CODE FIVE
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF PUZZY

    .byte $FF,$FF,$FF,$FF,$FF,$AD,$84,$02,$D0,$FB,$A9,$82,$85,$02,$85,$01
    .byte $85,$02,$85,$02,$85,$02,$85,$00,$85,$02,$85,$02,$85,$02,$A9,$00
    .byte $85,$00,$85,$01,$85,$08,$A9,$3E,$8D,$96,$02,$A9,$01,$85,$EE,$A9
    .byte $2C,$85,$F0,$A9,$57,$85,$F2,$60,$A9,$00,$85,$AC,$85,$AD,$85,$82
    .byte $85,$81,$85,$AE,$85,$AF,$85,$B0,$85,$B1,$A9,$01,$85,$83,$20,$BF
    .byte $FB,$A9,$FC,$85,$B6,$85,$B9,$85,$86,$85,$88,$A9,$10,$85,$CA,$60
    .byte $1B,$1F,$1E,$1A,$06,$08,$1C,$1E,$1D,$18,$04,$06,$A9,$00,$85,$AE
    .byte $85,$AF,$85,$C4,$85,$83,$85,$81,$85,$82,$85,$EC,$60,$FF,$FF,$FF

  ELSE BITCORP

    .byte $FF,$FF,$FF,$FF,$20,$F0,$78,$85,$02,$85,$2A,$A6,$D1,$CA,$CA,$CA
    .byte $C6,$D0,$C6,$D0,$C6,$D0,$CA,$F0,$3A,$85,$02,$85,$2B,$E0,$15,$B0
    .byte $1E,$A9,$00,$85,$1D,$85,$1E,$85,$04,$8A,$A8,$B1,$CB,$85,$1B,$A9
    .byte $88,$E0,$10,$B0,$08,$A9,$BC,$E0,$08,$B0,$02,$A9,$88,$85,$06,$A5
    .byte $CF,$C6,$CF,$F0,$A4,$E4,$D2,$D0,$08,$A9,$08,$85,$CF,$A9,$FF,$85
    .byte $1F,$D0,$C3,$86,$1F,$86,$1B,$86,$1D,$86,$1E,$A9,$28,$85,$08,$85
    .byte $02,$A9,$10,$8D,$96,$02,$A9,$00,$A0,$04,$A6,$86,$F0,$16,$E0,$08
    .byte $90,$04,$A2,$08,$86,$86,$38,$6A,$6A,$CA,$F0,$08,$88,$D0,$F7,$A8

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



       ORG $7FFC

    .byte $00 ; |        | $7FFC
    .byte $F0 ; |XXXX    | $7FFD
    .byte $00 ; |        | $7FFE
    .byte $F0 ; |XXXX    | $7FFF
