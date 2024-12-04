; Disassembly of Star Trek - Strategic Operations Simulator
; Support added for a Sega Genesis Controller
; by Omegamatrix
;
;
; star1.cfg contents:
;
;      ORG F000
;      CODE F000 FBB1
;      GFX FBB2 FC12
;      CODE FC13 FC8C
;      GFX FC8D FCB8
;      CODE FCB9 FF02
;      GFX FF03 FFFF
;
; star2.cfg contents:
;
;      ORG F000
;      CODE F000 F260
;      GFX F261 F26A
;      CODE F26B FAD1
;      GFX FAD2 FC9F
;      CODE FCA0 FCCC
;      GFX FCCD FCEC
;      CODE FCED FCFF
;      GFX FD00 FDFE
;      CODE FDFF FE43
;      GFX FE44 FFFF

;1) unknown
;2) fire phasers
;3) warp drive
;4) supress phasers during warp
;5) game start
;6) fire photons
;7) thrust (all)

;Genesis
;button B - phasers  (INPT4)  no change
;button C - warp     (INPT1)  used to be down plus fire
;up       - thrust            no change
;down     - photons           no change

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
HMM0    =  $22
HMM1    =  $23
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B

; Read TIA Baseline = $00
INPT1   =  $09
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ORIGINAL = 0

BANK_0  = $FFF8
BANK_1  = $FFF9

;HMxx
LEFT_7                = $70
LEFT_6                = $60
LEFT_5                = $50
LEFT_4                = $40
LEFT_3                = $30
LEFT_2                = $20
LEFT_1                = $10
NO_MOTION             = $00
RIGHT_1               = $F0
RIGHT_2               = $E0
RIGHT_3               = $D0
RIGHT_4               = $C0
RIGHT_5               = $B0
RIGHT_6               = $A0
RIGHT_7               = $90
RIGHT_8               = $80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x27
ram_81             ds 1  ; x16
ram_82             ds 1  ; x10
ram_83             ds 1  ; x19
ram_84             ds 1  ; x1
ram_85             ds 1  ; x10
ram_86             ds 1  ; x1
ram_87             ds 1  ; x9
ram_88             ds 1  ; x11
ram_89             ds 1  ; x7
ram_8A             ds 1  ; x8
ram_8B             ds 1  ; x9
ram_8C             ds 1  ; x21
ram_8D             ds 1  ; x1
ram_8E             ds 1  ; x3
ram_8F             ds 1  ; x19
joySaveState       ds 1  ; x11
ram_91             ds 1  ; x18
ram_92             ds 1  ; x21
ram_93             ds 1  ; x2
ram_94             ds 1  ; x2
ram_95             ds 1  ; x9
ram_96             ds 1  ; x12
ram_97             ds 1  ; x5
ram_98             ds 1  ; x3
ram_99             ds 1  ; x3
ram_9A             ds 1  ; x14
ram_9B             ds 1  ; x8
ram_9C             ds 1  ; x14
ram_9D             ds 1  ; x29
ram_9E             ds 2  ; x7
ram_A0             ds 2  ; x1
ram_A2             ds 2  ; x1
ram_A4             ds 2  ; x1
ram_A6             ds 2  ; x1
ram_A8             ds 1  ; x20
ram_A9             ds 1  ; x8
ram_AA             ds 1  ; x18
ram_AB             ds 1  ; x1
ram_AC             ds 1  ; x18
ram_AD             ds 1  ; x13
ram_AE             ds 1  ; x13
ram_AF             ds 1  ; x48
ram_B0             ds 8  ; x3
ram_B8             ds 1  ; x9
ram_B9             ds 1  ; x19
ram_BA             ds 1  ; x21
ram_BB             ds 1  ; x62
ram_BC             ds 8  ; x6
ram_C4             ds 1  ; x19
ram_C5             ds 1  ; x26
ram_C6             ds 1  ; x15
ram_C7             ds 1  ; x33
ram_C8             ds 8  ; x2
ram_D0             ds 1  ; x3
ram_D1             ds 1  ; x6
ram_D2             ds 1  ; x41
ram_D3             ds 1  ; x4
ram_D4             ds 1  ; x18
ram_D5             ds 1  ; x26
ram_D6             ds 1  ; x6
ram_D7             ds 1  ; x1
ram_D8             ds 1  ; x12
ram_D9             ds 1  ; x19
ram_DA             ds 1  ; x9
ram_DB             ds 1  ; x19
ram_DC             ds 1  ; x2
ram_DD             ds 1  ; x4
ram_DE             ds 1  ; x2
ram_DF             ds 1  ; x2
ram_E0             ds 1  ; x17
ram_E1             ds 1  ; x3
ram_E2             ds 1  ; x4
ram_E3             ds 1  ; x5
ram_E4             ds 1  ; x26
ram_E5             ds 1  ; x7
ram_E6             ds 1  ; x13
ram_E7             ds 1  ; x12
ram_E8             ds 1  ; x4
ram_E9             ds 1  ; x17
ram_EA             ds 1  ; x6
ram_EB             ds 1  ; x1
ram_EC             ds 1  ; x7
ram_ED             ds 1  ; x1
ram_EE             ds 1  ; x6
ram_EF             ds 1  ; x5
ram_F0             ds 1  ; x4
ram_F1             ds 1  ; x2
ram_F2             ds 1  ; x5
ram_F3             ds 1  ; x7
ram_F4             ds 1  ; x7
ram_F5             ds 1  ; x6
ram_F6             ds 1  ; x7
ram_F7             ds 1  ; x6
ram_F8             ds 1  ; x7
ram_F9             ds 1  ; x5
ram_FA             ds 6  ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $1000
      RORG $F000

START_0:
    lda    BANK_1                ; 4

    brk                          ; 7

KF004:
    lda    BANK_1                ; 4

    jmp    KFB9D                 ; 3

KF00A:
    lda    BANK_1                ; 4


    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    KF070                 ; 2³
    lda    ram_AC                ; 3
    cmp    #$67                  ; 2
    bne    KF070                 ; 2³
    lda    ram_AD                ; 3
    cmp    #$05                  ; 2
    bne    KF049                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_C4                ; 3
    ldy    ram_9D                ; 3
    sty    ram_C5                ; 3
    ldx    ram_A8                ; 3
    lda    ram_E7,X              ; 4
    bpl    KF043                 ; 2³
    lda    ram_B9                ; 3
    sta    ram_D6,X              ; 4
    sty    ram_E7,X              ; 4
    lda    #$0A                  ; 2
    sta    ram_EC,X              ; 4
    inc    ram_EA,X              ; 6
    lda    ram_EA,X              ; 4
    and    #$07                  ; 2
    ora    #$28                  ; 2
    sta    ram_EA,X              ; 4
    bne    KF061                 ; 3   always branch

KF043:
    jsr    KF326                 ; 6
;    jmp    KF061                 ; 3

KF061:
    jsr    KF17E                 ; 6
    jsr    KF1F2                 ; 6
    jsr    KF72F                 ; 6
    jsr    KF429                 ; 6
    jsr    KF777                 ; 6
KF070:
    jsr    KFDE6                 ; 6
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    KF0BD                 ; 2³
    lda    ram_A9                ; 3
    cmp    #$02                  ; 2
    bcc    KF092                 ; 2³
    lda    ram_AD                ; 3
    cmp    #$05                  ; 2
    bne    KF0E2                 ; 2³
    jmp    KFADB                 ; 3
    
;moved
KF049:
    lda    ram_E4                ; 3
    bmi    KF061                 ; 2³
    
;6) fire photons
    
    lda    joySaveState          ; 3
    cmp    #$0D                  ; 2  press down? (firing photons)
    bne    KF061                 ; 2³ - no
    lda    ram_8B                ; 3  - yes
    bmi    KF061                 ; 2³
    
;1) unknown
    
    lda    INPT4                 ; 3
    bpl    KF061                 ; 2³
    jsr    KFC35                 ; 6
    jmp    KF070                 ; 3

KF088:
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    KFA2F                 ; 6
    sty    ram_D3                ; 3
    bne    KF070                 ; 2³
KF092:
    lda    ram_AC                ; 3
    cmp    #$67                  ; 2
    beq    KF0C0                 ; 2³
    jsr    KFC7A                 ; 6
    ldy    #$FF                  ; 2
    sty    ram_E7                ; 3
    sty    ram_E8                ; 3
    sty    ram_9D                ; 3
    ldx    #$28                  ; 2
    stx    ram_8C                ; 3
    ldx    #$04                  ; 2
    stx    ram_8F                ; 3
    cmp    #$34                  ; 2
    bcc    KF0D4                 ; 2³
    dec    ram_AC                ; 5
    sty    ram_E6                ; 3
    lda    #$00                  ; 2
    sta    ram_D5                ; 3
    sta    ram_9A                ; 3
    lda    #$05                  ; 2
    sta    ram_E9                ; 3
KF0BD:
    jmp    KF166                 ; 3

KF0C0:
    lda    ram_D2                ; 3
    bmi    KF0CC                 ; 2³
    bne    KF129                 ; 2³+1
    lda    ram_C7                ; 3
    cmp    #$C8                  ; 2
    bne    KF129                 ; 2³+1
KF0CC:
    lda    ram_C4                ; 3
    bpl    KF129                 ; 2³+1
    dec    ram_AC                ; 5
    bne    KF0BD                 ; 2³
KF0D4:
    lda    #$00                  ; 2
    sta    ram_E6                ; 3
    sta    ram_DD                ; 3
    lda    ram_D1                ; 3
    bne    KF0BD                 ; 2³
    lda    ram_D5                ; 3
    bne    KF102                 ; 2³+1
KF0E2:
    lda    ram_C5                ; 3
    bmi    KF11F                 ; 2³+1
    ldy    #$01                  ; 2
    lda    ram_E4                ; 3
    and    #$01                  ; 2
    sta    ram_E4                ; 3
    bne    KF0F5                 ; 2³
    ldx    ram_E0                ; 3
    ldy    KFFA7,X               ; 4
KF0F5:
    ldx    #$0F                  ; 2
    stx    ram_D1                ; 3
    sty    ram_D5                ; 3
    lda    #$20                  ; 2
    sta    ram_B8                ; 3
KF0FF:
    jmp    KF166                 ; 3

KF102:
    dec    ram_E9                ; 5
    bne    KF0FF                 ; 2³+1
    lda    ram_EE                ; 3
    bne    KF10E                 ; 2³
    lda    #$1F                  ; 2
    sta    ram_EE                ; 3
KF10E:
    lda    #$03                  ; 2
    sta    ram_E9                ; 3
    lda    #$2D                  ; 2
    jsr    KFC1F                 ; 6
    dec    ram_D5                ; 5
    bne    KF166                 ; 2³
    lda    #$00                  ; 2
    sta    ram_EE                ; 3
KF11F:
    lda    #$9A                  ; 2
    sta    ram_AC                ; 3
KF123:
    jsr    KFA2F                 ; 6
    jmp    KF166                 ; 3

KF129:
    jsr    KF356                 ; 6
    jsr    KF2BC                 ; 6
    ldx    ram_E9                ; 3
    bne    KF13A                 ; 2³
    lda    ram_E4                ; 3
    bpl    KF13A                 ; 2³
    jsr    KF4CA                 ; 6
KF13A:
    lda    ram_E1                ; 3
    and    #$03                  ; 2
    cmp    #$01                  ; 2
    beq    KF163                 ; 2³
    dec    ram_E9                ; 5
    bpl    KF14A                 ; 2³
    ldx    #$09                  ; 2
    stx    ram_E9                ; 3
KF14A:
    lda    ram_E4                ; 3
    bmi    KF163                 ; 2³
    lda    ram_D2                ; 3
    bmi    KF163                 ; 2³
    ldx    ram_E9                ; 3
    cpx    ram_D2                ; 3
    beq    KF15A                 ; 2³
    bcs    KF163                 ; 2³
KF15A:
    lda    ram_C7,X              ; 4
    cmp    #$D5                  ; 2
    bcc    KF163                 ; 2³
    jsr    KF4ED                 ; 6
KF163:
    jsr    KF63C                 ; 6
KF166:
    jsr    KF16C                 ; 6
    jmp    KF00A                 ; 3

KF16C:
    lda    #$40                  ; 2
    ldx    ram_DA                ; 3
    bmi    KF17B                 ; 2³
    lda    #$2A                  ; 2
    cpx    #$02                  ; 2
    bcs    KF17B                 ; 2³
    lda    KFFFA,X               ; 4
KF17B:
    sta    ram_F5                ; 3
    rts                          ; 6
    
    NOP  ; free byte
    NOP  ; free byte  2
    NOP  ; free byte
    NOP  ; free byte  4
    NOP  ; free byte
    NOP  ; free byte  6
    NOP  ; free byte
    NOP  ; free byte  8
    NOP  ; free byte
    NOP  ; free byte  10
    NOP  ; free byte
    NOP  ; free byte  12
    NOP  ; free byte
    NOP  ; free byte  14
    NOP  ; free byte
    NOP  ; free byte  16
    NOP  ; free byte
    NOP  ; free byte  18
    NOP  ; free byte
    NOP  ; free byte  20

    
KF17E:
    ldx    ram_95                ; 3
    lda    ram_E4                ; 3
    bmi    KF1A2                 ; 2³
    
;2) fire phasers

    lda    INPT4                 ; 3
    bmi    KF1A2                 ; 2³
    lda    ram_9A                ; 3
    ora    ram_8A                ; 3
    bne    KF1A2                 ; 2³
    lda    #$07                  ; 2
    sta    ram_97                ; 3
    lda    #$53                  ; 2
    sta    ram_98                ; 3
    lda    #$50                  ; 2
    sta    ram_99                ; 3
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
    lda    #$0C                  ; 2
    sta    ram_9A                ; 3
KF1A2:
    lda    ram_9A                ; 3
    beq    KF1F1                 ; 2³
    cmp    KFF04,X               ; 4
    bcc    KF1DD                 ; 2³
    lda    ram_9B                ; 3
    cmp    KFF04,X               ; 4
    bcc    KF1E5                 ; 2³
    lda    ram_88                ; 3
    cmp    KFF0C,X               ; 4
    bcc    KF1D6                 ; 2³
    cmp    KFF0D,X               ; 4
    bcs    KF1D6                 ; 2³
    ldx    ram_D9                ; 3
    lda    ram_83                ; 3
    cmp    #$5A                  ; 2
    beq    KF1CA                 ; 2³
    cpx    #$0A                  ; 2
    beq    KF1D6                 ; 2³
KF1CA:
    lda    #$14                  ; 2
    sta    ram_83                ; 3
    STA    ram_8A
    
    lda    #$0A                  ; 2
    sta    ram_92                ; 3
;    lda    #$14                  ; 2
;    sta    ram_8A                ; 3
KF1D6:
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
    sta    ram_9A                ; 3
    rts                          ; 6

KF1DD:
    lda    ram_9A                ; 3
    clc                          ; 2
    adc    KFF03,X               ; 4
    sta    ram_9A                ; 3
KF1E5:
    lda    ram_9B                ; 3
    clc                          ; 2
    adc    KFF03,X               ; 4
    sta    ram_9B                ; 3
    inc    ram_98                ; 5
    dec    ram_99                ; 5
KF1F1:
    rts                          ; 6

KF1F2:
    lda    ram_A8                ; 3
    beq    KF216                 ; 2³+1
    lda    ram_92                ; 3
    beq    KF216                 ; 2³+1
    bmi    KF216                 ; 2³+1
    dec    ram_92                ; 5
    beq    KF217                 ; 2³
    ldy    ram_83                ; 3
    cpy    #$3C                  ; 2
    bcs    KF216                 ; 2³
    tax                          ; 2
    lda    KFBC4,X               ; 4
    sta    ram_87                ; 3
    lda    KFBCF,X               ; 4
    sta    ram_83                ; 3
;    clc                          ; 2   already clear
    adc    #$0A                  ; 2
    sta    ram_85                ; 3
KF216:
    rts                          ; 6

KF217:
    lda    ram_83                ; 3
    cmp    #$3C                  ; 2
    bcs    KF250                 ; 2³
    jsr    KFC7A                 ; 6
    ldx    ram_D9                ; 3
    cpx    #$0A                  ; 2
    beq    KF276                 ; 2³
    cpx    #$09                  ; 2
    beq    KF230                 ; 2³
    cpx    ram_D2                ; 3
    beq    KF230                 ; 2³
    bcs    KF216                 ; 2³
KF230:
    lda    ram_C7,X              ; 4
    cmp    #$CC                  ; 2
    beq    KF29D                 ; 2³
    cmp    #$C8                  ; 2
    bne    KF245                 ; 2³
    jsr    KFCE4                 ; 6
    lda    #$2D                  ; 2
    jsr    KFC1B                 ; 6
    jmp    KF250                 ; 3

KF245:
    jsr    KFCE4                 ; 6
    ldy    ram_E0                ; 3
    lda    KFFD5,Y               ; 4
    jsr    KFC1F                 ; 6
KF250:
    ldx    #$09                  ; 2
    bne    KF25A                 ; 3   always branch

KF254:
    cpx    ram_D2                ; 3
    beq    KF25A                 ; 2³
    bcs    KF260                 ; 2³
KF25A:
    lda    ram_C7,X              ; 4
    cmp    #$D4                  ; 2
    beq    KF264                 ; 2³
KF260:
    dex                          ; 2
    bpl    KF254                 ; 2³
    rts                          ; 6

KF264:
    txa                          ; 2
    tay                          ; 2
    jsr    KFCE4                 ; 6
    ldx    ram_E0                ; 3
    lda    KFFD5,X               ; 4
    jsr    KFC1F                 ; 6
    tya                          ; 2
    tax                          ; 2
    jmp    KF260                 ; 3

KF276:
    ldy    #$FF                  ; 2
    sty    ram_C5                ; 3
    sty    ram_9D                ; 3
    iny                          ; 2
    sty    ram_96                ; 3
    sty    ram_8A                ; 3
    sty    ram_E5                ; 3
    lda    #$08                  ; 2
    sta    ram_F6                ; 3
    inc    ram_8B                ; 5
    inc    ram_DA                ; 5
    lda    ram_DB                ; 3
    and    #$03                  ; 2
    cmp    #$02                  ; 2
    beq    KF296                 ; 2³
    clc                          ; 2
    adc    #$01                  ; 2
KF296:
    ora    #$78                  ; 2
    sta    ram_DB                ; 3
    jmp    KF250                 ; 3

KF29D:
    lda    ram_E4                ; 3
    bmi    KF2B8                 ; 2³
    lda    ram_BB,X              ; 4
    cmp    #$45                  ; 2
    bcs    KF2B8                 ; 2³
    cmp    #$27                  ; 2
    bcc    KF2B8                 ; 2³
    lda    ram_AF,X              ; 4
    cmp    #$5D                  ; 2
    bcc    KF2B8                 ; 2³
    cmp    #$77                  ; 2
    bcs    KF2B8                 ; 2³
    jsr    KF48E                 ; 6
KF2B8:
    jsr    KFCE4                 ; 6
KF2BB:
    rts                          ; 6

KF2BC:
    lda    ram_A8                ; 3
    tax                          ; 2
    ora    ram_E0                ; 3
    beq    KF2BB                 ; 2³
    lda    ram_E7,X              ; 4
    bpl    KF326                 ; 2³+1
    lda    ram_E4                ; 3
    bmi    KF2BB                 ; 2³
    lda    ram_EC,X              ; 4
    beq    KF2D3                 ; 2³
    dec    ram_EC,X              ; 6
    bne    KF2BB                 ; 2³
KF2D3:
    ldy    ram_D2                ; 3
    bmi    KF2BB                 ; 2³
    lda    ram_92                ; 3
    bne    KF2BB                 ; 2³
    lda    ram_E7                ; 3
    and    ram_E8                ; 3
    bmi    KF2E5                 ; 2³
    cpy    #$03                  ; 2
    bcc    KF2BB                 ; 2³
KF2E5:
    cpy    ram_96                ; 3
    bcs    KF2EB                 ; 2³
    sty    ram_96                ; 3
KF2EB:
    ldy    ram_96                ; 3
    dec    ram_96                ; 5
    lda.wy ram_C7,Y              ; 4
    cmp    #$D5                  ; 2
    bcc    KF355                 ; 2³+1
;    sec                          ; 2   already set
    sbc    #$D8                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$18                  ; 2
    ldx    ram_E0                ; 3
    cpx    #$02                  ; 2
    bcc    KF305                 ; 2³
    eor    #$30                  ; 2
KF305:
    and    #$3F                  ; 2
    ldx    ram_A8                ; 3
    sta    ram_EA,X              ; 4
    lda.wy ram_AF,Y              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_D6,X              ; 4
    lda.wy ram_BB,Y              ; 4
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_E7,X              ; 4
    lda    #$14                  ; 2
    ldy    ram_E0                ; 3
    cpy    #$02                  ; 2
    bcc    KF324                 ; 2³
    lsr                          ; 2
KF324:
    sta    ram_EC,X              ; 4
KF326:
    dec    ram_EC,X              ; 6
    bmi    KF34A                 ; 2³
    ldy    ram_EA,X              ; 4
    jsr    KFCB9                 ; 6
    lda    ram_E4                ; 3
    bmi    KF355                 ; 2³
    lda    ram_D6,X              ; 4
    cmp    #$69                  ; 2
    bcc    KF355                 ; 2³
    cmp    #$6E                  ; 2
    bcs    KF355                 ; 2³
    lda    ram_E7,X              ; 4
    cmp    #$2E                  ; 2
    bcc    KF355                 ; 2³
    cmp    #$36                  ; 2
    bcs    KF355                 ; 2³
    jsr    KF48E                 ; 6
KF34A:
    lda    #$FF                  ; 2
    sta    ram_E7,X              ; 4
    ldy    ram_E0                ; 3
    lda    KFF55,Y               ; 4
    sta    ram_EC,X              ; 4
KF355:
    rts                          ; 6

KF356:
    lda    ram_C5                ; 3
    bmi    KF3CB                 ; 2³
    lda    ram_A8                ; 3
    beq    KF3CA                 ; 2³
    lda    ram_E4                ; 3
    bpl    KF367                 ; 2³
    ldx    ram_9D                ; 3
    bpl    KF39A                 ; 2³
    rts                          ; 6

KF367:
    lda    ram_B9                ; 3
    cmp    #$66                  ; 2
    bcc    KF382                 ; 2³
    cmp    #$6B                  ; 2
    bcs    KF382                 ; 2³
    lda    ram_9D                ; 3
    cmp    #$2E                  ; 2
    bcc    KF382                 ; 2³
    cmp    #$38                  ; 2
    bcs    KF382                 ; 2³
    jsr    KF48E                 ; 6
KF37E:
    lda    #$07                  ; 2
    bne    KF3AC                 ; 3   always branch

KF382:
    ldx    ram_9D                ; 3
    lda    ram_9C                ; 3
    and    #$07                  ; 2
    beq    KF39A                 ; 2³
    lda    ram_E9                ; 3
    bne    KF3CA                 ; 2³
    dec    ram_9C                ; 5
    lda    ram_9C                ; 3
    and    #$07                  ; 2
    bne    KF3CA                 ; 2³
    ldx    ram_C4                ; 3
    bmi    KF37E                 ; 2³
KF39A:
    inx                          ; 2
    txa                          ; 2
    sta    ram_9D                ; 3
    sbc    #$05                  ; 2
    cmp    ram_C5                ; 3
    bcs    KF3C0                 ; 2³
    adc    #$09                  ; 2
    cmp    ram_C5                ; 3
    bcc    KF3C0                 ; 2³
    lda    #$17                  ; 2
KF3AC:
    clc                          ; 2
    adc    ram_9C                ; 3
    sta    ram_9C                ; 3
    ldx    ram_E0                ; 3
    cmp    KFF9D,X               ; 4
    bne    KF3BC                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_C5                ; 3
KF3BC:
    lda    #$FF                  ; 2
    bne    KF3C8                 ; 3   always branch

KF3C0:
    lda    ram_9D                ; 3
    cmp    #$62                  ; 2
    bcc    KF3C8                 ; 2³
    lda    #$01                  ; 2
KF3C8:
    sta    ram_9D                ; 3
KF3CA:
    rts                          ; 6

KF3CB:
    sta    ram_F4                ; 3
    ldy    ram_C4                ; 3
    bmi    KF401                 ; 2³+1
    lda    ram_E4                ; 3
    bpl    KF3D9                 ; 2³
    lda    ram_A8                ; 3
    bne    KF3E1                 ; 2³
KF3D9:
    dec    ram_9C                ; 5
    lda    ram_9C                ; 3
    and    #$01                  ; 2
    bne    KF400                 ; 2³+1
KF3E1:
    cpy    #$31                  ; 2
    beq    KF3F1                 ; 2³
    bcc    KF3ED                 ; 2³
    dec    ram_C4                ; 5
    dec    ram_D8                ; 5
    bne    KF3F1                 ; 2³
KF3ED:
    inc    ram_C4                ; 5
    inc    ram_D8                ; 5
KF3F1:
    ldy    ram_B9                ; 3
    sty    ram_B8                ; 3
    cpy    #$69                  ; 2
    beq    KF400                 ; 2³+1
    bcc    KF3FE                 ; 2³
    dec    ram_B9                ; 5
    rts                          ; 6

KF3FE:
    inc    ram_B9                ; 5
KF400:
    rts                          ; 6

KF401:
    ldx    ram_D2                ; 3
    bmi    KF400                 ; 2³
    lda    ram_92                ; 3
    bne    KF400                 ; 2³
    lda    ram_9A                ; 3
    bne    KF400                 ; 2³
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    bne    KF416                 ; 2³
    dex                          ; 2
    bmi    KF400                 ; 2³
KF416:
    lda    ram_BB,X              ; 4
    sta    ram_C4                ; 3
    sbc    #$02                  ; 2
    sta    ram_D8                ; 3
    lda    ram_AF,X              ; 4
    sta    ram_B9                ; 3
    sta    ram_B8                ; 3
    jsr    KFCE4                 ; 6
    rts                          ; 6

    rts                          ; 6   ever used??

