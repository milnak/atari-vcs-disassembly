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
REFP1   =  $0C
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
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295

       ORG $5000
L5000: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$2C,$52,$38,$7C,$5C
       .byte $5C,$38,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$18,$18,$18
       .byte $24,$42,$7E,$7A,$3C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$44
       .byte $6C,$7C,$54,$54,$38,$EE,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$44,$6C,$7C,$54,$38,$EE,$EE,$10,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$44,$6C,$7C,$54,$BA,$6C,$C6,$10,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$44,$6C,$7C,$54,$54,$EE,$38,$10,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$7C,$54,$44,$6C,$6C,$BA,$BA,$82,$00
       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$A8,$8E,$DA,$DF,$BD
       .byte $42,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$24,$24,$3C,$24
       .byte $5A,$5A,$42,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$1F,$1F,$15
       .byte $71,$5B,$FB,$DB,$42,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$44
       .byte $6C,$54,$6C,$92,$44,$28,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$44,$6C,$7C,$54,$BA,$6C,$C6,$10,$00,$00,$00,$00,$00
L50DE: .byte $00,$00,$00
L50E1: .byte $00,$00,$8D,$7D,$6D,$58,$9A
L50E8: .byte $D8
L50E9: .byte $05
L50EA: .byte $06,$07,$05,$06,$45
L50EF: .byte $4D,$55,$12
L50F2: .byte $00,$27,$C7                 ;  *C* not sure, player, power up
L50F5: .byte $47,$59,$69,$79             ;  *C* bonus fruit, dog1, dog2, dog3
L50F9: CLC            ;2
       STA    $AB     ;3
       ASL            ;2
       ASL            ;2
       ADC    $AB     ;3
       RTS            ;6

L5101: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$24,$7C,$54,$54,$38
       .byte $EE,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$24,$24,$3C
       .byte $54,$38,$EE,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$24
       .byte $24,$3C,$24,$5A,$EE,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $3C,$24,$24,$3C,$24,$5A,$5A,$42,$00,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$44,$C6,$EE,$D6,$38,$6C,$44,$38,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$C6,$C6,$EE,$D6,$6C,$44,$44,$38,$00,$00,$00,$00
       .byte $00,$00,$00,$00,$00,$00
L5177: .byte $60,$67,$60,$67,$60,$06,$66,$67,$00,$7E,$60,$67,$60,$67,$60
L5186: .byte $80,$99,$18,$99,$80,$9E,$00,$E7,$00,$9E,$98,$01,$78,$19
L5194: .byte $F8,$3F,$25,$3D,$25,$3F,$29,$2F,$22,$3F,$09,$3D,$27,$3C,$24,$3C
       .byte $7E,$52,$5E,$52,$7E,$4A,$7A,$22,$7E,$48,$5E,$72,$1E,$12,$1E
L51B3: .byte $00,$00,$A0,$00,$0A,$00,$00,$00,$59,$5D,$7D,$55,$0E,$59,$5D,$0C
       .byte $0A,$0A,$0A,$00,$0A,$0A,$0A,$0A,$0A,$0A,$5B,$0C,$5B,$0E,$0A,$0A
       .byte $5B,$57,$0E,$0A,$0A,$D3,$57,$06,$0A,$00,$0A,$5B,$0E,$A0,$00,$00
       .byte $53,$5D,$57,$0E,$5B,$E5,$80,$00,$00,$0A,$00,$0A,$0A,$B0,$E5,$00
       .byte $59,$57,$5D,$0E,$5B,$E5,$20,$00,$0A,$00,$0A,$5B,$0E,$A0,$00,$00
       .byte $5B,$5D,$0E,$0A,$0A,$79,$5D,$0C,$0A,$0A,$5B,$06,$5B,$0E,$0A,$0A
       .byte $0A,$0A,$0A,$00,$0A,$0A,$0A,$0A,$53,$57,$D7,$55,$0E,$53,$57,$06
       .byte $00,$00,$A0,$00,$0A,$00,$00,$00
L522B: .byte $EE,$AA,$AA,$AA,$EE,$EE,$44,$44,$44,$CC,$EE,$88,$EE,$22,$EE,$EE
       .byte $22,$EE,$22,$EE,$22,$22,$EE,$AA,$AA,$EE,$22,$EE,$88,$EE,$EE,$AA
       .byte $EE,$88,$EE,$22,$22,$22,$22,$EE,$EE,$AA,$EE,$AA,$EE,$22,$22,$EE
       .byte $AA
L525C: .byte $EE
L525D: .byte $3C,$00,$00,$00,$42,$20,$72,$00,$BD,$2B,$8A,$BB,$A5,$28,$8A,$A9
       .byte $A1,$EB,$8B,$BB
L5271: .byte $A5,$2A,$8A,$A9,$BD,$2B,$8A,$BB,$42,$C0
L527B: .byte $89,$00,$3C,$00,$00,$00
L5281: .byte $01
L5282: .byte $02
L5283: .byte $04
L5284: .byte $08
L5285: .byte $10
L5286: .byte $20
L5287: .byte $40,$80,$01,$02,$04,$08,$10,$20,$80,$80,$40,$40,$40,$00,$00,$40
       .byte $40,$40,$40,$40,$00,$00,$00,$00,$80,$C0,$C0,$80,$C0,$C0,$00,$00
       .byte $C0,$C0,$C0,$C0,$00,$00,$00,$00,$80,$80,$80,$80,$00,$00,$00,$00
L52B7: .byte $00,$40,$80,$C0

START:
       CLD            ;2
       LDA    #$00    ;2
       TAX            ;2
L52BF: STA    VSYNC,X ;4
       DEX            ;2
       BNE    L52BF   ;2
       DEX            ;2
       TXS            ;2
L52C6: LDA    #$00    ;2
       STA    $87     ;3
       LDA    #$15    ;2
       STA    CTRLPF  ;3
L52CE: LDA    #$00    ;2
       STA    $9B     ;3
       STA    $9C     ;3
       STA    $96     ;3
       STA    $97     ;3
       STA    $A2     ;3
       LDA    #$4F    ;2
       STA    $9D     ;3
L52DE: JSR    L5E81   ;6
       LDA    #$40    ;2
       STA    $9A     ;3
L52E5: LDA    $87     ;3
       AND    #$F0    ;2
       STA    $87     ;3
       LDA    $A2     ;3
       ORA    #$02    ;2
       STA    $A2     ;3
       LDA    #$4D    ;2
       STA    $A9     ;3
       LDA    #$76    ;2
       STA    $A1     ;3
       LDA    #$45    ;2
       STA    $AD     ;3
       LDA    #$4D    ;2
       STA    $AE     ;3
       LDA    #$55    ;2
       STA    $AF     ;3
       LDA    #$8D    ;2
       STA    $A5     ;3
       LDA    #$7D    ;2
       STA    $A6     ;3
       LDA    #$6D    ;2
       STA    $A7     ;3
       LDA    #$48    ;2
       STA    $9E     ;3
       LDA    #$8A    ;2
       STA    $9F     ;3
       LDA    #$C8    ;2
       STA    $A0     ;3
