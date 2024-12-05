; Space War for the Atari 2600 VCS
;
; Copyright 1978 Atari
; Written by ????
;
; Reverse-Engineered by Manuel Polik (cybergoth@nexgo.de)
; Compiles with DASM
;
; History
; 29.01.2K5     - Started

      processor 6502
      include vcs.h

; RAM variables:

gameTimer           = $80   ; Counts ~ 10 minutes

frameCounter        = $82   ; is incremented once every frame
binGameVariant      = $83   ; Current game variant in binary Format(0-16)
bcdGameVariant      = $84   ; Current game variant in BCD Format(1-17)

; Variables from $98 to $A4 are set to $FF on reset
gameState           = $98   ; FF running v 00 not running
galaxyBoundry1      = $99
galaxyBoundry2      = $9A
galaxyBoundry3      = $9B
galaxyBoundry4      = $9C
fuelP0              = $9D
;fuelP1              = $9E
missileTimeP0       = $9F
;missileTimeP1       = $A0
deathTimeP0         = $A1
;deathTimeP1         = $A2
rePosP0             = $A3
rePosP1             = $A4

; Variables from $A5 to $CA are cleared on reset
XX                  = $A5

horBoundryP0        = $AB
horBoundryP1        = $AC
verPosP0            = $AF
verPosP1            = $B0

YY                  = $CA

varSpaceShuttle     = $CB   ;
variantsettings2    = $CC   ;
variantsettings3    = $CD   ;
variantsettings4    = $CE   ;
varGalaxyBoundries  = $CF   ;
variantsettings6    = $D0   ;
variantsettings7    = $D1   ;
variantsettings8    = $D2   ;

       ORG $F000

START:
    SEI
    CLD                     ; Clear Flags
    LDX #$FF                ;
    TXS                     ; Init Stack
    LDA #$17                ;
    STA bcdGameVariant      ; -> highest variant
    JSR ResetGame
    JSR LF10F
    LDA #$F7
    STA $89
    STA $8B
    LDA #$00
    STA ENABL
    STA VDELP0
    STA VDELP1
    STA VDELBL
    STA HMBL
    STA PF0
    LDA #$10
    STA NUSIZ0
    STA NUSIZ1
    LDX #$03
LF02B:
    LDA LF7C3,X
    STA $DC,X
    STA COLUP0,X
    DEX
    BPL LF02B
LF035:
    JSR LF041
    JSR LF17D
    JSR LF391
    JMP LF035
LF041:
    INC frameCounter
LF043:
    LDA INTIM
    BNE LF043
    LDA #$02
    STA WSYNC
    STA VSYNC
    LDA #$00
    STA WSYNC
    STA WSYNC
    STA WSYNC
    STA VSYNC
    LDA #$2C
    STA TIM64T
    LDX #$03
    LDY #$0D
    LDA SWCHB
    AND #$08
    BEQ LF06E
    LDA gameState           ; Game Running?
    BEQ LF079               ; N:
    LDY #$03                ; Y:
LF06E:
    LDA LF7C3,Y
    STA COLUP0,X
    DEY
    DEX
    BPL LF06E
    BMI LF089
LF079:
    LDA frameCounter
    BNE LF089
LF07D:
    LDA $DC,X
    CLC
    ADC #$6E
    STA $DC,X
    STA COLUP0,X
    DEX
    BPL LF07D
LF089:

    LDA SWCHB               ;
    LSR                     ; Reset Pressed?
    BCC ResetGame           ; Y:
    JMP LF0CD               ; N:

ResetGame
    LDA #$FF                ; Inits several values to $FF
    LDX #$0C                ;
InitToFF                    ;
    STA $98,X               ;
    DEX                     ;
    BPL InitToFF            ;

    LDX #$74                ; Init Game Timer
    STX gameTimer           ; $74 * 255 frames ~= 10 minutes

    LDA #$00                ;
    LDX varGalaxyBoundries  ; Use Boundries?
    BPL DontUseBoundries    ; Y:
    STA galaxyBoundry3      ; N: Use them
    STA galaxyBoundry4      ;
    STA galaxyBoundry1      ;
    STA galaxyBoundry2      ;