KF429:
    lda    ram_A8                ; 3
    bne    KF485                 ; 2³
    lda    ram_E4                ; 3
    bmi    KF485                 ; 2³
    ldx    #$09                  ; 2
    lda    ram_C4                ; 3
    cmp    #$36                  ; 2
    bcs    KF447                 ; 2³
    cmp    #$2B                  ; 2
    bcc    KF447                 ; 2³
    lda    ram_B8                ; 3
    cmp    #$64                  ; 2
    bcc    KF447                 ; 2³
    cmp    #$6D                  ; 2
    bcc    KF45F                 ; 2³
KF447:
    ldx    ram_D2                ; 3
    bmi    KF485                 ; 2³
KF44B:
    lda    ram_BB,X              ; 4
    cmp    #$38                  ; 2
    bcs    KF48A                 ; 2³
    cmp    #$31                  ; 2
    bcc    KF48A                 ; 2³
    lda    ram_AF,X              ; 4
    cmp    #$63                  ; 2
    bcc    KF48A                 ; 2³
    cmp    #$6D                  ; 2
    bcs    KF48A                 ; 2³
KF45F:
    cpx    ram_D9                ; 3
    bne    KF467                 ; 2³
    lda    ram_92                ; 3
    bne    KF485                 ; 2³
KF467:
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    beq    KF486                 ; 2³
    jsr    KF48E                 ; 6
    cpx    ram_D9                ; 3
    bne    KF477                 ; 2³
    jsr    KFC7A                 ; 6
KF477:
    jsr    KFCE4                 ; 6
    lda    #$09                  ; 2
    ldy    ram_A9                ; 3
    cpy    #$02                  ; 2
    bcs    KF485                 ; 2³
    jsr    KFC1F                 ; 6
KF485:
    rts                          ; 6

KF486:
    jsr    KF4CA                 ; 6
    rts                          ; 6

KF48A:
    dex                          ; 2
    bpl    KF44B                 ; 2³
    rts                          ; 6

KF48E:
    lda    ram_DB                ; 3
    and    ram_8B                ; 3
    and    ram_DA                ; 3
    bpl    KF4A7                 ; 2³
    lda    #$00                  ; 2
    sta    ram_F9                ; 3
    sta    ram_E5                ; 3
    lda    #$1F                  ; 2
    sta    ram_8A                ; 3
    sta    ram_92                ; 3
    lda    #$3D                  ; 2
    sta    ram_8C                ; 3
    rts                          ; 6

KF4A7:
    lda    #$01                  ; 2
    sta    ram_C6                ; 3
    lda    #$06                  ; 2
    sta    ram_E5                ; 3
    lda    #$14                  ; 2
    lda    ram_92                ; 3
    bne    KF4B9                 ; 2³
    lda    #$B4                  ; 2
    sta    ram_92                ; 3
KF4B9:
    ldy    ram_DA                ; 3
    bmi    KF4C0                 ; 2³
    dec    ram_DA                ; 5
    rts                          ; 6

KF4C0:
    lda    ram_8B                ; 3
    bmi    KF4C7                 ; 2³
    sty    ram_8B                ; 3
    rts                          ; 6

KF4C7:
    sta    ram_DB                ; 3
    rts                          ; 6

KF4CA:
    lda    ram_DB                ; 3
    bmi    KF4E5                 ; 2³
    sec                          ; 2
    sbc    #$10                  ; 2
    tay                          ; 2
    and    #$70                  ; 2
    beq    KF4D9                 ; 2³
    tya                          ; 2
    bne    KF4E3                 ; 3   always branch

KF4D9:
    lda    ram_DB                ; 3
    bmi    KF4E5                 ; 2³
    and    #$03                  ; 2
    bne    KF4E6                 ; 2³
    lda    #$FF                  ; 2
KF4E3:
    sta    ram_DB                ; 3
KF4E5:
    rts                          ; 6

KF4E6:
    sec                          ; 2
    sbc    #$01                  ; 2
    ora    #$70                  ; 2
    bne    KF4E3                 ; 3   always branch

KF4ED:
    lda    #$00                  ; 2
    sta    ram_AA                ; 3
    lda    ram_AF,X              ; 4
    ldy    ram_BB,X              ; 4
    cmp    #$6D                  ; 2
    bcs    KF4FD                 ; 2³
    cmp    #$68                  ; 2
    bcs    KF531                 ; 2³+1
KF4FD:
    cpy    #$38                  ; 2
    bcs    KF505                 ; 2³
    cpy    #$30                  ; 2
    bcs    KF541                 ; 2³
KF505:
    lda    ram_BB,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ram_AF,X              ; 4
    cmp    KFBDA,Y               ; 4
    bcc    KF54F                 ; 2³
    cmp    KFBE7,Y               ; 4
    bcc    KF529                 ; 2³
    cmp    KFBF2,Y               ; 4
    bcc    KF54B                 ; 2³
    cmp    KFBFD,Y               ; 4
    bcs    KF55B                 ; 2³
    dec    ram_AA                ; 5
    cpy    #$06                  ; 2
    bcs    KF55F                 ; 2³
;    bcc    KF557                 ; 3   always branch

;moved
KF557:
    ldy    #$01                  ; 2
    bne    KF56D                 ; 3   always branch

KF529:
    dec    ram_AA                ; 5
    cpy    #$06                  ; 2
    bcs    KF567                 ; 2³
    bcc    KF56B                 ; 3   always branch
   

;moved
KF541:
    cmp    #$50                  ; 2
    bcc    KF54B                 ; 2³
    cmp    #$87                  ; 2
    bcs    KF54B                 ; 2³
    dec    ram_AA                ; 5
KF54B:
    cmp    #$69                  ; 2
    bcs    KF55B                 ; 2³
KF54F:
    ldy    #$06                  ; 2
    bne    KF56D                 ; 3   always branch

KF531:
    cpy    #$5A                  ; 2
    bcs    KF53B                 ; 2³
    cpy    #$19                  ; 2
    bcc    KF53B                 ; 2³
    dec    ram_AA                ; 5
KF53B:
    cpy    #$33                  ; 2
    bcs    KF563                 ; 2³
;    bcc    KF553                 ; 3   always branch

KF553:
    ldy    #$00                  ; 2
;    beq    KF56D                 ; 3   always branch
    .byte $0C ; NOP skip 2 bytes

KF55B:
    ldy    #$02                  ; 2
;    bne    KF56D                 ; 3   always branch
    .byte $0C ; NOP skip 2 bytes

KF55F:
    ldy    #$03                  ; 2
;    bne    KF56D                 ; 3   always branch
    .byte $0C ; NOP skip 2 bytes

KF563:
    ldy    #$04                  ; 2
;    bne    KF56D                 ; 3   always branch
    .byte $0C ; NOP skip 2 bytes

KF567:
    ldy    #$05                  ; 2
;    bne    KF56D                 ; 3   always branch
    .byte $0C ; NOP skip 2 bytes

KF56B:
    ldy    #$07                  ; 2
KF56D:
    lda    ram_C7,X              ; 4
    sec                          ; 2
    sbc    KFBBB,Y               ; 4
    beq    KF59D                 ; 2³
    bmi    KF57D                 ; 2³
    cmp    #$10                  ; 2
    bcs    KF590                 ; 2³
    bcc    KF583                 ; 3   always branch

KF57D:
    eor    #$FF                  ; 2
    cmp    #$10                  ; 2
    bcc    KF590                 ; 2³
KF583:
    lda    ram_C7,X              ; 4
    cmp    #$D8                  ; 2
    bne    KF58B                 ; 2³
    lda    #$F8                  ; 2
KF58B:
    sec                          ; 2
    sbc    #$04                  ; 2
    bne    KF59B                 ; 2³
KF590:
    lda    ram_C7,X              ; 4
    clc                          ; 2
    adc    #$04                  ; 2
    cmp    #$F8                  ; 2
    bne    KF59B                 ; 2³
    lda    #$D8                  ; 2
KF59B:
    sta    ram_C7,X              ; 4
KF59D:
    lda    ram_AA                ; 3
    bmi    KF5E3                 ; 2³
    lda    ram_C7,X              ; 4
    sec                          ; 2
    sbc    #$D8                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldy    ram_E0                ; 3
    ora    KFC09,Y               ; 4
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ram_AF,X              ; 4
    clc                          ; 2
    adc    KFF6D,Y               ; 4
    cmp    #$36                  ; 2
    bcs    KF5BC                 ; 2³
    lda    #$9D                  ; 2
KF5BC:
    cmp    #$9E                  ; 2
    bcc    KF5C2                 ; 2³
    lda    #$36                  ; 2
KF5C2:
    sta    ram_AF,X              ; 4
    lda    ram_BB,X              ; 4
    clc                          ; 2
    adc    KFF25,Y               ; 4
KF5CA:
    cmp    #$07                  ; 2
    bcs    KF5E4                 ; 2³
    adc    #$5E                  ; 2
    sta    ram_D5                ; 3
    sec                          ; 2
    sbc    #$09                  ; 2
    ldy    ram_D2                ; 3
    cmp.wy ram_BB,Y              ; 4
    bcc    KF63B                 ; 2³+1
    lda    ram_D5                ; 3
    sta    ram_BB,X              ; 4
    jsr    KFD1C                 ; 6
KF5E3:
    rts                          ; 6

KF5E4:
    cmp    #$65                  ; 2
    bcc    KF5FA                 ; 2³
    sbc    #$5E                  ; 2
    clc                          ; 2
    adc    #$0A                  ; 2
    cmp    ram_BB                ; 3
    bcs    KF63B                 ; 2³+1
    sec                          ; 2
    sbc    #$0A                  ; 2  change to save a byte
    sta    ram_BB,X              ; 4
    jsr    KFDA8                 ; 6
    rts                          ; 6

KF5FA:
    clc                          ; 2
    adc    #$0A                  ; 2
    cpx    ram_D2                ; 3
    bne    KF60F                 ; 2³
    cmp    #$65                  ; 2
    bcc    KF613                 ; 2³
    tay                          ; 2
    sbc    #$5E                  ; 2
    cmp    ram_BB                ; 3
    bcs    KF63B                 ; 2³
    tya                          ; 2
    bcc    KF613                 ; 3   always branch

KF60F:
    cmp    ram_BC,X              ; 4
    bcs    KF63B                 ; 2³
KF613:
    sec                          ; 2
    sbc    #$13                  ; 2
    bmi    KF620                 ; 2³
    cpx    #$00                  ; 2
    bne    KF632                 ; 2³
    cmp    #$07                  ; 2
    bcs    KF636                 ; 2³
KF620:
    cpx    ram_D2                ; 3
    beq    KF636                 ; 2³
    adc    #$5E                  ; 2
    ldy    ram_D2                ; 3
    cmp.wy ram_BB,Y              ; 4
    bcc    KF63B                 ; 2³
    sbc    #$5E                  ; 2
    jmp    KF636                 ; 3

KF632:
    cmp    ram_BA,X              ; 4
    bcc    KF63B                 ; 2³
KF636:
    clc                          ; 2
    adc    #$09                  ; 2
    sta    ram_BB,X              ; 4
KF63B:
    rts                          ; 6

KF63C:
    dec    ram_E1                ; 5
    lda    ram_E4                ; 3
    bmi    KF658                 ; 2³
    
;7) thrust (all)
    
    lda    joySaveState          ; 3
    and    #$01                  ; 2   press up?
    beq    KF64D                 ; 2³  - yes
    lda    #$00                  ; 2   - no
    sta    ram_E6                ; 3
    rts                          ; 6

KF64D:
    lda    #$01                  ; 2
    sta    ram_E6                ; 3
    lda    ram_E1                ; 3
    and    #$03                  ; 2
    beq    KF658                 ; 2³
    rts                          ; 6

KF658:
    ldy    ram_8F                ; 3
    ldx    ram_D2                ; 3
    bpl    KF661                 ; 2³
    jmp    KF6CA                 ; 3

KF661:
    lda    ram_BB,X              ; 4
    clc                          ; 2
    adc    KFF15,Y               ; 4
    cmp    #$07                  ; 2
    bcs    KF66D                 ; 2³
    adc    #$5E                  ; 2
KF66D:
    cmp    #$65                  ; 2
    bcc    KF673                 ; 2³
    sbc    #$5E                  ; 2
KF673:
    sta    ram_BB,X              ; 4
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    bne    KF683                 ; 2³
    lda    ram_AF,X              ; 4
    clc                          ; 2
    adc    KFF8D,Y               ; 4
    bne    KF689                 ; 2³
KF683:
    lda    ram_AF,X              ; 4
    clc                          ; 2
    adc    KFF5D,Y               ; 4
KF689:
    cmp    #$36                  ; 2
    bcs    KF68F                 ; 2³
    lda    #$9D                  ; 2
KF68F:
    cmp    #$9E                  ; 2
    bcc    KF695                 ; 2³
    lda    #$36                  ; 2
KF695:
    sta    ram_AF,X              ; 4
    dex                          ; 2
    bpl    KF661                 ; 2³
    ldx    ram_D2                ; 3
    beq    KF6B1                 ; 2³
    lda    ram_BB,X              ; 4
    cmp    ram_BB                ; 3
    bcs    KF6B1                 ; 2³
    cmp    ram_BA,X              ; 4
    bcs    KF6AE                 ; 2³
    jsr    KFDA8                 ; 6
    jmp    KF6B1                 ; 3

KF6AE:
    jsr    KFD1C                 ; 6
KF6B1:
    ldy    ram_8F                ; 3
    ldx    ram_D2                ; 3
KF6B5:
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    bne    KF6C7                 ; 2³
    lda    ram_BB,X              ; 4
    clc                          ; 2
    adc    KFF45,Y               ; 4
    jsr    KF5CA                 ; 6
    jmp    KF6CA                 ; 3

KF6C7:
    dex                          ; 2
    bpl    KF6B5                 ; 2³
KF6CA:
    lda    ram_A9                ; 3
    cmp    #$02                  ; 2
    bcs    KF6D6                 ; 2³
    lda    ram_9D                ; 3
    bmi    KF6D6                 ; 2³
    inc    ram_9D                ; 5
KF6D6:
    ldy    ram_8F                ; 3
    lda    ram_C4                ; 3
    bmi    KF6F3                 ; 2³
    clc                          ; 2
    adc    KFF15,Y               ; 4
    cmp    #$07                  ; 2
    bcs    KF6E6                 ; 2³
    adc    #$5E                  ; 2
KF6E6:
    cmp    #$65                  ; 2
    bcc    KF6EC                 ; 2³
    sbc    #$5E                  ; 2
KF6EC:
    sta    ram_C4                ; 3
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_D8                ; 3
KF6F3:
    lda    ram_C5                ; 3
    bmi    KF70E                 ; 2³+1
    clc                          ; 2
    adc    KFF15,Y               ; 4
    cmp    #$07                  ; 2
    bcs    KF701                 ; 2³+1
    adc    #$5E                  ; 2
KF701:
    cmp    #$65                  ; 2
    bcc    KF707                 ; 2³
    sbc    #$5E                  ; 2
KF707:
    sta    ram_C5                ; 3
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_82                ; 3
KF70E:
    lda    ram_B9                ; 3
    clc                          ; 2
    adc    KFF5D,Y               ; 4
    cmp    #$36                  ; 2
    bcs    KF71C                 ; 2³
    lda    #$9D                  ; 2
    bne    KF722                 ; 3   always branch

KF71C:
    cmp    #$9E                  ; 2
    bcc    KF722                 ; 2³
    lda    #$36                  ; 2
KF722:
    sta    ram_B9                ; 3
    sta    ram_B8                ; 3
    ldx    #$01                  ; 2
KF728:
    jsr    KFCB9                 ; 6
    dex                          ; 2
    bpl    KF728                 ; 2³
    rts                          ; 6

KF72F:
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    KF75B                 ; 2³
    ldx    ram_91                ; 3
    beq    KF740                 ; 2³
    bmi    KF75B                 ; 2³
    dec    ram_91                ; 5
    jmp    KF803                 ; 3

KF740:
    ldx    #$04                  ; 2
    stx    ram_91                ; 3
    lda    joySaveState          ; 3
    and    #$04                  ; 2  press left?
    bne    KF75C                 ; 2³ - no
    lda    ram_8C                ; 3  - yes
    inc    ram_8F                ; 5
    clc                          ; 2
    adc    #$0A                  ; 2  rotate ship left
    cmp    #$A0                  ; 2
    bne    KF759                 ; 2³
    lda    #$00                  ; 2  reset ship position
    sta    ram_8F                ; 3
KF759:
    sta    ram_8C                ; 3
KF75B:
    rts                          ; 6

KF75C:
    lda    joySaveState          ; 3
    and    #$08                  ; 2   press right?
    beq    KF763                 ; 2³  - yes
    rts                          ; 6   - no

KF763:
    lda    ram_8C                ; 3
    dec    ram_8F                ; 5
    sec                          ; 2
    sbc    #$0A                  ; 2  rotate ship right
    cmp    #$F6                  ; 2
    bne    KF774                 ; 2³
    lda    #$0F                  ; 2
    sta    ram_8F                ; 3
    lda    #$96                  ; 2  reset ship position
KF774:
    sta    ram_8C                ; 3
    rts                          ; 6

KF777:
    ldx    ram_95                ; 3
    lda    ram_91                ; 3
    bmi    KF77E                 ; 2³
KF77D:
    rts                          ; 6

KF77E:
    lda    joySaveState          ; 3
    and    #$04                  ; 2   press left?
    bne    KF7B0                 ; 2³  - no
    lda    ram_88                ; 3   - yes
    clc                          ; 2
    adc    #$01                  ; 2
    ldy    ram_BA                ; 3
    bne    KF790                 ; 2³
    clc                          ; 2
    adc    #$03                  ; 2
KF790:
    cmp    KFC90,X               ; 4
    bcc    KF79B                 ; 2³
KF795:
    ldy    ram_92                ; 3
    beq    KF7AC                 ; 2³
;    bne    KF77D                 ; 3   always branch
    RTS

KF79B:
    sta    ram_88                ; 3
    lda    ram_89                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    ldy    ram_BA                ; 3
    bne    KF7A9                 ; 2³
    clc                          ; 2
    adc    #$03                  ; 2
KF7A9:
    sta    ram_89                ; 3
    rts                          ; 6

KF7AC:
    jsr    KFC7A                 ; 6
    rts                          ; 6

KF7B0:
    lda    joySaveState          ; 3
    and    #$08                  ; 2   press right?
    bne    KF7D7                 ; 2³  - no
    lda    ram_88                ; 3   - yes
    sec                          ; 2
    sbc    #$01                  ; 2
    ldy    ram_BA                ; 3
    bne    KF7C2                 ; 2³
    sec                          ; 2
    sbc    #$03                  ; 2
KF7C2:
    cmp    #$1A                  ; 2
    bcc    KF795                 ; 2³
    sta    ram_88                ; 3
    lda    ram_89                ; 3
    sec                          ; 2
    sbc    #$01                  ; 2
    ldy    ram_BA                ; 3
    bne    KF7D4                 ; 2³
    sec                          ; 2
    sbc    #$03                  ; 2
KF7D4:
    sta    ram_89                ; 3
    rts                          ; 6

KF7D7:
    lda    ram_92                ; 3
    bne    KF7DF                 ; 2³
    lda    ram_9A                ; 3
    beq    KF7E0                 ; 2³
KF7DF:
    rts                          ; 6

KF7E0:
    lda    ram_A8                ; 3
    beq    KF802                 ; 2³+1
    ldx    ram_D9                ; 3
    jmp    KF80B                 ; 3

KF7E9:
    cmp    #$23                  ; 2
    bcs    KF7AC                 ; 2³
    ldy    #$00                  ; 2
    cmp    #$1C                  ; 2
    bcs    KF7FB                 ; 2³
    ldy    #$05                  ; 2
    cmp    #$14                  ; 2
    bcs    KF7FB                 ; 2³
    ldy    #$07                  ; 2
KF7FB:
    cpy    ram_95                ; 3
    beq    KF802                 ; 2³+1
    jsr    KFD5A                 ; 6
KF802:
    rts                          ; 6

KF803:
    ldx    #$0A                  ; 2
    lda    ram_E4                ; 3
    beq    KF80B                 ; 2³
    ldx    #$09                  ; 2
KF80B:
    lda    #$23                  ; 2
    sta    ram_AA                ; 3
KF80F:
    ldy    ram_8F                ; 3
    lda    KFC99,Y               ; 4
    pha                          ; 3
    lda    KFCA9,Y               ; 4
    pha                          ; 3
    rts                          ; 6

KF81A:
    sta    ram_D4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_D4                ; 3
KF821:
    ldy    ram_91                ; 3
    cpy    #$F0                  ; 2
    bne    KF82A                 ; 2³
    jmp    KF7E9                 ; 3

KF82A:
    cpy    #$E0                  ; 2
    bne    KF831                 ; 2³
    jmp    KFC4C                 ; 3

KF831:
    cmp    ram_AA                ; 3
    bcs    KF839                 ; 2³
    sta    ram_AA                ; 3
    stx    ram_D9                ; 3
KF839:
    cpx    #$09                  ; 2
    bne    KF843                 ; 2³
    ldx    ram_D2                ; 3
;    bpl    KF80F                 ; 2³
;    bmi    KF846                 ; 3   always branch
    .byte $04 ; NOP, skip 1 byte

KF843:
    dex                          ; 2
    bpl    KF80F                 ; 2³
KF846:
    lda    ram_AA                ; 3
    cmp    #$23                  ; 2
    bne    KF85D                 ; 2³
    sta    ram_88                ; 3
    lda    #$3C                  ; 2
    sta    ram_83                ; 3
    sta    ram_85                ; 3
    lda    ram_91                ; 3
    bpl    KF85C                 ; 2³
    lda    #$05                  ; 2
    sta    ram_91                ; 3
KF85C:
    rts                          ; 6

KF85D:
    cmp    #$1C                  ; 2
    bcc    KF865                 ; 2³
    ldy    #$00                  ; 2
    beq    KF86F                 ; 3   always branch

KF865:
    cmp    #$14                  ; 2
    bcc    KF86D                 ; 2³
    ldy    #$05                  ; 2
    bne    KF86F                 ; 3   always branch

KF86D:
    ldy    #$07                  ; 2
KF86F:
    jsr    KFD5A                 ; 6
    ldx    ram_D9                ; 3
    cpx    #$0A                  ; 2
    bcc    KF880                 ; 2³
    lda    #$E0                  ; 2
    ldx    #$82                  ; 2
    ldy    #$8C                  ; 2
    bne    KF890                 ; 3   always branch

KF880:
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    beq    KF8A3                 ; 2³
    cmp    #$CC                  ; 2
    beq    KF89B                 ; 2³
    lda    #$42                  ; 2
    ldx    #$00                  ; 2
    ldy    #$0A                  ; 2
KF890:
    sta    ram_87                ; 3
    stx    ram_83                ; 3
    sty    ram_85                ; 3
    lda    #$F0                  ; 2
    sta    ram_91                ; 3
    rts                          ; 6

KF89B:
    lda    #$42                  ; 2
    ldx    #$6E                  ; 2
    ldy    #$78                  ; 2
    bne    KF890                 ; 2³
KF8A3:
    lda    #$22                  ; 2
    ldx    #$46                  ; 2
    ldy    #$50                  ; 2
    bne    KF890                 ; 3   always branch

KF8AB:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6A                  ; 2
    bpl    KF8B4                 ; 2³
    eor    #$FF                  ; 2
KF8B4:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$2F                  ; 2
    bmi    KF8C2                 ; 2³
KF8BE:
    cmp    ram_80                ; 3
    bcs    KF8C4                 ; 2³
KF8C2:
    lda    #$FF                  ; 2
KF8C4:
    jmp    KF821                 ; 3

KF8C7:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$33                  ; 2
    bpl    KF8D0                 ; 2³
    eor    #$FF                  ; 2
KF8D0:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_AF,X              ; 4
    sbc    #$6D                  ; 2
    bpl    KF8C2                 ; 2³
    eor    #$FF                  ; 2
KF8DC:
    cmp    ram_80                ; 3
    bcs    KF933                 ; 2³+1
    bcc    KF8C2                 ; 3   always branch

KF8E2:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6A                  ; 2
    bpl    KF8EB                 ; 2³
    eor    #$FF                  ; 2
KF8EB:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$37                  ; 2
    bpl    KF8C2                 ; 2³
    eor    #$FF                  ; 2
    bpl    KF8BE                 ; 3   always branch

KF8F9:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$33                  ; 2
    bpl    KF902                 ; 2³
    eor    #$FF                  ; 2
KF902:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$67                  ; 2
    bpl    KF8DC                 ; 2³+1
    bmi    KF8C2                 ; 3+1   always branch

KF90F:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6B                  ; 2
    bpl    KF8C2                 ; 2³+1
    eor    #$FF                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$30                  ; 2
    bmi    KF8C2                 ; 2³+1
KF922:
    cmp    ram_80                ; 3
    bcs    KF8C2                 ; 2³+1
    sta    ram_D5                ; 3
    asl                          ; 2
    adc    ram_D5                ; 3
    cmp    ram_80                ; 3
    bcc    KF8C2                 ; 2³+1
    lda    ram_D5                ; 3
    bpl    KF8C4                 ; 2³+1
KF933:
    jmp    KF81A                 ; 3

KF936:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6B                  ; 2
    bpl    KF8C2                 ; 2³+1
    eor    #$FF                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$36                  ; 2
    bpl    KF9B5                 ; 2³
KF949:
    eor    #$FF                  ; 2
KF94B:
    bpl    KF922                 ; 3   always branch

KF94D:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$69                  ; 2
    bmi    KF9B5                 ; 2³
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$36                  ; 2
    bmi    KF949                 ; 2³
    bpl    KF9B5                 ; 3   always branch

KF960:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$69                  ; 2
    bmi    KF9B5                 ; 2³
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sbc    #$30                  ; 2
    bpl    KF94B                 ; 2³
    bmi    KF9B5                 ; 3   always branch

KF973:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$32                  ; 2
    bmi    KF9B5                 ; 2³
KF97A:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_AF,X              ; 4
    sbc    #$6D                  ; 2
    bpl    KF9B5                 ; 2³
    eor    #$FF                  ; 2
KF986:
    cmp    ram_80                ; 3
    bcs    KF9B5                 ; 2³
    sta    ram_D5                ; 3
    asl                          ; 2
    adc    ram_D5                ; 3
    cmp    ram_80                ; 3
    bcc    KF9B5                 ; 2³
    lda    ram_D5                ; 3
    bpl    KF933                 ; 2³

