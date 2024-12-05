; Disassembly of oth.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcoth.cfg oth.bin 
;
; oth.cfg contents:
;
;      ORG F000
;      CODE F000 F1E3
;      GFX F1E4 F223
;      CODE F224 F3B5
;      GFX F3B6 F42A
;      CODE F42B F663
;      GFX F664 F673
;      CODE F674 F7AF
;      GFX F7B0 F7FF

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
RESM1   =  $13
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
ENAM1   =  $1E
ENABL   =  $1F
HMP1    =  $21
HMM0    =  $22
HMBL    =  $24
HMOVE   =  $2A
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

       ORG $F000

START:
    SEI                    ; 2
    CLD                    ; 2
    LDX    #$00            ; 2
    TXA                    ; 2
LF005:
    STA    VSYNC,X         ; 4
    INX                    ; 2
    BNE    LF005           ; 2
    DEX                    ; 2
    TXS                    ; 2
    LDA    #$32            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    $D8             ; 3
    LDA    #$0F            ; 2
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    LSR                    ; 2
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    WSYNC           ; 3
    LDY    #$C0            ; 2
LF023:
    ROR                    ; 2
    BCS    LF023           ; 2
    STA    RESBL           ; 3
    STA    RESP0           ; 3
    NOP                    ; 2
    STA    RESP1           ; 3
    STY    HMBL            ; 3
    NOP                    ; 2
    STA    HMP1            ; 3
    ASL                    ; 2
    STA    HMM0            ; 3
    STA    RESM0           ; 3
    STA    HMM0            ; 3
    STA    RESM1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    JSR    LF781           ; 6
LF042:
    STA    WSYNC           ; 3
    STA    TIM64T          ; 4
    JSR    LF476           ; 6
    JSR    LF75C           ; 6
    JSR    LF741           ; 6
    JSR    LF593           ; 6
    LDA    $D3             ; 3
    BPL    LF068           ; 2
    LDX    $C0             ; 3
    BEQ    LF068           ; 2
    BIT    $DA             ; 3
    BVS    LF065           ; 2
    JSR    LF710           ; 6
    JSR    LF63A           ; 6
LF065:
    JSR    LF42B           ; 6
LF068:
    LDX    INTIM           ; 4
    BNE    LF068           ; 2
    LDA    #$02            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    LDY    #$AC            ; 2
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STX    VSYNC           ; 3
    STX    VBLANK          ; 3
    STY    TIM64T          ; 4
    JSR    LF674           ; 6
    LDA    $C0             ; 3
    BNE    LF0A0           ; 2
    LDA    $CE             ; 3
    ORA    $D0             ; 3
    CMP    #$03            ; 2
    BCS    LF0A0           ; 2
    LDX    #$05            ; 2
    LDY    #$00            ; 2
LF097:
    STY    $E3,X           ; 4
    DEX                    ; 2
    BNE    LF097           ; 2
    LDA    $C4             ; 3
    BNE    LF0A9           ; 2
LF0A0:
    LDA    $D0             ; 3
    LDX    #$E4            ; 2
    JSR    LF504           ; 6
    LDA    $CE             ; 3
LF0A9:
    LDX    #$DF            ; 2
    JSR    LF504           ; 6
    LDA    #$86            ; 2
LF0B0:
    LDX    INTIM           ; 4
    BEQ    LF042           ; 2
    BPL    LF0B0           ; 2
    DEX                    ; 2
    BMI    LF0B0           ; 2
    STA    WSYNC           ; 3
    LDA    #$24            ; 2
    STA    CTRLPF          ; 3
    LDX    #$05            ; 2
LF0C2:
    LDY    #$02            ; 2
LF0C4:
    STA    WSYNC           ; 3
    LDA    $DE,X           ; 4
    STA    PF1             ; 3
    LDA    $D5             ; 3
    STA    COLUPF          ; 3
    LDA    #$02            ; 2
LF0D0:
    PHA                    ; 3
    PLA                    ; 4
    LSR                    ; 2
    BNE    LF0D0           ; 2
    LDA    $E3,X           ; 4
    STA    PF1             ; 3
    LDA    $D7             ; 3
    STA    COLUPF          ; 3
    DEY                    ; 2
    BNE    LF0C4           ; 2
    DEX                    ; 2
    BNE    LF0C2           ; 2
    STA    WSYNC           ; 3
    STX    PF1             ; 3
    LDX    $CF             ; 3
    LDY    $80,X           ; 4
    LDA    $C2             ; 3
    AND    #$03            ; 2
    BNE    LF0F9           ; 2
    TYA                    ; 2
    LDY    $C0             ; 3
    EOR    $C0             ; 3
    BNE    LF0F9           ; 2
    TAY                    ; 2
LF0F9:
    STY    $E8             ; 3
    STA    WSYNC           ; 3
    LDX    #$04            ; 2
LF0FF:
    DEX                    ; 2
    BNE    LF0FF           ; 2
    DEX                    ; 2
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    ENABL           ; 3
    STX    ENAM0           ; 3
    STX    ENAM1           ; 3
    LDX    #$3F            ; 2
    STX    $E7             ; 3
    JMP    LF17A           ; 3
    
LF114:
    LDA    #$24            ; 2
    STA    CTRLPF          ; 3
    LDA    #$11            ; 2
    STA    PF1             ; 3
    LDA    #$88            ; 2
    STA    PF2             ; 3
    STA    PF0             ; 3
    LDY    #$05            ; 2
    JSR    LF1DC           ; 6
    STA    WSYNC           ; 3
    LDA    #$88            ; 2
    STA    PF2             ; 3
    LDX    #$0E            ; 2
    LDY    #$07            ; 2
LF131:
    DEY                    ; 2
    BNE    LF131           ; 2
    JMP    LF163           ; 3

