; Disassembly of glib.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line:    C:\DISTELLA.EXE -pasfcglib.cfg glib.bin
;
; glib.cfg contents:
;
;      ORG F000
;      CODE F000 F27B
;      DATA F27C F2F4
;      GFX F2F5 F2FF
;      CODE F300 F6F4
;      DATA F6F5 F6FE
;      GFX F6FF F86B
;      DATA F86C F877
;      GFX F878 F88C
;      DATA F88D F8CE
;      CODE F8CF F949
;      DATA F94A F957
;      CODE F958 FF31
;      DATA FF32 FFFF

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
RESM0   =  $12
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
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

    ORG $F000

START:
    SEI                    ;
    CLD                    ;
    LDX    #$DF            ;
    TXS                    ;
    LDA    #0              ;
    STA    SWACNT          ;
    STA    SWBCNT          ;
    LDX    #$FF            ;
.loopClear:
    STA    0,X             ;
    DEX                    ;
    BNE    .loopClear      ;
    LDX    #8              ;
.loopOneShotRam:
    LDA    LF27C-1,X       ;
    STA    $9B,X           ;
    DEX                    ;
    BNE    .loopOneShotRam ;
    JSR    LF570           ;
JumpF021:
    JSR    LF1EF           ; 6
    JSR    LF391           ; 6
    JSR    LF3CC           ; 6
    JSR    LF053           ; 6
    JSR    LF1EF           ; 6
    JSR    LF410           ; 6
    JSR    LF49E           ; 6
    JSR    LF053           ; 6
    JSR    LF1EF           ; 6
    JSR    LF391           ; 6
    JSR    LF44D           ; 6
    JSR    LF053           ; 6
    JSR    LF1EF           ; 6
    JSR    LF90E           ; 6
    JSR    LF053           ; 6
    INC    $BC             ; 5
    JMP    JumpF021        ; 3

LF053 SUBROUTINE
.branchF053
    LDA    INTIM           ; 4
    BNE    .branchF053     ; 2³
    STA    $98             ; 3
    LDA    $99             ; 3
    STA    COLUBK          ; 3
    STA    WSYNC           ; 3
    LDA    #$40            ; 2
    STA    VBLANK          ; 3
    LDA    #1              ; 2
    JSR    LF1E3           ; 6
    LDA    #6              ; 2
    LDX    #$8F            ; 2
    JSR    LF58A           ; 6
    LDA    #$34            ; 2
    JSR    LF5F4           ; 6
    LDA    #6              ; 2
    LDX    #$92            ; 2
    JSR    LF58A           ; 6
    LDX    #$74            ; 2
    LDA    $C6             ; 3
    BEQ    .branchF08A     ; 2³
    LDA    $C7             ; 3
    AND    #$20            ; 2
    BNE    .branchF08A     ; 2³
    LDX    $99             ; 3
.branchF08A:
    TXA                    ; 2
    JSR    LF5F4           ; 6
    LDX    #$A6            ; 2
    JSR    LF20F           ; 6
    LDA    #$23            ; 2
    JSR    LF1E3           ; 6
    LDA    #1              ; 2
    STA    CTRLPF          ; 3
    LDA    #$2C            ; 2
    STA    WSYNC           ; 3
    STA    COLUPF          ; 3
    LDA    #0              ; 2
    STA    PF0             ; 3
    LDA    #$19            ; 2
    STA    PF1             ; 3
    LDA    #$99            ; 2
    STA    PF2             ; 3
    LDY    #$A0            ; 2
    JSR    LF300           ; 6
    LDA    #3              ; 2
    JSR    LF1E0           ; 6
    JSR    LF68B           ; 6
    LDA    $A5             ; 3
    CMP    #$4F            ; 2
    BCS    .branchF0C7     ; 2³
    JSR    LF64F           ; 6
    JMP    JumpF0C9        ; 3
.branchF0C7:
    STA    WSYNC           ; 3
JumpF0C9:
    LDX    #$AD            ; 2
    JSR    LF20F           ; 6
    LDA    #$4E            ; 2
    JSR    LF1E3           ; 6
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    PF0             ; 3
    LDA    #$19            ; 2
    STA    PF1             ; 3
    LDA    #$99            ; 2
    STA    PF2             ; 3
    LDX    $C4             ; 3
    INX                    ; 2
    LDA    LF29B,X         ; 4
    STA    COLUPF          ; 3
    LDY    #$A0            ; 2
    JSR    LF300           ; 6
    LDA    #3              ; 2
    JSR    LF1E0           ; 6
    JSR    LF68B           ; 6
    JSR    LF6A7           ; 6
    LDX    #$95            ; 2
    LDA    #4              ; 2
    JSR    LF58A           ; 6
    LDA    #$1E            ; 2
    JSR    LF5F4           ; 6
    LDA    $A5             ; 3
    CMP    #$73            ; 2
    BNE    .branchF10E     ; 2³
    JSR    LF64F           ; 6
.branchF10E:
    LDA    #$7A            ; 2
    JSR    LF1E3           ; 6
    LDY    #$9E            ; 2
    JSR    LF253           ; 6
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    PF0             ; 3
    LDA    #$1F            ; 2
    STA    PF2             ; 3
    STA    PF1             ; 3
    LDX    $97             ; 3
    LDA    LF6FC,X         ; 4
    STA    COLUPF          ; 3
    LDA    #5              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    INC    $98             ; 5
    STA    WSYNC           ; 3
    INC    $98             ; 5
    STA    WSYNC           ; 3
    LDX    $99             ; 3
    LDA    #$0F            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    $9B             ; 3
    AND    #$10            ; 2
    BEQ    .branchF15B     ; 2³
    LDA    $BE             ; 3
    CMP    #2              ; 2
    BNE    .branchF15B     ; 2³
    LDA    $BD             ; 3
    CMP    #2              ; 2
    BNE    .branchF155     ; 2³
    STX    COLUP0          ; 3
.branchF155:
    CMP    #$0A            ; 2
    BNE    .branchF15B     ; 2³
    STX    COLUP1          ; 3
.branchF15B:
    STA    WSYNC           ; 3
    LDY    #0              ; 2
.branchF15F:
    LDA    LF740,Y         ; 4
    STA    GRP0            ; 3
    LDA    LF7C4,Y         ; 4
    STA    GRP1            ; 3
    INC    $98             ; 5
    INY                    ; 2
    STA    WSYNC           ; 3
    CPY    #7              ; 2
    BNE    .branchF15F     ; 2³
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #2              ; 2
    JSR    LF1E0           ; 6
    LDA    #0              ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    #$CE            ; 2
    LDX    $B6             ; 3
    CPX    #$1C            ; 2
    BCC    .branchF18F     ; 2³
    LDA    #$4F            ; 2
.branchF18F:
    STA    COLUPF          ; 3
    LDA    #0              ; 2
    STA    CTRLPF          ; 3
    LDA    #$8C            ; 2
    JSR    LF1E3           ; 6
.branchF19A:
    STA    WSYNC           ; 3
    LDA    #$F0            ; 2
    STA    PF0             ; 3
    LDA    $B7             ; 3
    STA    PF1             ; 3
    LDA    $B8             ; 3
    STA    PF2             ; 3
    LDY    #3              ; 2
.branchF1AA:
    DEY                    ; 2
    BNE    .branchF1AA     ; 2³
    LDA    $B9             ; 3
    STA    PF0             ; 3
    LDA    $BA             ; 3
    STA    PF1             ; 3
    LDA    $BB             ; 3
    ORA    #$F0            ; 2
    STA    PF2             ; 3
    INC    $98             ; 5
    LDA    $98             ; 3
    CMP    #$92            ; 2
    BCC    .branchF19A     ; 2³
    JSR    LF67F           ; 6
    LDX    $98             ; 3
    STA    WSYNC           ; 3
.branchF1CA:
    STA    WSYNC           ; 3
    INX                    ; 2
    CPX    #$A9            ; 2
    BCC    .branchF1CA     ; 2³
    INC    $9B             ; 5
    LDA    $9B             ; 3
    CMP    #$1E            ; 2
    BNE    .branchF1DF     ; 2³
    INC    $C5             ; 5
    LDA    #0              ; 2
    STA    $9B             ; 3
.branchF1DF:
    RTS                    ; 6

LF1E0 SUBROUTINE
    CLC                    ; 2
    ADC    $98             ; 3
LF1E3 SUBROUTINE
JumpF1E3:
    CMP    $98             ; 3
    BCC    .branchF1EE     ; 2³
    INC    $98             ; 5
    STA    WSYNC           ; 3
    JMP    JumpF1E3        ; 3
.branchF1EE:
    RTS                    ; 6

LF1EF SUBROUTINE
    STA    WSYNC           ; 3
    LDA    #2              ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    LDA    #$28            ; 2
    STA    TIM64T          ; 4
    RTS                    ; 6

LF20F SUBROUTINE
    LDY    #0              ; 2
    STY    $8E             ; 3
    LDA    COLUP0,X        ; 4
    AND    #$1F            ; 2
    BEQ    .branchF21b     ; 2³
    INC    $8E             ; 5
.branchF21b:
    LDA    VSYNC,X         ; 4
    BPL    .branchF229     ; 2³
    STA    $FF             ; 3
    LDA    $9B             ; 3
    AND    #$10            ; 2
    BEQ    .branchF229     ; 2³
    LDA    $FF             ; 3
.branchF229:
    AND    #$1F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $FF             ; 3
    ASL                    ; 2
    ADC    $FF             ; 3
    PHP                    ; 3
    CLC                    ; 2
    ADC    #4              ; 2
    STA.wy $80,Y           ; 5
    LDA    #$F7            ; 2
    ADC    #0              ; 2
    PLP                    ; 4
    ADC    #0              ; 2
    STA.wy $81,Y           ; 5
    INX                    ; 2
    INY                    ; 2
    INY                    ; 2
    CPY    #$0C            ; 2
    BNE    .branchF24E     ; 2³
    STA    WSYNC           ; 3
    INC    $98             ; 5
.branchF24E:
    CPY    #$0E            ; 2
    BNE    .branchF21b     ; 2³
    RTS                    ; 6

LF253 SUBROUTINE
    LDA.wy $00,Y           ; 4  YY
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    STA    WSYNC           ; 3
.branchF25D:
    DEX                    ; 2
    BPL    .branchF25D     ; 2³
    STA    RESP0           ; 3
    LDA.wy $01,Y           ; 4  YY
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    STA    WSYNC           ; 3
.branchF26C:
    DEX                    ; 2
    BPL    .branchF26C     ; 2³
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    INC    $98             ; 5
    INC    $98             ; 5
    INC    $98             ; 5
    RTS                    ; 6

