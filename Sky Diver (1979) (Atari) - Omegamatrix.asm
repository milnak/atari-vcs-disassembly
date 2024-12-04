; Disassembly of Sky2.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: limit -cSky.cfg Sky2.bin 
;
; Sky.cfg contents:
;
;      ORG F000
;      CODE F000 F5F8
;      GFX F5F9 F633
;      CODE F634 F6FB
;      GFX F6FC F7FF
      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUBK  =  $09
CTRLPF  =  $0A
REFP1   =  $0C
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x0
ram_81             ds 1  ; x2
ram_82             ds 1  ; x3
ram_83             ds 1  ; x10
ram_84             ds 1  ; x1
ram_85             ds 1  ; x2
ram_86             ds 1  ; x1
ram_87             ds 1  ; x5
ram_88             ds 1  ; x1
ram_89             ds 2  ; x7
ram_8B             ds 2  ; x2
ram_8D             ds 2  ; x2
ram_8F             ds 1  ; x2
ram_90             ds 1  ; x1
ram_91             ds 1  ; x2
ram_92             ds 1  ; x4
ram_93             ds 1  ; x1
ram_94             ds 2  ; x3
ram_96             ds 1  ; x11
ram_97             ds 1  ; x1
ram_98             ds 2  ; x1
ram_9A             ds 2  ; x4
ram_9C             ds 2  ; x3
ram_9E             ds 2  ; x3
ram_A0             ds 1  ; x18
ram_A1             ds 1  ; x10
ram_A2             ds 1  ; x3
ram_A3             ds 1  ; x2
ram_A4             ds 1  ; x3
ram_A5             ds 1  ; x2
ram_A6             ds 1  ; x8
ram_A7             ds 1  ; x3
ram_A8             ds 1  ; x3
ram_A9             ds 1  ; x4
ram_AA             ds 1  ; x7
ram_AB             ds 1  ; x11
ram_AC             ds 1  ; x6
ram_AD             ds 2  ; x3
ram_AF             ds 1  ; x5
ram_B0             ds 1  ; x2
ram_B1             ds 1  ; x4
ram_B2             ds 1  ; x1
ram_B3             ds 1  ; x2
ram_B4             ds 1  ; x1
ram_B5             ds 1  ; x3
ram_B6             ds 1  ; x4
ram_B7             ds 1  ; x2
ram_B8             ds 1  ; x2
ram_B9             ds 1  ; x3
ram_BA             ds 1  ; x4
ram_BB             ds 2  ; x2
ram_BD             ds 1  ; x6
ram_BE             ds 1  ; x2
ram_BF             ds 1  ; x3
ram_C0             ds 2  ; x6
ram_C2             ds 1  ; x3
ram_C3             ds 1  ; x2
ram_C4             ds 2  ; x6
ram_C6             ds 2  ; x5
ram_C8             ds 1  ; x6
ram_C9             ds 1  ; x2
ram_CA             ds 1  ; x3
ram_CB             ds 1  ; x1
ram_CC             ds 2  ; x5
ram_CE             ds 2  ; x4
ram_D0             ds 2  ; x4
ram_D2             ds 2  ; x3
ram_D4             ds 2  ; x5
ram_D6             ds 1  ; x3
ram_D7             ds 41 ; x8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
LF005:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF005                 ; 2³
    dex                          ; 2
    txs                          ; 2
    stx    ram_BD                ; 3
    stx    ram_A9                ; 3
    stx    ram_C2                ; 3
    jsr    LF665                 ; 6
LF015:
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$2E                  ; 2
    sta    TIM64T                ; 4
    clc                          ; 2
    lda    ram_AC                ; 3
    adc    #$01                  ; 2
    sta    ram_AC                ; 3
    bcc    LF037                 ; 2³
    inc    ram_C3                ; 5
LF037:
    lda    SWCHB                 ; 4
    ldx    #$07                  ; 2
    ldy    #$09                  ; 2
    and    #$08                  ; 2
    beq    LF046                 ; 2³
    ldx    #$F7                  ; 2
    ldy    #$04                  ; 2
LF046:
    lda    ram_BD                ; 3
    bmi    LF04C                 ; 2³
    ldx    #$FF                  ; 2
LF04C:
    and    ram_C3                ; 3
    sta    ram_A1                ; 3
    stx    ram_A0                ; 3
    ldx    #$03                  ; 2
LF054:
    lda    LF5FE,Y               ; 4
    eor    ram_A1                ; 3
    and    ram_A0                ; 3
    sta    COLUP0,X              ; 4
    cpx    #$02                  ; 2
    bne    LF063                 ; 2³
    sta    ram_B7                ; 3
LF063:
    dey                          ; 2
    dex                          ; 2
    bpl    LF054                 ; 2³
    lda    LF5FE,Y               ; 4
    eor    ram_A1                ; 3
    and    ram_A0                ; 3
    sta    ram_B8                ; 3
    lda    ram_A6                ; 3
    lsr                          ; 2
    bcc    LF079                 ; 2³
    lda    #$C0                  ; 2
    bne    LF07C                 ; 2³
LF079:
    lda    SWCHB                 ; 4
LF07C:
    ldx    #$01                  ; 2
LF07E:
    asl                          ; 2
    bcc    LF086                 ; 2³
    ldy    LF7FE,X               ; 4
    bcs    LF089                 ; 2³
LF086:
    ldy    LF77E,X               ; 4
LF089:
    sty    ram_9A,X              ; 4
    dex                          ; 2
    bpl    LF07E                 ; 2³
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF0BE                 ; 2³
    lda    #$00                  ; 2
    ldx    #$BD                  ; 2
LF098:
    sta    0,X                   ; 4
    inx                          ; 2
    cpx    #$D9                  ; 2
    bne    LF098                 ; 2³
    ldx    #$01                  ; 2
LF0A1:
    jsr    LF64B                 ; 6
    lda    #$FF                  ; 2
    sta    ram_83,X              ; 4
    lda    #$F8                  ; 2
    sta    ram_87,X              ; 4
    dex                          ; 2
    bpl    LF0A1                 ; 2³
    lda    #$08                  ; 2
    sta    ram_B6                ; 3
    lda    ram_A6                ; 3
    bne    LF0F4                 ; 2³
    lda    ram_AA                ; 3
    jsr    LF658                 ; 6
    bcc    LF0F4                 ; 2³