KF997:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$34                  ; 2
    bpl    KF9B5                 ; 2³
    eor    #$FF                  ; 2
    bpl    KF97A                 ; 3   always branch

KF9A2:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$34                  ; 2
    bpl    KF9B5                 ; 2³
    eor    #$FF                  ; 2
KF9AB:
    asl                          ; 2
    asl                          ; 2
    sta    ram_80                ; 3
    lda    ram_AF,X              ; 4
    sbc    #$67                  ; 2
    bpl    KF986                 ; 2³
KF9B5:
    lda    #$FF                  ; 2
    jmp    KF821                 ; 3

KF9BA:  ; indirect jump
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$32                  ; 2
    bpl    KF9AB                 ; 2³
    bmi    KF9B5                 ; 3   always branch

KF9C3:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6C                  ; 2
    bpl    KF9B5                 ; 2³
    eor    #$FF                  ; 2
KF9CC:
    sta    ram_D4                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_D4                ; 3
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$31                  ; 2
    bmi    KF9B5                 ; 2³
KF9DB:
    sta    ram_D5                ; 3
    asl                          ; 2
    asl                          ; 2
    cmp    ram_80                ; 3
    bcc    KF9B5                 ; 2³
    sbc    ram_D5                ; 3
    sta    ram_81                ; 3
    lda    ram_D4                ; 3
    asl                          ; 2
    asl                          ; 2
    cmp    ram_81                ; 3
    bcc    KF9B5                 ; 2³
    lda    ram_D4                ; 3
    cmp    ram_D5                ; 3
    bcs    KF9F9                 ; 2³
    lda    ram_D5                ; 3
    bpl    KFA1A                 ; 2³+1
KF9F9:
    jmp    KF81A                 ; 3

KF9FC:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$6C                  ; 2
    bpl    KFA18                 ; 2³
    eor    #$FF                  ; 2
KFA05:
    sta    ram_D4                ; 3
    asl                          ; 2
    clc                          ; 2
    adc    ram_D4                ; 3
    sta    ram_80                ; 3
    lda    ram_BB,X              ; 4
    sec                          ; 2
    sbc    #$35                  ; 2
    bpl    KFA18                 ; 2³
    eor    #$FF                  ; 2
    bpl    KF9DB                 ; 2³+1
KFA18:
    lda    #$FF                  ; 2
KFA1A:
    jmp    KF821                 ; 3

KFA1D:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$68                  ; 2
    bpl    KFA05                 ; 2³
    bmi    KFA18                 ; 3   always branch

KFA26:  ; indirect jump
    lda    ram_AF,X              ; 4
    sec                          ; 2
    sbc    #$68                  ; 2
    bpl    KF9CC                 ; 2³+1
    bmi    KFA18                 ; 3   always branch

KFA2F:
    lda    #$EA                  ; 2
    sta    ram_AE                ; 3
    lda    #$09                  ; 2
    sta    ram_C6                ; 3
    sta    ram_9C                ; 3
    lda    #$9A                  ; 2
    sta    ram_AC                ; 3
    inc    ram_A9                ; 5
    lda    ram_A9                ; 3
    cmp    #$03                  ; 2
    bcc    KFA49                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A9                ; 3
KFA49:
    sta    ram_E9                ; 3
    ldy    #$00                  ; 2
    inc    ram_AD                ; 5
    ldx    ram_AD                ; 3
    cpx    #$05                  ; 2
    beq    KFA5E                 ; 2³
    bcs    KFA61                 ; 2³
    cmp    #$02                  ; 2
    bcc    KFA65                 ; 2³
    jmp    KFB74                 ; 3

KFA5E:
    jmp    KFD80                 ; 3

KFA61:
    inc    ram_E0                ; 5
    sty    ram_AD                ; 3
KFA65:
    sty    ram_E4                ; 3
    lda    #$6A                  ; 2
    sta    ram_F0                ; 3
    lda    ram_E0                ; 3
    cmp    #$0A                  ; 2
    bcc    KFA75                 ; 2³
    lda    #$09                  ; 2
    sta    ram_E0                ; 3
KFA75:
    adc    ram_AD                ; 3
    cmp    #$09                  ; 2
    bcc    KFA7D                 ; 2³
    lda    #$08                  ; 2
KFA7D:
    sta    ram_D2                ; 3
    tax                          ; 2
    sta    ram_EC                ; 3
    sta    ram_ED                ; 3
    ldy    KFBB2,X               ; 4
KFA87:
    lda    KFBBB,X               ; 4
    sta    ram_C7,X              ; 4
    lda    KFFB1,Y               ; 4
    sta    ram_BB,X              ; 4
    lda    #$42                  ; 2
    sta    ram_F4                ; 3
    rol    ram_F3                ; 5
    bcc    KFA9B                 ; 2³
    lda    #$78                  ; 2
KFA9B:
    rol    ram_F2                ; 5
    bcs    KFAA1                 ; 2³
    adc    #$0A                  ; 2
KFAA1:
    sta    ram_AF,X              ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    KFA87                 ; 2³
    lda    ram_D2                ; 3
    tax                          ; 2
    and    #$01                  ; 2
    beq    KFABA                 ; 2³
    lda    ram_DB                ; 3
    bmi    KFABA                 ; 2³
    lda    #$C8                  ; 2
    sta    ram_C7,X              ; 4
    lda    #$69                  ; 2
    sta    ram_AF,X              ; 4
KFABA:
    lda    ram_F3                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    KFFDF,X               ; 4
    sta    ram_B9                ; 3
    sta    ram_B8                ; 3
    lda    KFFE7,X               ; 4
    sta    ram_D8                ; 3
    adc    #$02                  ; 2
    sta    ram_C4                ; 3
    adc    #$17                  ; 2
    sta    ram_82                ; 3
    adc    #$04                  ; 2
    sta    ram_C5                ; 3
    jsr    KFC7A                 ; 6
    rts                          ; 6

KFADB:
    ldx    #$FF                  ; 2
    lda    ram_AC                ; 3
    cmp    #$67                  ; 2
    beq    KFB34                 ; 2³+1
    bcs    KFAEB                 ; 2³
    ldy    ram_9D                ; 3
    bpl    KFAEB                 ; 2³
    ldx    #$00                  ; 2
KFAEB:
    stx    ram_E6                ; 3
    jsr    KFC7A                 ; 6
    ldy    #$28                  ; 2
    sty    ram_8C                ; 3
    ldy    #$04                  ; 2
    sty    ram_8F                ; 3
    ldy    #$00                  ; 2
    sty    ram_9A                ; 3
    dey                          ; 2
    sty    ram_E7                ; 3
    sty    ram_E8                ; 3
    cmp    #$34                  ; 2
    bcc    KFB11                 ; 2³
    lda    #$3C                  ; 2
    sta    ram_D5                ; 3
    dec    ram_AC                ; 5
    lda    #$03                  ; 2
    sta    ram_E9                ; 3
    bne    KFB58                 ; 3   always branch

KFB11:
    sty    ram_BA                ; 3
    iny                          ; 2
    sty    ram_E6                ; 3
    sty    ram_DD                ; 3
    lda    ram_9D                ; 3
    bpl    KFB29                 ; 2³
    dec    ram_E9                ; 5
    bne    KFB58                 ; 2³
    lda    #$04                  ; 2
    sta    ram_E9                ; 3
    lda    #$2D                  ; 2
    jsr    KFC1F                 ; 6
KFB29:
    dec    ram_D5                ; 5
    bne    KFB58                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BA                ; 3
    jmp    KF123                 ; 3

KFB34:
    lda    ram_D2                ; 3
    cmp    #$08                  ; 2
    beq    KFB3E                 ; 2³
    lda    ram_9D                ; 3
    bpl    KFB42                 ; 2³
KFB3E:
    dec    ram_AC                ; 5
    bne    KFB58                 ; 2³
KFB42:
    dec    ram_E9                ; 5
    bpl    KFB51                 ; 2³
    ldx    #$08                  ; 2
    stx    ram_E9                ; 3
    lda    ram_E4                ; 3
    bpl    KFB51                 ; 2³
    jsr    KF4CA                 ; 6
KFB51:
    jsr    KF63C                 ; 6
    lda    ram_C5                ; 3
    sta    ram_9D                ; 3
KFB58:
    lda    #$FF                  ; 2
    sta    ram_C5                ; 3
    lda    ram_83                ; 3
    cmp    #$82                  ; 2
    bne    KFB6E                 ; 2³
    lda    #$5A                  ; 2
    sta    ram_83                ; 3
    lda    #$64                  ; 2
    sta    ram_85                ; 3
    lda    #$20                  ; 2
    sta    ram_87                ; 3
KFB6E:
    jsr    KF16C                 ; 6
    jmp    KF00A                 ; 3

KFB74:
    pla                          ; 4
    pla                          ; 4
    lda    #$46                  ; 2
    sta    ram_F0                ; 3
    ldy    #$D0                  ; 2
    lda    ram_E0                ; 3
    ror                          ; 2
    bcs    KFB83                 ; 2³
    ldy    #$C4                  ; 2
KFB83:
    ldx    #$08                  ; 2
    stx    ram_D2                ; 3
KFB87:
    lda    KFFEF,X               ; 4
    sta    ram_AF,X              ; 4
    lda    KFFD5,X               ; 4
    sta    ram_BB,X              ; 4
    sty    ram_C7,X              ; 4
    dex                          ; 2
    bpl    KFB87                 ; 2³
    stx    ram_C5                ; 3
    stx    ram_9C                ; 3
    jmp    KF00A                 ; 3

KFB9D:
    lda    ram_91                ; 3
    pha                          ; 3
    jsr    KF803                 ; 6
    pla                          ; 4
    sta    ram_91                ; 3
    jsr    KF429                 ; 6
    jsr    KF16C                 ; 6
    jsr    KFDE6                 ; 6
    jmp    KF004                 ; 3

KFBB2:
    .byte $00 ; |        | $FBB2
    .byte $02 ; |      X | $FBB3
    .byte $05 ; |     X X| $FBB4
    .byte $09 ; |    X  X| $FBB5
    .byte $0E ; |    XXX | $FBB6
    .byte $14 ; |   X X  | $FBB7
    .byte $1B ; |   XX XX| $FBB8
    .byte $23 ; |  X   XX| $FBB9
    .byte $2C ; |  X XX  | $FBBA
KFBBB:
    .byte $D8 ; |XX XX   | $FBBB
    .byte $DC ; |XX XXX  | $FBBC
    .byte $E0 ; |XXX     | $FBBD
    .byte $E4 ; |XXX  X  | $FBBE
    .byte $E8 ; |XXX X   | $FBBF
    .byte $EC ; |XXX XX  | $FBC0
    .byte $F0 ; |XXXX    | $FBC1
    .byte $F4 ; |XXXX X  | $FBC2
    .byte $D8 ; |XX XX   | $FBC3
KFBC4:
    .byte $00 ; |        | $FBC4
    .byte $40 ; | X      | $FBC5
    .byte $42 ; | X    X | $FBC6
    .byte $30 ; |  XX    | $FBC7
    .byte $32 ; |  XX  X | $FBC8
    .byte $26 ; |  X  XX | $FBC9
    .byte $26 ; |  X  XX | $FBCA
    .byte $96 ; |X  X XX | $FBCB
    .byte $44 ; | X   X  | $FBCC
    .byte $44 ; | X   X  | $FBCD
    .byte $26 ; |  X  XX | $FBCE
KFBCF:
    .byte $00 ; |        | $FBCF
    .byte $28 ; |  X X   | $FBD0
    .byte $14 ; |   X X  | $FBD1
    .byte $28 ; |  X X   | $FBD2
    .byte $14 ; |   X X  | $FBD3
    .byte $28 ; |  X X   | $FBD4
    .byte $14 ; |   X X  | $FBD5
    .byte $28 ; |  X X   | $FBD6
    .byte $14 ; |   X X  | $FBD7
    .byte $28 ; |  X X   | $FBD8
    .byte $14 ; |   X X  | $FBD9
KFBDA:
    .byte $69 ; | XX X  X| $FBDA
    .byte $69 ; | XX X  X| $FBDB
    .byte $4A ; | X  X X | $FBDC
    .byte $52 ; | X X  X | $FBDD
    .byte $5A ; | X XX X | $FBDE
    .byte $62 ; | XX   X | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $61 ; | XX    X| $FBE1
    .byte $59 ; | X XX  X| $FBE2
    .byte $51 ; | X X   X| $FBE3
    .byte $49 ; | X  X  X| $FBE4
    .byte $69 ; | XX X  X| $FBE5
    .byte $69 ; | XX X  X| $FBE6
KFBE7:
    .byte $00 ; |        | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $4F ; | X  XXXX| $FBE9
    .byte $57 ; | X X XXX| $FBEA
    .byte $5F ; | X XXXXX| $FBEB
    .byte $67 ; | XX  XXX| $FBEC
    .byte $00 ; |        | $FBED
    .byte $64 ; | XX  X  | $FBEE
    .byte $5C ; | X XXX  | $FBEF
    .byte $54 ; | X X X  | $FBF0
    .byte $4C ; | X  XX  | $FBF1
KFBF2:
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $87 ; |X    XXX| $FBF4
    .byte $7F ; | XXXXXXX| $FBF5
    .byte $77 ; | XXX XXX| $FBF6
    .byte $6F ; | XX XXXX| $FBF7
    .byte $00 ; |        | $FBF8
    .byte $70 ; | XXX    | $FBF9
    .byte $78 ; | XXXX   | $FBFA
    .byte $80 ; |X       | $FBFB
    .byte $88 ; |X   X   | $FBFC
KFBFD:
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $8C ; |X   XX  | $FBFF
    .byte $84 ; |X    X  | $FC00
    .byte $7C ; | XXXXX  | $FC01
    .byte $74 ; | XXX X  | $FC02
    .byte $00 ; |        | $FC03
    .byte $75 ; | XXX X X| $FC04
    .byte $7D ; | XXXXX X| $FC05
    .byte $85 ; |X    X X| $FC06
    .byte $8D ; |X   XX X| $FC07
    .byte $00 ; |        | $FC08
KFC09:
    .byte $00 ; |        | $FC09
    .byte $08 ; |    X   | $FC0A
    .byte $08 ; |    X   | $FC0B
    .byte $10 ; |   X    | $FC0C
    .byte $10 ; |   X    | $FC0D
    .byte $18 ; |   XX   | $FC0E
    .byte $18 ; |   XX   | $FC0F
    .byte $18 ; |   XX   | $FC10
    .byte $18 ; |   XX   | $FC11
    .byte $18 ; |   XX   | $FC12

    ldx    #$02                  ; 2
    bne    KFC21                 ; 3   always branch

    ldx    #$08                  ; 2
    bne    KFC21                 ; 3   always branch

KFC1B:
    ldx    #$04                  ; 2
    bne    KFC21                 ; 3   always branch

KFC1F:
    ldx    #$06                  ; 2
KFC21:
    clc                          ; 2
    adc    ram_9E,X              ; 4
    sta    ram_9E,X              ; 4
    cmp    #$5A                  ; 2
    bcc    KFC34                 ; 2³
    sbc    #$5A                  ; 2
    sta    ram_9E,X              ; 4
    lda    #$09                  ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    KFC21                 ; 2³
KFC34:
    rts                          ; 6

KFC35:
    lda    ram_E2                ; 3
    bne    KFC79                 ; 2³
    dec    ram_8B                ; 5
    lda    #$14                  ; 2
    sta    ram_E2                ; 3
    lda    #$E0                  ; 2
    sta    ram_91                ; 3
    ldx    #$09                  ; 2
    lda    ram_C4                ; 3
    bmi    KFC5E                 ; 2³
KFC49:
    jmp    KF80B                 ; 3

KFC4C:
    cmp    #$FF                  ; 2
    beq    KFC5E                 ; 2³
    lda    ram_C7,X              ; 4
    cmp    #$C8                  ; 2
    beq    KFC5E                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_92                ; 3
    lda    #$D4                  ; 2
    sta    ram_C7,X              ; 4
KFC5E:
    lda    ram_D2                ; 3
    bmi    KFC6D                 ; 2³
    dex                          ; 2
    bmi    KFC6D                 ; 2³
    cpx    ram_D2                ; 3
    beq    KFC49                 ; 2³
    bcc    KFC49                 ; 2³
    bcs    KFC5E                 ; 3   always branch

KFC6D:
    lda    #$05                  ; 2
    ldx    ram_83                ; 3
    cpx    #$3C                  ; 2
    beq    KFC77                 ; 2³
    lda    #$F0                  ; 2
KFC77:
    sta    ram_91                ; 3
KFC79:
    rts                          ; 6

KFC7A:
    ldy    #$3C                  ; 2
    sty    ram_83                ; 3
    sty    ram_85                ; 3
    ldy    #$00                  ; 2
    sty    ram_88                ; 3
    sty    ram_91                ; 3
    sty    ram_95                ; 3
    ldy    #$0F                  ; 2
    sty    ram_87                ; 3
    rts                          ; 6

KFC8D:
    .byte $22 ; |  X   X | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
KFC90:
    .byte $78 ; | XXXX   | $FC90
KFC91:
    .byte $80 ; |X       | $FC91
    .byte $2A ; |  X X X | $FC92
    .byte $00 ; |        | $FC93
    .byte $3A ; |  XXX X | $FC94
    .byte $68 ; | XX X   | $FC95
    .byte $78 ; | XXXX   | $FC96
    .byte $48 ; | X  X   | $FC97
    .byte $68 ; | XX X   | $FC98
KFC99:
    .byte >KF8AB         ; $FC99
    .byte >KF90F         ; $FC9A
    .byte >KF9C3         ; $FC9B
    .byte >KF973         ; $FC9C
    .byte >KF8C7         ; $FC9D
    .byte >KF997         ; $FC9E
    .byte >KF9FC         ; $FC9F
    .byte >KF936         ; $FCA0
    .byte >KF8E2         ; $FCA1
    .byte >KF94D         ; $FCA2
    .byte >KFA1D         ; $FCA3
    .byte >KF9A2         ; $FCA4
    .byte >KF8F9         ; $FCA5
    .byte >KF9BA         ; $FCA6
    .byte >KFA26         ; $FCA7
    .byte >KF960         ; $FCA8
KFCA9:
    .byte <KF8AB-1       ; $FCA9
    .byte <KF90F-1       ; $FCAA
    .byte <KF9C3-1       ; $FCAB
    .byte <KF973-1       ; $FCAC
    .byte <KF8C7-1       ; $FCAD
    .byte <KF997-1       ; $FCAE
    .byte <KF9FC-1       ; $FCAF
    .byte <KF936-1       ; $FCB0
    .byte <KF8E2-1       ; $FCB1
    .byte <KF94D-1       ; $FCB2
    .byte <KFA1D-1       ; $FCB3
    .byte <KF9A2-1       ; $FCB4
    .byte <KF8F9-1       ; $FCB5
    .byte <KF9BA-1       ; $FCB6
    .byte <KFA26-1       ; $FCB7
    .byte <KF960-1       ; $FCB8

KFCB9:
    lda    ram_E7,X              ; 4
    bmi    KFCE3                 ; 2³
    clc                          ; 2
    adc    KFF15,Y               ; 4
    cmp    #$65                  ; 2
    bcc    KFCC7                 ; 2³
    lda    #$02                  ; 2
KFCC7:
    cmp    #$01                  ; 2
    bcs    KFCCD                 ; 2³
    lda    #$64                  ; 2
KFCCD:
    sta    ram_E7,X              ; 4
    lda    ram_D6,X              ; 4
    clc                          ; 2
    adc    KFF5D,Y               ; 4
    cmp    #$9E                  ; 2
    bcc    KFCDB                 ; 2³
    lda    #$36                  ; 2
KFCDB:
    cmp    #$36                  ; 2
    bcs    KFCE1                 ; 2³
    lda    #$9D                  ; 2
KFCE1:
    sta    ram_D6,X              ; 4
KFCE3:
    rts                          ; 6

KFCE4:
    cpx    #$09                  ; 2
    bcc    KFCF3                 ; 2³
    bne    KFCE3                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_D8                ; 3
    sta    ram_C4                ; 3
    sta    ram_D0                ; 3
    rts                          ; 6

KFCF3:
    lda    ram_D2                ; 3
    bmi    KFCE3                 ; 2³
    beq    KFD15                 ; 2³+1
    cpx    ram_D9                ; 3
    bcs    KFCFF                 ; 2³
    dec    ram_D9                ; 5
KFCFF:
    cpx    ram_D2                ; 3
    beq    KFD13                 ; 2³
    lda    ram_B0,X              ; 4
    sta    ram_AF,X              ; 4
    lda    ram_BC,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_C8,X              ; 4
    sta    ram_C7,X              ; 4
    inx                          ; 2
    jmp    KFCFF                 ; 3

KFD13:
    dec    ram_96                ; 5
KFD15:
    lda    #$FF                  ; 2
    sta    ram_C7,X              ; 4
    dec    ram_D2                ; 5
    rts                          ; 6

KFD1C:
    ldy    ram_D2                ; 3
    beq    KFD59                 ; 2³
    lda    ram_BB                ; 3
    sta    ram_D5                ; 3
    lda    ram_AF                ; 3
    sta    ram_D4                ; 3
    lda    ram_C7                ; 3
    sta    ram_AA                ; 3
    ldx    #$00                  ; 2
KFD2E:
    lda    ram_BC,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_B0,X              ; 4
    sta    ram_AF,X              ; 4
    lda    ram_C8,X              ; 4
    sta    ram_C7,X              ; 4
    inx                          ; 2
    cpx    ram_D2                ; 3
    bne    KFD2E                 ; 2³
    lda    ram_D5                ; 3
    sta    ram_BB,X              ; 4
    lda    ram_D4                ; 3
    sta    ram_AF,X              ; 4
    lda    ram_AA                ; 3
    sta    ram_C7,X              ; 4
    lda    ram_D9                ; 3
    cmp    #$09                  ; 2
    bcs    KFD59                 ; 2³
    dec    ram_D9                ; 5
    bpl    KFD59                 ; 2³
    lda    ram_D2                ; 3
    sta    ram_D9                ; 3
KFD59:
    rts                          ; 6

KFD5A:
    sty    ram_95                ; 3
    lda    joySaveState          ; 3
    and    #$04                  ; 2   press left?
    beq    KFD6E                 ; 2³  - yes
    lda    joySaveState          ; 3   - no
    and    #$08                  ; 2   press right?
    beq    KFD75                 ; 2³  - yes
    lda    ram_89                ; 3
    cmp    #$50                  ; 2
    bcs    KFD75                 ; 2³
KFD6E:
    lda    KFC8D,Y               ; 4
    ldx    #$1A                  ; 2
    bne    KFD7B                 ; 3   always branch

KFD75:
    lda    KFC91,Y               ; 4
    ldx    KFC90,Y               ; 4
KFD7B:
    sta    ram_89                ; 3
    stx    ram_88                ; 3
    rts                          ; 6

KFD80:
    pla                          ; 4
    pla                          ; 4
    lda    #$26                  ; 2
    sta    ram_F0                ; 3
    ldy    #$FF                  ; 2
    sty    ram_D2                ; 3
    sty    ram_C5                ; 3
    sty    ram_E6                ; 3
    iny                          ; 2
    sty    ram_96                ; 3
    sty    ram_E4                ; 3
    lda    #$28                  ; 2
    sta    ram_EA                ; 3
    lda    #$2C                  ; 2
    sta    ram_EB                ; 3
    lda    #$3C                  ; 2
    sta    ram_B9                ; 3
    lda    #$32                  ; 2
    sta    ram_9D                ; 3
    sta    ram_9C                ; 3
    jmp    KFB6E                 ; 3

KFDA8:
    ldy    ram_D2                ; 3
    beq    KFDE5                 ; 2³
    lda    ram_BB,X              ; 4
    sta    ram_D5                ; 3
    lda    ram_AF,X              ; 4
    sta    ram_D4                ; 3
    lda    ram_C7,X              ; 4
    sta    ram_AA                ; 3
KFDB8:
    lda    ram_BA,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_AE,X              ; 4
    sta    ram_AF,X              ; 4
    lda    ram_C6,X              ; 4
    sta    ram_C7,X              ; 4
    dex                          ; 2
    bne    KFDB8                 ; 2³
    lda    ram_D5                ; 3
    sta    ram_BB                ; 3
    lda    ram_D4                ; 3
    sta    ram_AF                ; 3
    lda    ram_AA                ; 3
    sta    ram_C7                ; 3
    lda    ram_D9                ; 3
    cmp    #$09                  ; 2
    bcs    KFDE5                 ; 2³
    inc    ram_D9                ; 5
    lda    ram_D2                ; 3
    cmp    ram_D9                ; 3
    bcs    KFDE5                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D9                ; 3
KFDE5:
    rts                          ; 6

KFDE6:
    lda    INTIM                 ; 4
    bne    KFDE6                 ; 2³
    ldy    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
    lda    #$19                  ; 2
    sta    TIM8T                 ; 4
    lda    #$33                  ; 2
    ldy    #$00                  ; 2
    ldx    ram_DA                ; 3
    bmi    KFE07                 ; 2³+1
    ldy    #$EA                  ; 2
    cpx    #$02                  ; 2
    bcs    KFE07                 ; 2³
    lda    KFF05,X               ; 4
KFE07:
    sta    ram_F1                ; 3
    sty    ram_DC                ; 3
    lda    #$33                  ; 2
    ldy    #$00                  ; 2
    ldx    ram_8B                ; 3
    bmi    KFE1C                 ; 2³
    ldy    #$42                  ; 2
    cpx    #$02                  ; 2
    bcs    KFE1C                 ; 2³
    lda    KFF05,X               ; 4
KFE1C:
    sta    ram_93                ; 3
    sty    ram_DE                ; 3
    ldy    #$00                  ; 2
    lda    ram_DB                ; 3
    bmi    KFE30                 ; 2³
    and    #$03                  ; 2
    tax                          ; 2
    ldy    #$94                  ; 2
    lda    KFF05,X               ; 4
    sta    ram_94                ; 3