L531D: LDA    INTIM   ;4
       BNE    L531D   ;2
       LDA    #$02    ;2
       STA    WSYNC   ;3
       STA    VBLANK  ;3
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       STA    VSYNC   ;3
       LDA    #$00    ;2  *C* background
       STA    COLUBK  ;3
       BIT    $87     ;3
       BMI    L5347   ;2
       LDA    $9B     ;3
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       AND    #$F0    ;2  *C* attract mode
       ORA    #$03    ;2  *C* attract mode
       STA    COLUBK  ;3
       JMP    L5376   ;3
L5347: LDA    SWCHB   ;4
       AND    #$08    ;2
       BEQ    L5376   ;2
       LDA    $87     ;3
       BIT    L5284   ;4
       BNE    L5376   ;2
       LDA    #$0C    ;2
       STA    AUDC0   ;3
       LDA    $9C     ;3
       LSR            ;2
       STA    $A4     ;3
       LDA    $87     ;3
       BIT    L5282   ;4
       BNE    L5367   ;2
       LSR    $A4     ;5
L5367: LDA    $A4     ;3
       AND    #$0F    ;2
       CLC            ;2
       ADC    #$0C    ;2
       STA    AUDF0   ;3
       LDA    #$03    ;2
       STA    AUDV0   ;3
       BNE    L537C   ;2
L5376: LDA    #$00    ;2
       STA    AUDV0   ;3
       STA    AUDV1   ;3
L537C: STA    WSYNC   ;3
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    VSYNC   ;3
       LDX    #$2D    ;2
L5388: STA    $B0,X   ;4
       DEX            ;2
       BPL    L5388   ;2
       STA    WSYNC   ;3
       LDA    $9C     ;3
       LSR            ;2
       BCS    L53B8   ;2
       LDA    #$40    ;2
       LDX    #$00    ;2
       LDY    #$0A    ;2
       JSR    L5DB5   ;6
       LDA    #$30    ;2
       INX            ;2
       LDY    #$0B    ;2
       JSR    L5DB5   ;6
       LDA    #$00    ;2
       INX            ;2
       LDY    #$0C    ;2
       JSR    L5DB5   ;6
       LDA    #$C0    ;2
       INX            ;2
       LDY    #$0C    ;2
       JSR    L5DB5   ;6
       JMP    L53D9   ;3
L53B8: LDA    #$B0    ;2
       LDX    #$00    ;2
       LDY    #$04    ;2
       JSR    L5DB5   ;6
       LDA    #$A0    ;2
       INX            ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       LDA    #$60    ;2
       INX            ;2
       LDY    #$07    ;2
       JSR    L5DB5   ;6
       LDA    #$20    ;2
       INX            ;2
       LDY    #$07    ;2
       JSR    L5DB5   ;6
L53D9: STY    WSYNC   ;3
       STY    VBLANK  ;3
       LDA    #$B2    ;2
       STA    TIM8T   ;4
       LDA    $9C     ;3
       LSR            ;2
       BCS    L53F5   ;2
       LDA    $99     ;3
       JSR    L5DC5   ;6
       LDA    $98     ;3
       SEC            ;2
       JSR    L5DC5   ;6
       JMP    L5400   ;3
L53F5: LDA    $96     ;3
       JSR    L5DC5   ;6
       LDA    $97     ;3
       CLC            ;2
       JSR    L5DC5   ;6
L5400: LDA    #$25    ;2
       STA    NUSIZ0  ;3
       LDA    #$15    ;2
       STA    NUSIZ1  ;3
       LDA    $9C     ;3
       LSR            ;2
       BCS    L542B   ;2
       LDA    #$02    ;2
       STA    $A4     ;3
       LDA    $A2     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       JSR    L5F0D   ;6
       LDA    #$03    ;2
       STA    $A4     ;3
       LDA    $A2     ;3
       AND    #$0F    ;2
       JSR    L5F0D   ;6
       JSR    L5E90   ;6
       JMP    L5446   ;3
L542B: JSR    L5E90   ;6
       LDA    #$02    ;2
       STA    $A4     ;3
       LDA    $A2     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       JSR    L5F0D   ;6
       LDA    #$03    ;2
       STA    $A4     ;3
       LDA    $A2     ;3
       AND    #$0F    ;2
       JSR    L5F0D   ;6
L5446: LDA    $9D     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       STA    $A4     ;3
       TAX            ;2
       LDY    L50E8,X ;4
       JSR    L5F3E   ;6
       LDX    $A4     ;3
       LDY    L50E9,X ;4
       JSR    L5F3E   ;6
       LDX    $A4     ;3
       LDY    L50EA,X ;4
       JSR    L5F3E   ;6
       LDA    $9A     ;3
       BIT    L5285   ;4
       BNE    L54AE   ;2
       LDA    $87     ;3
       LSR            ;2
       BCS    L549C   ;2
       LSR            ;2
       BCS    L5488   ;2
       LDA    $9C     ;3
       AND    #$18    ;2
       ASL            ;2
       STA    $A4     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       ORA    $A4     ;3
       CLC            ;2
       ADC    #$25    ;2
       LDX    #$50    ;2
       BNE    L54BF   ;2
L5488: LDA    $9A     ;3
       AND    #$C0    ;2
       LSR            ;2
       LSR            ;2
       STA    $A4     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       ORA    $A4     ;3
       CLC            ;2
       ADC    #$6D    ;2
       LDX    #$50    ;2
       BNE    L54BF   ;2
L549C: LDA    $9C     ;3
       AND    #$30    ;2
       STA    $A4     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       ORA    $A4     ;3
       CLC            ;2
       ADC    #$01    ;2
       LDX    #$51    ;2
       BNE    L54BF   ;2
L54AE: LDA    $9C     ;3
       AND    #$20    ;2
       LSR            ;2
       STA    $A4     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       ORA    $A4     ;3
       CLC            ;2
       ADC    #$B5    ;2
       LDX    #$50    ;2
L54BF: STA    $8A     ;3
       STA    $88     ;3
       STX    $8B     ;3
       STX    $89     ;3
L54C7: LDA    INTIM   ;4
       BNE    L54C7   ;2
       STA    WSYNC   ;3
       LDA    $87     ;3
       BIT    L5284   ;4
       BEQ    L54DF   ;2
       LDA    $9C     ;3
       AND    #$20    ;2
       BNE    L54DF   ;2
       LDX    #$07    ;2
       BNE    L54E9   ;2
L54DF: LDX    #$A7    ;2
       LDA    $87     ;3
       AND    #$20    ;2
       BEQ    L54E9   ;2
       LDX    #$67    ;2