LF0BE:
    lsr                          ; 2
    lda    #$FF                  ; 2
    bcc    LF0C7                 ; 2³
    sta    ram_A9                ; 3
    bmi    LF0F4                 ; 2³
LF0C7:
    sta    ram_BD                ; 3
    sta    ram_C2                ; 3
    lda    ram_A9                ; 3
    bmi    LF0D5                 ; 2³
    eor    ram_AC                ; 3
    and    #$1F                  ; 2
    bne    LF0F4                 ; 2³
LF0D5:
    lda    ram_AC                ; 3
    and    #$1F                  ; 2
    sta    ram_A9                ; 3
    inc    ram_A7                ; 5
    sed                          ; 2
    clc                          ; 2
    lda    ram_A8                ; 3
    adc    #$01                  ; 2
    sta    ram_A8                ; 3
    sta    ram_D7                ; 3
    cld                          ; 2
    cmp    #$06                  ; 2
    beq    LF0F1                 ; 2³
    jsr    LF66D                 ; 6
    bne    LF0F4                 ; 2³
LF0F1:
    jsr    LF665                 ; 6
LF0F4:
    lda    ram_D6                ; 3
    eor    #$01                  ; 2
    tax                          ; 2
    sta    ram_D6                ; 3
    lda    ram_A6                ; 3
    bpl    LF125                 ; 2³+1
    lda    ram_C8                ; 3
    jsr    LF6AF                 ; 6
    lda    ram_AC                ; 3
    and    #$07                  ; 2
    bne    LF154                 ; 2³
    ldy    ram_B9                ; 3
    iny                          ; 2
    cpy    #$18                  ; 2
    bcc    LF113                 ; 2³
    ldy    #$00                  ; 2
LF113:
    sty    ram_B9                ; 3
    lda    #$0C                  ; 2
    sec                          ; 2
    sbc    ram_B9                ; 3
    bpl    LF121                 ; 2³
    sec                          ; 2
    eor    #$FF                  ; 2
    adc    #$00                  ; 2
LF121:
    sta    ram_AF                ; 3
    bpl    LF154                 ; 2³
LF125:
    lda    ram_AC                ; 3
    and    #$7F                  ; 2
    bne    LF154                 ; 2³
    lsr    ram_AA                ; 5
    rol                          ; 2
    eor    ram_AA                ; 3
    lsr                          ; 2
    lda    ram_AA                ; 3
    bcs    LF139                 ; 2³
    ora    #$40                  ; 2
    sta    ram_AA                ; 3
LF139:
    lsr                          ; 2
    lda    ram_C8                ; 3
    bcs    LF148                 ; 2³
    cmp    #$FA                  ; 2
    beq    LF14F                 ; 2³
    sec                          ; 2
    sbc    #$02                  ; 2
    jmp    LF14F                 ; 3

LF148:
    cmp    #$06                  ; 2
    beq    LF14F                 ; 2³
    clc                          ; 2
    adc    #$02                  ; 2
LF14F:
    sta    ram_C8                ; 3
    jsr    LF6AF                 ; 6
LF154:
    lda    #$00                  ; 2
    sta    AUDC0,X               ; 4
    sta    ram_AB                ; 3
    lda    ram_BD                ; 3
    bmi    LF1BD                 ; 2³
    lda    ram_CC,X              ; 4
    bne    LF175                 ; 2³
    lda    ram_C9                ; 3
    bmi    LF16B                 ; 2³
    inc    ram_C9                ; 5
    jmp    LF3E5                 ; 3

LF16B:
    lda    #$01                  ; 2
    sta    AUDC0,X               ; 4
    sta    AUDV0,X               ; 4
    lda    #$1B                  ; 2
    sta    AUDF0,X               ; 4
LF175:
    clc                          ; 2
    lda    ram_BE                ; 3
    adc    #$01                  ; 2
    sta    ram_BE                ; 3
    lda    ram_BF                ; 3
    adc    #$00                  ; 2
    sta    ram_BF                ; 3
    cmp    #$02                  ; 2
    bne    LF1C6                 ; 2³
    ldx    #$01                  ; 2
LF188:
    ldy    #$00                  ; 2
    sty    ram_C4,X              ; 4
    sty    ram_CC,X              ; 4
    sty    ram_CE,X              ; 4
    sty    ram_BF                ; 3
    dey                          ; 2
    sty    ram_83,X              ; 4
    jsr    LF64B                 ; 6
    dex                          ; 2
    bpl    LF188                 ; 2³
    ldx    ram_D6                ; 3
    dec    ram_B6                ; 5
    bmi    LF1C0                 ; 2³
    lda    ram_A6                ; 3
    bmi    LF1BD                 ; 2³
    lda    ram_AA                ; 3
    and    #$07                  ; 2
    beq    LF1B4                 ; 2³
    sec                          ; 2
    sbc    #$04                  ; 2
    asl                          ; 2
    sta    ram_C8                ; 3
    jsr    LF6AF                 ; 6
LF1B4:
    lda    ram_A6                ; 3
    bne    LF1BD                 ; 2³
    lda    ram_AA                ; 3
    jsr    LF658                 ; 6
LF1BD:
    jmp    LF3C6                 ; 3

LF1C0:
    lda    #$FF                  ; 2
    sta    ram_BD                ; 3
    bmi    LF1BD                 ; 2³
LF1C6:
    lda    ram_C4,X              ; 4
    beq    LF246                 ; 2³+1
    bpl    LF200                 ; 2³+1
    ldy    ram_C0,X              ; 4
    bmi    LF1DF                 ; 2³
    lda    LF607,Y               ; 4
    sta    AUDV0,X               ; 4
    lda    #$08                  ; 2
    sta    AUDC0,X               ; 4
    lda    #$0F                  ; 2
    sta    AUDF0,X               ; 4
    dec    ram_C0,X              ; 6
