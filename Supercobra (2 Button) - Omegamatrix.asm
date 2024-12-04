; Disassembly of superc.1
; Disassembled Tue Jun 22 20:13:31 2010
; Using DiStella v3.0
;
; Converted to use Genesis Controller by Omegamatrix
;
;
; REAL rough disassembly here. This is an E0 bankswitched game so I tried keeping the bytes aligned
; between slices. Lots of labels left as absolute addresses, so be careful.
;
;
;
; Command Line: ultrastella -pasfcSC1.cfg superc.1 
;
; SC1.cfg contents:
;
;      ORG D000
;      CODE D000 D0A9
;      GFX D0AA D0B2
;      CODE D0B3 D501
;      GFX D502 D504
;      CODE D505 DADA
;      GFX DADB DC00
;      CODE DC01 DF10
;      GFX DF11 DFFF
;
; Disassembly of superc.2
; Disassembled Tue Jun 22 20:23:55 2010
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcSC2.cfg superc.2 
;
; SC2.cfg contents:
;
;      ORG F000 F114
;      CODE F115 F6A9
;      GFX F6AA F6FF
;      CODE F700 F7A1
;      GFX F7A2 FBFF
;      CODE FC00 FCF6
;      GFX FCF7 FFFF

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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXP0FB  =  $32
CXP1FB  =  $33
CXM0FB  =  $34
CXBLPF  =  $36
CXPPMM  =  $37
INPT1   =  $39
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;swap buttons B & C on the Genesis by using the switch below!

;use 1 or 0
SWAP_BUTTONS = 0

  IF SWAP_BUTTONS
FIRE_ONE  equ INPT4
FIRE_TWO  equ INPT1
  ELSE
FIRE_ONE  equ INPT1
FIRE_TWO  equ INPT4
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD156   =   $D156
LD17B   =   $D17B
LD1B9   =   $D1B9
LD257   =   $D257
LD27C   =   $D27C
LD303   =   $D303
LD31F   =   $D31F
LDC39   =   $DC39
LDC64   =   $DC64
LDCE2   =   $DCE2
LDD00   =   $DD00
LDD10   =   $DD10


       ORG $1000
      RORG $D000
      
LD000:
    jsr    $FC2D           ; 6
    lda    SWCHB           ; 4
    and    #$01            ; 2
    beq    LD000           ; 2
LD00A:
;    lda    SWCHB           ; 4
;    and    #$01            ; 2
;    bne    LD014           ; 2
;save 2 bytes
    LSR    SWCHB
    BCS    LD014
    jmp    LD0B3           ; 3

LD014:
    lda    $E9             ; 3
    beq    LD01C           ; 2
    dec    $E9             ; 5
    bne    LD023           ; 2
LD01C:
    lda    SWCHB           ; 4
    and    #$02            ; 2
    beq    LD065           ; 2
LD023:
    lda    SWCHB           ; 4
    and    #$08            ; 2
    bne    LD02D           ; 2
    jmp    LD0BF           ; 3

LD02D:
    inc    $C4             ; 5
    lda    $AA             ; 3
    and    #$01            ; 2
    bne    LD053           ; 2
    lda    $86             ; 3
    ora    #$08            ; 2
    sta    $86             ; 3
    jmp    LD505           ; 3

LD03E:
    jsr    LD17D           ; 6
    jsr    LD35B           ; 6
    jsr    LD621           ; 6
    jsr    LD681           ; 6
    jsr    LD3F7           ; 6
LD04D:
    jsr    $FC2D           ; 6
    jmp    LD00A           ; 3
    

LD053:
    lda    INPT4           ; 3
    bpl    LD0B3           ; 2
    LDA    INPT1
    BPL    LD0B3
    
    lda    $C4             ; 3
    bne    LD062           ; 2
    lda    $C2             ; 3
    clc                    ; 2
    adc    #$10            ; 2
    sta    $C2             ; 3
LD062:
    jmp    LD04D           ; 3

LD065:
    lda    #$0F            ; 2
    sta    $E9             ; 3
    lda    $86             ; 3
    and    #$F7            ; 2
    sta    $86             ; 3
;    lda    $AA             ; 3
;    ora    #$01            ; 2
;    sta    $AA             ; 3
;save 1 byte
    LSR    $AA
    SEC
    ROL    $AA
    and    #$04            ; 2
    beq    LD087           ; 2
    dec    $B3             ; 5
    lda    $B3             ; 3
    and    #$0F            ; 2
    bne    LD087           ; 2
    lda    $B3             ; 3
    ora    #$03            ; 2
    sta    $B3             ; 3
LD087:
    lda    $B3             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    asl                    ; 2
    adc    $EF             ; 3
    tax                    ; 2
    ldy    #$02            ; 2
LD093:
    dex                    ; 2
    lda    LD0AA,X         ; 4
    sta.wy $00E6,Y         ; 5
    dey                    ; 2
    bpl    LD093           ; 2
    lda    #$0A            ; 2
    sta    $EA             ; 3
    lda    $AA             ; 3
    ora    #$04            ; 2
    sta    $AA             ; 3
;    jmp    LD04D           ; 3
;save 1 byte
    BNE    LD04D   ; always branch

LD0AA:
    .byte $B0 ; |X XX    | $D0AA
    .byte $9A ; |X  XX X | $D0AB
    .byte $00 ; |        | $D0AC
    .byte $78 ; | XXXX   | $D0AD
    .byte $56 ; | X X XX | $D0AE
    .byte $04 ; |     X  | $D0AF
    .byte $30 ; |  XX    | $D0B0
    .byte $12 ; |   X  X | $D0B1
    .byte $00 ; |        | $D0B2
LD0B3:
    lda    #$FF            ; 2
    sta    $E0             ; 3
    sta    $E1             ; 3
    jsr    LD112           ; 6
    jmp    LD000           ; 3

LD0BF:
    lda    $86             ; 3
    and    #$F7            ; 2
    sta    $86             ; 3
    lda    $AA             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda    $BF             ; 3
    and    #$F0            ; 2
    ora    $EF             ; 3
    sta    $BF             ; 3
    lda    $AA             ; 3
    ora    #$01            ; 2
    sta    $AA             ; 3
    lda    #$FF            ; 2
    sta    $E9             ; 3
LD0DD:
    lda    #$FF            ; 2
LD0DF:
    sta    $C4             ; 3
LD0E1:
    lda    SWCHB           ; 4
    and    #$08            ; 2
    bne    LD0FD           ; 2
    jsr    $FC2D           ; 6
    dec    $C4             ; 5
    bne    LD0E1           ; 2
    lda    $C2             ; 3
    clc                    ; 2
    adc    #$10            ; 2
    sta    $C2             ; 3
    dec    $E9             ; 5
    bne    LD0DD           ; 2
    jmp    $FC00           ; 3

LD0FD:
    lda    #$B2            ; 2
    sta    $C2             ; 3
    lda    $BF             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda    $AA             ; 3
    and    #$F0            ; 2
    ora    $EF             ; 3
    sta    $AA             ; 3
    jmp    LD02D           ; 3

LD112:
    lda    $B3             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda    #$00            ; 2
    ldx    #$41            ; 2
LD11C:
    sta    $80,X           ; 4
    dex                    ; 2
    bpl    LD11C           ; 2
    stx    $D0             ; 3
    lda    $EF             ; 3
    sta    $B3             ; 3
    lda    #$00            ; 2
    sta    $E6             ; 3
    sta    $E7             ; 3
    sta    $E8             ; 3
    sta    $EA             ; 3
    sta    $C7             ; 3
    sta    $C4             ; 3
    lda    #$5A            ; 2
    sta    $EB             ; 3
    lda    #$B2            ; 2
    sta    $C2             ; 3
    lda    #$03            ; 2
    sta    $80             ; 3
    lda    SWCHB           ; 4
    and    #$40            ; 2
    bne    LD150           ; 2
    lda    $83             ; 3
    and    #$F0            ; 2
    ora    #$00            ; 2
    sta    $83             ; 3
LD150:
    jsr    LDA85           ; 6
    lda    #$2B            ; 2
    sta    $C3             ; 3
    lda    #$0B            ; 2
    sta    $C8             ; 3
    lda    #$18            ; 2
    sta    $CC             ; 3
    lda    #$4A            ; 2
    sta    $CD             ; 3
LD163:
    lda    #$01            ; 2
    sta    $DC             ; 3
    lda    #$3D            ; 2
    sta    $DD             ; 3
LD16B:
    lda    $BC             ; 3
    ora    #$08            ; 2
    sta    $BC             ; 3
    ldx    #$01            ; 2
    stx    $DE             ; 3
    stx    $DF             ; 3
    dex                    ; 2
    stx    $E0             ; 3
    stx    $E1             ; 3
    rts                    ; 6

LD17D:
    jsr    LD4F7           ; 6
    beq    LD183           ; 2
    rts                    ; 6

LD183:
    lda    $A7             ; 3
    and    #$F0            ; 2
    sta    $A7             ; 3
    lda    $A4             ; 3
    and    #$0F            ; 2
    ora    $A7             ; 3
    sta    $A7             ; 3
    lda    $A4             ; 3
    and    #$F0            ; 2
    ora    $C7             ; 3
    sta    $A4             ; 3
    lda    $83             ; 3
    cmp    #$0A            ; 2
LD19D:
    bne    LD1A2           ; 2
    jmp    LD2F8           ; 3

LD1A2:
    lda    $83             ; 3
    and    #$0F            ; 2
    tay                    ; 2
    lda    $86             ; 3
    and    #$02            ; 2
    beq    LD1B0           ; 2
LD1AD:
    jmp    LD291           ; 3

LD1B0:
    lda    $92             ; 3
    and    #$0F            ; 2
    bne    LD1C1           ; 2
    lda    $8F             ; 3
    and    #$0F            ; 2
    beq    LD1AD           ; 2
    dec    $8F             ; 5
    jmp    LD211           ; 3

LD1C1:
    lda    $8F             ; 3
    and    #$0F            ; 2
    sta    $EE             ; 3
    cmp    $C7             ; 3
    beq    LD1AD           ; 2
    jsr    LD342           ; 6
    sta    $EF             ; 3
    lda    $92             ; 3
    and    #$01            ; 2
    beq    LD202           ; 2
    lda    $C7             ; 3
    clc                    ; 2
    adc    $EF             ; 3
    cmp    $EE             ; 3
    bcc    LD1E1           ; 2
    lda    $EE             ; 3
LD1E1:
    sta    $C7             ; 3
    lda    $C8             ; 3
    cmp    #$0B            ; 2
    beq    LD1FF           ; 2
    sec                    ; 2
    sbc    $C7             ; 3
LD1EC:
    bmi    LD1F2           ; 2
    cmp    #$05            ; 2
    bcs    LD1FF           ; 2
LD1F2:
    lda    $C8             ; 3
    clc                    ; 2
    adc    $EF             ; 3
    cmp    #$0A            ; 2
    bcc    LD1FD           ; 2
    lda    #$0A            ; 2
LD1FD:
    sta    $C8             ; 3
LD1FF:
    jmp    LD211           ; 3

LD202:
    lda    $C7             ; 3
    sec                    ; 2
    sbc    $EF             ; 3
    bmi    LD20D           ; 2
    cmp    $EE             ; 3
    bcs    LD20F           ; 2
LD20D:
    lda    $EE             ; 3
LD20F:
    sta    $C7             ; 3
LD211:
    dec    $CA             ; 5
    bne    LD232           ; 2
    lda    LDAF1,Y         ; 4
    beq    LD22D           ; 2
    lda    $86             ; 3
    and    #$02            ; 2
    bne    LD22D           ; 2
    lda    $86             ; 3
    eor    #$01            ; 2
    sta    $86             ; 3
    ldx    LDB28,Y         ; 4
    and    #$01            ; 2
    bne    LD230           ; 2
LD22D:
    ldx    LDB1D,Y         ; 4
LD230:
    stx    $CA             ; 3
LD232:
    dec    $C9             ; 5
    bne    LD290           ; 2
    jsr    LDAC6           ; 6
    and    LDAE6,Y         ; 4
    sta    $C9             ; 3
    inc    $C9             ; 5
    lda    $B9             ; 3
    and    #$F0            ; 2
    ora    $C8             ; 3
    sta    $B9             ; 3
    lda    $86             ; 3
    and    #$01            ; 2
    bne    LD253           ; 2
    lda    #$0B            ; 2
    sta    $C8             ; 3
    rts                    ; 6

LD253:
    jsr    LD342           ; 6
    and    #$01            ; 2
    ldx    $EC             ; 3
LD25A:
    bpl    LD261           ; 2
    eor    #$FF            ; 2
    clc                    ; 2
    adc    #$01            ; 2
LD261:
    sta    $EF             ; 3
    lda    $86             ; 3
    and    #$02            ; 2
    beq    LD26D           ; 2
    lda    #$01            ; 2
    sta    $EF             ; 3
LD26D:
    lda    $C8             ; 3
    clc                    ; 2
    adc    $EF             ; 3
    cmp    #$0B            ; 2
    bcc    LD278           ; 2
    lda    #$0A            ; 2
LD278:
    sta    $C8             ; 3
    sec                    ; 2
    sbc    $C7             ; 3
    bmi    LD283           ; 2
    cmp    #$05            ; 2
    bcs    LD290           ; 2
LD283:
    lda    $C7             ; 3
    clc                    ; 2
    adc    #$05            ; 2
    cmp    #$0A            ; 2
    bcc    LD28E           ; 2
    lda    #$0A            ; 2
LD28E:
    sta    $C8             ; 3
LD290:
    rts                    ; 6

LD291:
    jsr    LDAC6           ; 6
    and    #$0F            ; 2
    tax                    ; 2
    lda    LDB58,X         ; 4
    pha                    ; 3
    lda    $86             ; 3
    and    #$02            ; 2
    beq    LD2A5           ; 2
    pla                    ; 4
    lda    #$00            ; 2
    pha                    ; 3
LD2A5:
    lda    $86             ; 3
    and    #$FB            ; 2
    sta    $86             ; 3
    pla                    ; 4
    cmp    #$08            ; 2
    bne    LD2B7           ; 2
    ldx    LDAF1,Y         ; 4
LD2B3:
    bne    LD2B7           ; 2
    lda    #$0A            ; 2
LD2B7:
    sta    $EE             ; 3
    lda    $8F             ; 3
    and    #$F0            ; 2
    ora    $EE             ; 3
    sta    $8F             ; 3
    lda    $C7             ; 3
    cmp    $EE             ; 3
    beq    LD2DC           ; 2
    bcc    LD2CD           ; 2
    lda    #$02            ; 2
    bne    LD2CF           ; 2
LD2CD:
    lda    #$01            ; 2
LD2CF:
    sta    $EF             ; 3
    lda    $92             ; 3
    and    #$F0            ; 2
    ora    $EF             ; 3
    sta    $92             ; 3
    jmp    LD1B0           ; 3

LD2DC:
    jsr    LDAC6           ; 6
    and    #$0F            ; 2
    sta    $EE             ; 3
    bne    LD2E7           ; 2
    inc    $EE             ; 5
LD2E7:
    lda    $8F             ; 3
    and    #$F0            ; 2
    ora    $EE             ; 3
    sta    $8F             ; 3
    lda    $92             ; 3
    and    #$F0            ; 2
    sta    $92             ; 3
    jmp    LD1B0           ; 3

LD2F8:
    lda    $86             ; 3
    and    #$02            ; 2
    bne    LD32C           ; 2
    lda    $86             ; 3
    and    #$FB            ; 2
    sta    $86             ; 3
    lda    $C9             ; 3
    beq    LD30B           ; 2
    dec    $C9             ; 5
    rts                    ; 6

LD30B:
    ldx    $CB             ; 3
    lda    LDB68,X         ; 4
    and    #$0F            ; 2
    sta    $C9             ; 3
    lda    LDB68,X         ; 4
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    sta    $C7             ; 3
    dex                    ; 2
    bne    LD329           ; 2
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LD337           ; 2
    ldx    LDB68           ; 4
LD329:
    stx    $CB             ; 3
    rts                    ; 6

LD32C:
    lda    #$03            ; 2
    sta    $C9             ; 3
    lda    $C7             ; 3
    beq    LD336           ; 2
    dec    $C7             ; 5
LD336:
    rts                    ; 6

LD337:
    lda    $86             ; 3
    ora    #$02            ; 2
    sta    $86             ; 3
    lda    #$40            ; 2
    sta    $CB             ; 3
    rts                    ; 6

LD342:
    jsr    LDAC6           ; 6
    and    LDB07,Y         ; 4
    bne    LD353           ; 2
    lda    $EC             ; 3
    and    LDB12,Y         ; 4
    beq    LD353           ; 2
    lda    #$01            ; 2
LD353:
    bpl    LD35A           ; 2
    and    #$7F            ; 2
    clc                    ; 2
    adc    #$01            ; 2
LD35A:
    rts                    ; 6

LD35B:
    jsr    LD4F7           ; 6
    cmp    #$01            ; 2
    beq    LD363           ; 2
    rts                    ; 6

LD363:
    inc    $B6             ; 5
    lda    $86             ; 3
    and    #$02            ; 2
    beq    LD3AB           ; 2
    dec    $CB             ; 5
    bne    LD39A           ; 2
    lda    $86             ; 3
    and    #$FC            ; 2
    sta    $86             ; 3
    lda    #$0B            ; 2
    sta    $C8             ; 3
    inc    $83             ; 5
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0B            ; 2
    bne    LD397           ; 2
    lda    $83             ; 3
    and    #$F0            ; 2
    sta    $83             ; 3
    lda    #$00            ; 2
    sta    $D6             ; 3
    sta    $DB             ; 3
    sta    $A1             ; 3
    lda    $BC             ; 3
    and    #$FE            ; 2
    sta    $BC             ; 3
LD397:
    jsr    LDA85           ; 6
LD39A:
    lda    $CB             ; 3
    cmp    #$15            ; 2
    bne    LD3AB           ; 2
    jsr    LD16B           ; 6
    lda    #$7B            ; 2
    sta    $DC             ; 3
    lda    #$92            ; 2
    sta    $DD             ; 3
LD3AB:
    ldx    #$03            ; 2
    ldy    #$0A            ; 2
LD3AF:
    cpy    $C8             ; 3
    bcs    LD3BB           ; 2
    cpy    $C7             ; 3
    bcs    LD3BA           ; 2
    sec                    ; 2
;    bcs    LD3BB           ; 2
;save 1 byte
    .byte $24 ; BIT opcode
LD3BA:
    clc                    ; 2
LD3BB:
    ror    $82,X           ; 6
    rol    $81,X           ; 6
    lda    $80,X           ; 4
    and    #$0F            ; 2
    sta    $EF             ; 3
    ror    $80,X           ; 6
    lda    $80,X           ; 4
    ror                    ; 2
    ror                    ; 2
    ror                    ; 2
    ror                    ; 2
    lda    $80,X           ; 4
    and    #$F0            ; 2
    ora    $EF             ; 3
    sta    $80,X           ; 4
    dex                    ; 2
    dex                    ; 2
    dex                    ; 2
    txa                    ; 2
    and    #$01            ; 2
    beq    LD3BB           ; 2
    txa                    ; 2
    clc                    ; 2
    adc    #$0C            ; 2
    tax                    ; 2
    dey                    ; 2
    bpl    LD3AF           ; 2
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LD3F6           ; 2
    ldx    #$04            ; 2
LD3ED:
    lda    $D7,X           ; 4
    beq    LD3F3           ; 2
    dec    $D7,X           ; 6
LD3F3:
    dex                    ; 2
    bpl    LD3ED           ; 2
LD3F6:
    rts                    ; 6

LD3F7:
    jsr    LD4F7           ; 6
    cmp    #$01            ; 2
    beq    LD409           ; 2
    cmp    #$02            ; 2
    beq    LD409           ; 2
    cmp    #$08            ; 2
    beq    LD409           ; 2
    jmp    LD4A8           ; 3

LD409:
    ldx    $CC             ; 3
    bmi    LD42F           ; 2
    lda    $86             ; 3
    and    #$02            ; 2
    beq    LD432           ; 2
    lda    $CB             ; 3
    cmp    #$15            ; 2
    bcs    LD432           ; 2
    cpx    #$18            ; 2
    beq    LD425           ; 2
    bcc    LD422           ; 2
    dex                    ; 2
    bne    LD423           ; 2
LD422:
    inx                    ; 2
LD423:
    stx    $CC             ; 3
LD425:
    ldx    $CD             ; 3
    cpx    #$4A            ; 2
    bcs    LD42F           ; 2
    inx                    ; 2
    inx                    ; 2
    stx    $CD             ; 3
LD42F:
    jmp    LD491           ; 3

LD432:
    lda    $C3             ; 3
    bne    LD43F           ; 2
    lda    $CC             ; 3
    beq    LD43C           ; 2
    dec    $CC             ; 5
LD43C:
    jmp    LD4A8           ; 3

LD43F:
    ldx    $CD             ; 3
    lda    SWCHA           ; 4
    rol                    ; 2
    bcs    LD45D           ; 2
    cpx    #$4A            ; 2
    bcs    LD45D           ; 2
    inc    $CD             ; 5
    inc    $CD             ; 5
    tay                    ; 2
    lda    $89             ; 3
    and    #$F3            ; 2
    ora    #$08            ; 2
    sta    $89             ; 3
    tya                    ; 2
    rol                    ; 2
    jmp    LD47D           ; 3

LD45D:
    rol                    ; 2
    bcs    LD475           ; 2
    cpx    #$0F            ; 2
    bcc    LD475           ; 2
    dec    $CD             ; 5
    dec    $CD             ; 5
    tay                    ; 2
    lda    $89             ; 3
    and    #$F3            ; 2
    ora    #$04            ; 2
;    sta    $89             ; 3
;    tya                    ; 2
;    jmp    LD47D           ; 3
    BNE    .save4bytes   ;always branch

LD475:
    tay                    ; 2
    lda    $89             ; 3
    and    #$F3            ; 2
.save4bytes:
    sta    $89             ; 3
    tya                    ; 2
LD47D:
    ldx    $CC             ; 3
    rol                    ; 2
    bcs    LD488           ; 2
    cpx    #$02            ; 2
    bcc    LD488           ; 2
    dec    $CC             ; 5
LD488:
    rol                    ; 2
    bcs    LD491           ; 2
    cpx    #$2C            ; 2
    bcs    LD491           ; 2
    inc    $CC             ; 5
LD491:
    lda    $BC             ; 3
    and    #$01            ; 2
    beq    LD4AE           ; 2
    lda    $CC             ; 3
    sec                    ; 2
    sbc    #$01            ; 2
    sta    $D6             ; 3
    lda    $CD             ; 3
    lsr                    ; 2
    lsr                    ; 2
    clc                    ; 2
    adc    #$01            ; 2
    sta    $DB             ; 3
    rts                    ; 6

LD4A8:
    lda    $BC             ; 3
;    and    #$01            ; 2
;    bne    LD4B8           ; 2
;save 1 byte
    LSR
    BCS    LD4B8 
LD4AE:
    lda    INPT4           ; 3
    bpl    LD4B9           ; 2
    LDA    INPT1
    BPL    LD4B9
    
    lda    $BC             ; 3
    and    #$FD            ; 2
    sta    $BC             ; 3
LD4B8:
    rts                    ; 6

LD4B9:
;    lda    $BC             ; 3
;    and    #$02            ; 2
;    bne    LD4B8           ; 2
;    lda    $BC             ; 3
;    ora    #$02            ; 2
;    sta    $BC             ; 3
;save 2 bytes  
    LDA    #$02
    BIT    $BC
    BNE    LD4B8
    ORA    $BC
    STA    $BC
    
    
;need 12 bytes
    
    LDA    $AA
    BIT    FIRE_ONE
    BMI    .checkFire
    ORA    #$08
    BNE    .storeFIRE   ; always branch
    
.checkFire
    BIT    FIRE_TWO
    BMI    .fireNotPressed
    AND    #$F7
.storeFIRE:
    STA    $AA
.fireNotPressed:

;    lda    $AA             ; 3  here
;    eor    #$08            ; 2
;    sta    $AA             ; 3
    and    #$08            ; 2
    beq    LD4E2           ; 2
    ldx    $CC             ; 3
    dex                    ; 2
    stx    $CE             ; 3
    lda    $CD             ; 3
    clc                    ; 2
    adc    #$05            ; 2
    sta    $CF             ; 3
    lda    $E4             ; 3
    ora    #$10            ; 2
    sta    $E4             ; 3
    rts                    ; 6

LD4E2:
    lda    $CD             ; 3
    clc                    ; 2
    adc    #$0C            ; 2
    sta    $D1             ; 3
    lda    $CC             ; 3
    sec                    ; 2
    sbc    #$03            ; 2
    sta    $D0             ; 3
    lda    $AD             ; 3
    ora    #$05            ; 2
    sta    $AD             ; 3
    rts                    ; 6

LD4F7:
    lda    $B3             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    LD501,X         ; 4
    and    $C4             ; 3
LD501:
    rts                    ; 6

    .byte $03 ; |      XX| $D502
    .byte $07 ; |     XXX| $D503
    .byte $0F ; |    XXXX| $D504
LD505:
    lda    $CE             ; 3
    bmi    LD51E           ; 2
    jsr    LD4F7           ; 6
    cmp    #$01            ; 2
    beq    LD51E           ; 2
    inc    $CF             ; 5
    inc    $CF             ; 5
    lda    $CF             ; 3
    cmp    #$95            ; 2
    bcc    LD51E           ; 2
    lda    #$FF            ; 2
    sta    $CE             ; 3
LD51E:
    lda    $D0             ; 3
    bmi    LD554           ; 2
    lda    $AD             ; 3
    and    #$0F            ; 2
    beq    LD534           ; 2
    lda    $C4             ; 3
    and    #$03            ; 2
    bne    LD534           ; 2
    inc    $D1             ; 5
    inc    $D1             ; 5
    dec    $AD             ; 5
LD534:
    lda    $AD             ; 3
    and    #$0F            ; 2
    cmp    #$04            ; 2
    bcs    LD554           ; 2
    lda    $B3             ; 3
    and    #$01            ; 2
    beq    LD54A           ; 2
    lda    $C4             ; 3
    and    #$01            ; 2
    beq    LD54A           ; 2
    dec    $D0             ; 5
LD54A:
    lda    $B3             ; 3
    and    #$0F            ; 2
    cmp    #$03            ; 2
    bcs    LD554           ; 2
    dec    $D0             ; 5
LD554:
    lda    $C4             ; 3
;    and    #$01            ; 2
;    bne    LD566           ; 2
;save 1 byte
    LSR
    BCS    LD566
    lda    $89             ; 3
    and    #$02            ; 2
    bne    LD569           ; 2
    lda    $8C             ; 3
    eor    #$01            ; 2
    sta    $8C             ; 3
LD566:
    jmp    LD61E           ; 3

LD569:
    lda    $C4             ; 3
    and    #$03            ; 2
    bne    LD566           ; 2
    lda    $8C             ; 3
    and    #$0F            ; 2
    inc    $8C             ; 5
    cmp    #$04            ; 2
    bne    LD566           ; 2
    jsr    $FC64           ; 6
    lda    #$4B            ; 2
    sta    $C4             ; 3
    lda    $AA             ; 3
    and    #$01            ; 2
    beq    LD5A6           ; 2
    lda    #$F0            ; 2
    sta    $C4             ; 3
    lda    $E6             ; 3
    sta    $CA             ; 3
    lda    $E7             ; 3
    sta    $CB             ; 3
    lda    $E8             ; 3
    sta    $CF             ; 3
    lda    #$16            ; 2
    sta    $EA             ; 3
    lda    #$01            ; 2
    sta    $E8             ; 3
    lda    #$23            ; 2
    sta    $E7             ; 3
    lda    #$45            ; 2
    sta    $E6             ; 3