LF27C:
    .byte $28,$A8,$A5,$4A,$65,$38,$65,$0B
LF284:
    .byte $35,$B5,$26,$A6,$17,$97,$08,$79,$F9,$6A,$EA,$5B,$DB
LF291:
    .byte $32,$45,$73
LF294:
    .byte $75,$66,$57,$48,$39,$2A,$1B
LF29B:
    .byte $44,$2C,$4E
LF29E:
    .byte $BE
LF29F:
    .byte $F8,$D5,$F2,$DE,$F2,$B0,$F2,$D0,$F2,$C2,$F2,$CB,$F2,$EE,$F2,$E7
    .byte $F2,$EB,$24,$EC,$24,$ED,$24,$EE,$44,$ED,$24,$EC,$24,$EB,$44,$EC
    .byte $24,$ED,$24,$EE,$44,$ED,$24,$EC,$24,$EB,$24,$00,$E8,$13,$4A,$33
    .byte $00,$8A,$67,$8F,$67,$00,$EE,$24,$ED,$24,$EC,$24,$EB,$24,$00,$EB
    .byte $24,$EC,$24,$ED,$24,$EE,$24,$00,$F8,$14,$88,$34,$10,$4B,$00,$F8
    .byte $1C,$88,$1C,$10,$2B,$00
    .byte $FF ; |XXXXXXXX| $F2F5
    .byte $FF ; |XXXXXXXX| $F2F6
    .byte $FF ; |XXXXXXXX| $F2F7
    .byte $FF ; |XXXXXXXX| $F2F8
    .byte $FF ; |XXXXXXXX| $F2F9
    .byte $FF ; |XXXXXXXX| $F2FA
    .byte $FF ; |XXXXXXXX| $F2FB
    .byte $FF ; |XXXXXXXX| $F2FC
    .byte $FF ; |XXXXXXXX| $F2FD
    .byte $FF ; |XXXXXXXX| $F2FE
    .byte $FF ; |XXXXXXXX| $F2FF

LF300 SUBROUTINE
    LDA    #0              ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #7              ; 2
    STA    $FE             ; 3
    LDA    $9B             ; 3
    AND    $8E             ; 3
    BNE    .branchF356     ; 2³
    NOP                    ; 2
    NOP                    ; 2
    JSR    LF253           ; 6
    LDY    #0              ; 2
JumpF31D:
.branchF31D:
    STA    WSYNC           ; 3
    LDA    ($86),Y         ; 5
    TAX                    ; 2
    LDA    ($80),Y         ; 5
    NOP                    ; 2
    NOP                    ; 2
    STA    GRP0            ; 3
    STX    GRP1            ; 3
    LDA    ($82),Y         ; 5
    TAX                    ; 2
    LDA    ($84),Y         ; 5
    STX    GRP0            ; 3
    STA    GRP0            ; 3
    LDA    ($88),Y         ; 5
    NOP                    ; 2
    STA    GRP1            ; 3
    LDA    ($8A),Y         ; 5
    STA    GRP1            ; 3
    INY                    ; 2
    CPY    $FE             ; 3
    BNE    .branchF31D     ; 2³
    CPY    #7              ; 2
    BNE    .branchF383     ; 2³
    LDA    #$0C            ; 2
    STA    $FE             ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    JMP    JumpF31D        ; 3
.branchF356:
    INY                    ; 2
    INY                    ; 2
    JSR    LF253           ; 6
    LDA    #0              ; 2
    STA    NUSIZ1          ; 3
    LDY    #0              ; 2
JumpF361:
.branchF361:
    STA    WSYNC           ; 3
    LDA    ($8C),Y         ; 5
    STA    GRP1            ; 3
    INY                    ; 2
    CPY    $FE             ; 3
    BNE    .branchF361     ; 2³
    CPY    #7              ; 2
    BNE    .branchF381     ; 2³
    LDA    #$0C            ; 2
    STA    $FE             ; 3
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    JMP    JumpF361        ; 3
.branchF381:
    STA    WSYNC           ; 3
.branchF383:
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    $98             ; 3
    CLC                    ; 2
    ADC    #$0C            ; 2
    STA    $98             ; 3
    RTS                    ; 6

LF391 SUBROUTINE
    LDA    $B4             ; 3
    BEQ    .branchF399     ; 2³
    DEC    $B4             ; 5
    BNE    .branchF3BF     ; 2³
.branchF399:
    LDY    #0              ; 2
    LDA    $C9             ; 3
    AND    #$7F            ; 2
    STA    $C9             ; 3
    LDA    ($BF),Y         ; 5
    STA    AUDF0           ; 3
    JSR    LF6E4           ; 6
    STA    AUDV0           ; 3
    BEQ    .branchF3BF     ; 2³
    LDA    $C9             ; 3
    ORA    #$80            ; 2
    STA    $C9             ; 3
    INY                    ; 2
    LDA    ($BF),Y         ; 5
    STA    AUDC0           ; 3
    JSR    LF6E4           ; 6
    STA    $B4             ; 3
    JSR    LF6EB           ; 6
.branchF3BF:
    LDA    $B5             ; 3
    BEQ    .branchF3CB     ; 2³
    DEC    $B5             ; 5
    BNE    .branchF3CB     ; 2³
    LDA    #0              ; 2
    STA    AUDV1           ; 3
.branchF3CB:
    RTS                    ; 6

LF3CC SUBROUTINE
    BIT    $C6             ; 3
    BPL    .branchF40F     ; 2³+1
    INC    $C3             ; 5
    LDA    $C3             ; 3
    CMP    $C2             ; 3
    BNE    .branchF40F     ; 2³+1
    LDA    #0              ; 2
    STA    $C3             ; 3
    INC    $B6             ; 5
    SEC                    ; 2
    ROR    $B7             ; 5
    ROL    $B8             ; 5
    BCC    .branchF401     ; 2³+1
    LDA    #8              ; 2
    ORA    $B9             ; 3
    STA    $B9             ; 3
    ROL    $B9             ; 5
    ROR    $BA             ; 5
    ROL    $BB             ; 5
    LDA    $BB             ; 3
    AND    #$F0            ; 2
    BEQ    .branchF401     ; 2³+1
    LDA    #$10            ; 2
    STA    $C6             ; 3
    LDA    #0              ; 2
    JSR    LF6D7           ; 6
    RTS                    ; 6

.branchF401:
    LDA    #5              ; 2
    STA    AUDV1           ; 3
    LDA    #$0A            ; 2
    STA    AUDF1           ; 3
    LDA    #4              ; 2
    STA    AUDC1           ; 3
    INC    $B5             ; 5
.branchF40F:
    RTS                    ; 6

LF410 SUBROUTINE
    LDA    $BC             ; 3
    CMP    #5              ; 2
    BCC    .branchF445     ; 2³
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    .branchF42A     ; 2³
    LDA    $C6             ; 3
    BNE    .branchF423     ; 2³
    INC    $C1             ; 5
.branchF423:
    LDA    #0              ; 2
    STA    $C6             ; 3
    JMP    JumpF441        ; 3
.branchF42A:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BNE    .branchF446     ; 2³
    LDA    $C9             ; 3
    AND    #$08            ; 2
    BNE    .branchF445     ; 2³
    LDA    $C9             ; 3
    ORA    #$08            ; 2
    STA    $C9             ; 3
    LDA    #4              ; 2
    STA    $C6             ; 3
JumpF441:
    LDA    #0              ; 2
    STA    $BC             ; 3
.branchF445:
    RTS                    ; 6

.branchF446:
    LDA    $C9             ; 3
    AND    #$F7            ; 2
    STA    $C9             ; 3
    RTS                    ; 6

LF44D SUBROUTINE
    LDA    $C6             ; 3
    AND    #$40            ; 2
    BEQ    .branchF49D     ; 2³
    LDA    $BC             ; 3
    CMP    #3              ; 2
    BCC    .branchF49D     ; 2³
    BIT    INPT4           ; 3
    BMI    .branchF475     ; 2³
    LDA    $C9             ; 3
    AND    #$01            ; 2
    BNE    .branchF47B     ; 2³
    LDA    #1              ; 2
    ORA    $C6             ; 3
    STA    $C6             ; 3
    LDA    #0              ; 2
    STA    $BC             ; 3
    LDA    $C9             ; 3
    ORA    #$01            ; 2
    STA    $C9             ; 3
    BNE    .branchF47B     ; 2³
.branchF475:
    LDA    $C9             ; 3
    AND    #$FE            ; 2
    STA    $C9             ; 3
.branchF47B:
    BIT    INPT5           ; 3
    BMI    .branchF497     ; 2³
    LDA    $C9             ; 3
    AND    #$02            ; 2
    BNE    .branchF49D     ; 2³
    LDA    #2              ; 2
    ORA    $C6             ; 3
    STA    $C6             ; 3
    LDA    #0              ; 2
    STA    $BC             ; 3
    LDA    $C9             ; 3
    ORA    #$02            ; 2
    STA    $C9             ; 3
    BNE    .branchF49D     ; 2³
.branchF497:
    LDA    $C9             ; 3
    AND    #$FD            ; 2
    STA    $C9             ; 3
.branchF49D:
    RTS                    ; 6

LF49E SUBROUTINE
    LDA    $C6             ; 3
    AND    #$40            ; 2
    BNE    .branchF4A5     ; 2³
.branchF4A4:
    RTS                    ; 6

.branchF4A5:
    LDA    #$1A            ; 2
    BIT    $C8             ; 3
    BNE    .branchF4A4     ; 2³
    LDA    $BC             ; 3
    CMP    #2              ; 2
    BCC    .branchF4A4     ; 2³
    LDX    $97             ; 3
    DEX                    ; 2
    LDY    SWCHA           ; 4
    TYA                    ; 2
    AND    LF6FB,X         ; 4
    BEQ    .branchF4DC     ; 2³
    LDA    $C9             ; 3
    AND    #$FB            ; 2
    STA    $C9             ; 3
    TYA                    ; 2
    AND    LF6F5,X         ; 4
    BEQ    .branchF53D     ; 2³+1
    TYA                    ; 2
    AND    LF6F7,X         ; 4
    BEQ    .branchF51D     ; 2³+1
    LDA    #$1E            ; 2
    BIT    $C8             ; 3
    BNE    .branchF4A4     ; 2³
    TYA                    ; 2
    AND    LF6F9,X         ; 4
    BEQ    .branchF50D     ; 2³+1
    RTS                    ; 6