KFE30:
    sty    ram_DF                ; 3
    lda    ram_AD                ; 3
    cmp    #$05                  ; 2
    bcs    KFE74                 ; 2³
    lda    ram_E4                ; 3
    bne    KFE74                 ; 2³
    lda    ram_B9                ; 3
    cmp    #$66                  ; 2
    bcc    KFE74                 ; 2³
    cmp    #$6C                  ; 2
    bcs    KFE74                 ; 2³
    lda    ram_C5                ; 3
    cmp    #$2F                  ; 2
    bcc    KFE74                 ; 2³
    cmp    #$36                  ; 2
    bcs    KFE74                 ; 2³
    lda    #$1C                  ; 2
    sta    ram_E3                ; 3
    lda    #$0F                  ; 2
    sta    ram_E4                ; 3
    lda    ram_DB                ; 3
    and    #$03                  ; 2
    cmp    #$02                  ; 2
    beq    KFE63                 ; 2³
    clc                          ; 2
    adc    #$01                  ; 2
KFE63:
    ora    #$78                  ; 2
    sta    ram_DB                ; 3
    inc    ram_DA                ; 5
    inc    ram_8B                ; 5
    ldx    ram_D9                ; 3
    cpx    #$0A                  ; 2
    bne    KFE74                 ; 2³
    jsr    KFC7A                 ; 6
KFE74:
    ldy    INTIM                 ; 4
    bne    KFE74                 ; 2³
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    ram_83                ; 3
    cmp    #$3C                  ; 2
    beq    KFE9D                 ; 2³
    cmp    #$5A                  ; 2
    bcs    KFE9D                 ; 2³
    ldx    ram_95                ; 3
    lda    ram_88                ; 3
    cmp    KFF0C,X               ; 4
    bcc    KFE9D                 ; 2³
    cmp    KFF0D,X               ; 4
    bcs    KFE9D                 ; 2³
    lda    ram_EF                ; 3
    bne    KFEA1                 ; 2³
    ldy    #$05                  ; 2
KFE9D:
    sty    ram_EF                ; 3
    sty    ram_BA                ; 3
KFEA1:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$01                  ; 2
    eor    ram_F2                ; 3
    asl                          ; 2
    asl                          ; 2
    eor    ram_F2                ; 3
    asl                          ; 2
    eor    ram_F3                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    ram_F3                ; 3
    eor    #$80                  ; 2
    asl                          ; 2
    rol    ram_F2                ; 5
    rol    ram_F3                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_8A                ; 3
    bne    KFEF7                 ; 2³
    ora    ram_97                ; 3
    ora    ram_E5                ; 3
    bne    KFEDD                 ; 2³
    lda    ram_AD                ; 3
    cmp    #$05                  ; 2
    bne    KFEDD                 ; 2³
    lda    ram_96                ; 3
    beq    KFEF7                 ; 2³
    ldy    ram_A8                ; 3
    beq    KFEF5                 ; 2³
    ldy    #$08                  ; 2
    ldx    #$16                  ; 2
    lda    #$04                  ; 2
    bne    KFEF1                 ; 3   always branch

KFEDD:
    lda    ram_E3                ; 3
    beq    KFEF7                 ; 2³
    dec    ram_E3                ; 5
    lda    #$01                  ; 2
    ldy    ram_E4                ; 3
    beq    KFEEF                 ; 2³
    ldx    ram_A8                ; 3
    beq    KFEEF                 ; 2³
    dec    ram_E4                ; 5
KFEEF:
    ldx    #$1F                  ; 2
KFEF1:
    stx    AUDF0                 ; 3
    sta    AUDC0                 ; 3
KFEF5:
    sty    AUDV0                 ; 3
KFEF7:
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$2A;9;28                  ; 2
    sta    TIM64T                ; 4
    rts                          ; 6

KFF03:
    .byte $06 ; |     XX | $FF03
KFF04:
    .byte $30 ; |  XX    | $FF04
KFF05:
    .byte $30 ; |  XX    | $FF05
    .byte $31 ; |  XX   X| $FF06
    .byte $33 ; |  XX  XX| $FF07
    .byte $03 ; |      XX| $FF08
    .byte $18 ; |   XX   | $FF09
    .byte $02 ; |      X | $FF0A
    .byte $10 ; |   X    | $FF0B
KFF0C:
    .byte $3E ; |  XXXXX | $FF0C
KFF0D:
    .byte $55 ; | X X X X| $FF0D
    .byte $00 ; |        | $FF0E
    .byte $00 ; |        | $FF0F
    .byte $00 ; |        | $FF10
    .byte $30 ; |  XX    | $FF11
    .byte $54 ; | X X X  | $FF12
    .byte $16 ; |   X XX | $FF13
    .byte $4C ; | X  XX  | $FF14
KFF15:
    .byte -1    ; $FF15  addition table
    .byte -1    ; $FF16
    .byte -1    ; $FF17
    .byte -1    ; $FF18
    .byte 0     ; $FF19
    .byte 1     ; $FF1A
    .byte 1     ; $FF1B
    .byte 1     ; $FF1C
    .byte 1     ; $FF1D
    .byte 1     ; $FF1E
    .byte 1     ; $FF1F
    .byte 1     ; $FF20
    .byte 0     ; $FF21
    .byte -1    ; $FF22
    .byte -1    ; $FF23
    .byte -1    ; $FF24
KFF25:
    .byte 1     ; $FF25  addition table
    .byte 1     ; $FF26
    .byte 0     ; $FF27
    .byte -1    ; $FF28
    .byte -1    ; $FF29
    .byte -1    ; $FF2A
    .byte 0     ; $FF2B
    .byte 1     ; $FF2C
    .byte 2     ; $FF2D
    .byte 2     ; $FF2E
    .byte 0     ; $FF2F
    .byte -2    ; $FF30
    .byte -2    ; $FF31
    .byte -2    ; $FF32
    .byte 0     ; $FF33
    .byte 2     ; $FF34
    .byte 3     ; $FF35
    .byte 3     ; $FF36
    .byte 0     ; $FF37
    .byte -3    ; $FF38
    .byte -3    ; $FF39
    .byte -3    ; $FF3A
    .byte 0     ; $FF3B
    .byte 3     ; $FF3C
    .byte 4     ; $FF3D
    .byte 4     ; $FF3E
    .byte 0     ; $FF3F
    .byte -4    ; $FF40
    .byte -4    ; $FF41
    .byte -4    ; $FF42
    .byte 0     ; $FF43
    .byte 4     ; $FF44
KFF45:
    .byte 2     ; $FF45  addition table
    .byte 2     ; $FF46
    .byte 2     ; $FF47
    .byte 2     ; $FF48
    .byte 0     ; $FF49
    .byte -2    ; $FF4A
    .byte -2    ; $FF4B
    .byte -2    ; $FF4C
    .byte -2    ; $FF4D
    .byte -2    ; $FF4E
    .byte -2    ; $FF4F
    .byte -2    ; $FF50
    .byte 0     ; $FF51
    .byte 2     ; $FF52
    .byte 2     ; $FF53
    .byte 2     ; $FF54
KFF55:
    .byte $70 ; | XXX    | $FF55
    .byte $60 ; | XX     | $FF56
    .byte $50 ; | X X    | $FF57
    .byte $38 ; |  XXX   | $FF58
    .byte $20 ; |  X     | $FF59
    .byte $18 ; |   XX   | $FF5A
    .byte $10 ; |   X    | $FF5B
    .byte $08 ; |    X   | $FF5C
KFF5D:
    .byte 0     ; $FF5D  addition table
    .byte 1     ; $FF5E
    .byte 1     ; $FF5F
    .byte 1     ; $FF60
    .byte 1     ; $FF61
    .byte 1     ; $FF62
    .byte 1     ; $FF63
    .byte 1     ; $FF64
    .byte 0     ; $FF65
    .byte -1    ; $FF66
    .byte -1    ; $FF67
    .byte -1    ; $FF68
    .byte -1    ; $FF69
    .byte -1    ; $FF6A
    .byte -1    ; $FF6B
    .byte -1    ; $FF6C
KFF6D:
    .byte 0     ; $FF6D  addition table
    .byte -1    ; $FF6E
    .byte -1    ; $FF6F
    .byte -1    ; $FF70
    .byte 0     ; $FF71
    .byte 1     ; $FF72
    .byte 1     ; $FF73
    .byte 1     ; $FF74
    .byte 0     ; $FF75
    .byte -2    ; $FF76
    .byte -2    ; $FF77
    .byte -2    ; $FF78
    .byte 0     ; $FF79
    .byte 2     ; $FF7A
    .byte 2     ; $FF7B
    .byte 2     ; $FF7C
    .byte 0     ; $FF7D
    .byte -3    ; $FF7E
    .byte -3    ; $FF7F
    .byte -3    ; $FF80
    .byte 0     ; $FF81
    .byte 3     ; $FF82
    .byte 3     ; $FF83
    .byte 3     ; $FF84
    .byte 0     ; $FF85
    .byte -4    ; $FF86
    .byte -4    ; $FF87
    .byte -4    ; $FF88
    .byte 0     ; $FF89
    .byte 4     ; $FF8A
    .byte 4     ; $FF8B
    .byte 4     ; $FF8C
KFF8D:
    .byte 1     ; $FF8D  addition table
    .byte -1    ; $FF8E
    .byte -1    ; $FF8F
    .byte -1    ; $FF90
    .byte -1    ; $FF91
    .byte -1    ; $FF92
    .byte -1    ; $FF93
    .byte -1    ; $FF94
    .byte 1     ; $FF95
    .byte 1     ; $FF96
    .byte 1     ; $FF97
    .byte 1     ; $FF98
    .byte 1     ; $FF99
    .byte 1     ; $FF9A
    .byte 1     ; $FF9B
    .byte 1     ; $FF9C
KFF9D:
    .byte $FF ; |XXXXXXXX| $FF9D  CMP table
    .byte $BF ; |X XXXXXX| $FF9E
    .byte $6F ; | XX XXXX| $FF9F
    .byte $5F ; | X XXXXX| $FFA0
    .byte $4F ; | X  XXXX| $FFA1
    .byte $3F ; |  XXXXXX| $FFA2
    .byte $3F ; |  XXXXXX| $FFA3
    .byte $2F ; |  X XXXX| $FFA4
    .byte $2F ; |  X XXXX| $FFA5
    .byte $2F ; |  X XXXX| $FFA6
KFFA7:
    .byte $04 ; |     X  | $FFA7  ram_D5
    .byte $0A ; |    X X | $FFA8
    .byte $14 ; |   X X  | $FFA9
    .byte $28 ; |  X X   | $FFAA
    .byte $32 ; |  XX  X | $FFAB
    .byte $3C ; |  XXXX  | $FFAC
    .byte $46 ; | X   XX | $FFAD
    .byte $50 ; | X X    | $FFAE
    .byte $5A ; | X XX X | $FFAF
    .byte $64 ; | XX  X  | $FFB0
KFFB1:
    .byte $32 ; |  XX  X | $FFB1
    .byte $19 ; |   XX  X| $FFB2
    .byte $5D ; | X XXX X| $FFB3
    .byte $19 ; |   XX  X| $FFB4
    .byte $32 ; |  XX  X | $FFB5
    .byte $4B ; | X  X XX| $FFB6
    .byte $1E ; |   XXXX | $FFB7
    .byte $26 ; |  X  XX | $FFB8
    .byte $30 ; |  XX    | $FFB9
    .byte $5D ; | X XXX X| $FFBA
    .byte $0A ; |    X X | $FFBB
    .byte $12 ; |   X  X | $FFBC
    .byte $1A ; |   XX X | $FFBD
    .byte $22 ; |  X   X | $FFBE
    .byte $2A ; |  X X X | $FFBF
    .byte $35 ; |  XX X X| $FFC0
    .byte $3D ; |  XXXX X| $FFC1
    .byte $45 ; | X   X X| $FFC2
    .byte $4D ; | X  XX X| $FFC3
    .byte $55 ; | X X X X| $FFC4
    .byte $5D ; | X XXX X| $FFC5
    .byte $0A ; |    X X | $FFC6
    .byte $16 ; |   X XX | $FFC7
    .byte $22 ; |  X   X | $FFC8
    .byte $2E ; |  X XXX | $FFC9
    .byte $3C ; |  XXXX  | $FFCA
    .byte $48 ; | X  X   | $FFCB
    .byte $5D ; | X XXX X| $FFCC
    .byte $0A ; |    X X | $FFCD
    .byte $13 ; |   X  XX| $FFCE
    .byte $2C ; |  X XX  | $FFCF
    .byte $35 ; |  XX X X| $FFD0
    .byte $3E ; |  XXXXX | $FFD1
    .byte $47 ; | X   XXX| $FFD2
    .byte $50 ; | X X    | $FFD3
    .byte $5D ; | X XXX X| $FFD4
KFFD5:
    .byte $09 ; |    X  X| $FFD5
    .byte $12 ; |   X  X | $FFD6
    .byte $1B ; |   XX XX| $FFD7
    .byte $24 ; |  X  X  | $FFD8
    .byte $2D ; |  X XX X| $FFD9
    .byte $36 ; |  XX XX | $FFDA
    .byte $3F ; |  XXXXXX| $FFDB
    .byte $48 ; | X  X   | $FFDC
    .byte $51 ; | X X   X| $FFDD
    .byte $5A ; | X XX X | $FFDE
KFFDF:
    .byte $5A   ; $FFDF  ram_B8, ram_B9
    .byte $3C   ; $FFE0
    .byte $96   ; $FFE1
    .byte $3C   ; $FFE2
    .byte $96   ; $FFE3
    .byte $64   ; $FFE4
    .byte $96   ; $FFE5
    .byte $3C   ; $FFE6
KFFE7:
    .byte $1E   ; $FFE7  ram_D8
    .byte $3C   ; $FFE8
    .byte $0A   ; $FFE9
    .byte $1E   ; $FFEA
    .byte $3C   ; $FFEB
    .byte $0A   ; $FFEC
    .byte $1E   ; $FFED
    .byte $0A   ; $FFEE
KFFEF:
    .byte $37   ; $FFEF  ram_AF
    .byte $87   ; $FFF0  ram_B0
    .byte $41   ; $FFF1  ram_B1
    .byte $55   ; $FFF2  ram_B2
    .byte $7D   ; $FFF3  ram_B3
    .byte $4B   ; $FFF4  ram_B4
    .byte $69   ; $FFF5  ram_B5
    .byte $5F   ; $FFF6  ram_B6
    .byte $73   ; $FFF7  ram_B7

       ORG $1FF8
      RORG $FFF8

    .byte $5F ; | X XXXXX| $FFF8
    .byte $73 ; | XXX  XX| $FFF9

KFFFA:
    .byte $22   ; $FFFA  ram_F5
    .byte $26   ; $FFFB

    .word START_0   ; reset
    .word KF088     ; break


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $F000

LF000:
    lda    BANK_0                ; 4

    brk                          ; 7

LF004:
    lda    BANK_0                ; 4

    jmp    LF5C9                 ; 3

LF00A:
    lda    BANK_0                ; 4

    lda    ram_AD                ; 3
    cmp    #$05                  ; 2
    bne    LF024                 ; 2³
    jsr    LF802                 ; 6
    lda    ram_9D                ; 3
    bmi    LF024                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
    sta    ram_D8                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    sta    ram_C4                ; 3
LF024:
    ldx    ram_F7                ; 3
    stx    COLUBK                ; 3
    ldy    #$02                  ; 2
    ldx    #$00                  ; 2
    jsr    LFE00                 ; 6
    ldy    #$0A                  ; 2
    inx                          ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    jsr    LFE00                 ; 6
    ldy    #$0A                  ; 2
    lda    ram_A8                ; 3
    bne    LF041                 ; 2³
    ldy    ram_D6                ; 3
LF041:
    inx                          ; 2
    jsr    LFE00                 ; 6
    ldy    ram_B9                ; 3
    iny                          ; 2
    iny                          ; 2
    lda    ram_A8                ; 3
    bne    LF04F                 ; 2³
    ldy    ram_D7                ; 3
LF04F:
    inx                          ; 2
    jsr    LFE00                 ; 6
    ldy    #$34                  ; 2
    inx                          ; 2
    jsr    LFE00                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF05D:
    lda    INTIM                 ; 4
    bne    LF05D                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    ldx    #$03                  ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    ldy    ram_BA                ; 3
    bmi    LF076                 ; 2³
    ldy    ram_8C                ; 3
    cpy    #$3D                  ; 2
    bne    LF07A                 ; 2³
LF076:
    ldx    #$00                  ; 2
    stx    GRP0                  ; 3
LF07A:
    lda    #$09                  ; 2
    sta    ram_8E                ; 3
    lda    ram_F5                ; 3
    sta    COLUPF                ; 3
    lda    ram_C5                ; 3
    bmi    LF090                 ; 2³
    lda    ram_E4                ; 3
    and    #$0F                  ; 2
    beq    LF090                 ; 2³
    lda    #$94                  ; 2
    sta    ram_AE                ; 3
LF090:
    lda    ram_D2                ; 3
    sta    ram_F8                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    ldy    ram_D1                ; 3
    beq    LF0C2                 ; 2³
    lda    ram_B8                ; 3
    sec                          ; 2
    sbc    #$04                  ; 2
    sta    ram_B8                ; 3
    sta    ram_AE                ; 3
    bne    LF0B6                 ; 2³
    lda    ram_D1                ; 3
    sec                          ; 2
    sbc    #$02                  ; 2
    bpl    LF0B0                 ; 2³
    lda    #$00                  ; 2
LF0B0:
    sta    ram_D1                ; 3
    lda    #$20                  ; 2
    sta    ram_B8                ; 3
LF0B6:
    ldx    #$05                  ; 2
    ldy    ram_E4                ; 3
    beq    LF0BE                 ; 2³
    ldx    #$0C                  ; 2
LF0BE:
    ldy    ram_D1                ; 3
    bpl    LF10E                 ; 2³+1
LF0C2:
    ldx    ram_E2                ; 3
    beq    LF0D1                 ; 2³
    dec    ram_E2                ; 5
    lda    LFDCE-1,X             ; 4
    ldx    #$0C                  ; 2
LF0CD:
    ldy    #$0F                  ; 2
    bne    LF10E                 ; 3+1   always branch

LF0D1:
    lda    ram_8A                ; 3
    beq    LF0D9                 ; 2³
    ldx    #$08                  ; 2
    bne    LF0CD                 ; 3   always branch

LF0D9:
    lda    ram_EF                ; 3
    beq    LF0F1                 ; 2³
    dec    ram_EF                ; 5
    bne    LF114                 ; 2³+1
    lda    #$05                  ; 2
    sta    ram_EF                ; 3
    ldy    #$00                  ; 2
    ldx    ram_A8                ; 3
    beq    LF0ED                 ; 2³
    ldy    #$0D                  ; 2
LF0ED:
    ldx    #$04                  ; 2
    bne    LF10E                 ; 3+1   always branch

LF0F1:
    lda    ram_E6                ; 3
    beq    LF112                 ; 2³+1
    dec    ram_C6                ; 5
    bne    LF114                 ; 2³+1
    lda    #$01                  ; 2
    ldx    #$04                  ; 2
    ldy    ram_E6                ; 3
    bmi    LF105                 ; 2³
    lda    #$01                  ; 2
    ldx    #$0C                  ; 2
LF105:
    sta    ram_C6                ; 3
    ldy    ram_A8                ; 3
    lda    LFFFA,Y               ; 4
    ldy    #$05                  ; 2
LF10E:
    sta    AUDF1                 ; 3
    stx    AUDC1                 ; 3
LF112:
    sty    AUDV1                 ; 3
LF114:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$09                  ; 2
    sty    ram_80                ; 3
    jmp    LFCB6                 ; 3

LF123:
    ldx    #$00                  ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    VDELP1                ; 3
    stx    VDELP0                ; 3
    lda    ram_BA                ; 3
    bpl    LF134                 ; 2³
    jmp    LF92A                 ; 3

LF134:
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    bne    LF146                 ; 2³
    lda    ram_92                ; 3
    beq    LF143                 ; 2³
    lsr                          ; 2
    sta    ram_F7                ; 3
    dec    ram_92                ; 5
LF143:
    jmp    LF96A                 ; 3

LF146:
    ldy    ram_AC                ; 3
    jsr    LFE00                 ; 6
    lda    #$15                  ; 2
    sta    CTRLPF                ; 3
    lda    ram_F5                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    ldy    ram_B9                ; 3
    inx                          ; 2
    lda    ram_DC                ; 3
    sta    COLUP0                ; 3
    lda    ram_F1                ; 3
    sta    NUSIZ0                ; 3
    lda    #$00                  ; 2
    sta    NUSIZ1                ; 3
    jsr    LFE12                 ; 6
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    ldx    #$64                  ; 2
    lda    ram_A8                ; 3
    beq    LF178                 ; 2³
    jmp    LF26B                 ; 3

LF178:
    sta    NUSIZ0                ; 3
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    stx    ram_81                ; 3
LF180:
    lda    ram_81                ; 3
    ldx    ram_F8                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bmi    LF1C1                 ; 2³
    cmp    ram_BB,X              ; 4
    bne    LF1C1                 ; 2³
    ldy    ram_AF,X              ; 4
    ldx    #$01                  ; 2
    dec    ram_81                ; 5
    dec    ram_81                ; 5
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    jsr    LFE12                 ; 6
    ldx    ram_F8                ; 3
    lda    ram_C7,X              ; 4
    sta    ram_AA                ; 3
    ldy    ram_F0                ; 3
    cmp    #$C9                  ; 2
    bcs    LF1AB                 ; 2³
    ldy    #$2C                  ; 2
LF1AB:
    sty    COLUP1                ; 3
    dec    ram_F8                ; 5
    ldy    #$03                  ; 2
LF1B1:
    lda    (ram_AA),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    jsr    LF1CB                 ; 6
    dec    ram_81                ; 5
    dey                          ; 2
    bpl    LF1B1                 ; 2³
    bmi    LF1C4                 ; 3   always branch

LF1C1:
    jsr    LF1CB                 ; 6
LF1C4:
    dec    ram_81                ; 5
    bpl    LF180                 ; 2³
    jmp    LF3B6                 ; 3

LF1CB:
    ldx    #$00                  ; 2
    lda    ram_81                ; 3
    cmp    ram_E7                ; 3
    bne    LF1D5                 ; 2³
    ldx    #$02                  ; 2
LF1D5:
    stx    ENAM0                 ; 3
    ldx    #$00                  ; 2
    cmp    ram_E8                ; 3
    bne    LF1DF                 ; 2³
    ldx    #$02                  ; 2
LF1DF:
    stx    ENAM1                 ; 3
    rts                          ; 6

LF1E2:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    cmp    #$0D                  ; 2   straight down?
    bne    LF1FC                 ; 2³  - no, branch
    cmp    joySaveState          ; 3   debouncer...
    bne    LF1F6                 ; 2³  - different
    lda    #$FF                  ; 2   - no change
    bne    LF1FC                 ; 3   always branch

LF1F6:
    ldy    joySaveState          ; 3
    cpy    #$FF                  ; 2   anything pressed?
    beq    LF1FE                 ; 2³  - no
LF1FC:
    sta    joySaveState          ; 3
LF1FE:
    lda    ram_E4                ; 3
    bmi    LF230                 ; 2³
    ldy    ram_DB                ; 3
    bmi    LF240                 ; 2³
    
;3) warp drive
    
;    ldy    INPT4                 ; 3
    LDY    INPT1
    
    bmi    LF240                 ; 2³
;    cpx    #$0D                  ; 2
;    bne    LF240                 ; 2³
    ldy    #$FF                  ; 2
    sty    ram_E6                ; 3
    ldx    ram_92                ; 3
    bne    LF22C                 ; 2³
    ldx    ram_9A                ; 3
    bne    LF22C                 ; 2³
    ldy    #$3C                  ; 2
    sty    ram_83                ; 3
    sty    ram_85                ; 3
    ldy    #$00                  ; 2
    sty    ram_88                ; 3
    sty    ram_91                ; 3
    sty    ram_95                ; 3
    ldy    #$0F                  ; 2
    sty    ram_87                ; 3
LF22C:
    ora    #$80                  ; 2
    bne    LF23E                 ; 3   always branch
    
    NOP  ; free byte
    NOP  ; free byte  2
    NOP  ; free byte
    NOP  ; free byte  4

LF230:
    ldy    ram_DB                ; 3
    bmi    LF238                 ; 2³
    
;4) supress phasers during warp
    
    LDY    INPT1
 ;   ldy    INPT4                 ; 3
    bpl    LF240                 ; 2³
LF238:
    ldy    #$00                  ; 2
    sty    ram_E6                ; 3
    and    #$01                  ; 2
LF23E:
    sta    ram_E4                ; 3
LF240:
    rts                          ; 6

LF241:
    ldx    #$00                  ; 2
    stx    ENABL                 ; 3
    stx    ram_E6                ; 3
    lda    #$3C                  ; 2
    sta    ram_83                ; 3
    ldy    #$45                  ; 2
    jsr    LFE00                 ; 6
    inx                          ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    ldy    #$4D                  ; 2
    jsr    LFE00                 ; 6
    inx                          ; 2
    ldy    #$5C                  ; 2
    jsr    LFE12                 ; 6
    rts                          ; 6

LF261:
    .byte $40 ; | X      | $F261  ram_9C
    .byte $40 ; | X      | $F262
    .byte $30 ; |  XX    | $F263
    .byte $28 ; |  X X   | $F264
    .byte $20 ; |  X     | $F265
    .byte $18 ; |   XX   | $F266
    .byte $10 ; |   X    | $F267
    .byte $08 ; |    X   | $F268
    .byte $04 ; |     X  | $F269
    .byte $02 ; |      X | $F26A

LF26B:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_C4                ; 3
    beq    LF281                 ; 2³
    cpx    ram_C5                ; 3
    beq    LF285                 ; 2³
    cpx    ram_82                ; 3
    beq    LF27D                 ; 2³
    cpx    ram_D8                ; 3
    bne    LF28D                 ; 2³
LF27D:
    lda    #$00                  ; 2
    beq    LF28B                 ; 3   always branch

LF281:
    ldy    ram_F4                ; 3
    bne    LF287                 ; 2³
LF285:
    ldy    ram_AE                ; 3
LF287:
    sty    COLUP1                ; 3
    lda    #$E0                  ; 2