DontUseBoundries            ;

    STA CXCLR               ; Clear collisions

    LDX #$25                ; Init several values to $00
ClearRAM                    ;
    STA $A5,X               ;
    DEX                     ;
    BPL ClearRAM            ;

    LDX #$01
LF0B8:
    LDA horizontalboundries,X
    STA horBoundryP0,X
    LDA verticalStartPos,X
    STA verPosP0,X
    LDA LF7E1,X
    STA $86,X
    DEX
    BPL LF0B8
    JMP LF140

LF0CD:
    LDY #$00                ; Show no stats
    LDA gameState           ; Game Running?
    BPL NoStats             ; N:
    LDA gameTimer           ; Y:
    CMP #$FC                ; 10 minutes almost over?
    BCC NoStats             ; N:
    LDA frameCounter        ; Y: Blink stats
    AND #$30                ;
    BNE NoStats             ;
    LDY #$09                ; Show stats
NoStats
    STY $85

    LDA frameCounter
    BNE TimoutCheckDone
    LDA gameState           ; Game Running?
    BEQ TimoutCheckDone     ; N:
    INC gameTimer           ; Y: Timer expired?
    BNE TimoutCheckDone     ; N:
    LDA #$00                ; Y: Game Over
    STA gameState           ;
TimoutCheckDone

    LDA SWCHB
    AND #$02
    BEQ LF0FF
    LDA #$FF
    STA $D9
LF0FE:
    RTS

LF0FF:
    LDA $D9
    BMI LF109
    EOR frameCounter
    AND #$1F
    BNE LF0FE
LF109:
    LDA frameCounter
    AND #$3F
    STA $D9