LF1DF:
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda.wy ram_96,Y              ; 4
    cmp    #$20                  ; 2
    beq    LF1FD                 ; 2³
    lda    ram_D7,X              ; 4
    beq    LF1F4                 ; 2³
    sed                          ; 2
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_D7,X              ; 4
    cld                          ; 2
LF1F4:
    lda.wy ram_96,Y              ; 4
    clc                          ; 2
    adc    #$08                  ; 2
    sta.wy ram_96,Y              ; 5
LF1FD:
    jmp    LF3C6                 ; 3

LF200:
    asl                          ; 2
    bpl    LF230                 ; 2³
    lda    ram_A6                ; 3
    bpl    LF211                 ; 2³
    jsr    LF634                 ; 6
    lda    ram_B1,X              ; 4
    clc                          ; 2
    adc    ram_BB,X              ; 4
    sta    ram_89,X              ; 4
LF211:
    lda    ram_D0,X              ; 4
    beq    LF230                 ; 2³
    lsr                          ; 2
    bcc    LF22E                 ; 2³
    lda    #$0C                  ; 2
    sta    AUDC0,X               ; 4
    lda    #$08                  ; 2
    sta    AUDV0,X               ; 4
    lda    LF7F1,X               ; 4
    sta    AUDF0,X               ; 4
    sed                          ; 2
    lda    ram_D7,X              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_D7,X              ; 4
    cld                          ; 2
LF22E:
    dec    ram_D0,X              ; 6
LF230:
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda.wy ram_96,Y              ; 4
    cmp    #$68                  ; 2
    beq    LF243                 ; 2³
    lda.wy ram_96,Y              ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta.wy ram_96,Y              ; 5
LF243:
    jmp    LF3C6                 ; 3

LF246:
    lda    ram_CC,X              ; 4
    bne    LF24D                 ; 2³
    jmp    LF2F3                 ; 3

LF24D:
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    cpx    #$00                  ; 2
    bne    LF25A                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF25A:
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_CE,X              ; 4
    bne    LF2BF                 ; 2³
    tya                          ; 2
    and    #$02                  ; 2
    beq    LF286                 ; 2³
    lda    ram_83,X              ; 4
    cmp    #$5A                  ; 2
    bcs    LF286                 ; 2³
    sta    ram_D2,X              ; 4
    lda    #$01                  ; 2
    sta    ram_9C,X              ; 4
    sta    ram_CE,X              ; 4
    lda    #$04                  ; 2
    sta    ram_C0,X              ; 4
    lda    #$F0                  ; 2
    sta    ram_87,X              ; 4
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #$28                  ; 2
    sta.wy ram_96,Y              ; 5
    bne    LF2BC                 ; 2³
LF286:
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda.wy ram_96,Y              ; 4
    cmp    #$00                  ; 2
    bne    LF294                 ; 2³
    lda    #$08                  ; 2
    bne    LF296                 ; 2³
LF294:
    lda    #$00                  ; 2
LF296:
    sta.wy ram_96,Y              ; 5
    lda    ram_AD,X              ; 4
    beq    LF2BC                 ; 2³
    cpx    #$00                  ; 2
    beq    LF2A7                 ; 2³
    sec                          ; 2
    sbc    #$01                  ; 2
    clc                          ; 2
    bpl    LF2AB                 ; 2³
LF2A7:
    clc                          ; 2
    adc    #$01                  ; 2
    sec                          ; 2
LF2AB:
    sta    ram_AD,X              ; 4
    beq    LF2BC                 ; 2³
    ror                          ; 2
    bmi    LF2B5                 ; 2³
    lsr                          ; 2
    bpl    LF2B7                 ; 2³
LF2B5:
    sec                          ; 2
    ror                          ; 2
LF2B7:
    clc                          ; 2
    adc    ram_AB                ; 3
    sta    ram_AB                ; 3
LF2BC:
    jmp    LF326                 ; 3

LF2BF:
    tya                          ; 2
    and    #$04                  ; 2
    beq    LF2CE                 ; 2³
    sec                          ; 2
    lda    ram_AB                ; 3
    sbc    ram_9E                ; 3
    sta    ram_AB                ; 3
    jmp    LF2DA                 ; 3

LF2CE:
    tya                          ; 2
    and    #$08                  ; 2
    beq    LF2DA                 ; 2³
    clc                          ; 2
    lda    ram_AB                ; 3
    adc    ram_9E                ; 3
    sta    ram_AB                ; 3
LF2DA:
    lda    ram_C8                ; 3
    clc                          ; 2
    adc    ram_AB                ; 3
    sta    ram_AB                ; 3
    ldy    ram_C0,X              ; 4
    bmi    LF2F0                 ; 2³
    lda    LF7F3,Y               ; 4
    sta    AUDV0,X               ; 4
    lda    #$08                  ; 2
    sta    AUDC0,X               ; 4
    dec    ram_C0,X              ; 6
LF2F0:
    jmp    LF326                 ; 3

LF2F3:
    lda    INPT4,X               ; 4
    bmi    LF366                 ; 2³+1
    ldy    #$00                  ; 2
    sty    ram_C6,X              ; 4
    iny                          ; 2
    sty    ram_83,X              ; 4
    lda    ram_D4,X              ; 4
    clc                          ; 2
    adc    #$04                  ; 2
    clc                          ; 2
    adc    ram_9A,X              ; 4
    sta    ram_89,X              ; 4
    lda    ram_9A,X              ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_AD,X              ; 4
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #$00                  ; 2
    sta.wy ram_96,Y              ; 5
    lda    #$F8                  ; 2
    sta    ram_87,X              ; 4
    lda    #$03                  ; 2
    sta    ram_9C,X              ; 4
    sta    ram_CC,X              ; 4
    jmp    LF3C6                 ; 3

LF326:
    clc                          ; 2
    lda    ram_83,X              ; 4
    cmp    #$FF                  ; 2
    beq    LF38D                 ; 2³
    lda    ram_CE,X              ; 4
    beq    LF375                 ; 2³
    lda    ram_83,X              ; 4
    cmp    #$6E                  ; 2
    bcc    LF389                 ; 2³
    lda    ram_89,X              ; 4
    cmp    ram_B1,X              ; 4
    bcc    LF369                 ; 2³
    cmp    ram_B3,X              ; 4
    bcs    LF369                 ; 2³
    lda    ram_A6                ; 3
    lsr                          ; 2
    bcc    LF351                 ; 2³
    txa                          ; 2
    eor    #$01                  ; 2
    tay                          ; 2
    lda.wy ram_C4,Y              ; 4
    cmp    #$40                  ; 2
    beq    LF369                 ; 2³