LD5A6:
    jsr    $FC2D           ; 6
;    lda    SWCHB           ; 4
;    and    #$01            ; 2
;    beq    LD61E           ; 2
;save 2 bytes
    LSR    SWCHB
    BCC    LD61E

    lda    SWCHB           ; 4
    and    #$02            ; 2
    beq    LD61E           ; 2
    lda    $AA             ; 3
;save 1 byte
    LSR
    BCC    LD5C7
;    and    #$01            ; 2
;    beq    LD5C7           ; 2
    lda    $C4             ; 3
    cmp    #$E1            ; 2   carry set/cleared
    bcs    LD5C7           ; 2
    lda    INPT4           ; 3  here controls fire
    bpl    LD5F4           ; 2
    LDA    INPT1
    BPL    LD5F4
    
LD5C7:
    lda    $BC             ; 3
    eor    #$04            ; 2
    sta    $BC             ; 3
    and    #$04            ; 2
    bne    LD5A6           ; 2
    dec    $C4             ; 5
    bne    LD5A6           ; 2
    lda    $AA             ; 3
    and    #$01            ; 2
    beq    LD61B           ; 2
    lda    $CA             ; 3
    sta    $E6             ; 3
    lda    $CB             ; 3
    sta    $E7             ; 3
    lda    $CF             ; 3
    sta    $E8             ; 3
    lda    #$00            ; 2
    sta    $EA             ; 3
    sta    $CA             ; 3
    sta    $CB             ; 3
    sta    $CF             ; 3
;    jmp    LD61E           ; 3
;save 1 byte
    BEQ    LD61E   ; always branch

LD5F4:
;    lda    $AA             ; 3
;    and    #$FE            ; 2
;    sta    $AA             ; 3
;save 2 bytes
    LSR    $AA             ; clear bit 0
    ASL    $AA
    
    lda    #$03            ; 2
    sta    $80             ; 3
    lda    #$00            ; 2
    sta    $E6             ; 3
    sta    $E7             ; 3
    sta    $E8             ; 3
    sta    $EA             ; 3
    sta    $CA             ; 3
    sta    $CB             ; 3
    sta    $CF             ; 3
    lda    #$B2            ; 2
    sta    $C2             ; 3
    jsr    $FC88           ; 6
    jsr    LD163           ; 6
    jmp    LD03E           ; 3

LD61B:
    jsr    $FC88           ; 6
LD61E:
    jmp    LD03E           ; 3

LD621:
    lda    $B6             ; 3
    and    #$04            ; 2
    bne    LD628           ; 2
    rts                    ; 6

LD628:
    lda    $B6             ; 3
    and    #$F0            ; 2
    sta    $B6             ; 3
    lda    $B0             ; 3
    and    #$0F            ; 2
    bne    LD650           ; 2
    lda    $B0             ; 3
    ora    #$03            ; 2
    sta    $B0             ; 3
    lda    $C3             ; 3
    beq    LD650           ; 2
    dec    $C3             ; 5
    cmp    #$10            ; 2
    bcs    LD650           ; 2
    lda    $E3             ; 3
    and    #$80            ; 2
    bne    LD650           ; 2
    lda    $E4             ; 3
    ora    #$80            ; 2
    sta    $E4             ; 3
LD650:
    dec    $B0             ; 5
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bne    LD65B           ; 2
    rts                    ; 6

LD65B:
    lda    $86             ; 3
    and    #$06            ; 2
    bne    LD668           ; 2
    lda    #$10            ; 2
    ldy    #$00            ; 2
    jsr    $FCE2           ; 6
LD668:
    dec    $EB             ; 5
    bne    LD680           ; 2
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bcs    LD680           ; 2
    lda    $86             ; 3
    ora    #$02            ; 2
    and    #$FE            ; 2
    sta    $86             ; 3
    lda    #$40            ; 2
    sta    $CB             ; 3
LD680:
    rts                    ; 6

LD681:
    jsr    LD4F7           ; 6
    and    #$03            ; 2
    cmp    #$03            ; 2
    beq    LD68D           ; 2
    jmp    LDA30           ; 3

LD68D:
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
    lda    #$00            ; 2
    sta    $EF             ; 3
LD695:
    lda    $D7,X           ; 4
    cmp    #$05            ; 2
    bcs    LD6BD           ; 2
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$09            ; 2
    bne    LD6AA           ; 2
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LD6E1           ; 2
LD6AA:
    lda    #$00            ; 2
    sta    $D7,X           ; 4
    sta    $D2,X           ; 4
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    sta.wy $0095,Y         ; 5
    inc    $EF             ; 5
    jmp    LD6E1           ; 3

LD6BD:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bcc    LD6E1           ; 2
    cmp    #$0C            ; 2
    beq    LD6AA           ; 2
    bcc    LD6D8           ; 2
    cmp    #$0F            ; 2
    beq    LD6AA           ; 2
    lda    $C4             ; 3
    and    #$0F            ; 2
    cmp    #$07            ; 2
    bne    LD6E1           ; 2
LD6D8:
    lda.wy $0095,Y         ; 4
    clc                    ; 2
    adc    #$01            ; 2
    sta.wy $0095,Y         ; 5
LD6E1:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LD695           ; 2
    lda    $EF             ; 3
    bne    LD6EE           ; 2
LD6EB:
    jmp    LD855           ; 3

LD6EE:
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LD6EB           ; 2
    lda    $86             ; 3
    and    #$06            ; 2
    bne    LD6EB           ; 2
    tax                    ; 2
    tay                    ; 2
LD6FC:
    lda    $D2,X           ; 4
    beq    LD706           ; 2
    iny                    ; 2
    iny                    ; 2
    iny                    ; 2
    inx                    ; 2
    bne    LD6FC           ; 2
LD706:
    stx    $F2             ; 3
    sty    $F3             ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    LDB49,X         ; 4
    tax                    ; 2
    and    #$01            ; 2
    beq    LD720           ; 2
    lda    $86             ; 3
    and    #$01            ; 2
    beq    LD728           ; 2
    jmp    LD7DA           ; 3

LD720:
    txa                    ; 2
    and    #$02            ; 2
    beq    LD728           ; 2
    jmp    LD82B           ; 3

LD728:
    ldx    $C5             ; 3
    lda    $A7             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda    #$00            ; 2
    clc                    ; 2
LD733:
    adc    $EF             ; 3
    dex                    ; 2
    bne    LD733           ; 2
    pha                    ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    pla                    ; 4
    clc                    ; 2
    adc    LDAFC,X         ; 4
    sta    $EF             ; 3
    sec                    ; 2
    sbc    #$08            ; 2
    bpl    LD74C           ; 2
    lda    #$00            ; 2
LD74C:
    sta    $F0             ; 3
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD752:
    lda    $D2,X           ; 4
    beq    LD77D           ; 2
    lda    $D2,X           ; 4
    sec                    ; 2
    sbc    #$07            ; 2
    bpl    LD75F           ; 2
    lda    #$00            ; 2
LD75F:
    sta    $F1             ; 3
    lda    $D2,X           ; 4
    cmp    $F0             ; 3
    bcc    LD770           ; 2
    lda    $EF             ; 3
    cmp    $F1             ; 3
    bcc    LD77D           ; 2
;LD76D:
;    jmp    LD855           ; 3
;save 1 byte
    BCS    LD797  ; always branch

LD770:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$02            ; 2
    beq    LD797 ;LD76D           ; 2
    cmp    #$05            ; 2
    beq    LD797 ;LD76D           ; 2
LD77D:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LD752           ; 2
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bne    LD79A           ; 2
    lda    $A7             ; 3
    and    #$0F            ; 2
    cmp    #$03            ; 2
    beq    LD797           ; 2
    cmp    #$05            ; 2
    bne    LD79A           ; 2
LD797:
    jmp    LD855           ; 3

LD79A:
    ldx    #$01            ; 2
    lda    $A4             ; 3
    and    #$0F            ; 2
    sta    $F1             ; 3
    lda    $A7             ; 3
    and    #$0F            ; 2
    cmp    $F1             ; 3
    bne    LD7C4           ; 2
    ldx    #$03            ; 2
    cmp    #$06            ; 2
    bcc    LD7B2           ; 2
    ldx    #$04            ; 2
LD7B2:
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bne    LD7C4           ; 2
    lda    $F1             ; 3
    ldx    #$04            ; 2
    cmp    #$04            ; 2
    bne    LD7C4           ; 2
    ldx    #$09            ; 2
LD7C4:
    txa                    ; 2
    ldy    $F3             ; 3
    ora.wy $0095,Y         ; 4
    sta.wy $0095,Y         ; 5
    ldx    $F2             ; 3
    lda    $EF             ; 3
    sta    $D2,X           ; 4
    lda    #$27            ; 2
;    sta    $D7,X           ; 4
;    jmp    LD963           ; 3
;save 2 bytes
    JMP    MD961
    

LD7DA:
    lda    $B9             ; 3
    and    #$0F            ; 2
    cmp    #$08            ; 2
    bcc    LD813           ; 2
    cmp    #$0B            ; 2
    bcs    LD813           ; 2
    adc    #$01            ; 2
    asl                    ; 2
    asl                    ; 2
    sta    $EF             ; 3
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD7F0:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    beq    LD808           ; 2
    cmp    #$02            ; 2
    beq    LD813           ; 2
    cmp    #$05            ; 2
    beq    LD813           ; 2
    lda    $D2,X           ; 4
    clc                    ; 2
    adc    #$07            ; 2
    cmp    $EF             ; 3
    bcs    LD813           ; 2
LD808:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LD7F0           ; 2
    ldx    #$06            ; 2
;    jmp    LD7C4           ; 3
;save 1 byte
    BNE    LD7C4  ; always branch, crosses page boundary

LD813:
    lda    $A4             ; 3
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda    $A7             ; 3
    and    #$0F            ; 2
    cmp    $EF             ; 3
    bne    LD828           ; 2
    cmp    #$06            ; 2
    bcs    LD828           ; 2
    jmp    LD728           ; 3

LD828:
    jmp    LD855           ; 3

LD82B:
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD82F:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    beq    LD840           ; 2
    cmp    #$08            ; 2
    beq    LD813           ; 2
    lda    $D2,X           ; 4
    cmp    #$14            ; 2
    bcs    LD813           ; 2
LD840:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LD82F           ; 2
    lda    $AA             ; 3
    ora    #$02            ; 2
    sta    $AA             ; 3
    lda    #$1E            ; 2
    sta    $EF             ; 3
    ldx    #$08            ; 2
    jmp    LD7C4           ; 3

LD855:
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    LDB49,X         ; 4
    and    #$04            ; 2
    beq    LD883           ; 2
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD865:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$06            ; 2
    beq    LD886           ; 2
    cmp    #$02            ; 2
    beq    LD8DB           ; 2
    cmp    #$01            ; 2
    bne    LD883           ; 2
    lda    $CC             ; 3
    sec                    ; 2
    sbc    $D2,X           ; 4
    bpl    LD899           ; 2
    lda    $D7,X           ; 4
    cmp    #$14            ; 2
    bcc    LD8CB           ; 2
LD883:
    jmp    LD8E4           ; 3

LD886:
    lda    $D7,X           ; 4
    asl                    ; 2
    asl                    ; 2
    sec                    ; 2
    sbc    $CD             ; 3
    bcc    LD893           ; 2
    cmp    #$0F            ; 2
    bcs    LD883           ; 2
LD893:
    tya                    ; 2
    tax                    ; 2
    inc    $95,X           ; 6
    bne    LD883           ; 2
LD899:
    sta    $EF             ; 3
    lda    $CD             ; 3
    lsr                    ; 2
    lsr                    ; 2
    sec                    ; 2
    sbc    $D7,X           ; 4
    bpl    LD8CB           ; 2
    eor    #$FF            ; 2
    clc                    ; 2
    adc    #$01            ; 2
    sta    $F0             ; 3
    lda    $B3             ; 3
    and    #$0F            ; 2
    cmp    #$01            ; 2
    beq    LD8BB           ; 2
    asl    $F0             ; 5
    cmp    #$02            ; 2
    beq    LD8BB           ; 2
    asl    $F0             ; 5
LD8BB:
    lda    $EF             ; 3
    sec                    ; 2
    sbc    $F0             ; 3
    bpl    LD8C7           ; 2
    eor    #$FF            ; 2
    clc                    ; 2
    adc    #$01            ; 2
LD8C7:
    cmp    #$0A            ; 2
    bcs    LD8E4           ; 2
LD8CB:
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    ora    #$02            ; 2
    sta.wy $0095,Y         ; 5
    lda    $E5             ; 3
    ora    #$20            ; 2
    sta    $E5             ; 3
LD8DB:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bmi    LD8E4           ; 2
;    jmp    LD865           ; 3
;save 1 byte
    BPL    LD865

LD8E4:
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    LDB49,X         ; 4
    and    #$08            ; 2
    beq    LD920           ; 2
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD8F4:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$05            ; 2
    beq    LD945           ; 2
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
LD901:
    bpl    LD8F4           ; 2
    lda    $A1             ; 3
    and    #$0F            ; 2
    cmp    #$04            ; 2
    bne    LD920           ; 2
    lda    $D6             ; 3
    cmp    #$26            ; 2
    bcs    LD920           ; 2
    lda    $DB             ; 3
    cmp    #$09            ; 2
    bcc    LD920           ; 2
    ldx    #$04            ; 2
LD919:
    lda    $D2,X           ; 4
    beq    LD923           ; 2
    dex                    ; 2
    bpl    LD919           ; 2
LD920:
    jmp    LD963           ; 3

LD923:
    txa                    ; 2
    sta    $EF             ; 3
    asl                    ; 2
    adc    $EF             ; 3
    tay                    ; 2
    lda.wy $0095,Y         ; 4
    ora    #$05            ; 2
    sta.wy $0095,Y         ; 5
    lda    $D6             ; 3
    clc                    ; 2
    adc    #$03            ; 2
    sta    $D2,X           ; 4
    lda    $DB             ; 3
    sta    $D7,X           ; 4
    dec    $D7,X           ; 6
    lda    $E4             ; 3
    ora    #$08            ; 2
    sta    $E4             ; 3
LD945:
    inc    $D2,X           ; 6
    dec    $D7,X           ; 6
    lda    $D2,X           ; 4
    cmp    #$2C            ; 2
    bcs    LD955           ; 2
    lda    $D7,X           ; 4
    cmp    #$05            ; 2
    bcs    LD963           ; 2
LD955:
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    sta.wy $0095,Y         ; 5
    lda    #$00            ; 2
    sta    $D2,X           ; 4
MD961:
    sta    $D7,X           ; 4
LD963:
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD967:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$02            ; 2
    bne    LD97E           ; 2
    lda    $D2,X           ; 4
    cmp    #$2C            ; 2
    bcs    LD97B           ; 2
    inc    $D2,X           ; 6
    jmp    LDA27           ; 3

LD97B:
    jmp    LDA17           ; 3

LD97E:
    cmp    #$07            ; 2
    bne    LD9B6           ; 2
    dec    $D2,X           ; 6
    lda    $D2,X           ; 4
    sec                    ; 2
    sbc    #$07            ; 2
    bmi    LD97B           ; 2
    sta    $EF             ; 3
    stx    $F2             ; 3
    sty    $F3             ; 3
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LD995:
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    beq    LD9AA           ; 2
    cmp    #$06            ; 2
    beq    LD9AA           ; 2
    cmp    #$07            ; 2
    beq    LD9AA           ; 2
    lda    $D2,X           ; 4
    cmp    $EF             ; 3
    bcs    LDA13           ; 2
LD9AA:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LD995           ; 2
    ldx    $F2             ; 3
    ldy    $F3             ; 3
    bpl    LDA27           ; 2
LD9B6:
    cmp    #$08            ; 2
    bne    LDA27           ; 2
    lda    $AA             ; 3
    and    #$02            ; 2
    bne    LD9C4           ; 2
    dec    $D2,X           ; 6
    bne    LD9C6           ; 2
LD9C4:
    inc    $D2,X           ; 6
LD9C6:
    lda    $D2,X           ; 4
    cmp    #$2B            ; 2
    bcs    LDA0A           ; 2
    lda    $D1,X           ; 4
    clc                    ; 2
    adc    #$09            ; 2
    cmp    $D2,X           ; 4
    bcs    LDA02           ; 2
    cmp    $CC             ; 3
    bcs    LDA27           ; 2
    lda    $CC             ; 3
    sec                    ; 2
    sbc    $D2,X           ; 4
    bpl    LD9E2           ; 2
    eor    #$FF            ; 2
LD9E2:
    sta    $EF             ; 3
    lda    $CC             ; 3
    cmp    #$27            ; 2
    bcs    LD9F6           ; 2
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$05            ; 2
    bcs    LD9F6           ; 2
    lda    #$0F            ; 2
    bne    LD9F8           ; 2
LD9F6:
    lda    #$08            ; 2
LD9F8:
    cmp    $EF             ; 3
    bcs    LDA27           ; 2
    lda    $CC             ; 3
    cmp    $D2,X           ; 4
    bcc    LDA0A           ; 2
LDA02:
    lda    $AA             ; 3
    ora    #$02            ; 2
    sta    $AA             ; 3
    bne    LDA27           ; 2
LDA0A:
    lda    $AA             ; 3
    and    #$FD            ; 2
    sta    $AA             ; 3
    jmp    LDA27           ; 3

LDA13:
    ldx    $F2             ; 3
    ldy    $F3             ; 3
LDA17:
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    ora    #$0A            ; 2
    sta.wy $0095,Y         ; 5
    lda    $E4             ; 3
    ora    #$40            ; 2
    sta    $E4             ; 3
LDA27:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bmi    LDA30           ; 2
    jmp    LD967           ; 3

LDA30:
    lda    #$00            ; 2
    sta    $F0             ; 3
    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LDA38:
    lda    $D2,X           ; 4
    cmp    $D1,X           ; 4
    bcs    LDA7A           ; 2
    lda    $D1,X           ; 4
    sta    $EF             ; 3
    lda    $D2,X           ; 4
    sta    $D1,X           ; 4
    lda    $EF             ; 3
    sta    $D2,X           ; 4
    lda    $D6,X           ; 4
    sta    $EF             ; 3
    lda    $D7,X           ; 4
    sta    $D6,X           ; 4
    lda    $EF             ; 3
    sta    $D7,X           ; 4
    lda.wy $0092,Y         ; 4
    and    #$0F            ; 2
    sta    $EF             ; 3
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    sta    $F0             ; 3
    lda.wy $0092,Y         ; 4
    and    #$F0            ; 2
    ora    $F0             ; 3
    sta.wy $0092,Y         ; 5
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    ora    $EF             ; 3
    sta.wy $0095,Y         ; 5
    inc    $F0             ; 5
LDA7A:
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bne    LDA38           ; 2
    lda    $F0             ; 3
    bne    LDA30           ; 2
    rts                    ; 6

LDA85:
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    $86             ; 3
    ora    #$04            ; 2
    sta    $86             ; 3
    lda    LDB1D,X         ; 4
    sta    $CA             ; 3
    lda    #$01            ; 2
    sta    $C9             ; 3
    lda    #$FF            ; 2
    sta    $CE             ; 3
    lda    LDADB,X         ; 4
    sta    $C5             ; 3
    tax                    ; 2
    lda    LDB53,X         ; 4
    sta    $C6             ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    asl                    ; 2
    tax                    ; 2
    lda    LDB33,X         ; 4
    sta    $EC             ; 3
    lda    LDB34,X         ; 4
    sta    $ED             ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    cmp    #$0A            ; 2
    bne    LDAC5           ; 2
    lda    LDB68           ; 4
    sta    $CB             ; 3
LDAC5:
    rts                    ; 6

LDAC6:
    lda    $EC             ; 3
    rol    $EC             ; 5
    eor    $EC             ; 3
    ror    $EC             ; 5
    inc    $ED             ; 5
    adc    $ED             ; 3
    bvc    LDAD8           ; 2
    inc    $ED             ; 5
    adc    $ED             ; 3
LDAD8:
    sta    $EC             ; 3
    rts                    ; 6

LDADB:
    .byte $04 ; |     X  | $DADB
    .byte $04 ; |     X  | $DADC
    .byte $02 ; |      X | $DADD
    .byte $04 ; |     X  | $DADE
    .byte $03 ; |      XX| $DADF
    .byte $04 ; |     X  | $DAE0
    .byte $04 ; |     X  | $DAE1
    .byte $02 ; |      X | $DAE2
    .byte $04 ; |     X  | $DAE3
    .byte $03 ; |      XX| $DAE4
    .byte $04 ; |     X  | $DAE5
LDAE6:
    .byte $00 ; |        | $DAE6
    .byte $01 ; |       X| $DAE7
    .byte $03 ; |      XX| $DAE8
    .byte $01 ; |       X| $DAE9
    .byte $01 ; |       X| $DAEA
    .byte $00 ; |        | $DAEB
    .byte $01 ; |       X| $DAEC
    .byte $03 ; |      XX| $DAED
    .byte $01 ; |       X| $DAEE
    .byte $03 ; |      XX| $DAEF
    .byte $01 ; |       X| $DAF0
LDAF1:
    .byte $01 ; |       X| $DAF1
    .byte $01 ; |       X| $DAF2
    .byte $00 ; |        | $DAF3
    .byte $01 ; |       X| $DAF4
    .byte $00 ; |        | $DAF5
    .byte $01 ; |       X| $DAF6
    .byte $01 ; |       X| $DAF7
    .byte $00 ; |        | $DAF8
    .byte $01 ; |       X| $DAF9
    .byte $00 ; |        | $DAFA
    .byte $01 ; |       X| $DAFB
LDAFC:
    .byte $08 ; |    X   | $DAFC
    .byte $08 ; |    X   | $DAFD
    .byte $03 ; |      XX| $DAFE
    .byte $08 ; |    X   | $DAFF
    .byte $03 ; |      XX| $DB00
    .byte $08 ; |    X   | $DB01
    .byte $08 ; |    X   | $DB02
    .byte $03 ; |      XX| $DB03
    .byte $08 ; |    X   | $DB04
    .byte $03 ; |      XX| $DB05
    .byte $08 ; |    X   | $DB06
LDB07:
    .byte $01 ; |       X| $DB07
    .byte $81 ; |X      X| $DB08
    .byte $01 ; |       X| $DB09
    .byte $02 ; |      X | $DB0A
    .byte $83 ; |X     XX| $DB0B
    .byte $81 ; |X      X| $DB0C
    .byte $01 ; |       X| $DB0D
    .byte $03 ; |      XX| $DB0E
    .byte $03 ; |      XX| $DB0F
    .byte $03 ; |      XX| $DB10
    .byte $81 ; |X      X| $DB11
LDB12:
    .byte $11 ; |   X   X| $DB12
    .byte $11 ; |   X   X| $DB13
    .byte $01 ; |       X| $DB14
    .byte $11 ; |   X   X| $DB15
    .byte $11 ; |   X   X| $DB16
    .byte $11 ; |   X   X| $DB17
    .byte $11 ; |   X   X| $DB18
    .byte $11 ; |   X   X| $DB19
    .byte $11 ; |   X   X| $DB1A
    .byte $11 ; |   X   X| $DB1B
    .byte $11 ; |   X   X| $DB1C
LDB1D:
    .byte $82 ; |X     X | $DB1D
    .byte $37 ; |  XX XXX| $DB1E
    .byte $00 ; |        | $DB1F
    .byte $4B ; | X  X XX| $DB20
    .byte $00 ; |        | $DB21
    .byte $6E ; | XX XXX | $DB22
    .byte $46 ; | X   XX | $DB23
    .byte $00 ; |        | $DB24
    .byte $28 ; |  X X   | $DB25
    .byte $00 ; |        | $DB26
    .byte $05 ; |     X X| $DB27
LDB28:
    .byte $BE ; |X XXXXX | $DB28
    .byte $96 ; |X  X XX | $DB29
    .byte $00 ; |        | $DB2A
    .byte $6E ; | XX XXX | $DB2B
    .byte $00 ; |        | $DB2C
    .byte $FF ; |XXXXXXXX| $DB2D
    .byte $32 ; |  XX  X | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $46 ; | X   XX | $DB30
    .byte $00 ; |        | $DB31
    .byte $FF ; |XXXXXXXX| $DB32
LDB33:
    .byte $85 ; |X    X X| $DB33
LDB34:
    .byte $00 ; |        | $DB34
    .byte $7F ; | XXXXXXX| $DB35
    .byte $00 ; |        | $DB36
    .byte $3F ; |  XXXXXX| $DB37
    .byte $00 ; |        | $DB38
    .byte $59 ; | X XX  X| $DB39
    .byte $00 ; |        | $DB3A
    .byte $BF ; |X XXXXXX| $DB3B
    .byte $00 ; |        | $DB3C
    .byte $FE ; |XXXXXXX | $DB3D
    .byte $00 ; |        | $DB3E
    .byte $57 ; | X X XXX| $DB3F
    .byte $00 ; |        | $DB40
    .byte $59 ; | X XX  X| $DB41
    .byte $02 ; |      X | $DB42
    .byte $F7 ; |XXXX XXX| $DB43
    .byte $01 ; |       X| $DB44
    .byte $DA ; |XX XX X | $DB45
    .byte $03 ; |      XX| $DB46
    .byte $FF ; |XXXXXXXX| $DB47
    .byte $02 ; |      X | $DB48
LDB49:
    .byte $00 ; |        | $DB49
    .byte $04 ; |     X  | $DB4A
    .byte $0A ; |    X X | $DB4B
    .byte $0C ; |    XX  | $DB4C
    .byte $0C ; |    XX  | $DB4D
    .byte $09 ; |    X  X| $DB4E
    .byte $0D ; |    XX X| $DB4F
    .byte $02 ; |      X | $DB50
    .byte $0D ; |    XX X| $DB51
    .byte $0C ; |    XX  | $DB52
LDB53:
    .byte $0C ; |    XX  | $DB53
    .byte $26 ; |  X  XX | $DB54
    .byte $1B ; |   XX XX| $DB55
    .byte $10 ; |   X    | $DB56
    .byte $00 ; |        | $DB57
LDB58:
    .byte $00 ; |        | $DB58
    .byte $05 ; |     X X| $DB59
    .byte $06 ; |     XX | $DB5A
    .byte $08 ; |    X   | $DB5B
    .byte $02 ; |      X | $DB5C
    .byte $01 ; |       X| $DB5D
    .byte $04 ; |     X  | $DB5E
    .byte $06 ; |     XX | $DB5F
    .byte $07 ; |     XXX| $DB60
    .byte $08 ; |    X   | $DB61
    .byte $03 ; |      XX| $DB62
    .byte $04 ; |     X  | $DB63
    .byte $01 ; |       X| $DB64
    .byte $00 ; |        | $DB65
    .byte $05 ; |     X X| $DB66
    .byte $07 ; |     XXX| $DB67