LF137:
    LDA    #$88            ; 2
    STA    PF2             ; 3
    LDA.w  $00E6           ; 4
    STA    COLUP0          ; 3
    LDA.w  $00E5           ; 4
    STA    COLUP1          ; 3
    LDA.w  $00E4           ; 4
    LDY.w  $00E3           ; 4
    STA    COLUP0          ; 3
    STY    COLUP1          ; 3
    LDA.w  $00E2           ; 4
    STA    COLUP0          ; 3
    LDA.w  $00E1           ; 4
    STA    COLUP1          ; 3
    LDA.w  $00E0           ; 4
    STA    COLUP0          ; 3
    LDA.w  $00DF           ; 4
    STA    COLUP1          ; 3
LF163:
    LDA    #$08            ; 2
    STA    PF2             ; 3
    STA    WSYNC           ; 3
    DEX                    ; 2
    BPL    LF137           ; 2
    LDX    $D6             ; 3
    STX    COLUP0          ; 3
    STX    COLUP1          ; 3
    JSR    LF1D6           ; 6
    STA    WSYNC           ; 3
    JSR    LF1D6           ; 6
LF17A:
    STA    WSYNC           ; 3
    LDA    #$25            ; 2
    STA    CTRLPF          ; 3
    LDX    #$FF            ; 2
    STX    PF1             ; 3
    STX    PF2             ; 3
    INX                    ; 2
    STX    PF0             ; 3
    LDX    $E7             ; 3
    BMI    LF1AA           ; 2
    LDY    #$07            ; 2
LF18F:
    LDA    $80,X           ; 4
    CPX    $CF             ; 3
    BNE    LF197           ; 2
    LDA    $E8             ; 3
LF197:
    TAX                    ; 2
    LDA    $D6,X           ; 4
    STA.wy $00DF,Y         ; 5
    LDX    $E7             ; 3
    DEX                    ; 2
    STX    $E7             ; 3
    DEY                    ; 2
    BPL    LF18F           ; 2
    STA    WSYNC           ; 3
    JMP    LF114           ; 3
LF1AA:
    LDX    #$04            ; 2
LF1AC:
    STA    WSYNC           ; 3
    DEX                    ; 2
    BNE    LF1AC           ; 2
    STX    ENABL           ; 3
    STX    PF0             ; 3
    STX    PF1             ; 3
    STX    PF2             ; 3
    STX    ENAM0           ; 3
    STX    ENAM1           ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    INC    $C2             ; 5
    BNE    LF1CF           ; 2
    INC    $C3             ; 5
    BNE    LF1CF           ; 2
    STX    $C0             ; 3
    LDA    #$40            ; 2
    STA    $CF             ; 3
LF1CF:
    LDA    #$21            ; 2
    STX    AUDV0           ; 3
    JMP    LF042           ; 3
LF1D6:
    LDA    #$88            ; 2
    STA    PF2             ; 3
    LDY    #$07            ; 2
LF1DC:
    DEY                    ; 2
    BNE    LF1DC           ; 2
    LDA    #$08            ; 2
    STA    PF2             ; 3
    RTS                    ; 6

LF1E4:
    .byte $6C ; | XX XX  | $F1E4
    .byte $BC ; |X XXXX  | $F1E5
    .byte $BC ; |X XXXX  | $F1E6
    .byte $BC ; |X XXXX  | $F1E7
    .byte $BC ; |X XXXX  | $F1E8
    .byte $BC ; |X XXXX  | $F1E9
    .byte $BC ; |X XXXX  | $F1EA
    .byte $94 ; |X  X X  | $F1EB
    .byte $9B ; |X  XX XX| $F1EC
    .byte $23 ; |  X   XX| $F1ED
    .byte $50 ; | X X    | $F1EE
    .byte $50 ; | X X    | $F1EF
    .byte $50 ; | X X    | $F1F0
    .byte $50 ; | X X    | $F1F1
    .byte $38 ; |  XXX   | $F1F2
    .byte $B4 ; |X XX X  | $F1F3
    .byte $9B ; |X  XX XX| $F1F4
    .byte $66 ; | XX  XX | $F1F5
    .byte $5D ; | X XXX X| $F1F6
    .byte $2D ; |  X XX X| $F1F7
    .byte $2D ; |  X XX X| $F1F8
    .byte $5D ; | X XXX X| $F1F9
    .byte $69 ; | XX X  X| $F1FA
    .byte $B4 ; |X XX X  | $F1FB
    .byte $9B ; |X  XX XX| $F1FC
    .byte $66 ; | XX  XX | $F1FD
    .byte $2D ; |  X XX X| $F1FE
    .byte $2D ; |  X XX X| $F1FF
    .byte $2D ; |  X XX X| $F200
    .byte $2D ; |  X XX X| $F201
    .byte $69 ; | XX X  X| $F202
    .byte $B4 ; |X XX X  | $F203
    .byte $9B ; |X  XX XX| $F204
    .byte $66 ; | XX  XX | $F205
    .byte $2D ; |  X XX X| $F206
    .byte $2D ; |  X XX X| $F207
    .byte $2D ; |  X XX X| $F208
    .byte $2D ; |  X XX X| $F209
    .byte $69 ; | XX X  X| $F20A
    .byte $B4 ; |X XX X  | $F20B
    .byte $9B ; |X  XX XX| $F20C
    .byte $66 ; | XX  XX | $F20D
    .byte $5D ; | X XXX X| $F20E
    .byte $2D ; |  X XX X| $F20F
    .byte $2D ; |  X XX X| $F210
    .byte $5D ; | X XXX X| $F211
    .byte $69 ; | XX X  X| $F212
    .byte $B4 ; |X XX X  | $F213
    .byte $9B ; |X  XX XX| $F214
    .byte $40 ; | X      | $F215
    .byte $60 ; | XX     | $F216
    .byte $60 ; | XX     | $F217
    .byte $60 ; | XX     | $F218
    .byte $60 ; | XX     | $F219
    .byte $48 ; | X  X   | $F21A
    .byte $B4 ; |X XX X  | $F21B
    .byte $8D ; |X   XX X| $F21C
    .byte $B8 ; |X XXX   | $F21D
    .byte $B8 ; |X XXX   | $F21E
    .byte $B8 ; |X XXX   | $F21F
    .byte $B8 ; |X XXX   | $F220
    .byte $B8 ; |X XXX   | $F221
    .byte $B8 ; |X XXX   | $F222
    .byte $7F ; | XXXXXXX| $F223
    LDX    #$00            ; 2
    LDA    $86             ; 3
    ORA    $B0             ; 3