L54E9: STX    COLUPF  ;3
       LDA    #$07    ;2  *C* score
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    #$00    ;2
       LDX    #$C0    ;2
       LDY    #$02    ;2
       STA    WSYNC   ;3
       STA    PF0     ;3
       STA    PF1     ;3
       STX    PF2     ;3
       LDA    $8C     ;3
       STA    GRP0    ;3
       LDA    $8D     ;3
       STA    GRP1    ;3
       STY    ENAM0   ;3
       STY    ENAM1   ;3
       STA    WSYNC   ;3
       LDA    $A9     ;3
       JSR    L5D83   ;6
       STA    $8D     ;3
       STA    WSYNC   ;3
       LDA    $8E     ;3
       STA    GRP0    ;3
       LDA    $8F     ;3
       STA    GRP1    ;3
       LDA    #$15    ;2
       STA    NUSIZ0  ;3
       STA    WSYNC   ;3
       LDA    #$55    ;2
       STA    $8E     ;3
       STA    $8F     ;3
       STA    WSYNC   ;3
       LDA    $90     ;3
       STA    GRP0    ;3
       LDA    $91     ;3
       STA    GRP1    ;3
       LDX    #$60    ;2
       STA    WSYNC   ;3
       STX    PF2     ;3
       LDA    $AD     ;3
       JSR    L5D83   ;6
       STA    $91     ;3
       STA    WSYNC   ;3
       LDA    $92     ;3
       STA    GRP0    ;3
       LDA    $93     ;3
       STA    GRP1    ;3
       STA    WSYNC   ;3
       LDA    $AE     ;3
       JSR    L5D83   ;6
       STA    $92     ;3
       STA    WSYNC   ;3
       LDA    $94     ;3
       STA    GRP0    ;3
       LDA    $95     ;3
       STA    GRP1    ;3
       LDA    #$25    ;2
       STA    NUSIZ0  ;3
       STA    WSYNC   ;3
       LDA    $AF     ;3
       JSR    L5D83   ;6
       STA    $93     ;3
       STA    WSYNC   ;3
       LDA    #$00    ;2
       LDX    #$30    ;2
       STX    PF2     ;3
       STA    GRP0    ;3
       STA    GRP1    ;3
       STA    ENAM0   ;3
       STA    ENAM1   ;3
       LDA    #$10    ;2
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       LDA    #$15    ;2
       STA    CTRLPF  ;3
       LDX    #$49    ;2
       LDA    $9C     ;3
       BIT    L5285   ;4
       BEQ    L5590   ;2
       LDX    #$5B    ;2
L5590: STX    $94     ;3
       LDA    #$51    ;2
       STA    $95     ;3
       BIT    $DD     ;3
       BVS    L55A1   ;2
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       JMP    L55BD   ;3
L55A1: STA    WSYNC   ;3
       LDA    $DD     ;3
       AND    #$03    ;2
       TAX            ;2
       LDA    $8C,X   ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    $8C,X   ;4
       NOP            ;2
L55B0: DEY            ;2
       BNE    L55B0   ;2
       STA    RESP0   ;3
       STA    HMCLR   ;3
       STA    HMP0    ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
L55BD: LDA    #$27    ;2  *C* certain maze dots - needs to be same color as player
       STA    COLUP0  ;3
       STA    WSYNC   ;3
       LDX    #$18    ;2
       STA    WSYNC   ;3
       STX    PF2     ;3
       LDA    $DD     ;3
       BMI    L55D5   ;2
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       LDX    #$01    ;2
       BNE    L55F1   ;2
L55D5: STA    WSYNC   ;3
       AND    #$0C    ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    $90,X   ;4
       AND    #$0F    ;2
       TAY            ;2
       LDA    $90,X   ;4
L55E3: DEY            ;2
       BNE    L55E3   ;2
       STA.w  $0011   ;4
       STA    HMCLR   ;3
       STA    HMP1    ;3
       STA    WSYNC   ;3
       STA    HMOVE   ;3
L55F1: LDA    L50F5,X ;4
       STA    COLUP1  ;3
       STA    WSYNC   ;3
       LDA    #$7F    ;2
       STA    PF1     ;3
       LDA    #$1F    ;2
       STA    PF2     ;3
       STA    WSYNC   ;3
       LDA    $9C     ;3
       LSR            ;2
       BCS    L5630   ;2
       LDA    #$20    ;2
       LDX    #$02    ;2
       LDY    #$09    ;2
       JSR    L5DB5   ;6
       LDA    #$10    ;2
       INX            ;2
       LDY    #$0A    ;2
       JSR    L5DB5   ;6
       LDA    #$00    ;2
       INX            ;2
       LDY    #$0B    ;2
       JSR    L5DB5   ;6
       INX            ;2
L5621: LDA    L5282,X ;4
       STA    $81,X   ;4
       DEX            ;2
       BPL    L5621   ;2
       LDA    #$ED    ;2
       STA    $A3     ;3
       JMP    L5656   ;3
L5630: LDA    #$E0    ;2
       LDX    #$02    ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       LDA    #$D0    ;2
       INX            ;2
       LDY    #$06    ;2
       JSR    L5DB5   ;6
       LDA    #$C0    ;2
       INX            ;2
       LDY    #$07    ;2
       JSR    L5DB5   ;6
       INX            ;2
L564A: LDA    L5281,X ;4
       STA    $81,X   ;4
       DEX            ;2
       BPL    L564A   ;2
       LDA    #$DE    ;2
       STA    $A3     ;3
L5656: LDA    #$0F    ;2
       STA    $8C     ;3
       LDA    #$00    ;2
       STA    $A4     ;3
       STA    CXCLR   ;3
L5660: DEC    $8C     ;5
       BPL    L5667   ;2
       JMP    L5846   ;3
L5667: LDX    $8C     ;3
       STA    WSYNC   ;3
       STA    GRP1    ;3
       LDA    L5177,X ;4
       STA    PF1     ;3
       LDA    L5186,X ;4
       STA    PF2     ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $8C     ;3
       LDA    ($A3),Y ;5
       AND    $82     ;3
       BEQ    L5689   ;2
       LDA    #$02    ;2
L5689: STA    $AB     ;3
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       STA    WSYNC   ;3
       STA    GRP1    ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $8C     ;3
       LDA    ($A3),Y ;5
       LDY    #$00    ;2
       BIT    $84     ;3
       BEQ    L56A9   ;2
       LDY    #$04    ;2
L56A9: STY    $AA     ;3
       AND    $86     ;3
       BEQ    L56B1   ;2
       LDA    #$02    ;2
L56B1: ORA    $AA     ;3
       STA    $AA     ;3
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       LDY    $AB     ;3
       STA    WSYNC   ;3
       STA    GRP1    ;3
       LDA    $AA     ;3
       STA    ENAM0   ;3
       LSR            ;2
       STA    ENAM1   ;3
       STY    ENABL   ;3
       LDA    $CE,X   ;4
       ROL            ;2
       BPL    L56DD   ;2
       STA    $AA     ;3
       ROR            ;2
       AND    #$03    ;2
       TAY            ;2
       LDA.wy $008C,Y ;4
       STA    $A8     ;3
       JMP    L56E5   ;3
L56DD: LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
L56E5: LDA    #$90    ;2
       STA    HMCLR   ;3
       STA    HMM0    ;3
       STA    HMM1    ;3
       STA    HMBL    ;3
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       STA    WSYNC   ;3
       STA    GRP1    ;3
       BIT    $AA     ;3
       BPL    L5710   ;2
       INC    $BF,X   ;6
       LDA    $A8     ;3
       AND    #$0F    ;2
       TAY            ;2
L5704: DEY            ;2
       BNE    L5704   ;2
       STA    RESP0   ;3
       LDA    $A8     ;3
       STA    HMP0    ;3
       JMP    L571F   ;3