LDB68:
    .byte $36 ; |  XX XX | $DB68
    .byte $0F ; |    XXXX| $DB69
    .byte $0F ; |    XXXX| $DB6A
    .byte $21 ; |  X    X| $DB6B
    .byte $70 ; | XXX    | $DB6C
    .byte $60 ; | XX     | $DB6D
    .byte $80 ; |X       | $DB6E
    .byte $60 ; | XX     | $DB6F
    .byte $40 ; | X      | $DB70
    .byte $30 ; |  XX    | $DB71
    .byte $20 ; |  X     | $DB72
    .byte $30 ; |  XX    | $DB73
    .byte $40 ; | X      | $DB74
    .byte $20 ; |  X     | $DB75
    .byte $30 ; |  XX    | $DB76
    .byte $71 ; | XXX   X| $DB77
    .byte $81 ; |X      X| $DB78
    .byte $61 ; | XX    X| $DB79
    .byte $51 ; | X X   X| $DB7A
    .byte $60 ; | XX     | $DB7B
    .byte $81 ; |X      X| $DB7C
    .byte $1F ; |   XXXXX| $DB7D
    .byte $2F ; |  X XXXX| $DB7E
    .byte $30 ; |  XX    | $DB7F
    .byte $96 ; |X  X XX | $DB80
    .byte $76 ; | XXX XX | $DB81
    .byte $48 ; | X  X   | $DB82
    .byte $8F ; |X   XXXX| $DB83
    .byte $64 ; | XX  X  | $DB84
    .byte $74 ; | XXX X  | $DB85
    .byte $91 ; |X  X   X| $DB86
    .byte $53 ; | X X  XX| $DB87
    .byte $40 ; | X      | $DB88
    .byte $50 ; | X X    | $DB89
    .byte $32 ; |  XX  X | $DB8A
    .byte $23 ; |  X   XX| $DB8B
    .byte $40 ; | X      | $DB8C
    .byte $50 ; | X X    | $DB8D
    .byte $62 ; | XX   X | $DB8E
    .byte $81 ; |X      X| $DB8F
    .byte $70 ; | XXX    | $DB90
    .byte $61 ; | XX    X| $DB91
    .byte $90 ; |X  X    | $DB92
    .byte $70 ; | XXX    | $DB93
    .byte $51 ; | X X   X| $DB94
    .byte $82 ; |X     X | $DB95
    .byte $92 ; |X  X  X | $DB96
    .byte $60 ; | XX     | $DB97
    .byte $70 ; | XXX    | $DB98
    .byte $40 ; | X      | $DB99
    .byte $30 ; |  XX    | $DB9A
    .byte $40 ; | X      | $DB9B
    .byte $1F ; |   XXXXX| $DB9C
    .byte $20 ; |  X     | $DB9D
    .byte $1F ; |   XXXXX| $DB9E
    .byte $FF ; |XXXXXXXX| $DB9F
    .byte $FF ; |XXXXXXXX| $DBA0
    .byte $FF ; |XXXXXXXX| $DBA1
    .byte $FF ; |XXXXXXXX| $DBA2
    .byte $FF ; |XXXXXXXX| $DBA3
    .byte $FF ; |XXXXXXXX| $DBA4
    .byte $FF ; |XXXXXXXX| $DBA5
    .byte $FF ; |XXXXXXXX| $DBA6
    .byte $FF ; |XXXXXXXX| $DBA7
    .byte $FF ; |XXXXXXXX| $DBA8
    .byte $FF ; |XXXXXXXX| $DBA9
    .byte $FF ; |XXXXXXXX| $DBAA
    .byte $FF ; |XXXXXXXX| $DBAB
    .byte $FF ; |XXXXXXXX| $DBAC
    .byte $FF ; |XXXXXXXX| $DBAD
    .byte $FF ; |XXXXXXXX| $DBAE
    .byte $FF ; |XXXXXXXX| $DBAF
    .byte $FF ; |XXXXXXXX| $DBB0
    .byte $FF ; |XXXXXXXX| $DBB1
    .byte $FF ; |XXXXXXXX| $DBB2
    .byte $FF ; |XXXXXXXX| $DBB3
    .byte $FF ; |XXXXXXXX| $DBB4
    .byte $FF ; |XXXXXXXX| $DBB5
    .byte $FF ; |XXXXXXXX| $DBB6
    .byte $FF ; |XXXXXXXX| $DBB7
    .byte $FF ; |XXXXXXXX| $DBB8
    .byte $FF ; |XXXXXXXX| $DBB9
    .byte $FF ; |XXXXXXXX| $DBBA
    .byte $FF ; |XXXXXXXX| $DBBB
    .byte $FF ; |XXXXXXXX| $DBBC
    .byte $FF ; |XXXXXXXX| $DBBD
    .byte $FF ; |XXXXXXXX| $DBBE
    .byte $FF ; |XXXXXXXX| $DBBF
    .byte $FF ; |XXXXXXXX| $DBC0
    .byte $FF ; |XXXXXXXX| $DBC1
    .byte $FF ; |XXXXXXXX| $DBC2
    .byte $FF ; |XXXXXXXX| $DBC3
    .byte $FF ; |XXXXXXXX| $DBC4
    .byte $FF ; |XXXXXXXX| $DBC5
    .byte $FF ; |XXXXXXXX| $DBC6
    .byte $FF ; |XXXXXXXX| $DBC7
    .byte $FF ; |XXXXXXXX| $DBC8
    .byte $FF ; |XXXXXXXX| $DBC9
    .byte $FF ; |XXXXXXXX| $DBCA
    .byte $FF ; |XXXXXXXX| $DBCB
    .byte $FF ; |XXXXXXXX| $DBCC
    .byte $FF ; |XXXXXXXX| $DBCD
    .byte $FF ; |XXXXXXXX| $DBCE
    .byte $FF ; |XXXXXXXX| $DBCF
    .byte $FF ; |XXXXXXXX| $DBD0
    .byte $FF ; |XXXXXXXX| $DBD1
    .byte $FF ; |XXXXXXXX| $DBD2
    .byte $FF ; |XXXXXXXX| $DBD3
    .byte $FF ; |XXXXXXXX| $DBD4
    .byte $FF ; |XXXXXXXX| $DBD5
    .byte $FF ; |XXXXXXXX| $DBD6
    .byte $FF ; |XXXXXXXX| $DBD7
    .byte $FF ; |XXXXXXXX| $DBD8
    .byte $FF ; |XXXXXXXX| $DBD9
    .byte $FF ; |XXXXXXXX| $DBDA
    .byte $FF ; |XXXXXXXX| $DBDB
    .byte $FF ; |XXXXXXXX| $DBDC
    .byte $FF ; |XXXXXXXX| $DBDD
    .byte $FF ; |XXXXXXXX| $DBDE
    .byte $FF ; |XXXXXXXX| $DBDF
    .byte $FF ; |XXXXXXXX| $DBE0
    .byte $FF ; |XXXXXXXX| $DBE1
    .byte $FF ; |XXXXXXXX| $DBE2
    .byte $FF ; |XXXXXXXX| $DBE3
    .byte $FF ; |XXXXXXXX| $DBE4
    .byte $FF ; |XXXXXXXX| $DBE5
    .byte $FF ; |XXXXXXXX| $DBE6
    .byte $FF ; |XXXXXXXX| $DBE7
    .byte $FF ; |XXXXXXXX| $DBE8
    .byte $FF ; |XXXXXXXX| $DBE9
    .byte $FF ; |XXXXXXXX| $DBEA
    .byte $FF ; |XXXXXXXX| $DBEB
    .byte $FF ; |XXXXXXXX| $DBEC
    .byte $FF ; |XXXXXXXX| $DBED
    .byte $FF ; |XXXXXXXX| $DBEE
    .byte $FF ; |XXXXXXXX| $DBEF
    .byte $FF ; |XXXXXXXX| $DBF0
    .byte $FF ; |XXXXXXXX| $DBF1
    .byte $FF ; |XXXXXXXX| $DBF2
    .byte $FF ; |XXXXXXXX| $DBF3
    .byte $FF ; |XXXXXXXX| $DBF4
    .byte $FF ; |XXXXXXXX| $DBF5
    .byte $FF ; |XXXXXXXX| $DBF6
    .byte $FF ; |XXXXXXXX| $DBF7
    .byte $FF ; |XXXXXXXX| $DBF8
    .byte $FF ; |XXXXXXXX| $DBF9
    .byte $FF ; |XXXXXXXX| $DBFA
    .byte $FF ; |XXXXXXXX| $DBFB
    .byte $FF ; |XXXXXXXX| $DBFC
    .byte $FF ; |XXXXXXXX| $DBFD
    .byte $FF ; |XXXXXXXX| $DBFE
    .byte $FF ; |XXXXXXXX| $DBFF
LDC00:
    .byte $A9 ; |X X X  X| $DC00
    .byte $17 ;.SLO        ; 6
    sta    TIM64T          ; 4
    lda    $C4             ; 3
    and    #$03            ; 2
    bne    LDC5F           ; 2
    lda    $89             ; 3
    and    #$02            ; 2
    bne    LDC5F           ; 2
    lda    CXP0FB          ; 3
    and    #$C0            ; 2
    bne    LDC34           ; 2
    lda    CXPPMM          ; 3
    and    #$80            ; 2
    beq    LDC5F           ; 2
    lda    $CC             ; 3
    sta    $FB             ; 3
    jsr    $F1EC           ; 6
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$0C            ; 2
    bcs    LDC5F           ; 2
LDC2D:
    cmp    #$09            ; 2
    beq    LDC56           ; 2
    jsr    $F25A           ; 6
LDC34:
    lda    $8C             ; 3
    and    #$F0            ; 2
    ora    #$02            ; 2
    sta    $8C             ; 3
    lda    $89             ; 3
    ora    #$02            ; 2
    sta    $89             ; 3
    lda    $BC             ; 3
    and    #$F7            ; 2
    sta    $BC             ; 3
    lda    #$00            ; 2
    sta    $E2             ; 3
    sta    $E3             ; 3
    sta    $E5             ; 3
    lda    #$40            ; 2
    sta    $E4             ; 3
    bne    LDC5F           ; 2
LDC56:
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LDC5F           ; 2
    jmp    $F27C           ; 3

LDC5F:
    lda    CXM0P           ; 3
    and    #$80            ; 2
    beq    LDC91           ; 2
    lda    $CE             ; 3
    sta    $FB             ; 3
    jsr    $F1EC           ; 6
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$03            ; 2
    bne    LDC88           ; 2
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    $C3             ; 3
    clc                    ; 2
    adc    $F901,X         ; 4
    cmp    #$2B            ; 2
    bcc    LDC86           ; 2
    lda    #$2A            ; 2
LDC86:
    sta    $C3             ; 3
LDC88:
    jsr    $F25A           ; 6
    lda    #$FF            ; 2
    sta    $CE             ; 3
    bne    LDCA1           ; 2
LDC91:
    lda    CXM0FB          ; 3
    and    #$80            ; 2
    beq    LDCA1           ; 2
    lda    #$FF            ; 2
    sta    $CE             ; 3
    lda    $E4             ; 3
    ora    #$10            ; 2
    sta    $E4             ; 3
LDCA1:
    lda    CXP1FB          ; 3
    and    #$40            ; 2
    beq    LDCCF           ; 2
    lda    $D0             ; 3
    sta    $FB             ; 3
    jsr    $F1EC           ; 6
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$03            ; 2
    bne    LDCCA           ; 2
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    $C3             ; 3
    clc                    ; 2
    adc    $F901,X         ; 4
    cmp    #$2B            ; 2
    bcc    LDCC8           ; 2
    lda    #$2A            ; 2
LDCC8:
    sta    $C3             ; 3
LDCCA:
    jsr    $F25A           ; 6
    bne    LDCD5           ; 2
LDCCF:
    lda    CXBLPF          ; 3
    and    #$80            ; 2
    beq    LDCDF           ; 2
LDCD5:
    lda    #$FF            ; 2
    sta    $D0             ; 3
    lda    $E4             ; 3
    ora    #$10            ; 2
    sta    $E4             ; 3
LDCDF:
    lda    $BC             ; 3
    and    #$08            ; 2
    beq    LDCE8           ; 2
    jmp    $F2B3           ; 3

LDCE8:
    ldx    #$00            ; 2
    jsr    $F17B           ; 6
    lda    $E2,X           ; 4
    beq    LDD0B           ; 2
    ldy    $E0             ; 3
    lda    $FD00,Y         ; 4
    sta    $F4             ; 3
    lda    $FD01,Y         ; 4
    sta    $F5             ; 3
    lda    $E4,X           ; 4
    beq    LDD08           ; 2
LDD01:
    jsr    $F19D           ; 6
    lda    #$00            ; 2
    sta    $E4,X           ; 4
LDD08:
    jsr    $F1B9           ; 6
LDD0B:
    inx                    ; 2
    jsr    $F17B           ; 6
    lda    $E2,X           ; 4
LDD11:
    beq    LDD30           ; 2
    ldy    $E1             ; 3
    lda    $FD10,Y         ; 4
    sta    $F4             ; 3
    lda    $FD11,Y         ; 4
    sta    $F5             ; 3
    lda    $E4,X           ; 4
    beq    LDD2A           ; 2
    jsr    $F19D           ; 6
    lda    #$00            ; 2
    sta    $E4,X           ; 4
LDD2A:
    jsr    $F1B9           ; 6
    jmp    $F156           ; 3

LDD30:
    lda    $86             ; 3
    and    #$08            ; 2
    sta    AUDV1           ; 3
    lda    #$0E            ; 2
    sta    AUDC1           ; 3
    lda    $89             ; 3
    and    #$04            ; 2
    beq    LDD46           ; 2
    lda    #$1F            ; 2
    sta    AUDF1           ; 3
    bne    LDD56           ; 2
LDD46:
    lda    $89             ; 3
    and    #$08            ; 2
    beq    LDD52           ; 2
    lda    #$10            ; 2
    sta    AUDF1           ; 3
    bne    LDD56           ; 2
LDD52:
    lda    #$16            ; 2
    sta    AUDF1           ; 3
LDD56:
    lda    INTIM           ; 4
    bne    LDD56           ; 2
    sta    WSYNC           ; 3
    lda    #$02            ; 2
    sta    VBLANK          ; 3
    sta    VSYNC           ; 3
    lda    #$2C            ; 2
    sta    TIM8T           ; 4
LDD68:
    lda    INTIM           ; 4
    bne    LDD68           ; 2
    lda    #$00            ; 2
    sta    WSYNC           ; 3
    sta    VSYNC           ; 3
    lda    #$2C            ; 2
    sta    TIM64T          ; 4
    jmp    $FC39           ; 3

    ldy    #$07            ; 2
    lda    #$80            ; 2
    sta    $EF             ; 3
LDD81:
    lda    $EF             ; 3
    and    $E4,X           ; 4
    bne    LDD8D           ; 2
    lsr    $EF             ; 5
    dey                    ; 2
    bpl    LDD81           ; 2
    rts                    ; 6

LDD8D:
    cmp    $E2,X           ; 4
    bcc    LDD98           ; 2
    sta    $E2,X           ; 4
    tya                    ; 2
    asl                    ; 2
    sta    $E0,X           ; 4
    rts                    ; 6

LDD98:
    lda    #$00            ; 2
    sta    $E4,X           ; 4
    rts                    ; 6

    ldy    #$00            ; 2
    lda    ($F4),Y         ; 5
    tay                    ; 2
    lda    ($F4),Y         ; 5
    sta    $DC,X           ; 4
    dey                    ; 2
    lda    ($F4),Y         ; 5
    sta    AUDF0,X         ; 4
    dey                    ; 2
    lda    ($F4),Y         ; 5
    sta    AUDV0,X         ; 4
    dey                    ; 2
    lda    ($F4),Y         ; 5
    sta    AUDC0,X         ; 4
    dey                    ; 2
    sty    $DE,X           ; 4
    rts                    ; 6

    ldy    $DE,X           ; 4
    bne    LDDC8           ; 2
    lda    #$00            ; 2
    sta    AUDV0,X         ; 4
    sta    $E2,X           ; 4
    lda    #$FF            ; 2
    sta    $E0,X           ; 4
    rts                    ; 6

LDDC8:
    lda    $DC,X           ; 4
    and    #$01            ; 2
    beq    LDDD3           ; 2
    lda    ($F4),Y         ; 5
    sta    AUDF0,X         ; 4
    dey                    ; 2
LDDD3:
    lda    $DC,X           ; 4
    and    #$02            ; 2
    beq    LDDDE           ; 2
    lda    ($F4),Y         ; 5
    sta    AUDV0,X         ; 4
    dey                    ; 2
LDDDE:
    lda    $DC,X           ; 4
    and    #$04            ; 2
    beq    LDDE9           ; 2
    lda    ($F4),Y         ; 5
    sta    AUDC0,X         ; 4
    dey                    ; 2
LDDE9:
    sty    $DE,X           ; 4
    rts                    ; 6

    lda    #$FF            ; 2
    sta    $FA             ; 3
    ldx    #$04            ; 2
LDDF2:
    lda    $D2,X           ; 4
    beq    LDE08           ; 2
    sec                    ; 2
    sbc    $FB             ; 3
    bpl    LDE00           ; 2
    eor    #$FF            ; 2
    clc                    ; 2
    adc    #$01            ; 2
LDE00:
    cmp    $FA             ; 3
    bcs    LDE08           ; 2
    sta    $FA             ; 3
    txa                    ; 2
    tay                    ; 2
LDE08:
    dex                    ; 2
    bpl    LDDF2           ; 2
    tya                    ; 2
    sta    $FB             ; 3
    tax                    ; 2
    asl                    ; 2
    adc    $FB             ; 3
    tay                    ; 2
    sty    $EE             ; 3
    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$01            ; 2
    beq    LDE36           ; 2
    cmp    #$02            ; 2
    beq    LDE36           ; 2
    cmp    #$04            ; 2
    beq    LDE40           ; 2
    cmp    #$06            ; 2
    beq    LDE36           ; 2
    cmp    #$07            ; 2
    beq    LDE40           ; 2
    cmp    #$09            ; 2
    beq    LDE4A           ; 2
    cmp    #$08            ; 2
    bne    LDE57           ; 2
LDE36:
    lda    #$50            ; 2
    ldy    #$00            ; 2
    jsr    $FCE2           ; 6
    jmp    $F257           ; 3

LDE40:
    lda    #$00            ; 2
    ldy    #$01            ; 2
    jsr    $FCE2           ; 6
    jmp    $F257           ; 3

LDE4A:
    lda    $BC             ; 3
    and    #$01            ; 2
    bne    LDE57           ; 2
    lda    #$00            ; 2
    ldy    #$50            ; 2
    jsr    $FCE2           ; 6
LDE57:
    ldy    $EE             ; 3
    rts                    ; 6

    lda.wy $0095,Y         ; 4
    and    #$0F            ; 2
    cmp    #$04            ; 2
    beq    LDE67           ; 2
    lda    #$0A            ; 2
    bne    LDE69           ; 2
LDE67:
    lda    #$0D            ; 2
LDE69:
    sta    $FB             ; 3
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    ora    $FB             ; 3
    sta.wy $0095,Y         ; 5
    lda    $E4             ; 3
    ora    #$40            ; 2
    sta    $E4             ; 3
    rts                    ; 6

    ldx    #$04            ; 2
    ldy    #$0C            ; 2
LDE80:
    lda    #$00            ; 2
    sta    $D2,X           ; 4
    sta    $D7,X           ; 4
    lda.wy $0095,Y         ; 4
    and    #$F0            ; 2
    sta.wy $0095,Y         ; 5
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    dex                    ; 2
    bpl    LDE80           ; 2
    lda    $CC             ; 3
    sec                    ; 2
    sbc    #$01            ; 2
    sta    $D6             ; 3
    lda    $CD             ; 3
    lsr                    ; 2
    lsr                    ; 2
    clc                    ; 2
    adc    #$01            ; 2
    sta    $DB             ; 3
    lda    $A1             ; 3
    ora    #$09            ; 2
    sta    $A1             ; 3
    lda    $BC             ; 3
    ora    #$01            ; 2
    sta    $BC             ; 3
    jmp    $F0DF           ; 3

    ldx    #$01            ; 2
LDEB5:
    ldy    $DC,X           ; 4
    beq    LDF03           ; 2
    lda    $E0,X           ; 4
    beq    LDEC3           ; 2
    dec    $E0,X           ; 6
    lda    $E0,X           ; 4
    sta    AUDV0,X         ; 4
LDEC3:
    dec    $DE,X           ; 6
    bne    LDF03           ; 2
LDEC7:
    lda    $F31F,Y         ; 4
    beq    LDEFD           ; 2
    iny                    ; 2
    sty    $DC,X           ; 4
    cmp    #$20            ; 2
    bcc    LDEE5           ; 2
    sta    AUDF0,X         ; 4
    and    #$E0            ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    sta    $DE,X           ; 4
    lda    $E2,X           ; 4
    sta    $E0,X           ; 4
    sta    AUDV0,X         ; 4
    jmp    $F303           ; 3

LDEE5:
    lda    $F31F,Y         ; 4
    sta    $E0,X           ; 4
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    sta    AUDC0,X         ; 4
    lda    $E0,X           ; 4
    and    #$0F            ; 2
    sta    $E0,X           ; 4
    sta    $E2,X           ; 4
    sta    AUDV0,X         ; 4
    iny                    ; 2
    bne    LDEC7           ; 2
LDEFD:
    lda    #$00            ; 2
    sta    AUDV0,X         ; 4
    sta    $DC,X           ; 4
LDF03:
    dex                    ; 2
    bpl    LDEB5           ; 2
    lda    $DC             ; 3
    ora    $DD             ; 3
    bne    LDF1C           ; 2
    lda    $BC             ; 3
    and    #$F7            ; 2
    sta    $BC             ; 3
    .byte $A9 ; |X X X  X| $DF12
    .byte $00 ; |        | $DF13
    .byte $85 ; |X    X X| $DF14
    .byte $E4 ; |XXX  X  | $DF15
    .byte $85 ; |X    X X| $DF16
    .byte $E5 ; |XXX  X X| $DF17
    .byte $85 ; |X    X X| $DF18
    .byte $E2 ; |XXX   X | $DF19
    .byte $85 ; |X    X X| $DF1A
    .byte $E3 ; |XXX   XX| $DF1B