LF28B:
    sta    GRP1                  ; 3
LF28D:
    lda    #$00                  ; 2
    cpx    ram_9D                ; 3
    bne    LF299                 ; 2³
    ldy    #$0F                  ; 2
    sty    COLUP1                ; 3
    lda    #$02                  ; 2
LF299:
    sta    ENAM1                 ; 3
    lda    #$00                  ; 2
    cpx    #$3B                  ; 2
    bcs    LF2A3                 ; 2³
    lda    #$02                  ; 2
LF2A3:
    sta    ENAM0                 ; 3
    dex                          ; 2
    cpx    #$36                  ; 2
    bne    LF26B                 ; 2³
    lda    #$00                  ; 2
    sta    NUSIZ0                ; 3
    sta    ENAM0                 ; 3
    ldy    ram_DD                ; 3
    sty    COLUP0                ; 3
LF2B4:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    ldy    #$00                  ; 2
    cpx    ram_9D                ; 3
    bne    LF2C4                 ; 2³
    ldy    #$0F                  ; 2
    sty    COLUP1                ; 3
    ldy    #$02                  ; 2
LF2C4:
    sty    ENAM1                 ; 3
    cpx    ram_C4                ; 3
    beq    LF2D8                 ; 2³
    cpx    ram_C5                ; 3
    beq    LF2DC                 ; 2³
    cpx    ram_D8                ; 3
    beq    LF2E4                 ; 2³
    cpx    ram_82                ; 3
    beq    LF2E4                 ; 2³
    bne    LF2E8                 ; 3   always branch

LF2D8:
    ldy    ram_F4                ; 3
    bne    LF2DE                 ; 2³
LF2DC:
    ldy    ram_AE                ; 3
LF2DE:
    sty    COLUP1                ; 3
    lda    #$E0                  ; 2
    bne    LF2E6                 ; 3   always branch

LF2E4:
    lda    #$00                  ; 2
LF2E6:
    sta    GRP1                  ; 3
LF2E8:
    ldy    ram_8E                ; 3
    lda    (ram_8C),Y            ; 5
    dec    ram_8E                ; 5
    dec    ram_80                ; 5
    dex                          ; 2
    cpx    #$2B                  ; 2
    bne    LF2B4                 ; 2³
LF2F5:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    cpx    ram_9D                ; 3
    bne    LF303                 ; 2³+1
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    lda    #$02                  ; 2
LF303:
    sta    ENAM1                 ; 3
    cpx    ram_C4                ; 3
    beq    LF323                 ; 2³
    cpx    ram_C5                ; 3
    beq    LF327                 ; 2³
    cpx    ram_82                ; 3
    beq    LF31F                 ; 2³
    cpx    ram_D8                ; 3
    beq    LF31F                 ; 2³
    lda    ram_DE                ; 3
    sta    COLUP0                ; 3
    lda    ram_93                ; 3
    sta    NUSIZ0                ; 3
    bne    LF32F                 ; 2³
LF31F:
    lda    #$00                  ; 2
    beq    LF32D                 ; 3   always branch

LF323:
    ldy    ram_F4                ; 3
    bne    LF329                 ; 2³
LF327:
    ldy    ram_AE                ; 3
LF329:
    sty    COLUP1                ; 3
    lda    #$E0                  ; 2
LF32D:
    sta    GRP1                  ; 3
LF32F:
    dex                          ; 2
    cpx    #$24                  ; 2
    bne    LF2F5                 ; 2³+1
    lda    #$02                  ; 2
    sta    ENAM0                 ; 3
LF338:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    cpx    ram_9D                ; 3
    bne    LF346                 ; 2³
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    lda    #$02                  ; 2
LF346:
    sta    ENAM1                 ; 3
    cpx    ram_C4                ; 3
    beq    LF35C                 ; 2³
    cpx    ram_C5                ; 3
    beq    LF360                 ; 2³
    cpx    ram_82                ; 3
    beq    LF358                 ; 2³
    cpx    ram_D8                ; 3
    bne    LF368                 ; 2³
LF358:
    lda    #$00                  ; 2
    beq    LF366                 ; 3   always branch

LF35C:
    ldy    ram_F4                ; 3
    bne    LF362                 ; 2³
LF360:
    ldy    ram_AE                ; 3
LF362:
    sty    COLUP1                ; 3
    lda    #$E0                  ; 2
LF366:
    sta    GRP1                  ; 3
LF368:
    dex                          ; 2
    cpx    #$1E                  ; 2
    bne    LF338                 ; 2³
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    ldy    ram_94                ; 3
    sty    NUSIZ0                ; 3
    ldy    ram_DF                ; 3
    sty    COLUP0                ; 3
LF379:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    ram_C4                ; 3
    beq    LF38F                 ; 2³
    cpx    ram_C5                ; 3
    beq    LF393                 ; 2³
    cpx    ram_82                ; 3
    beq    LF38B                 ; 2³
    cpx    ram_D8                ; 3
    bne    LF39B                 ; 2³
LF38B:
    lda    #$00                  ; 2
    beq    LF399                 ; 3   always branch

LF38F:
    ldy    ram_F4                ; 3
    bne    LF395                 ; 2³
LF393:
    ldy    ram_AE                ; 3
LF395:
    sty    COLUP1                ; 3
    lda    #$E0                  ; 2
LF399:
    sta    GRP1                  ; 3
LF39B:
    lda    #$00                  ; 2
    cpx    ram_9D                ; 3
    bne    LF3A7                 ; 2³
    lda    #$0F                  ; 2
    sta    COLUP1                ; 3
    lda    #$02                  ; 2
LF3A7:
    sta    ENAM1                 ; 3
    lda    #$00                  ; 2
    cpx    #$0D                  ; 2
    bne    LF3B1                 ; 2³
    lda    #$02                  ; 2
LF3B1:
    sta    ENAM0                 ; 3
    dex                          ; 2
    bpl    LF379                 ; 2³
LF3B6:
    lda    ram_F5                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    sta    COLUBK                ; 3
    ldx    #$04                  ; 2
    ldy    #$52                  ; 2
    jsr    LFE12                 ; 6
    lda    ram_92                ; 3
    tay                          ; 2
    adc    #$90                  ; 2
    sta    COLUBK                ; 3
    cpy    #$B0                  ; 2
    bcc    LF3DA                 ; 2³
    beq    LF3D6                 ; 2³
    dec    ram_92                ; 5
    bne    LF3DA                 ; 2³
LF3D6:
    lda    #$00                  ; 2
    sta    ram_92                ; 3
LF3DA:
    stx    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$05                  ; 2
    sta    CTRLPF                ; 3
    ldx    ram_95                ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    lda    ram_87                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    ram_88                ; 3
    ldx    #$00                  ; 2
    jsr    LFE26                 ; 6
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    ldy    ram_89                ; 3
    inx                          ; 2
    jsr    LFE26                 ; 6
    ldy    ram_98                ; 3
    inx                          ; 2
    jsr    LFE26                 ; 6
    ldy    ram_99                ; 3
    inx                          ; 2
    jsr    LFE26                 ; 6
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    lda    ram_95                ; 3
    beq    LF49A                 ; 2³
    cmp    #$05                  ; 2
    bne    LF424                 ; 2³
    jmp    LF4F2                 ; 3

LF424:
    ldx    #$13                  ; 2
    ldy    #$09                  ; 2
LF428:
    lda    (ram_83),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_85),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$00                  ; 2
    cpx    ram_9B                ; 3
    bcc    LF440                 ; 2³
    cpx    ram_9A                ; 3
    bcs    LF444                 ; 2³
    lda    #$02                  ; 2
LF440:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
LF444:
    lda    ram_92                ; 3
    bne    LF465                 ; 2³
    lda    ram_87                ; 3
    cmp    #$42                  ; 2
    beq    LF45A                 ; 2³
    bcs    LF455                 ; 2³
    lda    LFF77,Y               ; 4
    bne    LF45F                 ; 3   always branch

LF455:
    lda    LFF6D,Y               ; 4
    bne    LF45F                 ; 3   always branch

LF45A:
    lda    LFF63,Y               ; 4
    dec    ram_80                ; 5
LF45F:
    dec    ram_80                ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF465:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    cpx    #$10                  ; 2
    bne    LF471                 ; 2³
    lda    #$70                  ; 2
LF471:
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LF478                 ; 2³
    ldy    #$00                  ; 2
LF478:
    lda    #$00                  ; 2
    cpx    #$11                  ; 2
    beq    LF482                 ; 2³
    cpx    #$09                  ; 2
    bne    LF484                 ; 2³
LF482:
    sta    ENABL                 ; 3
LF484:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    PF2                   ; 3
    lda    #$02                  ; 2
    cpx    #$0F                  ; 2
    bne    LF494                 ; 2³
    sta    ENABL                 ; 3
LF494:
    dex                          ; 2
    bpl    LF428                 ; 2³
    jmp    LF568                 ; 3

LF49A:
    ldy    #$0B                  ; 2
LF49C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    cpy    #$00                  ; 2
    beq    LF4AC                 ; 2³
    cpy    #$01                  ; 2
    bne    LF4AE                 ; 2³
    lda    #$70                  ; 2
LF4AC:
    sta    PF2                   ; 3
LF4AE:
    cpy    #$04                  ; 2
    bne    LF4B6                 ; 2³
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
LF4B6:
    dey                          ; 2
    bpl    LF49C                 ; 2³
    ldy    #$09                  ; 2
    ldx    #$2F                  ; 2
LF4BD:
    lda    (ram_83),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_85),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$00                  ; 2
    cpx    ram_9B                ; 3
    bcc    LF4D5                 ; 2³
    cpx    ram_9A                ; 3
    bcs    LF4D9                 ; 2³
    lda    #$02                  ; 2
LF4D5:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
LF4D9:
    lda    #$02                  ; 2
    cpx    #$2D                  ; 2
    beq    LF4E5                 ; 2³
    cpx    #$1C                  ; 2
    bne    LF4E7                 ; 2³
    lda    #$00                  ; 2
LF4E5:
    sta    ENABL                 ; 3
LF4E7:
    dey                          ; 2
    bpl    LF4EC                 ; 2³
    ldy    #$00                  ; 2
LF4EC:
    dex                          ; 2
    bpl    LF4BD                 ; 2³
    jmp    LF568                 ; 3

LF4F2:
    ldx    #$03                  ; 2
LF4F4:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    bpl    LF4F4                 ; 2³
    ldy    #$09                  ; 2
    ldx    #$1B                  ; 2
LF4FF:
    lda    (ram_83),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_85),Y            ; 5
    sta    GRP1                  ; 3
    cpx    #$18                  ; 2
    bne    LF513                 ; 2³
    lda    #$70                  ; 2
    sta    PF2                   ; 3
LF513:
    cpx    #$16                  ; 2
    bne    LF51B                 ; 2³
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
LF51B:
    lda    #$00                  ; 2
    cpx    ram_9B                ; 3
    bcc    LF527                 ; 2³
    cpx    ram_9A                ; 3
    bcs    LF52B                 ; 2³
    lda    #$02                  ; 2
LF527:
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
LF52B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LF538                 ; 2³
    ldy    #$00                  ; 2
LF538:
    lda    #$00                  ; 2
    cpx    #$1A                  ; 2
    beq    LF542                 ; 2³
    cpx    #$0E                  ; 2
    bne    LF544                 ; 2³
LF542:
    sta    ENABL                 ; 3
LF544:
    lda    ram_92                ; 3
    bne    LF565                 ; 2³
    lda    ram_87                ; 3
    cmp    #$42                  ; 2
    beq    LF55A                 ; 2³
    bcs    LF555                 ; 2³
    lda    LFF77,Y               ; 4
    bne    LF55F                 ; 3   always branch

LF555:
    lda    LFF6D,Y               ; 4
    bne    LF55F                 ; 3   always branch

LF55A:
    lda    LFF63,Y               ; 4
    dec    ram_80                ; 5
LF55F:
    dec    ram_80                ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF565:
    dex                          ; 2
    bpl    LF4FF                 ; 2³+1
LF568:
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_F5                ; 3
    sta    COLUBK                ; 3
    lda    #$0F                  ; 2
    sta    ram_DD                ; 3
LF578:
    lda    ram_A8                ; 3
    eor    #$01                  ; 2
    and    #$01                  ; 2
    sta    ram_A8                ; 3
    lda    #$23;21                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF5A2                 ; 2³
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    LF5A2                 ; 2³
    lda    #$3D                  ; 2
    sta    ram_8C                ; 3
    lda    #$3F                  ; 2
    sta    ram_F9                ; 3
    lda    #$00                  ; 2
    sta    ram_BA                ; 3
    lda    #$11                  ; 2
    sta    ram_F6                ; 3
LF5A2:
    jsr    LF75E                 ; 6
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    LF5B4                 ; 2³
    lda    ram_AD                ; 3
    cmp    #$02                  ; 2
    beq    LF5B7                 ; 2³
    jsr    LF1E2                 ; 6
LF5B4:
    jmp    LF00A                 ; 3

LF5B7:
    lda    ram_AC                ; 3
    cmp    #$33                  ; 2
    bcs    LF5C3                 ; 2³
    lda    #$9A                  ; 2
    sta    ram_AC                ; 3
    bne    LF5B4                 ; 3   always branch

LF5C3:
    jsr    LF654                 ; 6
    jmp    LF004                 ; 3

LF5C9:
    lda    ram_83                ; 3
    cmp    #$00                  ; 2
    bne    LF5E5                 ; 2³
    ldx    #$96                  ; 2
    ldy    #$A0                  ; 2
    lda    ram_C7                ; 3
    cmp    #$C4                  ; 2
    bne    LF5E1                 ; 2³
    lda    #$20                  ; 2
    sta    ram_87                ; 3
    ldx    #$AA                  ; 2
    ldy    #$B4                  ; 2
LF5E1:
    stx    ram_83                ; 3
    sty    ram_85                ; 3
LF5E5:
    lda    ram_AC                ; 3
    cmp    #$67                  ; 2
    beq    LF60B                 ; 2³+1
    ldx    #$28                  ; 2
    stx    ram_8C                ; 3
    ldx    #$04                  ; 2
    stx    ram_E6                ; 3
    stx    ram_8F                ; 3
    stx    ram_91                ; 3
    ldy    #$00                  ; 2
    sty    ram_92                ; 3
    cmp    #$34                  ; 2
    bcc    LF603                 ; 2³+1
    dec    ram_AC                ; 5
    bne    LF651                 ; 2³
LF603:
    dec    ram_AC                ; 5
    lda    #$FF                  ; 2
    sta    ram_C5                ; 3
    bne    LF651                 ; 2³
LF60B:
    ldx    ram_D2                ; 3
    bmi    LF625                 ; 2³
    lda    ram_C5                ; 3
    bmi    LF621                 ; 2³
    lda    ram_E3                ; 3
    beq    LF644                 ; 2³
    cmp    #$01                  ; 2
    beq    LF621                 ; 2³
    cpx    #$08                  ; 2
    beq    LF644                 ; 2³
    bne    LF651                 ; 3   always branch

LF621:
    cpx    #$08                  ; 2
    beq    LF629                 ; 2³
LF625:
    dec    ram_AC                ; 5
    bne    LF651                 ; 2³
LF629:
    lda    ram_F3                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFFA1,X               ; 4
    sta    ram_B9                ; 3
    lda    LFFA5,X               ; 4
    sta    ram_82                ; 3
    adc    #$04                  ; 2
    sta    ram_C5                ; 3
    lda    #$E6                  ; 2
    sta    ram_AE                ; 3
    lda    #$00                  ; 2
    sta    ram_E4                ; 3
LF644:
    jsr    LF6BA                 ; 6
    lda    ram_91                ; 3
    bne    LF651                 ; 2³
    dec    ram_9C                ; 5
    bne    LF651                 ; 2³
    dec    ram_AC                ; 5
LF651:
    jmp    LF024                 ; 3

LF654:
    dec    ram_91                ; 5
    bpl    LF6B2                 ; 2³
    lda    #$05                  ; 2
    sta    ram_91                ; 3
    lda    SWCHA                 ; 4
    and    #$80                  ; 2  check right
    bne    LF66D                 ; 2³ - no
    dec    ram_8F                ; 5
    bpl    LF680                 ; 2³
    lda    #$0F                  ; 2
    sta    ram_8F                ; 3
    bne    LF680                 ; 3   always branch

LF66D:
    lda    SWCHA                 ; 4  check left
    and    #$40                  ; 2  - no
    bne    LF680                 ; 2³
    inc    ram_8F                ; 5
    lda    ram_8F                ; 3
    cmp    #$10                  ; 2
    bcc    LF680                 ; 2³
    lda    #$00                  ; 2
    sta    ram_8F                ; 3
LF680:
    lda    ram_C5                ; 3
    bmi    LF6B2                 ; 2³
    ldx    ram_8F                ; 3
    lda    ram_82                ; 3
    clc                          ; 2
    adc    LFCDD,X               ; 4
    cmp    #$01                  ; 2
    bcs    LF692                 ; 2³
    lda    #$01                  ; 2
LF692:
    cmp    #$61                  ; 2
    bcc    LF698                 ; 2³
    lda    #$60                  ; 2
LF698:
    sta    ram_82                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_C5                ; 3
    lda    ram_B9                ; 3
    adc    LFCCD,X               ; 4
    cmp    #$9C                  ; 2
    bcc    LF6AA                 ; 2³
    lda    #$9B                  ; 2
LF6AA:
    cmp    #$35                  ; 2
    bcs    LF6B0                 ; 2³
    lda    #$35                  ; 2
LF6B0:
    sta    ram_B9                ; 3
LF6B2:
    ldx    ram_8F                ; 3
    lda    LFFB3,X               ; 4
    sta    ram_8C                ; 3
    rts                          ; 6

LF6BA:
    dec    ram_E9                ; 5
    lda    ram_E9                ; 3
    bne    LF733                 ; 2³+1
    ldy    ram_AD                ; 3
    ldx    ram_E0                ; 3
    lda    LFFA9,X               ; 4
    sta    ram_E9                ; 3
    ldx    ram_D2                ; 3
LF6CB:
    ldy    ram_8F                ; 3
    lda    ram_BB,X              ; 4
    clc                          ; 2
    adc    LFF91,Y               ; 4
    cmp    #$07                  ; 2
    bcs    LF6D9                 ; 2³
    adc    #$5E                  ; 2
LF6D9:
    cmp    #$65                  ; 2
    bcc    LF6DF                 ; 2³
    sbc    #$5E                  ; 2
LF6DF:
    sta    ram_BB,X              ; 4
    lda    ram_E0                ; 3
    ror                          ; 2
    bcc    LF6EE                 ; 2³
    lda    ram_AF,X              ; 4
    clc                          ; 2
    adc    LFDBE,Y               ; 4
    bne    LF6F3                 ; 2³
LF6EE:
    lda    ram_AF,X              ; 4
    adc    LFF81,Y               ; 4
LF6F3:
    cmp    #$9C                  ; 2
    bcc    LF6F9                 ; 2³
    sbc    #$66                  ; 2
LF6F9:
    cmp    #$36                  ; 2
    bcs    LF6FF                 ; 2³
    adc    #$66                  ; 2
LF6FF:
    sta    ram_AF,X              ; 4
    dex                          ; 2
    bpl    LF6CB                 ; 2³+1
    ldx    ram_D2                ; 3
    beq    LF733                 ; 2³
    lda    ram_BB                ; 3
    cmp    ram_BC                ; 3
    bcc    LF734                 ; 2³
    sta    ram_D5                ; 3
    lda    ram_AF                ; 3
    adc    #$0A                  ; 2
    cmp    #$9C                  ; 2
    bcc    LF71A                 ; 2³
    sbc    #$66                  ; 2
LF71A:
    sta    ram_D4                ; 3
    ldx    #$00                  ; 2
LF71E:
    lda    ram_BC,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_B0,X              ; 4
    sta    ram_AF,X              ; 4
    inx                          ; 2
    cpx    ram_D2                ; 3
    bne    LF71E                 ; 2³
    lda    ram_D5                ; 3
    sta    ram_BB,X              ; 4
    lda    ram_D4                ; 3
    sta    ram_AF,X              ; 4
LF733:
    rts                          ; 6

LF734:
    lda    ram_BA,X              ; 4
    cmp    ram_BB,X              ; 4
    bcc    LF75D                 ; 2³
    lda    ram_BB,X              ; 4
    sta    ram_D5                ; 3
    lda    ram_AF,X              ; 4
    adc    #$0A                  ; 2
    cmp    #$9C                  ; 2
    bcc    LF748                 ; 2³
    sbc    #$66                  ; 2
LF748:
    sta    ram_D4                ; 3
LF74A:
    lda    ram_BA,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_AE,X              ; 4
    sta    ram_AF,X              ; 4
    dex                          ; 2
    bne    LF74A                 ; 2³
    lda    ram_D5                ; 3
    sta    ram_BB                ; 3
    lda    ram_D4                ; 3
    sta    ram_AF                ; 3
LF75D:
    rts                          ; 6

LF75E:
    ldx    ram_8A                ; 3
    beq    LF76C                 ; 2³
    dec    ram_8A                ; 5
    lda    #$08                  ; 2
    ldx    #$1F                  ; 2
    ldy    #$0F                  ; 2
    bne    LF79D                 ; 3   always branch

LF76C:
    lda    ram_E3                ; 3
    bne    LF7A5                 ; 2³
    ldx    ram_E5                ; 3
    beq    LF78D                 ; 2³
    dec    ram_C6                ; 5
    bne    LF780                 ; 2³
    lda    #$05                  ; 2
    sta    ram_C6                ; 3
    dec    ram_E5                ; 5
    beq    LF7FF                 ; 2³
LF780:
    ldx    ram_E5                ; 3
    ldy    LFDE2-1,X             ; 4
    ldx    ram_C6                ; 3
    lda    LFAD1,X               ; 4
    tax                          ; 2
    bpl    LF79B                 ; 2³
LF78D:
    ldx    ram_97                ; 3
    beq    LF79F                 ; 2³
    inc    ram_97                ; 5
    cpx    #$0F                  ; 2
    bne    LF799                 ; 2³
    sta    ram_97                ; 3
LF799:
    ldy    #$0A                  ; 2
LF79B:
    lda    #$0C                  ; 2
LF79D:
    bne    LF7FB                 ; 3   always branch

LF79F:
    ldy    ram_F6                ; 3
    beq    LF7C1                 ; 2³
    dec    ram_C6                ; 5
LF7A5:
    bne    LF801                 ; 2³+1
    lda    LFAEE,Y               ; 4
    sta    ram_C6                ; 3
    ldx    LFADF-1,Y             ; 4
    dec    ram_F6                ; 5
    ldy    #$0C                  ; 2
    lda    ram_F6                ; 3
    cmp    #$08                  ; 2
    bcc    LF7F9                 ; 2³
    bne    LF79B                 ; 2³
    lda    #$00                  ; 2
    sta    ram_F6                ; 3
    beq    LF79B                 ; 3   always branch

LF7C1:
    ldx    ram_EE                ; 3
    beq    LF7DB                 ; 2³
    dec    ram_C6                ; 5
    bne    LF7FF                 ; 2³
    lda    #$06                  ; 2
    sta    ram_C6                ; 3
    dec    ram_EE                ; 5
    cpx    #$0C                  ; 2
    bcs    LF7D7                 ; 2³
    lda    #$1F                  ; 2
    sta    ram_EE                ; 3
LF7D7:
    ldy    #$0F                  ; 2
    bne    LF79B                 ; 3   always branch

LF7DB:
    lda    ram_DA                ; 3
    bpl    LF7FF                 ; 2³
    lda    ram_AC                ; 3
    cmp    #$67                  ; 2
    bne    LF7FF                 ; 2³
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    LF7FF                 ; 2³
    dec    ram_D3                ; 5
    ldx    ram_D3                ; 3
    cpx    #$09                  ; 2
    bcs    LF7F7                 ; 2³
    lda    #$20                  ; 2
    sta    ram_D3                ; 3
LF7F7:
    ldy    #$05                  ; 2
LF7F9:
    lda    #$04                  ; 2
LF7FB:
    stx    AUDF0                 ; 3
    sta    AUDC0                 ; 3
LF7FF:
    sty    AUDV0                 ; 3
LF801:
    rts                          ; 6

LF802:
    ldx    ram_D2                ; 3
    cpx    #$08                  ; 2
    beq    LF81D                 ; 2³
    lda    ram_8C                ; 3
    cmp    #$3D                  ; 2
    beq    LF81D                 ; 2³
    lda    ram_9D                ; 3
    bmi    LF81D                 ; 2³
    ldy    ram_9C                ; 3
    bne    LF819                 ; 2³
    jmp    LF8F4                 ; 3

LF819:
    dec    ram_9C                ; 5
    beq    LF81E                 ; 2³
LF81D:
    rts                          ; 6

LF81E:
    inx                          ; 2
    stx    ram_D2                ; 3
    sta    ram_BB,X              ; 4
    lda    ram_B9                ; 3
    sta    ram_AF,X              ; 4
    lda    #$CC                  ; 2
    sta    ram_C7,X              ; 4
    cpx    #$00                  ; 2
    beq    LF856                 ; 2³
LF82F:
    lda    ram_BB,X              ; 4
    cmp    ram_BA,X              ; 4
    bcs    LF856                 ; 2³
    ldy    ram_BA,X              ; 4
    sta    ram_BA,X              ; 4
    sty    ram_BB,X              ; 4
    lda    ram_AE,X              ; 4
    ldy    ram_AF,X              ; 4
    sta    ram_AF,X              ; 4
    sty    ram_AE,X              ; 4
    lda    ram_C6,X              ; 4
    ldy    ram_C7,X              ; 4
    sta    ram_C7,X              ; 4
    sty    ram_C6,X              ; 4
    dex                          ; 2
    cpx    ram_D9                ; 3
    bne    LF852                 ; 2³
    inc    ram_D9                ; 5
LF852:
    cpx    #$00                  ; 2
    bne    LF82F                 ; 2³
LF856:
    lda    ram_F3                ; 3
    and    #$07                  ; 2
    cmp    #$02                  ; 2
    beq    LF862                 ; 2³
    cmp    #$06                  ; 2
    bne    LF864                 ; 2³
LF862:
    ora    #$01                  ; 2