LF22A:
    LDY    $80,X           ; 4
    BEQ    LF231           ; 2
    LDA    #$00            ; 2
    RTS                    ; 6

LF231:
    ASL                    ; 2
    LDA    #$B0            ; 2
    BCC    LF238           ; 2
    LDA    #$BC            ; 2
LF238:
    RTS                    ; 6

    LDA    $81             ; 3
    ORA    $B7             ; 3
    LDX    #$07            ; 2
    BNE    LF22A           ; 2
    LDA    $88             ; 3
    ORA    $BE             ; 3
    LDX    #$38            ; 2
    BNE    LF22A           ; 2
    LDA    $8F             ; 3
    ORA    $B9             ; 3
    LDX    #$3F            ; 2
    BNE    LF22A           ; 2
    TXA                    ; 2
    SEC                    ; 2
    SBC    #$08            ; 2
LF255:
    TAX                    ; 2
LF256:
    LDA    #$F8            ; 2
    LDY    $80,X           ; 4
    CPY    #$01            ; 2
    BNE    LF260           ; 2
    LDA    #$04            ; 2
LF260:
    RTS                    ; 6

    TXA                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    BNE    LF255           ; 2
    DEX                    ; 2
    BNE    LF256           ; 2
    INX                    ; 2
    BNE    LF256           ; 2
    JSR    LF2BD           ; 6
    BMI    LF27B           ; 2
LF272:
    LDX    $C6             ; 3
    JSR    LF29C           ; 6
    BMI    LF27B           ; 2
LF279:
    LDA    #$38            ; 2
LF27B:
    LDY    #$00            ; 2
    STY    $CC             ; 3
    RTS                    ; 6

    JSR    LF2B9           ; 6
    BMI    LF27B           ; 2
LF285:
    LDX    $C6             ; 3
    JSR    LF2B5           ; 6
    BMI    LF27B           ; 2
    BPL    LF279           ; 2
    JSR    LF2B9           ; 6
    BMI    LF27B           ; 2
    BPL    LF272           ; 2
    JSR    LF2BD           ; 6
    BMI    LF27B           ; 2
    BPL    LF285           ; 2
LF29C:
    LDY    #$38            ; 2
LF29E:
    TXA                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $DD             ; 3
    LDX    #$07            ; 2
LF2A6:
    LDA.wy $0080,Y         ; 4
    STA    $DF,X           ; 4
    TYA                    ; 2
    SEC                    ; 2
    SBC    #$08            ; 2
    TAY                    ; 2
    DEX                    ; 2
    BPL    LF2A6           ; 2
    BMI    LF2CF           ; 2
LF2B5:
    LDY    #$3F            ; 2
    BNE    LF29E           ; 2
LF2B9:
    LDY    #$3F            ; 2
    BNE    LF2BF           ; 2
LF2BD:
    LDY    #$07            ; 2
LF2BF:
    TXA                    ; 2
    AND    #$07            ; 2
    STA    $DD             ; 3
    LDX    #$07            ; 2
LF2C6:
    LDA.wy $0080,Y         ; 4
    STA    $DF,X           ; 4
    DEY                    ; 2
    DEX                    ; 2
    BPL    LF2C6           ; 2
LF2CF:
    LDA    $C4             ; 3
    LSR                    ; 2
    BEQ    LF328           ; 2
    JSR    LF55F           ; 6
    ASL                    ; 2
    ASL                    ; 2
    STA    $DE             ; 3
    LDA    $DF             ; 3
    LDX    $E6             ; 3
    STX    $DF             ; 3
    STA    $E6             ; 3
    LDA    $E0             ; 3
    LDX    $E5             ; 3
    STX    $E0             ; 3
    STA    $E5             ; 3
    LDA    $E1             ; 3
    LDX    $E4             ; 3
    STX    $E1             ; 3
    STA    $E4             ; 3
    LDA    $E2             ; 3
    LDX    $E3             ; 3
    STX    $E2             ; 3
    STA    $E3             ; 3
    LDA    #$07            ; 2
    SEC                    ; 2
    SBC    $DD             ; 3
    STA    $DD             ; 3
    JSR    LF55F           ; 6
    ORA    $DE             ; 3
    TAY                    ; 2
    CPY    #$05            ; 2
    BNE    LF316           ; 2
    LDA    #$D8            ; 2
    LDX    $DF             ; 3
    BNE    LF328           ; 2
    LDX    $E6             ; 3
    BNE    LF328           ; 2
LF316:
    CPY    #$07            ; 2
    BEQ    LF31E           ; 2
    CPY    #$0D            ; 2
    BNE    LF329           ; 2
LF31E:
    LDA    $E7             ; 3
    BEQ    LF326           ; 2
    CMP    #$07            ; 2
    BNE    LF329           ; 2
LF326:
    LDA    #$A0            ; 2
LF328:
    RTS                    ; 6

LF329:
    LDX    $DD             ; 3
    BEQ    LF34F           ; 2
    CPX    #$07            ; 2
    BEQ    LF34F           ; 2
    CPX    #$02            ; 2
    BCC    LF33F           ; 2
    LDA    $DE,X           ; 4
    BNE    LF33F           ; 2
    LDA    $DD,X           ; 4
    BEQ    LF33F           ; 2
    BPL    LF34D           ; 2
LF33F:
    CPX    #$06            ; 2
    BCS    LF34F           ; 2
    LDA    $E0,X           ; 4
    BNE    LF34F           ; 2
    LDA    $E1,X           ; 4
    BMI    LF34F           ; 2
    BEQ    LF34F           ; 2