.branchF4DC:
    LDA    $C9             ; 3
    AND    #$04            ; 2
    BEQ    .branchF4E5     ; 2³
    JMP    JumpF56C        ; 3
.branchF4E5:
    LDA    $C9             ; 3
    ORA    #$04            ; 2
    STA    $C9             ; 3
    LDY    $BE             ; 3
    CPY    #2              ; 2
    BEQ    .branchF56C     ; 2³+1
    CPY    #1              ; 2
    BNE    .branchF4F9     ; 2³
    LDA    $D0             ; 3
    BPL    .branchF56C     ; 2³+1
.branchF4F9:
    INC    $BE             ; 5
    CPY    #1              ; 2
    BNE    .branchF556     ; 2³+1
    LDY    #2              ; 2
    LDA    $BD             ; 3
    CMP    #6              ; 2
    BCC    .branchF509     ; 2³
    LDY    #$0A            ; 2
.branchF509:
    STY    $BD             ; 3
    BNE    .branchF556     ; 2³
.branchF50D:
    LDA    $BE             ; 3
    BEQ    .branchF56C     ; 2³
    DEC    $BE             ; 5
    LDA    $BD             ; 3
    AND    #$01            ; 2
    BEQ    .branchF556     ; 2³
    INC    $BD             ; 5
    BNE    .branchF556     ; 2³
.branchF51D:
    LDY    $BE             ; 3
    CPY    #2              ; 2
    BNE    .branchF52D     ; 2³
    LDA    #$0A            ; 2
    CMP    $BD             ; 3
    BEQ    .branchF56C     ; 2³
    STA    $BD             ; 3
    BNE    .branchF556     ; 2³
.branchF52D:
    LDA    $BD             ; 3
    CMP    #$0C            ; 2
    BEQ    .branchF56C     ; 2³
    INC    $BD             ; 5
    CPY    #0              ; 2
    BNE    .branchF556     ; 2³
    INC    $BD             ; 5
    BNE    .branchF556     ; 2³
.branchF53D:
    LDY    $BE             ; 3
    CPY    #2              ; 2
    BNE    .branchF54B     ; 2³
    CPY    $BD             ; 3
    BEQ    .branchF56C     ; 2³
    STY    $BD             ; 3
    BNE    .branchF556     ; 2³
.branchF54B:
    LDA    $BD             ; 3
    BEQ    .branchF56C     ; 2³
    DEC    $BD             ; 5
    TYA                    ; 2
    BNE    .branchF556     ; 2³
    DEC    $BD             ; 5
.branchF556:
    INC    $B4             ; 5
    LDA    #$0F            ; 2
    STA    AUDV0           ; 3
    LDA    $BD             ; 3
    ADC    #8              ; 2
    STA    AUDF0           ; 3
    LDA    #4              ; 2
    BIT    $D0             ; 3
    BMI    .branchF56A     ; 2³
    LDA    #$0C            ; 2
.branchF56A:
    STA    AUDC0           ; 3
JumpF56C:
.branchF56C:
    LDA    #0              ; 2
    STA    $BC             ; 3
JF570
LF570 SUBROUTINE
    LDX    $BE             ; 3
    LDA    LF291,X         ; 4
    STA    $A5             ; 3
    LDX    $BD             ; 3
    LDA    LF284,X         ; 4
    STA    $A4             ; 3
    RTS                    ; 6

LF57F SUBROUTINE
    LDX    #0              ; 2
    TXA                    ; 2
.branchF582:
    STA    $B6,X           ; 4
    INX                    ; 2
    CPX    #6              ; 2
    BNE    .branchF582     ; 2³
    RTS                    ; 6

LF58A SUBROUTINE
    STA    $FE             ; 3
    LDY    #0              ; 2
.branchF58E:
    LDA    0,X             ; 4
    AND    #$F0            ; 2
    BNE    .branchF5A7     ; 2³
    DEC    $FE             ; 5
    LDA    0,X             ; 4
    AND    #$0F            ; 2
    BNE    .branchF5B3     ; 2³
    INX                    ; 2
    DEC    $FE             ; 5
    BNE    .branchF58E     ; 2³
    INC    $FE             ; 5
    DEX                    ; 2
    JMP    JumpF5B3        ; 3  short jump
JumpF5A7:
.branchF5A7:
    LDA    0,X             ; 4
    JSR    LF6E4           ; 6
    JSR    LF5DC           ; 6
    DEC    $FE             ; 5
    BEQ    .branchF5C2     ; 2³
JumpF5B3:
.branchF5B3:
    LDA    0,X             ; 4
    AND    #$0F            ; 2
    JSR    LF5DC           ; 6
    DEC    $FE             ; 5
    BEQ    .branchF5C2     ; 2³
    INX                    ; 2
    JMP    JumpF5A7        ; 3   short jump
.branchF5C2:
    CPY    #4              ; 2
    BCS    .branchF5C8     ; 2³
    STA    WSYNC           ; 3
JumpF5C8:
.branchF5C8:
    CPY    #$0C            ; 2
    BEQ    .branchF5DB           ; 2³
    LDA    #4              ; 2
    STA.wy $80,Y           ; 5
    LDA    #$F7            ; 2
    STA.wy $81,Y           ; 5
    INY                    ; 2
    INY                    ; 2
    JMP    JumpF5C8        ; 3   short jump
.branchF5DB:
    RTS                    ; 6

LF5DC SUBROUTINE
    STA    $FF             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    SEC                    ; 2
    SBC    $FF             ; 3
    CLC                    ; 2
    ADC    #$78            ; 2
    STA.wy $80,Y           ; 5
    LDA    #$F8            ; 2
    ADC    #0              ; 2
    STA.wy $81,Y           ; 5
    INY                    ; 2
    INY                    ; 2
    RTS                    ; 6

LF5F4 SUBROUTINE
    LDY    #$9C            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #3              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    LDA    #1              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    JSR    LF253           ; 6
    LDY    #0              ; 2
.branchF613:
    STY    $FE             ; 3
    STA    WSYNC           ; 3
    LDA    ($80),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($82),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($84),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($8A),Y         ; 5
    STA    $FF             ; 3
    LDA    ($88),Y         ; 5
    TAX                    ; 2
    LDA    ($86),Y         ; 5
    LDY    $FF             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    LDY    $FE             ; 3
    INY                    ; 2
    CPY    #7              ; 2
    BNE    .branchF613     ; 2³
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    CLC                    ; 2
    LDA    $98             ; 3
    ADC    #7              ; 2
    STA    $98             ; 3
    RTS                    ; 6

LF64F SUBROUTINE
    PHA                    ; 3
    LDY    #$34            ; 2
    LDA    $97             ; 3
    AND    #$01            ; 2
    BNE    .branchF65A     ; 2³
    LDY    #$74            ; 2
.branchF65A:
    LDA    $A4             ; 3
    LDX    #2              ; 2
    JSR    LF694           ; 6
    INC    $98             ; 5
    LDA    #$11            ; 2
    STA    CTRLPF          ; 3
    PLA                    ; 4
    JSR    LF1E3           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #2              ; 2
    STA    ENABL           ; 3
    LDA    #4              ; 2
    JSR    LF1E0           ; 6
    LDA    #0              ; 2
    STA    ENABL           ; 3
    INC    $98             ; 5
    RTS                    ; 6

LF67F SUBROUTINE
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    STA    PF1             ; 3
    STA    PF0             ; 3
    INC    $98             ; 5
    STA    WSYNC           ; 3
LF68B SUBROUTINE
    LDA    #0              ; 2
    STA    PF2             ; 3
    STA    PF1             ; 3
    STA    PF0             ; 3
    RTS                    ; 6

LF694 SUBROUTINE
    STY    COLUP0,X        ; 4
    STA    HMM0,X          ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    STA    WSYNC           ; 3
.branchF69D:
    DEY                    ; 2
    BPL    .branchF69D     ; 2³
    STA    RESM0,X         ; 4
    STA    WSYNC           ; 3
    INC    $98             ; 5
    RTS                    ; 6

LF6A7 SUBROUTINE
    LDX    #2              ; 2
.branchF6A9:
    LDY    $CA,X           ; 4
    LDA    $CD,X           ; 4
    JSR    LF694           ; 6
    DEX                    ; 2
    BPL    .branchF6A9     ; 2³
    LDA    #$F0            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$31            ; 2
    STA    CTRLPF          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #2              ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    LDA    #3              ; 2
    JSR    LF1E0           ; 6
    LDA    #0              ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    RTS                    ; 6

LF6D7 SUBROUTINE
JumpF6D7:
    ASL                    ; 2
    TAY                    ; 2
    LDA    LF29E,Y         ; 4
    STA    $BF             ; 3
    LDA    LF29F,Y         ; 4
    STA    $C0             ; 3
    RTS                    ; 6

LF6E4 SUBROUTINE
    ROR                    ; 2
    ROR                    ; 2
    ROR                    ; 2
    ROR                    ; 2
    AND    #$0F            ; 2
    RTS                    ; 6

LF6EB SUBROUTINE
    JSR    LF6EE           ; 6  WTF ??
LF6EE SUBROUTINE
    INC    $BF             ; 5
    BNE    .branchF6F4     ; 2³
    INC    $C0             ; 5
.branchF6F4:
    RTS                    ; 6

LF6F5:
    .byte $40,$04
LF6F7:
    .byte $80,$08
LF6F9:
    .byte $10,$01
LF6FB:
    .byte $20