LF864:
    sta    ram_D0                ; 3
    cmp    #$02                  ; 2
    bcc    LF8B7                 ; 2³
    cmp    #$07                  ; 2
    beq    LF8B7                 ; 2³
    ldx    #$00                  ; 2
LF870:
    lda    ram_BB,X              ; 4
    cmp    #$0F                  ; 2
    bcc    LF8AE                 ; 2³
    cpx    #$00                  ; 2
    beq    LF898                 ; 2³
    sec                          ; 2
    sbc    #$10                  ; 2
    bmi    LF8AE                 ; 2³
    cmp    ram_BA,X              ; 4
    bcc    LF8AE                 ; 2³
    clc                          ; 2
    adc    #$08                  ; 2
    sec                          ; 2
    sbc    ram_9D                ; 3
    bmi    LF88E                 ; 2³
    sec                          ; 2
    sbc    #$5E                  ; 2
LF88E:
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
LF893:
    sta    ram_96                ; 3
    jmp    LF8F4                 ; 3

LF898:
    clc                          ; 2
    adc    #$4E                  ; 2
    cmp    ram_BB,X              ; 4
    bcc    LF870                 ; 2³
LF89F:
    lda    ram_9D                ; 3
    clc                          ; 2
    adc    #$08                  ; 2
    sec                          ; 2
    sbc    ram_BB                ; 3
    bpl    LF893                 ; 2³
    clc                          ; 2
    adc    #$5E                  ; 2
    bpl    LF893                 ; 2³
LF8AE:
    inx                          ; 2
    cpx    ram_D2                ; 3
    bcc    LF870                 ; 2³
    beq    LF870                 ; 2³
    bcs    LF89F                 ; 3   always branch

LF8B7:
    ldx    ram_D2                ; 3
LF8B9:
    lda    ram_BB,X              ; 4
    cmp    #$5D                  ; 2
    bcs    LF8EA                 ; 2³
    cpx    ram_D2                ; 3
    beq    LF8DA                 ; 2³
    clc                          ; 2
    adc    #$0F                  ; 2
    cmp    ram_BC,X              ; 4
    bcs    LF8EA                 ; 2³
LF8CA:
    sec                          ; 2
    sbc    #$07                  ; 2
    sec                          ; 2
    sbc    ram_9D                ; 3
    beq    LF8D4                 ; 2³
    bpl    LF8D7                 ; 2³
LF8D4:
    clc                          ; 2
    adc    #$5E                  ; 2
LF8D7:
    sta    ram_96                ; 3
    rts                          ; 6

LF8DA:
    sec                          ; 2
    sbc    #$4F                  ; 2
    bmi    LF8E3                 ; 2³
    cmp    ram_BB                ; 3
    bcs    LF8EA                 ; 2³
LF8E3:
    lda    ram_BB,X              ; 4
    clc                          ; 2
    adc    #$0F                  ; 2
    bpl    LF8CA                 ; 2³
LF8EA:
    dex                          ; 2
    bpl    LF8B9                 ; 2³
    lda    ram_BB                ; 3
    sec                          ; 2
    sbc    #$01                  ; 2
    bne    LF8CA                 ; 2³
LF8F4:
    ldx    ram_D0                ; 3
    lda    ram_9D                ; 3
    clc                          ; 2
    adc    LFEE5,X               ; 4
    cmp    #$07                  ; 2
    bcs    LF902                 ; 2³
    adc    #$5E                  ; 2
LF902:
    cmp    #$65                  ; 2
    bcc    LF908                 ; 2³
    sbc    #$5E                  ; 2
LF908:
    sta    ram_9D                ; 3
    lda    ram_B9                ; 3
    clc                          ; 2
    adc    LFEED,X               ; 4
    cmp    #$36                  ; 2
    bcs    LF916                 ; 2³
    lda    #$9D                  ; 2
LF916:
    cmp    #$9E                  ; 2
    bcc    LF91C                 ; 2³
    lda    #$36                  ; 2
LF91C:
    sta    ram_B9                ; 3
    dec    ram_96                ; 5
    bne    LF929                 ; 2³
    ldx    ram_E0                ; 3
    lda    LF261,X               ; 4
    sta    ram_9C                ; 3
LF929:
    rts                          ; 6

LF92A:
    jsr    LF241                 ; 6
    ldy    #$8E                  ; 2
    ldx    ram_81                ; 3
LF931:
    lda    ram_9D                ; 3
    bmi    LF93A                 ; 2³
    lda    ram_81                ; 3
    and    #$07                  ; 2
    tax                          ; 2
LF93A:
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUBK                ; 3
    dex                          ; 2
    dey                          ; 2
    bne    LF931                 ; 2³
    sty    HMM0                  ; 3
    lda    ram_F5                ; 3
    sta    COLUBK                ; 3
    dec    ram_81                ; 5
    jmp    LF9EB                 ; 3

START_1:
    sei                          ; 2
    cld                          ; 2
    lda    #$00                  ; 2
    ldx    #$04                  ; 2
LF953:
    sta    0,X                    ; 4
    txs                          ; 2
    stx    ram_DB                ; 3
    inx                          ; 2
    bne    LF953                 ; 2³
    lda    #$5A                  ; 2
    jsr    LFCED                 ; 6
    lda    #$3D                  ; 2
    sta    ram_8C                ; 3
    lda    #$11                  ; 2
    sta    ram_F6                ; 3
    sta    ram_C6                ; 3
LF96A:
    jsr    LF241                 ; 6
    lda    ram_F7                ; 3
    and    #$F0                  ; 2
    ora    #$0F                  ; 2
    sta    ram_F8                ; 3
    ldy    #$43                  ; 2
    jsr    LFACC                 ; 6
    lda    #$00                  ; 2
    sta    ram_96                ; 3
    ldx    #$20                  ; 2
    ldy    ram_F9                ; 3
LF982:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$01                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    TitleScreenOne,Y      ; 4
    sta    GRP0                  ; 3
    lda    TitleScreenTwo,Y      ; 4
    sta    GRP1                  ; 3
    lda    TitleScreenThree,Y    ; 4
    sta    GRP0                  ; 3
    lda    ram_F8                ; 3
    nop                          ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    TitleScreenFour,Y     ; 4
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    bpl    LF9AC                 ; 2³
    ldy    #$3F                  ; 2
LF9AC:
    dex                          ; 2
    bpl    LF982                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    stx    GRP1                  ; 3
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    HMM0                  ; 3
    dec    ram_FA                ; 5
    bmi    LF9C4                 ; 2³
    bne    LF9DB                 ; 2³
LF9C4:
    lda    #$08                  ; 2
    sta    ram_FA                ; 3
    lda    ram_DB                ; 3
    bne    LF9DB                 ; 2³
    dec    ram_F9                ; 5
    bpl    LF9DB                 ; 2³
    lda    #$3F                  ; 2
    sta    ram_F9                ; 3
    lda    ram_F7                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_F7                ; 3
LF9DB:
    ldy    #$2B                  ; 2
    jsr    LFACC                 ; 6
    lda    ram_9E                ; 3
    cmp    #$5A                  ; 2
    bne    LF9EB                 ; 2³
    ldy    #$26                  ; 2
    jmp    LFA7C                 ; 3

LF9EB:
    ldy    #$07                  ; 2
LF9ED:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$01                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    SectorOne,Y           ; 4
    sta    GRP0                  ; 3
    lda    SectorTwo,Y           ; 4
    sta    GRP1                  ; 3
    lda    SectorThree,Y         ; 4
    sta    GRP0                  ; 3
    lda    ram_F8                ; 3
    ora    #$0F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    SectorFour,Y          ; 4
    dey                          ; 2
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    bpl    LF9ED                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    ldy    #$5D                  ; 2
    ldx    #$01                  ; 2
    jsr    LFE00                 ; 6
    ldy    #$52                  ; 2
    dex                          ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    jsr    LFE00                 ; 6
    lda    #$FF                  ; 2
    sta    ram_A9                ; 3
    sta    ram_AB                ; 3
    ldx    ram_E0                ; 3
    ldy    ram_BA                ; 3
    bpl    LFA3A                 ; 2³
    inx                          ; 2
LFA3A:
    lda    LFEF5,X               ; 4
    sta    ram_A8                ; 3
    ldx    ram_AD                ; 3
    cpy    #$00                  ; 2
    beq    LFA47                 ; 2³
    ldx    #$00                  ; 2
LFA47:
    lda    LFEF5+1,X             ; 4
    sta    ram_AA                ; 3
    ldy    #$08                  ; 2
    nop                          ; 2
    dec    ram_81                ; 5
    inc    ram_81                ; 5
    dec    ram_81                ; 5
    inc    ram_81                ; 5
    sta    HMOVE                 ; 3
LFA59:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_AA),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LFA6C                 ; 2³
    lda    #$02                  ; 2
    sta    ENAM0                 ; 3
    bne    LFA59                 ; 3   always branch

LFA6C:
    bpl    LFA59                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    ldy    #$06                  ; 2
LFA7C:
    jsr    LFACC                 ; 6
    lda    ram_BA                ; 3
    bpl    LFA8D                 ; 2³
    lda    #$02                  ; 2
    sta    ram_A9                ; 3
    lda    #$00                  ; 2
    sta    ram_A8                ; 3
    beq    LFA9D                 ; 3   always branch

LFA8D:
    lda    ram_DB                ; 3
    and    #$7F                  ; 2
    sta    ram_DB                ; 3
    beq    LFA99                 ; 2³
    dec    ram_DB                ; 5
    bne    LFA9D                 ; 2³
LFA99:

;5) game start

    lda    INPT4                 ; 3
    AND    INPT1
    
    bpl    LFAA2                 ; 2³
LFA9D:
;    sta    WSYNC                 ; 3   no scanline bounce
;---------------------------------------
    jmp    LF578                 ; 3

LFAA2:
    lda    #$23;21                  ; 2
    sta    TIM64T                ; 4
    lda    #$00                  ; 2
    ldx    #$80                  ; 2
LFAAB:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LFAAB                 ; 2³
    jsr    LFCED                 ; 6
    sty    ram_AD                ; 3
    ldx    #$FD                  ; 2
    stx    ram_84                ; 3
    stx    ram_86                ; 3
    dex                          ; 2
    stx    ram_8D                ; 3
    ldx    #$72                  ; 2
    stx    ram_DB                ; 3
    ldx    #$02                  ; 2
    stx    ram_DA                ; 3
    stx    ram_8B                ; 3
    jmp    LF000                 ; 3

LFACC:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LFACC                 ; 2³
LFAD1:
    rts                          ; 6

    .byte $16 ; |   X XX | $FAD2
    .byte $13 ; |   X  XX| $FAD3
    .byte $10 ; |   X    | $FAD4
    .byte $0D ; |    XX X| $FAD5
    .byte $0A ; |    X X | $FAD6

SectorFour:
    .byte $00 ; |        | $FAD7
    .byte $91 ; |X  X   X| $FAD8
    .byte $52 ; | X X  X | $FAD9
    .byte $54 ; | X X X  | $FADA
    .byte $5E ; | X XXXX | $FADB
    .byte $51 ; | X X   X| $FADC
    .byte $51 ; | X X   X| $FADD
    .byte $9E ; |X  XXXX | $FADE

LFADF:
    .byte $1A ; |   XX X | $FADF
    .byte $1A ; |   XX X | $FAE0
    .byte $18 ; |   XX   | $FAE1
    .byte $17 ; |   X XXX| $FAE2
    .byte $14 ; |   X X  | $FAE3
    .byte $12 ; |   X  X | $FAE4
    .byte $11 ; |   X   X| $FAE5
    .byte $1F ; |   XXXXX| $FAE6
    .byte $0F ; |    XXXX| $FAE7
    .byte $0F ; |    XXXX| $FAE8
    .byte $14 ; |   X X  | $FAE9
    .byte $1B ; |   XX XX| $FAEA
    .byte $17 ; |   X XXX| $FAEB
    .byte $12 ; |   X  X | $FAEC
    .byte $11 ; |   X   X| $FAED
LFAEE:
    .byte $17 ; |   X XXX| $FAEE
    .byte $1F ; |   XXXXX| $FAEF
    .byte $78 ; | XXXX   | $FAF0
    .byte $0C ; |    XX  | $FAF1
    .byte $0C ; |    XX  | $FAF2
    .byte $0C ; |    XX  | $FAF3
    .byte $17 ; |   X XXX| $FAF4
    .byte $3F ; |  XXXXXX| $FAF5
    .byte $28 ; |  X X   | $FAF6
    .byte $05 ; |     X X| $FAF7
    .byte $32 ; |  XX  X | $FAF8
    .byte $0C ; |    XX  | $FAF9
    .byte $0C ; |    XX  | $FAFA
    .byte $0C ; |    XX  | $FAFB
    .byte $11 ; |   X   X| $FAFC
    .byte $40 ; | X      | $FAFD
    .byte $0A ; |    X X | $FAFE
    .byte $1A ; |   XX X | $FAFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                       X
;        XXXXX XXXXXXX  X    XXXXXXX
;       XXXXX XXXXXXX  XXX    XXXXXXX
;       XX       XX    XXX    XX   XX
;       XX       XX    XXX    XX   XX
;       XXX      XX   XX XX   XX  XX
;        XXX     XX   XX XX   XX XX
;         XXX    XX   XX XX   XXXXXX
;          XXX   XX  XX   XX  XX  XXX
;           XXX  XX  XX   XX  XX   XX
;            XX  XX  XX XXXX  XX   XXX
;            XX  XX XX XXXXXX XX    XX
;       XXXXXXX  XX XX     XX XX    XX
;      XXXXXXX  XXXXXX     XXXXXX   XXX
;
;
;       XXXXXXXXXXXXX    XXXXXXXXX  XXX
;      XXXXXXX XXXXXXX  XXXXX  XX   XX
;         XX   XX   XX  XX     XX  XX
;         XX   XX   XX XX      XX  XX
;         XX   XX  XX  XX      XX XX
;         XX   XX XX   XX XXXX XXXXX
;         XX   XXXXXX  XXXXXX  XXXXXX
;         XX   XX  XXX XX      XX  XXX
;         XX   XX   XX XX      XX   XX
;         XX   XX   XXX XX     XX   XX
;         XX   XX    XX XXX    XX    XX
;         XX   XX    XX  XXXXX XX    XX
;        XXXX  XXX   XXX  XXX XXXX   XX
;
;
;            XXX
;          XXXXXXX     XXXXXXXXXXXXXXXX
;      XXXXXXXXXXXXXXX XX X         XXX
;      XXXXXXXXXXXXXXX XXXXXXXXXXXXXXXX
;         XXXXXXXXXXX    XXXXXXXX
;           XXXXX XXXX     XXX
;            XXX   XXXX   XX
;                   XXXX XX
;                  XXXXXXXXX
;                  XXXXXXXXXXX
;                  XXXXXXXXXXX
;                  XXXXXXXXXX
;                   XXXXXX
;
;
;       XXXXXX XXXXXXX  XXXXX    XXX
;      X       X       X     X  X   X
;      X       X       X       X     X
;       XXXXX  XXXXX   X  XXXX X     X
;            X X       X     X XXXXXXX
;            X X       X     X X     X
;      XXXXXX  XXXXXXX  XXXXXX X     X
;
;
;       XXXXX    X   XXX   XXX   XXX
;      X     X  XX  X   X X   X X   X
;      X XXX X   X  X   X X   X     X
;      X X   X   X   XXXX  XXX    XX
;      X XXX X   X      X X   X     X
;      X     X   X      X X   X X   X
;       XXXXX   XXX     X  XXX   XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2B00
      RORG $FB00

  IF ORIGINAL
      
TitleScreenOne:
    .byte $00 ; |        | $FB00
    .byte $7C ; | XXXXX  | $FB01
    .byte $82 ; |X     X | $FB02
    .byte $BA ; |X XXX X | $FB03
    .byte $A2 ; |X X   X | $FB04
    .byte $BA ; |X XXX X | $FB05
    .byte $82 ; |X     X | $FB06
    .byte $7C ; | XXXXX  | $FB07
    .byte $00 ; |        | $FB08
    .byte $00 ; |        | $FB09
    .byte $FC ; |XXXXXX  | $FB0A
    .byte $02 ; |      X | $FB0B
    .byte $02 ; |      X | $FB0C
    .byte $7C ; | XXXXX  | $FB0D
    .byte $80 ; |X       | $FB0E
    .byte $80 ; |X       | $FB0F
    .byte $7E ; | XXXXXX | $FB10
    .byte $00 ; |        | $FB11
    .byte $00 ; |        | $FB12
    .byte $00 ; |        | $FB13
    .byte $00 ; |        | $FB14
    .byte $00 ; |        | $FB15
    .byte $00 ; |        | $FB16
    .byte $00 ; |        | $FB17
    .byte $00 ; |        | $FB18
    .byte $03 ; |      XX| $FB19
    .byte $07 ; |     XXX| $FB1A
    .byte $1F ; |   XXXXX| $FB1B
    .byte $FF ; |XXXXXXXX| $FB1C
    .byte $FF ; |XXXXXXXX| $FB1D
    .byte $0F ; |    XXXX| $FB1E
    .byte $03 ; |      XX| $FB1F
    .byte $00 ; |        | $FB20
    .byte $00 ; |        | $FB21
    .byte $3C ; |  XXXX  | $FB22
    .byte $18 ; |   XX   | $FB23
    .byte $18 ; |   XX   | $FB24
    .byte $18 ; |   XX   | $FB25
    .byte $18 ; |   XX   | $FB26
    .byte $18 ; |   XX   | $FB27
    .byte $18 ; |   XX   | $FB28
    .byte $18 ; |   XX   | $FB29
    .byte $18 ; |   XX   | $FB2A
    .byte $18 ; |   XX   | $FB2B
    .byte $18 ; |   XX   | $FB2C
    .byte $FE ; |XXXXXXX | $FB2D
    .byte $7F ; | XXXXXXX| $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $FE ; |XXXXXXX | $FB31
    .byte $7F ; | XXXXXXX| $FB32
    .byte $03 ; |      XX| $FB33
    .byte $03 ; |      XX| $FB34
    .byte $07 ; |     XXX| $FB35
    .byte $0E ; |    XXX | $FB36
    .byte $1C ; |   XXX  | $FB37
    .byte $38 ; |  XXX   | $FB38
    .byte $70 ; | XXX    | $FB39
    .byte $60 ; | XX     | $FB3A
    .byte $60 ; | XX     | $FB3B
    .byte $7D ; | XXXXX X| $FB3C
    .byte $3E ; |  XXXXX | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
TitleScreenTwo:
    .byte $00 ; |        | $FB40
    .byte $70 ; | XXX    | $FB41
    .byte $20 ; |  X     | $FB42
    .byte $20 ; |  X     | $FB43
    .byte $23 ; |  X   XX| $FB44
    .byte $24 ; |  X  X  | $FB45
    .byte $64 ; | XX  X  | $FB46
    .byte $23 ; |  X   XX| $FB47
    .byte $00 ; |        | $FB48
    .byte $00 ; |        | $FB49
    .byte $FE ; |XXXXXXX | $FB4A
    .byte $80 ; |X       | $FB4B
    .byte $80 ; |X       | $FB4C
    .byte $F8 ; |XXXXX   | $FB4D
    .byte $80 ; |X       | $FB4E
    .byte $80 ; |X       | $FB4F
    .byte $FE ; |XXXXXXX | $FB50
    .byte $00 ; |        | $FB51
    .byte $00 ; |        | $FB52
    .byte $07 ; |     XXX| $FB53
    .byte $0F ; |    XXXX| $FB54
    .byte $0F ; |    XXXX| $FB55
    .byte $0F ; |    XXXX| $FB56
    .byte $0F ; |    XXXX| $FB57
    .byte $07 ; |     XXX| $FB58
    .byte $8F ; |X   XXXX| $FB59
    .byte $DE ; |XX XXXX | $FB5A
    .byte $FC ; |XXXXXX  | $FB5B
    .byte $FE ; |XXXXXXX | $FB5C
    .byte $FE ; |XXXXXXX | $FB5D
    .byte $E0 ; |XXX     | $FB5E
    .byte $80 ; |X       | $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $E3 ; |XXX   XX| $FB62
    .byte $C3 ; |XX    XX| $FB63
    .byte $C3 ; |XX    XX| $FB64
    .byte $C7 ; |XX   XXX| $FB65
    .byte $C6 ; |XX   XX | $FB66
    .byte $CE ; |XX  XXX | $FB67
    .byte $FC ; |XXXXXX  | $FB68
    .byte $D8 ; |XX XX   | $FB69
    .byte $CC ; |XX  XX  | $FB6A
    .byte $C6 ; |XX   XX | $FB6B
    .byte $C6 ; |XX   XX | $FB6C
    .byte $FE ; |XXXXXXX | $FB6D
    .byte $FC ; |XXXXXX  | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $7E ; | XXXXXX | $FB71
    .byte $36 ; |  XX XX | $FB72
    .byte $36 ; |  XX XX | $FB73
    .byte $33 ; |  XX  XX| $FB74
    .byte $33 ; |  XX  XX| $FB75
    .byte $33 ; |  XX  XX| $FB76
    .byte $31 ; |  XX   X| $FB77
    .byte $31 ; |  XX   X| $FB78
    .byte $31 ; |  XX   X| $FB79
    .byte $30 ; |  XX    | $FB7A
    .byte $30 ; |  XX    | $FB7B
    .byte $FC ; |XXXXXX  | $FB7C
    .byte $FE ; |XXXXXXX | $FB7D
    .byte $00 ; |        | $FB7E
    .byte $00 ; |        | $FB7F
TitleScreenThree:
    .byte $00 ; |        | $FB80
    .byte $4E ; | X  XXX | $FB81
    .byte $51 ; | X X   X| $FB82
    .byte $51 ; | X X   X| $FB83
    .byte $CE ; |XX  XXX | $FB84
    .byte $51 ; | X X   X| $FB85
    .byte $51 ; | X X   X| $FB86
    .byte $8E ; |X   XXX | $FB87
    .byte $00 ; |        | $FB88
    .byte $00 ; |        | $FB89
    .byte $7E ; | XXXXXX | $FB8A
    .byte $82 ; |X     X | $FB8B
    .byte $82 ; |X     X | $FB8C
    .byte $9E ; |X  XXXX | $FB8D
    .byte $80 ; |X       | $FB8E
    .byte $82 ; |X     X | $FB8F
    .byte $7C ; | XXXXX  | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $E0 ; |XXX     | $FB93
    .byte $FC ; |XXXXXX  | $FB94
    .byte $FE ; |XXXXXXX | $FB95
    .byte $FE ; |XXXXXXX | $FB96
    .byte $F8 ; |XXXXX   | $FB97
    .byte $B0 ; |X XX    | $FB98
    .byte $18 ; |   XX   | $FB99
    .byte $0E ; |    XXX | $FB9A
    .byte $3F ; |  XXXXXX| $FB9B
    .byte $FF ; |XXXXXXXX| $FB9C
    .byte $D0 ; |XX X    | $FB9D
    .byte $FF ; |XXXXXXXX| $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $9D ; |X  XXX X| $FBA2
    .byte $3E ; |  XXXXX | $FBA3
    .byte $70 ; | XXX    | $FBA4
    .byte $60 ; | XX     | $FBA5
    .byte $C0 ; |XX      | $FBA6
    .byte $C0 ; |XX      | $FBA7
    .byte $FC ; |XXXXXX  | $FBA8
    .byte $DE ; |XX XXXX | $FBA9
    .byte $C0 ; |XX      | $FBAA
    .byte $C0 ; |XX      | $FBAB
    .byte $60 ; | XX     | $FBAC
    .byte $7C ; | XXXXX  | $FBAD
    .byte $3F ; |  XXXXXX| $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $0F ; |    XXXX| $FBB1
    .byte $0D ; |    XX X| $FBB2
    .byte $FD ; |XXXXXX X| $FBB3
    .byte $79 ; | XXXX  X| $FBB4
    .byte $19 ; |   XX  X| $FBB5
    .byte $19 ; |   XX  X| $FBB6
    .byte $B1 ; |X XX   X| $FBB7
    .byte $B1 ; |X XX   X| $FBB8
    .byte $B1 ; |X XX   X| $FBB9
    .byte $E1 ; |XXX    X| $FBBA
    .byte $E1 ; |XXX    X| $FBBB
    .byte $E1 ; |XXX    X| $FBBC
    .byte $43 ; | X    XX| $FBBD
    .byte $40 ; | X      | $FBBE
    .byte $00 ; |        | $FBBF
TitleScreenFour:
    .byte $00 ; |        | $FBC0
    .byte $38 ; |  XXX   | $FBC1
    .byte $44 ; | X   X  | $FBC2
    .byte $04 ; |     X  | $FBC3
    .byte $18 ; |   XX   | $FBC4
    .byte $04 ; |     X  | $FBC5
    .byte $44 ; | X   X  | $FBC6
    .byte $38 ; |  XXX   | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $82 ; |X     X | $FBCA
    .byte $82 ; |X     X | $FBCB
    .byte $FE ; |XXXXXXX | $FBCC
    .byte $82 ; |X     X | $FBCD
    .byte $82 ; |X     X | $FBCE
    .byte $44 ; | X   X  | $FBCF
    .byte $38 ; |  XXX   | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $C0 ; |XX      | $FBDB
    .byte $FF ; |XXXXXXXX| $FBDC
    .byte $07 ; |     XXX| $FBDD
    .byte $FF ; |XXXXXXXX| $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $E3 ; |XXX   XX| $FBE2
    .byte $C3 ; |XX    XX| $FBE3
    .byte $C3 ; |XX    XX| $FBE4
    .byte $C6 ; |XX   XX | $FBE5
    .byte $C6 ; |XX   XX | $FBE6
    .byte $CE ; |XX  XXX | $FBE7
    .byte $FC ; |XXXXXX  | $FBE8
    .byte $F8 ; |XXXXX   | $FBE9
    .byte $D8 ; |XX XX   | $FBEA
    .byte $CC ; |XX  XX  | $FBEB
    .byte $CC ; |XX  XX  | $FBEC
    .byte $C6 ; |XX   XX | $FBED
    .byte $E7 ; |XXX  XXX| $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $C7 ; |XX   XXX| $FBF1
    .byte $86 ; |X    XX | $FBF2
    .byte $86 ; |X    XX | $FBF3
    .byte $8E ; |X   XXX | $FBF4
    .byte $8C ; |X   XX  | $FBF5
    .byte $9C ; |X  XXX  | $FBF6
    .byte $F8 ; |XXXXX   | $FBF7
    .byte $B0 ; |X XX    | $FBF8
    .byte $98 ; |X  XX   | $FBF9
    .byte $8C ; |X   XX  | $FBFA
    .byte $8C ; |X   XX  | $FBFB
    .byte $FC ; |XXXXXX  | $FBFC
    .byte $F8 ; |XXXXX   | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
    
 ELSE
 