L5710: LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       TAY            ;2
       INC    $BF,X   ;6
L571F: STA    WSYNC   ;3
       STA    HMOVE   ;3
       STY    GRP1    ;3
       LDA    #$00    ;2
       STA    ENAM0   ;3
       STA    ENAM1   ;3
       STA    ENABL   ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $8C     ;3
       LDA    ($A3),Y ;5
       AND    $81     ;3
       BEQ    L573F   ;2
       LDA    #$02    ;2
L573F: STA    $AB     ;3
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       STA    HMCLR   ;3
       STA    WSYNC   ;3
       STA    GRP1    ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $8C     ;3
       LDA    ($A3),Y ;5
       LDY    #$00    ;2
       BIT    $83     ;3
       BEQ    L5761   ;2
       LDY    #$04    ;2
L5761: STY    $AA     ;3
       AND    $85     ;3
       BEQ    L5769   ;2
       LDA    #$02    ;2
L5769: ORA    $AA     ;3
       STA    $AA     ;3
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       LDY    $AB     ;3
       STA    WSYNC   ;3
       STA    GRP1    ;3
       LDA    $AA     ;3
       STA    ENAM0   ;3
       LSR            ;2
       STA    ENAM1   ;3
       STY    ENABL   ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDA    #$70    ;2
       STA    HMM0    ;3
       STA    HMM1    ;3
       STA    HMBL    ;3
       LDA    $CE,X   ;4
       STA    $AA     ;3
       BMI    L57A1   ;2
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       JMP    L57AD   ;3
L57A1: LSR            ;2
       LSR            ;2
       AND    #$03    ;2
       TAY            ;2
       LDA.wy $0090,Y ;4
       STA    $AC     ;3
       LDA    #$00    ;2
L57AD: STA    WSYNC   ;3
       STA    GRP1    ;3
       BIT    $AA     ;3
       BPL    L57C8   ;2
       INC    $B0,X   ;6
       LDA    $AC     ;3
       AND    #$0F    ;2
       TAY            ;2
L57BC: DEY            ;2
       BNE    L57BC   ;2
       STA    RESP1   ;3
       LDA    $AC     ;3
       STA    HMP1    ;3
       JMP    L57D7   ;3
L57C8: LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       TAY            ;2
       INC    $BF,X   ;6
L57D7: STA    WSYNC   ;3
       STA    HMOVE   ;3
       STY    GRP1    ;3
       LDA    #$00    ;2
       STA    ENAM0   ;3
       STA    ENAM1   ;3
       STA    ENABL   ;3
       LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       LDA    $CE,X   ;4
       BPL    L5802   ;2
       LDA    $CE,X   ;4
       AND    #$0C    ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       LDA    L50F5,Y ;4
       STA    COLUP1  ;3
       LDA    #$00    ;2
       JMP    L5808   ;3
L5802: LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
L5808: STA    WSYNC   ;3
       STA    GRP1    ;3
       LDA    $CE,X   ;4
       ROL            ;2
       BPL    L583B   ;2
       ROR            ;2
       AND    #$03    ;2
       TAY            ;2
       CMP    #$01    ;2
       BNE    L5824   ;2
       LDA    $8A     ;3
       STA    $88     ;3
       LDA    $8B     ;3
       STA    $89     ;3
       JMP    L582D   ;3
L5824: LDA    L50EF,Y ;4
       STA    $88     ;3
       LDA    #$50    ;2
       STA    $89     ;3
L582D: LDA    L50F2,Y ;4
       STA    COLUP0  ;3
L5832: LDY    $BF,X   ;4
       LDA    ($94),Y ;5
       INC    $BF,X   ;6
       JMP    L5660   ;3
L583B: LDY    $B0,X   ;4
       LDA    ($88),Y ;5
       STA    GRP0    ;3
       INC    $B0,X   ;6
       JMP    L5832   ;3
L5846: STA    WSYNC   ;3
       LDA    #$7F    ;2
       STA    PF1     ;3
       LDA    #$FF    ;2
       STA    PF2     ;3
       LDA    $9C     ;3
       LSR            ;2
       BCC    L588F   ;2
       LDA    #$F0    ;2
       LDX    #$00    ;2
       LDY    #$07    ;2
       JSR    L5DB5   ;6
       LDA    #$C0    ;2
       LDX    #$01    ;2
       LDY    #$08    ;2
       JSR    L5DB5   ;6
       LDA    #$A0    ;2
       LDX    #$02    ;2
       LDY    #$04    ;2
       JSR    L5DB5   ;6
       LDA    #$30    ;2
       LDX    #$03    ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    PF1     ;3
       STA    PF2     ;3
       LDA    #$D0    ;2
       LDX    #$04    ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       LDX    #$21    ;2
       JMP    L58C6   ;3
L588F: LDA    #$40    ;2
       LDX    #$00    ;2
       LDY    #$08    ;2
       JSR    L5DB5   ;6
       LDA    #$30    ;2
       LDX    #$01    ;2
       LDY    #$09    ;2
       JSR    L5DB5   ;6
       LDA    #$A0    ;2
       LDX    #$02    ;2
       LDY    #$04    ;2
       JSR    L5DB5   ;6
       LDA    #$30    ;2
       LDX    #$03    ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    PF1     ;3
       STA    PF2     ;3
       LDA    #$D0    ;2
       LDX    #$04    ;2
       LDY    #$05    ;2
       JSR    L5DB5   ;6
       LDX    #$23    ;2
L58C6: LDA    #$20    ;2
       STA    NUSIZ0  ;3
       STA    NUSIZ1  ;3
       LDA    #$21    ;2
       STA    CTRLPF  ;3
       LDA    #$27    ;2  *C* rightmost extra life indicator
       STA    COLUPF  ;3
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDY    #$09    ;2
L58DA: STA    WSYNC   ;3
       LDA    #$00    ;2
       CPY    #$06    ;2
       BCS    L58E4   ;2
       LDA    $9D     ;3
L58E4: STA    ENAM0   ;3
       LSR            ;2
       STA    ENAM1   ;3
       LSR            ;2
       STA    ENABL   ;3
       LDA    L525D,X ;4
       STA    GRP1    ;3
       LDA    L525C,X ;4
       STA    GRP0    ;3
       LDA    #$07    ;2  *C* copyright notice
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       DEY            ;2
       DEX            ;2
       DEX            ;2
       DEX            ;2
       NOP            ;2
       NOP            ;2
       LDA    #$27    ;2  *C* remaining extra life indicators
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       DEX            ;2
       BPL    L58DA   ;2
       STA    WSYNC   ;3
       LDA    #$00    ;2
       STA    GRP0    ;3
       STA    GRP1    ;3
       STA    ENAM0   ;3
       STA    ENAM1   ;3
       STA    ENABL   ;3
       STA    WSYNC   ;3
       LDA    #$EA    ;2
       STA    TIM8T   ;4
       BIT    REFP1   ;3
       BMI    L592F   ;2
       LDA    $87     ;3
       BMI    L592F   ;2
       ORA    #$80    ;2
       STA    $87     ;3
       JMP    L52CE   ;3
L592F: LDA    SWCHB   ;4
       BIT    L5281   ;4
       BNE    L593A   ;2
       JMP    L52C6   ;3