LF6FC:
    .byte $02,$34,$74
    .byte $FF ; |XXXXXXXX| $F6FF
    .byte $FF ; |XXXXXXXX| $F700
    .byte $FF ; |XXXXXXXX| $F701
    .byte $FF ; |XXXXXXXX| $F702
    .byte $FF ; |XXXXXXXX| $F703
    .byte $00 ; |        | $F704
    .byte $00 ; |        | $F705
    .byte $00 ; |        | $F706
    .byte $00 ; |        | $F707
    .byte $00 ; |        | $F708
    .byte $00 ; |        | $F709
    .byte $00 ; |        | $F70A
    .byte $00 ; |        | $F70B
    .byte $00 ; |        | $F70C
    .byte $00 ; |        | $F70D
    .byte $00 ; |        | $F70E
    .byte $00 ; |        | $F70F
    .byte $08 ; |    X   | $F710
    .byte $14 ; |   X X  | $F711
    .byte $22 ; |  X   X | $F712
    .byte $3E ; |  XXXXX | $F713
    .byte $22 ; |  X   X | $F714
    .byte $22 ; |  X   X | $F715
    .byte $22 ; |  X   X | $F716
    .byte $02 ; |      X | $F717
    .byte $02 ; |      X | $F718
    .byte $02 ; |      X | $F719
    .byte $02 ; |      X | $F71A
    .byte $02 ; |      X | $F71B
    .byte $3C ; |  XXXX  | $F71C
    .byte $22 ; |  X   X | $F71D
    .byte $22 ; |  X   X | $F71E
    .byte $3C ; |  XXXX  | $F71F
    .byte $22 ; |  X   X | $F720
    .byte $22 ; |  X   X | $F721
    .byte $3C ; |  XXXX  | $F722
    .byte $07 ; |     XXX| $F723
    .byte $01 ; |       X| $F724
    .byte $03 ; |      XX| $F725
    .byte $01 ; |       X| $F726
    .byte $07 ; |     XXX| $F727
    .byte $3E ; |  XXXXX | $F728
    .byte $20 ; |  X     | $F729
    .byte $20 ; |  X     | $F72A
    .byte $20 ; |  X     | $F72B
    .byte $20 ; |  X     | $F72C
    .byte $20 ; |  X     | $F72D
    .byte $3E ; |  XXXXX | $F72E
    .byte $07 ; |     XXX| $F72F
    .byte $01 ; |       X| $F730
    .byte $03 ; |      XX| $F731
    .byte $01 ; |       X| $F732
    .byte $07 ; |     XXX| $F733
    .byte $3C ; |  XXXX  | $F734
    .byte $12 ; |   X  X | $F735
    .byte $12 ; |   X  X | $F736
    .byte $12 ; |   X  X | $F737
    .byte $12 ; |   X  X | $F738
    .byte $12 ; |   X  X | $F739
    .byte $3C ; |  XXXX  | $F73A
    .byte $07 ; |     XXX| $F73B
    .byte $01 ; |       X| $F73C
    .byte $07 ; |     XXX| $F73D
    .byte $04 ; |     X  | $F73E
    .byte $07 ; |     XXX| $F73F
LF740:
    .byte $3C ; |  XXXX  | $F740
    .byte $20 ; |  X     | $F741
    .byte $20 ; |  X     | $F742
    .byte $38 ; |  XXX   | $F743
    .byte $20 ; |  X     | $F744
    .byte $20 ; |  X     | $F745
    .byte $3C ; |  XXXX  | $F746
    .byte $02 ; |      X | $F747
    .byte $02 ; |      X | $F748
    .byte $02 ; |      X | $F749
    .byte $02 ; |      X | $F74A
    .byte $02 ; |      X | $F74B
    .byte $3E ; |  XXXXX | $F74C
    .byte $20 ; |  X     | $F74D
    .byte $20 ; |  X     | $F74E
    .byte $38 ; |  XXX   | $F74F
    .byte $20 ; |  X     | $F750
    .byte $20 ; |  X     | $F751
    .byte $20 ; |  X     | $F752
    .byte $05 ; |     X X| $F753
    .byte $05 ; |     X X| $F754
    .byte $07 ; |     XXX| $F755
    .byte $01 ; |       X| $F756
    .byte $01 ; |       X| $F757
    .byte $3E ; |  XXXXX | $F758
    .byte $20 ; |  X     | $F759
    .byte $20 ; |  X     | $F75A
    .byte $26 ; |  X  XX | $F75B
    .byte $22 ; |  X   X | $F75C
    .byte $22 ; |  X   X | $F75D
    .byte $3E ; |  XXXXX | $F75E
    .byte $07 ; |     XXX| $F75F
    .byte $01 ; |       X| $F760
    .byte $07 ; |     XXX| $F761
    .byte $04 ; |     X  | $F762
    .byte $07 ; |     XXX| $F763
    .byte $22 ; |  X   X | $F764
    .byte $22 ; |  X   X | $F765
    .byte $22 ; |  X   X | $F766
    .byte $3E ; |  XXXXX | $F767
    .byte $22 ; |  X   X | $F768
    .byte $22 ; |  X   X | $F769
    .byte $22 ; |  X   X | $F76A
    .byte $05 ; |     X X| $F76B
    .byte $05 ; |     X X| $F76C
    .byte $07 ; |     XXX| $F76D
    .byte $01 ; |       X| $F76E
    .byte $01 ; |       X| $F76F
    .byte $08 ; |    X   | $F770
    .byte $08 ; |    X   | $F771
    .byte $08 ; |    X   | $F772
    .byte $08 ; |    X   | $F773
    .byte $08 ; |    X   | $F774
    .byte $08 ; |    X   | $F775
    .byte $08 ; |    X   | $F776
    .byte $02 ; |      X | $F777
    .byte $02 ; |      X | $F778
    .byte $02 ; |      X | $F779
    .byte $02 ; |      X | $F77A
    .byte $02 ; |      X | $F77B
    .byte $02 ; |      X | $F77C
    .byte $02 ; |      X | $F77D
    .byte $02 ; |      X | $F77E
    .byte $02 ; |      X | $F77F
    .byte $12 ; |   X  X | $F780
    .byte $12 ; |   X  X | $F781
    .byte $1E ; |   XXXX | $F782
    .byte $07 ; |     XXX| $F783
    .byte $05 ; |     X X| $F784
    .byte $07 ; |     XXX| $F785
    .byte $05 ; |     X X| $F786
    .byte $07 ; |     XXX| $F787
    .byte $22 ; |  X   X | $F788
    .byte $24 ; |  X  X  | $F789
    .byte $28 ; |  X X   | $F78A
    .byte $30 ; |  XX    | $F78B
    .byte $28 ; |  X X   | $F78C
    .byte $24 ; |  X  X  | $F78D
    .byte $22 ; |  X   X | $F78E
    .byte $07 ; |     XXX| $F78F
    .byte $04 ; |     X  | $F790
    .byte $07 ; |     XXX| $F791
    .byte $01 ; |       X| $F792
    .byte $07 ; |     XXX| $F793
    .byte $20 ; |  X     | $F794
    .byte $20 ; |  X     | $F795
    .byte $20 ; |  X     | $F796
    .byte $20 ; |  X     | $F797
    .byte $20 ; |  X     | $F798
    .byte $20 ; |  X     | $F799
    .byte $3E ; |  XXXXX | $F79A
    .byte $02 ; |      X | $F79B
    .byte $02 ; |      X | $F79C
    .byte $02 ; |      X | $F79D
    .byte $02 ; |      X | $F79E
    .byte $02 ; |      X | $F79F
    .byte $22 ; |  X   X | $F7A0
    .byte $36 ; |  XX XX | $F7A1
    .byte $2A ; |  X X X | $F7A2
    .byte $2A ; |  X X X | $F7A3
    .byte $22 ; |  X   X | $F7A4
    .byte $22 ; |  X   X | $F7A5
    .byte $22 ; |  X   X | $F7A6
    .byte $07 ; |     XXX| $F7A7
    .byte $01 ; |       X| $F7A8
    .byte $07 ; |     XXX| $F7A9
    .byte $01 ; |       X| $F7AA
    .byte $07 ; |     XXX| $F7AB
    .byte $22 ; |  X   X | $F7AC
    .byte $32 ; |  XX  X | $F7AD
    .byte $2A ; |  X X X | $F7AE
    .byte $2A ; |  X X X | $F7AF
    .byte $2A ; |  X X X | $F7B0
    .byte $26 ; |  X  XX | $F7B1
    .byte $22 ; |  X   X | $F7B2
    .byte $02 ; |      X | $F7B3
    .byte $02 ; |      X | $F7B4
    .byte $02 ; |      X | $F7B5
    .byte $02 ; |      X | $F7B6
    .byte $02 ; |      X | $F7B7
    .byte $3E ; |  XXXXX | $F7B8
    .byte $22 ; |  X   X | $F7B9
    .byte $22 ; |  X   X | $F7BA
    .byte $22 ; |  X   X | $F7BB
    .byte $22 ; |  X   X | $F7BC
    .byte $22 ; |  X   X | $F7BD
    .byte $3E ; |  XXXXX | $F7BE
    .byte $02 ; |      X | $F7BF
    .byte $02 ; |      X | $F7C0
    .byte $02 ; |      X | $F7C1
    .byte $02 ; |      X | $F7C2
    .byte $02 ; |      X | $F7C3