LDF1C:
    .byte $4C ; | X  XX  | $DF1C
    .byte $56 ; | X X XX | $DF1D
    .byte $F1 ; |XXXX   X| $DF1E
    .byte $00 ; |        | $DF1F
    .byte $01 ; |       X| $DF20
    .byte $48 ; | X  X   | $DF21
    .byte $57 ; | X X XXX| $DF22
    .byte $56 ; | X X XX | $DF23
    .byte $57 ; | X X XXX| $DF24
    .byte $53 ; | X X  XX| $DF25
    .byte $57 ; | X X XXX| $DF26
    .byte $56 ; | X X XX | $DF27
    .byte $57 ; | X X XXX| $DF28
    .byte $53 ; | X X  XX| $DF29
    .byte $57 ; | X X XXX| $DF2A
    .byte $56 ; | X X XX | $DF2B
    .byte $57 ; | X X XXX| $DF2C
    .byte $53 ; | X X  XX| $DF2D
    .byte $57 ; | X X XXX| $DF2E
    .byte $56 ; | X X XX | $DF2F
    .byte $57 ; | X X XXX| $DF30
    .byte $53 ; | X X  XX| $DF31
    .byte $4B ; | X  X XX| $DF32
    .byte $4A ; | X  X X | $DF33
    .byte $4B ; | X  X XX| $DF34
    .byte $49 ; | X  X  X| $DF35
    .byte $4B ; | X  X XX| $DF36
    .byte $4A ; | X  X X | $DF37
    .byte $4B ; | X  X XX| $DF38
    .byte $49 ; | X  X  X| $DF39
    .byte $4B ; | X  X XX| $DF3A
    .byte $4A ; | X  X X | $DF3B
    .byte $4B ; | X  X XX| $DF3C
    .byte $49 ; | X  X  X| $DF3D
    .byte $4B ; | X  X XX| $DF3E
    .byte $4A ; | X  X X | $DF3F
    .byte $4B ; | X  X XX| $DF40
    .byte $49 ; | X  X  X| $DF41
    .byte $CB ; |XX  X XX| $DF42
    .byte $2B ; |  X X XX| $DF43
    .byte $2B ; |  X X XX| $DF44
    .byte $CB ; |XX  X XX| $DF45
    .byte $2B ; |  X X XX| $DF46
    .byte $2B ; |  X X XX| $DF47
    .byte $4B ; | X  X XX| $DF48
    .byte $4E ; | X  XXX | $DF49
    .byte $4B ; | X  X XX| $DF4A
    .byte $49 ; | X  X  X| $DF4B
    .byte $4B ; | X  X XX| $DF4C
    .byte $4E ; | X  XXX | $DF4D
    .byte $4B ; | X  X XX| $DF4E
    .byte $4E ; | X  XXX | $DF4F
    .byte $4B ; | X  X XX| $DF50
    .byte $49 ; | X  X  X| $DF51
    .byte $4B ; | X  X XX| $DF52
    .byte $4E ; | X  XXX | $DF53
    .byte $4B ; | X  X XX| $DF54
    .byte $4E ; | X  XXX | $DF55
    .byte $4B ; | X  X XX| $DF56
    .byte $49 ; | X  X  X| $DF57
    .byte $4B ; | X  X XX| $DF58
    .byte $4E ; | X  XXX | $DF59
    .byte $89 ; |X   X  X| $DF5A
    .byte $00 ; |        | $DF5B
    .byte $01 ; |       X| $DF5C
    .byte $18 ; |   XX   | $DF5D
    .byte $4D ; | X  XX X| $DF5E
    .byte $4C ; | X  XX  | $DF5F
    .byte $4D ; | X  XX X| $DF60
    .byte $4B ; | X  X XX| $DF61
    .byte $4D ; | X  XX X| $DF62
    .byte $4C ; | X  XX  | $DF63
    .byte $4D ; | X  XX X| $DF64
    .byte $4B ; | X  X XX| $DF65
    .byte $4D ; | X  XX X| $DF66
    .byte $4C ; | X  XX  | $DF67
    .byte $4D ; | X  XX X| $DF68
    .byte $4B ; | X  X XX| $DF69
    .byte $4D ; | X  XX X| $DF6A
    .byte $4C ; | X  XX  | $DF6B
    .byte $4D ; | X  XX X| $DF6C
    .byte $4B ; | X  X XX| $DF6D
    .byte $01 ; |       X| $DF6E
    .byte $48 ; | X  X   | $DF6F
    .byte $5A ; | X XX X | $DF70
    .byte $58 ; | X XX   | $DF71
    .byte $5A ; | X XX X | $DF72
    .byte $56 ; | X X XX | $DF73
    .byte $5A ; | X XX X | $DF74
    .byte $58 ; | X XX   | $DF75
    .byte $5A ; | X XX X | $DF76
    .byte $56 ; | X X XX | $DF77
    .byte $5A ; | X XX X | $DF78
    .byte $58 ; | X XX   | $DF79
    .byte $5A ; | X XX X | $DF7A
    .byte $56 ; | X X XX | $DF7B
    .byte $5A ; | X XX X | $DF7C
    .byte $58 ; | X XX   | $DF7D
    .byte $5A ; | X XX X | $DF7E
    .byte $56 ; | X X XX | $DF7F
    .byte $CE ; |XX  XXX | $DF80
    .byte $2E ; |  X XXX | $DF81
    .byte $2E ; |  X XXX | $DF82
    .byte $CE ; |XX  XXX | $DF83
    .byte $2E ; |  X XXX | $DF84
    .byte $2E ; |  X XXX | $DF85
    .byte $4E ; | X  XXX | $DF86
    .byte $53 ; | X X  XX| $DF87
    .byte $4E ; | X  XXX | $DF88
    .byte $4B ; | X  X XX| $DF89
    .byte $4E ; | X  XXX | $DF8A
    .byte $53 ; | X X  XX| $DF8B
    .byte $4E ; | X  XXX | $DF8C
    .byte $53 ; | X X  XX| $DF8D
    .byte $4E ; | X  XXX | $DF8E
    .byte $4B ; | X  X XX| $DF8F
    .byte $4E ; | X  XXX | $DF90
    .byte $53 ; | X X  XX| $DF91
    .byte $4E ; | X  XXX | $DF92
    .byte $53 ; | X X  XX| $DF93
    .byte $4E ; | X  XXX | $DF94
    .byte $4B ; | X  X XX| $DF95
    .byte $4E ; | X  XXX | $DF96
    .byte $53 ; | X X  XX| $DF97
    .byte $8B ; |X   X XX| $DF98
    .byte $00 ; |        | $DF99
    .byte $01 ; |       X| $DF9A
    .byte $48 ; | X  X   | $DF9B
    .byte $9D ; |X  XXX X| $DF9C
    .byte $97 ; |X  X XXX| $DF9D
    .byte $93 ; |X  X  XX| $DF9E
    .byte $53 ; | X X  XX| $DF9F
    .byte $53 ; | X X  XX| $DFA0
    .byte $51 ; | X X   X| $DFA1
    .byte $4F ; | X  XXXX| $DFA2
    .byte $4E ; | X  XXX | $DFA3
    .byte $4C ; | X  XX  | $DFA4
    .byte $8B ; |X   X XX| $DFA5
    .byte $8E ; |X   XXX | $DFA6
    .byte $8A ; |X   X X | $DFA7
    .byte $4A ; | X  X X | $DFA8
    .byte $4A ; | X  X X | $DFA9
    .byte $8B ; |X   X XX| $DFAA
    .byte $49 ; | X  X  X| $DFAB
    .byte $4A ; | X  X X | $DFAC
    .byte $8B ; |X   X XX| $DFAD
    .byte $8C ; |X   XX  | $DFAE
    .byte $8E ; |X   XXX | $DFAF
    .byte $00 ; |        | $DFB0
    .byte $01 ; |       X| $DFB1
    .byte $17 ; |   X XXX| $DFB2
    .byte $91 ; |X  X   X| $DFB3
    .byte $8D ; |X   XX X| $DFB4
    .byte $8B ; |X   X XX| $DFB5
    .byte $4B ; | X  X XX| $DFB6
    .byte $4B ; | X  X XX| $DFB7
    .byte $01 ; |       X| $DFB8
    .byte $C7 ; |XX   XXX| $DFB9
    .byte $59 ; | X XX  X| $DFBA
    .byte $57 ; | X X XXX| $DFBB
    .byte $55 ; | X X X X| $DFBC
    .byte $53 ; | X X  XX| $DFBD
    .byte $91 ; |X  X   X| $DFBE
    .byte $95 ; |X  X X X| $DFBF
    .byte $99 ; |X  XX  X| $DFC0
    .byte $59 ; | X XX  X| $DFC1
    .byte $59 ; | X XX  X| $DFC2
    .byte $9D ; |X  XXX X| $DFC3
    .byte $5F ; | X XXXXX| $DFC4
    .byte $59 ; | X XX  X| $DFC5
    .byte $9D ; |X  XXX X| $DFC6
    .byte $01 ; |       X| $DFC7
    .byte $17 ; |   X XXX| $DFC8
    .byte $8B ; |X   X XX| $DFC9
    .byte $8F ; |X   XXXX| $DFCA
    .byte $00 ; |        | $DFCB
    .byte $FF ; |XXXXXXXX| $DFCC
    .byte $FF ; |XXXXXXXX| $DFCD
    .byte $FF ; |XXXXXXXX| $DFCE
    .byte $FF ; |XXXXXXXX| $DFCF
    .byte $FF ; |XXXXXXXX| $DFD0
    .byte $FF ; |XXXXXXXX| $DFD1
    .byte $FF ; |XXXXXXXX| $DFD2
    .byte $FF ; |XXXXXXXX| $DFD3
    .byte $FF ; |XXXXXXXX| $DFD4
    .byte $FF ; |XXXXXXXX| $DFD5
    .byte $FF ; |XXXXXXXX| $DFD6
    .byte $FF ; |XXXXXXXX| $DFD7
    .byte $FF ; |XXXXXXXX| $DFD8
    .byte $FF ; |XXXXXXXX| $DFD9
    .byte $FF ; |XXXXXXXX| $DFDA
    .byte $FF ; |XXXXXXXX| $DFDB
    .byte $FF ; |XXXXXXXX| $DFDC
    .byte $FF ; |XXXXXXXX| $DFDD
    .byte $FF ; |XXXXXXXX| $DFDE
    .byte $FF ; |XXXXXXXX| $DFDF
    .byte $FF ; |XXXXXXXX| $DFE0
    .byte $FF ; |XXXXXXXX| $DFE1
    .byte $FF ; |XXXXXXXX| $DFE2
    .byte $FF ; |XXXXXXXX| $DFE3
    .byte $FF ; |XXXXXXXX| $DFE4
    .byte $FF ; |XXXXXXXX| $DFE5
    .byte $FF ; |XXXXXXXX| $DFE6
    .byte $FF ; |XXXXXXXX| $DFE7
    .byte $FF ; |XXXXXXXX| $DFE8
    .byte $FF ; |XXXXXXXX| $DFE9
    .byte $FF ; |XXXXXXXX| $DFEA
    .byte $FF ; |XXXXXXXX| $DFEB
    .byte $FF ; |XXXXXXXX| $DFEC
    .byte $FF ; |XXXXXXXX| $DFED
    .byte $FF ; |XXXXXXXX| $DFEE
    .byte $FF ; |XXXXXXXX| $DFEF
    .byte $FF ; |XXXXXXXX| $DFF0
    .byte $FF ; |XXXXXXXX| $DFF1
    .byte $FF ; |XXXXXXXX| $DFF2
    .byte $FF ; |XXXXXXXX| $DFF3
    .byte $FF ; |XXXXXXXX| $DFF4
    .byte $FF ; |XXXXXXXX| $DFF5
    .byte $FF ; |XXXXXXXX| $DFF6
    .byte $FF ; |XXXXXXXX| $DFF7
    .byte $FF ; |XXXXXXXX| $DFF8
    .byte $FF ; |XXXXXXXX| $DFF9
    .byte $FF ; |XXXXXXXX| $DFFA
    .byte $FF ; |XXXXXXXX| $DFFB
    .byte $FF ; |XXXXXXXX| $DFFC
    .byte $FF ; |XXXXXXXX| $DFFD
    .byte $FF ; |XXXXXXXX| $DFFE
    .byte $FF ; |XXXXXXXX| $DFFF

        ORG $2000
       RORG $F000
       

LF000:
    lda    INTIM           ; 4
    bne    LF000           ; 2
    sta    WSYNC           ; 3
    sta    VBLANK          ; 3
    lda    $C2             ; 3
    sta    COLUPF          ; 3
    sta    COLUBK          ; 3
    ldx    #$18            ; 2
    stx    COLUP0          ; 3
    stx    COLUP1          ; 3
    nop                    ; 2
    nop                    ; 2
    ldx    #$00            ; 2
    stx    HMP0            ; 3
    lda    #$10            ; 2
    sta    HMP1            ; 3
    lda    #$06            ; 2
    sta    RESP0           ; 3
    sta    RESP1           ; 3
    sta    $FB             ; 3
    ldy    #$0A            ; 2
LF029:
    lda    $E6,X           ; 4
    and    #$0F            ; 2
    sta.wy $00EE,Y         ; 5
    dey                    ; 2
    dey                    ; 2
    lda    $E6,X           ; 4
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    sta.wy $00EE,Y         ; 5
    inx                    ; 2
    dey                    ; 2
    dey                    ; 2
    bpl    LF029           ; 2
    sta    WSYNC           ; 3
    ldy    #$00            ; 2
    lda    #$0A            ; 2
    sta    $FA             ; 3
LF048:
    lda.wy $00EE,Y         ; 4
    clc                    ; 2
    adc    $EA             ; 3
    bne    LF059           ; 2
    cpy    #$0A            ; 2
    beq    LF059           ; 2
    lda    $FA             ; 3
    jmp    LF05D           ; 3

LF059:
    ldx    #$00            ; 2
    stx    $FA             ; 3
LF05D:
    tax                    ; 2
    lda    LF800,X         ; 4
    sta.wy $00EE,Y         ; 5
    lda    #$F8            ; 2
    sta.wy $00EF,Y         ; 5
    iny                    ; 2
    iny                    ; 2
    cpy    #$0C            ; 2
    bne    LF048           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$03            ; 2
    sta    NUSIZ0          ; 3
    sta    NUSIZ1          ; 3
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    lda    #$00            ; 2
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    ldy    #$05            ; 2
LF085:
    dey                    ; 2
    bne    LF085           ; 2
LF088:
    ldy    $FB             ; 3
    lda    ($EE),Y         ; 5
    sta    GRP0            ; 3
    sta    WSYNC           ; 3
    lda    ($F0),Y         ; 5
    sta    GRP1            ; 3
    lda    ($F2),Y         ; 5
    sta    GRP0            ; 3
    lda    ($F4),Y         ; 5
    sta    $FA             ; 3
    lda    ($F6),Y         ; 5
    tax                    ; 2
    lda    ($F8),Y         ; 5
    tay                    ; 2
    lda    $FA             ; 3
    sta    GRP1            ; 3
    stx    GRP0            ; 3
    sty    GRP1            ; 3
    sty    GRP0            ; 3
    dec    $FB             ; 5
    bpl    LF088           ; 2
    jsr    LFC43           ; 6
    lda    $CF             ; 3
    jsr    LF768           ; 6
    sta    WSYNC           ; 3
    lda    #$DB            ; 2
    sta    PF1             ; 3
    lda    #$B6            ; 2
    sta    PF2             ; 3
    stx    HMM0            ; 3
    cpy    #$00            ; 2
    beq    LF0CC           ; 2
    nop                    ; 2
LF0C9:
    dey                    ; 2
    bne    LF0C9           ; 2
LF0CC:
    sta    RESM0           ; 3
    lda    $D1             ; 3
    jsr    LF768           ; 6
    sta    WSYNC           ; 3
    lda    #$01            ; 2
    sta    CTRLPF          ; 3
    lda    VSYNC           ; 3
    nop                    ; 2
    stx    HMBL            ; 3
    cpy    #$00            ; 2
    beq    LF0E6           ; 2
    nop                    ; 2
LF0E3:
    dey                    ; 2
    bne    LF0E3           ; 2
LF0E6:
    sta    RESBL           ; 3
    sta    WSYNC           ; 3
    sta    WSYNC           ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    sta    $FA             ; 3
    asl                    ; 2
    adc    $FA             ; 3
    sta    $FA             ; 3
    lda    #$33            ; 2
    sec                    ; 2
    sbc    $FA             ; 3
    sta    $EF             ; 3
    lda    #$F1            ; 2
    sbc    #$00            ; 2
    sta    WSYNC           ; 3
    sta    $F0             ; 3
    ldy    #$07            ; 2
LF108:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    #$16            ; 2
    sta    COLUPF          ; 3
    ldx    #$10            ; 2
LF112:
    jmp.ind ($00EF)        ; 5

    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    lda    $0300           ; 4
    stx    COLUPF          ; 3
    sta    WSYNC           ; 3
    dey                    ; 2
    bne    LF108           ; 2
    jsr    LFC43           ; 6
    lda    $CD             ; 3
    jsr    LF768           ; 6
    sta    WSYNC           ; 3
    lda    #$20            ; 2
    jsr    LF784           ; 6
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$04            ; 2
    sta    $F5             ; 3
    sta    WSYNC           ; 3
    sta    HMCLR           ; 3
    lda    #$10            ; 2
    sta    CTRLPF          ; 3
    tsx                    ; 2
    stx    $F1             ; 3
    lda    #$7F            ; 2
    sta    $F2             ; 3
    lda    #$0C            ; 2
    sta    COLUP0          ; 3
    sta    WSYNC           ; 3
    sta    CXCLR           ; 3
    ldx    #$00            ; 2
    lda    $AA             ; 3
    and    #$01            ; 2
    beq    LF179           ; 2
    lda    $C2             ; 3
    clc                    ; 2
    adc    #$10            ; 2
    tax                    ; 2
LF179:
    lda    $89             ; 3
    and    #$02            ; 2
    beq    LF187           ; 2
    lda    $C4             ; 3
    and    #$03            ; 2
    bne    LF187           ; 2
    ldx    #$0A            ; 2
LF187:
    stx    COLUBK          ; 3
    lda    $83             ; 3
    and    #$0F            ; 2
    tax                    ; 2
    lda    LF8E0,X         ; 4
    sta    COLUPF          ; 3
    lda    #$0B            ; 2
    sta    $EE             ; 3
    lda    #$30            ; 2
    sta    $F3             ; 3
    lda    $8C             ; 3
    and    #$0F            ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    tay                    ; 2
    lda    #$B0            ; 2
    sta    TIM64T          ; 4
    sta    WSYNC           ; 3
    lda    $C6             ; 3
    sta    $F4             ; 3
    bne    LF1B7           ; 2
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF3C0           ; 3

LF1B7:
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF1C4           ; 2
    iny                    ; 2
LF1C4:
    sta    WSYNC           ; 3
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF1CF           ; 2
    jmp    LF390           ; 3

LF1CF:
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF1D6           ; 2
    iny                    ; 2
LF1D6:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF1E6           ; 2
    iny                    ; 2
LF1E6:
    sta    WSYNC           ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF1F2           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF1F2:
    ldx    #$08            ; 2
LF1F4:
    dex                    ; 2
    bne    LF1F4           ; 2
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF1FF           ; 2
    iny                    ; 2
LF1FF:
    sta    WSYNC           ; 3
    stx    ENAM0           ; 3
    ldx    $F5             ; 3
    lda    $D7,X           ; 4
    tax                    ; 2
    lda    LF90C,X         ; 4
    sta    $FA             ; 3
    lda    LF934,X         ; 4
    sta    HMP1            ; 3
    lda    $F5             ; 3
    asl                    ; 2
    clc                    ; 2
    adc    $F5             ; 3
    tax                    ; 2
    lda    $95,X           ; 4
    and    #$0F            ; 2
    tax                    ; 2
    lda    LF8F1,X         ; 4
    sta    $FB             ; 3
    lda    LF9AC,X         ; 4
    sta    COLUP1          ; 3
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF235           ; 2
    iny                    ; 2
LF235:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF23E           ; 2
    jmp    LF39C           ; 3

LF23E:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF24C           ; 2
    iny                    ; 2
LF24C:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF254           ; 2
    iny                    ; 2
LF254:
    sta    WSYNC           ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF260           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF260:
    ldx    #$08            ; 2
LF262:
    dex                    ; 2
    bne    LF262           ; 2
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF26D           ; 2
    iny                    ; 2
LF26D:
    sta    WSYNC           ; 3
    stx    ENAM0           ; 3
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    ldx    $FA             ; 3
LF277:
    dex                    ; 2
    bne    LF277           ; 2
    sta    RESP1           ; 3
    sta    WSYNC           ; 3
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF28B           ; 2
    iny                    ; 2
LF28B:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF294           ; 2
    jmp    LF3A8           ; 3

LF294:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF2A2           ; 2
    iny                    ; 2
LF2A2:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF2AA           ; 2
    iny                    ; 2
LF2AA:
    sta    WSYNC           ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF2B6           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF2B6:
    ldx    #$08            ; 2
LF2B8:
    dex                    ; 2
    bne    LF2B8           ; 2
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF2C3           ; 2
    iny                    ; 2
LF2C3:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    stx    ENAM0           ; 3
    ldx    $F5             ; 3
    beq    LF2CF           ; 2
    dec    $F5             ; 5
LF2CF:
    lda    $D2,X           ; 4
    sta    $FA             ; 3
    ldx    $FB             ; 3
    lda    $FA             ; 3
    cmp    $F3             ; 3
    bne    LF2DC           ; 2
    inx                    ; 2
LF2DC:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF2F0           ; 2
    iny                    ; 2
LF2F0:
    sta    WSYNC           ; 3
    lda    LF9BC,X         ; 4
    sta    GRP1            ; 3
    beq    LF2FA           ; 2
    inx                    ; 2
LF2FA:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF303           ; 2
    jmp    LF3B4           ; 3

LF303:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF30F           ; 2
    iny                    ; 2
LF30F:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF317           ; 2
    iny                    ; 2
LF317:
    sta    WSYNC           ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF323           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF323:
    pla                    ; 4
    pha                    ; 3
    pla                    ; 4
    pha                    ; 3
    pla                    ; 4
    pha                    ; 3
    pla                    ; 4
    pha                    ; 3
    pla                    ; 4
    pha                    ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF335           ; 2
    iny                    ; 2
LF335:
    lda    #$00            ; 2
    sta    WSYNC           ; 3
    sta    ENAM0           ; 3
    lda    LF9BC,X         ; 4
    sta    GRP1            ; 3
    beq    LF346           ; 2
    inx                    ; 2
    jmp    LF357           ; 3

LF346:
    lda    LF9BD,X         ; 4
    cmp    #$80            ; 2
    beq    LF38D           ; 2
    lda    $FA             ; 3
    cmp    $F3             ; 3
    bne    LF35D           ; 2
    inx                    ; 2
    jmp    LF35F           ; 3

LF357:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF35D:
    nop                    ; 2
    nop                    ; 2
LF35F:
    clc                    ; 2
    lda    $F3             ; 3
    adc    #$02            ; 2
    cmp    $CC             ; 3
    bcs    LF37C           ; 2
    lda    $D0             ; 3
    cmp    $F3             ; 3
    bne    LF375           ; 2
    lda    #$02            ; 2
    sta    ENABL           ; 3
    jmp    LF2F0           ; 3

LF375:
    lda    #$00            ; 2
    sta    ENABL           ; 3
    jmp    LF2F0           ; 3

LF37C:
    nop                    ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF38A           ; 2
    iny                    ; 2
LF38A:
    jmp    LF2F0           ; 3

LF38D:
    jmp    LF1B7           ; 3

LF390:
    txa                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    tax                    ; 2
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF3F0           ; 3

LF39C:
    txa                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    tax                    ; 2
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF48C           ; 3

LF3A8:
    txa                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    tax                    ; 2
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF503           ; 3

LF3B4:
    txa                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    tax                    ; 2
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF597           ; 3

LF3C0:
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF3CD           ; 2
    iny                    ; 2
LF3CD:
    sta    WSYNC           ; 3
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF3E6           ; 2
    tsx                    ; 2
    stx    $F2             ; 3
    dec    $EE             ; 5
    bne    LF3DF           ; 2
    jmp    LF636           ; 3

LF3DF:
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF3F0           ; 3

LF3E6:
    ldx    $F2             ; 3
    txs                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF3F0:
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF3F7           ; 2
    iny                    ; 2
LF3F7:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF407           ; 2
    iny                    ; 2
LF407:
    sta    WSYNC           ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF419           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF419:
    pla                    ; 4
    sta    PF2             ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    pla                    ; 4
    sta    PF2             ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF42D           ; 2
    iny                    ; 2
LF42D:
    ldx    #$00            ; 2
    stx    PF0             ; 3
    sta    WSYNC           ; 3
    stx    PF1             ; 3
    stx    PF2             ; 3
    stx    ENAM0           ; 3
    ldx    $F5             ; 3
    lda    $D7,X           ; 4
    tax                    ; 2
    lda    LF90C,X         ; 4
    sta    $FA             ; 3
    lda    LF934,X         ; 4
    sta    HMP1            ; 3
    lda    $F5             ; 3
    asl                    ; 2
    clc                    ; 2
    adc    $F5             ; 3
    tax                    ; 2
    lda    $95,X           ; 4
    and    #$0F            ; 2
    tax                    ; 2
    lda    LF8F1,X         ; 4
    sta    $FB             ; 3
    lda    LF9AC,X         ; 4
    sta    COLUP1          ; 3
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF46B           ; 2
    iny                    ; 2
LF46B:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF482           ; 2
    tsx                    ; 2
    stx    $F2             ; 3
    dec    $EE             ; 5
    bne    LF47B           ; 2
    jmp    LF636           ; 3

LF47B:
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF48C           ; 3

LF482:
    ldx    $F2             ; 3
    txs                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF48C:
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF493           ; 2
    iny                    ; 2
LF493:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF49B           ; 2
    iny                    ; 2
LF49B:
    sta    WSYNC           ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF4AD           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF4AD:
    pla                    ; 4
    sta    PF2             ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    pla                    ; 4
    sta    PF2             ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF4C1           ; 2
    iny                    ; 2
LF4C1:
    ldx    #$00            ; 2
    stx    PF0             ; 3
    sta    WSYNC           ; 3
    stx    PF1             ; 3
    stx    PF2             ; 3
    stx    ENAM0           ; 3
    nop                    ; 2
    ldx    $FA             ; 3
LF4D0:
    dex                    ; 2
    bne    LF4D0           ; 2
    sta    RESP1           ; 3
    sta    WSYNC           ; 3
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF4E4           ; 2
    iny                    ; 2
LF4E4:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF4FB           ; 2
    tsx                    ; 2
    stx    $F2             ; 3
    dec    $EE             ; 5
    bne    LF4F4           ; 2
    jmp    LF636           ; 3

LF4F4:
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF503           ; 3

LF4FB:
    nop                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF503:
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF50A           ; 2
    iny                    ; 2
LF50A:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF512           ; 2
    iny                    ; 2
LF512:
    sta    WSYNC           ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF524           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF524:
    pla                    ; 4
    sta    PF2             ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    pla                    ; 4
    sta    PF2             ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF538           ; 2
    iny                    ; 2
LF538:
    ldx    #$00            ; 2
    stx    PF0             ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    stx    PF1             ; 3
    stx    PF2             ; 3
    stx    ENAM0           ; 3
    ldx    $F5             ; 3
    beq    LF54C           ; 2
    dec    $F5             ; 5
LF54C:
    lda    $D2,X           ; 4
    sta    $FA             ; 3
    ldx    $FB             ; 3
    lda    $FA             ; 3
    cmp    $F3             ; 3
    bne    LF559           ; 2
    inx                    ; 2
LF559:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF56A           ; 2
    iny                    ; 2
LF56A:
    sta    WSYNC           ; 3
    lda    LF9BC,X         ; 4
    sta    GRP1            ; 3
    beq    LF574           ; 2
    inx                    ; 2
LF574:
    dec    $F3             ; 5
    dec    $F4             ; 5
    bne    LF58D           ; 2
    txa                    ; 2
    tsx                    ; 2
    stx    $F2             ; 3
    tax                    ; 2
    dec    $EE             ; 5
    bne    LF586           ; 2
    jmp    LF636           ; 3

LF586:
    lda    $C5             ; 3
    sta    $F4             ; 3
    jmp    LF597           ; 3

LF58D:
    txa                    ; 2
    ldx    $F2             ; 3
    txs                    ; 2
    tax                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF597:
    lda    $F3             ; 3
    cmp    $CC             ; 3
    bne    LF59E           ; 2
    iny                    ; 2
LF59E:
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF5A6           ; 2
    iny                    ; 2
LF5A6:
    sta    WSYNC           ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    lda    $F3             ; 3
    cmp    $CE             ; 3
    bne    LF5B8           ; 2
    lda    #$02            ; 2
    sta    ENAM0           ; 3
LF5B8:
    pla                    ; 4
    sta    PF2             ; 3
    pla                    ; 4
    sta    PF0             ; 3
    pla                    ; 4
    sta    PF1             ; 3
    pla                    ; 4
    sta    PF2             ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF5CC           ; 2
    iny                    ; 2
LF5CC:
    lda    #$00            ; 2
    sta    PF0             ; 3
    sta    PF1             ; 3
    sta    ENAM0           ; 3
    sta    PF2             ; 3
    lda    LF9BC,X         ; 4
    sta    GRP1            ; 3
    beq    LF5E1           ; 2
    inx                    ; 2
    jmp    LF5F2           ; 3

LF5E1:
    lda    LF9BD,X         ; 4
    cmp    #$80            ; 2
    beq    LF627           ; 2
    lda    $FA             ; 3
    cmp    $F3             ; 3
    bne    LF5F8           ; 2
    inx                    ; 2
    jmp    LF5FA           ; 3

LF5F2:
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
LF5F8:
    nop                    ; 2
    nop                    ; 2
LF5FA:
    clc                    ; 2
    lda    $F3             ; 3
    adc    #$02            ; 2
    cmp    $CC             ; 3
    bcs    LF617           ; 2
    lda    $D0             ; 3
    cmp    $F3             ; 3
    bne    LF610           ; 2
    lda    #$02            ; 2
    sta    ENABL           ; 3
    jmp    LF56A           ; 3

LF610:
    lda    #$00            ; 2
    sta    ENABL           ; 3
    jmp    LF56A           ; 3

LF617:
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    beq    LF624           ; 2
    iny                    ; 2
LF624:
    jmp    LF56A           ; 3

LF627:
    nop                    ; 2
    lda    #$00            ; 2
    sta    ENABL           ; 3
    sta    ENABL           ; 3
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    jmp    LF3C0           ; 3

LF636:
    ldx    $F1             ; 3
    txs                    ; 2
LF639:
    ldx    #$02            ; 2
LF63B:
    lda    INTIM           ; 4
    bmi    LF658           ; 2
    lda    LF8EB,X         ; 4
    sta    WSYNC           ; 3
    bne    LF64D           ; 2
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    sta    ENABL           ; 3
LF64D:
    sta    PF0             ; 3
    sta    PF1             ; 3
    sta    PF2             ; 3
    dex                    ; 2
    bpl    LF63B           ; 2
    bmi    LF639           ; 2
LF658:
    sta    WSYNC           ; 3
    jsr    LFC43           ; 6
    ldx    #$D2            ; 2
    lda    $AA             ; 3
    and    #$01            ; 2
    beq    LF66B           ; 2
    lda    $C2             ; 3
    clc                    ; 2
    adc    #$20            ; 2
    tax                    ; 2
LF66B:
    stx    COLUPF          ; 3
    stx    COLUBK          ; 3
    lda    $80             ; 3
    and    #$0F            ; 2
    sta    $FA             ; 3
    tax                    ; 2
    lda    LF8ED,X         ; 4
    sta    NUSIZ0          ; 3
    sta    WSYNC           ; 3
    ldy    #$03            ; 2
LF67F:
    dey                    ; 2
    bne    LF67F           ; 2
    nop                    ; 2
    sta    RESP0           ; 3
    sta    WSYNC           ; 3
    sta    WSYNC           ; 3
    ldy    #$00            ; 2
LF68B:
    sta    WSYNC           ; 3
    iny                    ; 2
    lda    $FA             ; 3
    beq    LF6A0           ; 2
    lda    LF95C,Y         ; 4
    sta    COLUP0          ; 3
    lda    LF984,Y         ; 4
    sta    GRP0            ; 3
    bne    LF68B           ; 2
    beq    LF6A5           ; 2
LF6A0:
    lda    LF984,Y         ; 4
    bne    LF68B           ; 2