L593A: BIT    L5282   ;4
       BNE    L5948   ;2
       LDA    $87     ;3
       ORA    #$10    ;2
       STA    $87     ;3
       JMP    L5955   ;3
L5948: LDA    $87     ;3
       BIT    L5285   ;4
       BEQ    L5955   ;2
       EOR    #$20    ;2
       AND    #$EF    ;2
       STA    $87     ;3
L5955: BIT    $87     ;3
       BMI    L595C   ;2
       JMP    L59E2   ;3
L595C: BIT    L5284   ;4
       BEQ    L5964   ;2
       JMP    L5A0B   ;3
L5964: LDA    SWCHB   ;4
       AND    #$08    ;2
       BNE    L596E   ;2
       JMP    L5A12   ;3
L596E: LDA    $87     ;3
       BIT    L5281   ;4
       BEQ    L5978   ;2
       JMP    L5A1B   ;3
L5978: LDA    $9A     ;3
       BIT    L5285   ;4
       BEQ    L5982   ;2
       JMP    L5A30   ;3
L5982: LDX    $80     ;3
       LDA    $87     ;3
       BIT    L5287   ;4
       BEQ    L5994   ;2
       CPX    #$6B    ;2
       BNE    L59AB   ;2
       LDA    #$60    ;2
       JMP    L59A7   ;3
L5994: LDX    $80     ;3
       CPX    #$5A    ;2
       BEQ    L59A1   ;2
       CPX    #$28    ;2
       BEQ    L59A1   ;2
       JMP    L59AB   ;3
L59A1: AND    #$03    ;2
       BNE    L59AB   ;2
       LDA    #$80    ;2
L59A7: ORA    $A2     ;3
       STA    $A2     ;3
L59AB: JSR    L5AAE   ;6
       LDX    $80     ;3
       BNE    L59B5   ;2
       JMP    L5A85   ;3
L59B5: LDX    #$03    ;2
L59B7: LDA    $9D,X   ;4
       BIT    L5285   ;4
       BNE    L59C2   ;2
       ORA    #$20    ;2
       STA    $9D,X   ;4
L59C2: DEX            ;2
       BNE    L59B7   ;2
       LDX    #$05    ;2
       JSR    L5C34   ;6
       LDX    #$06    ;2
       JSR    L5C34   ;6
       LDX    #$07    ;2
       JSR    L5C34   ;6
       LDA    $87     ;3
       BIT    L5286   ;4
       BEQ    L59E2   ;2
       BIT    $A0     ;3
       BVS    L59E2   ;2
       JSR    L5C34   ;6
L59E2: INC    $9C     ;5
       BNE    L59E8   ;2
       INC    $9B     ;5
L59E8: BIT    $87     ;3
       BMI    L59FD   ;2
       LDA    $9B     ;3
       CMP    #$10    ;2
       BNE    L59FD   ;2
       LDA    #$68    ;2
       STA    $9A     ;3
       LDA    #$C0    ;2
       STA    $87     ;3
       JMP    L52CE   ;3
L59FD: CLC            ;2
       LDA    $9D     ;3
       ADC    #$40    ;2
       BCC    L5A06   ;2
       ORA    #$40    ;2
L5A06: STA    $9D     ;3
       JMP    L531D   ;3
L5A0B: LDA    $9B     ;3
       BEQ    L59E2   ;2
       JMP    L52DE   ;3
L5A12: LDA    $9C     ;3
       EOR    #$01    ;2
       STA    $9C     ;3
       JMP    L59FD   ;3
L5A1B: LDA    #$06    ;2
       STA    AUDC1   ;3
       LDA    $9C     ;3
       CMP    #$40    ;2
       BNE    L5A9D   ;2
       LDA    $87     ;3
       AND    #$FA    ;2
       STA    $87     ;3
       LDA    #$00    ;2
       JMP    L5AA9   ;3
L5A30: LDA    $9C     ;3
       CMP    #$40    ;2
       BNE    L5A9D   ;2
       LDA    #$00    ;2
       STA    AUDV1   ;3
       LDA    $9A     ;3
       AND    #$EF    ;2
       STA    $9A     ;3
       BIT    $87     ;3
       BVC    L5A49   ;2
       LDX    #$01    ;2
       JSR    L5E6C   ;6
L5A49: LDA    $9D     ;3
       LSR            ;2
       AND    #$0F    ;2
       STA    $A4     ;3
       LDA    $9D     ;3
       AND    #$C0    ;2
       ORA    $A4     ;3
       STA    $9D     ;3
       AND    #$0F    ;2
       BNE    L5A82   ;2
       LDA    $96     ;3
       CMP    $98     ;3
       BCC    L5A73   ;2
       BEQ    L5A6B   ;2
       STA    $98     ;3
       LDA    $97     ;3
       JMP    L5A71   ;3
L5A6B: LDA    $97     ;3
       CMP    $99     ;3
       BCC    L5A73   ;2
L5A71: STA    $99     ;3
L5A73: LDA    $87     ;3
       AND    #$30    ;2
       STA    $87     ;3
       LDA    #$00    ;2
       STA    $9B     ;3
       STA    $9C     ;3
       JMP    L531D   ;3
L5A82: JMP    L52E5   ;3
L5A85: LDA    $87     ;3
       ORA    #$08    ;2
       STA    $87     ;3
       LDA    #$00    ;2
       STA    $9C     ;3
       STA    $9B     ;3
       SED            ;2
       CLC            ;2
       LDA    $96     ;3
       ADC    #$01    ;2
       STA    $96     ;3
       CLD            ;2
       JMP    L59E2   ;3
L5A9D: AND    #$07    ;2
       TAX            ;2
       LDA    L5271,X ;4
       AND    #$07    ;2
       STA    AUDF1   ;3
       LDA    #$07    ;2
L5AA9: STA    AUDV1   ;3
       JMP    L59E2   ;3
L5AAE: LDA    $87     ;3
       BIT    L5283   ;4
       BEQ    L5ABD   ;2
       LDX    $9C     ;3
       BNE    L5AC1   ;2
       AND    #$FB    ;2
       STA    $87     ;3
L5ABD: LDA    #$00    ;2
       STA    AUDV1   ;3
L5AC1: LDA    $9A     ;3
       BIT    L5FFE   ;4
       BNE    L5AD0   ;2
       BIT    L5286   ;4
       BNE    L5AFB   ;2
       JMP    L5BA3   ;3
L5AD0: BIT    $9A     ;3
       BVC    L5AD9   ;2
       LDA    $9C     ;3
       LSR            ;2
       BCC    L5ADE   ;2
L5AD9: LDX    #$01    ;2
       JSR    L5E14   ;6
L5ADE: LDA    $87     ;3
       BIT    L5282   ;4
       BEQ    L5AFA   ;2
       LDX    $9B     ;3
       CPX    #$04    ;2
       BNE    L5AFA   ;2
       AND    #$FC    ;2
       STA    $87     ;3
       LDX    #$03    ;2
L5AF1: LDA    $9D,X   ;4
       AND    #$EF    ;2
       STA    $9D,X   ;4
       DEX            ;2
       BNE    L5AF1   ;2