LF351:
    lda    #$40                  ; 2
    sta    ram_C4,X              ; 4
    lda    ram_89,X              ; 4
    sec                          ; 2
    sbc    ram_B1,X              ; 4
    sta    ram_BB,X              ; 4
    lda    ram_D2,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_D0,X              ; 4
    lda    #$00                  ; 2
    sta    ram_D2,X              ; 4
LF366:
    jmp    LF3C6                 ; 3

LF369:
    lda    #$01                  ; 2
    sta    ram_C4,X              ; 4
    lda    #$09                  ; 2
    sta    AUDC0,X               ; 4
    sta    AUDV0,X               ; 4
    bne    LF366                 ; 2³
LF375:
    lda    ram_83,X              ; 4
    cmp    #$7A                  ; 2
    bcc    LF389                 ; 2³
    lda    #$80                  ; 2
    sta    ram_C4,X              ; 4
    lda    #$0A                  ; 2
    sta    ram_D0,X              ; 4
    lda    #$04                  ; 2
    sta    ram_C0,X              ; 4
    bne    LF366                 ; 2³
LF389:
    adc    ram_9C,X              ; 4
    sta    ram_83,X              ; 4
LF38D:
    clc                          ; 2
    lda    ram_C6,X              ; 4
    adc    ram_AB                ; 3
    sta    ram_C6,X              ; 4
    bmi    LF39B                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bpl    LF3A4                 ; 2³
LF39B:
    sec                          ; 2
    ror                          ; 2
    sec                          ; 2
    ror                          ; 2
    sec                          ; 2
    ror                          ; 2
    clc                          ; 2
    adc    #$01                  ; 2
LF3A4:
    clc                          ; 2
    adc    ram_89,X              ; 4
    cmp    #$8E                  ; 2
    bcc    LF3B5                 ; 2³
    bit    ram_AB                ; 3
    bmi    LF3B3                 ; 2³
    lda    #$8D                  ; 2
    bmi    LF3B5                 ; 2³
LF3B3:
    lda    #$00                  ; 2
LF3B5:
    sta    ram_89,X              ; 4
    lda    ram_C6,X              ; 4
    bpl    LF3C2                 ; 2³
    and    #$07                  ; 2
    ora    #$F8                  ; 2
    jmp    LF3C4                 ; 3

LF3C2:
    and    #$07                  ; 2
LF3C4:
    sta    ram_C6,X              ; 4
LF3C6:
    lda    ram_D4,X              ; 4
    cmp    #$FF                  ; 2
    beq    LF3E5                 ; 2³
    clc                          ; 2
    adc    ram_9A,X              ; 4
    cmp    #$87                  ; 2
    bcc    LF3DD                 ; 2³
    lda    ram_BD                ; 3
    bmi    LF3E2                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_CA,X              ; 4
    sta    ram_CC,X              ; 4
LF3DD:
    sta    ram_D4,X              ; 4
    jmp    LF3E5                 ; 3

LF3E2:
    jsr    LF64B                 ; 6
LF3E5:
    ldx    #$01                  ; 2
LF3E7:
    lda    ram_D4,X              ; 4
    jsr    LF6E3                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMP0,X                ; 4
LF3F5:
    dey                          ; 2
    bpl    LF3F5                 ; 2³
    sta    RESP0,X               ; 4
    dex                          ; 2
    bpl    LF3E7                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$01                  ; 2
LF403:
    lda    ram_89,X              ; 4
    jsr    LF6E3                 ; 6
    sty    ram_8B,X              ; 4
    sta    ram_8D,X              ; 4
    dex                          ; 2
    bpl    LF403                 ; 2³
    lda    ram_B6                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_A0                ; 3
    asl                          ; 2
    asl                          ; 2
    adc    ram_A0                ; 3
    asl                          ; 2
    sta    ram_BA                ; 3
    ldx    #$01                  ; 2
    sec                          ; 2
    lda    ram_84                ; 3
    sbc    #$01                  ; 2
    jmp    LF429                 ; 3

LF427:
    lda    ram_83                ; 3
LF429:
    lsr                          ; 2
    sta    ram_85,X              ; 4
    bcc    LF432                 ; 2³
    lda    #$01                  ; 2
    sta    ram_8F,X              ; 4
LF432:
    dex                          ; 2
    bpl    LF427                 ; 2³
    ldx    #$01                  ; 2
LF437:
    lda    ram_D7,X              ; 4
    and    #$0F                  ; 2
    sta    ram_A0                ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    ram_A0                ; 3
    sta    ram_A2,X              ; 4
    lda    ram_D7,X              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_A0                ; 3
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_A0                ; 3
    sta    ram_A4,X              ; 4
    dex                          ; 2
    bpl    LF437                 ; 2³
    jsr    LF634                 ; 6
    lda    #$00                  ; 2
    sta    ram_82                ; 3
    lda    ram_B0                ; 3
    sta    ram_81                ; 3
LF461:
    dey                          ; 2
    bmi    LF46B                 ; 2³
    lsr    ram_81                ; 5
    rol    ram_82                ; 5
    jmp    LF461                 ; 3

LF46B:
    lda    INTIM                 ; 4
    bne    LF46B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    ram_A0                ; 3
    sta    ram_A1                ; 3
    lda    #$02                  ; 2
    sta    CTRLPF                ; 3
    ldx    #$05                  ; 2
LF47E:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_A0                ; 3
    sta    PF1                   ; 3
    ldy    ram_A4                ; 3
    cpy    #$05                  ; 2
    bcs    LF48E                 ; 2³
    lda    #$00                  ; 2
    beq    LF493                 ; 2³
LF48E:
    lda    LF7BF,Y               ; 4
    and    #$F0                  ; 2