LF6A5:
    sta    WSYNC           ; 3
    jmp    LF700           ; 3

    .byte $FF ; |XXXXXXXX| $F6AA
    .byte $FF ; |XXXXXXXX| $F6AB
    .byte $FF ; |XXXXXXXX| $F6AC
    .byte $FF ; |XXXXXXXX| $F6AD
    .byte $FF ; |XXXXXXXX| $F6AE
    .byte $FF ; |XXXXXXXX| $F6AF
    .byte $FF ; |XXXXXXXX| $F6B0
    .byte $FF ; |XXXXXXXX| $F6B1
    .byte $FF ; |XXXXXXXX| $F6B2
    .byte $FF ; |XXXXXXXX| $F6B3
    .byte $FF ; |XXXXXXXX| $F6B4
    .byte $FF ; |XXXXXXXX| $F6B5
    .byte $FF ; |XXXXXXXX| $F6B6
    .byte $FF ; |XXXXXXXX| $F6B7
    .byte $FF ; |XXXXXXXX| $F6B8
    .byte $FF ; |XXXXXXXX| $F6B9
    .byte $FF ; |XXXXXXXX| $F6BA
    .byte $FF ; |XXXXXXXX| $F6BB
    .byte $FF ; |XXXXXXXX| $F6BC
    .byte $FF ; |XXXXXXXX| $F6BD
    .byte $FF ; |XXXXXXXX| $F6BE
    .byte $FF ; |XXXXXXXX| $F6BF
    .byte $FF ; |XXXXXXXX| $F6C0
    .byte $FF ; |XXXXXXXX| $F6C1
    .byte $FF ; |XXXXXXXX| $F6C2
    .byte $FF ; |XXXXXXXX| $F6C3
    .byte $FF ; |XXXXXXXX| $F6C4
    .byte $FF ; |XXXXXXXX| $F6C5
    .byte $FF ; |XXXXXXXX| $F6C6
    .byte $FF ; |XXXXXXXX| $F6C7
    .byte $FF ; |XXXXXXXX| $F6C8
    .byte $FF ; |XXXXXXXX| $F6C9
    .byte $FF ; |XXXXXXXX| $F6CA
    .byte $FF ; |XXXXXXXX| $F6CB
    .byte $FF ; |XXXXXXXX| $F6CC
    .byte $FF ; |XXXXXXXX| $F6CD
    .byte $FF ; |XXXXXXXX| $F6CE
    .byte $FF ; |XXXXXXXX| $F6CF
    .byte $FF ; |XXXXXXXX| $F6D0
    .byte $FF ; |XXXXXXXX| $F6D1
    .byte $FF ; |XXXXXXXX| $F6D2
    .byte $FF ; |XXXXXXXX| $F6D3
    .byte $FF ; |XXXXXXXX| $F6D4
    .byte $FF ; |XXXXXXXX| $F6D5
    .byte $FF ; |XXXXXXXX| $F6D6
    .byte $FF ; |XXXXXXXX| $F6D7
    .byte $FF ; |XXXXXXXX| $F6D8
    .byte $FF ; |XXXXXXXX| $F6D9
    .byte $FF ; |XXXXXXXX| $F6DA
    .byte $FF ; |XXXXXXXX| $F6DB
    .byte $FF ; |XXXXXXXX| $F6DC
    .byte $FF ; |XXXXXXXX| $F6DD
    .byte $FF ; |XXXXXXXX| $F6DE
    .byte $FF ; |XXXXXXXX| $F6DF
    .byte $FF ; |XXXXXXXX| $F6E0
    .byte $FF ; |XXXXXXXX| $F6E1
    .byte $FF ; |XXXXXXXX| $F6E2
    .byte $FF ; |XXXXXXXX| $F6E3
    .byte $FF ; |XXXXXXXX| $F6E4
    .byte $FF ; |XXXXXXXX| $F6E5
    .byte $FF ; |XXXXXXXX| $F6E6
    .byte $FF ; |XXXXXXXX| $F6E7
    .byte $FF ; |XXXXXXXX| $F6E8
    .byte $FF ; |XXXXXXXX| $F6E9
    .byte $FF ; |XXXXXXXX| $F6EA
    .byte $FF ; |XXXXXXXX| $F6EB
    .byte $FF ; |XXXXXXXX| $F6EC
    .byte $FF ; |XXXXXXXX| $F6ED
    .byte $FF ; |XXXXXXXX| $F6EE
    .byte $FF ; |XXXXXXXX| $F6EF
    .byte $FF ; |XXXXXXXX| $F6F0
    .byte $FF ; |XXXXXXXX| $F6F1
    .byte $FF ; |XXXXXXXX| $F6F2
    .byte $FF ; |XXXXXXXX| $F6F3
    .byte $FF ; |XXXXXXXX| $F6F4
    .byte $FF ; |XXXXXXXX| $F6F5
    .byte $FF ; |XXXXXXXX| $F6F6
    .byte $FF ; |XXXXXXXX| $F6F7
    .byte $FF ; |XXXXXXXX| $F6F8
    .byte $FF ; |XXXXXXXX| $F6F9
    .byte $FF ; |XXXXXXXX| $F6FA
    .byte $FF ; |XXXXXXXX| $F6FB
    .byte $FF ; |XXXXXXXX| $F6FC
    .byte $FF ; |XXXXXXXX| $F6FD
    .byte $FF ; |XXXXXXXX| $F6FE
    .byte $FF ; |XXXXXXXX| $F6FF
LF700:
    jsr    LFC43           ; 6
    lda    #$01            ; 2
    sta    CTRLPF          ; 3
    lda    #$7F            ; 2
    sta    PF1             ; 3
    lda    #$FF            ; 2
    sta    PF2             ; 3
    lda    $C3             ; 3
    lsr                    ; 2
    sta    $FA             ; 3
    lda    #$4E            ; 2
    sec                    ; 2
    sbc    $FA             ; 3
    sta    $EF             ; 3
    ldx    #$32            ; 2
    lda    $E2             ; 3
    and    #$80            ; 2
    beq    LF725           ; 2
    ldx    #$16            ; 2
LF725:
    lda    #$F7            ; 2
    sta    WSYNC           ; 3
    sta    $F0             ; 3
    ldy    #$05            ; 2
LF72D:
    lda    #$70            ; 2
    sta    COLUPF          ; 3
    lda    $C3             ; 3
    ror                    ; 2
    bcs    LF736           ; 2
LF736:
    jmp.ind ($00EF)        ; 5

    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    nop                    ; 2
    lda    VSYNC           ; 3
    stx    COLUPF          ; 3
    sta    WSYNC           ; 3
    dey                    ; 2
    bne    LF72D           ; 2
    jsr    LFC43           ; 6
    sta    WSYNC           ; 3
    sta    WSYNC           ; 3
    lda    #$00            ; 2
    sta    COLUBK          ; 3
    sta    LFFE3           ; 4
    jmp    LF000           ; 3

LF768:
    tay                    ; 2
    and    #$0F            ; 2
    sta    $FA             ; 3
    tya                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    tay                    ; 2
    adc    $FA             ; 3
    cmp    #$0F            ; 2
    bcc    LF77C           ; 2
    sbc    #$0F            ; 2
    iny                    ; 2
LF77C:
    eor    #$07            ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    tax                    ; 2
    rts                    ; 6

LF784:
    sta    NUSIZ0          ; 3
    stx    HMP0            ; 3
    cpy    #$00            ; 2
    beq    LF790           ; 2
    nop                    ; 2
LF78D:
    dey                    ; 2
    bne    LF78D           ; 2
LF790:
    sta    RESP0           ; 3
    rts                    ; 6

    sta    NUSIZ1          ; 3
    stx    HMP1            ; 3
    cpy    #$00            ; 2
    beq    LF79F           ; 2
    nop                    ; 2
LF79C:
    dey                    ; 2
    bne    LF79C           ; 2
LF79F:
    sta    RESP1           ; 3
    rts                    ; 6

    .byte $FF ; |XXXXXXXX| $F7A2
    .byte $FF ; |XXXXXXXX| $F7A3
    .byte $FF ; |XXXXXXXX| $F7A4
    .byte $FF ; |XXXXXXXX| $F7A5
    .byte $FF ; |XXXXXXXX| $F7A6
    .byte $FF ; |XXXXXXXX| $F7A7
    .byte $FF ; |XXXXXXXX| $F7A8
    .byte $FF ; |XXXXXXXX| $F7A9
    .byte $FF ; |XXXXXXXX| $F7AA
    .byte $FF ; |XXXXXXXX| $F7AB
    .byte $FF ; |XXXXXXXX| $F7AC
    .byte $FF ; |XXXXXXXX| $F7AD
    .byte $FF ; |XXXXXXXX| $F7AE
    .byte $FF ; |XXXXXXXX| $F7AF
    .byte $FF ; |XXXXXXXX| $F7B0
    .byte $FF ; |XXXXXXXX| $F7B1
    .byte $FF ; |XXXXXXXX| $F7B2
    .byte $FF ; |XXXXXXXX| $F7B3
    .byte $FF ; |XXXXXXXX| $F7B4
    .byte $FF ; |XXXXXXXX| $F7B5
    .byte $FF ; |XXXXXXXX| $F7B6
    .byte $FF ; |XXXXXXXX| $F7B7
    .byte $FF ; |XXXXXXXX| $F7B8
    .byte $FF ; |XXXXXXXX| $F7B9
    .byte $FF ; |XXXXXXXX| $F7BA
    .byte $FF ; |XXXXXXXX| $F7BB
    .byte $FF ; |XXXXXXXX| $F7BC
    .byte $FF ; |XXXXXXXX| $F7BD
    .byte $FF ; |XXXXXXXX| $F7BE
    .byte $FF ; |XXXXXXXX| $F7BF
    .byte $FF ; |XXXXXXXX| $F7C0
    .byte $FF ; |XXXXXXXX| $F7C1
    .byte $FF ; |XXXXXXXX| $F7C2
    .byte $FF ; |XXXXXXXX| $F7C3
    .byte $FF ; |XXXXXXXX| $F7C4
    .byte $FF ; |XXXXXXXX| $F7C5
    .byte $FF ; |XXXXXXXX| $F7C6
    .byte $FF ; |XXXXXXXX| $F7C7
    .byte $FF ; |XXXXXXXX| $F7C8
    .byte $FF ; |XXXXXXXX| $F7C9
    .byte $FF ; |XXXXXXXX| $F7CA
    .byte $FF ; |XXXXXXXX| $F7CB
    .byte $FF ; |XXXXXXXX| $F7CC
    .byte $FF ; |XXXXXXXX| $F7CD
    .byte $FF ; |XXXXXXXX| $F7CE
    .byte $FF ; |XXXXXXXX| $F7CF
    .byte $FF ; |XXXXXXXX| $F7D0
    .byte $FF ; |XXXXXXXX| $F7D1
    .byte $FF ; |XXXXXXXX| $F7D2
    .byte $FF ; |XXXXXXXX| $F7D3
    .byte $FF ; |XXXXXXXX| $F7D4
    .byte $FF ; |XXXXXXXX| $F7D5
    .byte $FF ; |XXXXXXXX| $F7D6
    .byte $FF ; |XXXXXXXX| $F7D7
    .byte $FF ; |XXXXXXXX| $F7D8
    .byte $FF ; |XXXXXXXX| $F7D9
    .byte $FF ; |XXXXXXXX| $F7DA
    .byte $FF ; |XXXXXXXX| $F7DB
    .byte $FF ; |XXXXXXXX| $F7DC
    .byte $FF ; |XXXXXXXX| $F7DD
    .byte $FF ; |XXXXXXXX| $F7DE
    .byte $FF ; |XXXXXXXX| $F7DF
    .byte $FF ; |XXXXXXXX| $F7E0
    .byte $FF ; |XXXXXXXX| $F7E1
    .byte $FF ; |XXXXXXXX| $F7E2
    .byte $FF ; |XXXXXXXX| $F7E3
    .byte $FF ; |XXXXXXXX| $F7E4
    .byte $FF ; |XXXXXXXX| $F7E5
    .byte $FF ; |XXXXXXXX| $F7E6
    .byte $FF ; |XXXXXXXX| $F7E7
    .byte $FF ; |XXXXXXXX| $F7E8
    .byte $FF ; |XXXXXXXX| $F7E9
    .byte $FF ; |XXXXXXXX| $F7EA
    .byte $FF ; |XXXXXXXX| $F7EB
    .byte $FF ; |XXXXXXXX| $F7EC
    .byte $FF ; |XXXXXXXX| $F7ED
    .byte $FF ; |XXXXXXXX| $F7EE
    .byte $FF ; |XXXXXXXX| $F7EF
    .byte $FF ; |XXXXXXXX| $F7F0
    .byte $FF ; |XXXXXXXX| $F7F1
    .byte $FF ; |XXXXXXXX| $F7F2
    .byte $FF ; |XXXXXXXX| $F7F3
    .byte $FF ; |XXXXXXXX| $F7F4
    .byte $FF ; |XXXXXXXX| $F7F5
    .byte $FF ; |XXXXXXXX| $F7F6
    .byte $FF ; |XXXXXXXX| $F7F7
    .byte $FF ; |XXXXXXXX| $F7F8
    .byte $FF ; |XXXXXXXX| $F7F9
    .byte $FF ; |XXXXXXXX| $F7FA
    .byte $FF ; |XXXXXXXX| $F7FB
    .byte $FF ; |XXXXXXXX| $F7FC
    .byte $FF ; |XXXXXXXX| $F7FD
    .byte $FF ; |XXXXXXXX| $F7FE
    .byte $FF ; |XXXXXXXX| $F7FF
LF800:
    .byte $1C ; |   XXX  | $F800
    .byte $23 ; |  X   XX| $F801
    .byte $2A ; |  X X X | $F802
    .byte $31 ; |  XX   X| $F803
    .byte $38 ; |  XXX   | $F804
    .byte $3F ; |  XXXXXX| $F805
    .byte $46 ; | X   XX | $F806
    .byte $4D ; | X  XX X| $F807
    .byte $54 ; | X X X  | $F808
    .byte $5B ; | X XX XX| $F809
    .byte $62 ; | XX   X | $F80A
    .byte $69 ; | XX X  X| $F80B
    .byte $70 ; | XXX    | $F80C
    .byte $77 ; | XXX XXX| $F80D
    .byte $7E ; | XXXXXX | $F80E
    .byte $85 ; |X    X X| $F80F
    .byte $8C ; |X   XX  | $F810
    .byte $93 ; |X  X  XX| $F811
    .byte $9A ; |X  XX X | $F812
    .byte $A1 ; |X X    X| $F813
    .byte $A8 ; |X X X   | $F814
    .byte $AF ; |X X XXXX| $F815
    .byte $B6 ; |X XX XX | $F816
    .byte $BD ; |X XXXX X| $F817
    .byte $C4 ; |XX   X  | $F818
    .byte $CB ; |XX  X XX| $F819
    .byte $D2 ; |XX X  X | $F81A
    .byte $D9 ; |XX XX  X| $F81B
    .byte $3C ; |  XXXX  | $F81C
    .byte $66 ; | XX  XX | $F81D
    .byte $66 ; | XX  XX | $F81E
    .byte $66 ; | XX  XX | $F81F
    .byte $66 ; | XX  XX | $F820
    .byte $66 ; | XX  XX | $F821
    .byte $3C ; |  XXXX  | $F822
    .byte $3C ; |  XXXX  | $F823
    .byte $18 ; |   XX   | $F824
    .byte $18 ; |   XX   | $F825
    .byte $18 ; |   XX   | $F826
    .byte $18 ; |   XX   | $F827
    .byte $38 ; |  XXX   | $F828
    .byte $18 ; |   XX   | $F829
    .byte $7E ; | XXXXXX | $F82A
    .byte $60 ; | XX     | $F82B
    .byte $60 ; | XX     | $F82C
    .byte $3C ; |  XXXX  | $F82D
    .byte $06 ; |     XX | $F82E
    .byte $46 ; | X   XX | $F82F
    .byte $3C ; |  XXXX  | $F830
    .byte $3C ; |  XXXX  | $F831
    .byte $46 ; | X   XX | $F832
    .byte $06 ; |     XX | $F833
    .byte $0C ; |    XX  | $F834
    .byte $06 ; |     XX | $F835
    .byte $46 ; | X   XX | $F836
    .byte $3C ; |  XXXX  | $F837
    .byte $0C ; |    XX  | $F838
    .byte $0C ; |    XX  | $F839
    .byte $7E ; | XXXXXX | $F83A
    .byte $4C ; | X  XX  | $F83B
    .byte $2C ; |  X XX  | $F83C
    .byte $1C ; |   XXX  | $F83D
    .byte $0C ; |    XX  | $F83E
    .byte $7C ; | XXXXX  | $F83F
    .byte $46 ; | X   XX | $F840
    .byte $06 ; |     XX | $F841
    .byte $7C ; | XXXXX  | $F842
    .byte $60 ; | XX     | $F843
    .byte $60 ; | XX     | $F844
    .byte $7E ; | XXXXXX | $F845
    .byte $3C ; |  XXXX  | $F846
    .byte $66 ; | XX  XX | $F847
    .byte $66 ; | XX  XX | $F848
    .byte $7C ; | XXXXX  | $F849
    .byte $60 ; | XX     | $F84A
    .byte $62 ; | XX   X | $F84B
    .byte $3C ; |  XXXX  | $F84C
    .byte $18 ; |   XX   | $F84D
    .byte $18 ; |   XX   | $F84E
    .byte $18 ; |   XX   | $F84F
    .byte $0C ; |    XX  | $F850
    .byte $06 ; |     XX | $F851
    .byte $42 ; | X    X | $F852
    .byte $7E ; | XXXXXX | $F853
    .byte $3C ; |  XXXX  | $F854
    .byte $66 ; | XX  XX | $F855
    .byte $66 ; | XX  XX | $F856
    .byte $3C ; |  XXXX  | $F857
    .byte $66 ; | XX  XX | $F858
    .byte $66 ; | XX  XX | $F859
    .byte $3C ; |  XXXX  | $F85A
    .byte $3C ; |  XXXX  | $F85B
    .byte $46 ; | X   XX | $F85C
    .byte $06 ; |     XX | $F85D
    .byte $3E ; |  XXXXX | $F85E
    .byte $66 ; | XX  XX | $F85F
    .byte $66 ; | XX  XX | $F860
    .byte $3C ; |  XXXX  | $F861
    .byte $00 ; |        | $F862
    .byte $00 ; |        | $F863
    .byte $00 ; |        | $F864
    .byte $00 ; |        | $F865
    .byte $00 ; |        | $F866
    .byte $00 ; |        | $F867
    .byte $00 ; |        | $F868
    .byte $F3 ; |XXXX  XX| $F869
    .byte $0A ; |    X X | $F86A
    .byte $0A ; |    X X | $F86B
    .byte $72 ; | XXX  X | $F86C
    .byte $82 ; |X     X | $F86D
    .byte $82 ; |X     X | $F86E
    .byte $7A ; | XXXX X | $F86F
    .byte $E7 ; |XXX  XXX| $F870
    .byte $08 ; |    X   | $F871
    .byte $08 ; |    X   | $F872
    .byte $08 ; |    X   | $F873
    .byte $08 ; |    X   | $F874
    .byte $08 ; |    X   | $F875
    .byte $07 ; |     XXX| $F876
    .byte $22 ; |  X   X | $F877
    .byte $B6 ; |X XX XX | $F878
    .byte $AA ; |X X X X | $F879
    .byte $AA ; |X X X X | $F87A
    .byte $A2 ; |X X   X | $F87B
    .byte $A2 ; |X X   X | $F87C
    .byte $22 ; |  X   X | $F87D
    .byte $8B ; |X   X XX| $F87E
    .byte $8A ; |X   X X | $F87F
    .byte $8A ; |X   X X | $F880
    .byte $8B ; |X   X XX| $F881
    .byte $AA ; |X X X X | $F882
    .byte $DA ; |XX XX X | $F883
    .byte $8B ; |X   X XX| $F884
    .byte $EF ; |XXX XXXX| $F885
    .byte $08 ; |    X   | $F886
    .byte $08 ; |    X   | $F887
    .byte $88 ; |X   X   | $F888
    .byte $08 ; |    X   | $F889
    .byte $08 ; |    X   | $F88A
    .byte $EF ; |XXX XXXX| $F88B
    .byte $3E ; |  XXXXX | $F88C
    .byte $88 ; |X   X   | $F88D
    .byte $88 ; |X   X   | $F88E
    .byte $88 ; |X   X   | $F88F
    .byte $88 ; |X   X   | $F890
    .byte $88 ; |X   X   | $F891
    .byte $3E ; |  XXXXX | $F892
    .byte $72 ; | XXX  X | $F893
    .byte $8A ; |X   X X | $F894
    .byte $8A ; |X   X X | $F895
    .byte $8A ; |X   X X | $F896
    .byte $8A ; |X   X X | $F897
    .byte $8B ; |X   X XX| $F898
    .byte $8A ; |X   X X | $F899
    .byte $20 ; |  X     | $F89A
    .byte $20 ; |  X     | $F89B
    .byte $20 ; |  X     | $F89C
    .byte $20 ; |  X     | $F89D
    .byte $A0 ; |X X     | $F89E
    .byte $60 ; | XX     | $F89F
    .byte $20 ; |  X     | $F8A0
    .byte $82 ; |X     X | $F8A1
    .byte $82 ; |X     X | $F8A2
    .byte $82 ; |X     X | $F8A3
    .byte $E3 ; |XXX   XX| $F8A4
    .byte $82 ; |X     X | $F8A5
    .byte $82 ; |X     X | $F8A6
    .byte $F9 ; |XXXXX  X| $F8A7
    .byte $2F ; |  X XXXX| $F8A8
    .byte $20 ; |  X     | $F8A9
    .byte $20 ; |  X     | $F8AA
    .byte $E7 ; |XXX  XXX| $F8AB
    .byte $28 ; |  X X   | $F8AC
    .byte $28 ; |  X X   | $F8AD
    .byte $C7 ; |XX   XXX| $F8AE
    .byte $08 ; |    X   | $F8AF
    .byte $88 ; |X   X   | $F8B0
    .byte $88 ; |X   X   | $F8B1
    .byte $08 ; |    X   | $F8B2
    .byte $08 ; |    X   | $F8B3
    .byte $08 ; |    X   | $F8B4
    .byte $BE ; |X XXXXX | $F8B5
    .byte $71 ; | XXX   X| $F8B6
    .byte $8A ; |X   X X | $F8B7
    .byte $82 ; |X     X | $F8B8
    .byte $82 ; |X     X | $F8B9
    .byte $82 ; |X     X | $F8BA
    .byte $8A ; |X   X X | $F8BB
    .byte $71 ; | XXX   X| $F8BC
    .byte $C8 ; |XX  X   | $F8BD
    .byte $29 ; |  X X  X| $F8BE
    .byte $29 ; |  X X  X| $F8BF
    .byte $2A ; |  X X X | $F8C0
    .byte $2A ; |  X X X | $F8C1
    .byte $2C ; |  X XX  | $F8C2
    .byte $C8 ; |XX  X   | $F8C3
    .byte $88 ; |X   X   | $F8C4
    .byte $88 ; |X   X   | $F8C5
    .byte $88 ; |X   X   | $F8C6
    .byte $88 ; |X   X   | $F8C7
    .byte $88 ; |X   X   | $F8C8
    .byte $88 ; |X   X   | $F8C9
    .byte $BE ; |X XXXXX | $F8CA
    .byte $FA ; |XXXXX X | $F8CB
    .byte $22 ; |  X   X | $F8CC
    .byte $22 ; |  X   X | $F8CD
    .byte $22 ; |  X   X | $F8CE
    .byte $22 ; |  X   X | $F8CF
    .byte $23 ; |  X   XX| $F8D0
    .byte $FA ; |XXXXX X | $F8D1
    .byte $27 ; |  X  XXX| $F8D2
    .byte $68 ; | XX X   | $F8D3
    .byte $68 ; | XX X   | $F8D4
    .byte $A8 ; |X X X   | $F8D5
    .byte $A8 ; |X X X   | $F8D6
    .byte $28 ; |  X X   | $F8D7
    .byte $28 ; |  X X   | $F8D8
    .byte $3E ; |  XXXXX | $F8D9
    .byte $A0 ; |X X     | $F8DA
    .byte $A0 ; |X X     | $F8DB
    .byte $B8 ; |X XXX   | $F8DC
    .byte $A0 ; |X X     | $F8DD
    .byte $A0 ; |X X     | $F8DE
    .byte $BE ; |X XXXXX | $F8DF
LF8E0:
    .byte $24 ; |  X  X  | $F8E0
    .byte $34 ; |  XX X  | $F8E1
    .byte $44 ; | X   X  | $F8E2
    .byte $C4 ; |XX   X  | $F8E3
    .byte $B4 ; |X XX X  | $F8E4
    .byte $A4 ; |X X  X  | $F8E5
    .byte $94 ; |X  X X  | $F8E6
    .byte $84 ; |X    X  | $F8E7
    .byte $74 ; | XXX X  | $F8E8
    .byte $64 ; | XX  X  | $F8E9
    .byte $54 ; | X X X  | $F8EA
LF8EB:
    .byte $00 ; |        | $F8EB
    .byte $00 ; |        | $F8EC
LF8ED:
    .byte $FF ; |XXXXXXXX| $F8ED
    .byte $00 ; |        | $F8EE
    .byte $01 ; |       X| $F8EF
    .byte $03 ; |      XX| $F8F0
LF8F1:
    .byte $00 ; |        | $F8F1
    .byte $10 ; |   X    | $F8F2
    .byte $20 ; |  X     | $F8F3
    .byte $30 ; |  XX    | $F8F4
    .byte $40 ; | X      | $F8F5
    .byte $50 ; | X X    | $F8F6
    .byte $60 ; | XX     | $F8F7
    .byte $70 ; | XXX    | $F8F8
    .byte $80 ; |X       | $F8F9
    .byte $90 ; |X  X    | $F8FA
    .byte $A0 ; |X X     | $F8FB
    .byte $B0 ; |X XX    | $F8FC
    .byte $C0 ; |XX      | $F8FD
    .byte $D0 ; |XX X    | $F8FE
    .byte $E0 ; |XXX     | $F8FF
    .byte $F0 ; |XXXX    | $F900
    .byte $19 ; |   XX  X| $F901
    .byte $19 ; |   XX  X| $F902
    .byte $19 ; |   XX  X| $F903
    .byte $14 ; |   X X  | $F904
    .byte $14 ; |   X X  | $F905
    .byte $14 ; |   X X  | $F906
    .byte $0F ; |    XXXX| $F907
    .byte $0F ; |    XXXX| $F908
    .byte $0F ; |    XXXX| $F909
    .byte $0D ; |    XX X| $F90A
    .byte $0D ; |    XX X| $F90B
LF90C:
    .byte $01 ; |       X| $F90C
    .byte $01 ; |       X| $F90D
    .byte $01 ; |       X| $F90E
    .byte $01 ; |       X| $F90F
    .byte $02 ; |      X | $F910
    .byte $02 ; |      X | $F911
    .byte $02 ; |      X | $F912
    .byte $02 ; |      X | $F913
    .byte $03 ; |      XX| $F914
    .byte $03 ; |      XX| $F915
    .byte $03 ; |      XX| $F916
    .byte $03 ; |      XX| $F917
    .byte $04 ; |     X  | $F918
    .byte $04 ; |     X  | $F919
    .byte $04 ; |     X  | $F91A
    .byte $05 ; |     X X| $F91B
    .byte $05 ; |     X X| $F91C
    .byte $05 ; |     X X| $F91D
    .byte $05 ; |     X X| $F91E
    .byte $06 ; |     XX | $F91F
    .byte $06 ; |     XX | $F920
    .byte $06 ; |     XX | $F921
    .byte $06 ; |     XX | $F922
    .byte $07 ; |     XXX| $F923
    .byte $07 ; |     XXX| $F924
    .byte $07 ; |     XXX| $F925
    .byte $07 ; |     XXX| $F926
    .byte $08 ; |    X   | $F927
    .byte $08 ; |    X   | $F928
    .byte $08 ; |    X   | $F929
    .byte $09 ; |    X  X| $F92A
    .byte $09 ; |    X  X| $F92B
    .byte $09 ; |    X  X| $F92C
    .byte $09 ; |    X  X| $F92D
    .byte $0A ; |    X X | $F92E
    .byte $0A ; |    X X | $F92F
    .byte $0A ; |    X X | $F930
    .byte $0A ; |    X X | $F931
    .byte $0B ; |    X XX| $F932
    .byte $0B ; |    X XX| $F933