LF7C4:
    .byte $3E ; |  XXXXX | $F7C4
    .byte $22 ; |  X   X | $F7C5
    .byte $22 ; |  X   X | $F7C6
    .byte $3E ; |  XXXXX | $F7C7
    .byte $20 ; |  X     | $F7C8
    .byte $20 ; |  X     | $F7C9
    .byte $20 ; |  X     | $F7CA
    .byte $07 ; |     XXX| $F7CB
    .byte $01 ; |       X| $F7CC
    .byte $07 ; |     XXX| $F7CD
    .byte $01 ; |       X| $F7CE
    .byte $07 ; |     XXX| $F7CF
    .byte $3E ; |  XXXXX | $F7D0
    .byte $22 ; |  X   X | $F7D1
    .byte $22 ; |  X   X | $F7D2
    .byte $22 ; |  X   X | $F7D3
    .byte $2A ; |  X X X | $F7D4
    .byte $26 ; |  X  XX | $F7D5
    .byte $3E ; |  XXXXX | $F7D6
    .byte $17 ; |   X XXX| $F7D7
    .byte $15 ; |   X X X| $F7D8
    .byte $15 ; |   X X X| $F7D9
    .byte $15 ; |   X X X| $F7DA
    .byte $17 ; |   X XXX| $F7DB
    .byte $3E ; |  XXXXX | $F7DC
    .byte $22 ; |  X   X | $F7DD
    .byte $22 ; |  X   X | $F7DE
    .byte $3E ; |  XXXXX | $F7DF
    .byte $28 ; |  X X   | $F7E0
    .byte $24 ; |  X  X  | $F7E1
    .byte $22 ; |  X   X | $F7E2
    .byte $02 ; |      X | $F7E3
    .byte $02 ; |      X | $F7E4
    .byte $02 ; |      X | $F7E5
    .byte $02 ; |      X | $F7E6
    .byte $02 ; |      X | $F7E7
    .byte $3E ; |  XXXXX | $F7E8
    .byte $20 ; |  X     | $F7E9
    .byte $20 ; |  X     | $F7EA
    .byte $3E ; |  XXXXX | $F7EB
    .byte $02 ; |      X | $F7EC
    .byte $02 ; |      X | $F7ED
    .byte $3E ; |  XXXXX | $F7EE
    .byte $02 ; |      X | $F7EF
    .byte $02 ; |      X | $F7F0
    .byte $02 ; |      X | $F7F1
    .byte $02 ; |      X | $F7F2
    .byte $02 ; |      X | $F7F3
    .byte $3E ; |  XXXXX | $F7F4
    .byte $08 ; |    X   | $F7F5
    .byte $08 ; |    X   | $F7F6
    .byte $08 ; |    X   | $F7F7
    .byte $08 ; |    X   | $F7F8
    .byte $08 ; |    X   | $F7F9
    .byte $08 ; |    X   | $F7FA
    .byte $02 ; |      X | $F7FB
    .byte $02 ; |      X | $F7FC
    .byte $02 ; |      X | $F7FD
    .byte $02 ; |      X | $F7FE
    .byte $02 ; |      X | $F7FF
    .byte $22 ; |  X   X | $F800
    .byte $22 ; |  X   X | $F801
    .byte $22 ; |  X   X | $F802
    .byte $22 ; |  X   X | $F803
    .byte $22 ; |  X   X | $F804
    .byte $22 ; |  X   X | $F805
    .byte $3E ; |  XXXXX | $F806
    .byte $02 ; |      X | $F807
    .byte $02 ; |      X | $F808
    .byte $02 ; |      X | $F809
    .byte $02 ; |      X | $F80A
    .byte $02 ; |      X | $F80B
    .byte $22 ; |  X   X | $F80C
    .byte $22 ; |  X   X | $F80D
    .byte $22 ; |  X   X | $F80E
    .byte $22 ; |  X   X | $F80F
    .byte $22 ; |  X   X | $F810
    .byte $14 ; |   X X  | $F811
    .byte $08 ; |    X   | $F812
    .byte $05 ; |     X X| $F813
    .byte $05 ; |     X X| $F814
    .byte $07 ; |     XXX| $F815
    .byte $01 ; |       X| $F816
    .byte $01 ; |       X| $F817
    .byte $22 ; |  X   X | $F818
    .byte $22 ; |  X   X | $F819
    .byte $22 ; |  X   X | $F81A
    .byte $2A ; |  X X X | $F81B
    .byte $2A ; |  X X X | $F81C
    .byte $3E ; |  XXXXX | $F81D
    .byte $36 ; |  XX XX | $F81E
    .byte $05 ; |     X X| $F81F
    .byte $05 ; |     X X| $F820
    .byte $07 ; |     XXX| $F821
    .byte $01 ; |       X| $F822
    .byte $01 ; |       X| $F823
    .byte $22 ; |  X   X | $F824
    .byte $14 ; |   X X  | $F825
    .byte $14 ; |   X X  | $F826
    .byte $08 ; |    X   | $F827
    .byte $14 ; |   X X  | $F828
    .byte $14 ; |   X X  | $F829
    .byte $22 ; |  X   X | $F82A
    .byte $07 ; |     XXX| $F82B
    .byte $05 ; |     X X| $F82C
    .byte $07 ; |     XXX| $F82D
    .byte $05 ; |     X X| $F82E
    .byte $07 ; |     XXX| $F82F
    .byte $22 ; |  X   X | $F830
    .byte $22 ; |  X   X | $F831
    .byte $14 ; |   X X  | $F832
    .byte $08 ; |    X   | $F833
    .byte $08 ; |    X   | $F834
    .byte $08 ; |    X   | $F835
    .byte $08 ; |    X   | $F836
    .byte $05 ; |     X X| $F837
    .byte $05 ; |     X X| $F838
    .byte $07 ; |     XXX| $F839
    .byte $01 ; |       X| $F83A
    .byte $01 ; |       X| $F83B
    .byte $3E ; |  XXXXX | $F83C
    .byte $02 ; |      X | $F83D
    .byte $04 ; |     X  | $F83E
    .byte $08 ; |    X   | $F83F
    .byte $10 ; |   X    | $F840
    .byte $20 ; |  X     | $F841
    .byte $3E ; |  XXXXX | $F842
    .byte $17 ; |   X XXX| $F843
    .byte $15 ; |   X X X| $F844
    .byte $15 ; |   X X X| $F845
    .byte $15 ; |   X X X| $F846
    .byte $17 ; |   X XXX| $F847
    .byte $10 ; |   X    | $F848
    .byte $38 ; |  XXX   | $F849
    .byte $38 ; |  XXX   | $F84A
    .byte $38 ; |  XXX   | $F84B
    .byte $38 ; |  XXX   | $F84C
    .byte $38 ; |  XXX   | $F84D
    .byte $10 ; |   X    | $F84E
    .byte $04 ; |     X  | $F84F
    .byte $0E ; |    XXX | $F850
    .byte $0E ; |    XXX | $F851
    .byte $0E ; |    XXX | $F852
    .byte $04 ; |     X  | $F853
    .byte $38 ; |  XXX   | $F854
    .byte $64 ; | XX  X  | $F855
    .byte $7C ; | XXXXX  | $F856
    .byte $EE ; |XXX XXX | $F857
    .byte $6C ; | XX XX  | $F858
    .byte $6C ; | XX XX  | $F859
    .byte $38 ; |  XXX   | $F85A
    .byte $07 ; |     XXX| $F85B
    .byte $07 ; |     XXX| $F85C
    .byte $02 ; |      X | $F85D
    .byte $07 ; |     XXX| $F85E
    .byte $07 ; |     XXX| $F85F
    .byte $74 ; | XXX X  | $F860
    .byte $4C ; | X  XX  | $F861
    .byte $C6 ; |XX   XX | $F862
    .byte $C6 ; |XX   XX | $F863
    .byte $E6 ; |XXX  XX | $F864
    .byte $74 ; | XXX X  | $F865
    .byte $7E ; | XXXXXX | $F866
    .byte $2F ; |  X XXXX| $F867
    .byte $1B ; |   XX XX| $F868
    .byte $1B ; |   XX XX| $F869
    .byte $09 ; |    X  X| $F86A
    .byte $06 ; |     XX | $F86B
LF86C:
    .byte $28,$83,$81,$01,$90,$B3,$00,$C0,$8D,$89,$03,$87
    .byte $3E ; |  XXXXX | $F878
    .byte $22 ; |  X   X | $F879
    .byte $22 ; |  X   X | $F87A
    .byte $22 ; |  X   X | $F87B
    .byte $22 ; |  X   X | $F87C
    .byte $22 ; |  X   X | $F87D
    .byte $3E ; |  XXXXX | $F87E
    .byte $08 ; |    X   | $F87F
    .byte $08 ; |    X   | $F880
    .byte $08 ; |    X   | $F881
    .byte $08 ; |    X   | $F882
    .byte $08 ; |    X   | $F883
    .byte $08 ; |    X   | $F884
    .byte $08 ; |    X   | $F885
    .byte $3E ; |  XXXXX | $F886
    .byte $02 ; |      X | $F887
    .byte $02 ; |      X | $F888
    .byte $3E ; |  XXXXX | $F889
    .byte $20 ; |  X     | $F88A
    .byte $20 ; |  X     | $F88B
    .byte $3E ; |  XXXXX | $F88C
LF88D:
    .byte $3E,$02,$02,$0E,$02,$02,$3E,$24,$24,$24,$3E,$04,$04,$04,$3E,$20
    .byte $20,$3E,$02,$02,$3E,$3E,$20,$20,$3E,$22,$22,$3E,$3E,$02,$02,$02
    .byte $02,$02,$02,$3E,$22,$22,$3E,$22,$22,$3E,$3E,$22,$22,$3E,$02,$02
    .byte $02,$7B,$31,$8A,$61,$7B,$31,$8F,$61,$7B,$31,$8A,$61,$7B,$31,$8F
    .byte $61,$00

LF8CF:
    LDA    $C9             ; 3
    BMI    .branchF907     ; 2³+1
    LDX    #6              ; 2
.branchF8D5:
    LDA    $AD,X           ; 4
    AND    #$1F            ; 2
    STA    $AD,X           ; 4
    DEX                    ; 2
    BPL    .branchF8D5     ; 2³
    LDX    $D0             ; 3
    BMI    .branchF8EC     ; 2³
    LDA    $A6,X           ; 4
    AND    #$7F            ; 2
    STA    $A6,X           ; 4
    LDA    #$FF            ; 2
    STA    $D0             ; 3
.branchF8EC:
    LDA    #$10            ; 2
    STA    $C8             ; 3
    LDA    #8              ; 2
    STA    $C6             ; 3
    LDA    #8              ; 2
    BIT    $C7             ; 3
    BNE    .branchF907     ; 2³+1
    LDX    #6              ; 2
.branchF8FC:
    LDA    $A6,X           ; 4
    BEQ    .branchF904     ; 2³
    ORA    #$40            ; 2
    STA    $A6,X           ; 4
.branchF904:
    DEX                    ; 2
    BPL    .branchF8FC     ; 2³+1
.branchF907:
    LDA    #0              ; 2
    STA    $95             ; 3
    STA    $96             ; 3
    RTS                    ; 6

LF90E SUBROUTINE
    LDA    $C8             ; 3
    BPL    .branchF915     ; 2³
    JMP    LFE53           ; 3
.branchF915:
    JSR    LFB4E           ; 6
    LDA    #4              ; 2
    BIT    $C6             ; 3
    BNE    .branchF958     ; 2³
    ASL                    ; 2
    BIT    $C6             ; 3
    BNE    .branchF969     ; 2³
    ASL                    ; 2
    BIT    $C6             ; 3
    BNE    LF8CF           ; 2³+1   WON'T RESOLVE
    ASL                    ; 2
    BIT    $C6             ; 3
    BNE    .branchF930     ; 2³
    JMP    JumpF9A4           ; 3
.branchF930:
    LDX    #$0D            ; 2
.branchF932:
    LDA    LF94A,X         ; 4
    STA    $A6,X           ; 4
    DEX                    ; 2
    BPL    .branchF932     ; 2³
    LDA    $C9             ; 3
    BMI    .branchF949     ; 2³
    LDA    $C5             ; 3
    AND    #$03            ; 2
    BNE    .branchF949     ; 2³
    LDA    #3              ; 2
    JMP    JumpF6D7        ; 3  JUMP TO A SUBROUTINE