LF34D:
    LDY    #$12            ; 2
LF34F:
    LDA    $C4             ; 3
    LSR                    ; 2
    BCC    LF3AE           ; 2
    LDA    LF41C,X         ; 4
    STA    $DE             ; 3
    LDA    LF423,X         ; 4
    STA    $E8             ; 3
    LDA    #$00            ; 2
    STA    $DD             ; 3
    STA    $E7             ; 3
    LDX    #$07            ; 2
LF366:
    LDA    $DF,X           ; 4
    BPL    LF37A           ; 2
    LDA    LF41C,X         ; 4
    ORA    $DD             ; 3
    STA    $DD             ; 3
    LDA    LF423,X         ; 4
    ORA    $E7             ; 3
    STA    $E7             ; 3
    BNE    LF38A           ; 2
LF37A:
    BEQ    LF38A           ; 2
    LDA    LF41C,X         ; 4
    ORA    $DE             ; 3
    STA    $DE             ; 3
    LDA    LF423,X         ; 4
    ORA    $E8             ; 3
    STA    $E8             ; 3
LF38A:
    DEX                    ; 2
    BPL    LF366           ; 2
    LDX    #$21            ; 2
LF38F:
    LDA    LF3B6,X         ; 4
    CMP    $DD             ; 3
    BNE    LF39D           ; 2
    LDA    LF3D8,X         ; 4
    CMP    $DE             ; 3
    BEQ    LF3B2           ; 2
LF39D:
    LDA    LF3B6,X         ; 4
    CMP    $E7             ; 3
    BNE    LF3AB           ; 2
    LDA    LF3D8,X         ; 4
    CMP    $E8             ; 3
    BEQ    LF3B2           ; 2
LF3AB:
    DEX                    ; 2
    BPL    LF38F           ; 2
LF3AE:
    LDA    LF7EC,Y         ; 4
    RTS                    ; 6

LF3B2:
    LDA    LF3FA,X         ; 4
    RTS                    ; 6

LF3B6:
    .byte $60 ; | XX     | $F3B6
    .byte $40 ; | X      | $F3B7
    .byte $42 ; | X    X | $F3B8
    .byte $40 ; | X      | $F3B9
    .byte $00 ; |        | $F3BA
    .byte $00 ; |        | $F3BB
    .byte $00 ; |        | $F3BC
    .byte $46 ; | X   XX | $F3BD
    .byte $46 ; | X   XX | $F3BE
    .byte $44 ; | X   X  | $F3BF
    .byte $04 ; |     X  | $F3C0
    .byte $08 ; |    X   | $F3C1
    .byte $0C ; |    XX  | $F3C2
    .byte $0A ; |    X X | $F3C3
    .byte $08 ; |    X   | $F3C4
    .byte $04 ; |     X  | $F3C5
    .byte $10 ; |   X    | $F3C6
    .byte $14 ; |   X X  | $F3C7
    .byte $BE ; |X XXXXX | $F3C8
    .byte $9E ; |X  XXXX | $F3C9
    .byte $02 ; |      X | $F3CA
    .byte $02 ; |      X | $F3CB
    .byte $02 ; |      X | $F3CC
    .byte $12 ; |   X  X | $F3CD
    .byte $48 ; | X  X   | $F3CE
    .byte $28 ; |  X X   | $F3CF
    .byte $10 ; |   X    | $F3D0
    .byte $08 ; |    X   | $F3D1
    .byte $18 ; |   XX   | $F3D2
    .byte $38 ; |  XXX   | $F3D3
    .byte $40 ; | X      | $F3D4
    .byte $00 ; |        | $F3D5
    .byte $02 ; |      X | $F3D6
    .byte $02 ; |      X | $F3D7
LF3D8:
    .byte $14 ; |   X X  | $F3D8
    .byte $28 ; |  X X   | $F3D9
    .byte $28 ; |  X X   | $F3DA
    .byte $2C ; |  X XX  | $F3DB
    .byte $46 ; | X   XX | $F3DC
    .byte $44 ; | X   X  | $F3DD
    .byte $40 ; | X      | $F3DE
    .byte $20 ; |  X     | $F3DF
    .byte $08 ; |    X   | $F3E0
    .byte $20 ; |  X     | $F3E1
    .byte $60 ; | XX     | $F3E2
    .byte $40 ; | X      | $F3E3
    .byte $40 ; | X      | $F3E4
    .byte $40 ; | X      | $F3E5
    .byte $42 ; | X    X | $F3E6
    .byte $40 ; | X      | $F3E7
    .byte $40 ; | X      | $F3E8
    .byte $40 ; | X      | $F3E9
    .byte $40 ; | X      | $F3EA
    .byte $60 ; | XX     | $F3EB
    .byte $20 ; |  X     | $F3EC
    .byte $28 ; |  X X   | $F3ED
    .byte $2C ; |  X XX  | $F3EE
    .byte $24 ; |  X  X  | $F3EF
    .byte $32 ; |  XX  X | $F3F0
    .byte $12 ; |   X  X | $F3F1
    .byte $4C ; | X  XX  | $F3F2
    .byte $F2 ; |XXXX  X | $F3F3
    .byte $E2 ; |XXX   X | $F3F4
    .byte $C2 ; |XX    X | $F3F5
    .byte $02 ; |      X | $F3F6
    .byte $BE ; |X XXXXX | $F3F7
    .byte $18 ; |   XX   | $F3F8
    .byte $48 ; | X  X   | $F3F9