LF10F:
    STA WSYNC               ; [#1] Synced for positioning the ball
    LDA #$00                ; Game Over
    STA gameState           ;
    LDA #$FF
    STA $A8
    LDA #$00
    STA galaxyBoundry1
    STA galaxyBoundry2
    STA galaxyBoundry3
    STA galaxyBoundry4

    INC binGameVariant      ; Increment game variant
    SED                     ;
    LDA bcdGameVariant      ;
    CLC                     ;
    ADC #$01                ;
    CLD                     ;
    STA bcdGameVariant      ;
    CMP #$18                ; Higher than max variant?
    STA RESBL               ; [#1] Position Ball
    BNE VariantFine         ; N: Fine
    LDA #$01                ; Y: Skip to lowest variant
    STA bcdGameVariant      ;
    LDA #$00                ;
    STA binGameVariant      ;
VariantFine                 ;

    LDA bcdGameVariant
    STA $A7
LF140:
    LDA #$02
    STA RESMP0
    STA RESMP1

    LDX binGameVariant      ; Copy the each bit from the
    LDA gamesettingtab,X    ; variant settings
    LDX #$07                ; to an extra byte
CopySettings                ;
    STA varSpaceShuttle,X  ;
    ROL                     ;
    DEX                     ;
    BPL CopySettings        ;

    LDA varGalaxyBoundries
    BPL LF17B
    LDX #$00
    JSR LF6F0
    LDA horBoundryP0
    STA $AD
    LDA #$30
    STA $B1
    LDA variantsettings7
    BPL LF17B
    LDX #$01
    JSR LF6F0
    LDA horBoundryP1
    STA $AE
    LDA #$30
    STA $B2
    LDA $B6
    EOR #$FF
    STA $B6
LF17B:
    RTS

LF17C:
    RTS

LF17D:
    LDA gameState           ; Game Running?
    BPL LF17C               ; N:
    LDA variantsettings6    ; Y:
    BPL LF188
    JMP LF2C3
LF188:
    LDA SWCHA
    LDX #$01
LF18D:
    AND #$0F
    STA $D3
    LDA varSpaceShuttle
    BMI LF1D0
    LDY $A9,X
    BPL LF1B3
    LDA frameCounter
    AND #$03
    BNE LF1B3
    DEC fuelP0,X
    BNE LF1B3
    ASL galaxyBoundry3,X
    BNE LF1B3
LF1A7:
    TXA
    TAY
    JSR LF6B3
    LDA #$02
    STA $A9,X
    JMP LF1D0
LF1B3:
    LDA $D3
    EOR #$0D
    BNE LF1CB
    TYA
    AND #$02
    BNE LF1D0
    TYA
    EOR #$82
    STA $A9,X
    BPL LF1D0
    ASL galaxyBoundry3,X
    BNE LF1D0
    BEQ LF1A7
LF1CB:
    TYA
    AND #$80
    STA $A9,X
LF1D0:
    LDA $A9,X
    BPL LF1D7
    JMP LF2BF
LF1D7:
    LDA varGalaxyBoundries
    ORA INPT4,X
    BMI LF22B
    LDA missileTimeP0,X
    BPL LF22B
    LDA galaxyBoundry1,X
    BEQ LF22B
    LDA #$7F
    STA missileTimeP0,X
    LDA horBoundryP0,X
    STA $AD,X
    LDA #$00
    STA RESMP0,X
    LDA verPosP0,X
    CLC
    ADC #$02
    STA $B1,X
    LDA $C3,X
    STA $C5,X
    LDA $C7,X
    STA $C9,X
    LDY $86,X
    LDA LF7E8,Y
    SEC
    BMI LF209
    CLC
LF209:
    ROR
    CLC
    ADC $B7,X
    STA $B9,X
    TYA
    CLC
    ADC #$04
    AND #$0F
    TAY
    LDA LF7E8,Y
    SEC
    BMI LF21D
    CLC
LF21D:
    ROR
    CLC
    ADC $B3,X
    STA $B5,X
    LDA #$00
    STA $BD,X
    STA $C1,X
    ASL galaxyBoundry1,X
LF22B:
    LDA $D3
    LSR
    LSR
    DEC $96,X
    CMP #$01
    BEQ LF247
    CMP #$02
    BEQ LF23F
    LDA #$00
    STA $96,X
    BEQ LF257
LF23F:
    LDA $96,X
    BPL LF257
    INC $86,X
    BPL LF24D
LF247:
    LDA $96,X
    BPL LF257
    DEC $86,X
LF24D:
    LDA $86,X
    AND #$0F
    STA $86,X
    LDA #$07
    STA $96,X
LF257:
    LDA varGalaxyBoundries
    BMI LF25F
    LDA galaxyBoundry3,X
    BEQ LF29E
LF25F:
    LDA $D3
    AND #$01
    BNE LF29E
    LDA #$FF
    STA $DA,X
    LDA frameCounter
    AND #$03
    BNE LF29E
    LDY $86,X
    LDA LF7E8,Y
    BPL LF278
    DEC $B7,X
LF278:
    CLC
    ADC $BF,X
    STA $BF,X
    BCC LF281
    INC $B7,X
LF281:
    TYA
    CLC
    ADC #$04
    AND #$0F
    TAY
    LDA LF7E8,Y
    BPL LF28F
    DEC $B3,X
LF28F:
    CLC
    ADC $BB,X
    STA $BB,X
    BCC LF298
    INC $B3,X
LF298:
    DEC fuelP0,X
    BNE LF29E
    ASL galaxyBoundry3,X
LF29E:
    LDA SWCHB
    STA $D8
    LDA CXM0P,X
    BMI LF2CF
    ROL
    BMI LF2E1
    LDA CXP0FB,X
    ROL
    BPL LF2B2
    JMP LF34A
LF2B2:
    LDA CXM0FB,X
    ROL
    BPL LF2BF
    LDA varGalaxyBoundries
    BMI LF2BF
    LDA #$02
    STA RESMP0,X
LF2BF:
    TXA
    BNE LF2C3
    RTS

LF2C3:
    LDX #$00
    LDA SWCHA
    ROR
    ROR
    ROR
    ROR
    JMP LF18D
LF2CF:
    TXA
    EOR #$01
    TAY
    LDA variantsettings7
    BMI LF2BF
    LDA varGalaxyBoundries
    BMI LF304
    LDA #$02
    STA RESMP0,X
    BNE LF2FE
LF2E1:
    TXA
    TAY
    LDA varGalaxyBoundries
    BMI LF304
    LDA #$7F
    SEC
    SBC missileTimeP0,X
    AND #$F8
    BEQ LF2BF
    LDA #$02
    STA RESMP0,X
    CPX #$00
    BNE LF2FA
    ROL $D8
LF2FA:
    BIT $D8
    BPL LF2BF
LF2FE:
    JSR LF6B3
    JMP LF2BF
LF304:
    LDA.wy $009F,Y
    BPL LF2BF
    LDA.wy $00B3,Y
    SEC
    SBC $B5,X
    BPL LF316
    EOR #$FF
    CLC
    ADC #$01
LF316:
    STA $D3
    LDA.wy $00B7,Y
    SEC
    SBC $B9,X
    BPL LF325
    EOR #$FF
    CLC
    ADC #$01
LF325:
    CLC
    ADC $D3
    CPY #$00
    BNE LF32E
    ROL $D8
LF32E:
    BIT $D8
    BMI LF334
    AND #$F0
LF334:
    AND #$FE
    BNE LF2BF
    JSR LF6DC
    JSR LF6F0
    LDA #$7F
    STA.wy $009F,Y
LF343:
    JMP LF2BF
LF346:
    TXA
    TAY
    BPL LF2FE
LF34A:
    LDA varGalaxyBoundries
    BMI LF343
    LDA horizontalboundries,X
    STA horBoundryP0,X
    LDA verticalStartPos,X
    STA verPosP0,X
    LDA #$00
    STA $C3,X
    STA $C7,X
    STA $B3,X
    STA $B7,X
    STA $BB,X
    STA $BF,X
    LDA #$FF
    STA rePosP0,X
    LDA variantsettings2
    BPL LF346
    LDA $B3,X
    BPL LF377
    EOR #$FF
    CLC
    ADC #$01
LF377:
    STA $D3
    LDA $B7,X
    BPL LF382
    EOR #$FF
    CLC
    ADC #$01
LF382:
    ADC $D3
    AND #$FC
    BNE LF346
    LDA #$FF
    STA galaxyBoundry3,X
    STA galaxyBoundry1,X
    JMP LF2BF
LF391:
    LDX #$01
    LDA variantsettings6
    BMI LF39B
LF397:
    LDA $A9,X
    BPL LF39F
LF39B:
    LDA #$3D
    BNE LF3C5
LF39F:
    LDA $86,X
    CMP #$04
    BPL LF3B0
LF3A5:
    EOR #$FF
    SEC
    ADC #$14
    AND #$0F
    LDY #$08
    BNE LF3B9
LF3B0:
    CMP #$0D
    BPL LF3A5
    SEC
    SBC #$04
    LDY #$00
LF3B9:
    STA $D3
    STY REFP0,X
    ASL
    ASL
    CLC
    ADC $D3
    CLC
    ADC #$10
LF3C5:
    STX $D5
    CPX #$00
    BEQ LF3E1
    STA $8A
    LDA variantsettings6
    BMI LF3D5
    LDA $A8
    BPL LF3E3
LF3D5:
    LDY #$04
    LDA #$00
LF3D9:
    STA.wy $0091,Y
    DEY
    BPL LF3D9
    BMI LF442
LF3E1:
    STA $88
LF3E3:
    LDA $A7,X
    AND #$0F
    STA $D3
    ASL
    CLC
    ADC $D3
    TAY
    CPX #$00
    BEQ LF3F4
    LDX #$05
LF3F4:
    LDA LF763,Y
    ROR
    ROR
    ROR
    ROR
    AND #$0F
    STA $8C,X
    LDA LF763,Y
    AND #$0F
    BEQ LF40D
    INX
    STA $8C,X
    INX
    INY
    BPL LF3F4
LF40D:
    LDY $D5
    LDA.wy $00A7,Y
    ROR
    ROR
    ROR
    ROR
    AND #$0F
    BEQ LF442
    STA $D3
    ASL
    CLC
    ADC $D3
    ADC #$02
    TAY
    BPL LF435
LF425:
    LDA LF763,Y
    ROL
    ROL
    ROL
    ROL
    AND #$F0
    BEQ LF442
    ORA $8C,X
    STA $8C,X
    DEX
LF435:
    LDA LF763,Y
    DEY
    AND #$F0
    ORA $8C,X
    STA $8C,X
    DEX
    BPL LF425
LF442:
    LDX $D5
    LDA missileTimeP0,X
    BMI LF464
    BNE LF462
    LDA varGalaxyBoundries
    BMI LF462
    LDA #$02
    STA RESMP0,X
    LDA galaxyBoundry1
    ORA galaxyBoundry2
    BNE LF462
    LDA gameState           ; Game Running?
    BEQ LF462               ; N:
    LDA #$FF                ; Y:
    STA galaxyBoundry1
    STA galaxyBoundry2
LF462:
    DEC missileTimeP0,X
LF464:
    LDA deathTimeP0,X
    BMI LF490
    DEC $A1,X
    INC $86,X
    LDA $86,X
    AND #$0F
    STA $86,X
    LDA deathTimeP0,X
    AND #$03
    BNE LF47E
    LDA $A5,X
    EOR #$7E
    STA $A5,X
LF47E:
    LDA deathTimeP0,X
    SEC
    SBC #$2F
    BMI LF490
    TAY
    LDA LF753,Y
    PHA
    LDY #$10
    LDA #$08
    BNE LF4BF
LF490:
    SEC
    LDA #$80
    SBC missileTimeP0,X
    CMP #$10
    BEQ LF4AD
    BPL LF4A9
    TAY
    LDA #$07
    PHA
    LDA #$08
    BIT varGalaxyBoundries
    BPL LF4BF
    LDA #$09
    BPL LF4BF
LF4A9:
    LDA $DA,X
    BMI LF4B3
LF4AD:
    LDA #$00
    STA AUDV0,X
    BEQ LF4C6
LF4B3:
    LDA #$00
    STA $DA,X
    LDA #$02
    PHA
    LDY LF7F8,X
    LDA #$08
LF4BF:
    STY AUDF0,X
    STA AUDC0,X
    PLA
    STA AUDV0,X
LF4C6:
    DEX
    BMI LF4CC
    JMP LF397
LF4CC:
    STA WSYNC
    STA HMOVE
    LDA #$00
    LDY #$03
LF4D4:
    DEY
    BPL LF4D4
    LDX rePosP0
    BMI LF4DD
    BPL LF4DF
LF4DD:
    STA RESP0
LF4DF:
    STA GRP0
    STA GRP1
    STA ENAM0
    STA ENAM1
    TSX
    LDY rePosP1
    BPL LF4EE
    STA RESP1
LF4EE:
    STA CXCLR
    LDA #$02
    STX $D3
    STA CTRLPF
    STA rePosP0
    STA rePosP1
LF4FA:
    LDA INTIM
    BNE LF4FA
    STA WSYNC
    STA VBLANK
    LDX $85
    BEQ LF50E
LF507:
    STA WSYNC
    DEX
    BPL LF507
    BMI LF53A
LF50E:
    SEC
    LDX #$04
LF511:
    STA WSYNC
    LDA $8C,X
    STA PF1
    LDY LF7E3,X
    LDA.wy $0000,Y
    STA PF2
    NOP
    LDA $91,X
    INC $40
    INC $40
    STA PF1
    LDA.wy $0001,Y
    INC $40
    STA PF2
    BCS LF537
    SEC
    DEX
    BPL LF511
    BMI LF53A
LF537:
    CLC
    BCC LF511
LF53A:
    LDA #$00
    STA WSYNC
    STA PF1
    STA PF2
    LDA #$11
    STA CTRLPF
    LDA #$00
    STA $81
LF54A:
    LDX #$1E
    TXS
    SEC
    LDA $81
    SBC verPosP0
    TAY
    CMP #$05
    BCC LF55B
    LDA #$00
    BEQ LF55F
LF55B:
    LDA ($88),Y
    EOR $A5
LF55F:
    STA WSYNC
    STA GRP0
    LDA $81
    SEC
    SBC $B2
    AND #$FE
    PHP
    LDA $81
    SEC
    SBC $B1
    AND #$FE
    PHP
    LDA $81
    SEC
    SBC verPosP1
    TAY
    CMP #$05
    BCC LF581
    LDA #$00
    BEQ LF585
LF581:
    LDA ($8A),Y
    EOR $A6
LF585:
    STA WSYNC
    STA GRP1
    LDA variantsettings3
    BMI LF5A1
    LDA $81
    EOR #$2E
    BNE LF599
    LDA #$02
    STA ENABL
    BNE LF5A1
LF599:
    LDA $81
    EOR #$30
    BNE LF5A1
    STA ENABL
LF5A1:
    INC $81
    LDA $81
    EOR #$5E
    BNE LF54A
    LDX $D3
    TXS
    LDA #$02
    STA WSYNC
    STA VBLANK
    LDA #$1A
    STA TIM64T
    LDX #$07
LF5B9:
    LDA $B3,X
    TAY
    ROL
    EOR $B3,X
    ROL
    TYA
    BCC LF5C7
    EOR #$7F
    STA $B3,X
LF5C7:
    ROR
    ROR
    ROR
    ROR
    AND #$0F
    CPY #$00
    BPL LF5D3
    ORA #$F0
LF5D3:
    STA $D3
    TYA
    ROL
    ROL
    ROL
    ROL
    AND #$F0
    STA $D4
    LDA $BB,X
    ROR
    ROR
    ROR
    ROR
    AND #$0F
    ORA $D4
    CLC
    ADC $C3,X
    STA $C3,X
    LDA horBoundryP0,X
    STA $D5
    ADC $D3
    STA horBoundryP0,X
    SEC
    SBC $D5
    STA $D7
    LDY #$5A
    TXA
    AND #$FC
    BNE LF60B
    LDA $D7
    ROL
    ROL
    ROL
    ROL
    STA HMP0,X
    LDY #$9F
LF60B:
    TYA
    SEC
    SBC horBoundryP0,X
    AND #$F0
    EOR #$F0
    BEQ LF625
    LDA horBoundryP0,X
    AND #$F0
    EOR #$F0
    BNE LF654
    BIT variantsettings4
    BMI LF62B
    TYA
    SEC
    BCS LF650
LF625:
    LDA variantsettings4
    BPL LF64C
    TYA
    ASL
LF62B:
    SEC
    SBC horBoundryP0,X
    STA horBoundryP0,X
    CPY #$9F
    BNE LF63D
    SEC
    SBC $D5
    ROL
    ROL
    ROL
    ROL
    STA HMP0,X
LF63D:
    LDA #$00
    SEC
    SBC $BB,X
    STA $BB,X
    LDA #$00
    SBC $B3,X
    STA $B3,X
    BVC LF654
LF64C:
    TYA
    EOR #$FF
    CLC
LF650:
    ADC horBoundryP0,X
    STA horBoundryP0,X
LF654:
    DEX
    BMI LF65A
    JMP LF5B9
LF65A:
    LDA variantsettings2
    BPL LF65F
LF65E:
    RTS

LF65F:
    LDA frameCounter
    LSR
    BCC LF65E
    AND #$03
    TAX
    LDA #$50
    SEC
    SBC horBoundryP0,X
    STA $D3
    BPL LF675
    EOR #$FF
    CLC
    ADC #$01
LF675:
    LSR
    LSR
    LSR
    STA $D5
    LDA #$2C
    SEC
    SBC verPosP0,X
    STA $D4
    BPL LF688
    EOR #$FF
    CLC
    ADC #$01
LF688:
    AND #$F8
    STA $D6
    LSR
    LSR
    LSR
    STA $D8
    ASL
    CLC
    ADC $D6
    ADC $D5
    TAY
    LDA $D3
    JSR LF6C5
    TXA
    CLC
    ADC #$04
    TAX
    LDA $D5
    ASL
    ASL
    CLC
    ADC $D5
    ASL
    ADC $D8
    TAY
    LDA $D4
    JSR LF6C5
    RTS

LF6B3:
    LDA.wy $00A1,Y
    BPL LF6C4
    LDA #$3F
    STA.wy $00A1,Y
    TYA
    EOR #$01
    TAY
    JSR LF6DC
LF6C4:
    RTS

LF6C5:
    ROL
    LDA LF781,Y
    BCC LF6D2
    DEC $B3,X
    EOR #$FF
    CLC
    ADC #$01
LF6D2:
    CLC
    ADC $BB,X
    STA $BB,X
    BCC LF6DB
    INC $B3,X
LF6DB:
    RTS

LF6DC:
    CLC
    LDA #$01
    SED
    ADC.wy $00A7,Y
    CLD
    STA.wy $00A7,Y
    CMP #$10
    BNE LF6C4
    LDA #$00                ; Game Over
    STA gameState           ;
    RTS

LF6F0:
    LDA frameCounter
    ROR
    AND #$07
    BCS LF6F9
    ORA #$78
LF6F9:
    ROL
    STA $B5,X
    LDA frameCounter
    ROL
    ROL
    ROL
    ROL
    AND #$07
    BCS LF708
    ORA #$78
LF708:
    ROL
    STA $B9,X
    LDA #$00
    STA RESMP0,X
    RTS

LF710: .byte $10,$10,$38,$38,$7C,$20,$30,$38,$3C,$30,$40,$30,$3C,$18,$10,$00
       .byte $40,$3E,$1C,$0C,$04,$1C,$FC,$1C,$04,$0C,$1C,$3E,$40,$00,$10,$18
       .byte $3C,$30,$40,$30,$3C,$38,$30,$20,$7C,$38,$38,$10,$10,$00,$00,$00
       .byte $00,$00

gamesettingtab
;                       G
;                       A
;                       L
;                   S   A
;                   P   X
;                   A   Y
;                   C
;                   E   B
;                       O
;                   S   U
;                   H   N
;                   U   D
;                   T   R
;                   T   I
;                   L   E
;                   E   S
       .byte $0F ; |    XXXX| Variant 01
       .byte $0E ; |    XXX | Variant 02
       .byte $06 ; |     XX | Variant 03
       .byte $08 ; |    X   | Variant 04
       .byte $00 ; |        | Variant 05
       .byte $0A ; |    X X | Variant 06
       .byte $02 ; |      X | Variant 07
       .byte $D7 ; |XX X XXX| Variant 08
       .byte $97 ; |X  X XXX| Variant 09
       .byte $D1 ; |XX X   X| Variant 10
       .byte $D9 ; |XX XX  X| Variant 11
       .byte $9F ; |X  XXXXX| Variant 12
       .byte $DF ; |XX XXXXX| Variant 13
       .byte $B7 ; |X XX XXX| Variant 14
       .byte $B1 ; |X XX   X| Variant 15
       .byte $BF ; |X XXXXXX| Variant 16
       .byte $B9 ; |X XXX  X| Variant 17

LF753: .byte $07,$07,$07,$00,$07,$07,$07,$00,$07,$07,$07,$07,$07,$07,$07,$07
LF763: .byte $EA,$AA,$E0,$22,$22,$20,$E8,$E2,$E0,$E2,$62,$E0,$22,$EA,$A0,$E2
       .byte $E8,$E0,$EA,$E8,$E0,$22,$22,$E0,$EA,$EA,$E0,$E2,$EA,$E0
LF781: .byte $FF,$87,$3C,$20,$13,$0D,$09,$07,$06,$04,$33,$3F,$28,$19,$11,$0C
       .byte $09,$07,$05,$04,$0C,$18,$17,$12,$0D,$0A,$08,$06,$05,$04,$05,$0B
       .byte $0D,$0C,$0A,$08,$06,$05,$04,$04,$02,$06,$07,$08,$07,$06,$05,$04
       .byte $04,$03,$01,$03,$05,$05,$05,$05,$04,$04,$03,$03,$01,$02,$03,$03
       .byte $04,$04
LF7C3: .byte $5A,$9A,$1E,$D0,$01,$01,$02,$02,$03,$03,$0E,$00,$0E,$06,$01,$01
       .byte $01,$02,$02,$02

horizontalboundries
        .byte $72,$30

verticalStartPos
        .byte $0C,$4E

       .byte $01,$01,$01,$01,$02,$02
LF7E1: .byte $0C,$04
LF7E3: .byte $99,$99,$40,$9B,$9B
LF7E8: .byte $00,$E5,$CD,$BE,$B8,$BE,$CD,$E5,$00,$1B,$33,$42,$48,$42,$33,$1B
LF7F8: .byte $07,$0A
    .word $F000
    .word $F000
    .word $F000