LF934:
    .byte $70 ; | XXX    | $F934
    .byte $30 ; |  XX    | $F935
    .byte $F0 ; |XXXX    | $F936
    .byte $B0 ; |X XX    | $F937
    .byte $60 ; | XX     | $F938
    .byte $20 ; |  X     | $F939
    .byte $E0 ; |XXX     | $F93A
    .byte $A0 ; |X X     | $F93B
    .byte $50 ; | X X    | $F93C
    .byte $10 ; |   X    | $F93D
    .byte $D0 ; |XX X    | $F93E
    .byte $90 ; |X  X    | $F93F
    .byte $40 ; | X      | $F940
    .byte $00 ; |        | $F941
    .byte $C0 ; |XX      | $F942
    .byte $70 ; | XXX    | $F943
    .byte $30 ; |  XX    | $F944
    .byte $F0 ; |XXXX    | $F945
    .byte $B0 ; |X XX    | $F946
    .byte $60 ; | XX     | $F947
    .byte $20 ; |  X     | $F948
    .byte $E0 ; |XXX     | $F949
    .byte $A0 ; |X X     | $F94A
    .byte $50 ; | X X    | $F94B
    .byte $10 ; |   X    | $F94C
    .byte $D0 ; |XX X    | $F94D
    .byte $90 ; |X  X    | $F94E
    .byte $40 ; | X      | $F94F
    .byte $00 ; |        | $F950
    .byte $C0 ; |XX      | $F951
    .byte $70 ; | XXX    | $F952
    .byte $30 ; |  XX    | $F953
    .byte $F0 ; |XXXX    | $F954
    .byte $B0 ; |X XX    | $F955
    .byte $60 ; | XX     | $F956
    .byte $20 ; |  X     | $F957
    .byte $E0 ; |XXX     | $F958
    .byte $A0 ; |X X     | $F959
    .byte $50 ; | X X    | $F95A
    .byte $10 ; |   X    | $F95B
LF95C:
    .byte $0C ; |    XX  | $F95C
    .byte $0C ; |    XX  | $F95D
    .byte $D6 ; |XX X XX | $F95E
    .byte $D6 ; |XX X XX | $F95F
    .byte $D6 ; |XX X XX | $F960
    .byte $D4 ; |XX X X  | $F961
    .byte $06 ; |     XX | $F962
    .byte $FF ; |XXXXXXXX| $F963
    .byte $0C ; |    XX  | $F964
    .byte $0C ; |    XX  | $F965
    .byte $D6 ; |XX X XX | $F966
    .byte $D6 ; |XX X XX | $F967
    .byte $D6 ; |XX X XX | $F968
    .byte $D4 ; |XX X X  | $F969
    .byte $06 ; |     XX | $F96A
    .byte $FF ; |XXXXXXXX| $F96B
    .byte $0E ; |    XXX | $F96C
    .byte $0E ; |    XXX | $F96D
    .byte $0E ; |    XXX | $F96E
    .byte $0E ; |    XXX | $F96F
    .byte $0E ; |    XXX | $F970
    .byte $0E ; |    XXX | $F971
    .byte $0E ; |    XXX | $F972
    .byte $0E ; |    XXX | $F973
    .byte $18 ; |   XX   | $F974
    .byte $18 ; |   XX   | $F975
    .byte $18 ; |   XX   | $F976
    .byte $18 ; |   XX   | $F977
    .byte $18 ; |   XX   | $F978
    .byte $18 ; |   XX   | $F979
    .byte $18 ; |   XX   | $F97A
    .byte $18 ; |   XX   | $F97B
    .byte $32 ; |  XX  X | $F97C
    .byte $32 ; |  XX  X | $F97D
    .byte $32 ; |  XX  X | $F97E
    .byte $32 ; |  XX  X | $F97F
    .byte $32 ; |  XX  X | $F980
    .byte $32 ; |  XX  X | $F981
    .byte $32 ; |  XX  X | $F982
    .byte $32 ; |  XX  X | $F983
LF984:
    .byte $00 ; |        | $F984
    .byte $7E ; | XXXXXX | $F985
    .byte $88 ; |X   X   | $F986
    .byte $5C ; | X XXX  | $F987
    .byte $7E ; | XXXXXX | $F988
    .byte $0A ; |    X X | $F989
    .byte $1F ; |   XXXXX| $F98A
    .byte $00 ; |        | $F98B
    .byte $00 ; |        | $F98C
    .byte $BF ; |X XXXXXX| $F98D
    .byte $48 ; | X  X   | $F98E
    .byte $5C ; | X XXX  | $F98F
    .byte $7E ; | XXXXXX | $F990
    .byte $0A ; |    X X | $F991
    .byte $1F ; |   XXXXX| $F992
    .byte $00 ; |        | $F993
    .byte $00 ; |        | $F994
    .byte $BF ; |X XXXXXX| $F995
    .byte $48 ; | X  X   | $F996
    .byte $5C ; | X XXX  | $F997
    .byte $7E ; | XXXXXX | $F998
    .byte $0A ; |    X X | $F999
    .byte $1F ; |   XXXXX| $F99A
    .byte $00 ; |        | $F99B
    .byte $00 ; |        | $F99C
    .byte $BF ; |X XXXXXX| $F99D
    .byte $48 ; | X  X   | $F99E
    .byte $5C ; | X XXX  | $F99F
    .byte $7E ; | XXXXXX | $F9A0
    .byte $0A ; |    X X | $F9A1
    .byte $1F ; |   XXXXX| $F9A2
    .byte $00 ; |        | $F9A3
    .byte $00 ; |        | $F9A4
    .byte $BF ; |X XXXXXX| $F9A5
    .byte $48 ; | X  X   | $F9A6
    .byte $5C ; | X XXX  | $F9A7
    .byte $7E ; | XXXXXX | $F9A8
    .byte $0A ; |    X X | $F9A9
    .byte $1F ; |   XXXXX| $F9AA
    .byte $00 ; |        | $F9AB
LF9AC:
    .byte $00 ; |        | $F9AC
    .byte $18 ; |   XX   | $F9AD
    .byte $18 ; |   XX   | $F9AE
    .byte $86 ; |X    XX | $F9AF
    .byte $08 ; |    X   | $F9B0
    .byte $34 ; |  XX X  | $F9B1
    .byte $86 ; |X    XX | $F9B2
    .byte $86 ; |X    XX | $F9B3
    .byte $28 ; |  X X   | $F9B4
    .byte $A6 ; |X X  XX | $F9B5
    .byte $08 ; |    X   | $F9B6
    .byte $1C ; |   XXX  | $F9B7
    .byte $38 ; |  XXX   | $F9B8
    .byte $08 ; |    X   | $F9B9
    .byte $08 ; |    X   | $F9BA
    .byte $08 ; |    X   | $F9BB
LF9BC:
    .byte $00 ; |        | $F9BC
LF9BD:
    .byte $00 ; |        | $F9BD
    .byte $80 ; |X       | $F9BE
    .byte $00 ; |        | $F9BF
    .byte $00 ; |        | $F9C0
    .byte $00 ; |        | $F9C1
    .byte $00 ; |        | $F9C2
    .byte $00 ; |        | $F9C3
    .byte $00 ; |        | $F9C4
    .byte $00 ; |        | $F9C5
    .byte $00 ; |        | $F9C6
    .byte $00 ; |        | $F9C7
    .byte $00 ; |        | $F9C8
    .byte $00 ; |        | $F9C9
    .byte $00 ; |        | $F9CA
    .byte $00 ; |        | $F9CB
    .byte $00 ; |        | $F9CC
    .byte $40 ; | X      | $F9CD
    .byte $40 ; | X      | $F9CE
    .byte $40 ; | X      | $F9CF
    .byte $40 ; | X      | $F9D0
    .byte $A0 ; |X X     | $F9D1
    .byte $A0 ; |X X     | $F9D2
    .byte $00 ; |        | $F9D3
    .byte $80 ; |X       | $F9D4
    .byte $00 ; |        | $F9D5
    .byte $00 ; |        | $F9D6
    .byte $00 ; |        | $F9D7
    .byte $00 ; |        | $F9D8
    .byte $00 ; |        | $F9D9
    .byte $00 ; |        | $F9DA
    .byte $00 ; |        | $F9DB
    .byte $00 ; |        | $F9DC
    .byte $40 ; | X      | $F9DD
    .byte $40 ; | X      | $F9DE
    .byte $40 ; | X      | $F9DF
    .byte $A0 ; |X X     | $F9E0
    .byte $A0 ; |X X     | $F9E1
    .byte $40 ; | X      | $F9E2
    .byte $00 ; |        | $F9E3
    .byte $80 ; |X       | $F9E4
    .byte $00 ; |        | $F9E5
    .byte $00 ; |        | $F9E6
    .byte $00 ; |        | $F9E7
    .byte $00 ; |        | $F9E8
    .byte $00 ; |        | $F9E9
    .byte $00 ; |        | $F9EA
    .byte $00 ; |        | $F9EB
    .byte $00 ; |        | $F9EC
    .byte $7E ; | XXXXXX | $F9ED
    .byte $FF ; |XXXXXXXX| $F9EE
    .byte $7E ; | XXXXXX | $F9EF
    .byte $3C ; |  XXXX  | $F9F0
    .byte $42 ; | X    X | $F9F1
    .byte $42 ; | X    X | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $80 ; |X       | $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $00 ; |        | $F9F7
    .byte $00 ; |        | $F9F8
    .byte $00 ; |        | $F9F9
    .byte $00 ; |        | $F9FA
    .byte $00 ; |        | $F9FB
    .byte $00 ; |        | $F9FC
    .byte $40 ; | X      | $F9FD
    .byte $20 ; |  X     | $F9FE
    .byte $14 ; |   X X  | $F9FF
    .byte $1C ; |   XXX  | $FA00
    .byte $1E ; |   XXXX | $FA01
    .byte $1E ; |   XXXX | $FA02
    .byte $00 ; |        | $FA03
    .byte $80 ; |X       | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $00 ; |        | $FA0A
    .byte $00 ; |        | $FA0B
    .byte $00 ; |        | $FA0C
    .byte $40 ; | X      | $FA0D
    .byte $00 ; |        | $FA0E
    .byte $80 ; |X       | $FA0F
    .byte $00 ; |        | $FA10
    .byte $00 ; |        | $FA11
    .byte $00 ; |        | $FA12
    .byte $00 ; |        | $FA13
    .byte $00 ; |        | $FA14
    .byte $00 ; |        | $FA15
    .byte $00 ; |        | $FA16
    .byte $00 ; |        | $FA17
    .byte $00 ; |        | $FA18
    .byte $00 ; |        | $FA19
    .byte $00 ; |        | $FA1A
    .byte $00 ; |        | $FA1B
    .byte $00 ; |        | $FA1C
    .byte $04 ; |     X  | $FA1D
    .byte $0A ; |    X X | $FA1E
    .byte $0A ; |    X X | $FA1F
    .byte $04 ; |     X  | $FA20
    .byte $04 ; |     X  | $FA21
    .byte $04 ; |     X  | $FA22
    .byte $00 ; |        | $FA23
    .byte $80 ; |X       | $FA24
    .byte $00 ; |        | $FA25
    .byte $00 ; |        | $FA26
    .byte $00 ; |        | $FA27
    .byte $00 ; |        | $FA28
    .byte $00 ; |        | $FA29
    .byte $00 ; |        | $FA2A
    .byte $00 ; |        | $FA2B
    .byte $00 ; |        | $FA2C
    .byte $04 ; |     X  | $FA2D
    .byte $0A ; |    X X | $FA2E
    .byte $0A ; |    X X | $FA2F
    .byte $04 ; |     X  | $FA30
    .byte $04 ; |     X  | $FA31
    .byte $04 ; |     X  | $FA32
    .byte $00 ; |        | $FA33
    .byte $80 ; |X       | $FA34
    .byte $00 ; |        | $FA35
    .byte $00 ; |        | $FA36
    .byte $00 ; |        | $FA37
    .byte $00 ; |        | $FA38
    .byte $00 ; |        | $FA39
    .byte $00 ; |        | $FA3A
    .byte $00 ; |        | $FA3B
    .byte $00 ; |        | $FA3C
    .byte $1C ; |   XXX  | $FA3D
    .byte $3E ; |  XXXXX | $FA3E
    .byte $7F ; | XXXXXXX| $FA3F
    .byte $7F ; | XXXXXXX| $FA40
    .byte $3E ; |  XXXXX | $FA41
    .byte $1C ; |   XXX  | $FA42
    .byte $00 ; |        | $FA43
    .byte $80 ; |X       | $FA44
    .byte $00 ; |        | $FA45
    .byte $00 ; |        | $FA46
    .byte $00 ; |        | $FA47
    .byte $00 ; |        | $FA48
    .byte $00 ; |        | $FA49
    .byte $00 ; |        | $FA4A
    .byte $00 ; |        | $FA4B
    .byte $00 ; |        | $FA4C
    .byte $D6 ; |XX X XX | $FA4D
    .byte $80 ; |X       | $FA4E
    .byte $56 ; | X X XX | $FA4F
    .byte $82 ; |X     X | $FA50
    .byte $D4 ; |XX X X  | $FA51
    .byte $02 ; |      X | $FA52
    .byte $D6 ; |XX X XX | $FA53
    .byte $00 ; |        | $FA54
    .byte $80 ; |X       | $FA55
    .byte $00 ; |        | $FA56
    .byte $00 ; |        | $FA57
    .byte $00 ; |        | $FA58
    .byte $00 ; |        | $FA59
    .byte $00 ; |        | $FA5A
    .byte $00 ; |        | $FA5B
    .byte $00 ; |        | $FA5C
    .byte $18 ; |   XX   | $FA5D
    .byte $3C ; |  XXXX  | $FA5E
    .byte $18 ; |   XX   | $FA5F
    .byte $00 ; |        | $FA60
    .byte $80 ; |X       | $FA61
    .byte $00 ; |        | $FA62
    .byte $00 ; |        | $FA63
    .byte $00 ; |        | $FA64
    .byte $00 ; |        | $FA65
    .byte $00 ; |        | $FA66
    .byte $00 ; |        | $FA67
    .byte $00 ; |        | $FA68
    .byte $00 ; |        | $FA69
    .byte $00 ; |        | $FA6A
    .byte $00 ; |        | $FA6B
    .byte $00 ; |        | $FA6C
    .byte $24 ; |  X  X  | $FA6D
    .byte $5A ; | X XX X | $FA6E
    .byte $24 ; |  X  X  | $FA6F
    .byte $00 ; |        | $FA70
    .byte $80 ; |X       | $FA71
    .byte $00 ; |        | $FA72
    .byte $00 ; |        | $FA73
    .byte $00 ; |        | $FA74
    .byte $00 ; |        | $FA75
    .byte $00 ; |        | $FA76
    .byte $00 ; |        | $FA77
    .byte $00 ; |        | $FA78
    .byte $00 ; |        | $FA79
    .byte $00 ; |        | $FA7A
    .byte $00 ; |        | $FA7B
    .byte $00 ; |        | $FA7C
    .byte $24 ; |  X  X  | $FA7D
    .byte $5A ; | X XX X | $FA7E
    .byte $24 ; |  X  X  | $FA7F
    .byte $00 ; |        | $FA80
    .byte $80 ; |X       | $FA81
    .byte $00 ; |        | $FA82
    .byte $00 ; |        | $FA83
    .byte $00 ; |        | $FA84
LFA85:
    .byte $00 ; |        | $FA85
    .byte $00 ; |        | $FA86
    .byte $00 ; |        | $FA87
    .byte $00 ; |        | $FA88
    .byte $00 ; |        | $FA89
    .byte $00 ; |        | $FA8A
    .byte $00 ; |        | $FA8B
    .byte $00 ; |        | $FA8C
    .byte $B7 ; |X XX XXX| $FA8D
    .byte $AD ; |X X XX X| $FA8E
    .byte $BB ; |X XXX XX| $FA8F
    .byte $00 ; |        | $FA90
    .byte $80 ; |X       | $FA91
    .byte $00 ; |        | $FA92
    .byte $00 ; |        | $FA93
    .byte $00 ; |        | $FA94
    .byte $00 ; |        | $FA95
    .byte $00 ; |        | $FA96
    .byte $00 ; |        | $FA97
    .byte $00 ; |        | $FA98
    .byte $00 ; |        | $FA99
    .byte $00 ; |        | $FA9A
    .byte $00 ; |        | $FA9B
    .byte $00 ; |        | $FA9C
    .byte $B7 ; |X XX XXX| $FA9D
    .byte $AD ; |X X XX X| $FA9E
    .byte $BB ; |X XXX XX| $FA9F
    .byte $00 ; |        | $FAA0
    .byte $80 ; |X       | $FAA1
    .byte $00 ; |        | $FAA2
    .byte $00 ; |        | $FAA3
    .byte $00 ; |        | $FAA4
    .byte $00 ; |        | $FAA5
    .byte $00 ; |        | $FAA6
    .byte $00 ; |        | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $00 ; |        | $FAAA
    .byte $00 ; |        | $FAAB
    .byte $00 ; |        | $FAAC
    .byte $B7 ; |X XX XXX| $FAAD
    .byte $AD ; |X X XX X| $FAAE
    .byte $BB ; |X XXX XX| $FAAF
    .byte $00 ; |        | $FAB0
    .byte $80 ; |X       | $FAB1
    .byte $00 ; |        | $FAB2
    .byte $00 ; |        | $FAB3
    .byte $00 ; |        | $FAB4
    .byte $00 ; |        | $FAB5
    .byte $00 ; |        | $FAB6
    .byte $00 ; |        | $FAB7
    .byte $00 ; |        | $FAB8
    .byte $00 ; |        | $FAB9
    .byte $00 ; |        | $FABA
    .byte $00 ; |        | $FABB
    .byte $FF ; |XXXXXXXX| $FABC
    .byte $FF ; |XXXXXXXX| $FABD
    .byte $FF ; |XXXXXXXX| $FABE
    .byte $FF ; |XXXXXXXX| $FABF
    .byte $FF ; |XXXXXXXX| $FAC0
    .byte $FF ; |XXXXXXXX| $FAC1
    .byte $FF ; |XXXXXXXX| $FAC2
    .byte $FF ; |XXXXXXXX| $FAC3
    .byte $FF ; |XXXXXXXX| $FAC4
    .byte $FF ; |XXXXXXXX| $FAC5
    .byte $FF ; |XXXXXXXX| $FAC6
    .byte $FF ; |XXXXXXXX| $FAC7
    .byte $FF ; |XXXXXXXX| $FAC8
    .byte $FF ; |XXXXXXXX| $FAC9
    .byte $FF ; |XXXXXXXX| $FACA
    .byte $FF ; |XXXXXXXX| $FACB
    .byte $FF ; |XXXXXXXX| $FACC
    .byte $FF ; |XXXXXXXX| $FACD
    .byte $FF ; |XXXXXXXX| $FACE
    .byte $FF ; |XXXXXXXX| $FACF
    .byte $FF ; |XXXXXXXX| $FAD0
    .byte $FF ; |XXXXXXXX| $FAD1
    .byte $FF ; |XXXXXXXX| $FAD2
    .byte $FF ; |XXXXXXXX| $FAD3
    .byte $FF ; |XXXXXXXX| $FAD4
    .byte $FF ; |XXXXXXXX| $FAD5
    .byte $FF ; |XXXXXXXX| $FAD6
    .byte $FF ; |XXXXXXXX| $FAD7
    .byte $FF ; |XXXXXXXX| $FAD8
    .byte $FF ; |XXXXXXXX| $FAD9
    .byte $FF ; |XXXXXXXX| $FADA
    .byte $FF ; |XXXXXXXX| $FADB
    .byte $FF ; |XXXXXXXX| $FADC
    .byte $FF ; |XXXXXXXX| $FADD
    .byte $FF ; |XXXXXXXX| $FADE
    .byte $FF ; |XXXXXXXX| $FADF
    .byte $FF ; |XXXXXXXX| $FAE0
    .byte $FF ; |XXXXXXXX| $FAE1
    .byte $FF ; |XXXXXXXX| $FAE2
    .byte $FF ; |XXXXXXXX| $FAE3
    .byte $FF ; |XXXXXXXX| $FAE4
    .byte $FF ; |XXXXXXXX| $FAE5
    .byte $FF ; |XXXXXXXX| $FAE6
    .byte $FF ; |XXXXXXXX| $FAE7
    .byte $FF ; |XXXXXXXX| $FAE8
    .byte $FF ; |XXXXXXXX| $FAE9
    .byte $FF ; |XXXXXXXX| $FAEA
    .byte $FF ; |XXXXXXXX| $FAEB
    .byte $FF ; |XXXXXXXX| $FAEC
    .byte $FF ; |XXXXXXXX| $FAED
    .byte $FF ; |XXXXXXXX| $FAEE
    .byte $FF ; |XXXXXXXX| $FAEF
    .byte $FF ; |XXXXXXXX| $FAF0
    .byte $FF ; |XXXXXXXX| $FAF1
    .byte $FF ; |XXXXXXXX| $FAF2
    .byte $FF ; |XXXXXXXX| $FAF3
    .byte $FF ; |XXXXXXXX| $FAF4
    .byte $FF ; |XXXXXXXX| $FAF5
    .byte $FF ; |XXXXXXXX| $FAF6
    .byte $FF ; |XXXXXXXX| $FAF7
    .byte $FF ; |XXXXXXXX| $FAF8
    .byte $FF ; |XXXXXXXX| $FAF9
    .byte $FF ; |XXXXXXXX| $FAFA
    .byte $FF ; |XXXXXXXX| $FAFB
    .byte $FF ; |XXXXXXXX| $FAFC
    .byte $FF ; |XXXXXXXX| $FAFD
    .byte $FF ; |XXXXXXXX| $FAFE
    .byte $FF ; |XXXXXXXX| $FAFF
    .byte $FF ; |XXXXXXXX| $FB00
    .byte $FF ; |XXXXXXXX| $FB01
    .byte $FF ; |XXXXXXXX| $FB02
    .byte $FF ; |XXXXXXXX| $FB03
    .byte $FF ; |XXXXXXXX| $FB04
    .byte $FF ; |XXXXXXXX| $FB05
    .byte $FF ; |XXXXXXXX| $FB06
    .byte $FF ; |XXXXXXXX| $FB07
    .byte $FF ; |XXXXXXXX| $FB08
    .byte $FF ; |XXXXXXXX| $FB09
    .byte $FF ; |XXXXXXXX| $FB0A
    .byte $FF ; |XXXXXXXX| $FB0B
    .byte $FF ; |XXXXXXXX| $FB0C
    .byte $FF ; |XXXXXXXX| $FB0D
    .byte $FF ; |XXXXXXXX| $FB0E
    .byte $FF ; |XXXXXXXX| $FB0F
    .byte $FF ; |XXXXXXXX| $FB10
    .byte $FF ; |XXXXXXXX| $FB11
    .byte $FF ; |XXXXXXXX| $FB12
    .byte $FF ; |XXXXXXXX| $FB13
    .byte $FF ; |XXXXXXXX| $FB14
    .byte $FF ; |XXXXXXXX| $FB15
    .byte $FF ; |XXXXXXXX| $FB16
    .byte $FF ; |XXXXXXXX| $FB17
    .byte $FF ; |XXXXXXXX| $FB18
    .byte $FF ; |XXXXXXXX| $FB19
    .byte $FF ; |XXXXXXXX| $FB1A
    .byte $FF ; |XXXXXXXX| $FB1B
    .byte $FF ; |XXXXXXXX| $FB1C
    .byte $FF ; |XXXXXXXX| $FB1D
    .byte $FF ; |XXXXXXXX| $FB1E
    .byte $FF ; |XXXXXXXX| $FB1F
    .byte $FF ; |XXXXXXXX| $FB20
    .byte $FF ; |XXXXXXXX| $FB21
    .byte $FF ; |XXXXXXXX| $FB22
    .byte $FF ; |XXXXXXXX| $FB23
    .byte $FF ; |XXXXXXXX| $FB24
    .byte $FF ; |XXXXXXXX| $FB25
    .byte $FF ; |XXXXXXXX| $FB26
    .byte $FF ; |XXXXXXXX| $FB27
    .byte $FF ; |XXXXXXXX| $FB28
    .byte $FF ; |XXXXXXXX| $FB29
    .byte $FF ; |XXXXXXXX| $FB2A
    .byte $FF ; |XXXXXXXX| $FB2B
    .byte $FF ; |XXXXXXXX| $FB2C
    .byte $FF ; |XXXXXXXX| $FB2D
    .byte $FF ; |XXXXXXXX| $FB2E
    .byte $FF ; |XXXXXXXX| $FB2F
    .byte $FF ; |XXXXXXXX| $FB30
    .byte $FF ; |XXXXXXXX| $FB31
    .byte $FF ; |XXXXXXXX| $FB32
    .byte $FF ; |XXXXXXXX| $FB33
    .byte $FF ; |XXXXXXXX| $FB34
    .byte $FF ; |XXXXXXXX| $FB35
    .byte $FF ; |XXXXXXXX| $FB36
    .byte $FF ; |XXXXXXXX| $FB37
    .byte $FF ; |XXXXXXXX| $FB38
    .byte $FF ; |XXXXXXXX| $FB39
    .byte $FF ; |XXXXXXXX| $FB3A
    .byte $FF ; |XXXXXXXX| $FB3B
    .byte $FF ; |XXXXXXXX| $FB3C
    .byte $FF ; |XXXXXXXX| $FB3D
    .byte $FF ; |XXXXXXXX| $FB3E
    .byte $FF ; |XXXXXXXX| $FB3F
    .byte $FF ; |XXXXXXXX| $FB40
    .byte $FF ; |XXXXXXXX| $FB41
    .byte $FF ; |XXXXXXXX| $FB42
    .byte $FF ; |XXXXXXXX| $FB43
    .byte $FF ; |XXXXXXXX| $FB44
    .byte $FF ; |XXXXXXXX| $FB45
    .byte $FF ; |XXXXXXXX| $FB46
    .byte $FF ; |XXXXXXXX| $FB47
    .byte $FF ; |XXXXXXXX| $FB48
    .byte $FF ; |XXXXXXXX| $FB49
    .byte $FF ; |XXXXXXXX| $FB4A
    .byte $FF ; |XXXXXXXX| $FB4B
    .byte $FF ; |XXXXXXXX| $FB4C
    .byte $FF ; |XXXXXXXX| $FB4D
    .byte $FF ; |XXXXXXXX| $FB4E
    .byte $FF ; |XXXXXXXX| $FB4F
    .byte $FF ; |XXXXXXXX| $FB50
    .byte $FF ; |XXXXXXXX| $FB51
    .byte $FF ; |XXXXXXXX| $FB52
    .byte $FF ; |XXXXXXXX| $FB53
    .byte $FF ; |XXXXXXXX| $FB54
    .byte $FF ; |XXXXXXXX| $FB55
    .byte $FF ; |XXXXXXXX| $FB56
    .byte $FF ; |XXXXXXXX| $FB57
    .byte $FF ; |XXXXXXXX| $FB58
    .byte $FF ; |XXXXXXXX| $FB59
    .byte $FF ; |XXXXXXXX| $FB5A
    .byte $FF ; |XXXXXXXX| $FB5B
    .byte $FF ; |XXXXXXXX| $FB5C
    .byte $FF ; |XXXXXXXX| $FB5D
    .byte $FF ; |XXXXXXXX| $FB5E
    .byte $FF ; |XXXXXXXX| $FB5F
    .byte $FF ; |XXXXXXXX| $FB60
    .byte $FF ; |XXXXXXXX| $FB61
    .byte $FF ; |XXXXXXXX| $FB62
    .byte $FF ; |XXXXXXXX| $FB63
    .byte $FF ; |XXXXXXXX| $FB64
    .byte $FF ; |XXXXXXXX| $FB65
    .byte $FF ; |XXXXXXXX| $FB66
    .byte $FF ; |XXXXXXXX| $FB67
    .byte $FF ; |XXXXXXXX| $FB68
    .byte $FF ; |XXXXXXXX| $FB69
    .byte $FF ; |XXXXXXXX| $FB6A
    .byte $FF ; |XXXXXXXX| $FB6B
    .byte $FF ; |XXXXXXXX| $FB6C
    .byte $FF ; |XXXXXXXX| $FB6D
    .byte $FF ; |XXXXXXXX| $FB6E
    .byte $FF ; |XXXXXXXX| $FB6F
    .byte $FF ; |XXXXXXXX| $FB70
    .byte $FF ; |XXXXXXXX| $FB71
    .byte $FF ; |XXXXXXXX| $FB72
    .byte $FF ; |XXXXXXXX| $FB73
    .byte $FF ; |XXXXXXXX| $FB74
    .byte $FF ; |XXXXXXXX| $FB75
    .byte $FF ; |XXXXXXXX| $FB76
    .byte $FF ; |XXXXXXXX| $FB77
    .byte $FF ; |XXXXXXXX| $FB78
    .byte $FF ; |XXXXXXXX| $FB79
    .byte $FF ; |XXXXXXXX| $FB7A
    .byte $FF ; |XXXXXXXX| $FB7B
    .byte $FF ; |XXXXXXXX| $FB7C
    .byte $FF ; |XXXXXXXX| $FB7D
    .byte $FF ; |XXXXXXXX| $FB7E
    .byte $FF ; |XXXXXXXX| $FB7F
    .byte $FF ; |XXXXXXXX| $FB80
    .byte $FF ; |XXXXXXXX| $FB81
    .byte $FF ; |XXXXXXXX| $FB82
    .byte $FF ; |XXXXXXXX| $FB83
    .byte $FF ; |XXXXXXXX| $FB84
    .byte $FF ; |XXXXXXXX| $FB85
    .byte $FF ; |XXXXXXXX| $FB86
    .byte $FF ; |XXXXXXXX| $FB87
    .byte $FF ; |XXXXXXXX| $FB88
    .byte $FF ; |XXXXXXXX| $FB89
    .byte $FF ; |XXXXXXXX| $FB8A
    .byte $FF ; |XXXXXXXX| $FB8B
    .byte $FF ; |XXXXXXXX| $FB8C
    .byte $FF ; |XXXXXXXX| $FB8D
    .byte $FF ; |XXXXXXXX| $FB8E
    .byte $FF ; |XXXXXXXX| $FB8F
    .byte $FF ; |XXXXXXXX| $FB90
    .byte $FF ; |XXXXXXXX| $FB91
    .byte $FF ; |XXXXXXXX| $FB92
    .byte $FF ; |XXXXXXXX| $FB93
    .byte $FF ; |XXXXXXXX| $FB94
    .byte $FF ; |XXXXXXXX| $FB95
    .byte $FF ; |XXXXXXXX| $FB96
    .byte $FF ; |XXXXXXXX| $FB97
    .byte $FF ; |XXXXXXXX| $FB98
    .byte $FF ; |XXXXXXXX| $FB99
    .byte $FF ; |XXXXXXXX| $FB9A
    .byte $FF ; |XXXXXXXX| $FB9B
    .byte $FF ; |XXXXXXXX| $FB9C
    .byte $FF ; |XXXXXXXX| $FB9D
    .byte $FF ; |XXXXXXXX| $FB9E
    .byte $FF ; |XXXXXXXX| $FB9F
    .byte $FF ; |XXXXXXXX| $FBA0
    .byte $FF ; |XXXXXXXX| $FBA1
    .byte $FF ; |XXXXXXXX| $FBA2
    .byte $FF ; |XXXXXXXX| $FBA3
    .byte $FF ; |XXXXXXXX| $FBA4
    .byte $FF ; |XXXXXXXX| $FBA5
    .byte $FF ; |XXXXXXXX| $FBA6
    .byte $FF ; |XXXXXXXX| $FBA7
    .byte $FF ; |XXXXXXXX| $FBA8
    .byte $FF ; |XXXXXXXX| $FBA9
    .byte $FF ; |XXXXXXXX| $FBAA
    .byte $FF ; |XXXXXXXX| $FBAB
    .byte $FF ; |XXXXXXXX| $FBAC
    .byte $FF ; |XXXXXXXX| $FBAD
    .byte $FF ; |XXXXXXXX| $FBAE
    .byte $FF ; |XXXXXXXX| $FBAF
    .byte $FF ; |XXXXXXXX| $FBB0
    .byte $FF ; |XXXXXXXX| $FBB1
    .byte $FF ; |XXXXXXXX| $FBB2
    .byte $FF ; |XXXXXXXX| $FBB3
    .byte $FF ; |XXXXXXXX| $FBB4
    .byte $FF ; |XXXXXXXX| $FBB5
    .byte $FF ; |XXXXXXXX| $FBB6
    .byte $FF ; |XXXXXXXX| $FBB7
    .byte $FF ; |XXXXXXXX| $FBB8
    .byte $FF ; |XXXXXXXX| $FBB9
    .byte $FF ; |XXXXXXXX| $FBBA
    .byte $FF ; |XXXXXXXX| $FBBB
    .byte $FF ; |XXXXXXXX| $FBBC
    .byte $FF ; |XXXXXXXX| $FBBD
    .byte $FF ; |XXXXXXXX| $FBBE
    .byte $FF ; |XXXXXXXX| $FBBF
    .byte $FF ; |XXXXXXXX| $FBC0
    .byte $FF ; |XXXXXXXX| $FBC1
    .byte $FF ; |XXXXXXXX| $FBC2
    .byte $FF ; |XXXXXXXX| $FBC3
    .byte $FF ; |XXXXXXXX| $FBC4
    .byte $FF ; |XXXXXXXX| $FBC5
    .byte $FF ; |XXXXXXXX| $FBC6
    .byte $FF ; |XXXXXXXX| $FBC7
    .byte $FF ; |XXXXXXXX| $FBC8
    .byte $FF ; |XXXXXXXX| $FBC9
    .byte $FF ; |XXXXXXXX| $FBCA
    .byte $FF ; |XXXXXXXX| $FBCB
    .byte $FF ; |XXXXXXXX| $FBCC
    .byte $FF ; |XXXXXXXX| $FBCD
    .byte $FF ; |XXXXXXXX| $FBCE
    .byte $FF ; |XXXXXXXX| $FBCF
    .byte $FF ; |XXXXXXXX| $FBD0
    .byte $FF ; |XXXXXXXX| $FBD1
    .byte $FF ; |XXXXXXXX| $FBD2
    .byte $FF ; |XXXXXXXX| $FBD3
    .byte $FF ; |XXXXXXXX| $FBD4
    .byte $FF ; |XXXXXXXX| $FBD5
    .byte $FF ; |XXXXXXXX| $FBD6
    .byte $FF ; |XXXXXXXX| $FBD7
    .byte $FF ; |XXXXXXXX| $FBD8
    .byte $FF ; |XXXXXXXX| $FBD9
    .byte $FF ; |XXXXXXXX| $FBDA
    .byte $FF ; |XXXXXXXX| $FBDB
    .byte $FF ; |XXXXXXXX| $FBDC
    .byte $FF ; |XXXXXXXX| $FBDD
    .byte $FF ; |XXXXXXXX| $FBDE
    .byte $FF ; |XXXXXXXX| $FBDF
    .byte $FF ; |XXXXXXXX| $FBE0
    .byte $FF ; |XXXXXXXX| $FBE1
    .byte $FF ; |XXXXXXXX| $FBE2
    .byte $FF ; |XXXXXXXX| $FBE3
    .byte $FF ; |XXXXXXXX| $FBE4
    .byte $FF ; |XXXXXXXX| $FBE5
    .byte $FF ; |XXXXXXXX| $FBE6
    .byte $FF ; |XXXXXXXX| $FBE7
    .byte $FF ; |XXXXXXXX| $FBE8
    .byte $FF ; |XXXXXXXX| $FBE9
    .byte $FF ; |XXXXXXXX| $FBEA
    .byte $FF ; |XXXXXXXX| $FBEB
    .byte $FF ; |XXXXXXXX| $FBEC
    .byte $FF ; |XXXXXXXX| $FBED
    .byte $FF ; |XXXXXXXX| $FBEE
    .byte $FF ; |XXXXXXXX| $FBEF
    .byte $FF ; |XXXXXXXX| $FBF0
    .byte $FF ; |XXXXXXXX| $FBF1
    .byte $FF ; |XXXXXXXX| $FBF2
    .byte $FF ; |XXXXXXXX| $FBF3
    .byte $FF ; |XXXXXXXX| $FBF4
    .byte $FF ; |XXXXXXXX| $FBF5
    .byte $FF ; |XXXXXXXX| $FBF6
    .byte $FF ; |XXXXXXXX| $FBF7
    .byte $FF ; |XXXXXXXX| $FBF8
    .byte $FF ; |XXXXXXXX| $FBF9
    .byte $FF ; |XXXXXXXX| $FBFA
    .byte $FF ; |XXXXXXXX| $FBFB
    .byte $FF ; |XXXXXXXX| $FBFC
    .byte $FF ; |XXXXXXXX| $FBFD
    .byte $FF ; |XXXXXXXX| $FBFE
    .byte $FF ; |XXXXXXXX| $FBFF