LF3FA:
    .byte $30 ; |  XX    | $F3FA
    .byte $30 ; |  XX    | $F3FB
    .byte $30 ; |  XX    | $F3FC
    .byte $30 ; |  XX    | $F3FD
    .byte $C0 ; |XX      | $F3FE
    .byte $C0 ; |XX      | $F3FF
    .byte $C0 ; |XX      | $F400
    .byte $30 ; |  XX    | $F401
    .byte $30 ; |  XX    | $F402
    .byte $30 ; |  XX    | $F403
    .byte $BB ; |X XXX XX| $F404
    .byte $BB ; |X XXX XX| $F405
    .byte $BB ; |X XXX XX| $F406
    .byte $BB ; |X XXX XX| $F407
    .byte $BB ; |X XXX XX| $F408
    .byte $BB ; |X XXX XX| $F409
    .byte $BB ; |X XXX XX| $F40A
    .byte $BB ; |X XXX XX| $F40B
    .byte $60 ; | XX     | $F40C
    .byte $60 ; | XX     | $F40D
    .byte $40 ; | X      | $F40E
    .byte $30 ; |  XX    | $F40F
    .byte $30 ; |  XX    | $F410
    .byte $50 ; | X X    | $F411
    .byte $E0 ; |XXX     | $F412
    .byte $BB ; |X XXX XX| $F413
    .byte $BB ; |X XXX XX| $F414
    .byte $D0 ; |XX X    | $F415
    .byte $D0 ; |XX X    | $F416
    .byte $D0 ; |XX X    | $F417
    .byte $D0 ; |XX X    | $F418
    .byte $D8 ; |XX XX   | $F419
    .byte $F0 ; |XXXX    | $F41A
    .byte $F0 ; |XXXX    | $F41B
LF41C:
    .byte $01 ; |       X| $F41C
    .byte $02 ; |      X | $F41D
    .byte $04 ; |     X  | $F41E
    .byte $08 ; |    X   | $F41F
    .byte $10 ; |   X    | $F420
    .byte $20 ; |  X     | $F421
    .byte $40 ; | X      | $F422
LF423:
    .byte $80 ; |X       | $F423
    .byte $40 ; | X      | $F424
    .byte $20 ; |  X     | $F425
    .byte $10 ; |   X    | $F426
    .byte $08 ; |    X   | $F427
    .byte $04 ; |     X  | $F428
    .byte $02 ; |      X | $F429
    .byte $01 ; |       X| $F42A
LF42B:
    BIT    $DA             ; 3
    BVC    LF475           ; 2
    LDA    $C2             ; 3
    AND    #$0F            ; 2
    BNE    LF441           ; 2
    LDA    SWCHA           ; 4
    JSR    LF647           ; 6
    LDA    SWCHA           ; 4
    JSR    LF64B           ; 6
LF441:
    LDA    $C2             ; 3
    AND    #$03            ; 2
    BNE    LF475           ; 2
    LDX    $CF             ; 3
    LDA    INPT4           ; 3
    AND    INPT5           ; 3
    TAY                    ; 2
    EOR    $D1             ; 3
    AND    $D1             ; 3
    STY    $D1             ; 3
    BPL    LF475           ; 2
    LDA    $80,X           ; 4
    BMI    LF461           ; 2
    DEC    $80,X           ; 6
    BMI    LF471           ; 2
    TAX                    ; 2
    BNE    LF46C           ; 2
LF461:
    LDA    #$01            ; 2
    STA    $80,X           ; 4
    TAX                    ; 2
    LSR                    ; 2
    JSR    LF750           ; 6
    LDX    #$FF            ; 2
LF46C:
    LDA    #$98            ; 2
LF46E:
    JMP    LF750           ; 3
LF471:
    LDX    #$FF            ; 2
    BNE    LF46E           ; 2
LF475:
    RTS                    ; 6

LF476:
    LDA    $C0             ; 3
    BEQ    LF4CA           ; 2
    LDA    $D3             ; 3
    BPL    LF4D4           ; 2
    LDX    $C5             ; 3
    BMI    LF4D4           ; 2
    LDA    $CE             ; 3
    BEQ    LF4C2           ; 2
    LDA    $D0             ; 3
    BEQ    LF4C2           ; 2
    SED                    ; 2
    CLC                    ; 2
    ADC    $CE             ; 3
    CLD                    ; 2
    STA    $CD             ; 3
    EOR    #$64            ; 2
    BEQ    LF4C2           ; 2
    LDA    $80,X           ; 4
    BNE    LF4A9           ; 2
    LDA    $CF             ; 3
    PHA                    ; 3
    STX    $CF             ; 3
    JSR    LF5D0           ; 6
    LDX    $C5             ; 3
    PLA                    ; 4
    STA    $CF             ; 3
    TYA                    ; 2
    BPL    LF4B9           ; 2
LF4A9:
    DEX                    ; 2
    BPL    LF4BD           ; 2
    CPX    $C6             ; 3
    BNE    LF4C2           ; 2
    JSR    LF5C5           ; 6
    LDA    #$80            ; 2
    STA    $C6             ; 3
    BMI    LF4D4           ; 2
LF4B9:
    LDX    #$FF            ; 2
    STX    $C6             ; 3
LF4BD:
    STX    $C5             ; 3
    JMP    LF4D4           ; 3
LF4C2:
    LDA    #$00            ; 2
    STA    $C0             ; 3
    LDA    #$40            ; 2
    STA    $CF             ; 3
LF4CA:
    LDA    $C2             ; 3
    BNE    LF4D4           ; 2
    LDA    $D9             ; 3
    AND    #$F7            ; 2
    STA    $C1             ; 3
LF4D4:
    LDX    #$FF            ; 2
    LDA    SWCHB           ; 4
    STA    $DA             ; 3
    AND    #$08            ; 2
    BNE    LF4E1           ; 2
    LDX    #$0F            ; 2
LF4E1:
    STX    $DB             ; 3
    LDA    #$BA            ; 2
    LDX    $C0             ; 3
    BEQ    LF4EB           ; 2
    LDA    #$BE            ; 2
LF4EB:
    EOR    $C1             ; 3
    AND    $DB             ; 3
    STA    $D5             ; 3
    LDA    #$D4            ; 2
    EOR    $C1             ; 3
    AND    $DB             ; 3
    STA    COLUBK          ; 3
    STA    $D6             ; 3
    LDA    $C1             ; 3
    AND    $DB             ; 3
    STA    $D7             ; 3
    STA    COLUPF          ; 3
    RTS                    ; 6