L5AFA: RTS            ;6

L5AFB: LDX    #$01    ;2
       JSR    L5E23   ;6
       LDA    $A1     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    $A1     ;3
       AND    #$0F    ;2
       TAY            ;2
       CPX    #$08    ;2
       BCS    L5B15   ;2
       LDA.wy $00ED,Y ;4
       BCC    L5B18   ;2
L5B15: LDA.wy $00DE,Y ;4
L5B18: AND    L5281,X ;4
       BEQ    L5B4D   ;2
       LDA    #$01    ;2
       JSR    L5FEB   ;6
       LDA    #$03    ;2
       STA    AUDC1   ;3
       LDA    #$0E    ;2
       STA    AUDF1   ;3
       LDA    #$04    ;2
       STA    AUDV1   ;3
       DEC    $80     ;5
       CPX    #$08    ;2
       BCS    L5B42   ;2
       LDA    L5281,X ;4
       EOR    #$FF    ;2
       AND.wy $00ED,Y ;4
       STA.wy $00ED,Y ;5
       JMP    L5B4D   ;3
L5B42: LDA    L5281,X ;4
       EOR    #$FF    ;2
       AND.wy $00DE,Y ;4
       STA.wy $00DE,Y ;5
L5B4D: LDA    $A1     ;3
       CMP    #$72    ;2
       BNE    L5B7A   ;2
       LDA    $A2     ;3
       AND    #$0F    ;2
       BEQ    L5B7A   ;2
       LDA    $A2     ;3
       AND    #$F0    ;2
       STA    $A2     ;3
       LDA    #$20    ;2
       JSR    L5FEB   ;6
       LDA    #$07    ;2
       STA    AUDC1   ;3
       LDA    #$09    ;2
       STA    AUDF1   ;3
       LDA    #$09    ;2
       STA    AUDV1   ;3
       LDA    #$F8    ;2
       STA    $9C     ;3
       LDA    $87     ;3
       ORA    #$04    ;2
       STA    $87     ;3
L5B7A: LDA    #$78    ;2
       BIT    $87     ;3
       BVC    L5B82   ;2
       LDA    #$76    ;2
L5B82: CMP    $A1     ;3
       BNE    L5BA3   ;2
       LDA    $A2     ;3
       AND    #$F0    ;2
       BEQ    L5BA3   ;2
       LDA    $A2     ;3
       AND    #$0F    ;2
       STA    $A2     ;3
       LDA    #$80    ;2
       STA    $9A     ;3
       LDA    $87     ;3
       ORA    #$07    ;2
       STA    $87     ;3
       LDA    #$00    ;2
       STA    $9C     ;3
       STA    $9B     ;3
       RTS            ;6

L5BA3: BIT    $87     ;3
       BVC    L5BC7   ;2
       LDX    #$01    ;2
       JSR    L5E04   ;6
       STA    $A4     ;3
L5BAE: LDA    $9A     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       TAX            ;2
       LDA    L5281,X ;4
       BIT    $A4     ;3
       BNE    L5C2C   ;2
       LDA    $9A     ;3
       CLC            ;2
       ADC    #$40    ;2
       STA    $9A     ;3
       JMP    L5BAE   ;3
L5BC7: LDA    SWCHA   ;4
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       CMP    #$0F    ;2
       BNE    L5BFB   ;2
       LDA    $9A     ;3
       BIT    L5286   ;4
       BNE    L5BDC   ;2
       JMP    L5ADE   ;3
L5BDC: LDX    #$01    ;2
       JSR    L5E04   ;6
       STA    $A4     ;3
L5BE3: LDA    $9A     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       TAX            ;2
       LDA    L5281,X ;4
       BIT    $A4     ;3
       BNE    L5C2C   ;2
       LDA    $9A     ;3
       AND    #$D0    ;2
       STA    $9A     ;3
       JMP    L5ADE   ;3
L5BFB: ASL            ;2
       ASL            ;2
       STA    $AA     ;3
       LDA    $9A     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       ORA    $AA     ;3
       TAX            ;2
       LDA    L527B,X ;4
       STA    $AA     ;3
       LDX    #$01    ;2
       JSR    L5E04   ;6
       STA    $A4     ;3
       LDA    $AA     ;3
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       TAX            ;2
       LDA    L5281,X ;4
       BIT    $A4     ;3
       BEQ    L5BE3   ;2
       LDA    $9A     ;3
       AND    #$3F    ;2
       ORA    $AA     ;3
       STA    $9A     ;3
L5C2C: LDX    #$01    ;2
       JSR    L5E6C   ;6
       JMP    L5ADE   ;3
L5C34: LDA    $99,X   ;4
       BIT    L5286   ;4
       BEQ    L5C4E   ;2
       BIT    L5FFE   ;4
       BNE    L5C43   ;2
       JMP    L5CDC   ;3
L5C43: ASL            ;2
       BPL    L5C4B   ;2
       LDA    $9C     ;3
       LSR            ;2
       BCC    L5C4E   ;2
L5C4B: JSR    L5E14   ;6
L5C4E: BIT    COLUP1  ;3
       BPL    L5C74   ;2
       LDA    $A0,X   ;4
       CMP    $A1     ;3
       BEQ    L5C8D   ;2
       LDA    $99,X   ;4
       AND    #$0F    ;2
       CMP    #$08    ;2
       BCS    L5C74   ;2
       LDA    $99,X   ;4
       ASL            ;2
       BPL    L5C75   ;2
       BCC    L5C6B   ;2
       LDA    #$10    ;2
       BNE    L5C6D   ;2
L5C6B: LDA    #$F0    ;2
L5C6D: CLC            ;2
       ADC    $A0,X   ;4
L5C70: CMP    $A1     ;3
       BEQ    L5C8D   ;2
L5C74: RTS            ;6

L5C75: BCC    L5C7B   ;2
       LDA    #$0F    ;2
       BNE    L5C7D   ;2
L5C7B: LDA    #$01    ;2
L5C7D: CLC            ;2
       ADC    $A0,X   ;4
       AND    #$0F    ;2
       STA    $A4     ;3
       LDA    $A0,X   ;4
       AND    #$F0    ;2
       ORA    $A4     ;3
       JMP    L5C70   ;3
L5C8D: LDA    $87     ;3
       AND    #$02    ;2
       BEQ    L5CB2   ;2
       LDA    $99,X   ;4
       BIT    L5285   ;4
       BNE    L5C74   ;2
       LDA    L50E1,X ;4
       STA    $99,X   ;4
       LDA    L50DE,X ;4
       STA    $A0,X   ;4
       LDA    L50E9,X ;4
       STA    $A8,X   ;4
       LDA    #$10    ;2
       JSR    L5FEB   ;6
       LDA    #$F8    ;2
       BNE    L5CC7   ;2
L5CB2: LDA    $9D     ;3
       BMI    L5CBB   ;2
       LDA    #$50    ;2
       JMP    L5CBD   ;3
L5CBB: LDA    #$D0    ;2
L5CBD: STA    $9A     ;3
       LDA    $99,X   ;4
       AND    #$DF    ;2
       STA    $99,X   ;4
       LDA    #$00    ;2