.branchF949:
    RTS                    ; 6

LF94A:
    .byte $00,$87,$81,$8D,$85,$00,$00,$00,$00,$8F,$96,$85,$92,$00

.branchF958:
    LDA    #$FF            ; 2
    STA    $D0             ; 3
    JSR    LFADA           ; 6
    JSR    LFACF           ; 6
    LDA    #1              ; 2
    STA    $97             ; 3
    JMP    LFDC1           ; 3
.branchF969:
    INC    $D1             ; 5
    LDA    #3              ; 2
    BIT    $C6             ; 3
    BEQ    .branchF974     ; 2³
    JMP    LFBF7           ; 3
.branchF974:
    LDA    #$40            ; 2
    BIT    $C8             ; 3
    BEQ    .branchF97D     ; 2³
    JMP    JumpF9F5           ; 3
.branchF97D:
    LDA    #2              ; 2
    BIT    $C8             ; 3
    BEQ    .branchF986     ; 2³
    JMP    LFEC9           ; 3
.branchF986:
    ASL                    ; 2
    BIT    $C8             ; 3
    BNE    .branchF9A4     ; 2³
    ASL                    ; 2
    BIT    $C8             ; 3
    BEQ    .branchF993     ; 2³
    JMP    JumpFA64           ; 3
.branchF993:
    ASL                    ; 2
    BIT    $C8             ; 3
    BEQ    .branchF99B     ; 2³
    JMP    LFEFA           ; 3
.branchF99B:
    LDA    #2              ; 2
    BIT    $C7             ; 3
    BEQ    .branchF9A4     ; 2³
    JMP    LFE6F           ; 3
.branchF9A4:
    RTS                    ; 6

JumpF9A4:
    JSR    LF57F           ; 6
    JSR    LFADA           ; 6
    LDA    SWCHB           ; 4
    ROR                    ; 2
    AND    #$60            ; 2
    STA    $C7             ; 3
    LDX    #1              ; 2
    AND    #$20            ; 2
    BEQ    .branchF9BA     ; 2³
    INX                    ; 2
.branchF9BA:
    STX    $96             ; 3
    STX    $97             ; 3
    LDA    $C7             ; 3
    AND    #$40            ; 2
    STA    $B6             ; 3
    LDX    $C1             ; 3
    CPX    #$19            ; 2
    BNE    .branchF9CC     ; 2³
    LDX    #0              ; 2
.branchF9CC:
    STX    $C1             ; 3
    LDA    LFFCA,X         ; 4
    JSR    LF6E4           ; 6
    CMP    #$0A            ; 2
    BCC    .branchF9DD     ; 2³
    SEC                    ; 2
    SBC    #$0A            ; 2
    ORA    #$10            ; 2
.branchF9DD:
    STA    $94             ; 3
    LDA    LFFCA,X         ; 4
    AND    #$0F            ; 2
    STA    $91             ; 3
    TAX                    ; 2
    LDA    LFFE2,X         ; 4
    ORA    $C7             ; 3
    STA    $C7             ; 3
LF9EE SUBROUTINE
    LDX    #0              ; 2
    STX    $FE             ; 3
    JMP    LFD85           ; 3

JumpF9F5:
    LDX    #2              ; 2
    LDA    #0              ; 2
.branchF9F9:
    STA    $94,X           ; 4
    DEX                    ; 2
    BNE    .branchF9F9     ; 2³
    STA    $FE             ; 3
    SED                    ; 2
    LDY    #0              ; 2
.branchFA03:
    LDA.wy $AD,Y           ; 4
    STA    $FF             ; 3
    AND    #$1F            ; 2
    BEQ    .branchFA39     ; 2³
    TAX                    ; 2
    INC    $FE             ; 5
    LDA    #$20            ; 2
    BIT    $FF             ; 3
    CLC                    ; 2
    PHP                    ; 3
    LDA    #0              ; 2
    PLP                    ; 4
    BNE    .branchFA1F     ; 2³
    BVC    .branchFA22     ; 2³
    ADC    LFF32,X         ; 4
.branchFA1F:
    ADC    LFF32,X         ; 4
.branchFA22:
    ADC    LFF32,X         ; 4
    STA    $FF             ; 3
    LDX    $C4             ; 3
    BEQ    .branchFA31     ; 2³
    BPL    .branchFA2F     ; 2³
    ADC    $FF             ; 3
.branchFA2F:
    ADC    $FF             ; 3
.branchFA31:
    ADC    $96             ; 3
    STA    $96             ; 3
    BCC    .branchFA39     ; 2³
    INC    $95             ; 5
.branchFA39:
    INY                    ; 2
    CPY    #7              ; 2
    BNE    .branchFA03     ; 2³
    LDA    #0              ; 2
    LDX    $FE             ; 3
    CPX    #7              ; 2
    BNE    .branchFA48     ; 2³
    LDA    #$50            ; 2
.branchFA48:
    CPX    #6              ; 2
    BNE    .branchFA4E     ; 2³
    LDA    #$10            ; 2
.branchFA4E:
    CPX    #5              ; 2
    BNE    .branchFA54     ; 2³
    LDA    #5              ; 2
.branchFA54:
    CLC                    ; 2
    ADC    $96             ; 3
    STA    $96             ; 3
    BCC    .branchFA5D     ; 2³
    INC    $95             ; 5
.branchFA5D:
    CLD                    ; 2
    LDA    $C8             ; 3
    AND    #$BF            ; 2
    STA    $C8             ; 3
.branchFA64:
    RTS                    ; 6

JumpFA64:
    LDA    $C9             ; 3
    BMI    .branchFA64     ; 2³
    LDA    #0              ; 2
    STA    $81             ; 3
    LDA    #$8F            ; 2
    LDX    $97             ; 3
    CPX    #1              ; 2
    BEQ    .branchFA77     ; 2³
    LDA    #$92            ; 2
.branchFA77:
    STA    $80             ; 3
    LDA    $96             ; 3
    AND    #$0F            ; 2
    BEQ    .branchFA8B     ; 2³
    DEC    $96             ; 5
    LDA    #1              ; 2
    JSR    LFAB3           ; 6
    LDA    #7              ; 2
    JMP    JumpF6D7        ; 3  JUMP TO A SUBROUTINE
.branchFA8B:
    LDA    $96             ; 3
    BEQ    .branchFA97     ; 2³
    SEC                    ; 2
    SBC    #$10            ; 2
    STA    $96             ; 3
    JMP    LFAA1           ; 3
.branchFA97:
    LDA    $95             ; 3
    BEQ    LFAAB           ; 2³
    DEC    $95             ; 5
    LDA    #$90            ; 2
    STA    $96             ; 3
LFAA1:
    LDA    #$10            ; 2
    JSR    LFAB3           ; 6
    LDA    #8              ; 2
    JMP    JumpF6D7        ; 3  JUMP TO A SUBROUTINE
LFAAB:
    LDA    #$FE            ; 2
    JSR    LFE5E           ; 6
    JMP    LFE37           ; 3

LFAB3 SUBROUTINE
    SED                    ; 2
    LDY    #2              ; 2
    CLC                    ; 2
LFAB7:
    ADC    ($80),Y         ; 5
    STA    ($80),Y         ; 6
    BCC    LFAC2           ; 2³
    LDA    #0              ; 2
    DEY                    ; 2
    BPL    LFAB7           ; 2³
LFAC2:
    CLD                    ; 2
    CLD                    ; 2
    RTS                    ; 6

LFAC5 SUBROUTINE
    INC    $E0             ; 5
    AND    #$1F            ; 2
    TAX                    ; 2
    INC    $E0,X           ; 6
    LDA    #0              ; 2
    RTS                    ; 6

LFACF SUBROUTINE
    LDX    #$1B            ; 2
LFAD1:
    LDA    LFF4C,X         ; 4
    STA    $DF,X           ; 4
    DEX                    ; 2
    BNE    LFAD1           ; 2³
    RTS                    ; 6

LFADA SUBROUTINE
    LDX    #8              ; 2
    LDA    #0              ; 2
LFADE:
    STA    $8E,X           ; 4
    DEX                    ; 2
    BNE    LFADE           ; 2³
    LDX    #7              ; 2
    LDA    #0              ; 2
LFAE7:
    STA    $A5,X           ; 4
    DEX                    ; 2
    BNE    LFAE7           ; 2³
LFAEC SUBROUTINE
    LDX    #7              ; 2
    LDA    #0              ; 2
LFAF0:
    STA    $AC,X           ; 4
    DEX                    ; 2
    BNE    LFAF0           ; 2³
    RTS                    ; 6

LFAF6 SUBROUTINE
    LDX    #$A6            ; 2
    LDY    #$A7            ; 2
    BNE    LFB00           ; 2³+1

LFAFC SUBROUTINE
    LDX    #$AD            ; 2
    LDY    #$AE            ; 2
LFB00:
    LDA    #6              ; 2
    STA    $FE             ; 3
LFB04:
    LDA    VSYNC,X         ; 4
    AND    #$1F            ; 2
    BNE    LFB1D           ; 2³
    LDA.wy $00,Y           ; 4  YY
    AND    #$9F            ; 2
    BEQ    LFB1E           ; 2³
    ORA    VSYNC,X         ; 4
    STA    VSYNC,X         ; 4
    LDA.wy $00,Y           ; 4  YY
    AND    #$60            ; 2
    STA.wy $00,Y           ; 5  YY
LFB1D:
    INX                    ; 2
LFB1E:
    INY                    ; 2
    DEC    $FE             ; 5
    BNE    LFB04           ; 2³
    RTS                    ; 6

LFB24 SUBROUTINE
    LDY    #0              ; 2
LFB26:
    LDA.wy $A6,Y           ; 4
    BNE    LFB3A           ; 2³
LFB2B:
    LDX    $FB             ; 3
    LDA    $E0,X           ; 4
    BEQ    LFB40           ; 2³
    DEC    $E0             ; 5
    DEC    $E0,X           ; 6
    STX    $A6,Y           ; 4
    JSR    LFB5A           ; 6
LFB3A:
    INY                    ; 2
    CPY    #7              ; 2
    BNE    LFB26           ; 2³
LFB3F:
    RTS                    ; 6

LFB40:
    LDA    $E0             ; 3
    BEQ    LFB3F           ; 2³
    DEC    $FB             ; 5
    BNE    LFB2B           ; 2³
    LDA    #$1A            ; 2
    STA    $FB             ; 3
    BNE    LFB2B           ; 2³