LF504:
    STX    $DD             ; 3
    STA    $DE             ; 3
    AND    #$0F            ; 2
    STA    $DB             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ADC    $DB             ; 3
    ADC    #$B8            ; 2
    STA    $DB             ; 3
    LDA    #$F7            ; 2
    STA    $DC             ; 3
    LDY    #$04            ; 2
LF51A:
    LDA    ($DB),Y         ; 5
    AND    #$0F            ; 2
    STA    VSYNC,X         ; 4
    INX                    ; 2
    DEY                    ; 2
    BPL    LF51A           ; 2
    LDA    $DE             ; 3
    AND    #$F0            ; 2
    BEQ    LF546           ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $DB             ; 3
    LSR                    ; 2
    LSR                    ; 2
    ADC    $DB             ; 3
    ADC    #$B8            ; 2
    STA    $DB             ; 3
    LDX    $DD             ; 3
    LDY    #$04            ; 2
LF53A:
    LDA    ($DB),Y         ; 5
    AND    #$F0            ; 2
    ORA    VSYNC,X         ; 4
    STA    VSYNC,X         ; 4
    INX                    ; 2
    DEY                    ; 2
    BPL    LF53A           ; 2
LF546:
    RTS                    ; 6

LF547:
    LDA    $CB             ; 3
    LDY    $CD             ; 3
    CPY    #$14            ; 2
    BCC    LF557           ; 2
    CPY    #$42            ; 2
    BCS    LF557           ; 2
    EOR    #$FF            ; 2
    STA    $CB             ; 3
LF557:
    LDA    #$F2            ; 2
    PHA                    ; 3
    LDA    LF1E4,X         ; 4
    PHA                    ; 3
    RTS                    ; 6

LF55F:
    LDX    $DD             ; 3
    DEX                    ; 2
    BMI    LF578           ; 2
    LDA    $DF,X           ; 4
    BEQ    LF573           ; 2
    BMI    LF57E           ; 2
LF56A:
    DEX                    ; 2
    BMI    LF578           ; 2
    LDA    $DF,X           ; 4
    BMI    LF590           ; 2
    BNE    LF56A           ; 2
LF573:
    LDA    #$01            ; 2
    STX    $E7             ; 3
    RTS                    ; 6

LF578:
    LDA    #$00            ; 2
    RTS                    ; 6

LF57B:
    LDA    #$02            ; 2
    RTS                    ; 6

LF57E:
    DEX                    ; 2
    BMI    LF590           ; 2
    LDA    $DF,X           ; 4
    BEQ    LF590           ; 2
    BMI    LF57E           ; 2
LF587:
    DEX                    ; 2
    BMI    LF578           ; 2
    LDA    $DF,X           ; 4
    BEQ    LF57B           ; 2
    BPL    LF587           ; 2
LF590:
    LDA    #$03            ; 2
    RTS                    ; 6

LF593:
    LDA    $C2             ; 3
    AND    #$1F            ; 2
    BNE    LF5CF           ; 2
    STA    AUDV1           ; 3
    LDY    $D3             ; 3
    BMI    LF5CF           ; 2
    JSR    LF74E           ; 6
    TXA                    ; 2
    LDX    $D2             ; 3
    STA    $80,X           ; 4
    EOR    #$FE            ; 2
    TAX                    ; 2
    LDA    #$98            ; 2
    JSR    LF750           ; 6
    LDA    $D2             ; 3
    LDY    $D3             ; 3
    SBC    LF7B0,Y         ; 4
    CMP    $CF             ; 3
    BNE    LF5C2           ; 2
    JSR    LF5D2           ; 6
    STY    $D3             ; 3
    BMI    LF5C5           ; 2
    TXA                    ; 2
LF5C2:
    STA    $D2             ; 3
    RTS                    ; 6

LF5C5:
    LDA    $C0             ; 3
    EOR    #$FE            ; 2
    STA    $C0             ; 3
    LDA    #$3F            ; 2
    STA    $C5             ; 3
LF5CF:
    RTS                    ; 6

LF5D0:
    LDY    #$07            ; 2
LF5D2:
    LDX    $CF             ; 3
    TXA                    ; 2
    AND    #$07            ; 2
    STA    $DE             ; 3
LF5D9:
    LDA    $CB             ; 3
    STA    $DD             ; 3
    LDA    $CC             ; 3
    STA    $E7             ; 3
LF5E1:
    TXA                    ; 2
    CLC                    ; 2
    ADC    LF7B0,Y         ; 4
    CMP    #$40            ; 2
    BCS    LF5FF           ; 2
    TAX                    ; 2
    AND    #$07            ; 2
    CPY    #$03            ; 2
    BCC    LF605           ; 2
    CMP    $DE             ; 3
    BCC    LF5FF           ; 2
    BNE    LF609           ; 2
    CPY    #$05            ; 2
    BEQ    LF5FF           ; 2
    CPY    #$06            ; 2
    BNE    LF609           ; 2
LF5FF:
    LDX    $CF             ; 3
    DEY                    ; 2
    BPL    LF5D9           ; 2
    RTS                    ; 6

LF605:
    CMP    $DE             ; 3
    BCS    LF5FF           ; 2
LF609:
    LDA    $80,X           ; 4
    BEQ    LF5FF           ; 2
    BPL    LF623           ; 2
    INC    $DD             ; 5
    CPX    #$09            ; 2
    BEQ    LF621           ; 2
    CPX    #$0E            ; 2
    BEQ    LF621           ; 2
    CPX    #$31            ; 2
    BEQ    LF621           ; 2
    CPX    #$36            ; 2
    BNE    LF623           ; 2
LF621:
    STX    $E7             ; 3
LF623:
    EOR    $C0             ; 3
    BNE    LF5E1           ; 2
    TXA                    ; 2
    SEC                    ; 2
    SBC    LF7B0,Y         ; 4
    CMP    $CF             ; 3
    BEQ    LF5FF           ; 2
    LDX    $E7             ; 3
    STX    $CC             ; 3
    LDX    $DD             ; 3
    STX    $CB             ; 3
    TAX                    ; 2
    RTS                    ; 6