L5CC7: STA    $9C     ;3
       LDA    #$07    ;2
       STA    AUDC1   ;3
       LDA    #$07    ;2
       STA    AUDF1   ;3
       LDA    #$0C    ;2
       STA    AUDV1   ;3
       LDA    $87     ;3
       ORA    #$04    ;2
       STA    $87     ;3
       RTS            ;6

L5CDC: JSR    L5E23   ;6
       LDA    $99,X   ;4
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$03    ;2
       STA    $A4     ;3
       JSR    L5E04   ;6
       STA    $AA     ;3
       LDA    $9D     ;3
       SEC            ;2
       ROL            ;2
       ROL            ;2
       ROL            ;2
       AND    #$07    ;2
       STA    $AB     ;3
       CPX    $AB     ;3
       BNE    L5D18   ;2
L5CFB: LDY    $A4     ;3
       LDA    L5281,Y ;4
       BIT    $AA     ;3
       BNE    L5D12   ;2
       INC    $A4     ;5
       LDA    $A4     ;3
       AND    #$03    ;2
       TAY            ;2
       LDA    L5281,Y ;4
       BIT    $AA     ;3
       BEQ    L5CFB   ;2
L5D12: LDA    L52B7,Y ;4
       JMP    L5D66   ;3
L5D18: LDA    $9C     ;3
       BMI    L5D46   ;2
       LDA    $A0,X   ;4
       CMP    $A1     ;3
       BCS    L5D34   ;2
       LDA    $87     ;3
       BIT    L5282   ;4
       BNE    L5D3B   ;2
L5D29: LDA    $AA     ;3
       BIT    L5284   ;4
       BEQ    L5D46   ;2
       LDA    #$C0    ;2
       BNE    L5D66   ;2
L5D34: LDA    $87     ;3
       BIT    L5282   ;4
       BNE    L5D29   ;2
L5D3B: LDA    $AA     ;3
       BIT    L5282   ;4
       BEQ    L5D46   ;2
       LDA    #$40    ;2
       BNE    L5D66   ;2
L5D46: LDA    $A1     ;3
       AND    #$0F    ;2
       STA    $AB     ;3
       LDA    $A0,X   ;4
       AND    #$0F    ;2
       CMP    $AB     ;3
       BEQ    L5CFB   ;2
       BCS    L5D6E   ;2
       LDA    $87     ;3
       BIT    L5282   ;4
       BNE    L5D75   ;2
L5D5D: LDA    $AA     ;3
       BIT    L5281   ;4
       BEQ    L5CFB   ;2
       LDA    #$00    ;2
L5D66: STA    $99,X   ;4
       JSR    L5E6C   ;6
       JMP    L5C4E   ;3
L5D6E: LDA    $87     ;3
       BIT    L5282   ;4
       BNE    L5D5D   ;2
L5D75: LDA    $AA     ;3
       BIT    L5283   ;4
       BEQ    L5D80   ;2
       LDA    #$80    ;2
       BNE    L5D66   ;2
L5D80: JMP    L5CFB   ;3
L5D83: SEC            ;2
       SBC    #$07    ;2
       TAX            ;2
       AND    #$0F    ;2
       STA    $A4     ;3
       TXA            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       TAY            ;2
       CLC            ;2
       ADC    $A4     ;3
       CMP    #$0F    ;2
       BCC    L5D9B   ;2
       SBC    #$0F    ;2
       INY            ;2
L5D9B: CMP    #$09    ;2
       BCC    L5DA0   ;2
       INY            ;2
L5DA0: TAX            ;2
       TYA            ;2
       ORA    L5DA6,X ;4
       RTS            ;6

L5DA6: .byte $00,$F0,$E0,$D0,$C0,$B0,$A0,$90,$80,$60,$50,$40,$30,$20,$10
L5DB5: STA    WSYNC   ;3
       STA    HMCLR   ;3
L5DB9: DEY            ;2
       BNE    L5DB9   ;2
       STA    RESP0,X ;4
       STA    HMP0,X  ;4
       STA    WSYNC   ;3
       STA    HMOVE   ;3
       RTS            ;6

L5DC5: BCS    L5DCD   ;2
       LDX    #$09    ;2
       STX    $A4     ;3
       BCC    L5DD1   ;2
L5DCD: LDX    #$08    ;2
       STX    $A4     ;3
L5DD1: STA    $AA     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       AND    #$0F    ;2
       JSR    L50F9   ;6
       TAY            ;2
       LDX    $A4     ;3
L5DDF: LDA    L522B,Y ;4
       AND    #$F0    ;2
       STA    $8C,X   ;4
       INY            ;2
       DEX            ;2
       DEX            ;2
       BPL    L5DDF   ;2
       LDA    $AA     ;3
       AND    #$0F    ;2
       JSR    L50F9   ;6
       TAY            ;2
       LDX    $A4     ;3
L5DF5: LDA    L522B,Y ;4
       AND    #$0F    ;2
       ORA    $8C,X   ;4
       STA    $8C,X   ;4
       INY            ;2
       DEX            ;2
       DEX            ;2
       BPL    L5DF5   ;2
       RTS            ;6

L5E04: LDA    $A0,X   ;4
       LSR            ;2
       TAY            ;2
       LDA    L51B3,Y ;4
       BCC    L5E11   ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
L5E11: AND    #$0F    ;2
       RTS            ;6

L5E14: DEC    $99,X   ;6
       LDA    $99,X   ;4
       ASL            ;2
       BPL    L5E22   ;2
       BCS    L5E20   ;2
       INC    $A8,X   ;6
       RTS            ;6

L5E20: DEC    $A8,X   ;6
L5E22: RTS            ;6

L5E23: LDA    $99,X   ;4
       ASL            ;2
       BPL    L5E64   ;2
       BCS    L5E49   ;2
       LDA    $A0,X   ;4
       CLC            ;2
       ADC    #$F0    ;2
       STA    $A0,X   ;4
       AND    #$F0    ;2
       BEQ    L5E36   ;2
       RTS            ;6

L5E36: LDA    $A0,X   ;4
       ORA    #$E0    ;2
       STA    $A0,X   ;4
       LDA    #$15    ;2
       STA    $A8,X   ;4
L5E40: LDA    $99,X   ;4
       ORA    #$28    ;2
       STA    $99,X   ;4
       PLA            ;4
       PLA            ;4
       RTS            ;6

L5E49: LDA    $A0,X   ;4
       CLC            ;2
       ADC    #$10    ;2
       STA    $A0,X   ;4
       AND    #$F0    ;2
       CMP    #$E0    ;2
       BEQ    L5E57   ;2
       RTS            ;6

L5E57: LDA    $A0,X   ;4
       AND    #$0F    ;2
       STA    $A0,X   ;4
       LDA    #$85    ;2
       STA    $A8,X   ;4
       JMP    L5E40   ;3
L5E64: BCS    L5E69   ;2
       INC    $A0,X   ;6
       RTS            ;6

L5E69: DEC    $A0,X   ;6
       RTS            ;6

L5E6C: LDA    $99,X   ;4
       ROL            ;2
       BMI    L5E79   ;2
       ROR            ;2
       AND    #$C0    ;2
       ORA    #$2A    ;2
       STA    $99,X   ;4
       RTS            ;6