TitleScreenOne:
    .byte $00 ; |        | $FB00
    .byte $33 ; |  XX  XX| $FB01
    .byte $4A ; | X  X X | $FB02
    .byte $42 ; | X    X | $FB03
    .byte $43 ; | X    XX| $FB04
    .byte $40 ; | X      | $FB05
    .byte $48 ; | X  X   | $FB06
    .byte $30 ; |  XX    | $FB07
    .byte $00 ; |        | $FB08
    .byte $00 ; |        | $FB09
    .byte $0F ; |    XXXX| $FB0A
    .byte $00 ; |        | $FB0B
    .byte $00 ; |        | $FB0C
    .byte $07 ; |     XXX| $FB0D
    .byte $08 ; |    X   | $FB0E
    .byte $08 ; |    X   | $FB0F
    .byte $07 ; |     XXX| $FB10
    .byte $00 ; |        | $FB11
    .byte $00 ; |        | $FB12
    .byte $00 ; |        | $FB13
    .byte $00 ; |        | $FB14
    .byte $00 ; |        | $FB15
    .byte $00 ; |        | $FB16
    .byte $00 ; |        | $FB17
    .byte $00 ; |        | $FB18
    .byte $03 ; |      XX| $FB19
    .byte $07 ; |     XXX| $FB1A
    .byte $1F ; |   XXXXX| $FB1B
    .byte $FF ; |XXXXXXXX| $FB1C
    .byte $FF ; |XXXXXXXX| $FB1D
    .byte $0F ; |    XXXX| $FB1E
    .byte $03 ; |      XX| $FB1F
    .byte $00 ; |        | $FB20
    .byte $00 ; |        | $FB21
    .byte $3C ; |  XXXX  | $FB22
    .byte $18 ; |   XX   | $FB23
    .byte $18 ; |   XX   | $FB24
    .byte $18 ; |   XX   | $FB25
    .byte $18 ; |   XX   | $FB26
    .byte $18 ; |   XX   | $FB27
    .byte $18 ; |   XX   | $FB28
    .byte $18 ; |   XX   | $FB29
    .byte $18 ; |   XX   | $FB2A
    .byte $18 ; |   XX   | $FB2B
    .byte $18 ; |   XX   | $FB2C
    .byte $FE ; |XXXXXXX | $FB2D
    .byte $7F ; | XXXXXXX| $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $FE ; |XXXXXXX | $FB31
    .byte $7F ; | XXXXXXX| $FB32
    .byte $03 ; |      XX| $FB33
    .byte $03 ; |      XX| $FB34
    .byte $07 ; |     XXX| $FB35
    .byte $0E ; |    XXX | $FB36
    .byte $1C ; |   XXX  | $FB37
    .byte $38 ; |  XXX   | $FB38
    .byte $70 ; | XXX    | $FB39
    .byte $60 ; | XX     | $FB3A
    .byte $60 ; | XX     | $FB3B
    .byte $7D ; | XXXXX X| $FB3C
    .byte $3E ; |  XXXXX | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
TitleScreenTwo:
    .byte $00 ; |        | $FB40
    .byte $A5 ; |X X  X X| $FB41
    .byte $A5 ; |X X  X X| $FB42
    .byte $A5 ; |X X  X X| $FB43
    .byte $B9 ; |X XXX  X| $FB44
    .byte $03 ; |      XX| $FB45
    .byte $01 ; |       X| $FB46
    .byte $01 ; |       X| $FB47
    .byte $00 ; |        | $FB48
    .byte $00 ; |        | $FB49
    .byte $3E ; |  XXXXX | $FB4A
    .byte $A0 ; |X X     | $FB4B
    .byte $A0 ; |X X     | $FB4C
    .byte $38 ; |  XXX   | $FB4D
    .byte $20 ; |  X     | $FB4E
    .byte $20 ; |  X     | $FB4F
    .byte $BE ; |X XXXXX | $FB50
    .byte $00 ; |        | $FB51
    .byte $00 ; |        | $FB52
    .byte $07 ; |     XXX| $FB53
    .byte $0F ; |    XXXX| $FB54
    .byte $0F ; |    XXXX| $FB55
    .byte $0F ; |    XXXX| $FB56
    .byte $0F ; |    XXXX| $FB57
    .byte $07 ; |     XXX| $FB58
    .byte $8F ; |X   XXXX| $FB59
    .byte $DE ; |XX XXXX | $FB5A
    .byte $FC ; |XXXXXX  | $FB5B
    .byte $FE ; |XXXXXXX | $FB5C
    .byte $FE ; |XXXXXXX | $FB5D
    .byte $E0 ; |XXX     | $FB5E
    .byte $80 ; |X       | $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $E3 ; |XXX   XX| $FB62
    .byte $C3 ; |XX    XX| $FB63
    .byte $C3 ; |XX    XX| $FB64
    .byte $C7 ; |XX   XXX| $FB65
    .byte $C6 ; |XX   XX | $FB66
    .byte $CE ; |XX  XXX | $FB67
    .byte $FC ; |XXXXXX  | $FB68
    .byte $D8 ; |XX XX   | $FB69
    .byte $CC ; |XX  XX  | $FB6A
    .byte $C6 ; |XX   XX | $FB6B
    .byte $C6 ; |XX   XX | $FB6C
    .byte $FE ; |XXXXXXX | $FB6D
    .byte $FC ; |XXXXXX  | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $7E ; | XXXXXX | $FB71
    .byte $36 ; |  XX XX | $FB72
    .byte $36 ; |  XX XX | $FB73
    .byte $33 ; |  XX  XX| $FB74
    .byte $33 ; |  XX  XX| $FB75
    .byte $33 ; |  XX  XX| $FB76
    .byte $31 ; |  XX   X| $FB77
    .byte $31 ; |  XX   X| $FB78
    .byte $31 ; |  XX   X| $FB79
    .byte $30 ; |  XX    | $FB7A
    .byte $30 ; |  XX    | $FB7B
    .byte $FC ; |XXXXXX  | $FB7C
    .byte $FE ; |XXXXXXX | $FB7D
    .byte $00 ; |        | $FB7E
    .byte $00 ; |        | $FB7F
TitleScreenThree:
    .byte $00 ; |        | $FB80
    .byte $23 ; |  X   XX| $FB81
    .byte $22 ; |  X   X | $FB82
    .byte $22 ; |  X   X | $FB83
    .byte $3B ; |  XXX XX| $FB84
    .byte $80 ; |X       | $FB85
    .byte $00 ; |        | $FB86
    .byte $00 ; |        | $FB87
    .byte $00 ; |        | $FB88
    .byte $00 ; |        | $FB89
    .byte $7A ; | XXXX X | $FB8A
    .byte $8A ; |X   X X | $FB8B
    .byte $8A ; |X   X X | $FB8C
    .byte $BB ; |X XXX XX| $FB8D
    .byte $82 ; |X     X | $FB8E
    .byte $8B ; |X   X XX| $FB8F
    .byte $71 ; | XXX   X| $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $E0 ; |XXX     | $FB93
    .byte $FC ; |XXXXXX  | $FB94
    .byte $FE ; |XXXXXXX | $FB95
    .byte $FE ; |XXXXXXX | $FB96
    .byte $F8 ; |XXXXX   | $FB97
    .byte $B0 ; |X XX    | $FB98
    .byte $18 ; |   XX   | $FB99
    .byte $0E ; |    XXX | $FB9A
    .byte $3F ; |  XXXXXX| $FB9B
    .byte $FF ; |XXXXXXXX| $FB9C
    .byte $D0 ; |XX X    | $FB9D
    .byte $FF ; |XXXXXXXX| $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $9D ; |X  XXX X| $FBA2
    .byte $3E ; |  XXXXX | $FBA3
    .byte $70 ; | XXX    | $FBA4
    .byte $60 ; | XX     | $FBA5
    .byte $C0 ; |XX      | $FBA6
    .byte $C0 ; |XX      | $FBA7
    .byte $FC ; |XXXXXX  | $FBA8
    .byte $DE ; |XX XXXX | $FBA9
    .byte $C0 ; |XX      | $FBAA
    .byte $C0 ; |XX      | $FBAB
    .byte $60 ; | XX     | $FBAC
    .byte $7C ; | XXXXX  | $FBAD
    .byte $3F ; |  XXXXXX| $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $0F ; |    XXXX| $FBB1
    .byte $0D ; |    XX X| $FBB2
    .byte $FD ; |XXXXXX X| $FBB3
    .byte $79 ; | XXXX  X| $FBB4
    .byte $19 ; |   XX  X| $FBB5
    .byte $19 ; |   XX  X| $FBB6
    .byte $B1 ; |X XX   X| $FBB7
    .byte $B1 ; |X XX   X| $FBB8
    .byte $B1 ; |X XX   X| $FBB9
    .byte $E1 ; |XXX    X| $FBBA
    .byte $E1 ; |XXX    X| $FBBB
    .byte $E1 ; |XXX    X| $FBBC
    .byte $43 ; | X    XX| $FBBD
    .byte $40 ; | X      | $FBBE
    .byte $00 ; |        | $FBBF
TitleScreenFour:
    .byte $00 ; |        | $FBC0
    .byte $AC ; |X X XX  | $FBC1
    .byte $A2 ; |X X   X | $FBC2
    .byte $A4 ; |X X  X  | $FBC3
    .byte $A8 ; |X X X   | $FBC4
    .byte $26 ; |  X  XX | $FBC5
    .byte $20 ; |  X     | $FBC6
    .byte $20 ; |  X     | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $20 ; |  X     | $FBCA
    .byte $20 ; |  X     | $FBCB
    .byte $20 ; |  X     | $FBCC
    .byte $E0 ; |XXX     | $FBCD
    .byte $20 ; |  X     | $FBCE
    .byte $60 ; | XX     | $FBCF
    .byte $C0 ; |XX      | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $C0 ; |XX      | $FBDB
    .byte $FF ; |XXXXXXXX| $FBDC
    .byte $07 ; |     XXX| $FBDD
    .byte $FF ; |XXXXXXXX| $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $E3 ; |XXX   XX| $FBE2
    .byte $C3 ; |XX    XX| $FBE3
    .byte $C3 ; |XX    XX| $FBE4
    .byte $C6 ; |XX   XX | $FBE5
    .byte $C6 ; |XX   XX | $FBE6
    .byte $CE ; |XX  XXX | $FBE7
    .byte $FC ; |XXXXXX  | $FBE8
    .byte $F8 ; |XXXXX   | $FBE9
    .byte $D8 ; |XX XX   | $FBEA
    .byte $CC ; |XX  XX  | $FBEB
    .byte $CC ; |XX  XX  | $FBEC
    .byte $C6 ; |XX   XX | $FBED
    .byte $E7 ; |XXX  XXX| $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $C7 ; |XX   XXX| $FBF1
    .byte $86 ; |X    XX | $FBF2
    .byte $86 ; |X    XX | $FBF3
    .byte $8E ; |X   XXX | $FBF4
    .byte $8C ; |X   XX  | $FBF5
    .byte $9C ; |X  XXX  | $FBF6
    .byte $F8 ; |XXXXX   | $FBF7
    .byte $B0 ; |X XX    | $FBF8
    .byte $98 ; |X  XX   | $FBF9
    .byte $8C ; |X   XX  | $FBFA
    .byte $8C ; |X   XX  | $FBFB
    .byte $FC ; |XXXXXX  | $FBFC
    .byte $F8 ; |XXXXX   | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
    
  ENDIF

ShipGfxOne:
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $28 ; |  X X   | $FC02
    .byte $28 ; |  X X   | $FC03
    .byte $38 ; |  XXX   | $FC04
    .byte $28 ; |  X X   | $FC05
    .byte $10 ; |   X    | $FC06
    .byte $28 ; |  X X   | $FC07
    .byte $28 ; |  X X   | $FC08
    .byte $10 ; |   X    | $FC09
ShipGfxTwo:
    .byte $00 ; |        | $FC0A
    .byte $00 ; |        | $FC0B
    .byte $10 ; |   X    | $FC0C
    .byte $14 ; |   X X  | $FC0D
    .byte $2C ; |  X XX  | $FC0E
    .byte $28 ; |  X X   | $FC0F
    .byte $78 ; | XXXX   | $FC10
    .byte $50 ; | X X    | $FC11
    .byte $70 ; | XXX    | $FC12
    .byte $00 ; |        | $FC13
ShipGfxThree:
    .byte $00 ; |        | $FC14
    .byte $00 ; |        | $FC15
    .byte $08 ; |    X   | $FC16
    .byte $10 ; |   X    | $FC17
    .byte $2A ; |  X X X | $FC18
    .byte $74 ; | XXX X  | $FC19
    .byte $58 ; | X XX   | $FC1A
    .byte $70 ; | XXX    | $FC1B
    .byte $00 ; |        | $FC1C
    .byte $00 ; |        | $FC1D
ShipGfxFour:
    .byte $00 ; |        | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $00 ; |        | $FC21
    .byte $04 ; |     X  | $FC22
    .byte $18 ; |   XX   | $FC23
    .byte $72 ; | XXX  X | $FC24
    .byte $5C ; | X XXX  | $FC25
    .byte $70 ; | XXX    | $FC26
    .byte $00 ; |        | $FC27
ShipGfxFive:
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $5C ; | X XXX  | $FC2B
    .byte $A8 ; |X X X   | $FC2C
    .byte $A8 ; |X X X   | $FC2D
    .byte $5C ; | X XXX  | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
ShipGfxSix:
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
    .byte $00 ; |        | $FC35
    .byte $70 ; | XXX    | $FC36
    .byte $5C ; | X XXX  | $FC37
    .byte $72 ; | XXX  X | $FC38
    .byte $18 ; |   XX   | $FC39
    .byte $04 ; |     X  | $FC3A
    .byte $00 ; |        | $FC3B
ShipGfxSeven:
    .byte $00 ; |        | $FC3C
    .byte $00 ; |        | $FC3D
    .byte $70 ; | XXX    | $FC3E
    .byte $58 ; | X XX   | $FC3F
    .byte $74 ; | XXX X  | $FC40
    .byte $2A ; |  X X X | $FC41
    .byte $10 ; |   X    | $FC42
    .byte $08 ; |    X   | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
ShipGfxEight:
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $70 ; | XXX    | $FC48
    .byte $50 ; | X X    | $FC49
    .byte $78 ; | XXXX   | $FC4A
    .byte $28 ; |  X X   | $FC4B
    .byte $2C ; |  X XX  | $FC4C
    .byte $14 ; |   X X  | $FC4D
    .byte $10 ; |   X    | $FC4E
    .byte $00 ; |        | $FC4F
ShipGfxNine:
    .byte $00 ; |        | $FC50
    .byte $10 ; |   X    | $FC51
    .byte $28 ; |  X X   | $FC52
    .byte $28 ; |  X X   | $FC53
    .byte $10 ; |   X    | $FC54
    .byte $28 ; |  X X   | $FC55
    .byte $38 ; |  XXX   | $FC56
    .byte $28 ; |  X X   | $FC57
    .byte $28 ; |  X X   | $FC58
    .byte $00 ; |        | $FC59
ShipGfxTen:
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
    .byte $1C ; |   XXX  | $FC5C
    .byte $14 ; |   X X  | $FC5D
    .byte $3C ; |  XXXX  | $FC5E
    .byte $28 ; |  X X   | $FC5F
    .byte $68 ; | XX X   | $FC60
    .byte $50 ; | X X    | $FC61
    .byte $10 ; |   X    | $FC62
    .byte $00 ; |        | $FC63
ShipGfxEleven:
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $1C ; |   XXX  | $FC66
    .byte $34 ; |  XX X  | $FC67
    .byte $5C ; | X XXX  | $FC68
    .byte $A8 ; |X X X   | $FC69
    .byte $10 ; |   X    | $FC6A
    .byte $20 ; |  X     | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
ShipGfxTwelve:
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $0E ; |    XXX | $FC72
    .byte $3A ; |  XXX X | $FC73
    .byte $4E ; | X  XXX | $FC74
    .byte $18 ; |   XX   | $FC75
    .byte $20 ; |  X     | $FC76
    .byte $00 ; |        | $FC77
ShipGfxThirteen:
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $00 ; |        | $FC7A
    .byte $74 ; | XXX X  | $FC7B
    .byte $2A ; |  X X X | $FC7C
    .byte $2A ; |  X X X | $FC7D
    .byte $74 ; | XXX X  | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
ShipGfxFourteen:
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $20 ; |  X     | $FC86
    .byte $18 ; |   XX   | $FC87
    .byte $4E ; | X  XXX | $FC88
    .byte $3A ; |  XXX X | $FC89
    .byte $0E ; |    XXX | $FC8A
    .byte $00 ; |        | $FC8B
ShipGfxFifthteen:
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $20 ; |  X     | $FC8E
    .byte $10 ; |   X    | $FC8F
    .byte $A8 ; |X X X   | $FC90
    .byte $5C ; | X XXX  | $FC91
    .byte $34 ; |  XX X  | $FC92
    .byte $1C ; |   XXX  | $FC93
    .byte $00 ; |        | $FC94
    .byte $00 ; |        | $FC95
ShipGfxSixteen:
    .byte $00 ; |        | $FC96
    .byte $00 ; |        | $FC97
    .byte $10 ; |   X    | $FC98
    .byte $50 ; | X X    | $FC99
    .byte $68 ; | XX X   | $FC9A
    .byte $28 ; |  X X   | $FC9B
    .byte $3C ; |  XXXX  | $FC9C
    .byte $14 ; |   X X  | $FC9D
    .byte $1C ; |   XXX  | $FC9E
    .byte $00 ; |        | $FC9F

LFCA0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    Zero,Y                ; 4
    sta    ram_D4                ; 3
    lda    (ram_A4),Y            ; 5
    tax                          ; 2
    lda    (ram_A6),Y            ; 5
    ldy    ram_D4                ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
LFCB6:
    dec    ram_80                ; 5
    ldy    ram_80                ; 3
    bmi    LFCCA                 ; 2³
    lda    (ram_9E),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_A0),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_A2),Y            ; 5
    sta    GRP0                  ; 3
    bne    LFCA0                 ; 2³
LFCCA:
    jmp    LF123                 ; 3

LFCCD:
    .byte 0   ; $FCCD  addition table
    .byte 1   ; $FCCE
    .byte 1   ; $FCCF
    .byte 1   ; $FCD0
    .byte 1   ; $FCD1
    .byte 1   ; $FCD2
    .byte 1   ; $FCD3
    .byte 1   ; $FCD4
    .byte 0   ; $FCD5
    .byte -1  ; $FCD6
    .byte -1  ; $FCD7
    .byte -1  ; $FCD8
    .byte -1  ; $FCD9
    .byte -1  ; $FCDA
    .byte -1  ; $FCDB
    .byte -1  ; $FCDC
LFCDD:
    .byte -1  ; $FCDD  addition table
    .byte -1  ; $FCDE
    .byte -1  ; $FCDF
    .byte -1  ; $FCE0
    .byte 0   ; $FCE1
    .byte 1   ; $FCE2
    .byte 1   ; $FCE3
    .byte 1   ; $FCE4
    .byte 1   ; $FCE5
    .byte 1   ; $FCE6
    .byte 1   ; $FCE7
    .byte 1   ; $FCE8
    .byte 0   ; $FCE9
    .byte -1  ; $FCEA
    .byte -1  ; $FCEB
    .byte -1  ; $FCEC

LFCED:
    ldy    #$FF                  ; 2
    ldx    #$0D                  ; 2
    stx    ram_F2                ; 3
LFCF3:
    sty    ram_9E,X              ; 4
    dex                          ; 2
    sta    ram_9E,X              ; 4
    dex                          ; 2
    bpl    LFCF3                 ; 2³
    lda    #$90                  ; 2
    sta    ram_F7                ; 3
    rts                          ; 6

    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $60 ; | XX     | $FD03
    .byte $61 ; | XX    X| $FD04
    .byte $23 ; |  X   XX| $FD05
    .byte $33 ; |  XX  XX| $FD06
    .byte $1D ; |   XXX X| $FD07
    .byte $0F ; |    XXXX| $FD08
    .byte $07 ; |     XXX| $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $06 ; |     XX | $FD0D
    .byte $86 ; |X    XX | $FD0E
    .byte $C4 ; |XX   X  | $FD0F
    .byte $CC ; |XX  XX  | $FD10
    .byte $B8 ; |X XXX   | $FD11
    .byte $F0 ; |XXXX    | $FD12
    .byte $E0 ; |XXX     | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $04 ; |     X  | $FD17
    .byte $09 ; |    X  X| $FD18
    .byte $02 ; |      X | $FD19
    .byte $04 ; |     X  | $FD1A
    .byte $02 ; |      X | $FD1B
    .byte $08 ; |    X   | $FD1C
    .byte $05 ; |     X X| $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $40 ; | X      | $FD21
    .byte $00 ; |        | $FD22
    .byte $80 ; |X       | $FD23
    .byte $40 ; | X      | $FD24
    .byte $40 ; | X      | $FD25
    .byte $80 ; |X       | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $05 ; |     X X| $FD2A
    .byte $00 ; |        | $FD2B
    .byte $02 ; |      X | $FD2C
    .byte $04 ; |     X  | $FD2D
    .byte $04 ; |     X  | $FD2E
    .byte $04 ; |     X  | $FD2F
    .byte $02 ; |      X | $FD30
    .byte $01 ; |       X| $FD31
    .byte $00 ; |        | $FD32
    .byte $E0 ; |XXX     | $FD33
    .byte $10 ; |   X    | $FD34
    .byte $48 ; | X  X   | $FD35
    .byte $00 ; |        | $FD36
    .byte $80 ; |X       | $FD37
    .byte $28 ; |  X X   | $FD38
    .byte $88 ; |X   X   | $FD39
    .byte $10 ; |   X    | $FD3A
    .byte $20 ; |  X     | $FD3B
    .byte $00 ; |        | $FD3C
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
    .byte $00 ; |        | $FD42
    .byte $00 ; |        | $FD43
    .byte $00 ; |        | $FD44
    .byte $00 ; |        | $FD45
    .byte $00 ; |        | $FD46
    .byte $0F ; |    XXXX| $FD47
    .byte $1C ; |   XXX  | $FD48
    .byte $7F ; | XXXXXXX| $FD49
    .byte $FF ; |XXXXXXXX| $FD4A
    .byte $AA ; |X X X X | $FD4B
    .byte $FF ; |XXXXXXXX| $FD4C
    .byte $7F ; | XXXXXXX| $FD4D
    .byte $1C ; |   XXX  | $FD4E
    .byte $0F ; |    XXXX| $FD4F
    .byte $00 ; |        | $FD50
    .byte $E0 ; |XXX     | $FD51
    .byte $70 ; | XXX    | $FD52
    .byte $FC ; |XXXXXX  | $FD53
    .byte $FE ; |XXXXXXX | $FD54
    .byte $AA ; |X X X X | $FD55
    .byte $FE ; |XXXXXXX | $FD56
    .byte $FC ; |XXXXXX  | $FD57
    .byte $70 ; | XXX    | $FD58
    .byte $E0 ; |XXX     | $FD59
    .byte $00 ; |        | $FD5A
    .byte $01 ; |       X| $FD5B
    .byte $07 ; |     XXX| $FD5C
    .byte $43 ; | X    XX| $FD5D
    .byte $7F ; | XXXXXXX| $FD5E
    .byte $43 ; | X    XX| $FD5F
    .byte $0F ; |    XXXX| $FD60
    .byte $03 ; |      XX| $FD61
    .byte $03 ; |      XX| $FD62
    .byte $01 ; |       X| $FD63
    .byte $00 ; |        | $FD64
    .byte $80 ; |X       | $FD65
    .byte $E0 ; |XXX     | $FD66
    .byte $C2 ; |XX    X | $FD67
    .byte $FE ; |XXXXXXX | $FD68
    .byte $C2 ; |XX    X | $FD69
    .byte $F0 ; |XXXX    | $FD6A
    .byte $C0 ; |XX      | $FD6B
    .byte $C0 ; |XX      | $FD6C
    .byte $80 ; |X       | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $11 ; |   X   X| $FD6F
    .byte $0B ; |    X XX| $FD70
    .byte $07 ; |     XXX| $FD71
    .byte $0F ; |    XXXX| $FD72
    .byte $39 ; |  XXX  X| $FD73
    .byte $0E ; |    XXX | $FD74
    .byte $06 ; |     XX | $FD75
    .byte $0B ; |    X XX| $FD76
    .byte $11 ; |   X   X| $FD77
    .byte $00 ; |        | $FD78
    .byte $88 ; |X   X   | $FD79
    .byte $D0 ; |XX X    | $FD7A
    .byte $60 ; | XX     | $FD7B
    .byte $70 ; | XXX    | $FD7C
    .byte $9C ; |X  XXX  | $FD7D
    .byte $F0 ; |XXXX    | $FD7E
    .byte $E0 ; |XXX     | $FD7F
    .byte $D0 ; |XX X    | $FD80
    .byte $88 ; |X   X   | $FD81
    .byte $00 ; |        | $FD82
    .byte $01 ; |       X| $FD83
    .byte $03 ; |      XX| $FD84
    .byte $03 ; |      XX| $FD85
    .byte $07 ; |     XXX| $FD86
    .byte $7E ; | XXXXXX | $FD87
    .byte $76 ; | XXX XX | $FD88
    .byte $23 ; |  X   XX| $FD89
    .byte $03 ; |      XX| $FD8A
    .byte $01 ; |       X| $FD8B
    .byte $00 ; |        | $FD8C
    .byte $80 ; |X       | $FD8D
    .byte $C0 ; |XX      | $FD8E
    .byte $C0 ; |XX      | $FD8F
    .byte $E0 ; |XXX     | $FD90
    .byte $7E ; | XXXXXX | $FD91
    .byte $6E ; | XX XXX | $FD92
    .byte $C4 ; |XX   X  | $FD93
    .byte $C0 ; |XX      | $FD94
    .byte $80 ; |X       | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $05 ; |     X X| $FD99
    .byte $53 ; | X X  XX| $FD9A
    .byte $85 ; |X    X X| $FD9B
    .byte $2B ; |  X X XX| $FD9C
    .byte $10 ; |   X    | $FD9D
    .byte $05 ; |     X X| $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $68 ; | XX X   | $FDA1
    .byte $FC ; |XXXXXX  | $FDA2
    .byte $D6 ; |XX X XX | $FDA3
    .byte $7A ; | XXXX X | $FDA4
    .byte $FE ; |XXXXXXX | $FDA5
    .byte $54 ; | X X X  | $FDA6
    .byte $EE ; |XXX XXX | $FDA7
    .byte $5E ; | X XXXX | $FDA8
    .byte $34 ; |  XX X  | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $05 ; |     X X| $FDAB
    .byte $0B ; |    X XX| $FDAC
    .byte $07 ; |     XXX| $FDAD
    .byte $0F ; |    XXXX| $FDAE
    .byte $1F ; |   XXXXX| $FDAF
    .byte $0F ; |    XXXX| $FDB0
    .byte $07 ; |     XXX| $FDB1
    .byte $0B ; |    X XX| $FDB2
    .byte $05 ; |     X X| $FDB3
    .byte $00 ; |        | $FDB4
    .byte $A0 ; |X X     | $FDB5
    .byte $D0 ; |XX X    | $FDB6
    .byte $E0 ; |XXX     | $FDB7
    .byte $F0 ; |XXXX    | $FDB8
    .byte $F8 ; |XXXXX   | $FDB9
    .byte $F0 ; |XXXX    | $FDBA
    .byte $E0 ; |XXX     | $FDBB
    .byte $D0 ; |XX X    | $FDBC
    .byte $A0 ; |X X     | $FDBD