LFB4E SUBROUTINE
    INC    $FD             ; 5
    LDA    $FD             ; 3
    CMP    #$0E            ; 2
    BCC    LFB58           ; 2³
    LDA    #1              ; 2
LFB58:
    STA    $FD             ; 3
LFB5A SUBROUTINE
    LDA    $FC             ; 3
    CLC                    ; 2
    ADC    $FD             ; 3
    CMP    #$62            ; 2
    BCC    LFB66           ; 2³
    SEC                    ; 2
    SBC    #$62            ; 2
LFB66:
    STA    $FC             ; 3
    TAX                    ; 2
    LDA    LFF68,X         ; 4
    STA    $FB             ; 3
    RTS                    ; 6

LFB6F SUBROUTINE
    STY    $FF             ; 3
    PHA                    ; 3
    TXA                    ; 2
    PHA                    ; 3
    LDA.wy $AD,Y           ; 4
    AND    #$1F            ; 2
    BNE    LFB89           ; 2³
LFB7B:
    LDY    $FF             ; 3
    PLA                    ; 4
    TAX                    ; 2
    PLA                    ; 4
    ORA.wy $AD,Y           ; 4
    STA.wy $AD,Y           ; 5
    LDA    #0              ; 2
    RTS                    ; 6

LFB89:
    CPY    #0              ; 2
    BEQ    LFBC6           ; 2³
    LDX    #0              ; 2
    LDY    #1              ; 2
LFB91:
    CPY    $FF             ; 3
    BEQ    LFBBC           ; 2³
LFB95:
    LDA    $AD,X           ; 4
    AND    #$1F            ; 2
    BNE    LFBAC           ; 2³
    LDA.wy $AD,Y           ; 4
    AND    #$1F            ; 2
    ORA    $AD,X           ; 4
    STA    $AD,X           ; 4
    LDA.wy $AD,Y           ; 4
    AND    #$E0            ; 2
    STA.wy $AD,Y           ; 5
LFBAC:
    INX                    ; 2
    CPX    #6              ; 2
    BEQ    LFBBC           ; 2³
    INY                    ; 2
    CPY    #6              ; 2
    BNE    LFB91           ; 2³
    LDA    $BD             ; 3
    CMP    #$0C            ; 2
    BEQ    LFB95           ; 2³
LFBBC:
    LDA    $AD,X           ; 4
    AND    #$1F            ; 2
    BNE    LFBC6           ; 2³
    STX    $FF             ; 3
    BEQ    LFB7B           ; 2³
LFBC6:
    LDX    #6              ; 2
    LDY    #5              ; 2
    CPX    $FF             ; 3
    BEQ    LFBEB           ; 2³
LFBCE:
    LDA    $AD,X           ; 4
    AND    #$1F            ; 2
    BNE    LFBE5           ; 2³
    LDA.wy $AD,Y           ; 4
    AND    #$1F            ; 2
    ORA    $AD,X           ; 4
    STA    $AD,X           ; 4
    LDA.wy $AD,Y           ; 4
    AND    #$E0            ; 2
    STA.wy $AD,Y           ; 5
LFBE5:
    DEX                    ; 2
    DEY                    ; 2
    CPX    $FF             ; 3
    BNE    LFBCE           ; 2³
LFBEB:
    LDA    $AD,X           ; 4
    AND    #$1F            ; 2
    BEQ    LFB7B           ; 2³
    PLA                    ; 4
    TAX                    ; 2
    PLA                    ; 4
    LDY    $FF             ; 3
    RTS                    ; 6

LFBF7:
    LDA    #2              ; 2
    BIT    $C8             ; 3
    BNE    LFC06           ; 2³+1
    LDA    $BE             ; 3
    CMP    #2              ; 2
    BNE    LFC17           ; 2³
    JMP    LFCC7           ; 3
LFC06:
    LDA    $C6             ; 3
    AND    #$03            ; 2
    CMP    $97             ; 3
    BEQ    LFC11           ; 2³
    JMP    LFCB4           ; 3
LFC11:
    JSR    LFDE8           ; 6
    JMP    LFCB4           ; 3
LFC17:
    LDA    $97             ; 3
    BIT    $C6             ; 3
    BNE    LFC20           ; 2³
    JMP    LFCB4           ; 3
LFC20:
    LDA    $BD             ; 3
    CLC                    ; 2
    ADC    #1              ; 2
    ROR                    ; 2
    LDX    $BE             ; 3
    BEQ    LFC2D           ; 2³
    CLC                    ; 2
    ADC    #7              ; 2
LFC2D:
    TAX                    ; 2
    LDA    $D0             ; 3
    BPL    LFC4E           ; 2³
    LDA    $BD             ; 3
    CLC                    ; 2
    ROR                    ; 2
    BCS    LFCAF           ; 2³
    LDA    $A6,X           ; 4
    AND    #$1F            ; 2
    BEQ    LFCAF           ; 2³
    STX    $D0             ; 3
    LDA    $A6,X           ; 4
    ORA    #$80            ; 2
    STA    $A6,X           ; 4
    LDA    #1              ; 2
    JSR    LF6D7           ; 6
    JMP    LFCB4           ; 3
LFC4E:
    CPX    $D0             ; 3
    BNE    LFC6B           ; 2³
    LDA    $A6,X           ; 4
    AND    #$7F            ; 2
    JMP    LFC5D           ; 3
LFC59:
    LDA    $A6,X           ; 4
    AND    #$60            ; 2
LFC5D:
    STA    $A6,X           ; 4
LFC5F:
    LDA    #$FF            ; 2
    STA    $D0             ; 3
    LDA    #2              ; 2
    JSR    LF6D7           ; 6
    JMP    LFCB4           ; 3
LFC6B:
    CPX    #7              ; 2
    BCS    LFC8F           ; 2³
    LDA    $D0             ; 3
    CMP    #7              ; 2
    BCC    LFCAF           ; 2³
    LDA    $A6,X           ; 4
    BNE    LFCAF           ; 2³
    CPX    #6              ; 2
    BNE    LFC81           ; 2³
    LDY    $AB             ; 3
    BNE    LFCAF           ; 2³
LFC81:
    LDY    $D0             ; 3
    LDA.wy $A6,Y           ; 4
    AND    #$1F            ; 2
    STA    $A6,X           ; 4
    LDX    $D0             ; 3
    JMP    LFC59           ; 3
LFC8F:
    TXA                    ; 2
    SEC                    ; 2
    SBC    #7              ; 2
    TAY                    ; 2
    LDX    $D0             ; 3
    LDA    $A6,X           ; 4
    AND    #$1F            ; 2
    PHA                    ; 3
    LDA    $A6,X           ; 4
    AND    #$60            ; 2
    STA    $A6,X           ; 4
    PLA                    ; 4
    JSR    LFB6F           ; 6
    CMP    #0              ; 2
    BEQ    LFC5F           ; 2³
    ORA    $A6,X           ; 4
    ORA    #$80            ; 2
    STA    $A6,X           ; 4
LFCAF:
    LDA    #4              ; 2
    JSR    LF6D7           ; 6
LFCB4:
    LDA    #$FC            ; 2
    AND    $C6             ; 3
    STA    $C6             ; 3
    LDA    $C8             ; 3
    ORA    #$40            ; 2
    STA    $C8             ; 3
    JSR    LFAF6           ; 6
    JSR    LFAFC           ; 6
    RTS                    ; 6

LFCC7:
    LDA    $BD             ; 3
    CMP    #2              ; 2
    BNE    LFD22           ; 2³+1
    LDA    #4              ; 2
    BIT    $C8             ; 3
    BNE    LFCF2           ; 2³
    LDA    $C6             ; 3
    AND    #$03            ; 2
    CMP    $97             ; 3
    BEQ    LFCDE           ; 2³
    JMP    LFCB4           ; 3
LFCDE:
    LDA    #5              ; 2
    JSR    LF6D7           ; 6
    LDA    #4              ; 2
    ORA    $C8             ; 3
    STA    $C8             ; 3
    LDA    $C6             ; 3
    AND    #$7C            ; 2
    STA    $C6             ; 3
    JMP    JumpF9F5           ; 3
LFCF2:
    LDA    $C6             ; 3
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    #$20            ; 2
    BIT    $C7             ; 3
    BNE    LFD04           ; 2³+1
    CPY    $97             ; 3
    BEQ    LFD0B           ; 2³
    JMP    LFCAF           ; 3
LFD04:
    CPY    $97             ; 3
    BNE    LFD0B           ; 2³
    JMP    LFCAF           ; 3
LFD0B:
    LDA    #3              ; 2
    JSR    LF6D7           ; 6
    LDA    #8              ; 2
    STA    $C8             ; 3
    LDA    $C6             ; 3
    AND    #$BF            ; 2
    STA    $C6             ; 3
    LDA    #$FC            ; 2
    JSR    LFE5E           ; 6
    JMP    LFCB4           ; 3
LFD22:
    LDA    $C6             ; 3
    AND    #$03            ; 2
    CMP    $97             ; 3
    BEQ    LFD2D           ; 2³
    JMP    LFCB4           ; 3
LFD2D:
    LDA    #$10            ; 2
    STA    $C6             ; 3
    LDA    #0              ; 2
    JSR    LF6D7           ; 6
    JMP    LFCB4           ; 3
LFD39 SUBROUTINE
    JSR    LF57F           ; 6
    LDA    #0              ; 2
    STA    $C3             ; 3
    LDX    $C1             ; 3
    LDA    LFFCA,X         ; 4
    JSR    LF6E4           ; 6
    TAX                    ; 2
    LDY    LFFE7,X         ; 4
    BNE    LFD4F           ; 2³
    RTS                    ; 6

LFD4F:
    LDA    $C7             ; 3
    ORA    #$80            ; 2
    STA    $C7             ; 3
    STY    $C2             ; 3
    CPY    #$FF            ; 2
    BNE    LFD65           ; 2³
    LDA    $9B             ; 3
    ORA    #$03            ; 2
    ASL                    ; 2
    ASL                    ; 2
    AND    #$1F            ; 2
    STA    $C2             ; 3
LFD65:
    BIT    $C7             ; 3
    BVC    LFD6C           ; 2³
    CLC                    ; 2
    ROR    $C2             ; 5
LFD6C:
    RTS                    ; 6