LF493:
    sta    ram_A0                ; 3
    ldy    ram_A2                ; 3
    lda    LF7BF,Y               ; 4
    and    #$0F                  ; 2
    ora    ram_A0                ; 3
    sta    ram_A0                ; 3
    lda    ram_A1                ; 3
    sta    PF1                   ; 3
    ldy    ram_A5                ; 3
    cpy    #$05                  ; 2
    bcs    LF4AE                 ; 2³
    lda    #$00                  ; 2
    beq    LF4B3                 ; 2³
LF4AE:
    lda    LF7BF,Y               ; 4
    and    #$F0                  ; 2
LF4B3:
    sta    ram_A1                ; 3
    ldy    ram_A3                ; 3
    lda    LF7BF,Y               ; 4
    and    #$0F                  ; 2
    ora    ram_A1                ; 3
    sta    ram_A1                ; 3
    dex                          ; 2
    bmi    LF4DE                 ; 2³
    lda    ram_C2                ; 3
    bpl    LF4CB                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A1                ; 3
LF4CB:
    lda    ram_A0                ; 3
    sta    PF1                   ; 3
    inc    ram_A2                ; 5
    inc    ram_A4                ; 5
    inc    ram_A3                ; 5
    inc    ram_A5                ; 5
    lda    ram_A1                ; 3
    sta    PF1                   ; 3
    jmp    LF47E                 ; 3

LF4DE:
    stx    REFP1                 ; 3
    lda    #$05                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldy    #$00                  ; 2
    sty    PF1                   ; 3
LF4EA:
    lda    ram_CA                ; 3
    beq    LF4F2                 ; 2³
    lda    #$00                  ; 2
    beq    LF4F5                 ; 2³
LF4F2:
    lda    LF776,Y               ; 4
LF4F5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ram_CB                ; 3
    beq    LF501                 ; 2³+1
    lda    #$00                  ; 2
    beq    LF504                 ; 2³
LF501:
    lda    LF776,Y               ; 4
LF504:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    iny                          ; 2
    cpy    #$08                  ; 2
    bne    LF4EA                 ; 2³+1
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$01                  ; 2
LF51D:
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    ldy    ram_8B,X              ; 4
    lda    ram_8D,X              ; 4
    sta    HMP0,X                ; 4
LF526:
    dey                          ; 2
    bpl    LF526                 ; 2³
    sta    RESP0,X               ; 4
    dex                          ; 2
    bpl    LF51D                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_8F                ; 3
    sta    VDELP0                ; 3
    lda    ram_90                ; 3
    sta    VDELP1                ; 3
    lda    ram_91                ; 3
    sta    CTRLPF                ; 3
    ldx    #$00                  ; 2
LF540:
    txa                          ; 2
    sec                          ; 2
    sbc    ram_85                ; 3
    tay                          ; 2
    and    ram_87                ; 3
    beq    LF54D                 ; 2³
    lda    #$00                  ; 2
    beq    LF54F                 ; 2³
LF54D:
    lda    (ram_96),Y            ; 5
LF54F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    txa                          ; 2
    cmp    #$44                  ; 2
    bcc    LF564                 ; 2³
    lda    ram_81                ; 3
    sta    PF1                   ; 3
    lda    ram_B8                ; 3
    sta    COLUBK                ; 3
    lda    ram_82                ; 3
    sta    PF2                   ; 3
LF564:
    txa                          ; 2
    inx                          ; 2
    sec                          ; 2
    sbc    ram_86                ; 3
    tay                          ; 2
    and    ram_88                ; 3
    beq    LF572                 ; 2³
    lda    #$00                  ; 2
    beq    LF574                 ; 2³
LF572:
    lda    (ram_98),Y            ; 5
LF574:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    cpx    #$46                  ; 2
    bne    LF540                 ; 2³
    lda    #$00                  ; 2
    ldx    #$01                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF582:
    sta    GRP0,X                ; 4
    sta    PF1,X                 ; 4
    sta    VDELP0,X              ; 4
    dex                          ; 2
    bpl    LF582                 ; 2³
    sta    ram_A0                ; 3
    sta    CTRLPF                ; 3
    lda    ram_B7                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$07                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF599:
    dey                          ; 2
    bpl    LF599                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$E0                  ; 2
    sta    HMP1                  ; 3
    lda    #$D0                  ; 2
    sta    HMP0                  ; 3
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF5AE:
    lda    (ram_92),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_94),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_A0                ; 3
    sta    PF1                   ; 3
    lda    ram_BA                ; 3
    lsr                          ; 2
    tax                          ; 2
    cpx    #$05                  ; 2
    bcs    LF5C6                 ; 2³
    lda    #$00                  ; 2
    beq    LF5CB                 ; 2³
LF5C6:
    lda    LF7BF,X               ; 4
    and    #$0F                  ; 2
LF5CB:
    sta    ram_A0                ; 3
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    iny                          ; 2
    cpy    #$0A                  ; 2
    bcc    LF5DC                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BA                ; 3
    beq    LF5DE                 ; 2³
LF5DC:
    inc    ram_BA                ; 5
LF5DE:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpy    #$10                  ; 2
    bne    LF5AE                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$21                  ; 2
    sta    TIM64T                ; 4
LF5F1:
    lda    INTIM                 ; 4
    bne    LF5F1                 ; 2³
    jmp    LF015                 ; 3

LF5F9:
    .byte $00 ; |        | $F5F9
    .byte $00 ; |        | $F5FA
    .byte $80 ; |X       | $F5FB
    .byte $80 ; |X       | $F5FC
    .byte $01 ; |       X| $F5FD
LF5FE:
    .byte $22 ; |  X   X | $F5FE
    .byte $E6 ; |XXX  XX | $F5FF
    .byte $46 ; | X   XX | $F600
    .byte $0C ; |    XX  | $F601
    .byte $94 ; |X  X X  | $F602
    .byte $02 ; |      X | $F603
    .byte $0E ; |    XXX | $F604
    .byte $00 ; |        | $F605
    .byte $0C ; |    XX  | $F606
LF607:
    .byte $04 ; |     X  | $F607
    .byte $07 ; |     XXX| $F608
    .byte $05 ; |     X X| $F609
    .byte $0F ; |    XXXX| $F60A
    .byte $06 ; |     XX | $F60B