LF63A:
    LDA    $C2             ; 3
    AND    #$0F            ; 2
    BNE    LF663           ; 2
    LDA    SWCHA           ; 4
    LDX    $C0             ; 3
    BPL    LF64B           ; 2
LF647:
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF64B:
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    $CF             ; 3
    AND    #$38            ; 2
    CLC                    ; 2
    ADC    $CF             ; 3
    ADC    LF664,X         ; 4
    AND    #$77            ; 2
    STA    $CF             ; 3
    AND    #$07            ; 2
    ADC    $CF             ; 3
    LSR                    ; 2
    STA    $CF             ; 3
LF663:
    RTS                    ; 6

LF664:
    .byte $00 ; |        | $F664
    .byte $70 ; | XXX    | $F665
    .byte $10 ; |   X    | $F666
    .byte $00 ; |        | $F667
    .byte $07 ; |     XXX| $F668
    .byte $77 ; | XXX XXX| $F669
    .byte $17 ; |   X XXX| $F66A
    .byte $07 ; |     XXX| $F66B
    .byte $01 ; |       X| $F66C
    .byte $71 ; | XXX   X| $F66D
    .byte $11 ; |   X   X| $F66E
    .byte $01 ; |       X| $F66F
    .byte $00 ; |        | $F670
    .byte $70 ; | XXX    | $F671
    .byte $10 ; |   X    | $F672
    .byte $00 ; |        | $F673
LF674:
    LDX    $C0             ; 3
    DEX                    ; 2
    BMI    LF68C           ; 2
    LDA    $D3             ; 3
    BPL    LF68C           ; 2
    LDA    $C4             ; 3
    CMP    #$04            ; 2
    BCS    LF68C           ; 2
    LDX    #$FF            ; 2
    BIT    SWCHB           ; 4
    BVC    LF68D           ; 2
    STX    $C6             ; 3
LF68C:
    RTS                    ; 6

LF68D:
    TXA                    ; 2
    STA    $C5             ; 3
    LDX    $C6             ; 3
    BPL    LF69E           ; 2
    LDA    #$81            ; 2
    STA    $C7             ; 3
    STA    $C8             ; 3
    LDX    #$3F            ; 2
    STX    $C6             ; 3
LF69E:
    LDA    $80,X           ; 4
    BNE    LF6FA           ; 2
    STA    $CB             ; 3
    STA    $CC             ; 3
    LDA    $CF             ; 3
    PHA                    ; 3
    STX    $CF             ; 3
    JSR    LF5D0           ; 6
    BMI    LF6F7           ; 2
    STX    $DB             ; 3
    STY    $DC             ; 3
LF6B4:
    DEY                    ; 2
    BMI    LF6BC           ; 2
    JSR    LF5D2           ; 6
    BPL    LF6B4           ; 2
LF6BC:
    LDX    $C6             ; 3
    JSR    LF547           ; 6
    LDX    $CC             ; 3
    BEQ    LF6D1           ; 2
    STA    $E7             ; 3
    JSR    LF557           ; 6
    CLC                    ; 2
    ADC    $E7             ; 3
    BVC    LF6D1           ; 2
    LDA    #$98            ; 2
LF6D1:
    CLC                    ; 2
    ADC    $CB             ; 3
    TAY                    ; 2
    SEC                    ; 2
    SBC    $C7             ; 3
    BVC    LF6DE           ; 2
    EOR    #$80            ; 2
    ORA    #$01            ; 2
LF6DE:
    BMI    LF6F7           ; 2
    BNE    LF6E9           ; 2
    JSR    LF741           ; 6
    AND    #$03            ; 2
    BNE    LF6F7           ; 2
LF6E9:
    LDA    $DB             ; 3
    STA    $C9             ; 3
    LDA    $DC             ; 3
    STA    $CA             ; 3
    STY    $C7             ; 3
    LDX    $C6             ; 3
    STX    $C8             ; 3
LF6F7:
    PLA                    ; 4
    STA    $CF             ; 3
LF6FA:
    DEC    $C6             ; 5
    BPL    LF68C           ; 2
    LDA    $C8             ; 3
    BPL    LF707           ; 2
    STA    $C6             ; 3
    JMP    LF5C5           ; 3
LF707:
    STA    $CF             ; 3
    LDX    $C9             ; 3
    LDY    $CA             ; 3
    JMP    LF726           ; 3
LF710:
    LDA    INPT4           ; 3
    LDX    $C0             ; 3
    BMI    LF718           ; 2
    LDA    INPT5           ; 3
LF718:
    ASL                    ; 2
    BCS    LF73A           ; 2
    LDX    $CF             ; 3
    LDA    $80,X           ; 4
    BNE    LF73B           ; 2
    JSR    LF5D0           ; 6
    BMI    LF73B           ; 2
LF726:
    STX    $D2             ; 3
    STY    $D3             ; 3
    LDA    #$00            ; 2
    JSR    LF74E           ; 6
    TXA                    ; 2
    LDX    $CF             ; 3
    STA    $80,X           ; 4
LF734:
    LDA    #$01            ; 2
    STA    $C2             ; 3
    STA    $C3             ; 3
LF73A:
    RTS                    ; 6

LF73B:
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    BNE    LF734           ; 2
LF741:
    LDA    $D8             ; 3
    EOR    $D9             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ROL    $D9             ; 5
    ROL    $D8             ; 5
    LDA    $D9             ; 3
    RTS                    ; 6

LF74E:
    LDX    $C0             ; 3
LF750:
    SED                    ; 2
    SEC                    ; 2
    ADC    $CF,X           ; 4
    STA    $CF,X           ; 4
    CLD                    ; 2
    LDA    #$FF            ; 2
    STA    AUDV0           ; 3
    RTS                    ; 6