START:
    sei                    ; 2
    cld                    ; 2
    lda    #$00            ; 2
    tax                    ; 2
LFC05:
    sta    VSYNC,X         ; 4
    inx                    ; 2
    bne    LFC05           ; 2
    dex                    ; 2
    txs                    ; 2
    sta    LFFE0           ; 4
    sta    LFFE9           ; 4
    sta    LFFF2           ; 4
    jsr    $D112           ; 6
    lda    $AA             ; 3
    ora    #$01            ; 2
    sta    $AA             ; 3
    lda    #$00            ; 2
    sta    $DC             ; 3
    sta    $DD             ; 3
    lda    #$02            ; 2
    sta    $C2             ; 3
    sta    $B3             ; 3
    jmp    $D000           ; 3

    sta    LFFE4           ; 4
    sta    LFFED           ; 4
    sta    LFFF6           ; 4
    jmp    LF000           ; 3

    sta    LFFE0           ; 4
    sta    LFFE9           ; 4
    sta    LFFF2           ; 4
    rts                    ; 6

LFC43:
    lda    #$00            ; 2
    sta    PF0             ; 3
    sta    PF1             ; 3
    sta    PF2             ; 3
    sta    COLUP0          ; 3
    sta    COLUP1          ; 3
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    sta    NUSIZ0          ; 3
    sta    NUSIZ1          ; 3
    sta    REFP0           ; 3
    sta    REFP1           ; 3
    sta    CTRLPF          ; 3
    sta    WSYNC           ; 3
    rts                    ; 6

    lda    $86             ; 3
    and    #$F7            ; 2
    sta    $86             ; 3
    lda    $89             ; 3
    and    #$FD            ; 2
    sta    $89             ; 3
    lda    #$FF            ; 2
    sta    $CC             ; 3
    lda    $80             ; 3
    and    #$0F            ; 2
    beq    LFC7D           ; 2
    dec    $80             ; 5
    rts                    ; 6

LFC7D:
    lda    $AA             ; 3
    ora    #$01            ; 2
    sta    $AA             ; 3
    lda    #$02            ; 2
    sta    $C2             ; 3
    rts                    ; 6

    lda    $80             ; 3
    sta    $EF             ; 3
    lda    $83             ; 3
    sta    $F0             ; 3
    lda    $AA             ; 3
    sta    $F1             ; 3
    lda    $B3             ; 3
    and    #$0F            ; 2
    sta    $C4             ; 3
    ldx    #$41            ; 2
    lda    #$00            ; 2
LFC9E:
    sta    $80,X           ; 4
    dex                    ; 2
    bpl    LFC9E           ; 2
    ldx    #$04            ; 2
LFCA5:
    sta    $D2,X           ; 4
    sta    $D7,X           ; 4
    dex                    ; 2
    bpl    LFCA5           ; 2
    stx    $D0             ; 3
    sta    $C7             ; 3
    ldx    $C4             ; 3
    stx    $B3             ; 3
    sta    $C4             ; 3
    lda    #$5A            ; 2
    sta    $EB             ; 3
    lda    $EF             ; 3
    and    #$0F            ; 2
    sta    $80             ; 3
    lda    $F0             ; 3
    and    #$0F            ; 2
    sta    $83             ; 3
    lda    $F1             ; 3
    and    #$0F            ; 2
    sta    $AA             ; 3
    lda    #$2B            ; 2
    sta    $C3             ; 3
    lda    #$4A            ; 2
    sta    $CD             ; 3
    lda    #$18            ; 2
    sta    $CC             ; 3
    lda    $86             ; 3
    ora    #$08            ; 2
    sta    $86             ; 3
    jsr    $DA85           ; 6
    rts                    ; 6

    sed                    ; 2
    clc                    ; 2
    adc    $E6             ; 3
    sta    $E6             ; 3
    tya                    ; 2
    adc    $E7             ; 3
    sta    $E7             ; 3
    bcc    LFCF5           ; 2
    lda    $E8             ; 3
    adc    #$00            ; 2
    sta    $E8             ; 3