LF60C:
    .byte $F0 ; |XXXX    | $F60C
    .byte $E0 ; |XXX     | $F60D
    .byte $F0 ; |XXXX    | $F60E
    .byte $E0 ; |XXX     | $F60F
    .byte $C0 ; |XX      | $F610
LF611:
    .byte $0A ; |    X X | $F611
    .byte $06 ; |     XX | $F612
    .byte $0A ; |    X X | $F613
    .byte $06 ; |     XX | $F614
    .byte $0A ; |    X X | $F615
LF616:
    .byte $0B ; |    X XX| $F616
    .byte $0F ; |    XXXX| $F617
    .byte $13 ; |   X  XX| $F618
    .byte $17 ; |   X XXX| $F619
    .byte $1B ; |   XX XX| $F61A
    .byte $1F ; |   XXXXX| $F61B
    .byte $23 ; |  X   XX| $F61C
    .byte $27 ; |  X  XXX| $F61D
    .byte $2B ; |  X X XX| $F61E
    .byte $2F ; |  X XXXX| $F61F
    .byte $33 ; |  XX  XX| $F620
    .byte $37 ; |  XX XXX| $F621
    .byte $3B ; |  XXX XX| $F622
    .byte $3F ; |  XXXXXX| $F623
    .byte $43 ; | X    XX| $F624
LF625:
    .byte $85 ; |X    X X| $F625
    .byte $81 ; |X      X| $F626
    .byte $7D ; | XXXXX X| $F627
    .byte $79 ; | XXXX  X| $F628
    .byte $75 ; | XXX X X| $F629
    .byte $71 ; | XXX   X| $F62A
    .byte $6D ; | XX XX X| $F62B
    .byte $69 ; | XX X  X| $F62C
    .byte $65 ; | XX  X X| $F62D
    .byte $61 ; | XX    X| $F62E
    .byte $5D ; | X XXX X| $F62F
    .byte $59 ; | X XX  X| $F630
    .byte $55 ; | X X X X| $F631
    .byte $51 ; | X X   X| $F632
    .byte $4D ; | X  XX X| $F633
    
LF634:
    ldy    ram_AF                ; 3
    lda    LF616,Y               ; 4
    sta    ram_B1                ; 3
    clc                          ; 2
    adc    ram_B5                ; 3
    sta    ram_B3                ; 3
    lda    LF625,Y               ; 4
    sta    ram_B4                ; 3
    sec                          ; 2
    sbc    ram_B5                ; 3
    sta    ram_B2                ; 3
    rts                          ; 6

LF64B:
    lda    #$00                  ; 2
    sta    ram_CA,X              ; 4
    cpx    #$01                  ; 2
    beq    LF655                 ; 2³
    lda    #$86                  ; 2
LF655:
    sta    ram_D4,X              ; 4
    rts                          ; 6

LF658:
    cmp    #$0D                  ; 2
    bcc    LF662                 ; 2³
    sec                          ; 2
    sbc    #$0D                  ; 2
    jmp    LF658                 ; 3

LF662:
    sta    ram_AF                ; 3
    rts                          ; 6

LF665:
    lda    #$01                  ; 2
    sta    ram_D7                ; 3
    sta    ram_A7                ; 3
    sta    ram_A8                ; 3
LF66D:
    ldy    ram_A7                ; 3
    ldx    #$03                  ; 2
    dey                          ; 2
    sty    ram_AF                ; 3
    lda    LF5F9,Y               ; 4
    sta    ram_A6                ; 3
    lsr                          ; 2
    bcc    LF682                 ; 2³
    lda    #$0E                  ; 2
    sta    ram_AF                ; 3
    ldx    #$01                  ; 2
LF682:
    stx    ram_91                ; 3
    lda    LF60C,Y               ; 4
    sta    ram_B0                ; 3
    lda    LF611,Y               ; 4
    sta    ram_B5                ; 3
    ldx    #$01                  ; 2
LF690:
    jsr    LF64B                 ; 6
    lda    #$FF                  ; 2
    sta    ram_83,X              ; 4
    sta    ram_87,X              ; 4
    sta    ram_B6                ; 3
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    #$7F                  ; 2
    sta.wy ram_92,Y              ; 5
    lda    #$F7                  ; 2
    sta.wy ram_93,Y              ; 5
    sta.wy ram_97,Y              ; 5
    dex                          ; 2
    bpl    LF690                 ; 2³
    rts                          ; 6

LF6AF:
    and    #$FF                  ; 2
    bpl    LF6C6                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$7F                  ; 2
    sta    ram_92                ; 3
    lda    #$7F                  ; 2
    sta    ram_94                ; 3
    bne    LF6D2                 ; 2³
LF6C6:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #$7F                  ; 2
    sta    ram_94                ; 3
    lda    #$7F                  ; 2
    sta    ram_92                ; 3
LF6D2:
    lda    ram_C8                ; 3
    bpl    LF6DB                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
LF6DB:
    lsr                          ; 2
    tay                          ; 2
    lda    LF7F8,Y               ; 4
    sta    ram_9E                ; 3
    rts                          ; 6

LF6E3:
    ldy    #$00                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
LF6E8:
    cmp    #$08                  ; 2
    bcc    LF6F2                 ; 2³
    iny                          ; 2
    sec                          ; 2
    sbc    #$0F                  ; 2
    bpl    LF6E8                 ; 2³