LF75C:
    LDA    $DA             ; 3
    LSR                    ; 2
    BCS    LF772           ; 2
    JSR    LF793           ; 6
    STA    $CF             ; 3
    TYA                    ; 2
    LDY    $DA             ; 3
    BMI    LF76C           ; 2
    TXA                    ; 2
LF76C:
    STA    $C0             ; 3
    STX    $C5             ; 3
    STX    $C6             ; 3
LF772:
    LDA    $DA             ; 3
    AND    #$02            ; 2
    BNE    LF77C           ; 2
    LDA    $D4             ; 3
    BEQ    LF781           ; 2
LF77C:
    TAX                    ; 2
    DEX                    ; 2
    STX    $D4             ; 3
    RTS                    ; 6

LF781:
    LDA    #$20            ; 2
    STA    $D4             ; 3
    LDX    $C4             ; 3
    INX                    ; 2
    CPX    #$05            ; 2
    BCC    LF78E           ; 2
    LDX    #$01            ; 2
LF78E:
    STX    $C4             ; 3
    ASL                    ; 2
    STA    $CF             ; 3
LF793:
    LDY    #$02            ; 2
    STY    $CE             ; 3
    STY    $D0             ; 3
    LDA    #$00            ; 2
    LDX    #$41            ; 2
LF79D:
    STA    $80,X           ; 4
    DEX                    ; 2
    BPL    LF79D           ; 2
    DEY                    ; 2
    STY    $C3             ; 3
    STX    $D3             ; 3
    STY    $A4             ; 3
    STY    $9B             ; 3
    STX    $A3             ; 3
    STX    $9C             ; 3
    RTS                    ; 6

LF7B0:
    .byte $F7 ; |XXXX XXX| $F7B0
    .byte $FF ; |XXXXXXXX| $F7B1
    .byte $07 ; |     XXX| $F7B2
    .byte $08 ; |    X   | $F7B3
    .byte $09 ; |    X  X| $F7B4
    .byte $01 ; |       X| $F7B5
    .byte $F9 ; |XXXXX  X| $F7B6
    .byte $F8 ; |XXXXX   | $F7B7
    .byte $EE ; |XXX XXX | $F7B8
    .byte $AA ; |X X X X | $F7B9
    .byte $AA ; |X X X X | $F7BA
    .byte $AA ; |X X X X | $F7BB
    .byte $EE ; |XXX XXX | $F7BC
    .byte $44 ; | X   X  | $F7BD
    .byte $CC ; |XX  XX  | $F7BE
    .byte $44 ; | X   X  | $F7BF
    .byte $44 ; | X   X  | $F7C0
    .byte $EE ; |XXX XXX | $F7C1
    .byte $EE ; |XXX XXX | $F7C2
    .byte $22 ; |  X   X | $F7C3
    .byte $EE ; |XXX XXX | $F7C4
    .byte $88 ; |X   X   | $F7C5
    .byte $EE ; |XXX XXX | $F7C6
    .byte $EE ; |XXX XXX | $F7C7
    .byte $22 ; |  X   X | $F7C8
    .byte $66 ; | XX  XX | $F7C9
    .byte $22 ; |  X   X | $F7CA
    .byte $EE ; |XXX XXX | $F7CB
    .byte $AA ; |X X X X | $F7CC
    .byte $AA ; |X X X X | $F7CD
    .byte $EE ; |XXX XXX | $F7CE
    .byte $22 ; |  X   X | $F7CF
    .byte $22 ; |  X   X | $F7D0
    .byte $EE ; |XXX XXX | $F7D1
    .byte $88 ; |X   X   | $F7D2
    .byte $EE ; |XXX XXX | $F7D3
    .byte $22 ; |  X   X | $F7D4
    .byte $EE ; |XXX XXX | $F7D5
    .byte $EE ; |XXX XXX | $F7D6
    .byte $88 ; |X   X   | $F7D7
    .byte $EE ; |XXX XXX | $F7D8
    .byte $AA ; |X X X X | $F7D9
    .byte $EE ; |XXX XXX | $F7DA
    .byte $EE ; |XXX XXX | $F7DB
    .byte $22 ; |  X   X | $F7DC
    .byte $22 ; |  X   X | $F7DD
    .byte $22 ; |  X   X | $F7DE
    .byte $22 ; |  X   X | $F7DF
    .byte $EE ; |XXX XXX | $F7E0
    .byte $AA ; |X X X X | $F7E1
    .byte $EE ; |XXX XXX | $F7E2
    .byte $AA ; |X X X X | $F7E3
    .byte $EE ; |XXX XXX | $F7E4
    .byte $EE ; |XXX XXX | $F7E5
    .byte $AA ; |X X X X | $F7E6
    .byte $EE ; |XXX XXX | $F7E7
    .byte $22 ; |  X   X | $F7E8
    .byte $EE ; |XXX XXX | $F7E9
    .byte $00 ; |        | $F7EA
    .byte $00 ; |        | $F7EB
LF7EC:
    .byte $20 ; |  X     | $F7EC
    .byte $20 ; |  X     | $F7ED
    .byte $20 ; |  X     | $F7EE
    .byte $20 ; |  X     | $F7EF
    .byte $20 ; |  X     | $F7F0
    .byte $10 ; |   X    | $F7F1
    .byte $40 ; | X      | $F7F2
    .byte $E0 ; |XXX     | $F7F3
    .byte $20 ; |  X     | $F7F4
    .byte $40 ; | X      | $F7F5
    .byte $15 ; |   X X X| $F7F6
    .byte $E0 ; |XXX     | $F7F7
    .byte $20 ; |  X     | $F7F8
    .byte $E0 ; |XXX     | $F7F9
    .byte $E0 ; |XXX     | $F7FA
    .byte $50 ; | X X    | $F7FB
     
    ORG $F7FC
    
    .byte $00 ; |        | $F7FC
    .byte $F0 ; |XXXX    | $F7FD
    .byte $B0 ; |X XX    | $F7FE
    .byte $00 ; |        | $F7FF