LFD6D SUBROUTINE
    LDX    #0              ; 2
    LDA    $FC             ; 3
    CMP    #$1E            ; 2
    BCS    LFD7D           ; 2³
    LDX    #1              ; 2
    CMP    #$0C            ; 2
    BCS    LFD7D           ; 2³
    LDX    #$FF            ; 2
LFD7D:
    LDA    $9B             ; 3
    ROR                    ; 2
    ROR                    ; 2
    AND    #$03            ; 2
    STA    $FE             ; 3
LFD85:
    STX    $C4             ; 3
    LDA    $D1             ; 3
    STA    $FF             ; 3
    LDY    #0              ; 2
LFD8D:
    INC    $FF             ; 5
    LDA    $FF             ; 3
    AND    #7              ; 2
    TAX                    ; 2
    LDA    LFFED,X         ; 4
    STA    $8E             ; 3
    AND    #$07            ; 2
    TAX                    ; 2
    LDA    LF294,X         ; 4
    STA.wy $CD,Y           ; 5
    LDA    $99             ; 3
    DEC    $FE             ; 5
    BMI    LFDB8           ; 2³
    LDA    $8E             ; 3
    AND    #$60            ; 2
    STA    $AD,X           ; 4
    ASL    $8E             ; 5
    LDA    #$72            ; 2
    ASL    $8E             ; 5
    BCS    LFDB8           ; 2³
    LDA    #$7D            ; 2
LFDB8:
    STA.wy $CA,Y           ; 5
    INY                    ; 2
    CPY    #3              ; 2
    BNE    LFD8D           ; 2³
    RTS                    ; 6

LFDC1:
    LDA    #$48            ; 2
    STA    $C6             ; 3
    LDA    #2              ; 2
    STA    $C8             ; 3
    LDA    #2              ; 2
    BIT    $C7             ; 3
    BEQ    LFDDA           ; 2³
    LDX    #6              ; 2
LFDD1:
    LDA    $A6,X           ; 4
    AND    ENABL           ; 3
    STA    $A6,X           ; 4
    DEX                    ; 2
    BPL    LFDD1           ; 2³
LFDDA:
    JSR    LFAEC           ; 6
    JSR    LF57F           ; 6
    JSR    LF9EE           ; 6
    LDA    #$FF            ; 2
    JMP    JFE5E           ; 3  JUMP TO A SUBROUTINE

LFDE8 SUBROUTINE
    JSR    LFD6D           ; 6
    JSR    LFD39           ; 6
    LDX    #0              ; 2
LFDF0:
    LDA    $A6,X           ; 4
    AND    #$1F            ; 2
    STA    $A6,X           ; 4
    INX                    ; 2
    CPX    #7              ; 2
    BNE    LFDF0           ; 2³
    JSR    LFB24           ; 6
    LDA    $C7             ; 3
    AND    #$02            ; 2
    BEQ    LFE13           ; 2³
    LDA    $AC             ; 3
    AND    #$1F            ; 2
    BNE    LFE0C           ; 2³
    BEQ    LFE20           ; 2³
LFE0C:
    JSR    LFAC5           ; 6
    STA    $AC             ; 3
    BEQ    LFE20           ; 2³
LFE13:
    LDA    $A6             ; 3
    ORA    $AD             ; 3
    STA    $AD             ; 3
    LDA    #0              ; 2
    STA    $A6             ; 3
    JSR    LFAF6           ; 6
LFE20:
    LDA    #0              ; 2
    STA    $C8             ; 3
    LDA    $C7             ; 3
    AND    #$80            ; 2
    ORA    $C6             ; 3
    STA    $C6             ; 3
LFE2C:
    LDA    #0              ; 2
    STA    $BD             ; 3
    LDA    #0              ; 2
    STA    $BE             ; 3
    JMP    LF570           ; 3  JUMP TO A SUBROUTINE
LFE37:
    LDA    #1              ; 2
    BIT    $C7             ; 3
    BEQ    LFE42           ; 2³
    LDA    #$10            ; 2
    STA    $C6             ; 3
    RTS                    ; 6

LFE42:
    LDA    #$40            ; 2
    STA    $C8             ; 3
    LDA    $C7             ; 3
    AND    #$80            ; 2
    ORA    #$40            ; 2
    ORA    $C6             ; 3
    STA    $C6             ; 3
    JMP    LFE2C           ; 3
LFE53:
    LDA    $C5             ; 3
    BNE    LFE5D           ; 2³
    LDA    $C8             ; 3
    AND    #$7F            ; 2
    STA    $C8             ; 3
LFE5D:
    RTS                    ; 6

LFE5E SUBROUTINE
JFE5E:
    STA    $C5             ; 3
    LDA    $9B             ; 3
    CMP    #$0F            ; 2
    BCC    LFE68           ; 2³
    DEC    $C5             ; 5
LFE68:
    LDA    $C8             ; 3
    ORA    #$80            ; 2
    STA    $C8             ; 3
    RTS                    ; 6

LFE6F:
    LDA    $C5             ; 3
    AND    #$03            ; 2
    CMP    #2              ; 2
    BEQ    LFE7E           ; 2³
    LDA    $C8             ; 3
    AND    #$DF            ; 2
    STA    $C8             ; 3
    RTS                    ; 6

LFE7E:
    LDA    #$20            ; 2
    BIT    $C8             ; 3
    BNE    LFEBC           ; 2³
    ORA    $C8             ; 3
    STA    $C8             ; 3
    LDA    $A6             ; 3
    BPL    LFE90           ; 2³
    LDX    #$FF            ; 2
    STX    $D0             ; 3
LFE90:
    AND    #$1F            ; 2
    BEQ    LFEA3           ; 2³
    LDA    #4              ; 2
    BIT    $C7             ; 3
    BNE    LFE9F           ; 2³
    LDA    $A6             ; 3
    JSR    LFAC5           ; 6
LFE9F:
    LDA    #0              ; 2
    STA    $A6             ; 3
LFEA3:
    JSR    LFAF6           ; 6
    JSR    LFB24           ; 6
    LDA    $AC             ; 3
    BEQ    LFEB2           ; 2³
    JSR    LFAC5           ; 6
    STA    $AC             ; 3
LFEB2:
    LDA    $D0             ; 3
    BMI    LFEBC           ; 2³
    CMP    #7              ; 2
    BCS    LFEBC           ; 2³
    DEC    $D0             ; 5
LFEBC:
    LDA    $E0             ; 3
    BNE    LFEC8           ; 2³
    LDA    $A6             ; 3
    BNE    LFEC8           ; 2³
    LDA    $AD             ; 3
    BEQ    LFEF5           ; 2³
LFEC8:
    RTS                    ; 6

LFEC9:
    LDX    #0              ; 2
LFECB:
    LDA    $A6,X           ; 4
    BEQ    LFEE2           ; 2³
    CMP    #$20            ; 2
    BCC    LFED9           ; 2³
    INX                    ; 2
    CPX    #7              ; 2
    BNE    LFECB           ; 2³
    RTS                    ; 6

LFED9:
    AND    #$1F            ; 2
    LDY    #0              ; 2
    STY    $A6,X           ; 4
    JSR    LFAC5           ; 6
LFEE2:
    JSR    LFAF6           ; 6
    LDA    $E0             ; 3
    BEQ    LFEF1           ; 2³
    JSR    LFB24           ; 6
LFEEC:
    LDA    #6              ; 2
    JMP    JumpF6D7        ; 3  JUMP TO A SUBROUTINE
LFEF1:
    LDA    $A6             ; 3
    BNE    LFEEC           ; 2³
LFEF5:
    LDA    #$20            ; 2
    STA    $C6             ; 3
    RTS                    ; 6

LFEFA:
    LDX    #0              ; 2
LFEFC:
    LDA    $A6,X           ; 4
    BEQ    LFF12           ; 2³
    CMP    #$20            ; 2
    BCS    LFF12           ; 2³
    CMP    #$1B            ; 2
    BCC    LFF28           ; 2³+1
    ADC    #0              ; 2
    CMP    #$1F            ; 2
    BNE    LFF2F           ; 2³
    LDA    #0              ; 2
    STA    $A6,X           ; 4
LFF12:
    INX                    ; 2
    CPX    #$0E            ; 2
    BNE    LFEFC           ; 2³+1
    LDA    #$20            ; 2
    BIT    $C7             ; 3
    BEQ    LFF25           ; 2³
    DEC    $97             ; 5
    BNE    LFF25           ; 2³
    INC    $97             ; 5
    INC    $97             ; 5
LFF25:
    JMP    LFDC1           ; 3
LFF28:
    LDA    #6              ; 2
    JSR    LF6D7           ; 6
    LDA    #$1B            ; 2
LFF2F:
    STA    $A6,X           ; 4
    RTS                    ; 6

LFF32:
    .byte $00,$01,$03,$03,$02,$01,$04,$02,$04,$01,$08,$05,$01,$03,$01,$01
    .byte $03,$10,$01,$01,$01,$01,$04,$04,$08,$04
LFF4C:
    .byte $10,$62,$09,$02,$02,$04,$0C,$02,$03,$02,$09,$01,$01,$04,$02,$06
    .byte $08,$02,$01,$06,$04,$06,$04,$02,$02,$01,$02,$01
LFF68:
    .byte $0C,$0E,$0E,$04,$05,$01,$05,$02,$05,$0C,$10,$15,$0D,$04,$17,$19
    .byte $13,$01,$0F,$0C,$12,$01,$06,$01,$03,$12,$15,$05,$0F,$09,$14,$05
    .byte $16,$0E,$02,$0F,$05,$0D,$09,$0C,$09,$06,$16,$07,$04,$14,$01,$03
    .byte $01,$0E,$05,$09,$01,$0B,$0E,$12,$12,$14,$17,$14,$05,$05,$0F,$13
    .byte $13,$07,$04,$12,$0F,$0F,$05,$09,$05,$15,$14,$09,$0E,$08,$0F,$09
    .byte $09,$0F,$13,$08,$0A,$1A,$07,$18,$10,$11,$19,$05,$01,$14,$01,$09
    .byte $15,$12
LFFCA:
    .byte $11,$21,$31,$41,$51,$12,$22,$32,$42,$52,$13,$23,$33,$43,$53,$14
    .byte $24,$34,$44,$54,$15,$25,$35,$45
LFFE2:
    .byte $55,$09,$01,$08,$03
LFFE7:
    .byte $07,$00,$3C,$24,$0C,$FF
LFFED:
    .byte $20,$46,$25,$41,$23,$26,$42,$44,$FF,$FF,$FF,$FF,$FF

    ORG $FFFA

    .word START,START,START