LF6F2:
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    rts                          ; 6

    .byte $EA ; |XXX X X | $F6FC
    .byte $EA ; |XXX X X | $F6FD
    .byte $EA ; |XXX X X | $F6FE
    .byte $EA ; |XXX X X | $F6FF
    .byte $BD ; |X XXXX X| $F700
    .byte $5A ; | X XX X | $F701
    .byte $3C ; |  XXXX  | $F702
    .byte $18 ; |   XX   | $F703
    .byte $18 ; |   XX   | $F704
    .byte $3C ; |  XXXX  | $F705
    .byte $42 ; | X    X | $F706
    .byte $81 ; |X      X| $F707
    .byte $3C ; |  XXXX  | $F708
    .byte $18 ; |   XX   | $F709
    .byte $FF ; |XXXXXXXX| $F70A
    .byte $18 ; |   XX   | $F70B
    .byte $18 ; |   XX   | $F70C
    .byte $24 ; |  X  X  | $F70D
    .byte $42 ; | X    X | $F70E
    .byte $42 ; | X    X | $F70F
    .byte $00 ; |        | $F710
    .byte $00 ; |        | $F711
    .byte $BD ; |X XXXX X| $F712
    .byte $5A ; | X XX X | $F713
    .byte $3C ; |  XXXX  | $F714
    .byte $99 ; |X  XX  X| $F715
    .byte $5A ; | X XX X | $F716
    .byte $24 ; |  X  X  | $F717
    .byte $00 ; |        | $F718
    .byte $00 ; |        | $F719
    .byte $00 ; |        | $F71A
    .byte $00 ; |        | $F71B
    .byte $BD ; |X XXXX X| $F71C
    .byte $5A ; | X XX X | $F71D
    .byte $BD ; |X XXXX X| $F71E
    .byte $7E ; | XXXXXX | $F71F
    .byte $00 ; |        | $F720
    .byte $00 ; |        | $F721
    .byte $00 ; |        | $F722
    .byte $00 ; |        | $F723
    .byte $00 ; |        | $F724
    .byte $BD ; |X XXXX X| $F725
    .byte $5A ; | X XX X | $F726
    .byte $FF ; |XXXXXXXX| $F727
    .byte $3C ; |  XXXX  | $F728
    .byte $7E ; | XXXXXX | $F729
    .byte $7E ; | XXXXXX | $F72A
    .byte $FF ; |XXXXXXXX| $F72B
    .byte $FF ; |XXXXXXXX| $F72C
    .byte $81 ; |X      X| $F72D
    .byte $BD ; |X XXXX X| $F72E
    .byte $5A ; | X XX X | $F72F
    .byte $3C ; |  XXXX  | $F730
    .byte $18 ; |   XX   | $F731
    .byte $18 ; |   XX   | $F732
    .byte $24 ; |  X  X  | $F733
    .byte $42 ; | X    X | $F734
    .byte $81 ; |X      X| $F735
    .byte $00 ; |        | $F736
    .byte $00 ; |        | $F737
    .byte $00 ; |        | $F738
    .byte $00 ; |        | $F739
    .byte $00 ; |        | $F73A
    .byte $7E ; | XXXXXX | $F73B
    .byte $FF ; |XXXXXXXX| $F73C
    .byte $81 ; |X      X| $F73D
    .byte $BD ; |X XXXX X| $F73E
    .byte $5A ; | X XX X | $F73F
    .byte $3C ; |  XXXX  | $F740
    .byte $18 ; |   XX   | $F741
    .byte $18 ; |   XX   | $F742
    .byte $24 ; |  X  X  | $F743
    .byte $42 ; | X    X | $F744
    .byte $81 ; |X      X| $F745
    .byte $00 ; |        | $F746
    .byte $00 ; |        | $F747
    .byte $00 ; |        | $F748
    .byte $00 ; |        | $F749
    .byte $00 ; |        | $F74A
    .byte $00 ; |        | $F74B
    .byte $00 ; |        | $F74C
    .byte $00 ; |        | $F74D
    .byte $BD ; |X XXXX X| $F74E
    .byte $DB ; |XX XX XX| $F74F
    .byte $BD ; |X XXXX X| $F750
    .byte $FF ; |XXXXXXXX| $F751
    .byte $7E ; | XXXXXX | $F752
    .byte $24 ; |  X  X  | $F753
    .byte $42 ; | X    X | $F754
    .byte $81 ; |X      X| $F755
    .byte $00 ; |        | $F756
    .byte $00 ; |        | $F757
    .byte $00 ; |        | $F758
    .byte $00 ; |        | $F759
    .byte $00 ; |        | $F75A
    .byte $00 ; |        | $F75B
    .byte $00 ; |        | $F75C
    .byte $00 ; |        | $F75D
    .byte $3C ; |  XXXX  | $F75E
    .byte $18 ; |   XX   | $F75F
    .byte $3C ; |  XXXX  | $F760
    .byte $5A ; | X XX X | $F761
    .byte $99 ; |X  XX  X| $F762
    .byte $A5 ; |X X  X X| $F763
    .byte $C3 ; |XX    XX| $F764
    .byte $FF ; |XXXXXXXX| $F765
    .byte $00 ; |        | $F766
    .byte $00 ; |        | $F767
    .byte $00 ; |        | $F768
    .byte $00 ; |        | $F769
    .byte $00 ; |        | $F76A
    .byte $00 ; |        | $F76B
    .byte $00 ; |        | $F76C
    .byte $00 ; |        | $F76D
    .byte $BD ; |X XXXX X| $F76E
    .byte $5A ; | X XX X | $F76F
    .byte $3C ; |  XXXX  | $F770
    .byte $18 ; |   XX   | $F771
    .byte $18 ; |   XX   | $F772
    .byte $24 ; |  X  X  | $F773
    .byte $42 ; | X    X | $F774
    .byte $81 ; |X      X| $F775
LF776:
    .byte $00 ; |        | $F776
    .byte $00 ; |        | $F777
    .byte $39 ; |  XXX  X| $F778
    .byte $11 ; |   X   X| $F779
    .byte $7F ; | XXXXXXX| $F77A
    .byte $7F ; | XXXXXXX| $F77B
    .byte $10 ; |   X    | $F77C
    .byte $38 ; |  XXX   | $F77D