LFCF5:
    cld                    ; 2
    rts                    ; 6

    .byte $FF ; |XXXXXXXX| $FCF7
    .byte $FF ; |XXXXXXXX| $FCF8
    .byte $FF ; |XXXXXXXX| $FCF9
    .byte $FF ; |XXXXXXXX| $FCFA
    .byte $FF ; |XXXXXXXX| $FCFB
    .byte $FF ; |XXXXXXXX| $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
    .byte $FF ; |XXXXXXXX| $FCFF
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $8D ; |X   XX X| $FD06
    .byte $FE ; |XXXXXXX | $FD07
    .byte $60 ; | XX     | $FD08
    .byte $FD ; |XXXXXX X| $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $20 ; |  X     | $FD0C
    .byte $FD ; |XXXXXX X| $FD0D
    .byte $1C ; |   XXX  | $FD0E
    .byte $FE ; |XXXXXXX | $FD0F
    .byte $00 ; |        | $FD10
    .byte $00 ; |        | $FD11
    .byte $00 ; |        | $FD12
    .byte $00 ; |        | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $00 ; |        | $FD18
    .byte $00 ; |        | $FD19
    .byte $77 ; | XXX XXX| $FD1A
    .byte $FD ; |XXXXXX X| $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $3F ; |  XXXXXX| $FD20
    .byte $01 ; |       X| $FD21
    .byte $01 ; |       X| $FD22
    .byte $01 ; |       X| $FD23
    .byte $01 ; |       X| $FD24
    .byte $01 ; |       X| $FD25
    .byte $01 ; |       X| $FD26
    .byte $01 ; |       X| $FD27
    .byte $01 ; |       X| $FD28
    .byte $01 ; |       X| $FD29
    .byte $01 ; |       X| $FD2A
    .byte $01 ; |       X| $FD2B
    .byte $01 ; |       X| $FD2C
    .byte $01 ; |       X| $FD2D
    .byte $01 ; |       X| $FD2E
    .byte $01 ; |       X| $FD2F
    .byte $01 ; |       X| $FD30
    .byte $02 ; |      X | $FD31
    .byte $02 ; |      X | $FD32
    .byte $02 ; |      X | $FD33
    .byte $02 ; |      X | $FD34
    .byte $02 ; |      X | $FD35
    .byte $02 ; |      X | $FD36
    .byte $02 ; |      X | $FD37
    .byte $03 ; |      XX| $FD38
    .byte $03 ; |      XX| $FD39
    .byte $03 ; |      XX| $FD3A
    .byte $03 ; |      XX| $FD3B
    .byte $03 ; |      XX| $FD3C
    .byte $03 ; |      XX| $FD3D
    .byte $04 ; |     X  | $FD3E
    .byte $04 ; |     X  | $FD3F
    .byte $04 ; |     X  | $FD40
    .byte $05 ; |     X X| $FD41
    .byte $05 ; |     X X| $FD42
    .byte $06 ; |     XX | $FD43
    .byte $06 ; |     XX | $FD44
    .byte $07 ; |     XXX| $FD45
    .byte $07 ; |     XXX| $FD46
    .byte $07 ; |     XXX| $FD47
    .byte $08 ; |    X   | $FD48
    .byte $08 ; |    X   | $FD49
    .byte $09 ; |    X  X| $FD4A
    .byte $0A ; |    X X | $FD4B
    .byte $0B ; |    X XX| $FD4C
    .byte $0C ; |    XX  | $FD4D
    .byte $0D ; |    XX X| $FD4E
    .byte $0E ; |    XXX | $FD4F
    .byte $0C ; |    XX  | $FD50
    .byte $0D ; |    XX X| $FD51
    .byte $0E ; |    XXX | $FD52
    .byte $0F ; |    XXXX| $FD53
    .byte $0F ; |    XXXX| $FD54
    .byte $0F ; |    XXXX| $FD55
    .byte $0F ; |    XXXX| $FD56
    .byte $0F ; |    XXXX| $FD57
    .byte $0F ; |    XXXX| $FD58
    .byte $0F ; |    XXXX| $FD59
    .byte $0F ; |    XXXX| $FD5A
    .byte $0F ; |    XXXX| $FD5B
    .byte $02 ; |      X | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $0A ; |    X X | $FD5E
    .byte $02 ; |      X | $FD5F
    .byte $16 ; |   X XX | $FD60
    .byte $01 ; |       X| $FD61
    .byte $01 ; |       X| $FD62
    .byte $01 ; |       X| $FD63
    .byte $01 ; |       X| $FD64
    .byte $01 ; |       X| $FD65
    .byte $01 ; |       X| $FD66
    .byte $02 ; |      X | $FD67
    .byte $02 ; |      X | $FD68
    .byte $02 ; |      X | $FD69
    .byte $03 ; |      XX| $FD6A
    .byte $03 ; |      XX| $FD6B
    .byte $04 ; |     X  | $FD6C
    .byte $04 ; |     X  | $FD6D
    .byte $05 ; |     X X| $FD6E
    .byte $06 ; |     XX | $FD6F
    .byte $07 ; |     XXX| $FD70
    .byte $07 ; |     XXX| $FD71
    .byte $07 ; |     XXX| $FD72
    .byte $02 ; |      X | $FD73
    .byte $00 ; |        | $FD74
    .byte $0A ; |    X X | $FD75
    .byte $02 ; |      X | $FD76
    .byte $A4 ; |X X  X  | $FD77
    .byte $01 ; |       X| $FD78
    .byte $10 ; |   X    | $FD79
    .byte $01 ; |       X| $FD7A
    .byte $10 ; |   X    | $FD7B
    .byte $01 ; |       X| $FD7C
    .byte $10 ; |   X    | $FD7D
    .byte $02 ; |      X | $FD7E
    .byte $11 ; |   X   X| $FD7F
    .byte $02 ; |      X | $FD80
    .byte $11 ; |   X   X| $FD81
    .byte $02 ; |      X | $FD82
    .byte $11 ; |   X   X| $FD83
    .byte $03 ; |      XX| $FD84
    .byte $12 ; |   X  X | $FD85
    .byte $03 ; |      XX| $FD86
    .byte $12 ; |   X  X | $FD87
    .byte $03 ; |      XX| $FD88
    .byte $12 ; |   X  X | $FD89
    .byte $04 ; |     X  | $FD8A
    .byte $13 ; |   X  XX| $FD8B
    .byte $04 ; |     X  | $FD8C
    .byte $13 ; |   X  XX| $FD8D
    .byte $04 ; |     X  | $FD8E
    .byte $13 ; |   X  XX| $FD8F
    .byte $05 ; |     X X| $FD90
    .byte $14 ; |   X X  | $FD91
    .byte $05 ; |     X X| $FD92
    .byte $14 ; |   X X  | $FD93
    .byte $05 ; |     X X| $FD94
    .byte $14 ; |   X X  | $FD95
    .byte $06 ; |     XX | $FD96
    .byte $15 ; |   X X X| $FD97
    .byte $06 ; |     XX | $FD98
    .byte $15 ; |   X X X| $FD99
    .byte $06 ; |     XX | $FD9A
    .byte $15 ; |   X X X| $FD9B
    .byte $07 ; |     XXX| $FD9C
    .byte $16 ; |   X XX | $FD9D
    .byte $07 ; |     XXX| $FD9E
    .byte $16 ; |   X XX | $FD9F
    .byte $07 ; |     XXX| $FDA0
    .byte $16 ; |   X XX | $FDA1
    .byte $08 ; |    X   | $FDA2
    .byte $17 ; |   X XXX| $FDA3
    .byte $08 ; |    X   | $FDA4
    .byte $17 ; |   X XXX| $FDA5
    .byte $08 ; |    X   | $FDA6
    .byte $17 ; |   X XXX| $FDA7
    .byte $09 ; |    X  X| $FDA8
    .byte $18 ; |   XX   | $FDA9
    .byte $09 ; |    X  X| $FDAA
    .byte $18 ; |   XX   | $FDAB
    .byte $09 ; |    X  X| $FDAC
    .byte $18 ; |   XX   | $FDAD
    .byte $0A ; |    X X | $FDAE
    .byte $19 ; |   XX  X| $FDAF
    .byte $0A ; |    X X | $FDB0
    .byte $19 ; |   XX  X| $FDB1
    .byte $0A ; |    X X | $FDB2
    .byte $19 ; |   XX  X| $FDB3
    .byte $0A ; |    X X | $FDB4
    .byte $1A ; |   XX X | $FDB5
    .byte $0A ; |    X X | $FDB6
    .byte $1A ; |   XX X | $FDB7
    .byte $0A ; |    X X | $FDB8
    .byte $1B ; |   XX XX| $FDB9
    .byte $0A ; |    X X | $FDBA
    .byte $1B ; |   XX XX| $FDBB
    .byte $0A ; |    X X | $FDBC
    .byte $1C ; |   XXX  | $FDBD
    .byte $0A ; |    X X | $FDBE
    .byte $1C ; |   XXX  | $FDBF
    .byte $0A ; |    X X | $FDC0
    .byte $1D ; |   XXX X| $FDC1
    .byte $0A ; |    X X | $FDC2
    .byte $1D ; |   XXX X| $FDC3
    .byte $0A ; |    X X | $FDC4
    .byte $1E ; |   XXXX | $FDC5
    .byte $0A ; |    X X | $FDC6
    .byte $1E ; |   XXXX | $FDC7
    .byte $0A ; |    X X | $FDC8
    .byte $1F ; |   XXXXX| $FDC9
    .byte $0A ; |    X X | $FDCA
    .byte $1F ; |   XXXXX| $FDCB
    .byte $0A ; |    X X | $FDCC
    .byte $1F ; |   XXXXX| $FDCD
    .byte $0A ; |    X X | $FDCE
    .byte $1F ; |   XXXXX| $FDCF
    .byte $0A ; |    X X | $FDD0
    .byte $1F ; |   XXXXX| $FDD1
    .byte $0A ; |    X X | $FDD2
    .byte $1F ; |   XXXXX| $FDD3
    .byte $0A ; |    X X | $FDD4
    .byte $1F ; |   XXXXX| $FDD5
    .byte $0A ; |    X X | $FDD6
    .byte $1F ; |   XXXXX| $FDD7
    .byte $0A ; |    X X | $FDD8
    .byte $1F ; |   XXXXX| $FDD9
    .byte $0A ; |    X X | $FDDA
    .byte $1F ; |   XXXXX| $FDDB
    .byte $0A ; |    X X | $FDDC
    .byte $1F ; |   XXXXX| $FDDD
    .byte $0A ; |    X X | $FDDE
    .byte $1F ; |   XXXXX| $FDDF
    .byte $0A ; |    X X | $FDE0
    .byte $1F ; |   XXXXX| $FDE1
    .byte $0A ; |    X X | $FDE2
    .byte $1F ; |   XXXXX| $FDE3
    .byte $0A ; |    X X | $FDE4
    .byte $1F ; |   XXXXX| $FDE5
    .byte $0A ; |    X X | $FDE6
    .byte $1F ; |   XXXXX| $FDE7
    .byte $0A ; |    X X | $FDE8
    .byte $1F ; |   XXXXX| $FDE9
    .byte $0A ; |    X X | $FDEA
    .byte $1F ; |   XXXXX| $FDEB
    .byte $0A ; |    X X | $FDEC
    .byte $1F ; |   XXXXX| $FDED
    .byte $0A ; |    X X | $FDEE
    .byte $1F ; |   XXXXX| $FDEF
    .byte $0A ; |    X X | $FDF0
    .byte $1F ; |   XXXXX| $FDF1
    .byte $0A ; |    X X | $FDF2
    .byte $1F ; |   XXXXX| $FDF3
    .byte $0A ; |    X X | $FDF4
    .byte $1F ; |   XXXXX| $FDF5
    .byte $0A ; |    X X | $FDF6
    .byte $1F ; |   XXXXX| $FDF7
    .byte $0A ; |    X X | $FDF8
    .byte $1F ; |   XXXXX| $FDF9
    .byte $0A ; |    X X | $FDFA
    .byte $1F ; |   XXXXX| $FDFB
    .byte $0A ; |    X X | $FDFC
    .byte $1F ; |   XXXXX| $FDFD
    .byte $0A ; |    X X | $FDFE
    .byte $1F ; |   XXXXX| $FDFF
    .byte $0A ; |    X X | $FE00
    .byte $1F ; |   XXXXX| $FE01
    .byte $0A ; |    X X | $FE02
    .byte $1F ; |   XXXXX| $FE03
    .byte $0A ; |    X X | $FE04
    .byte $1F ; |   XXXXX| $FE05
    .byte $09 ; |    X  X| $FE06
    .byte $1F ; |   XXXXX| $FE07
    .byte $08 ; |    X   | $FE08
    .byte $1F ; |   XXXXX| $FE09
    .byte $07 ; |     XXX| $FE0A
    .byte $1F ; |   XXXXX| $FE0B
    .byte $06 ; |     XX | $FE0C
    .byte $1F ; |   XXXXX| $FE0D
    .byte $05 ; |     X X| $FE0E
    .byte $1F ; |   XXXXX| $FE0F
    .byte $04 ; |     X  | $FE10
    .byte $1F ; |   XXXXX| $FE11
    .byte $03 ; |      XX| $FE12
    .byte $1F ; |   XXXXX| $FE13
    .byte $02 ; |      X | $FE14
    .byte $1F ; |   XXXXX| $FE15
    .byte $01 ; |       X| $FE16
    .byte $1F ; |   XXXXX| $FE17
    .byte $08 ; |    X   | $FE18
    .byte $00 ; |        | $FE19
    .byte $1F ; |   XXXXX| $FE1A
    .byte $03 ; |      XX| $FE1B
    .byte $31 ; |  XX   X| $FE1C
    .byte $01 ; |       X| $FE1D
    .byte $02 ; |      X | $FE1E
    .byte $03 ; |      XX| $FE1F
    .byte $04 ; |     X  | $FE20
    .byte $05 ; |     X X| $FE21
    .byte $05 ; |     X X| $FE22
    .byte $05 ; |     X X| $FE23
    .byte $05 ; |     X X| $FE24
    .byte $05 ; |     X X| $FE25
    .byte $05 ; |     X X| $FE26
    .byte $05 ; |     X X| $FE27
    .byte $05 ; |     X X| $FE28
    .byte $05 ; |     X X| $FE29
    .byte $05 ; |     X X| $FE2A
    .byte $05 ; |     X X| $FE2B
    .byte $05 ; |     X X| $FE2C
    .byte $05 ; |     X X| $FE2D
    .byte $05 ; |     X X| $FE2E
    .byte $05 ; |     X X| $FE2F
    .byte $05 ; |     X X| $FE30
    .byte $05 ; |     X X| $FE31
    .byte $05 ; |     X X| $FE32
    .byte $05 ; |     X X| $FE33
    .byte $05 ; |     X X| $FE34
    .byte $05 ; |     X X| $FE35
    .byte $05 ; |     X X| $FE36
    .byte $05 ; |     X X| $FE37
    .byte $05 ; |     X X| $FE38
    .byte $05 ; |     X X| $FE39
    .byte $05 ; |     X X| $FE3A
    .byte $05 ; |     X X| $FE3B
    .byte $05 ; |     X X| $FE3C
    .byte $05 ; |     X X| $FE3D
    .byte $05 ; |     X X| $FE3E
    .byte $05 ; |     X X| $FE3F
    .byte $05 ; |     X X| $FE40
    .byte $05 ; |     X X| $FE41
    .byte $05 ; |     X X| $FE42
    .byte $05 ; |     X X| $FE43
    .byte $05 ; |     X X| $FE44
    .byte $05 ; |     X X| $FE45
    .byte $04 ; |     X  | $FE46
    .byte $03 ; |      XX| $FE47
    .byte $02 ; |      X | $FE48
    .byte $01 ; |       X| $FE49
    .byte $0F ; |    XXXX| $FE4A
    .byte $00 ; |        | $FE4B
    .byte $02 ; |      X | $FE4C
    .byte $02 ; |      X | $FE4D
    .byte $3E ; |  XXXXX | $FE4E
    .byte $01 ; |       X| $FE4F
    .byte $01 ; |       X| $FE50
    .byte $01 ; |       X| $FE51
    .byte $01 ; |       X| $FE52
    .byte $01 ; |       X| $FE53
    .byte $01 ; |       X| $FE54
    .byte $01 ; |       X| $FE55
    .byte $01 ; |       X| $FE56
    .byte $01 ; |       X| $FE57
    .byte $01 ; |       X| $FE58
    .byte $01 ; |       X| $FE59
    .byte $01 ; |       X| $FE5A
    .byte $01 ; |       X| $FE5B
    .byte $01 ; |       X| $FE5C
    .byte $01 ; |       X| $FE5D
    .byte $01 ; |       X| $FE5E
    .byte $02 ; |      X | $FE5F
    .byte $02 ; |      X | $FE60
    .byte $02 ; |      X | $FE61
    .byte $02 ; |      X | $FE62
    .byte $02 ; |      X | $FE63
    .byte $02 ; |      X | $FE64
    .byte $02 ; |      X | $FE65
    .byte $03 ; |      XX| $FE66
    .byte $03 ; |      XX| $FE67
    .byte $03 ; |      XX| $FE68
    .byte $03 ; |      XX| $FE69
    .byte $03 ; |      XX| $FE6A
    .byte $03 ; |      XX| $FE6B
    .byte $04 ; |     X  | $FE6C
    .byte $04 ; |     X  | $FE6D
    .byte $04 ; |     X  | $FE6E
    .byte $05 ; |     X X| $FE6F
    .byte $05 ; |     X X| $FE70
    .byte $06 ; |     XX | $FE71
    .byte $06 ; |     XX | $FE72
    .byte $07 ; |     XXX| $FE73
    .byte $07 ; |     XXX| $FE74
    .byte $07 ; |     XXX| $FE75
    .byte $08 ; |    X   | $FE76
    .byte $08 ; |    X   | $FE77
    .byte $09 ; |    X  X| $FE78
    .byte $0A ; |    X X | $FE79
    .byte $0B ; |    X XX| $FE7A
    .byte $0C ; |    XX  | $FE7B
    .byte $0D ; |    XX X| $FE7C
    .byte $0E ; |    XXX | $FE7D
    .byte $0C ; |    XX  | $FE7E
    .byte $0D ; |    XX X| $FE7F
    .byte $0E ; |    XXX | $FE80
    .byte $0F ; |    XXXX| $FE81
    .byte $0F ; |    XXXX| $FE82
    .byte $0F ; |    XXXX| $FE83
    .byte $0F ; |    XXXX| $FE84
    .byte $07 ; |     XXX| $FE85
    .byte $07 ; |     XXX| $FE86
    .byte $07 ; |     XXX| $FE87
    .byte $07 ; |     XXX| $FE88
    .byte $02 ; |      X | $FE89
    .byte $00 ; |        | $FE8A
    .byte $0A ; |    X X | $FE8B
    .byte $02 ; |      X | $FE8C
    .byte $11 ; |   X   X| $FE8D
    .byte $1F ; |   XXXXX| $FE8E
    .byte $1F ; |   XXXXX| $FE8F
    .byte $1F ; |   XXXXX| $FE90
    .byte $05 ; |     X X| $FE91
    .byte $05 ; |     X X| $FE92
    .byte $05 ; |     X X| $FE93
    .byte $05 ; |     X X| $FE94
    .byte $05 ; |     X X| $FE95
    .byte $05 ; |     X X| $FE96
    .byte $04 ; |     X  | $FE97
    .byte $03 ; |      XX| $FE98
    .byte $02 ; |      X | $FE99
    .byte $01 ; |       X| $FE9A
    .byte $02 ; |      X | $FE9B
    .byte $08 ; |    X   | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $01 ; |       X| $FE9E
    .byte $FF ; |XXXXXXXX| $FE9F
    .byte $FF ; |XXXXXXXX| $FEA0
    .byte $FF ; |XXXXXXXX| $FEA1
    .byte $FF ; |XXXXXXXX| $FEA2
    .byte $FF ; |XXXXXXXX| $FEA3
    .byte $FF ; |XXXXXXXX| $FEA4
    .byte $FF ; |XXXXXXXX| $FEA5
    .byte $FF ; |XXXXXXXX| $FEA6
    .byte $FF ; |XXXXXXXX| $FEA7
    .byte $FF ; |XXXXXXXX| $FEA8
    .byte $FF ; |XXXXXXXX| $FEA9
    .byte $FF ; |XXXXXXXX| $FEAA
    .byte $FF ; |XXXXXXXX| $FEAB
    .byte $FF ; |XXXXXXXX| $FEAC
    .byte $FF ; |XXXXXXXX| $FEAD
    .byte $FF ; |XXXXXXXX| $FEAE
    .byte $FF ; |XXXXXXXX| $FEAF
    .byte $FF ; |XXXXXXXX| $FEB0
    .byte $FF ; |XXXXXXXX| $FEB1
    .byte $FF ; |XXXXXXXX| $FEB2
    .byte $FF ; |XXXXXXXX| $FEB3
    .byte $FF ; |XXXXXXXX| $FEB4
    .byte $FF ; |XXXXXXXX| $FEB5
    .byte $FF ; |XXXXXXXX| $FEB6
    .byte $FF ; |XXXXXXXX| $FEB7
    .byte $FF ; |XXXXXXXX| $FEB8
    .byte $FF ; |XXXXXXXX| $FEB9
    .byte $FF ; |XXXXXXXX| $FEBA
    .byte $FF ; |XXXXXXXX| $FEBB
    .byte $FF ; |XXXXXXXX| $FEBC
    .byte $FF ; |XXXXXXXX| $FEBD
    .byte $FF ; |XXXXXXXX| $FEBE
    .byte $FF ; |XXXXXXXX| $FEBF
    .byte $FF ; |XXXXXXXX| $FEC0
    .byte $FF ; |XXXXXXXX| $FEC1
    .byte $FF ; |XXXXXXXX| $FEC2
    .byte $FF ; |XXXXXXXX| $FEC3
    .byte $FF ; |XXXXXXXX| $FEC4
    .byte $FF ; |XXXXXXXX| $FEC5
    .byte $FF ; |XXXXXXXX| $FEC6
    .byte $FF ; |XXXXXXXX| $FEC7
    .byte $FF ; |XXXXXXXX| $FEC8
    .byte $FF ; |XXXXXXXX| $FEC9
    .byte $FF ; |XXXXXXXX| $FECA
    .byte $FF ; |XXXXXXXX| $FECB
    .byte $FF ; |XXXXXXXX| $FECC
    .byte $FF ; |XXXXXXXX| $FECD
    .byte $FF ; |XXXXXXXX| $FECE
    .byte $FF ; |XXXXXXXX| $FECF
    .byte $FF ; |XXXXXXXX| $FED0
    .byte $FF ; |XXXXXXXX| $FED1
    .byte $FF ; |XXXXXXXX| $FED2
    .byte $FF ; |XXXXXXXX| $FED3
    .byte $FF ; |XXXXXXXX| $FED4
    .byte $FF ; |XXXXXXXX| $FED5
    .byte $FF ; |XXXXXXXX| $FED6
    .byte $FF ; |XXXXXXXX| $FED7
    .byte $FF ; |XXXXXXXX| $FED8
    .byte $FF ; |XXXXXXXX| $FED9
    .byte $FF ; |XXXXXXXX| $FEDA
    .byte $FF ; |XXXXXXXX| $FEDB
    .byte $FF ; |XXXXXXXX| $FEDC
    .byte $FF ; |XXXXXXXX| $FEDD
    .byte $FF ; |XXXXXXXX| $FEDE
    .byte $FF ; |XXXXXXXX| $FEDF
    .byte $FF ; |XXXXXXXX| $FEE0
    .byte $FF ; |XXXXXXXX| $FEE1
    .byte $FF ; |XXXXXXXX| $FEE2
    .byte $FF ; |XXXXXXXX| $FEE3
    .byte $FF ; |XXXXXXXX| $FEE4
    .byte $FF ; |XXXXXXXX| $FEE5
    .byte $FF ; |XXXXXXXX| $FEE6
    .byte $FF ; |XXXXXXXX| $FEE7
    .byte $FF ; |XXXXXXXX| $FEE8
    .byte $FF ; |XXXXXXXX| $FEE9
    .byte $FF ; |XXXXXXXX| $FEEA
    .byte $FF ; |XXXXXXXX| $FEEB
    .byte $FF ; |XXXXXXXX| $FEEC
    .byte $FF ; |XXXXXXXX| $FEED
    .byte $FF ; |XXXXXXXX| $FEEE
    .byte $FF ; |XXXXXXXX| $FEEF
    .byte $FF ; |XXXXXXXX| $FEF0
    .byte $FF ; |XXXXXXXX| $FEF1
    .byte $FF ; |XXXXXXXX| $FEF2
    .byte $FF ; |XXXXXXXX| $FEF3
    .byte $FF ; |XXXXXXXX| $FEF4
    .byte $FF ; |XXXXXXXX| $FEF5
    .byte $FF ; |XXXXXXXX| $FEF6
    .byte $FF ; |XXXXXXXX| $FEF7
    .byte $FF ; |XXXXXXXX| $FEF8
    .byte $FF ; |XXXXXXXX| $FEF9
    .byte $FF ; |XXXXXXXX| $FEFA
    .byte $FF ; |XXXXXXXX| $FEFB
    .byte $FF ; |XXXXXXXX| $FEFC
    .byte $FF ; |XXXXXXXX| $FEFD
    .byte $FF ; |XXXXXXXX| $FEFE
    .byte $FF ; |XXXXXXXX| $FEFF
    .byte $FF ; |XXXXXXXX| $FF00
    .byte $FF ; |XXXXXXXX| $FF01
    .byte $FF ; |XXXXXXXX| $FF02
    .byte $FF ; |XXXXXXXX| $FF03
    .byte $FF ; |XXXXXXXX| $FF04
    .byte $FF ; |XXXXXXXX| $FF05
    .byte $FF ; |XXXXXXXX| $FF06
    .byte $FF ; |XXXXXXXX| $FF07
    .byte $FF ; |XXXXXXXX| $FF08
    .byte $FF ; |XXXXXXXX| $FF09
    .byte $FF ; |XXXXXXXX| $FF0A
    .byte $FF ; |XXXXXXXX| $FF0B
    .byte $FF ; |XXXXXXXX| $FF0C
    .byte $FF ; |XXXXXXXX| $FF0D
    .byte $FF ; |XXXXXXXX| $FF0E
    .byte $FF ; |XXXXXXXX| $FF0F
    .byte $FF ; |XXXXXXXX| $FF10
    .byte $FF ; |XXXXXXXX| $FF11
    .byte $FF ; |XXXXXXXX| $FF12
    .byte $FF ; |XXXXXXXX| $FF13
    .byte $FF ; |XXXXXXXX| $FF14
    .byte $FF ; |XXXXXXXX| $FF15
    .byte $FF ; |XXXXXXXX| $FF16
    .byte $FF ; |XXXXXXXX| $FF17
    .byte $FF ; |XXXXXXXX| $FF18
    .byte $FF ; |XXXXXXXX| $FF19
    .byte $FF ; |XXXXXXXX| $FF1A
    .byte $FF ; |XXXXXXXX| $FF1B
    .byte $FF ; |XXXXXXXX| $FF1C
    .byte $FF ; |XXXXXXXX| $FF1D
    .byte $FF ; |XXXXXXXX| $FF1E
    .byte $FF ; |XXXXXXXX| $FF1F
    .byte $FF ; |XXXXXXXX| $FF20
    .byte $FF ; |XXXXXXXX| $FF21
    .byte $FF ; |XXXXXXXX| $FF22
    .byte $FF ; |XXXXXXXX| $FF23
    .byte $FF ; |XXXXXXXX| $FF24
    .byte $FF ; |XXXXXXXX| $FF25
    .byte $FF ; |XXXXXXXX| $FF26
    .byte $FF ; |XXXXXXXX| $FF27
    .byte $FF ; |XXXXXXXX| $FF28
    .byte $FF ; |XXXXXXXX| $FF29
    .byte $FF ; |XXXXXXXX| $FF2A
    .byte $FF ; |XXXXXXXX| $FF2B
    .byte $FF ; |XXXXXXXX| $FF2C
    .byte $FF ; |XXXXXXXX| $FF2D
    .byte $FF ; |XXXXXXXX| $FF2E
    .byte $FF ; |XXXXXXXX| $FF2F
    .byte $FF ; |XXXXXXXX| $FF30
    .byte $FF ; |XXXXXXXX| $FF31
    .byte $FF ; |XXXXXXXX| $FF32
    .byte $FF ; |XXXXXXXX| $FF33
    .byte $FF ; |XXXXXXXX| $FF34
    .byte $FF ; |XXXXXXXX| $FF35
    .byte $FF ; |XXXXXXXX| $FF36
    .byte $FF ; |XXXXXXXX| $FF37
    .byte $FF ; |XXXXXXXX| $FF38
    .byte $FF ; |XXXXXXXX| $FF39
    .byte $FF ; |XXXXXXXX| $FF3A
    .byte $FF ; |XXXXXXXX| $FF3B
    .byte $FF ; |XXXXXXXX| $FF3C
    .byte $FF ; |XXXXXXXX| $FF3D
    .byte $FF ; |XXXXXXXX| $FF3E
    .byte $FF ; |XXXXXXXX| $FF3F
    .byte $FF ; |XXXXXXXX| $FF40
    .byte $FF ; |XXXXXXXX| $FF41
    .byte $FF ; |XXXXXXXX| $FF42
    .byte $FF ; |XXXXXXXX| $FF43
    .byte $FF ; |XXXXXXXX| $FF44
    .byte $FF ; |XXXXXXXX| $FF45
    .byte $FF ; |XXXXXXXX| $FF46
    .byte $FF ; |XXXXXXXX| $FF47
    .byte $FF ; |XXXXXXXX| $FF48
    .byte $FF ; |XXXXXXXX| $FF49
    .byte $FF ; |XXXXXXXX| $FF4A
    .byte $FF ; |XXXXXXXX| $FF4B
    .byte $FF ; |XXXXXXXX| $FF4C
    .byte $FF ; |XXXXXXXX| $FF4D
    .byte $FF ; |XXXXXXXX| $FF4E
    .byte $FF ; |XXXXXXXX| $FF4F
    .byte $FF ; |XXXXXXXX| $FF50
    .byte $FF ; |XXXXXXXX| $FF51
    .byte $FF ; |XXXXXXXX| $FF52
    .byte $FF ; |XXXXXXXX| $FF53
    .byte $FF ; |XXXXXXXX| $FF54
    .byte $FF ; |XXXXXXXX| $FF55
    .byte $FF ; |XXXXXXXX| $FF56
    .byte $FF ; |XXXXXXXX| $FF57
    .byte $FF ; |XXXXXXXX| $FF58
    .byte $FF ; |XXXXXXXX| $FF59
    .byte $FF ; |XXXXXXXX| $FF5A
    .byte $FF ; |XXXXXXXX| $FF5B
    .byte $FF ; |XXXXXXXX| $FF5C
    .byte $FF ; |XXXXXXXX| $FF5D
    .byte $FF ; |XXXXXXXX| $FF5E
    .byte $FF ; |XXXXXXXX| $FF5F
    .byte $FF ; |XXXXXXXX| $FF60
    .byte $FF ; |XXXXXXXX| $FF61
    .byte $FF ; |XXXXXXXX| $FF62
    .byte $FF ; |XXXXXXXX| $FF63
    .byte $FF ; |XXXXXXXX| $FF64
    .byte $FF ; |XXXXXXXX| $FF65
    .byte $FF ; |XXXXXXXX| $FF66
    .byte $FF ; |XXXXXXXX| $FF67
    .byte $FF ; |XXXXXXXX| $FF68
    .byte $FF ; |XXXXXXXX| $FF69
    .byte $FF ; |XXXXXXXX| $FF6A
    .byte $FF ; |XXXXXXXX| $FF6B
    .byte $FF ; |XXXXXXXX| $FF6C
    .byte $FF ; |XXXXXXXX| $FF6D
    .byte $FF ; |XXXXXXXX| $FF6E
    .byte $FF ; |XXXXXXXX| $FF6F
    .byte $FF ; |XXXXXXXX| $FF70
    .byte $FF ; |XXXXXXXX| $FF71
    .byte $FF ; |XXXXXXXX| $FF72
    .byte $FF ; |XXXXXXXX| $FF73
    .byte $FF ; |XXXXXXXX| $FF74
    .byte $FF ; |XXXXXXXX| $FF75
    .byte $FF ; |XXXXXXXX| $FF76
    .byte $FF ; |XXXXXXXX| $FF77
    .byte $FF ; |XXXXXXXX| $FF78
    .byte $FF ; |XXXXXXXX| $FF79
    .byte $FF ; |XXXXXXXX| $FF7A
    .byte $FF ; |XXXXXXXX| $FF7B
    .byte $FF ; |XXXXXXXX| $FF7C
    .byte $FF ; |XXXXXXXX| $FF7D
    .byte $FF ; |XXXXXXXX| $FF7E
    .byte $FF ; |XXXXXXXX| $FF7F
    .byte $FF ; |XXXXXXXX| $FF80
    .byte $FF ; |XXXXXXXX| $FF81
    .byte $FF ; |XXXXXXXX| $FF82
    .byte $FF ; |XXXXXXXX| $FF83
    .byte $FF ; |XXXXXXXX| $FF84
    .byte $FF ; |XXXXXXXX| $FF85
    .byte $FF ; |XXXXXXXX| $FF86
    .byte $FF ; |XXXXXXXX| $FF87
    .byte $FF ; |XXXXXXXX| $FF88
    .byte $FF ; |XXXXXXXX| $FF89
    .byte $FF ; |XXXXXXXX| $FF8A
    .byte $FF ; |XXXXXXXX| $FF8B
    .byte $FF ; |XXXXXXXX| $FF8C
    .byte $FF ; |XXXXXXXX| $FF8D
    .byte $FF ; |XXXXXXXX| $FF8E
    .byte $FF ; |XXXXXXXX| $FF8F
    .byte $FF ; |XXXXXXXX| $FF90
    .byte $FF ; |XXXXXXXX| $FF91
    .byte $FF ; |XXXXXXXX| $FF92
    .byte $FF ; |XXXXXXXX| $FF93
    .byte $FF ; |XXXXXXXX| $FF94
    .byte $FF ; |XXXXXXXX| $FF95
    .byte $FF ; |XXXXXXXX| $FF96
    .byte $FF ; |XXXXXXXX| $FF97
    .byte $FF ; |XXXXXXXX| $FF98
    .byte $FF ; |XXXXXXXX| $FF99
    .byte $FF ; |XXXXXXXX| $FF9A
    .byte $FF ; |XXXXXXXX| $FF9B
    .byte $FF ; |XXXXXXXX| $FF9C
    .byte $FF ; |XXXXXXXX| $FF9D
    .byte $FF ; |XXXXXXXX| $FF9E
    .byte $FF ; |XXXXXXXX| $FF9F
    .byte $FF ; |XXXXXXXX| $FFA0
    .byte $FF ; |XXXXXXXX| $FFA1
    .byte $FF ; |XXXXXXXX| $FFA2
    .byte $FF ; |XXXXXXXX| $FFA3
    .byte $FF ; |XXXXXXXX| $FFA4
    .byte $FF ; |XXXXXXXX| $FFA5
    .byte $FF ; |XXXXXXXX| $FFA6
    .byte $FF ; |XXXXXXXX| $FFA7
    .byte $FF ; |XXXXXXXX| $FFA8
    .byte $FF ; |XXXXXXXX| $FFA9
    .byte $FF ; |XXXXXXXX| $FFAA
    .byte $FF ; |XXXXXXXX| $FFAB
    .byte $FF ; |XXXXXXXX| $FFAC
    .byte $FF ; |XXXXXXXX| $FFAD
    .byte $FF ; |XXXXXXXX| $FFAE
    .byte $FF ; |XXXXXXXX| $FFAF
    .byte $FF ; |XXXXXXXX| $FFB0
    .byte $FF ; |XXXXXXXX| $FFB1
    .byte $FF ; |XXXXXXXX| $FFB2
    .byte $FF ; |XXXXXXXX| $FFB3
    .byte $FF ; |XXXXXXXX| $FFB4
    .byte $FF ; |XXXXXXXX| $FFB5
    .byte $FF ; |XXXXXXXX| $FFB6
    .byte $FF ; |XXXXXXXX| $FFB7
    .byte $FF ; |XXXXXXXX| $FFB8
    .byte $FF ; |XXXXXXXX| $FFB9
    .byte $FF ; |XXXXXXXX| $FFBA
    .byte $FF ; |XXXXXXXX| $FFBB
    .byte $FF ; |XXXXXXXX| $FFBC
    .byte $FF ; |XXXXXXXX| $FFBD
    .byte $FF ; |XXXXXXXX| $FFBE
    .byte $FF ; |XXXXXXXX| $FFBF
    .byte $FF ; |XXXXXXXX| $FFC0
    .byte $FF ; |XXXXXXXX| $FFC1
    .byte $FF ; |XXXXXXXX| $FFC2
    .byte $FF ; |XXXXXXXX| $FFC3
    .byte $FF ; |XXXXXXXX| $FFC4
    .byte $FF ; |XXXXXXXX| $FFC5
    .byte $FF ; |XXXXXXXX| $FFC6
    .byte $FF ; |XXXXXXXX| $FFC7
    .byte $FF ; |XXXXXXXX| $FFC8
    .byte $FF ; |XXXXXXXX| $FFC9
    .byte $FF ; |XXXXXXXX| $FFCA
    .byte $FF ; |XXXXXXXX| $FFCB
    .byte $FF ; |XXXXXXXX| $FFCC
    .byte $FF ; |XXXXXXXX| $FFCD
    .byte $FF ; |XXXXXXXX| $FFCE
    .byte $FF ; |XXXXXXXX| $FFCF
    .byte $FF ; |XXXXXXXX| $FFD0
    .byte $FF ; |XXXXXXXX| $FFD1
    .byte $FF ; |XXXXXXXX| $FFD2
    .byte $FF ; |XXXXXXXX| $FFD3
    .byte $FF ; |XXXXXXXX| $FFD4
    .byte $FF ; |XXXXXXXX| $FFD5
    .byte $FF ; |XXXXXXXX| $FFD6
    .byte $FF ; |XXXXXXXX| $FFD7
    .byte $FF ; |XXXXXXXX| $FFD8
    .byte $FF ; |XXXXXXXX| $FFD9
    .byte $FF ; |XXXXXXXX| $FFDA
    .byte $FF ; |XXXXXXXX| $FFDB
    .byte $FF ; |XXXXXXXX| $FFDC
    .byte $FF ; |XXXXXXXX| $FFDD
    .byte $FF ; |XXXXXXXX| $FFDE
    .byte $FF ; |XXXXXXXX| $FFDF
LFFE0:
    .byte $FF ; |XXXXXXXX| $FFE0
    .byte $FF ; |XXXXXXXX| $FFE1
    .byte $FF ; |XXXXXXXX| $FFE2
LFFE3:
    .byte $FF ; |XXXXXXXX| $FFE3
LFFE4:
    .byte $FF ; |XXXXXXXX| $FFE4
    .byte $FF ; |XXXXXXXX| $FFE5
    .byte $FF ; |XXXXXXXX| $FFE6
    .byte $FF ; |XXXXXXXX| $FFE7
    .byte $FF ; |XXXXXXXX| $FFE8
LFFE9:
    .byte $FF ; |XXXXXXXX| $FFE9
    .byte $FF ; |XXXXXXXX| $FFEA
    .byte $FF ; |XXXXXXXX| $FFEB
    .byte $FF ; |XXXXXXXX| $FFEC
LFFED:
    .byte $FF ; |XXXXXXXX| $FFED
    .byte $FF ; |XXXXXXXX| $FFEE
    .byte $FF ; |XXXXXXXX| $FFEF
    .byte $FF ; |XXXXXXXX| $FFF0
    .byte $FF ; |XXXXXXXX| $FFF1
LFFF2:
    .byte $FF ; |XXXXXXXX| $FFF2
    .byte $FF ; |XXXXXXXX| $FFF3
    .byte $FF ; |XXXXXXXX| $FFF4
    .byte $FF ; |XXXXXXXX| $FFF5
LFFF6:
    .byte $FF ; |XXXXXXXX| $FFF6
    .byte $FF ; |XXXXXXXX| $FFF7
    .byte $FF ; |XXXXXXXX| $FFF8
    .byte $FF ; |XXXXXXXX| $FFF9
    
        ORG $2FFA
       RORG $FFFA
    
    .byte $00 ; |        | $FFFA
    .byte $FC ; |XXXXXX  | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $FC ; |XXXXXX  | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $FF ; |XXXXXXXX| $FFFF