L5E79: ROR            ;2
       AND    #$C0    ;2
       ORA    #$28    ;2
       STA    $99,X   ;4
       RTS            ;6

L5E81: LDX    #$1E    ;2
L5E83: LDA    L5194,X ;4
       STA    $DD,X   ;4
       DEX            ;2
       BNE    L5E83   ;2
       LDA    #$78    ;2
       STA    $80     ;3
       RTS            ;6

L5E90: LDA    $A1     ;3
       AND    #$0F    ;2
       TAX            ;2
       BEQ    L5E9B   ;2
       LDA    $AF,X   ;4
       BNE    L5EDA   ;2
L5E9B: LDA    $B0,X   ;4
       BNE    L5EDA   ;2
       CPX    #$0E    ;2
       BEQ    L5EA7   ;2
       LDA    $B1,X   ;4
       BNE    L5EDA   ;2
L5EA7: BIT    $9A     ;3
       BVS    L5F06   ;2
       BMI    L5EDB   ;2
       CPX    #$0D    ;2
       BEQ    L5EB7   ;2
       BCS    L5F06   ;2
       LDY    $B2,X   ;4
       BNE    L5EDA   ;2
L5EB7: LDA    $9A     ;3
       BIT    L5286   ;4
       BEQ    L5F06   ;2
       AND    #$0F    ;2
       BNE    L5EC6   ;2
       INX            ;2
       JMP    L5F06   ;3
L5EC6: EOR    #$FF    ;2
       SEC            ;2
       ADC    #$13    ;2
       STA    $B0,X   ;4
       CMP    #$0B    ;2
       BCC    L5F01   ;2
       SEC            ;2
       SBC    #$0A    ;2
       STA    $B1,X   ;4
       LDA    #$41    ;2
       STA    $D0,X   ;4
L5EDA: RTS            ;6

L5EDB: CPX    #$01    ;2
       BCC    L5F06   ;2
       BEQ    L5EE5   ;2
       LDA    $AE,X   ;4
       BNE    L5EDA   ;2
L5EE5: LDA    $9A     ;3
       BIT    L5286   ;4
       BEQ    L5F06   ;2
       AND    #$0F    ;2
       BNE    L5EF4   ;2
       DEX            ;2
       JMP    L5F06   ;3
L5EF4: SEC            ;2
       SBC    #$01    ;2
       STA    $B0,X   ;4
       CMP    #$09    ;2
       BCS    L5F01   ;2
       ADC    #$0A    ;2
       STA    $AF,X   ;4
L5F01: LDA    #$41    ;2
       STA    $CF,X   ;4
       RTS            ;6

L5F06: LDA    #$09    ;2
       STA    $B0,X   ;4
       JMP    L5F01   ;3
L5F0D: TAX            ;2
       LDA    $AF,X   ;4
       BNE    L5F3D   ;2
       LDA    $B0,X   ;4
       BNE    L5F3D   ;2
       LDA    $B1,X   ;4
       BNE    L5F3D   ;2
       LDA    $A1     ;3
       AND    #$0F    ;2
       TAY            ;2
       INY            ;2
       BIT    $9A     ;3
       BVS    L5F33   ;2
       BMI    L5F27   ;2
       INY            ;2
L5F27: LDA.wy $00CE,Y ;4
       BEQ    L5F33   ;2
       STX    $AA     ;3
       CPY    $AA     ;3
       BNE    L5F33   ;2
       RTS            ;6

L5F33: LDA    #$09    ;2
       STA    $B0,X   ;4
       LDA    $A4     ;3
       ORA    #$40    ;2
       STA    $CF,X   ;4
L5F3D: RTS            ;6

L5F3E: LDA.wy $00A0,Y ;4
       AND    #$0F    ;2
       TAX            ;2
       LDA    $BF,X   ;4
       BNE    L5F95   ;2
       LDA.wy $0099,Y ;4
       ASL            ;2
       BMI    L5F96   ;2
       BCS    L5FAD   ;2
       CPX    #$0D    ;2
       BEQ    L5F5A   ;2
       BCS    L5F96   ;2
       LDA    $C1,X   ;4
       BNE    L5F95   ;2
L5F5A: LDA    $C0,X   ;4
       BNE    L5F95   ;2
       CPX    #$01    ;2
       BCC    L5F66   ;2
       LDA    $BE,X   ;4
       BNE    L5F95   ;2
L5F66: LDA.wy $0099,Y ;4
       BIT    L5286   ;4
       BEQ    L5FA6   ;2
       AND    #$0F    ;2
       BNE    L5F76   ;2
       INX            ;2
       JMP    L5FA6   ;3
L5F76: EOR    #$FF    ;2
       SEC            ;2
       ADC    #$14    ;2
       CMP    #$13    ;2
       BCS    L5F85   ;2
       STA    $BF,X   ;4
       CMP    #$0B    ;2
       BCC    L5FDF   ;2
L5F85: SEC            ;2
       SBC    #$0A    ;2
       STA    $C0,X   ;4
       TYA            ;2
       AND    #$03    ;2
       ASL            ;2
       ASL            ;2
       ORA    #$80    ;2
       ORA    $D0,X   ;4
       STA    $D0,X   ;4
L5F95: RTS            ;6

L5F96: CPX    #$0E    ;2
       BEQ    L5FA2   ;2
       LDA    $C0,X   ;4
       BNE    L5F95   ;2
       CPX    #$00    ;2
       BEQ    L5FA6   ;2
L5FA2: LDA    $BE,X   ;4
       BNE    L5F95   ;2
L5FA6: LDA    #$0A    ;2
       STA    $BF,X   ;4
       JMP    L5FDF   ;3
L5FAD: CPX    #$00    ;2
       BEQ    L5F96   ;2
       LDA    $BE,X   ;4
       BNE    L5F95   ;2
       CPX    #$0E    ;2
       BEQ    L5FBD   ;2
       LDA    $C0,X   ;4
       BNE    L5F95   ;2
L5FBD: CPX    #$02    ;2
       BCC    L5FC5   ;2
       LDA    $BD,X   ;4
       BNE    L5F95   ;2
L5FC5: LDA.wy $0099,Y ;4
       BIT    L5286   ;4
       BEQ    L5FA6   ;2
       AND    #$0F    ;2
       BNE    L5FD5   ;2
       DEX            ;2
       JMP    L5FA6   ;3
L5FD5: STA    $BF,X   ;4
       CMP    #$09    ;2
       BCS    L5FDF   ;2
       ADC    #$0A    ;2
       STA    $BE,X   ;4
L5FDF: TYA            ;2
       AND    #$03    ;2
       ASL            ;2
       ASL            ;2
       ORA    #$80    ;2
       ORA    $CF,X   ;4
       STA    $CF,X   ;4
       RTS            ;6

L5FEB: SED            ;2
       CLC            ;2
       ADC    $97     ;3
       STA    $97     ;3
       BCC    L5FF9   ;2
       LDA    $96     ;3
       ADC    #$00    ;2
       STA    $96     ;3
L5FF9: CLD            ;2
       RTS            ;6

L5FFB: .byte $60,$BB,$52
L5FFE: .byte $0F,$0E