LF77E:
    .byte $FF ; |XXXXXXXX| $F77E
    .byte $01 ; |       X| $F77F
    .byte $01 ; |       X| $F780
    .byte $01 ; |       X| $F781
    .byte $01 ; |       X| $F782
    .byte $01 ; |       X| $F783
    .byte $01 ; |       X| $F784
    .byte $01 ; |       X| $F785
    .byte $01 ; |       X| $F786
    .byte $01 ; |       X| $F787
    .byte $01 ; |       X| $F788
    .byte $01 ; |       X| $F789
    .byte $01 ; |       X| $F78A
    .byte $01 ; |       X| $F78B
    .byte $01 ; |       X| $F78C
    .byte $01 ; |       X| $F78D
    .byte $01 ; |       X| $F78E
    .byte $01 ; |       X| $F78F
    .byte $03 ; |      XX| $F790
    .byte $03 ; |      XX| $F791
    .byte $07 ; |     XXX| $F792
    .byte $07 ; |     XXX| $F793
    .byte $07 ; |     XXX| $F794
    .byte $07 ; |     XXX| $F795
    .byte $0F ; |    XXXX| $F796
    .byte $0F ; |    XXXX| $F797
    .byte $0F ; |    XXXX| $F798
    .byte $0D ; |    XX X| $F799
    .byte $0D ; |    XX X| $F79A
    .byte $09 ; |    X  X| $F79B
    .byte $01 ; |       X| $F79C
    .byte $01 ; |       X| $F79D
    .byte $01 ; |       X| $F79E
    .byte $03 ; |      XX| $F79F
    .byte $03 ; |      XX| $F7A0
    .byte $07 ; |     XXX| $F7A1
    .byte $07 ; |     XXX| $F7A2
    .byte $0F ; |    XXXX| $F7A3
    .byte $0F ; |    XXXX| $F7A4
    .byte $1F ; |   XXXXX| $F7A5
    .byte $1F ; |   XXXXX| $F7A6
    .byte $1F ; |   XXXXX| $F7A7
    .byte $3F ; |  XXXXXX| $F7A8
    .byte $3D ; |  XXXX X| $F7A9
    .byte $39 ; |  XXX  X| $F7AA
    .byte $31 ; |  XX   X| $F7AB
    .byte $01 ; |       X| $F7AC
    .byte $01 ; |       X| $F7AD
    .byte $01 ; |       X| $F7AE
    .byte $07 ; |     XXX| $F7AF
    .byte $1F ; |   XXXXX| $F7B0
    .byte $3F ; |  XXXXXX| $F7B1
    .byte $7F ; | XXXXXXX| $F7B2
    .byte $FF ; |XXXXXXXX| $F7B3
    .byte $FF ; |XXXXXXXX| $F7B4
    .byte $7F ; | XXXXXXX| $F7B5
    .byte $3F ; |  XXXXXX| $F7B6
    .byte $1F ; |   XXXXX| $F7B7
    .byte $07 ; |     XXX| $F7B8
    .byte $01 ; |       X| $F7B9
    .byte $01 ; |       X| $F7BA
    .byte $01 ; |       X| $F7BB
    .byte $01 ; |       X| $F7BC
    .byte $01 ; |       X| $F7BD
    .byte $01 ; |       X| $F7BE
LF7BF:
    .byte $EE ; |XXX XXX | $F7BF
    .byte $AA ; |X X X X | $F7C0
    .byte $AA ; |X X X X | $F7C1
    .byte $AA ; |X X X X | $F7C2
    .byte $EE ; |XXX XXX | $F7C3
    .byte $44 ; | X   X  | $F7C4
    .byte $44 ; | X   X  | $F7C5
    .byte $44 ; | X   X  | $F7C6
    .byte $44 ; | X   X  | $F7C7
    .byte $44 ; | X   X  | $F7C8
    .byte $EE ; |XXX XXX | $F7C9
    .byte $22 ; |  X   X | $F7CA
    .byte $EE ; |XXX XXX | $F7CB
    .byte $88 ; |X   X   | $F7CC
    .byte $EE ; |XXX XXX | $F7CD
    .byte $EE ; |XXX XXX | $F7CE
    .byte $22 ; |  X   X | $F7CF
    .byte $66 ; | XX  XX | $F7D0
    .byte $22 ; |  X   X | $F7D1
    .byte $EE ; |XXX XXX | $F7D2
    .byte $AA ; |X X X X | $F7D3
    .byte $AA ; |X X X X | $F7D4
    .byte $EE ; |XXX XXX | $F7D5
    .byte $22 ; |  X   X | $F7D6
    .byte $22 ; |  X   X | $F7D7
    .byte $EE ; |XXX XXX | $F7D8
    .byte $88 ; |X   X   | $F7D9
    .byte $EE ; |XXX XXX | $F7DA
    .byte $22 ; |  X   X | $F7DB
    .byte $EE ; |XXX XXX | $F7DC
    .byte $EE ; |XXX XXX | $F7DD
    .byte $88 ; |X   X   | $F7DE
    .byte $EE ; |XXX XXX | $F7DF
    .byte $AA ; |X X X X | $F7E0
    .byte $EE ; |XXX XXX | $F7E1
    .byte $EE ; |XXX XXX | $F7E2
    .byte $22 ; |  X   X | $F7E3
    .byte $22 ; |  X   X | $F7E4
    .byte $22 ; |  X   X | $F7E5
    .byte $22 ; |  X   X | $F7E6
    .byte $EE ; |XXX XXX | $F7E7
    .byte $AA ; |X X X X | $F7E8
    .byte $EE ; |XXX XXX | $F7E9
    .byte $AA ; |X X X X | $F7EA
    .byte $EE ; |XXX XXX | $F7EB
    .byte $EE ; |XXX XXX | $F7EC
    .byte $AA ; |X X X X | $F7ED
    .byte $EE ; |XXX XXX | $F7EE
    .byte $22 ; |  X   X | $F7EF
    .byte $EE ; |XXX XXX | $F7F0
LF7F1:
    .byte $17 ; |   X XXX| $F7F1
    .byte $1F ; |   XXXXX| $F7F2
LF7F3:
    .byte $02 ; |      X | $F7F3
    .byte $05 ; |     X X| $F7F4
    .byte $09 ; |    X  X| $F7F5
    .byte $0A ; |    X X | $F7F6
    .byte $01 ; |       X| $F7F7
LF7F8:
    .byte $03 ; |      XX| $F7F8
    .byte $04 ; |     X  | $F7F9
    .byte $05 ; |     X X| $F7FA
    .byte $06 ; |     XX | $F7FB
    
       ORG $F7FC
       
    .word START
    
LF7FE:
    .byte $FE ; |XXXXXXX | $F7FE
    .byte $02 ; |      X | $F7FF