LFDBE:
    .byte $01   ; $FDBE  addition table
    .byte $02   ; $FDBF
    .byte $03   ; $FDC0
    .byte $03   ; $FDC1
    .byte $03   ; $FDC2
    .byte $03   ; $FDC3
    .byte $03   ; $FDC4
    .byte $02   ; $FDC5
    .byte $01   ; $FDC6
    .byte $01   ; $FDC7
    .byte $01   ; $FDC8
    .byte $01   ; $FDC9
    .byte $01   ; $FDCA
    .byte $01   ; $FDCB
    .byte $01   ; $FDCC
    .byte $01   ; $FDCD
LFDCE:
    .byte $0F   ; $FDCE  AUDF1
    .byte $0E   ; $FDCF
    .byte $0D   ; $FDD0
    .byte $0C   ; $FDD1
    .byte $0B   ; $FDD2
    .byte $0A   ; $FDD3
    .byte $09   ; $FDD4
    .byte $08   ; $FDD5
    .byte $07   ; $FDD6
    .byte $06   ; $FDD7
    .byte $05   ; $FDD8
    .byte $04   ; $FDD9
    .byte $1F   ; $FDDA
    .byte $1E   ; $FDDB
    .byte $1D   ; $FDDC
    .byte $1C   ; $FDDD
    .byte $1B   ; $FDDE
    .byte $1A   ; $FDDF
    .byte $19   ; $FDE0
    .byte $18   ; $FDE1
LFDE2:
    .byte $09   ; $FDE2   AUDV0
    .byte $0B   ; $FDE3
    .byte $0D   ; $FDE4
    .byte $0F   ; $FDE5
    .byte $0F   ; $FDE6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       XXX XXXX  XXX XXXXX  XX
;      X    X    X      X   X
;      X    X    X      X   X
;       XX  XXX  X      X   X
;         X X    X      X   X
;         X X    X      X   X
;      XXX  XXXX  XXX   X    XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SectorOne:
    .byte $00 ; |        | $FDE7
    .byte $E7 ; |XXX  XXX| $FDE8
    .byte $14 ; |   X X  | $FDE9
    .byte $14 ; |   X X  | $FDEA
    .byte $67 ; | XX  XXX| $FDEB
    .byte $84 ; |X    X  | $FDEC
    .byte $84 ; |X    X  | $FDED
    .byte $77 ; | XXX XXX| $FDEE
SectorTwo:
    .byte $00 ; |        | $FDEF
    .byte $9C ; |X  XXX  | $FDF0
    .byte $20 ; |  X     | $FDF1
    .byte $20 ; |  X     | $FDF2
    .byte $20 ; |  X     | $FDF3
    .byte $20 ; |  X     | $FDF4
    .byte $20 ; |  X     | $FDF5
    .byte $9D ; |X  XXX X| $FDF6
SectorThree:
    .byte $00 ; |        | $FDF7
    .byte $43 ; | X    XX| $FDF8
    .byte $44 ; | X   X  | $FDF9
    .byte $44 ; | X   X  | $FDFA
    .byte $44 ; | X   X  | $FDFB
    .byte $44 ; | X   X  | $FDFC
    .byte $44 ; | X   X  | $FDFD
    .byte $F3 ; |XXXX  XX| $FDFE

    nop                          ; 2
LFE00:
    lda    LFE44,Y               ; 4
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LFE0A:
    dey                          ; 2
    bpl    LFE0A                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

LFE12:
    lda    LFE44,Y               ; 4
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LFE1C:
    dey                          ; 2
    bpl    LFE1C                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LFE26:
    lda    LFE44,Y               ; 4
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
LFE33:
    dey                          ; 2
    bpl    LFE33                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$04                  ; 2
LFE3E:
    dey                          ; 2
    bne    LFE3E                 ; 2³
    sty    HMP0,X                ; 4
    rts                          ; 6

LFE44:
    .byte LEFT_7    | 3   ; $FE44  repositioning table
    .byte LEFT_6    | 3   ; $FE45
    .byte LEFT_5    | 3   ; $FE46
    .byte LEFT_4    | 3   ; $FE47
    .byte LEFT_3    | 3   ; $FE48
    .byte LEFT_2    | 3   ; $FE49
    .byte LEFT_1    | 3   ; $FE4A
    .byte NO_MOTION | 3   ; $FE4B
    .byte RIGHT_1   | 3   ; $FE4C
    .byte RIGHT_2   | 3   ; $FE4D
    .byte RIGHT_3   | 3   ; $FE4E
    .byte RIGHT_4   | 3   ; $FE4F
    .byte RIGHT_5   | 3   ; $FE50
    .byte RIGHT_6   | 3   ; $FE51
    .byte RIGHT_7   | 3   ; $FE52
    .byte LEFT_7    | 4   ; $FE53
    .byte LEFT_6    | 4   ; $FE54
    .byte LEFT_5    | 4   ; $FE55
    .byte LEFT_4    | 4   ; $FE56
    .byte LEFT_3    | 4   ; $FE57
    .byte LEFT_2    | 4   ; $FE58
    .byte LEFT_1    | 4   ; $FE59
    .byte NO_MOTION | 4   ; $FE5A
    .byte RIGHT_1   | 4   ; $FE5B
    .byte RIGHT_2   | 4   ; $FE5C
    .byte RIGHT_3   | 4   ; $FE5D
    .byte RIGHT_4   | 4   ; $FE5E
    .byte RIGHT_5   | 4   ; $FE5F
    .byte RIGHT_6   | 4   ; $FE60
    .byte RIGHT_7   | 4   ; $FE61
    .byte LEFT_7    | 5   ; $FE62
    .byte LEFT_6    | 5   ; $FE63
    .byte LEFT_5    | 5   ; $FE64
    .byte LEFT_4    | 5   ; $FE65
    .byte LEFT_3    | 5   ; $FE66
    .byte LEFT_2    | 5   ; $FE67
    .byte LEFT_1    | 5   ; $FE68
    .byte NO_MOTION | 5   ; $FE69
    .byte RIGHT_1   | 5   ; $FE6A
    .byte RIGHT_2   | 5   ; $FE6B
    .byte RIGHT_3   | 5   ; $FE6C
    .byte RIGHT_4   | 5   ; $FE6D
    .byte RIGHT_5   | 5   ; $FE6E
    .byte RIGHT_6   | 5   ; $FE6F
    .byte RIGHT_7   | 5   ; $FE70
    .byte LEFT_7    | 6   ; $FE71
    .byte LEFT_6    | 6   ; $FE72
    .byte LEFT_5    | 6   ; $FE73
    .byte LEFT_4    | 6   ; $FE74
    .byte LEFT_3    | 6   ; $FE75
    .byte LEFT_2    | 6   ; $FE76
    .byte LEFT_1    | 6   ; $FE77
    .byte NO_MOTION | 6   ; $FE78
    .byte RIGHT_1   | 6   ; $FE79
    .byte RIGHT_2   | 6   ; $FE7A
    .byte RIGHT_3   | 6   ; $FE7B
    .byte RIGHT_4   | 6   ; $FE7C
    .byte RIGHT_5   | 6   ; $FE7D
    .byte RIGHT_6   | 6   ; $FE7E
    .byte RIGHT_7   | 6   ; $FE7F
    .byte LEFT_7    | 7   ; $FE80
    .byte LEFT_6    | 7   ; $FE81
    .byte LEFT_5    | 7   ; $FE82
    .byte LEFT_4    | 7   ; $FE83
    .byte LEFT_3    | 7   ; $FE84
    .byte LEFT_2    | 7   ; $FE85
    .byte LEFT_1    | 7   ; $FE86
    .byte NO_MOTION | 7   ; $FE87
    .byte RIGHT_1   | 7   ; $FE88
    .byte RIGHT_2   | 7   ; $FE89
    .byte RIGHT_3   | 7   ; $FE8A
    .byte RIGHT_4   | 7   ; $FE8B
    .byte RIGHT_5   | 7   ; $FE8C
    .byte RIGHT_6   | 7   ; $FE8D
    .byte RIGHT_7   | 7   ; $FE8E
    .byte LEFT_7    | 8   ; $FE8F
    .byte LEFT_6    | 8   ; $FE90
    .byte LEFT_5    | 8   ; $FE91
    .byte LEFT_4    | 8   ; $FE92
    .byte LEFT_3    | 8   ; $FE93
    .byte LEFT_2    | 8   ; $FE94
    .byte LEFT_1    | 8   ; $FE95
    .byte NO_MOTION | 8   ; $FE96
    .byte RIGHT_1   | 8   ; $FE97
    .byte RIGHT_2   | 8   ; $FE98
    .byte RIGHT_3   | 8   ; $FE99
    .byte RIGHT_4   | 8   ; $FE9A
    .byte RIGHT_5   | 8   ; $FE9B
    .byte RIGHT_6   | 8   ; $FE9C
    .byte RIGHT_7   | 8   ; $FE9D
    .byte LEFT_7    | 9   ; $FE9E
    .byte LEFT_6    | 9   ; $FE9F
    .byte LEFT_5    | 9   ; $FEA0
    .byte LEFT_4    | 9   ; $FEA1
    .byte LEFT_3    | 9   ; $FEA2
    .byte LEFT_2    | 9   ; $FEA3
    .byte LEFT_1    | 9   ; $FEA4
    .byte NO_MOTION | 9   ; $FEA5
    .byte RIGHT_1   | 9   ; $FEA6
    .byte RIGHT_2   | 9   ; $FEA7
    .byte RIGHT_3   | 9   ; $FEA8
    .byte RIGHT_4   | 9   ; $FEA9
    .byte RIGHT_5   | 9   ; $FEAA
    .byte RIGHT_6   | 9   ; $FEAB
    .byte RIGHT_7   | 9   ; $FEAC
    .byte LEFT_7    | 10  ; $FEAD
    .byte LEFT_6    | 10  ; $FEAE
    .byte LEFT_5    | 10  ; $FEAF
    .byte LEFT_4    | 10  ; $FEB0
    .byte LEFT_3    | 10  ; $FEB1
    .byte LEFT_2    | 10  ; $FEB2
    .byte LEFT_1    | 10  ; $FEB3
    .byte NO_MOTION | 10  ; $FEB4
    .byte RIGHT_1   | 10  ; $FEB5
    .byte RIGHT_2   | 10  ; $FEB6
    .byte RIGHT_3   | 10  ; $FEB7
    .byte RIGHT_4   | 10  ; $FEB8
    .byte RIGHT_5   | 10  ; $FEB9
    .byte RIGHT_6   | 10  ; $FEBA
    .byte RIGHT_7   | 10  ; $FEBB
    .byte LEFT_7    | 11  ; $FEBC
    .byte LEFT_6    | 11  ; $FEBD
    .byte LEFT_5    | 11  ; $FEBE
    .byte LEFT_4    | 11  ; $FEBF
    .byte LEFT_3    | 11  ; $FEC0
    .byte LEFT_2    | 11  ; $FEC1
    .byte LEFT_1    | 11  ; $FEC2
    .byte NO_MOTION | 11  ; $FEC3
    .byte RIGHT_1   | 11  ; $FEC4
    .byte RIGHT_2   | 11  ; $FEC5
    .byte RIGHT_3   | 11  ; $FEC6
    .byte RIGHT_4   | 11  ; $FEC7
    .byte RIGHT_5   | 11  ; $FEC8
    .byte RIGHT_6   | 11  ; $FEC9
    .byte RIGHT_7   | 11  ; $FECA
    .byte LEFT_7    | 12  ; $FECB
    .byte LEFT_6    | 12  ; $FECC
    .byte LEFT_5    | 12  ; $FECD
    .byte LEFT_4    | 12  ; $FECE
    .byte LEFT_3    | 12  ; $FECF
    .byte LEFT_2    | 12  ; $FED0
    .byte LEFT_1    | 12  ; $FED1
    .byte NO_MOTION | 12  ; $FED2
    .byte RIGHT_1   | 12  ; $FED3
    .byte RIGHT_2   | 12  ; $FED4
    .byte RIGHT_3   | 12  ; $FED5
    .byte RIGHT_4   | 12  ; $FED6
    .byte RIGHT_5   | 12  ; $FED7
    .byte RIGHT_6   | 12  ; $FED8
    .byte RIGHT_7   | 12  ; $FED9
    .byte LEFT_7    | 13  ; $FEDA
    .byte LEFT_6    | 13  ; $FEDB
    .byte LEFT_5    | 13  ; $FEDC
    .byte LEFT_4    | 13  ; $FEDD
    .byte LEFT_3    | 13  ; $FEDE
    .byte LEFT_2    | 13  ; $FEDF
    .byte LEFT_1    | 13  ; $FEE0
    .byte NO_MOTION | 13  ; $FEE1
    .byte RIGHT_1   | 13  ; $FEE2
    .byte RIGHT_2   | 13  ; $FEE3
    .byte RIGHT_3   | 13  ; $FEE4
LFEE5:
    .byte 1     ; $FEE5  addition table
    .byte 1     ; $FEE6
    .byte 0     ; $FEE7
    .byte -1    ; $FEE8
    .byte -1    ; $FEE9
    .byte -1    ; $FEEA
    .byte 0     ; $FEEB
    .byte 1     ; $FEEC
LFEED:
    .byte 0     ; $FEED  addition table
    .byte -1    ; $FEEE
    .byte -1    ; $FEEF
    .byte -1    ; $FEF0
    .byte 0     ; $FEF1
    .byte 1     ; $FEF2
    .byte 1     ; $FEF3
    .byte 1     ; $FEF4
LFEF5:
    .byte <Zero          ; $FEF5
    .byte <One           ; $FEF6
    .byte <Two           ; $FEF7
    .byte <Three         ; $FEF8
    .byte <Four          ; $FEF9
    .byte <Five          ; $FEFA
    .byte <Six           ; $FEFB
    .byte <Seven         ; $FEFC
    .byte <Eight         ; $FEFD
    .byte <Nine          ; $FEFE
    .byte <BlankDigit    ; $FEFF
Zero:
    .byte $3C ; |  XXXX  | $FF00
    .byte $42 ; | X    X | $FF01
    .byte $42 ; | X    X | $FF02
    .byte $42 ; | X    X | $FF03
    .byte $42 ; | X    X | $FF04
    .byte $42 ; | X    X | $FF05
    .byte $42 ; | X    X | $FF06
    .byte $42 ; | X    X | $FF07
    .byte $3C ; |  XXXX  | $FF08
One:
    .byte $1C ; |   XXX  | $FF09
    .byte $08 ; |    X   | $FF0A
    .byte $08 ; |    X   | $FF0B
    .byte $08 ; |    X   | $FF0C
    .byte $08 ; |    X   | $FF0D
    .byte $08 ; |    X   | $FF0E
    .byte $08 ; |    X   | $FF0F
    .byte $08 ; |    X   | $FF10
    .byte $18 ; |   XX   | $FF11
Two:
    .byte $7E ; | XXXXXX | $FF12
    .byte $40 ; | X      | $FF13
    .byte $40 ; | X      | $FF14
    .byte $40 ; | X      | $FF15
    .byte $3C ; |  XXXX  | $FF16
    .byte $02 ; |      X | $FF17
    .byte $02 ; |      X | $FF18
    .byte $42 ; | X    X | $FF19
    .byte $3C ; |  XXXX  | $FF1A
Three:
    .byte $3C ; |  XXXX  | $FF1B
    .byte $42 ; | X    X | $FF1C
    .byte $02 ; |      X | $FF1D
    .byte $02 ; |      X | $FF1E
    .byte $1C ; |   XXX  | $FF1F
    .byte $02 ; |      X | $FF20
    .byte $02 ; |      X | $FF21
    .byte $42 ; | X    X | $FF22
    .byte $3C ; |  XXXX  | $FF23
Four:
    .byte $04 ; |     X  | $FF24
    .byte $04 ; |     X  | $FF25
    .byte $04 ; |     X  | $FF26
    .byte $7E ; | XXXXXX | $FF27
    .byte $44 ; | X   X  | $FF28
    .byte $24 ; |  X  X  | $FF29
    .byte $14 ; |   X X  | $FF2A
    .byte $0C ; |    XX  | $FF2B
    .byte $04 ; |     X  | $FF2C
Five:
    .byte $3C ; |  XXXX  | $FF2D
    .byte $42 ; | X    X | $FF2E
    .byte $02 ; |      X | $FF2F
    .byte $02 ; |      X | $FF30
    .byte $3C ; |  XXXX  | $FF31
    .byte $40 ; | X      | $FF32
    .byte $40 ; | X      | $FF33
    .byte $40 ; | X      | $FF34
    .byte $7E ; | XXXXXX | $FF35
Six:
    .byte $3C ; |  XXXX  | $FF36
    .byte $42 ; | X    X | $FF37
    .byte $42 ; | X    X | $FF38
    .byte $42 ; | X    X | $FF39
    .byte $7C ; | XXXXX  | $FF3A
    .byte $40 ; | X      | $FF3B
    .byte $40 ; | X      | $FF3C
    .byte $42 ; | X    X | $FF3D
    .byte $3C ; |  XXXX  | $FF3E
Seven:
    .byte $20 ; |  X     | $FF3F
    .byte $20 ; |  X     | $FF40
    .byte $20 ; |  X     | $FF41
    .byte $10 ; |   X    | $FF42
    .byte $10 ; |   X    | $FF43
    .byte $08 ; |    X   | $FF44
    .byte $04 ; |     X  | $FF45
    .byte $02 ; |      X | $FF46
    .byte $7E ; | XXXXXX | $FF47
Eight:
    .byte $3C ; |  XXXX  | $FF48
    .byte $42 ; | X    X | $FF49
    .byte $42 ; | X    X | $FF4A
    .byte $42 ; | X    X | $FF4B
    .byte $3C ; |  XXXX  | $FF4C
    .byte $42 ; | X    X | $FF4D
    .byte $42 ; | X    X | $FF4E
    .byte $42 ; | X    X | $FF4F
    .byte $3C ; |  XXXX  | $FF50
Nine:
    .byte $3C ; |  XXXX  | $FF51
    .byte $42 ; | X    X | $FF52
    .byte $02 ; |      X | $FF53
    .byte $02 ; |      X | $FF54
    .byte $3E ; |  XXXXX | $FF55
    .byte $42 ; | X    X | $FF56
    .byte $42 ; | X    X | $FF57
    .byte $42 ; | X    X | $FF58
    .byte $3C ; |  XXXX  | $FF59
BlankDigit:
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
LFF63:
    .byte $40   ; $FF63  colors
    .byte $40   ; $FF64
    .byte $40   ; $FF65
    .byte $40   ; $FF66
    .byte $42   ; $FF67
    .byte $44   ; $FF68
    .byte $46   ; $FF69
    .byte $44   ; $FF6A
    .byte $42   ; $FF6B
    .byte $40   ; $FF6C
LFF6D:
    .byte $E2   ; $FF6D  colors
    .byte $E2   ; $FF6E
    .byte $E2   ; $FF6F
    .byte $E4   ; $FF70
    .byte $E6   ; $FF71
    .byte $E6   ; $FF72
    .byte $E4   ; $FF73
    .byte $E4   ; $FF74
    .byte $E2   ; $FF75
    .byte $E2   ; $FF76
LFF77:
    .byte $22   ; $FF77  colors
    .byte $22   ; $FF78
    .byte $24   ; $FF79
    .byte $24   ; $FF7A
    .byte $26   ; $FF7B
    .byte $28   ; $FF7C
    .byte $26   ; $FF7D
    .byte $24   ; $FF7E
    .byte $22   ; $FF7F
    .byte $22   ; $FF80
LFF81:
    .byte 0     ; $FF81  addition table
    .byte 1     ; $FF82
    .byte 2     ; $FF83
    .byte 2     ; $FF84
    .byte 2     ; $FF85
    .byte 2     ; $FF86
    .byte 2     ; $FF87
    .byte 1     ; $FF88
    .byte 0     ; $FF89
    .byte -1    ; $FF8A
    .byte -2    ; $FF8B
    .byte -2    ; $FF8C
    .byte -2    ; $FF8D
    .byte -2    ; $FF8E
    .byte -2    ; $FF8F
    .byte -1    ; $FF90
LFF91:
    .byte -3    ; $FF91  addition table
    .byte -3    ; $FF92
    .byte -2    ; $FF93
    .byte -1    ; $FF94
    .byte 0     ; $FF95
    .byte 1     ; $FF96
    .byte 2     ; $FF97
    .byte 3     ; $FF98
    .byte 3     ; $FF99
    .byte 3     ; $FF9A
    .byte 2     ; $FF9B
    .byte 1     ; $FF9C
    .byte 0     ; $FF9D
    .byte -1    ; $FF9E
    .byte -2    ; $FF9F
    .byte -3    ; $FFA0
LFFA1:
    .byte $35   ; $FFA1
    .byte $35   ; $FFA2
    .byte $9B   ; $FFA3
    .byte $9B   ; $FFA4
LFFA5:
    .byte $60   ; $FFA5
    .byte $01   ; $FFA6
    .byte $60   ; $FFA7
    .byte $01   ; $FFA8
LFFA9:
    .byte $06   ; $FFA9
    .byte $0B   ; $FFAA
    .byte $05   ; $FFAB
    .byte $09   ; $FFAC
    .byte $04   ; $FFAD
    .byte $06   ; $FFAE
    .byte $03   ; $FFAF
    .byte $04   ; $FFB0
    .byte $02   ; $FFB1
    .byte $02   ; $FFB2
LFFB3:
    .byte $00   ; $FFB3   ship pointers??
    .byte $0A   ; $FFB4
    .byte $14   ; $FFB5
    .byte $1E   ; $FFB6
    .byte $28   ; $FFB7
    .byte $32   ; $FFB8
    .byte $3C   ; $FFB9
    .byte $46   ; $FFBA
    .byte $50   ; $FFBB
    .byte $5A   ; $FFBC
    .byte $64   ; $FFBD
    .byte $6E   ; $FFBE
    .byte $78   ; $FFBF
    .byte $82   ; $FFC0
    .byte $8C   ; $FFC1
    .byte $96   ; $FFC2

    .byte $4D   ; $FFC3

    .byte $00 ; |        | $FFC4
    .byte $60 ; | XX     | $FFC5
    .byte $F0 ; |XXXX    | $FFC6
    .byte $60 ; | XX     | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $40 ; | X      | $FFC9
    .byte $E0 ; |XXX     | $FFCA
    .byte $40 ; | X      | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $A0 ; |X X     | $FFCD
    .byte $40 ; | X      | $FFCE
    .byte $A0 ; |X X     | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $38 ; |  XXX   | $FFD1
    .byte $78 ; | XXXX   | $FFD2
    .byte $F0 ; |XXXX    | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $60 ; | XX     | $FFD5
    .byte $90 ; |X  X    | $FFD6
    .byte $60 ; | XX     | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $A0 ; |X X     | $FFD9
    .byte $E0 ; |XXX     | $FFDA
    .byte $40 ; | X      | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $80 ; |X       | $FFDD
    .byte $C0 ; |XX      | $FFDE
    .byte $E0 ; |XXX     | $FFDF
    .byte $00 ; |        | $FFE0
    .byte $60 ; | XX     | $FFE1
    .byte $C0 ; |XX      | $FFE2
    .byte $60 ; | XX     | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $E0 ; |XXX     | $FFE5
    .byte $C0 ; |XX      | $FFE6
    .byte $80 ; |X       | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $40 ; | X      | $FFE9
    .byte $E0 ; |XXX     | $FFEA
    .byte $A0 ; |X X     | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $E0 ; |XXX     | $FFED
    .byte $60 ; | XX     | $FFEE
    .byte $20 ; |  X     | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $C0 ; |XX      | $FFF1
    .byte $60 ; | XX     | $FFF2
    .byte $C0 ; |XX      | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $20 ; |  X     | $FFF5
    .byte $60 ; | XX     | $FFF6
    .byte $E0 ; |XXX     | $FFF7

       ORG $2FF8
      RORG $FFF8

    .byte $5F   ; $FFF8
    .byte $73   ; $FFF9

LFFFA:
    .byte $0E   ; $FFFA  AUDF1
    .byte $1D   ; $FFFB

    .word START_1   ; reset
    .word START_1   ; break