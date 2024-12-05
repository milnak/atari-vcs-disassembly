; Disassembly of Quadrun
; Disassembled Tue Dec 16 00:51:37 2008
; Using DiStella v3.0
;
;
;
; Command Line: newdistella -pasfcquad1.cfg quad1.bin 
;
; quad1.cfg contents:
;
;      ORG B000
;      CODE B000 B3FA
;      GFX B3FB B616
;      CODE B617 B674
;      GFX B675 B7D0
;      CODE B7D1 B877
;      GFX B878 B87B
;      CODE B87C B8AE
;      GFX B8AF BA9B
;      CODE BA9C BAD3
;      GFX BAD4 BFE9
;      CODE BFEA BFF7
;      GFX BFF8 BFFF
;
;
; Command Line: newdistella -pasfcquad2.cfg quad2.bin
;
; quad2.cfg contents:
;
;      ORG F000
;      CODE F000 FA82
;      GFX FA83 FBD8
;      CODE FBD9 FC5C
;      GFX FC5D FC9E
;      CODE FC9F FFD9
;      GFX FFDA FFE9
;      CODE FFEA FFF7
;      GFX FFF8 FFFF


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
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


       ORG $B000
       
    LDA    #0              ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFF2           ; 3
    LDA    #0              ; 2
    STA    VBLANK          ; 3
    STA    $87             ; 3
    LDY    #0              ; 2
    LDA    $8B             ; 3
    AND    #$01            ; 2
    CMP    #1              ; 2
    BNE    LB01D           ; 2³
    INC    $B2             ; 5
LB01D:
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    INY                    ; 2
    CPY    #2              ; 2
    BNE    LB01D           ; 2³
    STA    WSYNC           ; 3
    LDX    $B1             ; 3
    LDA    #$0D            ; 2
    STA    COLUPF          ; 3
    LDA    LBEAB,X         ; 4
    STA    PF2             ; 3
    INY                    ; 2
    LDX    #0              ; 2
LB03A:
    STA    WSYNC           ; 3
    LDA    LBECB,X         ; 4
    STA    COLUPF          ; 3
    LDA    LBEBB,X         ; 4
    STA    PF2             ; 3
    INX                    ; 2
    INY                    ; 2
    CPY    #$0B            ; 2
    BNE    LB03A           ; 2³
    LDA    #0              ; 2
    STA    $9A             ; 3
LB050:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB05F           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB05F           ; 2³
    INC    $88             ; 5
LB05F:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    LDX    $9A             ; 3
    LDA    LBEC3,X         ; 4
    STA    COLUPF          ; 3
    LDA    LBEB3,X         ; 4
    STA    PF1             ; 3
    INC    $9A             ; 5
    INY                    ; 2
    CPY    #$13            ; 2
    BNE    LB050           ; 2³
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    STA    $A3             ; 3
    INY                    ; 2
LB087:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB096           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB096           ; 2³
    INC    $88             ; 5
LB096:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    INC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB0BC           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB0BC           ; 2³
    INC    $88             ; 5
LB0BC:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    INC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB0CF           ; 2³
    INX                    ; 2
LB0CF:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$28            ; 2
    BNE    LB087           ; 2³
LB0D6:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB0E5           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB0E5           ; 2³
    INC    $88             ; 5
LB0E5:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    BCC    LB106           ; 2³+1
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB106           ; 2³
    INC    $87             ; 5
LB106:
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB116           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB116           ; 2³
    INC    $88             ; 5
LB116:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    BCC    LB12D           ; 2³
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB12D           ; 2³
    INC    $87             ; 5
LB12D:
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB134           ; 2³
    INX                    ; 2
LB134:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$30            ; 2
    BNE    LB0D6           ; 2³+1
LB13B:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB14A           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB14A           ; 2³
    INC    $88             ; 5
LB14A:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    INC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB170           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB170           ; 2³
    INC    $88             ; 5
LB170:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    INC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB183           ; 2³
    INX                    ; 2
LB183:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$3E            ; 2
    BNE    LB13B           ; 2³
LB18A:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB199           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB199           ; 2³
    INC    $88             ; 5
LB199:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    BCC    LB1BA           ; 2³
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB1BA           ; 2³
    INC    $87             ; 5
LB1BA:
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB1CA           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB1CA           ; 2³
    INC    $88             ; 5
LB1CA:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    BCC    LB1E1           ; 2³
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB1E1           ; 2³
    INC    $87             ; 5
LB1E1:
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB1E8           ; 2³
    INX                    ; 2
LB1E8:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$76            ; 2
    BNE    LB18A           ; 2³
LB1EF:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB1FE           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB1FE           ; 2³
    INC    $88             ; 5
LB1FE:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    DEC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB224           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB224           ; 2³
    INC    $88             ; 5
LB224:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    DEC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB237           ; 2³
    INX                    ; 2
LB237:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$86            ; 2
    BNE    LB1EF           ; 2³+1
LB23E:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB24D           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB24D           ; 2³
    INC    $88             ; 5
LB24D:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    BCC    LB26E           ; 2³
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB26E           ; 2³
    INC    $87             ; 5
LB26E:
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB27E           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB27E           ; 2³
    INC    $88             ; 5
LB27E:
    CPY    $91             ; 3
    LDX    $87             ; 3
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    BCC    LB295           ; 2³
    LDA    LBDC0,X         ; 4
    STA    COLUP0          ; 3
    STA    GRP0            ; 3
    BEQ    LB295           ; 2³
    INC    $87             ; 5
LB295:
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB29C           ; 2³
    INX                    ; 2
LB29C:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$8E            ; 2
    BNE    LB23E           ; 2³
LB2A3:
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB2B2           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB2B2           ; 2³
    INC    $88             ; 5
LB2B2:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    DEC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDA    LBC00,Y         ; 4
    STA    PF1             ; 3
    LDA    LBD00,Y         ; 4
    STA    PF2             ; 3
    INY                    ; 2
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB2D8           ; 2³
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB2D8           ; 2³
    INC    $88             ; 5
LB2D8:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    DEC    $B2             ; 5
    LDA    $B2             ; 3
    STA    COLUPF          ; 3
    LDX    #1              ; 2
    CPY    $85             ; 3
    BNE    LB2EB           ; 2³
    INX                    ; 2
LB2EB:
    STX    ENABL           ; 3
    INY                    ; 2
    CPY    #$A0            ; 2
    BNE    LB2A3           ; 2³
    LDA    #0              ; 2
    CPY    $93             ; 3
    BCC    LB301           ; 2³+1
    LDX    $88             ; 3
    LDA    LBDC6,X         ; 4
    BEQ    LB301           ; 2³+1
    INC    $88             ; 5
LB301:
    STA    WSYNC           ; 3
    STA    COLUP1          ; 3
    STA    GRP1            ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    INY                    ; 2
    LDX    #7              ; 2
LB310:
    STA    WSYNC           ; 3
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    LDA    LBEC3,X         ; 4
    STA    COLUPF          ; 3
    LDA    LBEB3,X         ; 4
    STA    PF1             ; 3
    DEX                    ; 2
    INY                    ; 2
    CPY    #$A9            ; 2
    BNE    LB310           ; 2³
    LDA    #0              ; 2
    STA    GRP1            ; 3
    LDX    #7              ; 2
LB32C:
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    LDA    LBECB,X         ; 4
    STA    COLUPF          ; 3
    LDA    LBEBB,X         ; 4
    STA    PF2             ; 3
    DEX                    ; 2
    INY                    ; 2
    CPY    #$B1            ; 2
    BNE    LB32C           ; 2³
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    INY                    ; 2
    STY    $A5             ; 3
    LDY    #5              ; 2
    LDA    #$90            ; 2
    STA    WSYNC           ; 3
LB353:
    DEY                    ; 2
    BPL    LB353           ; 2³
    STA    RESP1           ; 3
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
    LDY    $A5             ; 3
    INY                    ; 2
    INY                    ; 2
LB360:
    STA    WSYNC           ; 3
    LDA    #$28            ; 2
    STA    COLUP1          ; 3
    LDX    $A4             ; 3
    LDA    LBEA6,X         ; 4
    STA    GRP1            ; 3
    INY                    ; 2
    CPY    #$B5            ; 2
    BNE    LB360           ; 2³
    STA    WSYNC           ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP1            ; 3
    LDA    #$28            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    JSR    LB806           ; 6
    LDY    #6              ; 2
    JSR    LB7D1           ; 6
    LDA    #0              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$82            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    LDA    #0              ; 2
    STA    VBLANK          ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    $DD             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #0              ; 2
LB3B5:
    STA    WSYNC           ; 3
    INY                    ; 2
    CPY    #$5C            ; 2
    BNE    LB3B5           ; 2³
    STY    $A5             ; 3
    JSR    LB806           ; 6
    LDY    #$0E            ; 2
    JSR    LB7D1           ; 6
    LDA    #0              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    CLC                    ; 2
    LDA    $A5             ; 3
    ADC    #$11            ; 2
    STA    $A5             ; 3
    LDY    $A5             ; 3
LB3D9:
    STA    WSYNC           ; 3
    INY                    ; 2
    CPY    #$BF            ; 2
    BNE    LB3D9           ; 2³
    DEC    $BE             ; 5
    LDA    $BE             ; 3
    BNE    LB3EC           ; 2³
    LDA    #0              ; 2
    STA    $C1             ; 3
    STA    $DA             ; 3
LB3EC:
    LDA    #$28            ; 2
    STA    $DD             ; 3
    LDA    #$82            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    
    .byte $80 ; |X       | $B3FB
    .byte $40 ; | X      | $B3FC
    .byte $7F ; | XXXXXXX| $B3FD
    .byte $70 ; | XXX    | $B3FE
    .byte $7F ; | XXXXXXX| $B3FF
    .byte $40 ; | X      | $B400
    .byte $80 ; |X       | $B401
    .byte $00 ; |        | $B402
    .byte $03 ; |      XX| $B403
    .byte $04 ; |     X  | $B404
    .byte $08 ; |    X   | $B405
    .byte $09 ; |    X  X| $B406
    .byte $08 ; |    X   | $B407
    .byte $04 ; |     X  | $B408
    .byte $03 ; |      XX| $B409
    .byte $30 ; |  XX    | $B40A
    .byte $08 ; |    X   | $B40B
    .byte $FC ; |XXXXXX  | $B40C
    .byte $FE ; |XXXXXXX | $B40D
    .byte $FC ; |XXXXXX  | $B40E
    .byte $08 ; |    X   | $B40F
    .byte $30 ; |  XX    | $B410
    .byte $00 ; |        | $B411
    .byte $C3 ; |XX    XX| $B412
    .byte $24 ; |  X  X  | $B413
    .byte $24 ; |  X  X  | $B414
    .byte $E4 ; |XXX  X  | $B415
    .byte $04 ; |     X  | $B416
    .byte $04 ; |     X  | $B417
    .byte $E3 ; |XXX   XX| $B418
    .byte $7E ; | XXXXXX | $B419
    .byte $18 ; |   XX   | $B41A
    .byte $18 ; |   XX   | $B41B
    .byte $18 ; |   XX   | $B41C
    .byte $18 ; |   XX   | $B41D
    .byte $78 ; | XXXX   | $B41E
    .byte $38 ; |  XXX   | $B41F
    .byte $00 ; |        | $B420
    .byte $C3 ; |XX    XX| $B421
    .byte $24 ; |  X  X  | $B422
    .byte $24 ; |  X  X  | $B423
    .byte $24 ; |  X  X  | $B424
    .byte $24 ; |  X  X  | $B425
    .byte $24 ; |  X  X  | $B426
    .byte $C3 ; |XX    XX| $B427
    .byte $3C ; |  XXXX  | $B428
    .byte $66 ; | XX  XX | $B429
    .byte $66 ; | XX  XX | $B42A
    .byte $66 ; | XX  XX | $B42B
    .byte $66 ; | XX  XX | $B42C
    .byte $66 ; | XX  XX | $B42D
    .byte $3C ; |  XXXX  | $B42E
    .byte $00 ; |        | $B42F
    .byte $C4 ; |XX   X  | $B430
    .byte $24 ; |  X  X  | $B431
    .byte $24 ; |  X  X  | $B432
    .byte $24 ; |  X  X  | $B433
    .byte $25 ; |  X  X X| $B434
    .byte $26 ; |  X  XX | $B435
    .byte $C4 ; |XX   X  | $B436
    .byte $0C ; |    XX  | $B437
    .byte $10 ; |   X    | $B438
    .byte $3F ; |  XXXXXX| $B439
    .byte $7F ; | XXXXXXX| $B43A
    .byte $3F ; |  XXXXXX| $B43B
    .byte $10 ; |   X    | $B43C
    .byte $0C ; |    XX  | $B43D
    .byte $00 ; |        | $B43E
    .byte $13 ; |   X  XX| $B43F
    .byte $30 ; |  XX    | $B440
    .byte $50 ; | X X    | $B441
    .byte $91 ; |X  X   X| $B442
    .byte $12 ; |   X  X | $B443
    .byte $12 ; |   X  X | $B444
    .byte $11 ; |   X   X| $B445
    .byte $01 ; |       X| $B446
    .byte $02 ; |      X | $B447
    .byte $FE ; |XXXXXXX | $B448
    .byte $0E ; |    XXX | $B449
    .byte $FE ; |XXXXXXX | $B44A
    .byte $02 ; |      X | $B44B
    .byte $01 ; |       X| $B44C
    .byte $00 ; |        | $B44D
    .byte $E0 ; |XXX     | $B44E
    .byte $10 ; |   X    | $B44F
    .byte $10 ; |   X    | $B450
    .byte $E0 ; |XXX     | $B451
    .byte $00 ; |        | $B452
    .byte $00 ; |        | $B453
    .byte $F0 ; |XXXX    | $B454
    .byte $80 ; |X       | $B455
    .byte $40 ; | X      | $B456
    .byte $7F ; | XXXXXXX| $B457
    .byte $70 ; | XXX    | $B458
    .byte $7F ; | XXXXXXX| $B459
    .byte $40 ; | X      | $B45A
    .byte $80 ; |X       | $B45B
    .byte $00 ; |        | $B45C
    .byte $0F ; |    XXXX| $B45D
    .byte $00 ; |        | $B45E
    .byte $00 ; |        | $B45F
    .byte $07 ; |     XXX| $B460
    .byte $08 ; |    X   | $B461
    .byte $08 ; |    X   | $B462
    .byte $07 ; |     XXX| $B463
    .byte $30 ; |  XX    | $B464
    .byte $08 ; |    X   | $B465
    .byte $FC ; |XXXXXX  | $B466
    .byte $FE ; |XXXXXXX | $B467
    .byte $FC ; |XXXXXX  | $B468
    .byte $08 ; |    X   | $B469
    .byte $30 ; |  XX    | $B46A
    .byte $00 ; |        | $B46B
    .byte $88 ; |X   X   | $B46C
    .byte $48 ; | X  X   | $B46D
    .byte $48 ; | X  X   | $B46E
    .byte $89 ; |X   X  X| $B46F
    .byte $0A ; |    X X | $B470
    .byte $0C ; |    XX  | $B471
    .byte $C8 ; |XX  X   | $B472
    .byte $7C ; | XXXXX  | $B473
    .byte $46 ; | X   XX | $B474
    .byte $06 ; |     XX | $B475
    .byte $7C ; | XXXXX  | $B476
    .byte $60 ; | XX     | $B477
    .byte $60 ; | XX     | $B478
    .byte $7E ; | XXXXXX | $B479
    .byte $00 ; |        | $B47A
    .byte $24 ; |  X  X  | $B47B
    .byte $64 ; | XX  X  | $B47C
    .byte $A4 ; |X X  X  | $B47D
    .byte $27 ; |  X  XXX| $B47E
    .byte $24 ; |  X  X  | $B47F
    .byte $22 ; |  X   X | $B480
    .byte $21 ; |  X    X| $B481
    .byte $3C ; |  XXXX  | $B482
    .byte $66 ; | XX  XX | $B483
    .byte $66 ; | XX  XX | $B484
    .byte $66 ; | XX  XX | $B485
    .byte $66 ; | XX  XX | $B486
    .byte $66 ; | XX  XX | $B487
    .byte $3C ; |  XXXX  | $B488
    .byte $00 ; |        | $B489
    .byte $23 ; |  X   XX| $B48A
    .byte $24 ; |  X  X  | $B48B
    .byte $25 ; |  X  X X| $B48C
    .byte $E4 ; |XXX  X  | $B48D
    .byte $24 ; |  X  X  | $B48E
    .byte $44 ; | X   X  | $B48F
    .byte $83 ; |X     XX| $B490
    .byte $0C ; |    XX  | $B491
    .byte $10 ; |   X    | $B492
    .byte $3F ; |  XXXXXX| $B493
    .byte $7F ; | XXXXXXX| $B494
    .byte $3F ; |  XXXXXX| $B495
    .byte $10 ; |   X    | $B496
    .byte $0C ; |    XX  | $B497
    .byte $00 ; |        | $B498
    .byte $C7 ; |XX   XXX| $B499
    .byte $20 ; |  X     | $B49A
    .byte $E0 ; |XXX     | $B49B
    .byte $03 ; |      XX| $B49C
    .byte $04 ; |     X  | $B49D
    .byte $04 ; |     X  | $B49E
    .byte $E3 ; |XXX   XX| $B49F
    .byte $01 ; |       X| $B4A0
    .byte $02 ; |      X | $B4A1
    .byte $FE ; |XXXXXXX | $B4A2
    .byte $0E ; |    XXX | $B4A3
    .byte $FE ; |XXXXXXX | $B4A4
    .byte $02 ; |      X | $B4A5
    .byte $01 ; |       X| $B4A6
    .byte $00 ; |        | $B4A7
    .byte $C0 ; |XX      | $B4A8
    .byte $20 ; |  X     | $B4A9
    .byte $20 ; |  X     | $B4AA
    .byte $C0 ; |XX      | $B4AB
    .byte $00 ; |        | $B4AC
    .byte $00 ; |        | $B4AD
    .byte $E0 ; |XXX     | $B4AE
    .byte $86 ; |X    XX | $B4AF
    .byte $41 ; | X     X| $B4B0
    .byte $7F ; | XXXXXXX| $B4B1
    .byte $70 ; | XXX    | $B4B2
    .byte $7F ; | XXXXXXX| $B4B3
    .byte $41 ; | X     X| $B4B4
    .byte $86 ; |X    XX | $B4B5
    .byte $00 ; |        | $B4B6
    .byte $0F ; |    XXXX| $B4B7
    .byte $08 ; |    X   | $B4B8
    .byte $08 ; |    X   | $B4B9
    .byte $0F ; |    XXXX| $B4BA
    .byte $08 ; |    X   | $B4BB
    .byte $08 ; |    X   | $B4BC
    .byte $0F ; |    XXXX| $B4BD
    .byte $3F ; |  XXXXXX| $B4BE
    .byte $0C ; |    XX  | $B4BF
    .byte $8C ; |X   XX  | $B4C0
    .byte $CC ; |XX  XX  | $B4C1
    .byte $8C ; |X   XX  | $B4C2
    .byte $3C ; |  XXXX  | $B4C3
    .byte $1C ; |   XXX  | $B4C4
    .byte $00 ; |        | $B4C5
    .byte $C4 ; |XX   X  | $B4C6
    .byte $24 ; |  X  X  | $B4C7
    .byte $24 ; |  X  X  | $B4C8
    .byte $C7 ; |XX   XXX| $B4C9
    .byte $24 ; |  X  X  | $B4CA
    .byte $24 ; |  X  X  | $B4CB
    .byte $C7 ; |XX   XXX| $B4CC
    .byte $78 ; | XXXX   | $B4CD
    .byte $CD ; |XX  XX X| $B4CE
    .byte $CD ; |XX  XX X| $B4CF
    .byte $CD ; |XX  XX X| $B4D0
    .byte $CD ; |XX  XX X| $B4D1
    .byte $CD ; |XX  XX X| $B4D2
    .byte $78 ; | XXXX   | $B4D3
    .byte $00 ; |        | $B4D4
    .byte $24 ; |  X  X  | $B4D5
    .byte $44 ; | X   X  | $B4D6
    .byte $84 ; |X    X  | $B4D7
    .byte $C7 ; |XX   XXX| $B4D8
    .byte $24 ; |  X  X  | $B4D9
    .byte $22 ; |  X   X | $B4DA
    .byte $C1 ; |XX     X| $B4DB
    .byte $F1 ; |XXXX   X| $B4DC
    .byte $9B ; |X  XX XX| $B4DD
    .byte $9B ; |X  XX XX| $B4DE
    .byte $9B ; |X  XX XX| $B4DF
    .byte $9B ; |X  XX XX| $B4E0
    .byte $9B ; |X  XX XX| $B4E1
    .byte $F1 ; |XXXX   X| $B4E2
    .byte $00 ; |        | $B4E3
    .byte $20 ; |  X     | $B4E4
    .byte $20 ; |  X     | $B4E5
    .byte $20 ; |  X     | $B4E6
    .byte $E0 ; |XXX     | $B4E7
    .byte $20 ; |  X     | $B4E8
    .byte $40 ; | X      | $B4E9
    .byte $87 ; |X    XXX| $B4EA
    .byte $E0 ; |XXX     | $B4EB
    .byte $30 ; |  XX    | $B4EC
    .byte $31 ; |  XX   X| $B4ED
    .byte $33 ; |  XX  XX| $B4EE
    .byte $31 ; |  XX   X| $B4EF
    .byte $30 ; |  XX    | $B4F0
    .byte $E0 ; |XXX     | $B4F1
    .byte $00 ; |        | $B4F2
    .byte $83 ; |X     XX| $B4F3
    .byte $80 ; |X       | $B4F4
    .byte $80 ; |X       | $B4F5
    .byte $81 ; |X      X| $B4F6
    .byte $82 ; |X     X | $B4F7
    .byte $82 ; |X     X | $B4F8
    .byte $F1 ; |XXXX   X| $B4F9
    .byte $61 ; | XX    X| $B4FA
    .byte $82 ; |X     X | $B4FB
    .byte $FE ; |XXXXXXX | $B4FC
    .byte $0E ; |    XXX | $B4FD
    .byte $FE ; |XXXXXXX | $B4FE
    .byte $82 ; |X     X | $B4FF
    .byte $61 ; | XX    X| $B500
    .byte $00 ; |        | $B501
    .byte $E0 ; |XXX     | $B502
    .byte $10 ; |   X    | $B503
    .byte $10 ; |   X    | $B504
    .byte $E0 ; |XXX     | $B505
    .byte $00 ; |        | $B506
    .byte $00 ; |        | $B507
    .byte $F0 ; |XXXX    | $B508
    .byte $83 ; |X     XX| $B509
    .byte $40 ; | X      | $B50A
    .byte $7F ; | XXXXXXX| $B50B
    .byte $70 ; | XXX    | $B50C
    .byte $7F ; | XXXXXXX| $B50D
    .byte $40 ; | X      | $B50E
    .byte $83 ; |X     XX| $B50F
    .byte $00 ; |        | $B510
    .byte $18 ; |   XX   | $B511
    .byte $18 ; |   XX   | $B512
    .byte $18 ; |   XX   | $B513
    .byte $24 ; |  X  X  | $B514
    .byte $42 ; | X    X | $B515
    .byte $42 ; | X    X | $B516
    .byte $42 ; | X    X | $B517
    .byte $0F ; |    XXXX| $B518
    .byte $8C ; |X   XX  | $B519
    .byte $CC ; |XX  XX  | $B51A
    .byte $E7 ; |XXX  XXX| $B51B
    .byte $C1 ; |XX     X| $B51C
    .byte $89 ; |X   X  X| $B51D
    .byte $0F ; |    XXXX| $B51E
    .byte $00 ; |        | $B51F
    .byte $1E ; |   XXXX | $B520
    .byte $21 ; |  X    X| $B521
    .byte $21 ; |  X    X| $B522
    .byte $21 ; |  X    X| $B523
    .byte $21 ; |  X    X| $B524
    .byte $21 ; |  X    X| $B525
    .byte $1E ; |   XXXX | $B526
    .byte $87 ; |X    XXX| $B527
    .byte $0C ; |    XX  | $B528
    .byte $0C ; |    XX  | $B529
    .byte $8C ; |X   XX  | $B52A
    .byte $8C ; |X   XX  | $B52B
    .byte $8C ; |X   XX  | $B52C
    .byte $87 ; |X    XXX| $B52D
    .byte $00 ; |        | $B52E
    .byte $00 ; |        | $B52F
    .byte $00 ; |        | $B530
    .byte $00 ; |        | $B531
    .byte $3E ; |  XXXXX | $B532
    .byte $00 ; |        | $B533
    .byte $00 ; |        | $B534
    .byte $00 ; |        | $B535
    .byte $83 ; |X     XX| $B536
    .byte $C6 ; |XX   XX | $B537
    .byte $C6 ; |XX   XX | $B538
    .byte $C6 ; |XX   XX | $B539
    .byte $C6 ; |XX   XX | $B53A
    .byte $C6 ; |XX   XX | $B53B
    .byte $83 ; |X     XX| $B53C
    .byte $00 ; |        | $B53D
    .byte $18 ; |   XX   | $B53E
    .byte $18 ; |   XX   | $B53F
    .byte $18 ; |   XX   | $B540
    .byte $24 ; |  X  X  | $B541
    .byte $42 ; | X    X | $B542
    .byte $42 ; | X    X | $B543
    .byte $42 ; | X    X | $B544
    .byte $C0 ; |XX      | $B545
    .byte $61 ; | XX    X| $B546
    .byte $63 ; | XX   XX| $B547
    .byte $67 ; | XX  XXX| $B548
    .byte $63 ; | XX   XX| $B549
    .byte $61 ; | XX    X| $B54A
    .byte $C0 ; |XX      | $B54B
    .byte $00 ; |        | $B54C
    .byte $1E ; |   XXXX | $B54D
    .byte $21 ; |  X    X| $B54E
    .byte $21 ; |  X    X| $B54F
    .byte $21 ; |  X    X| $B550
    .byte $21 ; |  X    X| $B551
    .byte $21 ; |  X    X| $B552
    .byte $1E ; |   XXXX | $B553
    .byte $C1 ; |XX     X| $B554
    .byte $02 ; |      X | $B555
    .byte $FE ; |XXXXXXX | $B556
    .byte $0E ; |    XXX | $B557
    .byte $FE ; |XXXXXXX | $B558
    .byte $02 ; |      X | $B559
    .byte $C1 ; |XX     X| $B55A
    .byte $00 ; |        | $B55B
    .byte $3E ; |  XXXXX | $B55C
    .byte $01 ; |       X| $B55D
    .byte $01 ; |       X| $B55E
    .byte $1E ; |   XXXX | $B55F
    .byte $20 ; |  X     | $B560
    .byte $20 ; |  X     | $B561
    .byte $1F ; |   XXXXX| $B562
    .byte $83 ; |X     XX| $B563
    .byte $40 ; | X      | $B564
    .byte $7F ; | XXXXXXX| $B565
    .byte $70 ; | XXX    | $B566
    .byte $7F ; | XXXXXXX| $B567
    .byte $40 ; | X      | $B568
    .byte $83 ; |X     XX| $B569
    .byte $00 ; |        | $B56A
    .byte $01 ; |       X| $B56B
    .byte $01 ; |       X| $B56C
    .byte $01 ; |       X| $B56D
    .byte $01 ; |       X| $B56E
    .byte $01 ; |       X| $B56F
    .byte $01 ; |       X| $B570
    .byte $01 ; |       X| $B571
    .byte $0F ; |    XXXX| $B572
    .byte $88 ; |X   X   | $B573
    .byte $C0 ; |XX      | $B574
    .byte $EF ; |XXX XXXX| $B575
    .byte $CC ; |XX  XX  | $B576
    .byte $8C ; |X   XX  | $B577
    .byte $0F ; |    XXXX| $B578
    .byte $00 ; |        | $B579
    .byte $04 ; |     X  | $B57A
    .byte $0C ; |    XX  | $B57B
    .byte $14 ; |   X X  | $B57C
    .byte $24 ; |  X  X  | $B57D
    .byte $44 ; | X   X  | $B57E
    .byte $84 ; |X    X  | $B57F
    .byte $04 ; |     X  | $B580
    .byte $87 ; |X    XXX| $B581
    .byte $CC ; |XX  XX  | $B582
    .byte $CC ; |XX  XX  | $B583
    .byte $8C ; |X   XX  | $B584
    .byte $0C ; |    XX  | $B585
    .byte $0C ; |    XX  | $B586
    .byte $C7 ; |XX   XXX| $B587
    .byte $00 ; |        | $B588
    .byte $3C ; |  XXXX  | $B589
    .byte $42 ; | X    X | $B58A
    .byte $42 ; | X    X | $B58B
    .byte $42 ; | X    X | $B58C
    .byte $42 ; | X    X | $B58D
    .byte $42 ; | X    X | $B58E
    .byte $3C ; |  XXXX  | $B58F
    .byte $83 ; |X     XX| $B590
    .byte $C6 ; |XX   XX | $B591
    .byte $C6 ; |XX   XX | $B592
    .byte $C6 ; |XX   XX | $B593
    .byte $C6 ; |XX   XX | $B594
    .byte $C6 ; |XX   XX | $B595
    .byte $83 ; |X     XX| $B596
    .byte $00 ; |        | $B597
    .byte $3C ; |  XXXX  | $B598
    .byte $22 ; |  X   X | $B599
    .byte $21 ; |  X    X| $B59A
    .byte $21 ; |  X    X| $B59B
    .byte $21 ; |  X    X| $B59C
    .byte $22 ; |  X   X | $B59D
    .byte $3C ; |  XXXX  | $B59E
    .byte $C0 ; |XX      | $B59F
    .byte $61 ; | XX    X| $B5A0
    .byte $63 ; | XX   XX| $B5A1
    .byte $67 ; | XX  XXX| $B5A2
    .byte $63 ; | XX   XX| $B5A3
    .byte $61 ; | XX    X| $B5A4
    .byte $C0 ; |XX      | $B5A5
    .byte $00 ; |        | $B5A6
    .byte $1F ; |   XXXXX| $B5A7
    .byte $00 ; |        | $B5A8
    .byte $00 ; |        | $B5A9
    .byte $0F ; |    XXXX| $B5AA
    .byte $10 ; |   X    | $B5AB
    .byte $10 ; |   X    | $B5AC
    .byte $0F ; |    XXXX| $B5AD
    .byte $C1 ; |XX     X| $B5AE
    .byte $02 ; |      X | $B5AF
    .byte $FE ; |XXXXXXX | $B5B0
    .byte $0E ; |    XXX | $B5B1
    .byte $FE ; |XXXXXXX | $B5B2
    .byte $02 ; |      X | $B5B3
    .byte $C1 ; |XX     X| $B5B4
    .byte $00 ; |        | $B5B5
    .byte $00 ; |        | $B5B6
    .byte $80 ; |X       | $B5B7
    .byte $80 ; |X       | $B5B8
    .byte $00 ; |        | $B5B9
    .byte $00 ; |        | $B5BA
    .byte $00 ; |        | $B5BB
    .byte $80 ; |X       | $B5BC
    .byte $00 ; |        | $B5BD
    .byte $00 ; |        | $B5BE
    .byte $00 ; |        | $B5BF
    .byte $00 ; |        | $B5C0
    .byte $00 ; |        | $B5C1
    .byte $00 ; |        | $B5C2
    .byte $00 ; |        | $B5C3
    .byte $00 ; |        | $B5C4
    .byte $08 ; |    X   | $B5C5
    .byte $0C ; |    XX  | $B5C6
    .byte $0B ; |    X XX| $B5C7
    .byte $08 ; |    X   | $B5C8
    .byte $08 ; |    X   | $B5C9
    .byte $08 ; |    X   | $B5CA
    .byte $08 ; |    X   | $B5CB
    .byte $84 ; |X    X  | $B5CC
    .byte $CC ; |XX  XX  | $B5CD
    .byte $B4 ; |X XX X  | $B5CE
    .byte $84 ; |X    X  | $B5CF
    .byte $84 ; |X    X  | $B5D0
    .byte $84 ; |X    X  | $B5D1
    .byte $84 ; |X    X  | $B5D2
    .byte $00 ; |        | $B5D3
    .byte $47 ; | X   XXX| $B5D4
    .byte $C8 ; |XX  X   | $B5D5
    .byte $48 ; | X  X   | $B5D6
    .byte $48 ; | X  X   | $B5D7
    .byte $48 ; | X  X   | $B5D8
    .byte $48 ; | X  X   | $B5D9
    .byte $47 ; | X   XXX| $B5DA
    .byte $84 ; |X    X  | $B5DB
    .byte $84 ; |X    X  | $B5DC
    .byte $84 ; |X    X  | $B5DD
    .byte $FC ; |XXXXXX  | $B5DE
    .byte $84 ; |X    X  | $B5DF
    .byte $48 ; | X  X   | $B5E0
    .byte $30 ; |  XX    | $B5E1
    .byte $00 ; |        | $B5E2
    .byte $8F ; |X   XXXX| $B5E3
    .byte $41 ; | X     X| $B5E4
    .byte $41 ; | X     X| $B5E5
    .byte $41 ; | X     X| $B5E6
    .byte $41 ; | X     X| $B5E7
    .byte $41 ; | X     X| $B5E8
    .byte $8F ; |X   XXXX| $B5E9
    .byte $10 ; |   X    | $B5EA
    .byte $28 ; |  X X   | $B5EB
    .byte $44 ; | X   X  | $B5EC
    .byte $82 ; |X     X | $B5ED
    .byte $82 ; |X     X | $B5EE
    .byte $82 ; |X     X | $B5EF
    .byte $82 ; |X     X | $B5F0
    .byte $00 ; |        | $B5F1
    .byte $E0 ; |XXX     | $B5F2
    .byte $00 ; |        | $B5F3
    .byte $00 ; |        | $B5F4
    .byte $00 ; |        | $B5F5
    .byte $00 ; |        | $B5F6
    .byte $00 ; |        | $B5F7
    .byte $E7 ; |XXX  XXX| $B5F8
    .byte $7E ; | XXXXXX | $B5F9
    .byte $40 ; | X      | $B5FA
    .byte $40 ; | X      | $B5FB
    .byte $7E ; | XXXXXX | $B5FC
    .byte $40 ; | X      | $B5FD
    .byte $40 ; | X      | $B5FE
    .byte $7E ; | XXXXXX | $B5FF
    .byte $00 ; |        | $B600
    .byte $82 ; |X     X | $B601
    .byte $82 ; |X     X | $B602
    .byte $82 ; |X     X | $B603
    .byte $83 ; |X     XX| $B604
    .byte $82 ; |X     X | $B605
    .byte $81 ; |X      X| $B606
    .byte $F0 ; |XXXX    | $B607
    .byte $00 ; |        | $B608
    .byte $00 ; |        | $B609
    .byte $00 ; |        | $B60A
    .byte $00 ; |        | $B60B
    .byte $00 ; |        | $B60C
    .byte $00 ; |        | $B60D
    .byte $00 ; |        | $B60E
    .byte $00 ; |        | $B60F
    .byte $10 ; |   X    | $B610
    .byte $10 ; |   X    | $B611
    .byte $10 ; |   X    | $B612
    .byte $F0 ; |XXXX    | $B613
    .byte $10 ; |   X    | $B614
    .byte $20 ; |  X     | $B615
    .byte $C0 ; |XX      | $B616
    
    LDA    #0              ; 2
    STA    VBLANK          ; 3
    STA    $87             ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    $DD             ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #0              ; 2
LB62F:
    STA    WSYNC           ; 3
    INY                    ; 2
    CPY    #$47            ; 2
    BNE    LB62F           ; 2³
    STY    $A5             ; 3
    JSR    LB806           ; 6
    LDY    #$39            ; 2
    JSR    LB7D1           ; 6
    LDA    #0              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    CLC                    ; 2
    LDA    $A5             ; 3
    ADC    #$3C            ; 2
    STA    $A5             ; 3
    LDY    $A5             ; 3
LB653:
    STA    WSYNC           ; 3
    INY                    ; 2
    CPY    #$BF            ; 2
    BNE    LB653           ; 2³
    DEC    $8B             ; 5
    LDA    $8B             ; 3
    BNE    LB666           ; 2³
    LDA    #0              ; 2
    STA    $C1             ; 3
    STA    $DA             ; 3
LB666:
    LDA    #$28            ; 2
    STA    $DD             ; 3
    LDA    #$82            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    
    .byte $00 ; |        | $B675
    .byte $00 ; |        | $B676
    .byte $00 ; |        | $B677
    .byte $00 ; |        | $B678
    .byte $00 ; |        | $B679
    .byte $00 ; |        | $B67A
    .byte $00 ; |        | $B67B
    .byte $00 ; |        | $B67C
    .byte $00 ; |        | $B67D
    .byte $00 ; |        | $B67E
    .byte $00 ; |        | $B67F
    .byte $00 ; |        | $B680
    .byte $00 ; |        | $B681
    .byte $00 ; |        | $B682
    .byte $00 ; |        | $B683
    .byte $00 ; |        | $B684
    .byte $00 ; |        | $B685
    .byte $00 ; |        | $B686
    .byte $00 ; |        | $B687
    .byte $00 ; |        | $B688
    .byte $00 ; |        | $B689
    .byte $00 ; |        | $B68A
    .byte $00 ; |        | $B68B
    .byte $00 ; |        | $B68C
    .byte $00 ; |        | $B68D
    .byte $00 ; |        | $B68E
    .byte $00 ; |        | $B68F
    .byte $00 ; |        | $B690
    .byte $07 ; |     XXX| $B691
    .byte $0F ; |    XXXX| $B692
    .byte $1F ; |   XXXXX| $B693
    .byte $3F ; |  XXXXXX| $B694
    .byte $7F ; | XXXXXXX| $B695
    .byte $7C ; | XXXXX  | $B696
    .byte $78 ; | XXXX   | $B697
    .byte $78 ; | XXXX   | $B698
    .byte $78 ; | XXXX   | $B699
    .byte $78 ; | XXXX   | $B69A
    .byte $78 ; | XXXX   | $B69B
    .byte $78 ; | XXXX   | $B69C
    .byte $78 ; | XXXX   | $B69D
    .byte $78 ; | XXXX   | $B69E
    .byte $78 ; | XXXX   | $B69F
    .byte $78 ; | XXXX   | $B6A0
    .byte $78 ; | XXXX   | $B6A1
    .byte $78 ; | XXXX   | $B6A2
    .byte $78 ; | XXXX   | $B6A3
    .byte $78 ; | XXXX   | $B6A4
    .byte $78 ; | XXXX   | $B6A5
    .byte $78 ; | XXXX   | $B6A6
    .byte $78 ; | XXXX   | $B6A7
    .byte $7C ; | XXXXX  | $B6A8
    .byte $7F ; | XXXXXXX| $B6A9
    .byte $3F ; |  XXXXXX| $B6AA
    .byte $1F ; |   XXXXX| $B6AB
    .byte $0F ; |    XXXX| $B6AC
    .byte $07 ; |     XXX| $B6AD
    .byte $00 ; |        | $B6AE
    .byte $30 ; |  XX    | $B6AF
    .byte $70 ; | XXX    | $B6B0
    .byte $F1 ; |XXXX   X| $B6B1
    .byte $F3 ; |XXXX  XX| $B6B2
    .byte $F7 ; |XXXX XXX| $B6B3
    .byte $F7 ; |XXXX XXX| $B6B4
    .byte $F7 ; |XXXX XXX| $B6B5
    .byte $F7 ; |XXXX XXX| $B6B6
    .byte $F7 ; |XXXX XXX| $B6B7
    .byte $F7 ; |XXXX XXX| $B6B8
    .byte $F7 ; |XXXX XXX| $B6B9
    .byte $F7 ; |XXXX XXX| $B6BA
    .byte $F7 ; |XXXX XXX| $B6BB
    .byte $F7 ; |XXXX XXX| $B6BC
    .byte $F3 ; |XXXX  XX| $B6BD
    .byte $F1 ; |XXXX   X| $B6BE
    .byte $F0 ; |XXXX    | $B6BF
    .byte $F0 ; |XXXX    | $B6C0
    .byte $F0 ; |XXXX    | $B6C1
    .byte $F0 ; |XXXX    | $B6C2
    .byte $F1 ; |XXXX   X| $B6C3
    .byte $F3 ; |XXXX  XX| $B6C4
    .byte $FF ; |XXXXXXXX| $B6C5
    .byte $FF ; |XXXXXXXX| $B6C6
    .byte $FF ; |XXXXXXXX| $B6C7
    .byte $FF ; |XXXXXXXX| $B6C8
    .byte $FF ; |XXXXXXXX| $B6C9
    .byte $00 ; |        | $B6CA
    .byte $C7 ; |XX   XXX| $B6CB
    .byte $EF ; |XXX XXXX| $B6CC
    .byte $DF ; |XX XXXXX| $B6CD
    .byte $BF ; |X XXXXXX| $B6CE
    .byte $7E ; | XXXXXX | $B6CF
    .byte $7C ; | XXXXX  | $B6D0
    .byte $3D ; |  XXXX X| $B6D1
    .byte $3D ; |  XXXX X| $B6D2
    .byte $3D ; |  XXXX X| $B6D3
    .byte $3D ; |  XXXX X| $B6D4
    .byte $3D ; |  XXXX X| $B6D5
    .byte $3D ; |  XXXX X| $B6D6
    .byte $3D ; |  XXXX X| $B6D7
    .byte $3D ; |  XXXX X| $B6D8
    .byte $3D ; |  XXXX X| $B6D9
    .byte $3D ; |  XXXX X| $B6DA
    .byte $3D ; |  XXXX X| $B6DB
    .byte $3D ; |  XXXX X| $B6DC
    .byte $3D ; |  XXXX X| $B6DD
    .byte $3D ; |  XXXX X| $B6DE
    .byte $3D ; |  XXXX X| $B6DF
    .byte $3D ; |  XXXX X| $B6E0
    .byte $3D ; |  XXXX X| $B6E1
    .byte $7D ; | XXXXX X| $B6E2
    .byte $FD ; |XXXXXX X| $B6E3
    .byte $F9 ; |XXXXX  X| $B6E4
    .byte $F1 ; |XXXX   X| $B6E5
    .byte $E1 ; |XXX    X| $B6E6
    .byte $C0 ; |XX      | $B6E7
    .byte $00 ; |        | $B6E8
    .byte $7F ; | XXXXXXX| $B6E9
    .byte $FE ; |XXXXXXX | $B6EA
    .byte $FC ; |XXXXXX  | $B6EB
    .byte $F9 ; |XXXXX  X| $B6EC
    .byte $F3 ; |XXXX  XX| $B6ED
    .byte $E7 ; |XXX  XXX| $B6EE
    .byte $C7 ; |XX   XXX| $B6EF
    .byte $87 ; |X    XXX| $B6F0
    .byte $07 ; |     XXX| $B6F1
    .byte $07 ; |     XXX| $B6F2
    .byte $87 ; |X    XXX| $B6F3
    .byte $C7 ; |XX   XXX| $B6F4
    .byte $E7 ; |XXX  XXX| $B6F5
    .byte $F7 ; |XXXX XXX| $B6F6
    .byte $F7 ; |XXXX XXX| $B6F7
    .byte $F7 ; |XXXX XXX| $B6F8
    .byte $F7 ; |XXXX XXX| $B6F9
    .byte $F7 ; |XXXX XXX| $B6FA
    .byte $F7 ; |XXXX XXX| $B6FB
    .byte $F7 ; |XXXX XXX| $B6FC
    .byte $F7 ; |XXXX XXX| $B6FD
    .byte $F7 ; |XXXX XXX| $B6FE
    .byte $F7 ; |XXXX XXX| $B6FF
    .byte $E7 ; |XXX  XXX| $B700
    .byte $C7 ; |XX   XXX| $B701
    .byte $86 ; |X    XX | $B702
    .byte $04 ; |     X  | $B703
    .byte $00 ; |        | $B704
    .byte $E6 ; |XXX  XX | $B705
    .byte $CF ; |XX  XXXX| $B706
    .byte $9F ; |X  XXXXX| $B707
    .byte $3F ; |  XXXXXX| $B708
    .byte $7F ; | XXXXXXX| $B709
    .byte $FF ; |XXXXXXXX| $B70A
    .byte $FF ; |XXXXXXXX| $B70B
    .byte $F9 ; |XXXXX  X| $B70C
    .byte $F0 ; |XXXX    | $B70D
    .byte $E6 ; |XXX  XX | $B70E
    .byte $EF ; |XXX XXXX| $B70F
    .byte $EF ; |XXX XXXX| $B710
    .byte $EF ; |XXX XXXX| $B711
    .byte $EF ; |XXX XXXX| $B712
    .byte $EF ; |XXX XXXX| $B713
    .byte $EF ; |XXX XXXX| $B714
    .byte $EF ; |XXX XXXX| $B715
    .byte $EF ; |XXX XXXX| $B716
    .byte $EF ; |XXX XXXX| $B717
    .byte $EF ; |XXX XXXX| $B718
    .byte $EF ; |XXX XXXX| $B719
    .byte $EF ; |XXX XXXX| $B71A
    .byte $EF ; |XXX XXXX| $B71B
    .byte $EF ; |XXX XXXX| $B71C
    .byte $EF ; |XXX XXXX| $B71D
    .byte $C7 ; |XX   XXX| $B71E
    .byte $83 ; |X     XX| $B71F
    .byte $01 ; |       X| $B720
    .byte $00 ; |        | $B721
    .byte $00 ; |        | $B722
    .byte $3C ; |  XXXX  | $B723
    .byte $7E ; | XXXXXX | $B724
    .byte $FF ; |XXXXXXXX| $B725
    .byte $FF ; |XXXXXXXX| $B726
    .byte $FF ; |XXXXXXXX| $B727
    .byte $FF ; |XXXXXXXX| $B728
    .byte $E7 ; |XXX  XXX| $B729
    .byte $C3 ; |XX    XX| $B72A
    .byte $99 ; |X  XX  X| $B72B
    .byte $BD ; |X XXXX X| $B72C
    .byte $BD ; |X XXXX X| $B72D
    .byte $BD ; |X XXXX X| $B72E
    .byte $BD ; |X XXXX X| $B72F
    .byte $BD ; |X XXXX X| $B730
    .byte $BD ; |X XXXX X| $B731
    .byte $BC ; |X XXXX  | $B732
    .byte $BC ; |X XXXX  | $B733
    .byte $BD ; |X XXXX X| $B734
    .byte $BF ; |X XXXXXX| $B735
    .byte $BF ; |X XXXXXX| $B736
    .byte $BF ; |X XXXXXX| $B737
    .byte $BF ; |X XXXXXX| $B738
    .byte $BF ; |X XXXXXX| $B739
    .byte $BF ; |X XXXXXX| $B73A
    .byte $3E ; |  XXXXX | $B73B
    .byte $3C ; |  XXXX  | $B73C
    .byte $38 ; |  XXX   | $B73D
    .byte $00 ; |        | $B73E
    .byte $08 ; |    X   | $B73F
    .byte $18 ; |   XX   | $B740
    .byte $B9 ; |X XXX  X| $B741
    .byte $FB ; |XXXXX XX| $B742
    .byte $FB ; |XXXXX XX| $B743
    .byte $FB ; |XXXXX XX| $B744
    .byte $FB ; |XXXXX XX| $B745
    .byte $FB ; |XXXXX XX| $B746
    .byte $FB ; |XXXXX XX| $B747
    .byte $7B ; | XXXX XX| $B748
    .byte $7B ; | XXXX XX| $B749
    .byte $7B ; | XXXX XX| $B74A
    .byte $03 ; |      XX| $B74B
    .byte $7F ; | XXXXXXX| $B74C
    .byte $7F ; | XXXXXXX| $B74D
    .byte $7F ; | XXXXXXX| $B74E
    .byte $7F ; | XXXXXXX| $B74F
    .byte $7F ; | XXXXXXX| $B750
    .byte $03 ; |      XX| $B751
    .byte $03 ; |      XX| $B752
    .byte $03 ; |      XX| $B753
    .byte $03 ; |      XX| $B754
    .byte $03 ; |      XX| $B755
    .byte $87 ; |X    XXX| $B756
    .byte $CF ; |XX  XXXX| $B757
    .byte $FF ; |XXXXXXXX| $B758
    .byte $FF ; |XXXXXXXX| $B759
    .byte $FE ; |XXXXXXX | $B75A
    .byte $FC ; |XXXXXX  | $B75B
    .byte $00 ; |        | $B75C
    .byte $63 ; | XX   XX| $B75D
    .byte $E7 ; |XXX  XXX| $B75E
    .byte $EF ; |XXX XXXX| $B75F
    .byte $EF ; |XXX XXXX| $B760
    .byte $EF ; |XXX XXXX| $B761
    .byte $EF ; |XXX XXXX| $B762
    .byte $EF ; |XXX XXXX| $B763
    .byte $EF ; |XXX XXXX| $B764
    .byte $EF ; |XXX XXXX| $B765
    .byte $EF ; |XXX XXXX| $B766
    .byte $EF ; |XXX XXXX| $B767
    .byte $EF ; |XXX XXXX| $B768
    .byte $CF ; |XX  XXXX| $B769
    .byte $9F ; |X  XXXXX| $B76A
    .byte $3F ; |  XXXXXX| $B76B
    .byte $7F ; | XXXXXXX| $B76C
    .byte $FF ; |XXXXXXXX| $B76D
    .byte $FF ; |XXXXXXXX| $B76E
    .byte $FF ; |XXXXXXXX| $B76F
    .byte $FF ; |XXXXXXXX| $B770
    .byte $EF ; |XXX XXXX| $B771
    .byte $CF ; |XX  XXXX| $B772
    .byte $8F ; |X   XXXX| $B773
    .byte $0F ; |    XXXX| $B774
    .byte $0E ; |    XXX | $B775
    .byte $0C ; |    XX  | $B776
    .byte $08 ; |    X   | $B777
    .byte $00 ; |        | $B778
    .byte $5E ; | X XXXX | $B779
    .byte $DE ; |XX XXXX | $B77A
    .byte $DE ; |XX XXXX | $B77B
    .byte $DE ; |XX XXXX | $B77C
    .byte $DE ; |XX XXXX | $B77D
    .byte $DE ; |XX XXXX | $B77E
    .byte $DE ; |XX XXXX | $B77F
    .byte $DE ; |XX XXXX | $B780
    .byte $DE ; |XX XXXX | $B781
    .byte $DE ; |XX XXXX | $B782
    .byte $DE ; |XX XXXX | $B783
    .byte $DE ; |XX XXXX | $B784
    .byte $DE ; |XX XXXX | $B785
    .byte $DE ; |XX XXXX | $B786
    .byte $DE ; |XX XXXX | $B787
    .byte $DE ; |XX XXXX | $B788
    .byte $DE ; |XX XXXX | $B789
    .byte $DE ; |XX XXXX | $B78A
    .byte $DE ; |XX XXXX | $B78B
    .byte $DE ; |XX XXXX | $B78C
    .byte $DE ; |XX XXXX | $B78D
    .byte $DE ; |XX XXXX | $B78E
    .byte $DE ; |XX XXXX | $B78F
    .byte $DE ; |XX XXXX | $B790
    .byte $DF ; |XX XXXXX| $B791
    .byte $9F ; |X  XXXXX| $B792
    .byte $1F ; |   XXXXX| $B793
    .byte $1F ; |   XXXXX| $B794
    .byte $00 ; |        | $B795
    .byte $00 ; |        | $B796
    .byte $00 ; |        | $B797
    .byte $00 ; |        | $B798
    .byte $00 ; |        | $B799
    .byte $00 ; |        | $B79A
    .byte $00 ; |        | $B79B
    .byte $00 ; |        | $B79C
    .byte $00 ; |        | $B79D
    .byte $00 ; |        | $B79E
    .byte $00 ; |        | $B79F
    .byte $00 ; |        | $B7A0
    .byte $00 ; |        | $B7A1
    .byte $00 ; |        | $B7A2
    .byte $00 ; |        | $B7A3
    .byte $00 ; |        | $B7A4
    .byte $00 ; |        | $B7A5
    .byte $00 ; |        | $B7A6
    .byte $00 ; |        | $B7A7
    .byte $00 ; |        | $B7A8
    .byte $00 ; |        | $B7A9
    .byte $00 ; |        | $B7AA
    .byte $00 ; |        | $B7AB
    .byte $00 ; |        | $B7AC
    .byte $00 ; |        | $B7AD
    .byte $00 ; |        | $B7AE
    .byte $00 ; |        | $B7AF
    .byte $00 ; |        | $B7B0
    .byte $00 ; |        | $B7B1
    .byte $00 ; |        | $B7B2
    .byte $E0 ; |XXX     | $B7B3
    .byte $F0 ; |XXXX    | $B7B4
    .byte $F8 ; |XXXXX   | $B7B5
    .byte $FC ; |XXXXXX  | $B7B6
    .byte $FE ; |XXXXXXX | $B7B7
    .byte $7E ; | XXXXXX | $B7B8
    .byte $3E ; |  XXXXX | $B7B9
    .byte $1E ; |   XXXX | $B7BA
    .byte $1E ; |   XXXX | $B7BB
    .byte $1E ; |   XXXX | $B7BC
    .byte $1E ; |   XXXX | $B7BD
    .byte $1E ; |   XXXX | $B7BE
    .byte $1E ; |   XXXX | $B7BF
    .byte $1E ; |   XXXX | $B7C0
    .byte $1E ; |   XXXX | $B7C1
    .byte $1E ; |   XXXX | $B7C2
    .byte $1E ; |   XXXX | $B7C3
    .byte $1E ; |   XXXX | $B7C4
    .byte $1E ; |   XXXX | $B7C5
    .byte $1E ; |   XXXX | $B7C6
    .byte $1E ; |   XXXX | $B7C7
    .byte $1E ; |   XXXX | $B7C8
    .byte $3E ; |  XXXXX | $B7C9
    .byte $7E ; | XXXXXX | $B7CA
    .byte $FC ; |XXXXXX  | $B7CB
    .byte $F8 ; |XXXXX   | $B7CC
    .byte $F0 ; |XXXX    | $B7CD
    .byte $E0 ; |XXX     | $B7CE
    .byte $00 ; |        | $B7CF
    .byte $00 ; |        | $B7D0
    
LB7D1:
    STY    $D6             ; 3
LB7D3:
    LDY    $D6             ; 3
    LDA    ($D4),Y         ; 5
    STA    GRP0            ; 3
    STA    WSYNC           ; 3
    LDA    ($D2),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($D0),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($CE),Y         ; 5
    STA    $D7             ; 3
    LDA    ($CC),Y         ; 5
    TAX                    ; 2
    LDA    ($CA),Y         ; 5
    TAY                    ; 2
    LDA    $D7             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    DEC    $D6             ; 5
    BPL    LB7D3           ; 2³
    LDA    #0              ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    RTS                    ; 6

LB806:
    STA    WSYNC           ; 3
    LDA    #3              ; 2
    LDY    #0              ; 2
    STY    REFP1           ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STY    HMP1            ; 3
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    LDA    #$F0            ; 2
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    RTS                    ; 6

    LDA    #2              ; 2
    STA    VBLANK          ; 3
    LDA    #0              ; 2
    STA    AUDC0           ; 3
    STA    AUDF0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    STA    $E4             ; 3
    STA    COLUBK          ; 3
    LDX    $9F             ; 3
    LDA    LBA95,X         ; 4
    STA    $E5             ; 3
LB847:
    LDA    $E5             ; 3
    STA    $E1             ; 3
    LDA    #$AF            ; 2
    STA    $DF             ; 3
    LDA    #$B8            ; 2
    STA    $E0             ; 3
    LDA    #1              ; 2
    STA    $E3             ; 3
    STA    WSYNC           ; 3
LB859:
    JSR    LB87C           ; 6
    STA    WSYNC           ; 3
    LDA    $E3             ; 3
    BNE    LB859           ; 2³
    DEC    $E6             ; 5
    BNE    LB875           ; 2³
    LDA    #3              ; 2
    STA    $C1             ; 3
    LDA    #$3C            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
LB875:
    JMP    LB847           ; 3
    .byte $00 ; |        | $B878
    .byte $FF ; |XXXXXXXX| $B879
    .byte $01 ; |       X| $B87A
    .byte $00 ; |        | $B87B
LB87C:
    CLC                    ; 2
    LDA    $E1             ; 3
    ADC    $E2             ; 3
    STA    $E2             ; 3
    BCC    LB8A9           ; 2³
    LDY    #0              ; 2
    LDA    $E4             ; 3
    EOR    #$01            ; 2
    STA    $E4             ; 3
    BNE    LB89C           ; 2³
    LDA    ($DF),Y         ; 5
    BEQ    LB8AA           ; 2³
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    AUDV1           ; 3
    RTS                    ; 6

LB89C:
    CLC                    ; 2
    INC    $DF             ; 5
    BNE    LB8A3           ; 2³
    INC    $E0             ; 5
LB8A3:
    LDA    ($DF),Y         ; 5
    BEQ    LB8AA           ; 2³
    STA    AUDV1           ; 3
LB8A9:
    RTS                    ; 6

LB8AA:
    STA    $E1             ; 3
    STA    $E3             ; 3
    RTS                    ; 6

    .byte $9A ; |X  XX X | $B8AF
    .byte $86 ; |X    XX | $B8B0
    .byte $88 ; |X   X   | $B8B1
    .byte $89 ; |X   X  X| $B8B2
    .byte $78 ; | XXXX   | $B8B3
    .byte $76 ; | XXX XX | $B8B4
    .byte $66 ; | XX  XX | $B8B5
    .byte $7A ; | XXXX X | $B8B6
    .byte $A7 ; |X X  XXX| $B8B7
    .byte $87 ; |X    XXX| $B8B8
    .byte $76 ; | XXX XX | $B8B9
    .byte $6A ; | XX X X | $B8BA
    .byte $87 ; |X    XXX| $B8BB
    .byte $87 ; |X    XXX| $B8BC
    .byte $78 ; | XXXX   | $B8BD
    .byte $78 ; | XXXX   | $B8BE
    .byte $97 ; |X  X XXX| $B8BF
    .byte $48 ; | X  X   | $B8C0
    .byte $A7 ; |X X  XXX| $B8C1
    .byte $77 ; | XXX XXX| $B8C2
    .byte $78 ; | XXXX   | $B8C3
    .byte $98 ; |X  XX   | $B8C4
    .byte $77 ; | XXX XXX| $B8C5
    .byte $77 ; | XXX XXX| $B8C6
    .byte $78 ; | XXXX   | $B8C7
    .byte $76 ; | XXX XX | $B8C8
    .byte $77 ; | XXX XXX| $B8C9
    .byte $88 ; |X   X   | $B8CA
    .byte $98 ; |X  XX   | $B8CB
    .byte $88 ; |X   X   | $B8CC
    .byte $78 ; | XXXX   | $B8CD
    .byte $77 ; | XXX XXX| $B8CE
    .byte $87 ; |X    XXX| $B8CF
    .byte $77 ; | XXX XXX| $B8D0
    .byte $78 ; | XXXX   | $B8D1
    .byte $87 ; |X    XXX| $B8D2
    .byte $77 ; | XXX XXX| $B8D3
    .byte $87 ; |X    XXX| $B8D4
    .byte $77 ; | XXX XXX| $B8D5
    .byte $77 ; | XXX XXX| $B8D6
    .byte $77 ; | XXX XXX| $B8D7
    .byte $88 ; |X   X   | $B8D8
    .byte $88 ; |X   X   | $B8D9
    .byte $78 ; | XXXX   | $B8DA
    .byte $77 ; | XXX XXX| $B8DB
    .byte $88 ; |X   X   | $B8DC
    .byte $77 ; | XXX XXX| $B8DD
    .byte $88 ; |X   X   | $B8DE
    .byte $88 ; |X   X   | $B8DF
    .byte $78 ; | XXXX   | $B8E0
    .byte $88 ; |X   X   | $B8E1
    .byte $77 ; | XXX XXX| $B8E2
    .byte $87 ; |X    XXX| $B8E3
    .byte $78 ; | XXXX   | $B8E4
    .byte $77 ; | XXX XXX| $B8E5
    .byte $78 ; | XXXX   | $B8E6
    .byte $77 ; | XXX XXX| $B8E7
    .byte $77 ; | XXX XXX| $B8E8
    .byte $77 ; | XXX XXX| $B8E9
    .byte $87 ; |X    XXX| $B8EA
    .byte $77 ; | XXX XXX| $B8EB
    .byte $77 ; | XXX XXX| $B8EC
    .byte $88 ; |X   X   | $B8ED
    .byte $88 ; |X   X   | $B8EE
    .byte $88 ; |X   X   | $B8EF
    .byte $88 ; |X   X   | $B8F0
    .byte $67 ; | XX  XXX| $B8F1
    .byte $35 ; |  XX X X| $B8F2
    .byte $84 ; |X    X  | $B8F3
    .byte $9A ; |X  XX X | $B8F4
    .byte $99 ; |X  XX  X| $B8F5
    .byte $A9 ; |X X X  X| $B8F6
    .byte $AA ; |X X X X | $B8F7
    .byte $BA ; |X XXX X | $B8F8
    .byte $08 ; |    X   | $B8F9
    .byte $80 ; |X       | $B8FA
    .byte $AD ; |X X XX X| $B8FB
    .byte $67 ; | XX  XXX| $B8FC
    .byte $64 ; | XX  X  | $B8FD
    .byte $BA ; |X XXX X | $B8FE
    .byte $67 ; | XX  XXX| $B8FF
    .byte $B9 ; |X XXX  X| $B900
    .byte $9B ; |X  XX XX| $B901
    .byte $FA ; |XXXXX X | $B902
    .byte $03 ; |      XX| $B903
    .byte $D3 ; |XX X  XX| $B904
    .byte $5B ; | X XX XX| $B905
    .byte $55 ; | X X X X| $B906
    .byte $A6 ; |X X  XX | $B907
    .byte $7B ; | XXXX XX| $B908
    .byte $75 ; | XXX X X| $B909
    .byte $CB ; |XX  X XX| $B90A
    .byte $89 ; |X   X  X| $B90B
    .byte $FB ; |XXXXX XX| $B90C
    .byte $03 ; |      XX| $B90D
    .byte $E3 ; |XXX   XX| $B90E
    .byte $5B ; | X XX XX| $B90F
    .byte $65 ; | XX  X X| $B910
    .byte $B7 ; |X XX XXX| $B911
    .byte $5A ; | X XX X | $B912
    .byte $95 ; |X  X X X| $B913
    .byte $AC ; |X X XX  | $B914
    .byte $87 ; |X    XXX| $B915
    .byte $FD ; |XXXXXX X| $B916
    .byte $02 ; |      X | $B917
    .byte $F4 ; |XXXX X  | $B918
    .byte $3A ; |  XXX X | $B919
    .byte $74 ; | XXX X  | $B91A
    .byte $C9 ; |XX  X  X| $B91B
    .byte $06 ; |     XX | $B91C
    .byte $D8 ; |XX XX   | $B91D
    .byte $69 ; | XX X  X| $B91E
    .byte $B8 ; |X XXX   | $B91F
    .byte $EC ; |XXX XX  | $B920
    .byte $04 ; |     X  | $B921
    .byte $F4 ; |XXXX X  | $B922
    .byte $09 ; |    X  X| $B923
    .byte $A6 ; |X X  XX | $B924
    .byte $AA ; |X X X X | $B925
    .byte $14 ; |   X X  | $B926
    .byte $DA ; |XX XX X | $B927
    .byte $55 ; | X X X X| $B928
    .byte $BB ; |X XXX XX| $B929
    .byte $B8 ; |X XXX   | $B92A
    .byte $0E ; |    XXX | $B92B
    .byte $F0 ; |XXXX    | $B92C
    .byte $0D ; |    XX X| $B92D
    .byte $A5 ; |X X  X X| $B92E
    .byte $A9 ; |X X X  X| $B92F
    .byte $25 ; |  X  X X| $B930
    .byte $AD ; |X X XX X| $B931
    .byte $91 ; |X  X   X| $B932
    .byte $6C ; | XX XX  | $B933
    .byte $B7 ; |X XX XXX| $B934
    .byte $DA ; |XX XX X | $B935
    .byte $07 ; |     XXX| $B936
    .byte $F8 ; |XXXXX   | $B937
    .byte $12 ; |   X  X | $B938
    .byte $9B ; |X  XX XX| $B939
    .byte $69 ; | XX X  X| $B93A
    .byte $E2 ; |XXX   X | $B93B
    .byte $0A ; |    X X | $B93C
    .byte $CA ; |XX  X X | $B93D
    .byte $83 ; |X     XX| $B93E
    .byte $7C ; | XXXXX  | $B93F
    .byte $F9 ; |XXXXX  X| $B940
    .byte $01 ; |       X| $B941
    .byte $7F ; | XXXXXXX| $B942
    .byte $81 ; |X      X| $B943
    .byte $B8 ; |X XXX   | $B944
    .byte $17 ; |   X XXX| $B945
    .byte $BE ; |X XXXXX | $B946
    .byte $70 ; | XXX    | $B947
    .byte $5D ; | X XXX X| $B948
    .byte $D5 ; |XX X X X| $B949
    .byte $77 ; | XXX XXX| $B94A
    .byte $7F ; | XXXXXXX| $B94B
    .byte $90 ; |X  X    | $B94C
    .byte $3E ; |  XXXXX | $B94D
    .byte $83 ; |X     XX| $B94E
    .byte $8C ; |X   XX  | $B94F
    .byte $A1 ; |X X    X| $B950
    .byte $4D ; | X  XX X| $B951
    .byte $B3 ; |X XX  XX| $B952
    .byte $29 ; |  X X  X| $B953
    .byte $9C ; |X  XXX  | $B954
    .byte $E6 ; |XXX  XX | $B955
    .byte $0C ; |    XX  | $B956
    .byte $F0 ; |XXXX    | $B957
    .byte $09 ; |    X  X| $B958
    .byte $C7 ; |XX   XXX| $B959
    .byte $2A ; |  X X X | $B95A
    .byte $E7 ; |XXX  XXX| $B95B
    .byte $26 ; |  X  XX | $B95C
    .byte $C9 ; |XX  X  X| $B95D
    .byte $A2 ; |X X   X | $B95E
    .byte $5B ; | X XX XX| $B95F
    .byte $EB ; |XXX X XX| $B960
    .byte $06 ; |     XX | $B961
    .byte $DB ; |XX XX XX| $B962
    .byte $51 ; | X X   X| $B963
    .byte $CA ; |XX  X X | $B964
    .byte $43 ; | X    XX| $B965
    .byte $8E ; |X   XXX | $B966
    .byte $54 ; | X X X  | $B967
    .byte $4E ; | X  XXX | $B968
    .byte $B6 ; |X XX XX | $B969
    .byte $98 ; |X  XX   | $B96A
    .byte $CC ; |XX  XX  | $B96B
    .byte $40 ; | X      | $B96C
    .byte $6F ; | XX XXXX| $B96D
    .byte $52 ; | X X  X | $B96E
    .byte $6E ; | XX XXX | $B96F
    .byte $92 ; |X  X  X | $B970
    .byte $7B ; | XXXX XX| $B971
    .byte $82 ; |X     X | $B972
    .byte $6A ; | XX X X | $B973
    .byte $A6 ; |X X  XX | $B974
    .byte $A9 ; |X X X  X| $B975
    .byte $AC ; |X X XX  | $B976
    .byte $50 ; | X X    | $B977
    .byte $8D ; |X   XX X| $B978
    .byte $52 ; | X X  X | $B979
    .byte $7E ; | XXXXXX | $B97A
    .byte $54 ; | X X X  | $B97B
    .byte $8D ; |X   XX X| $B97C
    .byte $34 ; |  XX X  | $B97D
    .byte $7D ; | XXXXX X| $B97E
    .byte $86 ; |X    XX | $B97F
    .byte $AB ; |X X X XX| $B980
    .byte $6D ; | XX XX X| $B981
    .byte $60 ; | XX     | $B982
    .byte $AA ; |X X X X | $B983
    .byte $62 ; | XX   X | $B984
    .byte $BA ; |X XXX X | $B985
    .byte $54 ; | X X X  | $B986
    .byte $B9 ; |X XXX  X| $B987
    .byte $45 ; | X   X X| $B988
    .byte $B9 ; |X XXX  X| $B989
    .byte $76 ; | XXX XX | $B98A
    .byte $CA ; |XX  X X | $B98B
    .byte $8D ; |X   XX X| $B98C
    .byte $30 ; |  XX    | $B98D
    .byte $D9 ; |XX XX  X| $B98E
    .byte $35 ; |  XX X X| $B98F
    .byte $C5 ; |XX   X X| $B990
    .byte $7A ; | XXXX X | $B991
    .byte $84 ; |X    X  | $B992
    .byte $7A ; | XXXX X | $B993
    .byte $76 ; | XXX XX | $B994
    .byte $A9 ; |X X X  X| $B995
    .byte $AA ; |X X X X | $B996
    .byte $BB ; |X XXX XX| $B997
    .byte $24 ; |  X  X  | $B998
    .byte $92 ; |X  X  X | $B999
    .byte $A9 ; |X X X  X| $B99A
    .byte $76 ; | XXX XX | $B99B
    .byte $96 ; |X  X XX | $B99C
    .byte $87 ; |X    XXX| $B99D
    .byte $87 ; |X    XXX| $B99E
    .byte $87 ; |X    XXX| $B99F
    .byte $87 ; |X    XXX| $B9A0
    .byte $87 ; |X    XXX| $B9A1
    .byte $98 ; |X  XX   | $B9A2
    .byte $98 ; |X  XX   | $B9A3
    .byte $78 ; | XXXX   | $B9A4
    .byte $67 ; | XX  XXX| $B9A5
    .byte $67 ; | XX  XXX| $B9A6
    .byte $77 ; | XXX XXX| $B9A7
    .byte $88 ; |X   X   | $B9A8
    .byte $88 ; |X   X   | $B9A9
    .byte $87 ; |X    XXX| $B9AA
    .byte $77 ; | XXX XXX| $B9AB
    .byte $87 ; |X    XXX| $B9AC
    .byte $88 ; |X   X   | $B9AD
    .byte $88 ; |X   X   | $B9AE
    .byte $88 ; |X   X   | $B9AF
    .byte $77 ; | XXX XXX| $B9B0
    .byte $77 ; | XXX XXX| $B9B1
    .byte $77 ; | XXX XXX| $B9B2
    .byte $87 ; |X    XXX| $B9B3
    .byte $88 ; |X   X   | $B9B4
    .byte $88 ; |X   X   | $B9B5
    .byte $78 ; | XXXX   | $B9B6
    .byte $77 ; | XXX XXX| $B9B7
    .byte $67 ; | XX  XXX| $B9B8
    .byte $88 ; |X   X   | $B9B9
    .byte $97 ; |X  X XXX| $B9BA
    .byte $97 ; |X  X XXX| $B9BB
    .byte $78 ; | XXXX   | $B9BC
    .byte $67 ; | XX  XXX| $B9BD
    .byte $77 ; | XXX XXX| $B9BE
    .byte $88 ; |X   X   | $B9BF
    .byte $88 ; |X   X   | $B9C0
    .byte $88 ; |X   X   | $B9C1
    .byte $78 ; | XXXX   | $B9C2
    .byte $77 ; | XXX XXX| $B9C3
    .byte $77 ; | XXX XXX| $B9C4
    .byte $88 ; |X   X   | $B9C5
    .byte $88 ; |X   X   | $B9C6
    .byte $88 ; |X   X   | $B9C7
    .byte $88 ; |X   X   | $B9C8
    .byte $67 ; | XX  XXX| $B9C9
    .byte $76 ; | XXX XX | $B9CA
    .byte $87 ; |X    XXX| $B9CB
    .byte $88 ; |X   X   | $B9CC
    .byte $88 ; |X   X   | $B9CD
    .byte $78 ; | XXXX   | $B9CE
    .byte $77 ; | XXX XXX| $B9CF
    .byte $77 ; | XXX XXX| $B9D0
    .byte $88 ; |X   X   | $B9D1
    .byte $88 ; |X   X   | $B9D2
    .byte $88 ; |X   X   | $B9D3
    .byte $99 ; |X  XX  X| $B9D4
    .byte $58 ; | X XX   | $B9D5
    .byte $46 ; | X   XX | $B9D6
    .byte $88 ; |X   X   | $B9D7
    .byte $89 ; |X   X  X| $B9D8
    .byte $88 ; |X   X   | $B9D9
    .byte $87 ; |X    XXX| $B9DA
    .byte $77 ; | XXX XXX| $B9DB
    .byte $76 ; | XXX XX | $B9DC
    .byte $88 ; |X   X   | $B9DD
    .byte $98 ; |X  XX   | $B9DE
    .byte $98 ; |X  XX   | $B9DF
    .byte $99 ; |X  XX  X| $B9E0
    .byte $37 ; |  XX XXX| $B9E1
    .byte $45 ; | X   X X| $B9E2
    .byte $99 ; |X  XX  X| $B9E3
    .byte $78 ; | XXXX   | $B9E4
    .byte $87 ; |X    XXX| $B9E5
    .byte $88 ; |X   X   | $B9E6
    .byte $78 ; | XXXX   | $B9E7
    .byte $76 ; | XXX XX | $B9E8
    .byte $97 ; |X  X XXX| $B9E9
    .byte $98 ; |X  XX   | $B9EA
    .byte $99 ; |X  XX  X| $B9EB
    .byte $9A ; |X  XX X | $B9EC
    .byte $34 ; |  XX X  | $B9ED
    .byte $92 ; |X  X  X | $B9EE
    .byte $B7 ; |X XX XXX| $B9EF
    .byte $85 ; |X    X X| $B9F0
    .byte $96 ; |X  X XX | $B9F1
    .byte $89 ; |X   X  X| $B9F2
    .byte $78 ; | XXXX   | $B9F3
    .byte $76 ; | XXX XX | $B9F4
    .byte $96 ; |X  X XX | $B9F5
    .byte $A7 ; |X X  XXX| $B9F6
    .byte $A9 ; |X X X  X| $B9F7
    .byte $CA ; |XX  X X | $B9F8
    .byte $15 ; |   X X X| $B9F9
    .byte $92 ; |X  X  X | $B9FA
    .byte $B7 ; |X XX XXX| $B9FB
    .byte $84 ; |X    X  | $B9FC
    .byte $A6 ; |X X  XX | $B9FD
    .byte $89 ; |X   X  X| $B9FE
    .byte $87 ; |X    XXX| $B9FF
    .byte $97 ; |X  X XXX| $BA00
    .byte $75 ; | XXX X X| $BA01
    .byte $A6 ; |X X  XX | $BA02
    .byte $A8 ; |X X X   | $BA03
    .byte $B9 ; |X XXX  X| $BA04
    .byte $6D ; | XX XX X| $BA05
    .byte $20 ; |  X     | $BA06
    .byte $7A ; | XXXX X | $BA07
    .byte $58 ; | X XX   | $BA08
    .byte $86 ; |X    XX | $BA09
    .byte $6A ; | XX X X | $BA0A
    .byte $78 ; | XXXX   | $BA0B
    .byte $89 ; |X   X  X| $BA0C
    .byte $58 ; | X XX   | $BA0D
    .byte $87 ; |X    XXX| $BA0E
    .byte $89 ; |X   X  X| $BA0F
    .byte $A9 ; |X X X  X| $BA10
    .byte $CD ; |XX  XX X| $BA11
    .byte $60 ; | XX     | $BA12
    .byte $C6 ; |XX   XX | $BA13
    .byte $82 ; |X     X | $BA14
    .byte $B6 ; |X XX XX | $BA15
    .byte $96 ; |X  X XX | $BA16
    .byte $A6 ; |X X  XX | $BA17
    .byte $97 ; |X  X XXX| $BA18
    .byte $76 ; | XXX XX | $BA19
    .byte $85 ; |X    X X| $BA1A
    .byte $78 ; | XXXX   | $BA1B
    .byte $A9 ; |X X X  X| $BA1C
    .byte $DB ; |XX XX XX| $BA1D
    .byte $18 ; |   XX   | $BA1E
    .byte $88 ; |X   X   | $BA1F
    .byte $46 ; | X   XX | $BA20
    .byte $A7 ; |X X  XXX| $BA21
    .byte $88 ; |X   X   | $BA22
    .byte $97 ; |X  X XXX| $BA23
    .byte $97 ; |X  X XXX| $BA24
    .byte $76 ; | XXX XX | $BA25
    .byte $96 ; |X  X XX | $BA26
    .byte $87 ; |X    XXX| $BA27
    .byte $98 ; |X  XX   | $BA28
    .byte $AA ; |X X X X | $BA29
    .byte $4D ; | X  XX X| $BA2A
    .byte $84 ; |X    X  | $BA2B
    .byte $4B ; | X  X XX| $BA2C
    .byte $66 ; | XX  XX | $BA2D
    .byte $5B ; | X XX XX| $BA2E
    .byte $59 ; | X XX  X| $BA2F
    .byte $6A ; | XX X X | $BA30
    .byte $6A ; | XX X X | $BA31
    .byte $58 ; | X XX   | $BA32
    .byte $78 ; | XXXX   | $BA33
    .byte $97 ; |X  X XXX| $BA34
    .byte $A8 ; |X X X   | $BA35
    .byte $CA ; |XX  X X | $BA36
    .byte $28 ; |  X X   | $BA37
    .byte $A8 ; |X X X   | $BA38
    .byte $65 ; | XX  X X| $BA39
    .byte $B6 ; |X XX XX | $BA3A
    .byte $96 ; |X  X XX | $BA3B
    .byte $A5 ; |X X  X X| $BA3C
    .byte $97 ; |X  X XXX| $BA3D
    .byte $67 ; | XX  XXX| $BA3E
    .byte $77 ; | XXX XXX| $BA3F
    .byte $78 ; | XXXX   | $BA40
    .byte $98 ; |X  XX   | $BA41
    .byte $A9 ; |X X X  X| $BA42
    .byte $BB ; |X XXX XX| $BA43
    .byte $50 ; | X X    | $BA44
    .byte $A5 ; |X X  X X| $BA45
    .byte $63 ; | XX   XX| $BA46
    .byte $78 ; | XXXX   | $BA47
    .byte $59 ; | X XX  X| $BA48
    .byte $7A ; | XXXX X | $BA49
    .byte $79 ; | XXXX  X| $BA4A
    .byte $86 ; |X    XX | $BA4B
    .byte $76 ; | XXX XX | $BA4C
    .byte $87 ; |X    XXX| $BA4D
    .byte $79 ; | XXXX  X| $BA4E
    .byte $A9 ; |X X X  X| $BA4F
    .byte $CA ; |XX  X X | $BA50
    .byte $50 ; | X X    | $BA51
    .byte $78 ; | XXXX   | $BA52
    .byte $37 ; |  XX XXX| $BA53
    .byte $7A ; | XXXX X | $BA54
    .byte $88 ; |X   X   | $BA55
    .byte $A6 ; |X X  XX | $BA56
    .byte $97 ; |X  X XXX| $BA57
    .byte $77 ; | XXX XXX| $BA58
    .byte $68 ; | XX X   | $BA59
    .byte $87 ; |X    XXX| $BA5A
    .byte $98 ; |X  XX   | $BA5B
    .byte $A9 ; |X X X  X| $BA5C
    .byte $CB ; |XX  X XX| $BA5D
    .byte $30 ; |  XX    | $BA5E
    .byte $74 ; | XXX X  | $BA5F
    .byte $48 ; | X  X   | $BA60
    .byte $78 ; | XXXX   | $BA61
    .byte $98 ; |X  XX   | $BA62
    .byte $86 ; |X    XX | $BA63
    .byte $88 ; |X   X   | $BA64
    .byte $78 ; | XXXX   | $BA65
    .byte $77 ; | XXX XXX| $BA66
    .byte $77 ; | XXX XXX| $BA67
    .byte $88 ; |X   X   | $BA68
    .byte $98 ; |X  XX   | $BA69
    .byte $A9 ; |X X X  X| $BA6A
    .byte $5A ; | X XX X | $BA6B
    .byte $45 ; | X   X X| $BA6C
    .byte $76 ; | XXX XX | $BA6D
    .byte $87 ; |X    XXX| $BA6E
    .byte $87 ; |X    XXX| $BA6F
    .byte $88 ; |X   X   | $BA70
    .byte $88 ; |X   X   | $BA71
    .byte $88 ; |X   X   | $BA72
    .byte $78 ; | XXXX   | $BA73
    .byte $77 ; | XXX XXX| $BA74
    .byte $77 ; | XXX XXX| $BA75
    .byte $87 ; |X    XXX| $BA76
    .byte $88 ; |X   X   | $BA77
    .byte $98 ; |X  XX   | $BA78
    .byte $89 ; |X   X  X| $BA79
    .byte $66 ; | XX  XX | $BA7A
    .byte $66 ; | XX  XX | $BA7B
    .byte $77 ; | XXX XXX| $BA7C
    .byte $88 ; |X   X   | $BA7D
    .byte $88 ; |X   X   | $BA7E
    .byte $88 ; |X   X   | $BA7F
    .byte $88 ; |X   X   | $BA80
    .byte $78 ; | XXXX   | $BA81
    .byte $77 ; | XXX XXX| $BA82
    .byte $77 ; | XXX XXX| $BA83
    .byte $87 ; |X    XXX| $BA84
    .byte $88 ; |X   X   | $BA85
    .byte $98 ; |X  XX   | $BA86
    .byte $89 ; |X   X  X| $BA87
    .byte $67 ; | XX  XXX| $BA88
    .byte $66 ; | XX  XX | $BA89
    .byte $77 ; | XXX XXX| $BA8A
    .byte $88 ; |X   X   | $BA8B
    .byte $88 ; |X   X   | $BA8C
    .byte $88 ; |X   X   | $BA8D
    .byte $88 ; |X   X   | $BA8E
    .byte $78 ; | XXXX   | $BA8F
    .byte $77 ; | XXX XXX| $BA90
    .byte $77 ; | XXX XXX| $BA91
    .byte $87 ; |X    XXX| $BA92
    .byte $88 ; |X   X   | $BA93
    .byte $00 ; |        | $BA94
LBA95:
    .byte $2A ; |  X X X | $BA95
    .byte $30 ; |  XX    | $BA96
    .byte $35 ; |  XX X X| $BA97
    .byte $3A ; |  XXX X | $BA98
    .byte $3F ; |  XXXXXX| $BA99
    .byte $42 ; | X    X | $BA9A
    .byte $45 ; | X   X X| $BA9B    double check here
    
    LDA    $E7             ; 3
    DEC    $E7             ; 5
    BNE    LBAA6           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LBAA6:
    LDA    #$6B            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    LDA    #0              ; 2
    STA    COLUBK          ; 3
    LDY    #0              ; 2
LBAB7:
    STA    WSYNC           ; 3
    INY                    ; 2
    CPY    #$BF            ; 2
    BNE    LBAB7           ; 2³
    LDA    #$82            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    LDA    #$9F            ; 2
    STA    $BF             ; 3
    LDA    #$F0            ; 2
    STA    $C0             ; 3
    JMP    LBFEA           ; 3
    
    .byte $00 ; |        | $BAD4
    .byte $00 ; |        | $BAD5
    .byte $00 ; |        | $BAD6
    .byte $00 ; |        | $BAD7
    .byte $00 ; |        | $BAD8
    .byte $00 ; |        | $BAD9
    .byte $00 ; |        | $BADA
    .byte $00 ; |        | $BADB
    .byte $00 ; |        | $BADC
    .byte $00 ; |        | $BADD
    .byte $00 ; |        | $BADE
    .byte $00 ; |        | $BADF
    .byte $00 ; |        | $BAE0
    .byte $00 ; |        | $BAE1
    .byte $00 ; |        | $BAE2
    .byte $00 ; |        | $BAE3
    .byte $00 ; |        | $BAE4
    .byte $00 ; |        | $BAE5
    .byte $00 ; |        | $BAE6
    .byte $00 ; |        | $BAE7
    .byte $00 ; |        | $BAE8
    .byte $00 ; |        | $BAE9
    .byte $00 ; |        | $BAEA
    .byte $00 ; |        | $BAEB
    .byte $00 ; |        | $BAEC
    .byte $00 ; |        | $BAED
    .byte $00 ; |        | $BAEE
    .byte $00 ; |        | $BAEF
    .byte $00 ; |        | $BAF0
    .byte $00 ; |        | $BAF1
    .byte $00 ; |        | $BAF2
    .byte $00 ; |        | $BAF3
    .byte $00 ; |        | $BAF4
    .byte $00 ; |        | $BAF5
    .byte $00 ; |        | $BAF6
    .byte $00 ; |        | $BAF7
    .byte $00 ; |        | $BAF8
    .byte $00 ; |        | $BAF9
    .byte $00 ; |        | $BAFA
    .byte $00 ; |        | $BAFB
    .byte $00 ; |        | $BAFC
    .byte $00 ; |        | $BAFD
    .byte $00 ; |        | $BAFE
    .byte $00 ; |        | $BAFF
    .byte $3C ; |  XXXX  | $BB00
    .byte $66 ; | XX  XX | $BB01
    .byte $66 ; | XX  XX | $BB02
    .byte $66 ; | XX  XX | $BB03
    .byte $66 ; | XX  XX | $BB04
    .byte $66 ; | XX  XX | $BB05
    .byte $3C ; |  XXXX  | $BB06
    .byte $00 ; |        | $BB07
    .byte $7E ; | XXXXXX | $BB08
    .byte $18 ; |   XX   | $BB09
    .byte $18 ; |   XX   | $BB0A
    .byte $18 ; |   XX   | $BB0B
    .byte $18 ; |   XX   | $BB0C
    .byte $78 ; | XXXX   | $BB0D
    .byte $38 ; |  XXX   | $BB0E
    .byte $00 ; |        | $BB0F
    .byte $7E ; | XXXXXX | $BB10
    .byte $60 ; | XX     | $BB11
    .byte $60 ; | XX     | $BB12
    .byte $3C ; |  XXXX  | $BB13
    .byte $06 ; |     XX | $BB14
    .byte $46 ; | X   XX | $BB15
    .byte $7C ; | XXXXX  | $BB16
    .byte $00 ; |        | $BB17
    .byte $3C ; |  XXXX  | $BB18
    .byte $46 ; | X   XX | $BB19
    .byte $06 ; |     XX | $BB1A
    .byte $0C ; |    XX  | $BB1B
    .byte $06 ; |     XX | $BB1C
    .byte $46 ; | X   XX | $BB1D
    .byte $3C ; |  XXXX  | $BB1E
    .byte $00 ; |        | $BB1F
    .byte $0C ; |    XX  | $BB20
    .byte $0C ; |    XX  | $BB21
    .byte $7E ; | XXXXXX | $BB22
    .byte $4C ; | X  XX  | $BB23
    .byte $2C ; |  X XX  | $BB24
    .byte $1C ; |   XXX  | $BB25
    .byte $0C ; |    XX  | $BB26
    .byte $00 ; |        | $BB27
    .byte $7C ; | XXXXX  | $BB28
    .byte $46 ; | X   XX | $BB29
    .byte $06 ; |     XX | $BB2A
    .byte $7C ; | XXXXX  | $BB2B
    .byte $60 ; | XX     | $BB2C
    .byte $60 ; | XX     | $BB2D
    .byte $7E ; | XXXXXX | $BB2E
    .byte $00 ; |        | $BB2F
    .byte $3C ; |  XXXX  | $BB30
    .byte $66 ; | XX  XX | $BB31
    .byte $66 ; | XX  XX | $BB32
    .byte $7C ; | XXXXX  | $BB33
    .byte $60 ; | XX     | $BB34
    .byte $62 ; | XX   X | $BB35
    .byte $3C ; |  XXXX  | $BB36
    .byte $00 ; |        | $BB37
    .byte $18 ; |   XX   | $BB38
    .byte $18 ; |   XX   | $BB39
    .byte $08 ; |    X   | $BB3A
    .byte $04 ; |     X  | $BB3B
    .byte $02 ; |      X | $BB3C
    .byte $62 ; | XX   X | $BB3D
    .byte $7E ; | XXXXXX | $BB3E
    .byte $00 ; |        | $BB3F
    .byte $3C ; |  XXXX  | $BB40
    .byte $66 ; | XX  XX | $BB41
    .byte $66 ; | XX  XX | $BB42
    .byte $3C ; |  XXXX  | $BB43
    .byte $66 ; | XX  XX | $BB44
    .byte $66 ; | XX  XX | $BB45
    .byte $3C ; |  XXXX  | $BB46
    .byte $00 ; |        | $BB47
    .byte $3C ; |  XXXX  | $BB48
    .byte $46 ; | X   XX | $BB49
    .byte $06 ; |     XX | $BB4A
    .byte $3E ; |  XXXXX | $BB4B
    .byte $66 ; | XX  XX | $BB4C
    .byte $66 ; | XX  XX | $BB4D
    .byte $3C ; |  XXXX  | $BB4E
    .byte $00 ; |        | $BB4F
    .byte $00 ; |        | $BB50
    .byte $00 ; |        | $BB51
    .byte $00 ; |        | $BB52
    .byte $00 ; |        | $BB53
    .byte $00 ; |        | $BB54
    .byte $00 ; |        | $BB55
    .byte $00 ; |        | $BB56
    .byte $00 ; |        | $BB57
    .byte $79 ; | XXXX  X| $BB58
    .byte $85 ; |X    X X| $BB59
    .byte $B5 ; |X XX X X| $BB5A
    .byte $A5 ; |X X  X X| $BB5B
    .byte $B5 ; |X XX X X| $BB5C
    .byte $85 ; |X    X X| $BB5D
    .byte $79 ; | XXXX  X| $BB5E
    .byte $17 ; |   X XXX| $BB5F
    .byte $15 ; |   X X X| $BB60
    .byte $15 ; |   X X X| $BB61
    .byte $77 ; | XXX XXX| $BB62
    .byte $55 ; | X X X X| $BB63
    .byte $55 ; | X X X X| $BB64
    .byte $77 ; | XXX XXX| $BB65
    .byte $71 ; | XXX   X| $BB66
    .byte $51 ; | X X   X| $BB67
    .byte $11 ; |   X   X| $BB68
    .byte $31 ; |  XX   X| $BB69
    .byte $11 ; |   X   X| $BB6A
    .byte $51 ; | X X   X| $BB6B
    .byte $70 ; | XXX    | $BB6C
    .byte $49 ; | X  X  X| $BB6D
    .byte $49 ; | X  X  X| $BB6E
    .byte $49 ; | X  X  X| $BB6F
    .byte $C9 ; |XX  X  X| $BB70
    .byte $49 ; | X  X  X| $BB71
    .byte $49 ; | X  X  X| $BB72
    .byte $BE ; |X XXXXX | $BB73
    .byte $55 ; | X X X X| $BB74
    .byte $55 ; | X X X X| $BB75
    .byte $55 ; | X X X X| $BB76
    .byte $D9 ; |XX XX  X| $BB77
    .byte $55 ; | X X X X| $BB78
    .byte $55 ; | X X X X| $BB79
    .byte $99 ; |X  XX  X| $BB7A
    .byte $00 ; |        | $BB7B
    .byte $00 ; |        | $BB7C
    .byte $00 ; |        | $BB7D
    .byte $00 ; |        | $BB7E
    .byte $00 ; |        | $BB7F
    .byte $00 ; |        | $BB80
    .byte $00 ; |        | $BB81
    .byte $00 ; |        | $BB82
    .byte $00 ; |        | $BB83
    .byte $00 ; |        | $BB84
    .byte $00 ; |        | $BB85
    .byte $00 ; |        | $BB86
    .byte $00 ; |        | $BB87
    .byte $00 ; |        | $BB88
    .byte $00 ; |        | $BB89
    .byte $00 ; |        | $BB8A
    .byte $00 ; |        | $BB8B
    .byte $00 ; |        | $BB8C
    .byte $00 ; |        | $BB8D
    .byte $00 ; |        | $BB8E
    .byte $00 ; |        | $BB8F
    .byte $00 ; |        | $BB90
    .byte $00 ; |        | $BB91
    .byte $00 ; |        | $BB92
    .byte $00 ; |        | $BB93
    .byte $00 ; |        | $BB94
    .byte $00 ; |        | $BB95
    .byte $00 ; |        | $BB96
    .byte $00 ; |        | $BB97
    .byte $00 ; |        | $BB98
    .byte $00 ; |        | $BB99
    .byte $00 ; |        | $BB9A
    .byte $00 ; |        | $BB9B
    .byte $00 ; |        | $BB9C
    .byte $00 ; |        | $BB9D
    .byte $00 ; |        | $BB9E
    .byte $00 ; |        | $BB9F
    .byte $00 ; |        | $BBA0
    .byte $00 ; |        | $BBA1
    .byte $00 ; |        | $BBA2
    .byte $00 ; |        | $BBA3
    .byte $00 ; |        | $BBA4
    .byte $00 ; |        | $BBA5
    .byte $00 ; |        | $BBA6
    .byte $00 ; |        | $BBA7
    .byte $00 ; |        | $BBA8
    .byte $00 ; |        | $BBA9
    .byte $00 ; |        | $BBAA
    .byte $00 ; |        | $BBAB
    .byte $00 ; |        | $BBAC
    .byte $00 ; |        | $BBAD
    .byte $00 ; |        | $BBAE
    .byte $00 ; |        | $BBAF
    .byte $00 ; |        | $BBB0
    .byte $00 ; |        | $BBB1
    .byte $00 ; |        | $BBB2
    .byte $00 ; |        | $BBB3
    .byte $00 ; |        | $BBB4
    .byte $00 ; |        | $BBB5
    .byte $00 ; |        | $BBB6
    .byte $00 ; |        | $BBB7
    .byte $00 ; |        | $BBB8
    .byte $00 ; |        | $BBB9
    .byte $00 ; |        | $BBBA
    .byte $00 ; |        | $BBBB
    .byte $00 ; |        | $BBBC
    .byte $00 ; |        | $BBBD
    .byte $00 ; |        | $BBBE
    .byte $00 ; |        | $BBBF
    .byte $00 ; |        | $BBC0
    .byte $00 ; |        | $BBC1
    .byte $00 ; |        | $BBC2
    .byte $00 ; |        | $BBC3
    .byte $00 ; |        | $BBC4
    .byte $00 ; |        | $BBC5
    .byte $00 ; |        | $BBC6
    .byte $00 ; |        | $BBC7
    .byte $00 ; |        | $BBC8
    .byte $00 ; |        | $BBC9
    .byte $00 ; |        | $BBCA
    .byte $00 ; |        | $BBCB
    .byte $00 ; |        | $BBCC
    .byte $00 ; |        | $BBCD
    .byte $00 ; |        | $BBCE
    .byte $00 ; |        | $BBCF
    .byte $00 ; |        | $BBD0
    .byte $00 ; |        | $BBD1
    .byte $00 ; |        | $BBD2
    .byte $00 ; |        | $BBD3
    .byte $00 ; |        | $BBD4
    .byte $00 ; |        | $BBD5
    .byte $00 ; |        | $BBD6
    .byte $00 ; |        | $BBD7
    .byte $00 ; |        | $BBD8
    .byte $00 ; |        | $BBD9
    .byte $00 ; |        | $BBDA
    .byte $00 ; |        | $BBDB
    .byte $00 ; |        | $BBDC
    .byte $00 ; |        | $BBDD
    .byte $00 ; |        | $BBDE
    .byte $00 ; |        | $BBDF
    .byte $00 ; |        | $BBE0
    .byte $00 ; |        | $BBE1
    .byte $00 ; |        | $BBE2
    .byte $00 ; |        | $BBE3
    .byte $00 ; |        | $BBE4
    .byte $00 ; |        | $BBE5
    .byte $00 ; |        | $BBE6
    .byte $00 ; |        | $BBE7
    .byte $00 ; |        | $BBE8
    .byte $00 ; |        | $BBE9
    .byte $00 ; |        | $BBEA
    .byte $00 ; |        | $BBEB
    .byte $00 ; |        | $BBEC
    .byte $00 ; |        | $BBED
    .byte $00 ; |        | $BBEE
    .byte $00 ; |        | $BBEF
    .byte $00 ; |        | $BBF0
    .byte $00 ; |        | $BBF1
    .byte $00 ; |        | $BBF2
    .byte $00 ; |        | $BBF3
    .byte $00 ; |        | $BBF4
    .byte $00 ; |        | $BBF5
    .byte $00 ; |        | $BBF6
    .byte $00 ; |        | $BBF7
    .byte $00 ; |        | $BBF8
    .byte $00 ; |        | $BBF9
    .byte $00 ; |        | $BBFA
    .byte $00 ; |        | $BBFB
    .byte $00 ; |        | $BBFC
    .byte $00 ; |        | $BBFD
    .byte $00 ; |        | $BBFE
    .byte $00 ; |        | $BBFF
LBC00:
    .byte $00 ; |        | $BC00
    .byte $00 ; |        | $BC01
    .byte $00 ; |        | $BC02
    .byte $00 ; |        | $BC03
    .byte $00 ; |        | $BC04
    .byte $00 ; |        | $BC05
    .byte $00 ; |        | $BC06
    .byte $00 ; |        | $BC07
    .byte $00 ; |        | $BC08
    .byte $00 ; |        | $BC09
    .byte $00 ; |        | $BC0A
    .byte $00 ; |        | $BC0B
    .byte $00 ; |        | $BC0C
    .byte $00 ; |        | $BC0D
    .byte $00 ; |        | $BC0E
    .byte $00 ; |        | $BC0F
    .byte $00 ; |        | $BC10
    .byte $00 ; |        | $BC11
    .byte $00 ; |        | $BC12
    .byte $00 ; |        | $BC13
    .byte $00 ; |        | $BC14
    .byte $00 ; |        | $BC15
    .byte $00 ; |        | $BC16
    .byte $00 ; |        | $BC17
    .byte $00 ; |        | $BC18
    .byte $00 ; |        | $BC19
    .byte $00 ; |        | $BC1A
    .byte $00 ; |        | $BC1B
    .byte $01 ; |       X| $BC1C
    .byte $01 ; |       X| $BC1D
    .byte $01 ; |       X| $BC1E
    .byte $01 ; |       X| $BC1F
    .byte $03 ; |      XX| $BC20
    .byte $03 ; |      XX| $BC21
    .byte $03 ; |      XX| $BC22
    .byte $03 ; |      XX| $BC23
    .byte $07 ; |     XXX| $BC24
    .byte $07 ; |     XXX| $BC25
    .byte $07 ; |     XXX| $BC26
    .byte $07 ; |     XXX| $BC27
    .byte $0F ; |    XXXX| $BC28
    .byte $0F ; |    XXXX| $BC29
    .byte $0F ; |    XXXX| $BC2A
    .byte $0F ; |    XXXX| $BC2B
    .byte $1F ; |   XXXXX| $BC2C
    .byte $1F ; |   XXXXX| $BC2D
    .byte $1F ; |   XXXXX| $BC2E
    .byte $1F ; |   XXXXX| $BC2F
    .byte $3F ; |  XXXXXX| $BC30
    .byte $3F ; |  XXXXXX| $BC31
    .byte $3F ; |  XXXXXX| $BC32
    .byte $3F ; |  XXXXXX| $BC33
    .byte $7F ; | XXXXXXX| $BC34
    .byte $7F ; | XXXXXXX| $BC35
    .byte $7F ; | XXXXXXX| $BC36
    .byte $7F ; | XXXXXXX| $BC37
    .byte $FF ; |XXXXXXXX| $BC38
    .byte $FF ; |XXXXXXXX| $BC39
    .byte $FF ; |XXXXXXXX| $BC3A
    .byte $FF ; |XXXXXXXX| $BC3B
    .byte $FF ; |XXXXXXXX| $BC3C
    .byte $FF ; |XXXXXXXX| $BC3D
    .byte $FF ; |XXXXXXXX| $BC3E
    .byte $FF ; |XXXXXXXX| $BC3F
    .byte $80 ; |X       | $BC40
    .byte $80 ; |X       | $BC41
    .byte $40 ; | X      | $BC42
    .byte $40 ; | X      | $BC43
    .byte $80 ; |X       | $BC44
    .byte $80 ; |X       | $BC45
    .byte $40 ; | X      | $BC46
    .byte $40 ; | X      | $BC47
    .byte $80 ; |X       | $BC48
    .byte $80 ; |X       | $BC49
    .byte $40 ; | X      | $BC4A
    .byte $40 ; | X      | $BC4B
    .byte $80 ; |X       | $BC4C
    .byte $80 ; |X       | $BC4D
    .byte $40 ; | X      | $BC4E
    .byte $40 ; | X      | $BC4F
    .byte $80 ; |X       | $BC50
    .byte $80 ; |X       | $BC51
    .byte $40 ; | X      | $BC52
    .byte $40 ; | X      | $BC53
    .byte $80 ; |X       | $BC54
    .byte $80 ; |X       | $BC55
    .byte $40 ; | X      | $BC56
    .byte $40 ; | X      | $BC57
    .byte $80 ; |X       | $BC58
    .byte $80 ; |X       | $BC59
    .byte $40 ; | X      | $BC5A
    .byte $40 ; | X      | $BC5B
    .byte $80 ; |X       | $BC5C
    .byte $80 ; |X       | $BC5D
    .byte $40 ; | X      | $BC5E
    .byte $40 ; | X      | $BC5F
    .byte $80 ; |X       | $BC60
    .byte $80 ; |X       | $BC61
    .byte $40 ; | X      | $BC62
    .byte $40 ; | X      | $BC63
    .byte $80 ; |X       | $BC64
    .byte $80 ; |X       | $BC65
    .byte $40 ; | X      | $BC66
    .byte $40 ; | X      | $BC67
    .byte $80 ; |X       | $BC68
    .byte $80 ; |X       | $BC69
    .byte $40 ; | X      | $BC6A
    .byte $40 ; | X      | $BC6B
    .byte $80 ; |X       | $BC6C
    .byte $80 ; |X       | $BC6D
    .byte $40 ; | X      | $BC6E
    .byte $40 ; | X      | $BC6F
    .byte $80 ; |X       | $BC70
    .byte $80 ; |X       | $BC71
    .byte $40 ; | X      | $BC72
    .byte $FF ; |XXXXXXXX| $BC73
    .byte $FF ; |XXXXXXXX| $BC74
    .byte $FF ; |XXXXXXXX| $BC75
    .byte $FF ; |XXXXXXXX| $BC76
    .byte $FF ; |XXXXXXXX| $BC77
    .byte $FF ; |XXXXXXXX| $BC78
    .byte $FF ; |XXXXXXXX| $BC79
    .byte $FF ; |XXXXXXXX| $BC7A
    .byte $7F ; | XXXXXXX| $BC7B
    .byte $7F ; | XXXXXXX| $BC7C
    .byte $7F ; | XXXXXXX| $BC7D
    .byte $7F ; | XXXXXXX| $BC7E
    .byte $3F ; |  XXXXXX| $BC7F
    .byte $3F ; |  XXXXXX| $BC80
    .byte $3F ; |  XXXXXX| $BC81
    .byte $3F ; |  XXXXXX| $BC82
    .byte $1F ; |   XXXXX| $BC83
    .byte $1F ; |   XXXXX| $BC84
    .byte $1F ; |   XXXXX| $BC85
    .byte $1F ; |   XXXXX| $BC86
    .byte $0F ; |    XXXX| $BC87
    .byte $0F ; |    XXXX| $BC88
    .byte $0F ; |    XXXX| $BC89
    .byte $0F ; |    XXXX| $BC8A
    .byte $07 ; |     XXX| $BC8B
    .byte $07 ; |     XXX| $BC8C
    .byte $07 ; |     XXX| $BC8D
    .byte $07 ; |     XXX| $BC8E
    .byte $03 ; |      XX| $BC8F
    .byte $03 ; |      XX| $BC90
    .byte $03 ; |      XX| $BC91
    .byte $03 ; |      XX| $BC92
    .byte $01 ; |       X| $BC93
    .byte $01 ; |       X| $BC94
    .byte $01 ; |       X| $BC95
    .byte $01 ; |       X| $BC96
    .byte $00 ; |        | $BC97
    .byte $00 ; |        | $BC98
    .byte $00 ; |        | $BC99
    .byte $00 ; |        | $BC9A
    .byte $00 ; |        | $BC9B
    .byte $00 ; |        | $BC9C
    .byte $00 ; |        | $BC9D
    .byte $00 ; |        | $BC9E
    .byte $00 ; |        | $BC9F
    .byte $00 ; |        | $BCA0
    .byte $00 ; |        | $BCA1
    .byte $00 ; |        | $BCA2
    .byte $00 ; |        | $BCA3
    .byte $00 ; |        | $BCA4
    .byte $00 ; |        | $BCA5
    .byte $00 ; |        | $BCA6
    .byte $00 ; |        | $BCA7
    .byte $00 ; |        | $BCA8
    .byte $00 ; |        | $BCA9
    .byte $00 ; |        | $BCAA
    .byte $00 ; |        | $BCAB
    .byte $00 ; |        | $BCAC
    .byte $00 ; |        | $BCAD
    .byte $00 ; |        | $BCAE
    .byte $00 ; |        | $BCAF
    .byte $00 ; |        | $BCB0
    .byte $00 ; |        | $BCB1
    .byte $00 ; |        | $BCB2
    .byte $00 ; |        | $BCB3
    .byte $00 ; |        | $BCB4
    .byte $00 ; |        | $BCB5
    .byte $00 ; |        | $BCB6
    .byte $00 ; |        | $BCB7
    .byte $00 ; |        | $BCB8
    .byte $00 ; |        | $BCB9
    .byte $00 ; |        | $BCBA
    .byte $00 ; |        | $BCBB
    .byte $00 ; |        | $BCBC
    .byte $00 ; |        | $BCBD
    .byte $00 ; |        | $BCBE
    .byte $00 ; |        | $BCBF
    .byte $00 ; |        | $BCC0
    .byte $00 ; |        | $BCC1
    .byte $00 ; |        | $BCC2
    .byte $00 ; |        | $BCC3
    .byte $00 ; |        | $BCC4
    .byte $00 ; |        | $BCC5
    .byte $00 ; |        | $BCC6
    .byte $00 ; |        | $BCC7
    .byte $00 ; |        | $BCC8
    .byte $00 ; |        | $BCC9
    .byte $00 ; |        | $BCCA
    .byte $00 ; |        | $BCCB
    .byte $00 ; |        | $BCCC
    .byte $00 ; |        | $BCCD
    .byte $00 ; |        | $BCCE
    .byte $00 ; |        | $BCCF
    .byte $00 ; |        | $BCD0
    .byte $00 ; |        | $BCD1
    .byte $00 ; |        | $BCD2
    .byte $00 ; |        | $BCD3
    .byte $00 ; |        | $BCD4
    .byte $00 ; |        | $BCD5
    .byte $00 ; |        | $BCD6
    .byte $00 ; |        | $BCD7
    .byte $00 ; |        | $BCD8
    .byte $00 ; |        | $BCD9
    .byte $00 ; |        | $BCDA
    .byte $00 ; |        | $BCDB
    .byte $00 ; |        | $BCDC
    .byte $00 ; |        | $BCDD
    .byte $00 ; |        | $BCDE
    .byte $00 ; |        | $BCDF
    .byte $00 ; |        | $BCE0
    .byte $00 ; |        | $BCE1
    .byte $00 ; |        | $BCE2
    .byte $00 ; |        | $BCE3
    .byte $00 ; |        | $BCE4
    .byte $00 ; |        | $BCE5
    .byte $00 ; |        | $BCE6
    .byte $00 ; |        | $BCE7
    .byte $00 ; |        | $BCE8
    .byte $00 ; |        | $BCE9
    .byte $00 ; |        | $BCEA
    .byte $00 ; |        | $BCEB
    .byte $00 ; |        | $BCEC
    .byte $00 ; |        | $BCED
    .byte $00 ; |        | $BCEE
    .byte $00 ; |        | $BCEF
    .byte $00 ; |        | $BCF0
    .byte $00 ; |        | $BCF1
    .byte $00 ; |        | $BCF2
    .byte $00 ; |        | $BCF3
    .byte $00 ; |        | $BCF4
    .byte $00 ; |        | $BCF5
    .byte $00 ; |        | $BCF6
    .byte $00 ; |        | $BCF7
    .byte $00 ; |        | $BCF8
    .byte $00 ; |        | $BCF9
    .byte $00 ; |        | $BCFA
    .byte $00 ; |        | $BCFB
    .byte $00 ; |        | $BCFC
    .byte $00 ; |        | $BCFD
    .byte $00 ; |        | $BCFE
    .byte $00 ; |        | $BCFF
LBD00:
    .byte $00 ; |        | $BD00
    .byte $00 ; |        | $BD01
    .byte $00 ; |        | $BD02
    .byte $00 ; |        | $BD03
    .byte $00 ; |        | $BD04
    .byte $00 ; |        | $BD05
    .byte $00 ; |        | $BD06
    .byte $00 ; |        | $BD07
    .byte $00 ; |        | $BD08
    .byte $00 ; |        | $BD09
    .byte $00 ; |        | $BD0A
    .byte $00 ; |        | $BD0B
    .byte $00 ; |        | $BD0C
    .byte $00 ; |        | $BD0D
    .byte $00 ; |        | $BD0E
    .byte $00 ; |        | $BD0F
    .byte $00 ; |        | $BD10
    .byte $00 ; |        | $BD11
    .byte $00 ; |        | $BD12
    .byte $00 ; |        | $BD13
    .byte $06 ; |     XX | $BD14
    .byte $06 ; |     XX | $BD15
    .byte $06 ; |     XX | $BD16
    .byte $06 ; |     XX | $BD17
    .byte $07 ; |     XXX| $BD18
    .byte $07 ; |     XXX| $BD19
    .byte $07 ; |     XXX| $BD1A
    .byte $07 ; |     XXX| $BD1B
    .byte $07 ; |     XXX| $BD1C
    .byte $07 ; |     XXX| $BD1D
    .byte $07 ; |     XXX| $BD1E
    .byte $07 ; |     XXX| $BD1F
    .byte $07 ; |     XXX| $BD20
    .byte $07 ; |     XXX| $BD21
    .byte $07 ; |     XXX| $BD22
    .byte $07 ; |     XXX| $BD23
    .byte $07 ; |     XXX| $BD24
    .byte $07 ; |     XXX| $BD25
    .byte $07 ; |     XXX| $BD26
    .byte $07 ; |     XXX| $BD27
    .byte $07 ; |     XXX| $BD28
    .byte $07 ; |     XXX| $BD29
    .byte $07 ; |     XXX| $BD2A
    .byte $07 ; |     XXX| $BD2B
    .byte $07 ; |     XXX| $BD2C
    .byte $07 ; |     XXX| $BD2D
    .byte $07 ; |     XXX| $BD2E
    .byte $07 ; |     XXX| $BD2F
    .byte $07 ; |     XXX| $BD30
    .byte $07 ; |     XXX| $BD31
    .byte $07 ; |     XXX| $BD32
    .byte $07 ; |     XXX| $BD33
    .byte $07 ; |     XXX| $BD34
    .byte $07 ; |     XXX| $BD35
    .byte $07 ; |     XXX| $BD36
    .byte $07 ; |     XXX| $BD37
    .byte $07 ; |     XXX| $BD38
    .byte $07 ; |     XXX| $BD39
    .byte $07 ; |     XXX| $BD3A
    .byte $07 ; |     XXX| $BD3B
    .byte $07 ; |     XXX| $BD3C
    .byte $07 ; |     XXX| $BD3D
    .byte $07 ; |     XXX| $BD3E
    .byte $07 ; |     XXX| $BD3F
    .byte $00 ; |        | $BD40
    .byte $00 ; |        | $BD41
    .byte $00 ; |        | $BD42
    .byte $00 ; |        | $BD43
    .byte $00 ; |        | $BD44
    .byte $00 ; |        | $BD45
    .byte $00 ; |        | $BD46
    .byte $00 ; |        | $BD47
    .byte $00 ; |        | $BD48
    .byte $00 ; |        | $BD49
    .byte $00 ; |        | $BD4A
    .byte $00 ; |        | $BD4B
    .byte $00 ; |        | $BD4C
    .byte $00 ; |        | $BD4D
    .byte $00 ; |        | $BD4E
    .byte $00 ; |        | $BD4F
    .byte $00 ; |        | $BD50
    .byte $80 ; |X       | $BD51
    .byte $80 ; |X       | $BD52
    .byte $C0 ; |XX      | $BD53
    .byte $C0 ; |XX      | $BD54
    .byte $E0 ; |XXX     | $BD55
    .byte $E0 ; |XXX     | $BD56
    .byte $40 ; | X      | $BD57
    .byte $40 ; | X      | $BD58
    .byte $E0 ; |XXX     | $BD59
    .byte $E0 ; |XXX     | $BD5A
    .byte $C0 ; |XX      | $BD5B
    .byte $C0 ; |XX      | $BD5C
    .byte $80 ; |X       | $BD5D
    .byte $80 ; |X       | $BD5E
    .byte $00 ; |        | $BD5F
    .byte $00 ; |        | $BD60
    .byte $00 ; |        | $BD61
    .byte $00 ; |        | $BD62
    .byte $00 ; |        | $BD63
    .byte $00 ; |        | $BD64
    .byte $00 ; |        | $BD65
    .byte $00 ; |        | $BD66
    .byte $00 ; |        | $BD67
    .byte $00 ; |        | $BD68
    .byte $00 ; |        | $BD69
    .byte $00 ; |        | $BD6A
    .byte $00 ; |        | $BD6B
    .byte $00 ; |        | $BD6C
    .byte $00 ; |        | $BD6D
    .byte $00 ; |        | $BD6E
    .byte $00 ; |        | $BD6F
    .byte $00 ; |        | $BD70
    .byte $00 ; |        | $BD71
    .byte $00 ; |        | $BD72
    .byte $00 ; |        | $BD73
    .byte $07 ; |     XXX| $BD74
    .byte $07 ; |     XXX| $BD75
    .byte $07 ; |     XXX| $BD76
    .byte $07 ; |     XXX| $BD77
    .byte $07 ; |     XXX| $BD78
    .byte $07 ; |     XXX| $BD79
    .byte $07 ; |     XXX| $BD7A
    .byte $07 ; |     XXX| $BD7B
    .byte $07 ; |     XXX| $BD7C
    .byte $07 ; |     XXX| $BD7D
    .byte $07 ; |     XXX| $BD7E
    .byte $07 ; |     XXX| $BD7F
    .byte $07 ; |     XXX| $BD80
    .byte $07 ; |     XXX| $BD81
    .byte $07 ; |     XXX| $BD82
    .byte $07 ; |     XXX| $BD83
    .byte $07 ; |     XXX| $BD84
    .byte $07 ; |     XXX| $BD85
    .byte $07 ; |     XXX| $BD86
    .byte $07 ; |     XXX| $BD87
    .byte $07 ; |     XXX| $BD88
    .byte $07 ; |     XXX| $BD89
    .byte $07 ; |     XXX| $BD8A
    .byte $07 ; |     XXX| $BD8B
    .byte $07 ; |     XXX| $BD8C
    .byte $07 ; |     XXX| $BD8D
    .byte $07 ; |     XXX| $BD8E
    .byte $07 ; |     XXX| $BD8F
    .byte $07 ; |     XXX| $BD90
    .byte $07 ; |     XXX| $BD91
    .byte $07 ; |     XXX| $BD92
    .byte $07 ; |     XXX| $BD93
    .byte $07 ; |     XXX| $BD94
    .byte $07 ; |     XXX| $BD95
    .byte $07 ; |     XXX| $BD96
    .byte $07 ; |     XXX| $BD97
    .byte $07 ; |     XXX| $BD98
    .byte $07 ; |     XXX| $BD99
    .byte $07 ; |     XXX| $BD9A
    .byte $07 ; |     XXX| $BD9B
    .byte $06 ; |     XX | $BD9C
    .byte $06 ; |     XX | $BD9D
    .byte $06 ; |     XX | $BD9E
    .byte $06 ; |     XX | $BD9F
    .byte $00 ; |        | $BDA0
    .byte $00 ; |        | $BDA1
    .byte $00 ; |        | $BDA2
    .byte $00 ; |        | $BDA3
    .byte $00 ; |        | $BDA4
    .byte $00 ; |        | $BDA5
    .byte $00 ; |        | $BDA6
    .byte $00 ; |        | $BDA7
    .byte $00 ; |        | $BDA8
    .byte $00 ; |        | $BDA9
    .byte $00 ; |        | $BDAA
    .byte $00 ; |        | $BDAB
    .byte $00 ; |        | $BDAC
    .byte $00 ; |        | $BDAD
    .byte $00 ; |        | $BDAE
    .byte $00 ; |        | $BDAF
    .byte $00 ; |        | $BDB0
    .byte $00 ; |        | $BDB1
    .byte $00 ; |        | $BDB2
    .byte $00 ; |        | $BDB3
    .byte $00 ; |        | $BDB4
    .byte $00 ; |        | $BDB5
    .byte $00 ; |        | $BDB6
    .byte $00 ; |        | $BDB7
    .byte $00 ; |        | $BDB8
    .byte $00 ; |        | $BDB9
    .byte $00 ; |        | $BDBA
    .byte $00 ; |        | $BDBB
    .byte $00 ; |        | $BDBC
    .byte $00 ; |        | $BDBD
    .byte $00 ; |        | $BDBE
    .byte $00 ; |        | $BDBF
LBDC0:
    .byte $28 ; |  X X   | $BDC0
    .byte $7C ; | XXXXX  | $BDC1
    .byte $38 ; |  XXX   | $BDC2
    .byte $7C ; | XXXXX  | $BDC3
    .byte $28 ; |  X X   | $BDC4
    .byte $00 ; |        | $BDC5
LBDC6:
    .byte $EE ; |XXX XXX | $BDC6
    .byte $C6 ; |XX   XX | $BDC7
    .byte $38 ; |  XXX   | $BDC8
    .byte $7C ; | XXXXX  | $BDC9
    .byte $38 ; |  XXX   | $BDCA
    .byte $C6 ; |XX   XX | $BDCB
    .byte $EE ; |XXX XXX | $BDCC
    .byte $00 ; |        | $BDCD
    .byte $01 ; |       X| $BDCE
    .byte $EE ; |XXX XXX | $BDCF
    .byte $D6 ; |XX X XX | $BDD0
    .byte $7C ; | XXXXX  | $BDD1
    .byte $D6 ; |XX X XX | $BDD2
    .byte $EE ; |XXX XXX | $BDD3
    .byte $00 ; |        | $BDD4
    .byte $00 ; |        | $BDD5
    .byte $01 ; |       X| $BDD6
    .byte $01 ; |       X| $BDD7
    .byte $FE ; |XXXXXXX | $BDD8
    .byte $38 ; |  XXX   | $BDD9
    .byte $FE ; |XXXXXXX | $BDDA
    .byte $00 ; |        | $BDDB
    .byte $00 ; |        | $BDDC
    .byte $00 ; |        | $BDDD
    .byte $EE ; |XXX XXX | $BDDE
    .byte $C6 ; |XX   XX | $BDDF
    .byte $38 ; |  XXX   | $BDE0
    .byte $7C ; | XXXXX  | $BDE1
    .byte $38 ; |  XXX   | $BDE2
    .byte $C6 ; |XX   XX | $BDE3
    .byte $EE ; |XXX XXX | $BDE4
    .byte $00 ; |        | $BDE5
    .byte $92 ; |X  X  X | $BDE6
    .byte $54 ; | X X X  | $BDE7
    .byte $38 ; |  XXX   | $BDE8
    .byte $FE ; |XXXXXXX | $BDE9
    .byte $38 ; |  XXX   | $BDEA
    .byte $54 ; | X X X  | $BDEB
    .byte $92 ; |X  X  X | $BDEC
    .byte $00 ; |        | $BDED
    .byte $82 ; |X     X | $BDEE
    .byte $44 ; | X   X  | $BDEF
    .byte $28 ; |  X X   | $BDF0
    .byte $EE ; |XXX XXX | $BDF1
    .byte $28 ; |  X X   | $BDF2
    .byte $44 ; | X   X  | $BDF3
    .byte $82 ; |X     X | $BDF4
    .byte $00 ; |        | $BDF5
    .byte $82 ; |X     X | $BDF6
    .byte $44 ; | X   X  | $BDF7
    .byte $01 ; |       X| $BDF8
    .byte $C6 ; |XX   XX | $BDF9
    .byte $01 ; |       X| $BDFA
    .byte $44 ; | X   X  | $BDFB
    .byte $82 ; |X     X | $BDFC
    .byte $00 ; |        | $BDFD
    .byte $92 ; |X  X  X | $BDFE
    .byte $54 ; | X X X  | $BDFF
    .byte $38 ; |  XXX   | $BE00
    .byte $FE ; |XXXXXXX | $BE01
    .byte $38 ; |  XXX   | $BE02
    .byte $54 ; | X X X  | $BE03
    .byte $92 ; |X  X  X | $BE04
    .byte $00 ; |        | $BE05
    .byte $18 ; |   XX   | $BE06
    .byte $3C ; |  XXXX  | $BE07
    .byte $76 ; | XXX XX | $BE08
    .byte $3C ; |  XXXX  | $BE09
    .byte $18 ; |   XX   | $BE0A
    .byte $00 ; |        | $BE0B
    .byte $00 ; |        | $BE0C
    .byte $00 ; |        | $BE0D
    .byte $18 ; |   XX   | $BE0E
    .byte $3C ; |  XXXX  | $BE0F
    .byte $5E ; | X XXXX | $BE10
    .byte $3C ; |  XXXX  | $BE11
    .byte $18 ; |   XX   | $BE12
    .byte $00 ; |        | $BE13
    .byte $00 ; |        | $BE14
    .byte $00 ; |        | $BE15
    .byte $18 ; |   XX   | $BE16
    .byte $3C ; |  XXXX  | $BE17
    .byte $6E ; | XX XXX | $BE18
    .byte $3C ; |  XXXX  | $BE19
    .byte $18 ; |   XX   | $BE1A
    .byte $00 ; |        | $BE1B
    .byte $00 ; |        | $BE1C
    .byte $00 ; |        | $BE1D
    .byte $18 ; |   XX   | $BE1E
    .byte $3C ; |  XXXX  | $BE1F
    .byte $76 ; | XXX XX | $BE20
    .byte $3C ; |  XXXX  | $BE21
    .byte $18 ; |   XX   | $BE22
    .byte $00 ; |        | $BE23
    .byte $00 ; |        | $BE24
    .byte $00 ; |        | $BE25
    .byte $7C ; | XXXXX  | $BE26
    .byte $FE ; |XXXXXXX | $BE27
    .byte $BA ; |X XXX X | $BE28
    .byte $FE ; |XXXXXXX | $BE29
    .byte $BA ; |X XXX X | $BE2A
    .byte $FE ; |XXXXXXX | $BE2B
    .byte $7C ; | XXXXX  | $BE2C
    .byte $00 ; |        | $BE2D
    .byte $FE ; |XXXXXXX | $BE2E
    .byte $7C ; | XXXXX  | $BE2F
    .byte $38 ; |  XXX   | $BE30
    .byte $7C ; | XXXXX  | $BE31
    .byte $38 ; |  XXX   | $BE32
    .byte $7C ; | XXXXX  | $BE33
    .byte $FE ; |XXXXXXX | $BE34
    .byte $00 ; |        | $BE35
    .byte $7C ; | XXXXX  | $BE36
    .byte $FE ; |XXXXXXX | $BE37
    .byte $FE ; |XXXXXXX | $BE38
    .byte $D6 ; |XX X XX | $BE39
    .byte $FE ; |XXXXXXX | $BE3A
    .byte $FE ; |XXXXXXX | $BE3B
    .byte $7C ; | XXXXX  | $BE3C
    .byte $00 ; |        | $BE3D
    .byte $7C ; | XXXXX  | $BE3E
    .byte $FE ; |XXXXXXX | $BE3F
    .byte $BA ; |X XXX X | $BE40
    .byte $FE ; |XXXXXXX | $BE41
    .byte $BA ; |X XXX X | $BE42
    .byte $FE ; |XXXXXXX | $BE43
    .byte $7C ; | XXXXX  | $BE44
    .byte $00 ; |        | $BE45
    .byte $D6 ; |XX X XX | $BE46
    .byte $38 ; |  XXX   | $BE47
    .byte $FE ; |XXXXXXX | $BE48
    .byte $6C ; | XX XX  | $BE49
    .byte $FE ; |XXXXXXX | $BE4A
    .byte $38 ; |  XXX   | $BE4B
    .byte $D6 ; |XX X XX | $BE4C
    .byte $00 ; |        | $BE4D
    .byte $6C ; | XX XX  | $BE4E
    .byte $38 ; |  XXX   | $BE4F
    .byte $7C ; | XXXXX  | $BE50
    .byte $EE ; |XXX XXX | $BE51
    .byte $7C ; | XXXXX  | $BE52
    .byte $38 ; |  XXX   | $BE53
    .byte $6C ; | XX XX  | $BE54
    .byte $00 ; |        | $BE55
    .byte $7C ; | XXXXX  | $BE56
    .byte $6C ; | XX XX  | $BE57
    .byte $54 ; | X X X  | $BE58
    .byte $FE ; |XXXXXXX | $BE59
    .byte $54 ; | X X X  | $BE5A
    .byte $6C ; | XX XX  | $BE5B
    .byte $7C ; | XXXXX  | $BE5C
    .byte $00 ; |        | $BE5D
    .byte $D6 ; |XX X XX | $BE5E
    .byte $38 ; |  XXX   | $BE5F
    .byte $FE ; |XXXXXXX | $BE60
    .byte $6C ; | XX XX  | $BE61
    .byte $FE ; |XXXXXXX | $BE62
    .byte $38 ; |  XXX   | $BE63
    .byte $D6 ; |XX X XX | $BE64
    .byte $00 ; |        | $BE65
    .byte $FE ; |XXXXXXX | $BE66
    .byte $FE ; |XXXXXXX | $BE67
    .byte $38 ; |  XXX   | $BE68
    .byte $FE ; |XXXXXXX | $BE69
    .byte $FE ; |XXXXXXX | $BE6A
    .byte $38 ; |  XXX   | $BE6B
    .byte $FE ; |XXXXXXX | $BE6C
    .byte $00 ; |        | $BE6D
    .byte $FE ; |XXXXXXX | $BE6E
    .byte $FE ; |XXXXXXX | $BE6F
    .byte $6C ; | XX XX  | $BE70
    .byte $FE ; |XXXXXXX | $BE71
    .byte $FE ; |XXXXXXX | $BE72
    .byte $6C ; | XX XX  | $BE73
    .byte $FE ; |XXXXXXX | $BE74
    .byte $00 ; |        | $BE75
    .byte $FE ; |XXXXXXX | $BE76
    .byte $FE ; |XXXXXXX | $BE77
    .byte $C6 ; |XX   XX | $BE78
    .byte $FE ; |XXXXXXX | $BE79
    .byte $FE ; |XXXXXXX | $BE7A
    .byte $C6 ; |XX   XX | $BE7B
    .byte $FE ; |XXXXXXX | $BE7C
    .byte $00 ; |        | $BE7D
    .byte $FE ; |XXXXXXX | $BE7E
    .byte $FE ; |XXXXXXX | $BE7F
    .byte $38 ; |  XXX   | $BE80
    .byte $FE ; |XXXXXXX | $BE81
    .byte $FE ; |XXXXXXX | $BE82
    .byte $38 ; |  XXX   | $BE83
    .byte $FE ; |XXXXXXX | $BE84
    .byte $00 ; |        | $BE85
    .byte $00 ; |        | $BE86
    .byte $00 ; |        | $BE87
    .byte $00 ; |        | $BE88
    .byte $00 ; |        | $BE89
    .byte $00 ; |        | $BE8A
    .byte $00 ; |        | $BE8B
    .byte $00 ; |        | $BE8C
    .byte $00 ; |        | $BE8D
    .byte $00 ; |        | $BE8E
    .byte $00 ; |        | $BE8F
    .byte $00 ; |        | $BE90
    .byte $00 ; |        | $BE91
    .byte $00 ; |        | $BE92
    .byte $00 ; |        | $BE93
    .byte $00 ; |        | $BE94
    .byte $00 ; |        | $BE95
    .byte $00 ; |        | $BE96
    .byte $00 ; |        | $BE97
    .byte $00 ; |        | $BE98
    .byte $00 ; |        | $BE99
    .byte $00 ; |        | $BE9A
    .byte $00 ; |        | $BE9B
    .byte $00 ; |        | $BE9C
    .byte $00 ; |        | $BE9D
    .byte $00 ; |        | $BE9E
    .byte $00 ; |        | $BE9F
    .byte $00 ; |        | $BEA0
    .byte $00 ; |        | $BEA1
    .byte $00 ; |        | $BEA2
    .byte $00 ; |        | $BEA3
    .byte $00 ; |        | $BEA4
    .byte $00 ; |        | $BEA5
LBEA6:
    .byte $00 ; |        | $BEA6
    .byte $00 ; |        | $BEA7
    .byte $80 ; |X       | $BEA8
    .byte $90 ; |X  X    | $BEA9
    .byte $92 ; |X  X  X | $BEAA
LBEAB:
    .byte $00 ; |        | $BEAB
    .byte $80 ; |X       | $BEAC
    .byte $C0 ; |XX      | $BEAD
    .byte $E0 ; |XXX     | $BEAE
    .byte $F0 ; |XXXX    | $BEAF
    .byte $F8 ; |XXXXX   | $BEB0
    .byte $FC ; |XXXXXX  | $BEB1
    .byte $FE ; |XXXXXXX | $BEB2
LBEB3:
    .byte $01 ; |       X| $BEB3
    .byte $03 ; |      XX| $BEB4
    .byte $07 ; |     XXX| $BEB5
    .byte $0F ; |    XXXX| $BEB6
    .byte $1F ; |   XXXXX| $BEB7
    .byte $3F ; |  XXXXXX| $BEB8
    .byte $7F ; | XXXXXXX| $BEB9
    .byte $FF ; |XXXXXXXX| $BEBA
LBEBB:
    .byte $80 ; |X       | $BEBB
    .byte $C0 ; |XX      | $BEBC
    .byte $E0 ; |XXX     | $BEBD
    .byte $F0 ; |XXXX    | $BEBE
    .byte $F8 ; |XXXXX   | $BEBF
    .byte $FC ; |XXXXXX  | $BEC0
    .byte $FE ; |XXXXXXX | $BEC1
    .byte $FF ; |XXXXXXXX| $BEC2
LBEC3:
    .byte $35 ; |  XX X X| $BEC3
    .byte $36 ; |  XX XX | $BEC4
    .byte $37 ; |  XX XXX| $BEC5
    .byte $38 ; |  XXX   | $BEC6
    .byte $39 ; |  XXX  X| $BEC7
    .byte $3A ; |  XXX X | $BEC8
    .byte $3B ; |  XXX XX| $BEC9
    .byte $3C ; |  XXXX  | $BECA
LBECB:
    .byte $25 ; |  X  X X| $BECB
    .byte $26 ; |  X  XX | $BECC
    .byte $27 ; |  X  XXX| $BECD
    .byte $28 ; |  X X   | $BECE
    .byte $29 ; |  X X  X| $BECF
    .byte $2A ; |  X X X | $BED0
    .byte $2B ; |  X X XX| $BED1
    .byte $2C ; |  X XX  | $BED2
    .byte $00 ; |        | $BED3
    .byte $00 ; |        | $BED4
    .byte $00 ; |        | $BED5
    .byte $00 ; |        | $BED6
    .byte $00 ; |        | $BED7
    .byte $00 ; |        | $BED8
    .byte $00 ; |        | $BED9
    .byte $00 ; |        | $BEDA
    .byte $00 ; |        | $BEDB
    .byte $00 ; |        | $BEDC
    .byte $00 ; |        | $BEDD
    .byte $00 ; |        | $BEDE
    .byte $00 ; |        | $BEDF
    .byte $00 ; |        | $BEE0
    .byte $00 ; |        | $BEE1
    .byte $00 ; |        | $BEE2
    .byte $00 ; |        | $BEE3
    .byte $00 ; |        | $BEE4
    .byte $00 ; |        | $BEE5
    .byte $00 ; |        | $BEE6
    .byte $00 ; |        | $BEE7
    .byte $00 ; |        | $BEE8
    .byte $00 ; |        | $BEE9
    .byte $00 ; |        | $BEEA
    .byte $00 ; |        | $BEEB
    .byte $00 ; |        | $BEEC
    .byte $00 ; |        | $BEED
    .byte $00 ; |        | $BEEE
    .byte $00 ; |        | $BEEF
    .byte $00 ; |        | $BEF0
    .byte $00 ; |        | $BEF1
    .byte $00 ; |        | $BEF2
    .byte $00 ; |        | $BEF3
    .byte $00 ; |        | $BEF4
    .byte $00 ; |        | $BEF5
    .byte $00 ; |        | $BEF6
    .byte $00 ; |        | $BEF7
    .byte $00 ; |        | $BEF8
    .byte $00 ; |        | $BEF9
    .byte $00 ; |        | $BEFA
    .byte $00 ; |        | $BEFB
    .byte $00 ; |        | $BEFC
    .byte $00 ; |        | $BEFD
    .byte $00 ; |        | $BEFE
    .byte $00 ; |        | $BEFF
    .byte $00 ; |        | $BF00
    .byte $00 ; |        | $BF01
    .byte $00 ; |        | $BF02
    .byte $00 ; |        | $BF03
    .byte $00 ; |        | $BF04
    .byte $00 ; |        | $BF05
    .byte $00 ; |        | $BF06
    .byte $00 ; |        | $BF07
    .byte $00 ; |        | $BF08
    .byte $00 ; |        | $BF09
    .byte $00 ; |        | $BF0A
    .byte $00 ; |        | $BF0B
    .byte $00 ; |        | $BF0C
    .byte $00 ; |        | $BF0D
    .byte $00 ; |        | $BF0E
    .byte $00 ; |        | $BF0F
    .byte $00 ; |        | $BF10
    .byte $00 ; |        | $BF11
    .byte $00 ; |        | $BF12
    .byte $00 ; |        | $BF13
    .byte $00 ; |        | $BF14
    .byte $00 ; |        | $BF15
    .byte $00 ; |        | $BF16
    .byte $00 ; |        | $BF17
    .byte $00 ; |        | $BF18
    .byte $00 ; |        | $BF19
    .byte $00 ; |        | $BF1A
    .byte $00 ; |        | $BF1B
    .byte $00 ; |        | $BF1C
    .byte $00 ; |        | $BF1D
    .byte $00 ; |        | $BF1E
    .byte $00 ; |        | $BF1F
    .byte $00 ; |        | $BF20
    .byte $00 ; |        | $BF21
    .byte $00 ; |        | $BF22
    .byte $00 ; |        | $BF23
    .byte $00 ; |        | $BF24
    .byte $00 ; |        | $BF25
    .byte $00 ; |        | $BF26
    .byte $00 ; |        | $BF27
    .byte $00 ; |        | $BF28
    .byte $00 ; |        | $BF29
    .byte $00 ; |        | $BF2A
    .byte $00 ; |        | $BF2B
    .byte $00 ; |        | $BF2C
    .byte $00 ; |        | $BF2D
    .byte $00 ; |        | $BF2E
    .byte $00 ; |        | $BF2F
    .byte $00 ; |        | $BF30
    .byte $00 ; |        | $BF31
    .byte $00 ; |        | $BF32
    .byte $00 ; |        | $BF33
    .byte $00 ; |        | $BF34
    .byte $00 ; |        | $BF35
    .byte $00 ; |        | $BF36
    .byte $00 ; |        | $BF37
    .byte $00 ; |        | $BF38
    .byte $00 ; |        | $BF39
    .byte $00 ; |        | $BF3A
    .byte $00 ; |        | $BF3B
    .byte $00 ; |        | $BF3C
    .byte $00 ; |        | $BF3D
    .byte $00 ; |        | $BF3E
    .byte $00 ; |        | $BF3F
    .byte $00 ; |        | $BF40
    .byte $00 ; |        | $BF41
    .byte $00 ; |        | $BF42
    .byte $00 ; |        | $BF43
    .byte $00 ; |        | $BF44
    .byte $00 ; |        | $BF45
    .byte $00 ; |        | $BF46
    .byte $00 ; |        | $BF47
    .byte $00 ; |        | $BF48
    .byte $00 ; |        | $BF49
    .byte $00 ; |        | $BF4A
    .byte $00 ; |        | $BF4B
    .byte $00 ; |        | $BF4C
    .byte $00 ; |        | $BF4D
    .byte $00 ; |        | $BF4E
    .byte $00 ; |        | $BF4F
    .byte $00 ; |        | $BF50
    .byte $00 ; |        | $BF51
    .byte $00 ; |        | $BF52
    .byte $00 ; |        | $BF53
    .byte $00 ; |        | $BF54
    .byte $00 ; |        | $BF55
    .byte $00 ; |        | $BF56
    .byte $00 ; |        | $BF57
    .byte $00 ; |        | $BF58
    .byte $00 ; |        | $BF59
    .byte $00 ; |        | $BF5A
    .byte $00 ; |        | $BF5B
    .byte $00 ; |        | $BF5C
    .byte $00 ; |        | $BF5D
    .byte $00 ; |        | $BF5E
    .byte $00 ; |        | $BF5F
    .byte $00 ; |        | $BF60
    .byte $00 ; |        | $BF61
    .byte $00 ; |        | $BF62
    .byte $00 ; |        | $BF63
    .byte $00 ; |        | $BF64
    .byte $00 ; |        | $BF65
    .byte $00 ; |        | $BF66
    .byte $00 ; |        | $BF67
    .byte $00 ; |        | $BF68
    .byte $00 ; |        | $BF69
    .byte $00 ; |        | $BF6A
    .byte $00 ; |        | $BF6B
    .byte $00 ; |        | $BF6C
    .byte $00 ; |        | $BF6D
    .byte $00 ; |        | $BF6E
    .byte $00 ; |        | $BF6F
    .byte $00 ; |        | $BF70
    .byte $00 ; |        | $BF71
    .byte $00 ; |        | $BF72
    .byte $00 ; |        | $BF73
    .byte $00 ; |        | $BF74
    .byte $00 ; |        | $BF75
    .byte $00 ; |        | $BF76
    .byte $00 ; |        | $BF77
    .byte $00 ; |        | $BF78
    .byte $00 ; |        | $BF79
    .byte $00 ; |        | $BF7A
    .byte $00 ; |        | $BF7B
    .byte $00 ; |        | $BF7C
    .byte $00 ; |        | $BF7D
    .byte $00 ; |        | $BF7E
    .byte $00 ; |        | $BF7F
    .byte $00 ; |        | $BF80
    .byte $00 ; |        | $BF81
    .byte $00 ; |        | $BF82
    .byte $00 ; |        | $BF83
    .byte $00 ; |        | $BF84
    .byte $00 ; |        | $BF85
    .byte $00 ; |        | $BF86
    .byte $00 ; |        | $BF87
    .byte $00 ; |        | $BF88
    .byte $00 ; |        | $BF89
    .byte $00 ; |        | $BF8A
    .byte $00 ; |        | $BF8B
    .byte $00 ; |        | $BF8C
    .byte $00 ; |        | $BF8D
    .byte $00 ; |        | $BF8E
    .byte $00 ; |        | $BF8F
    .byte $00 ; |        | $BF90
    .byte $00 ; |        | $BF91
    .byte $00 ; |        | $BF92
    .byte $00 ; |        | $BF93
    .byte $00 ; |        | $BF94
    .byte $00 ; |        | $BF95
    .byte $00 ; |        | $BF96
    .byte $00 ; |        | $BF97
    .byte $00 ; |        | $BF98
    .byte $00 ; |        | $BF99
    .byte $00 ; |        | $BF9A
    .byte $00 ; |        | $BF9B
    .byte $00 ; |        | $BF9C
    .byte $00 ; |        | $BF9D
    .byte $00 ; |        | $BF9E
    .byte $00 ; |        | $BF9F
    .byte $00 ; |        | $BFA0
    .byte $00 ; |        | $BFA1
    .byte $00 ; |        | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $00 ; |        | $BFA7
    .byte $00 ; |        | $BFA8
    .byte $00 ; |        | $BFA9
    .byte $00 ; |        | $BFAA
    .byte $00 ; |        | $BFAB
    .byte $00 ; |        | $BFAC
    .byte $00 ; |        | $BFAD
    .byte $00 ; |        | $BFAE
    .byte $00 ; |        | $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $00 ; |        | $BFB2
    .byte $00 ; |        | $BFB3
    .byte $00 ; |        | $BFB4
    .byte $00 ; |        | $BFB5
    .byte $00 ; |        | $BFB6
    .byte $00 ; |        | $BFB7
    .byte $00 ; |        | $BFB8
    .byte $00 ; |        | $BFB9
    .byte $00 ; |        | $BFBA
    .byte $00 ; |        | $BFBB
    .byte $00 ; |        | $BFBC
    .byte $00 ; |        | $BFBD
    .byte $00 ; |        | $BFBE
    .byte $00 ; |        | $BFBF
    .byte $00 ; |        | $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $00 ; |        | $BFC3
    .byte $00 ; |        | $BFC4
    .byte $00 ; |        | $BFC5
    .byte $00 ; |        | $BFC6
    .byte $00 ; |        | $BFC7
    .byte $00 ; |        | $BFC8
    .byte $00 ; |        | $BFC9
    .byte $00 ; |        | $BFCA
    .byte $00 ; |        | $BFCB
    .byte $00 ; |        | $BFCC
    .byte $00 ; |        | $BFCD
    .byte $00 ; |        | $BFCE
    .byte $00 ; |        | $BFCF
    .byte $00 ; |        | $BFD0
    .byte $00 ; |        | $BFD1
    .byte $00 ; |        | $BFD2
    .byte $00 ; |        | $BFD3
    .byte $00 ; |        | $BFD4
    .byte $00 ; |        | $BFD5
    .byte $00 ; |        | $BFD6
    .byte $00 ; |        | $BFD7
    .byte $00 ; |        | $BFD8
    .byte $00 ; |        | $BFD9
    .byte $00 ; |        | $BFDA
    .byte $00 ; |        | $BFDB
    .byte $00 ; |        | $BFDC
    .byte $00 ; |        | $BFDD
    .byte $00 ; |        | $BFDE
    .byte $00 ; |        | $BFDF
    .byte $00 ; |        | $BFE0
    .byte $00 ; |        | $BFE1
    .byte $00 ; |        | $BFE2
    .byte $00 ; |        | $BFE3
    .byte $00 ; |        | $BFE4
    .byte $00 ; |        | $BFE5
    .byte $00 ; |        | $BFE6
    .byte $00 ; |        | $BFE7
    .byte $00 ; |        | $BFE8
    .byte $00 ; |        | $BFE9
LBFEA:
    LDA    $C0             ; 3
    AND    #$F0            ; 2
    CMP    #$F0            ; 2
    BNE    LBFF5           ; 2³
LBFF2:
    LDA    LFFF9           ; 4
LBFF5:
    JMP.ind ($00BF)        ; 5
    .byte $00 ; |        | $BFF8
LBFF9:
    .byte $00 ; |        | $BFF9
    .byte $00 ; |        | $BFFA
    .byte $F0 ; |XXXX    | $BFFB
    .byte $00 ; |        | $BFFC
    .byte $F0 ; |XXXX    | $BFFD
    .byte $00 ; |        | $BFFE
    .byte $F0 ; |XXXX    | $BFFF
    
    
       RORG $F000

START:
    CLD                    ; 2
    SEI                    ; 2
    LDX    #$FF            ; 2
    TXS                    ; 2
    LDX    #$FF            ; 2
    LDA    #0              ; 2
LF009:
    STA    VSYNC,X         ; 4
    DEX                    ; 2
    BNE    LF009           ; 2³
    LDA    #0              ; 2
    STA    $B4             ; 3
LF012:
    LDA    #3              ; 2
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDX    #0              ; 2
    STX    VSYNC           ; 3
    LDA    #$2B            ; 2
    STA    TIM64T          ; 4
    LDA    $C1             ; 3
    CMP    #1              ; 2
    BNE    LF03C           ; 2³
    LDA    $E6             ; 3
    BEQ    LF03C           ; 2³
    LDA    #$2E            ; 2
    STA    $BF             ; 3
    LDA    #$B8            ; 2
    STA    $C0             ; 3
    JMP    LFFEA           ; 3
LF03C:
    LDA    $C1             ; 3
    CMP    #1              ; 2
    BEQ    LF059           ; 2³
    LDA    $C1             ; 3
    CMP    #3              ; 2
    BEQ    LF059           ; 2³
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BNE    LF059           ; 2³
    LDA    #0              ; 2
    STA    $B4             ; 3
    STA    $B9             ; 3
    STA    $C1             ; 3
    STA    $DA             ; 3
LF059:
    LDA    $C1             ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    LFA83,X         ; 4
    STA    $BF             ; 3
    LDA    LFA87,X         ; 4
    STA    $C0             ; 3
    JMP    LFFEA           ; 3
LF06B:
    LDA    INTIM           ; 4
    BNE    LF06B           ; 2³
    LDA    $C1             ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    LFA8B,X         ; 4
    STA    $BF             ; 3
    LDA    LFA8F,X         ; 4
    STA    $C0             ; 3
    JMP    LFFEA           ; 3
    STA    WSYNC           ; 3
    LDA    #2              ; 2
    STA    VBLANK          ; 3
    LDA    #$23            ; 2
    STA    TIM64T          ; 4
    LDA    $C1             ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    LFA93,X         ; 4
    STA    $BF             ; 3
    LDA    LFA97,X         ; 4
    STA    $C0             ; 3
    JMP    LFFEA           ; 3
LF09F:
    LDA    INTIM           ; 4
    BNE    LF09F           ; 2³
    INC    $C2             ; 5
    JMP    LF012           ; 3
    LDA    $B4             ; 3
    BEQ    LF0B0           ; 2³
    JMP    LF18C           ; 3
LF0B0:
    LDA    #0              ; 2
    STA    HMBL            ; 3
    STA    $8B             ; 3
    STA    $97             ; 3
    STA    $99             ; 3
    STA    $82             ; 3
    STA    $83             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    REFP0           ; 3
    STA    VDELP0          ; 3
    STA    NUSIZ0          ; 3
    STA    REFP1           ; 3
    STA    VDELP1          ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    $BC             ; 3
    STA    $BB             ; 3
    STA    COLUBK          ; 3
    STA    NUSIZ1          ; 3
    STA    $9F             ; 3
    STA    $A0             ; 3
    STA    $95             ; 3
    STA    $C4             ; 3
    STA    $C5             ; 3
    STA    $C6             ; 3
    STA    $C7             ; 3
    STA    $C8             ; 3
    STA    $C9             ; 3
    STA    $D9             ; 3
    STA    AUDF0           ; 3
    STA    AUDV1           ; 3
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    STA    AUDV1           ; 3
    STA    $A2             ; 3
    STA    $A8             ; 3
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $B3             ; 3
    STA    $9B             ; 3
    STA    $8B             ; 3
    STA    $B5             ; 3
    STA    $DE             ; 3
    LDA    #$A5            ; 2
    STA    $93             ; 3
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    LDA    #1              ; 2
    STA    $9C             ; 3
    STA    $81             ; 3
    STA    $96             ; 3
    STA    $A1             ; 3
    STA    $9E             ; 3
    STA    $B8             ; 3
    LDA    #3              ; 2
    STA    $E6             ; 3
    STA    $A4             ; 3
    LDA    #$4C            ; 2
    STA    $8F             ; 3
    LDA    #$50            ; 2
    STA    $90             ; 3
    LDA    #$27            ; 2
    STA    $91             ; 3
    LDA    #$28            ; 2
    STA    $85             ; 3
    LDA    #$27            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #5              ; 2
    STA    CTRLPF          ; 3
    LDA    #$10            ; 2
    STA    HMP1            ; 3
    LDA    #$0F            ; 2
    STA    $84             ; 3
    LDA    #$55            ; 2
    STA    $92             ; 3
    LDA    #$FF            ; 2
    STA    $86             ; 3
    STA    $BE             ; 3
    STA    AUDV0           ; 3
    LDA    #4              ; 2
    STA    AUDC0           ; 3
    LDA    #$20            ; 2
    STA    $A9             ; 3
    LDA    #$40            ; 2
    STA    $AA             ; 3
    LDA    #$60            ; 2
    STA    $AB             ; 3
    LDA    #$80            ; 2
    STA    $AC             ; 3
    LDA    #$A0            ; 2
    STA    $AD             ; 3
    LDA    #$E0            ; 2
    STA    $AF             ; 3
    LDA    #8              ; 2
    STA    $B1             ; 3
    LDA    #$28            ; 2
    STA    $B2             ; 3
    LDA    #$4C            ; 2
    STA    $B6             ; 3
    LDA    #9              ; 2
    STA    $BD             ; 3
    LDA    #$55            ; 2
    STA    $D8             ; 3
    LDA    #1              ; 2
    STA    $B4             ; 3
LF18C:
    LDA    $B9             ; 3
    BNE    LF1AD           ; 2³
    LDX    #$0B            ; 2
LF192:
    LDA    LFAB8,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LF192           ; 2³
    LDA    #0              ; 2
    STA    $A4             ; 3
    LDA    $C2             ; 3
    BNE    LF1AA           ; 2³
    LDA    #$7F            ; 2
    STA    $8B             ; 3
    LDA    #2              ; 2
    STA    $C1             ; 3
LF1AA:
    JMP    LF1B0           ; 3
LF1AD:
    JSR    LFC20           ; 6
LF1B0:
    LDA    #0              ; 2
    STA    $DD             ; 3
    LDY    $A2             ; 3
    CPY    #0              ; 2
    BEQ    LF1E9           ; 2³
    DEC    $A1             ; 5
    BNE    LF1E9           ; 2³
    LDA    #4              ; 2
    STA    AUDC0           ; 3
    LDA    $D9             ; 3
    BEQ    LF1CA           ; 2³
    LDA    #9              ; 2
    STA    AUDC0           ; 3
LF1CA:
    LDA    LFC5C,Y         ; 4
    STA    $A1             ; 3
    INY                    ; 2
    LDA    LFC5C,Y         ; 4
    CMP    #$FF            ; 2
    BEQ    LF1DC           ; 2³
    STA    AUDF0           ; 3
    INY                    ; 2
    BNE    LF1E4           ; 2³
LF1DC:
    LDY    #0              ; 2
    STY    AUDF0           ; 3
    LDA    #4              ; 2
    STA    AUDC0           ; 3
LF1E4:
    STY    $A2             ; 3
    JMP    LF1EB           ; 3
LF1E9:
    STA    WSYNC           ; 3
LF1EB:
    LDA    $DB             ; 3
    CMP    #1              ; 2
    BNE    LF203           ; 2³+1
    LDX    $DC             ; 3
    LDA    LF0B0,X         ; 4
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    DEC    $DC             ; 5
    LDA    $DC             ; 3
    BNE    LF203           ; 2³
    JSR    LFFA0           ; 6
LF203:
    LDA    $DB             ; 3
    CMP    #2              ; 2
    BNE    LF21B           ; 2³
    LDX    $DC             ; 3
    LDA    LF1EB,X         ; 4
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    DEC    $DC             ; 5
    LDA    $DC             ; 3
    BNE    LF21B           ; 2³
    JSR    LFFA0           ; 6
LF21B:
    LDA    $DB             ; 3
    CMP    #3              ; 2
    BNE    LF233           ; 2³
    LDX    $DC             ; 3
    LDA    LFB18,X         ; 4
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    DEC    $DC             ; 5
    LDA    $DC             ; 3
    BNE    LF233           ; 2³
    JSR    LFFA0           ; 6
LF233:
    LDA    $8B             ; 3
    EOR    $9E             ; 3
    STA    $A7             ; 3
    AND    #$01            ; 2
    STA    $9B             ; 3
    INC    $8B             ; 5
    LDA    $86             ; 3
    CMP    #$FF            ; 2
    BEQ    LF247           ; 2³
    INC    $9E             ; 5
LF247:
    LDA    $A4             ; 3
    BNE    LF24E           ; 2³
    JMP    LF251           ; 3
LF24E:
    JSR    LFC9F           ; 6
LF251:
    LDA    $82             ; 3
    CMP    #1              ; 2
    BEQ    LF26B           ; 2³
    CMP    #3              ; 2
    BEQ    LF271           ; 2³
    LDA    $8F             ; 3
    CLC                    ; 2
    ADC    #4              ; 2
    STA    $90             ; 3
    LDA    $91             ; 3
    ADC    #1              ; 2
    STA    $85             ; 3
    JMP    LF274           ; 3
LF26B:
    JSR    LFDBD           ; 6
    JMP    LF274           ; 3
LF271:
    JSR    LFE35           ; 6
LF274:
    LDX    $90             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LF281:
    DEY                    ; 2
    BPL    LF281           ; 2³
    STA    RESBL           ; 3
    STA    HMBL            ; 3
    STA    WSYNC           ; 3
    LDA    $81             ; 3
    CMP    #2              ; 2
    BEQ    LF2BB           ; 2³
    LDA    $81             ; 3
    CMP    #4              ; 2
    BEQ    LF2BB           ; 2³
    LDA    CXP0FB          ; 3
    BPL    LF2B4           ; 2³
    LDA    $8F             ; 3
    CMP    #$4D            ; 2
    BCC    LF2A7           ; 2³
    LDA    #2              ; 2
    STA    $99             ; 3
    JMP    LF2B8           ; 3
LF2A7:
    LDA    $8F             ; 3
    CMP    #$4B            ; 2
    BCS    LF2B1           ; 2³
    LDA    #1              ; 2
    STA    $99             ; 3
LF2B1:
    JMP    LF2B8           ; 3
LF2B4:
    LDA    #0              ; 2
    STA    $99             ; 3
LF2B8:
    JMP    LF2DD           ; 3
LF2BB:
    LDA    CXP0FB          ; 3
    BPL    LF2D9           ; 2³
    LDA    $91             ; 3
    CMP    #$57            ; 2
    BCC    LF2CC           ; 2³
    LDA    #4              ; 2
    STA    $99             ; 3
    JMP    LF2DD           ; 3
LF2CC:
    LDA    $91             ; 3
    CMP    #$55            ; 2
    BCS    LF2D6           ; 2³
    LDA    #3              ; 2
    STA    $99             ; 3
LF2D6:
    JMP    LF2DD           ; 3
LF2D9:
    LDA    #0              ; 2
    STA    $99             ; 3
LF2DD:
    LDA    CXP0FB          ; 3
    BPL    LF2E5           ; 2³
    LDA    #$3D            ; 2
    STA    $A2             ; 3
LF2E5:
    LDA    $81             ; 3
    CMP    #1              ; 2
    BNE    LF2FE           ; 2³
    LDA    $8C             ; 3
    BEQ    LF2F7           ; 2³
    LDA    #$4C            ; 2
    STA    $8F             ; 3
    LDA    #$27            ; 2
    STA    $91             ; 3
LF2F7:
    LDA    #$27            ; 2
    STA    $91             ; 3
    JMP    LF340           ; 3
LF2FE:
    LDA    $81             ; 3
    CMP    #2              ; 2
    BNE    LF317           ; 2³
    LDA    $8C             ; 3
    BEQ    LF310           ; 2³
    LDA    #$78            ; 2
    STA    $8F             ; 3
    LDA    #$56            ; 2
    STA    $91             ; 3
LF310:
    LDA    #$78            ; 2
    STA    $8F             ; 3
    JMP    LF340           ; 3
LF317:
    LDA    $81             ; 3
    CMP    #3              ; 2
    BNE    LF330           ; 2³
    LDA    $8C             ; 3
    BEQ    LF329           ; 2³
    LDA    #$4C            ; 2
    STA    $8F             ; 3
    LDA    #$86            ; 2
    STA    $91             ; 3
LF329:
    LDA    #$85            ; 2
    STA    $91             ; 3
    JMP    LF340           ; 3
LF330:
    LDA    $8C             ; 3
    BEQ    LF33C           ; 2³
    LDA    #$1E            ; 2
    STA    $8F             ; 3
    LDA    #$56            ; 2
    STA    $91             ; 3
LF33C:
    LDA    #$1E            ; 2
    STA    $8F             ; 3
LF340:
    LDA    #0              ; 2
    STA    $8C             ; 3
    LDX    $8F             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LF351:
    DEY                    ; 2
    BPL    LF351           ; 2³
    STA    RESP0           ; 3
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
    LDA    $B5             ; 3
    BEQ    LF361           ; 2³
    JMP    LF4D9           ; 3
LF361:
    LDA    $D9             ; 3
    BEQ    LF390           ; 2³
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BNE    LF390           ; 2³
    LDA    $A7             ; 3
    AND    #$04            ; 2
    CMP    #4              ; 2
    BNE    LF377           ; 2³
    LDA    #4              ; 2
    STA    $9F             ; 3
LF377:
    LDA    $A7             ; 3
    AND    #$01            ; 2
    STA    $9D             ; 3
    BEQ    LF390           ; 2³
    LDA    $A7             ; 3
    AND    #$07            ; 2
    CMP    #2              ; 2
    BEQ    LF38C           ; 2³
    STA    $9F             ; 3
    JMP    LF390           ; 3
LF38C:
    LDA    #4              ; 2
    STA    $9F             ; 3
LF390:
    LDA    $9F             ; 3
    CMP    #1              ; 2
    BEQ    LF3AD           ; 2³
    CMP    #2              ; 2
    BEQ    LF3B0           ; 2³
    CMP    #3              ; 2
    BEQ    LF3B3           ; 2³
    CMP    #4              ; 2
    BEQ    LF3B6           ; 2³
    CMP    #5              ; 2
    BEQ    LF3B9           ; 2³
    CMP    #6              ; 2
    BEQ    LF3BC           ; 2³
    JMP    LF3C0           ; 3
LF3AD:
    JMP    LF44B           ; 3
LF3B0:
    JMP    LF4D9           ; 3
LF3B3:
    JMP    LF5D2           ; 3
LF3B6:
    JMP    LF676           ; 3
LF3B9:
    JMP    LF722           ; 3
LF3BC:
    LDA    #1              ; 2
    STA    $D9             ; 3
LF3C0:
    LDA    $D9             ; 3
    BNE    LF3CE           ; 2³
    LDA    $DA             ; 3
    CMP    #1              ; 2
    BNE    LF3CE           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LF3CE:
    LDA    CXP1FB          ; 3
    AND    #$40            ; 2
    BEQ    LF3E8           ; 2³
    JSR    LFBD9           ; 6
    JSR    LFEF1           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $BC             ; 3
    LDA    #1              ; 2
    STA    $A2             ; 3
    INC    $A0             ; 5
LF3E8:
    JSR    LFF06           ; 6
    LDA    $A0             ; 3
    CMP    #5              ; 2
    BNE    LF406           ; 2³+1
    INC    $9F             ; 5
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    JSR    LFBF1           ; 6
    LDA    #0              ; 2
    STA    $A0             ; 3
    LDA    #2              ; 2
    STA    $DA             ; 3
    LDA    #3              ; 2
    STA    $E6             ; 3
LF406:
    LDA    $A8             ; 3
    CMP    #$18            ; 2
    BNE    LF410           ; 2³
    LDA    #0              ; 2
    STA    $A8             ; 3
LF410:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF41A           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF41A:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF423           ; 2³
    JMP    LF42F           ; 3
LF423:
    LDA    #0              ; 2
    STA    $9C             ; 3
    STA    $B3             ; 3
    JSR    LFF5F           ; 6
    JSR    LFF3C           ; 6
LF42F:
    LDA    $9D             ; 3
    CMP    #0              ; 2
    BEQ    LF443           ; 2³
    DEC    $93             ; 5
    LDA    $93             ; 3
    CMP    #0              ; 2
    BNE    LF448           ; 2³
    JSR    LFF7E           ; 6
    JMP    LF448           ; 3
LF443:
    INC    $93             ; 5
    JSR    LFF27           ; 6
LF448:
    JMP    LF7CC           ; 3
LF44B:
    LDA    $D9             ; 3
    BNE    LF459           ; 2³
    LDA    $DA             ; 3
    CMP    #2              ; 2
    BNE    LF459           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LF459:
    LDA    CXP1FB          ; 3
    AND    #$40            ; 2
    BEQ    LF478           ; 2³
    LDX    #5              ; 2
LF461:
    JSR    LFBD9           ; 6
    DEX                    ; 2
    BNE    LF461           ; 2³
    JSR    LFEF1           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $BC             ; 3
    LDA    #$0E            ; 2
    STA    $A2             ; 3
    INC    $A0             ; 5
LF478:
    JSR    LFF06           ; 6
    LDA    $A0             ; 3
    CMP    #5              ; 2
    BNE    LF494           ; 2³
    LDA    #0              ; 2
    STA    $A0             ; 3
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    JSR    LFBF1           ; 6
    LDA    #3              ; 2
    STA    $9F             ; 3
    STA    $DA             ; 3
    STA    $E6             ; 3
LF494:
    LDA    $A9             ; 3
    CMP    #$38            ; 2
    BNE    LF49E           ; 2³
    LDA    #$20            ; 2
    STA    $A9             ; 3
LF49E:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF4A8           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF4A8:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF4B1           ; 2³
    JMP    LF4BD           ; 3
LF4B1:
    LDA    #0              ; 2
    STA    $9C             ; 3
    STA    $B3             ; 3
    JSR    LFF5F           ; 6
    JSR    LFF3C           ; 6
LF4BD:
    LDA    $9D             ; 3
    CMP    #0              ; 2
    BEQ    LF4D1           ; 2³
    DEC    $93             ; 5
    LDA    $93             ; 3
    CMP    #0              ; 2
    BNE    LF4D6           ; 2³
    JSR    LFF7E           ; 6
    JMP    LF4D6           ; 3
LF4D1:
    INC    $93             ; 5
    JSR    LFF27           ; 6
LF4D6:
    JMP    LF7CC           ; 3
LF4D9:
    LDA    #0              ; 2
    STA    $AE             ; 3
    LDA    CXPPMM          ; 3
    BPL    LF4FB           ; 2³
    JSR    LFBE5           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $B8             ; 3
    JSR    LFFAB           ; 6
    LDA    #0              ; 2
    STA    $B5             ; 3
    LDA    #$4B            ; 2
    STA    $B6             ; 3
    LDA    #$0E            ; 2
    STA    $A2             ; 3
LF4FB:
    LDA    $8B             ; 3
    AND    #$01            ; 2
    CMP    #1              ; 2
    BNE    LF505           ; 2³
    INC    $B2             ; 5
LF505:
    LDA    #$57            ; 2
    STA    $93             ; 3
    LDA    $AA             ; 3
    CMP    #$58            ; 2
    BNE    LF513           ; 2³
    LDA    #$40            ; 2
    STA    $AA             ; 3
LF513:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF51D           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF51D:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF526           ; 2³
    JMP    LF539           ; 3
LF526:
    LDA    #0              ; 2
    STA    $9C             ; 3
    JSR    LFF5F           ; 6
    LDA    #0              ; 2
    STA    $AE             ; 3
    LDA    $9B             ; 3
    STA    $9D             ; 3
    LDA    #0              ; 2
    STA    $B0             ; 3
LF539:
    LDA    $B8             ; 3
    CMP    #1              ; 2
    BNE    LF552           ; 2³
    LDA    $A7             ; 3
    AND    #$01            ; 2
    CMP    #1              ; 2
    BNE    LF54E           ; 2³
    LDA    #2              ; 2
    STA    $B7             ; 3
    JMP    LF552           ; 3
LF54E:
    LDA    #4              ; 2
    STA    $B7             ; 3
LF552:
    LDA    #1              ; 2
    STA    $B8             ; 3
    LDA    $B7             ; 3
    CMP    #4              ; 2
    BNE    LF58C           ; 2³
    LDA    $8B             ; 3
    AND    #$01            ; 2
    BNE    LF564           ; 2³
    DEC    $B6             ; 5
LF564:
    LDA    $B6             ; 3
    CMP    #$0E            ; 2
    BNE    LF5B9           ; 2³
    JSR    LFFAB           ; 6
    LDA    $B1             ; 3
    BEQ    LF57D           ; 2³
    DEC    $B1             ; 5
    LDA    $B1             ; 3
    CMP    #0              ; 2
    BNE    LF57D           ; 2³
    LDA    #0              ; 2
    STA    $A4             ; 3
LF57D:
    LDA    #1              ; 2
    STA    $9C             ; 3
    LDA    #1              ; 2
    STA    $B8             ; 3
    LDA    #$4B            ; 2
    STA    $B6             ; 3
    JMP    LF5B9           ; 3
LF58C:
    LDA    $8B             ; 3
    AND    #$01            ; 2
    BNE    LF594           ; 2³
    INC    $B6             ; 5
LF594:
    LDA    $B6             ; 3
    CMP    #$8A            ; 2
    BNE    LF5B9           ; 2³
    JSR    LFFAB           ; 6
    LDA    $B1             ; 3
    BEQ    LF5AD           ; 2³
    DEC    $B1             ; 5
    LDA    $B1             ; 3
    CMP    #0              ; 2
    BNE    LF5AD           ; 2³
    LDA    #0              ; 2
    STA    $A4             ; 3
LF5AD:
    LDA    #1              ; 2
    STA    $9C             ; 3
    LDA    #1              ; 2
    STA    $B8             ; 3
    LDA    #$4B            ; 2
    STA    $B6             ; 3
LF5B9:
    LDX    $B6             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LF5C6:
    DEY                    ; 2
    BPL    LF5C6           ; 2³
    STA    RESP1           ; 3
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
    JMP    LF7E2           ; 3
LF5D2:
    LDA    $D9             ; 3
    BNE    LF5E0           ; 2³
    LDA    $DA             ; 3
    CMP    #3              ; 2
    BNE    LF5E0           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LF5E0:
    LDA    CXP1FB          ; 3
    AND    #$40            ; 2
    BEQ    LF5FF           ; 2³
    LDX    #2              ; 2
LF5E8:
    JSR    LFBE5           ; 6
    DEX                    ; 2
    BNE    LF5E8           ; 2³
    JSR    LFEF1           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $BC             ; 3
    LDA    #$0E            ; 2
    STA    $A2             ; 3
    INC    $A0             ; 5
LF5FF:
    JSR    LFF06           ; 6
    LDA    $A0             ; 3
    CMP    #5              ; 2
    BNE    LF61D           ; 2³
    INC    $9F             ; 5
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    JSR    LFBF1           ; 6
    LDA    #0              ; 2
    STA    $A0             ; 3
    LDA    #4              ; 2
    STA    $DA             ; 3
    LDA    #3              ; 2
    STA    $E6             ; 3
LF61D:
    LDA    $AC             ; 3
    CMP    #$98            ; 2
    BNE    LF627           ; 2³
    LDA    #$80            ; 2
    STA    $AC             ; 3
LF627:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF631           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF631:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF63A           ; 2³
    JMP    LF646           ; 3
LF63A:
    LDA    #0              ; 2
    STA    $9C             ; 3
    STA    $B3             ; 3
    JSR    LFF5F           ; 6
    JSR    LFF3C           ; 6
LF646:
    LDA    $9D             ; 3
    CMP    #0              ; 2
    BEQ    LF664           ; 2³
    LDA    $93             ; 3
    CMP    #$5A            ; 2
    BNE    LF656           ; 2³
    LDA    #0              ; 2
    STA    $9D             ; 3
LF656:
    DEC    $93             ; 5
    LDA    $93             ; 3
    CMP    #0              ; 2
    BNE    LF673           ; 2³
    JSR    LFF7E           ; 6
    JMP    LF673           ; 3
LF664:
    LDA    $93             ; 3
    CMP    #$51            ; 2
    BNE    LF66E           ; 2³
    LDA    #1              ; 2
    STA    $9D             ; 3
LF66E:
    INC    $93             ; 5
    JSR    LFF27           ; 6
LF673:
    JMP    LF7CC           ; 3
LF676:
    LDA    $D9             ; 3
    BNE    LF684           ; 2³
    LDA    $DA             ; 3
    CMP    #4              ; 2
    BNE    LF684           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LF684:
    LDA    CXP1FB          ; 3
    AND    #$40            ; 2
    BEQ    LF6A3           ; 2³
    LDX    #5              ; 2
LF68C:
    JSR    LFBE5           ; 6
    DEX                    ; 2
    BNE    LF68C           ; 2³
    JSR    LFEF1           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $BC             ; 3
    LDA    #$0E            ; 2
    STA    $A2             ; 3
    INC    $A0             ; 5
LF6A3:
    JSR    LFF06           ; 6
    LDA    $A0             ; 3
    CMP    #5              ; 2
    BNE    LF6C1           ; 2³
    INC    $9F             ; 5
    LDA    #3              ; 2
    STA    $E6             ; 3
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    JSR    LFBF1           ; 6
    LDA    #0              ; 2
    STA    $A0             ; 3
    LDA    #5              ; 2
    STA    $DA             ; 3
LF6C1:
    LDA    $AD             ; 3
    CMP    #$B8            ; 2
    BNE    LF6CB           ; 2³
    LDA    #$A0            ; 2
    STA    $AD             ; 3
LF6CB:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF6D5           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF6D5:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF6DE           ; 2³
    JMP    LF6EA           ; 3
LF6DE:
    LDA    #0              ; 2
    STA    $9C             ; 3
    STA    $B3             ; 3
    JSR    LFF5F           ; 6
    JSR    LFF3C           ; 6
LF6EA:
    LDA    $9D             ; 3
    CMP    #0              ; 2
    BEQ    LF70C           ; 2³+1
    LDA    $93             ; 3
    CMP    #$74            ; 2
    BCS    LF6FE           ; 2³
    CMP    #$40            ; 2
    BCC    LF6FE           ; 2³
    DEC    $93             ; 5
    DEC    $93             ; 5
LF6FE:
    DEC    $93             ; 5
    LDA    $93             ; 3
    CMP    #0              ; 2
    BNE    LF71F           ; 2³
    JSR    LFF7E           ; 6
    JMP    LF71F           ; 3
LF70C:
    LDA    $93             ; 3
    CMP    #$41            ; 2
    BCC    LF71A           ; 2³
    CMP    #$74            ; 2
    BCS    LF71A           ; 2³
    INC    $93             ; 5
    INC    $93             ; 5
LF71A:
    INC    $93             ; 5
    JSR    LFF27           ; 6
LF71F:
    JMP    LF7CC           ; 3
LF722:
    LDA    $D9             ; 3
    BNE    LF730           ; 2³
    LDA    $DA             ; 3
    CMP    #5              ; 2
    BNE    LF730           ; 2³
    LDA    #1              ; 2
    STA    $C1             ; 3
LF730:
    LDA    CXP1FB          ; 3
    AND    #$40            ; 2
    BEQ    LF74A           ; 2³
    JSR    LFBF1           ; 6
    JSR    LFEF1           ; 6
    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $BC             ; 3
    LDA    #$0E            ; 2
    STA    $A2             ; 3
    INC    $A0             ; 5
LF74A:
    JSR    LFF06           ; 6
    LDA    $A0             ; 3
    CMP    #5              ; 2
    BNE    LF766           ; 2³
    LDA    #6              ; 2
    STA    $9F             ; 3
    JSR    LFBF1           ; 6
    LDA    #0              ; 2
    STA    $A0             ; 3
    LDA    #3              ; 2
    STA    $E6             ; 3
    LDA    #$1F            ; 2
    STA    $E7             ; 3
LF766:
    LDA    $AB             ; 3
    CMP    #$78            ; 2
    BNE    LF770           ; 2³
    LDA    #$60            ; 2
    STA    $AB             ; 3
LF770:
    LDA    $AF             ; 3
    CMP    #$E0            ; 2
    BNE    LF77A           ; 2³
    LDA    #$C0            ; 2
    STA    $AF             ; 3
LF77A:
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BEQ    LF783           ; 2³
    JMP    LF78F           ; 3
LF783:
    LDA    #0              ; 2
    STA    $9C             ; 3
    STA    $B3             ; 3
    JSR    LFF5F           ; 6
    JSR    LFF3C           ; 6
LF78F:
    LDA    $9D             ; 3
    CMP    #0              ; 2
    BEQ    LF7A3           ; 2³
    DEC    $93             ; 5
    LDA    $93             ; 3
    CMP    #0              ; 2
    BNE    LF7A8           ; 2³
    JSR    LFF7E           ; 6
    JMP    LF7C9           ; 3
LF7A3:
    INC    $93             ; 5
    JSR    LFF27           ; 6
LF7A8:
    LDA    $96             ; 3
    CMP    #0              ; 2
    BEQ    LF7BD           ; 2³
LF7AE:
    LDA    $92             ; 3
    CMP    #$5D            ; 2
    BEQ    LF7BD           ; 2³
    INC    $92             ; 5
    LDA    #1              ; 2
    STA    $96             ; 3
    JMP    LF7C9           ; 3
LF7BD:
    LDA    $92             ; 3
    CMP    #$3C            ; 2
    BEQ    LF7AE           ; 2³
    DEC    $92             ; 5
    LDA    #0              ; 2
    STA    $96             ; 3
LF7C9:
    JMP    LF7CC           ; 3
LF7CC:
    LDX    $92             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LF7D9:
    DEY                    ; 2
    BPL    LF7D9           ; 2³
    STA    RESP1           ; 3
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
LF7E2:
    LDA    $BC             ; 3
    BEQ    LF7F6           ; 2³
    LDA    $BD             ; 3
    BEQ    LF7F9           ; 2³
    LDA    $8B             ; 3
    AND    #$01            ; 2
    CMP    #1              ; 2
    BNE    LF7F6           ; 2³
    INC    $BB             ; 5
    DEC    $BD             ; 5
LF7F6:
    JMP    LF803           ; 3
LF7F9:
    LDA    #0              ; 2
    STA    $BC             ; 3
    STA    $BB             ; 3
    LDA    #9              ; 2
    STA    $BD             ; 3
LF803:
    LDA    $BB             ; 3
    STA    COLUBK          ; 3
    LDA    $82             ; 3
    BEQ    LF813           ; 2³
    LDA    $A4             ; 3
    BEQ    LF80F           ; 2³
LF80F:
    LDA    #0              ; 2
    STA    $C1             ; 3
LF813:
    LDA    $82             ; 3
    BNE    LF864           ; 2³
    LDA    $DE             ; 3
    BNE    LF864           ; 2³
    LDA    $D9             ; 3
    BEQ    LF864           ; 2³
    LDA    $A0             ; 3
    BNE    LF864           ; 2³
    LDA    #7              ; 2
    STA    $B1             ; 3
    LDA    $A4             ; 3
    CMP    #3              ; 2
    BNE    LF830           ; 2³
    JSR    LFBFD           ; 6
LF830:
    LDA    $A4             ; 3
    CMP    #2              ; 2
    BNE    LF83E           ; 2³
    LDX    #5              ; 2
LF838:
    JSR    LFBF1           ; 6
    DEX                    ; 2
    BNE    LF838           ; 2³
LF83E:
    LDA    $A4             ; 3
    CMP    #1              ; 2
    BNE    LF852           ; 2³
    JSR    LFBF1           ; 6
    JSR    LFBF1           ; 6
    LDX    #5              ; 2
LF84C:
    JSR    LFBE5           ; 6
    DEX                    ; 2
    BNE    LF84C           ; 2³
LF852:
    LDA    #$1F            ; 2
    STA    $E7             ; 3
    LDA    #3              ; 2
    STA    $E6             ; 3
    LDA    #6              ; 2
    STA    $DA             ; 3
    LDA    #1              ; 2
    STA    $C1             ; 3
    STA    $DE             ; 3
LF864:
    LDA    $D9             ; 3
    BEQ    LF893           ; 2³
    LDA    $9C             ; 3
    CMP    #1              ; 2
    BNE    LF893           ; 2³
    LDA    $A7             ; 3
    AND    #$04            ; 2
    CMP    #4              ; 2
    BNE    LF87A           ; 2³
    LDA    #4              ; 2
    STA    $9F             ; 3
LF87A:
    LDA    $A7             ; 3
    AND    #$01            ; 2
    STA    $9D             ; 3
    BEQ    LF893           ; 2³
    LDA    $A7             ; 3
    AND    #$07            ; 2
    CMP    #2              ; 2
    BEQ    LF88F           ; 2³
    STA    $9F             ; 3
    JMP    LF893           ; 3
LF88F:
    LDA    #4              ; 2
    STA    $9F             ; 3
LF893:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    CXCLR           ; 3
    LDA    $AE             ; 3
    CMP    #1              ; 2
    BNE    LF8B5           ; 2³
    LDA    $8B             ; 3
    AND    #$07            ; 2
    CMP    #7              ; 2
    BNE    LF8AE           ; 2³
    LDA    $AF             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $AF             ; 3
LF8AE:
    LDA    $AF             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF8B5:
    LDA    $B5             ; 3
    BEQ    LF8BC           ; 2³
    JMP    LF8FE           ; 3
LF8BC:
    LDA    $9F             ; 3
    CMP    #1              ; 2
    BEQ    LF8E8           ; 2³
    CMP    #2              ; 2
    BEQ    LF8FE           ; 2³
    CMP    #3              ; 2
    BEQ    LF914           ; 2³+1
    CMP    #4              ; 2
    BEQ    LF92A           ; 2³+1
    CMP    #5              ; 2
    BEQ    LF940           ; 2³+1
    LDA    $8B             ; 3
    AND    #$0F            ; 2
    CMP    #$0F            ; 2
    BNE    LF8E1           ; 2³
    LDA    $A8             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $A8             ; 3
LF8E1:
    LDA    $A8             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF8E8:
    LDA    $8B             ; 3
    AND    #$1F            ; 2
    CMP    #$1F            ; 2
    BNE    LF8F7           ; 2³
    LDA    $A9             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $A9             ; 3
LF8F7:
    LDA    $A9             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF8FE:
    LDA    $8B             ; 3
    AND    #$07            ; 2
    CMP    #7              ; 2
    BNE    LF90D           ; 2³
    LDA    $AA             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $AA             ; 3
LF90D:
    LDA    $AA             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF914:
    LDA    $8B             ; 3
    AND    #$0F            ; 2
    CMP    #$0F            ; 2
    BNE    LF923           ; 2³
    LDA    $AC             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $AC             ; 3
LF923:
    LDA    $AC             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF92A:
    LDA    $8B             ; 3
    AND    #$0F            ; 2
    CMP    #$0F            ; 2
    BNE    LF939           ; 2³
    LDA    $AD             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $AD             ; 3
LF939:
    LDA    $AD             ; 3
    STA    $88             ; 3
    JMP    LF953           ; 3
LF940:
    LDA    $8B             ; 3
    AND    #$0F            ; 2
    CMP    #$0F            ; 2
    BNE    LF94F           ; 2³
    LDA    $AB             ; 3
    CLC                    ; 2
    ADC    #8              ; 2
    STA    $AB             ; 3
LF94F:
    LDA    $AB             ; 3
    STA    $88             ; 3
LF953:
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    ENABL           ; 3
    LDA    $A4             ; 3
    BNE    LF9CC           ; 2³
    LDA    $B9             ; 3
    BEQ    LF9A3           ; 2³
    LDA    $BE             ; 3
    CMP    #1              ; 2
    BEQ    LF974           ; 2³
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDX    $BE             ; 3
    LDA    LFB39,X         ; 4
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
LF974:
    LDA    $BE             ; 3
    BEQ    LF986           ; 2³
    LDA    #0              ; 2
    STA    $C1             ; 3
    LDA    $8B             ; 3
    AND    #$01            ; 2
    CMP    #1              ; 2
    BNE    LF986           ; 2³
    INC    $BB             ; 5
LF986:
    DEC    $BE             ; 5
    LDA    $BE             ; 3
    BNE    LF9CC           ; 2³
    LDA    #1              ; 2
    STA    $BE             ; 3
    JSR    LFFC9           ; 6
    LDA    #0              ; 2
    STA    $BB             ; 3
    LDA    $C2             ; 3
    BNE    LF9A3           ; 2³
    LDA    #$7F            ; 2
    STA    $8B             ; 3
    LDA    #2              ; 2
    STA    $C1             ; 3
LF9A3:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BEQ    LF9CC           ; 2³
    LDA    INPT4           ; 3
    BMI    LF9B5           ; 2³
    JSR    LFFC9           ; 6
    LDA    #$80            ; 2
    STA    $BA             ; 3
LF9B5:
    LDA    $BA             ; 3
    BEQ    LF9CC           ; 2³
    LDA    INPT4           ; 3
    BPL    LF9CC           ; 2³
    LDA    #1              ; 2
    STA    $B9             ; 3
    LDA    #0              ; 2
    STA    $BA             ; 3
    LDA    #1              ; 2
    STA    $DA             ; 3
    JMP    LF0B0           ; 3
LF9CC:
    JMP    LF06B           ; 3
    LDA    #0              ; 2
    STA    AUDF0           ; 3
    LDA    #0              ; 2
    STA    AUDF1           ; 3
    STA    AUDC1           ; 3
    STA    AUDV1           ; 3
    LDA    $DA             ; 3
    CMP    #2              ; 2
    BEQ    LFA06           ; 2³+1
    LDA    $DA             ; 3
    CMP    #3              ; 2
    BEQ    LFA20           ; 2³+1
    LDA    $DA             ; 3
    CMP    #4              ; 2
    BEQ    LFA2D           ; 2³+1
    LDA    $DA             ; 3
    CMP    #5              ; 2
    BEQ    LFA13           ; 2³+1
    LDA    $DA             ; 3
    CMP    #6              ; 2
    BEQ    LFA3A           ; 2³+1
    LDX    #$0B            ; 2
LF9FB:
    LDA    LFAC4,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LF9FB           ; 2³+1
    JMP    LFA44           ; 3
LFA06:
    LDX    #$0B            ; 2
LFA08:
    LDA    LFAD0,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA08           ; 2³
    JMP    LFA44           ; 3
LFA13:
    LDX    #$0B            ; 2
LFA15:
    LDA    LFADC,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA15           ; 2³
    JMP    LFA44           ; 3
LFA20:
    LDX    #$0B            ; 2
LFA22:
    LDA    LFAE8,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA22           ; 2³
    JMP    LFA44           ; 3
LFA2D:
    LDX    #$0B            ; 2
LFA2F:
    LDA    LFAF4,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA2F           ; 2³
    JMP    LFA44           ; 3
LFA3A:
    LDX    #$0B            ; 2
LFA3C:
    LDA    LFB00,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA3C           ; 2³
LFA44:
    JMP    LF06B           ; 3
    LDA    INPT4           ; 3
    BMI    LFA4F           ; 2³
    LDA    #$80            ; 2
    STA    $BA             ; 3
LFA4F:
    LDA    $BA             ; 3
    BEQ    LFA62           ; 2³
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #4              ; 2
    STA    AUDC1           ; 3
    LDX    $8B             ; 3
    LDA    LFB39,X         ; 4
    STA    AUDF1           ; 3
LFA62:
    LDX    #$0B            ; 2
LFA64:
    LDA    LFB0C,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    BPL    LFA64           ; 2³
    JMP    LF06B           ; 3
    LDX    #$0B            ; 2
LFA71:
    LDA    LFAB8,X         ; 4
    STA    $CA,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BPL    LFA71           ; 2³
    JMP    LF09F           ; 3
    JMP    LF09F           ; 3
    JMP    LF09F           ; 3
LFA83:
    .byte $A9 ; |X X X  X| $FA83
    .byte $CF ; |XX  XXXX| $FA84
    .byte $47 ; | X   XXX| $FA85
    .byte $9C ; |X  XXX  | $FA86
LFA87:
    .byte $F0 ; |XXXX    | $FA87
    .byte $F9 ; |XXXXX  X| $FA88
    .byte $FA ; |XXXXX X | $FA89
    .byte $BA ; |X XXX X | $FA8A
LFA8B:
    .byte $0B ; |    X XX| $FA8B
    .byte $9F ; |X  XXXXX| $FA8C
    .byte $17 ; |   X XXX| $FA8D
    .byte $B1 ; |X XX   X| $FA8E
LFA8F:
    .byte $B0 ; |X XX    | $FA8F
    .byte $B3 ; |X XX  XX| $FA90
    .byte $B6 ; |X XX XX | $FA91
    .byte $BA ; |X XXX X | $FA92
LFA93:
    .byte $6F ; | XX XXXX| $FA93
    .byte $7D ; | XXXXX X| $FA94
    .byte $80 ; |X       | $FA95
    .byte $C9 ; |XX  X  X| $FA96
LFA97:
    .byte $FA ; |XXXXX X | $FA97
    .byte $FA ; |XXXXX X | $FA98
    .byte $FA ; |XXXXX X | $FA99
    .byte $BA ; |X XXX X | $FA9A
    .byte $00 ; |        | $FA9B
    .byte $00 ; |        | $FA9C
    .byte $00 ; |        | $FA9D
    .byte $00 ; |        | $FA9E
    .byte $00 ; |        | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $00 ; |        | $FAA1
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
LFAAD:
    .byte $00 ; |        | $FAAD
    .byte $08 ; |    X   | $FAAE
    .byte $10 ; |   X    | $FAAF
    .byte $18 ; |   XX   | $FAB0
    .byte $20 ; |  X     | $FAB1
    .byte $28 ; |  X X   | $FAB2
    .byte $30 ; |  XX    | $FAB3
    .byte $38 ; |  XXX   | $FAB4
    .byte $40 ; | X      | $FAB5
    .byte $48 ; | X  X   | $FAB6
    .byte $50 ; | X X    | $FAB7
LFAB8:
    .byte $74 ; | XXX X  | $FAB8
    .byte $BB ; |X XXX XX| $FAB9
    .byte $6D ; | XX XX X| $FABA
    .byte $BB ; |X XXX XX| $FABB
    .byte $66 ; | XX  XX | $FABC
    .byte $BB ; |X XXX XX| $FABD
    .byte $5F ; | X XXXXX| $FABE
    .byte $BB ; |X XXX XX| $FABF
    .byte $58 ; | X XX   | $FAC0
    .byte $BB ; |X XXX XX| $FAC1
    .byte $50 ; | X X    | $FAC2
    .byte $BB ; |X XXX XX| $FAC3
LFAC4:
    .byte $46 ; | X   XX | $FAC4
    .byte $B4 ; |X XX X  | $FAC5
    .byte $37 ; |  XX XXX| $FAC6
    .byte $B4 ; |X XX X  | $FAC7
    .byte $28 ; |  X X   | $FAC8
    .byte $B4 ; |X XX X  | $FAC9
    .byte $19 ; |   XX  X| $FACA
    .byte $B4 ; |X XX X  | $FACB
    .byte $0A ; |    X X | $FACC
    .byte $B4 ; |X XX X  | $FACD
    .byte $FB ; |XXXXX XX| $FACE
    .byte $B3 ; |X XX  XX| $FACF
LFAD0:
    .byte $A0 ; |X X     | $FAD0
    .byte $B4 ; |X XX X  | $FAD1
    .byte $91 ; |X  X   X| $FAD2
    .byte $B4 ; |X XX X  | $FAD3
    .byte $82 ; |X     X | $FAD4
    .byte $B4 ; |X XX X  | $FAD5
    .byte $73 ; | XXX  XX| $FAD6
    .byte $B4 ; |X XX X  | $FAD7
    .byte $64 ; | XX  X  | $FAD8
    .byte $B4 ; |X XX X  | $FAD9
    .byte $55 ; | X X X X| $FADA
    .byte $B4 ; |X XX X  | $FADB
LFADC:
    .byte $FA ; |XXXXX X | $FADC
    .byte $B4 ; |X XX X  | $FADD
    .byte $EB ; |XXX X XX| $FADE
    .byte $B4 ; |X XX X  | $FADF
    .byte $DC ; |XX XXX  | $FAE0
    .byte $B4 ; |X XX X  | $FAE1
    .byte $CD ; |XX  XX X| $FAE2
    .byte $B4 ; |X XX X  | $FAE3
    .byte $BE ; |X XXXXX | $FAE4
    .byte $B4 ; |X XX X  | $FAE5
    .byte $AF ; |X X XXXX| $FAE6
    .byte $B4 ; |X XX X  | $FAE7
LFAE8:
    .byte $54 ; | X X X  | $FAE8
    .byte $B5 ; |X XX X X| $FAE9
    .byte $45 ; | X   X X| $FAEA
    .byte $B5 ; |X XX X X| $FAEB
    .byte $36 ; |  XX XX | $FAEC
    .byte $B5 ; |X XX X X| $FAED
    .byte $27 ; |  X  XXX| $FAEE
    .byte $B5 ; |X XX X X| $FAEF
    .byte $18 ; |   XX   | $FAF0
    .byte $B5 ; |X XX X X| $FAF1
    .byte $09 ; |    X  X| $FAF2
    .byte $B5 ; |X XX X X| $FAF3
LFAF4:
    .byte $AE ; |X X XXX | $FAF4
    .byte $B5 ; |X XX X X| $FAF5
    .byte $9F ; |X  XXXXX| $FAF6
    .byte $B5 ; |X XX X X| $FAF7
    .byte $90 ; |X  X    | $FAF8
    .byte $B5 ; |X XX X X| $FAF9
    .byte $81 ; |X      X| $FAFA
    .byte $B5 ; |X XX X X| $FAFB
    .byte $72 ; | XXX  X | $FAFC
    .byte $B5 ; |X XX X X| $FAFD
    .byte $63 ; | XX   XX| $FAFE
    .byte $B5 ; |X XX X X| $FAFF
LFB00:
    .byte $08 ; |    X   | $FB00
    .byte $B6 ; |X XX XX | $FB01
    .byte $F9 ; |XXXXX  X| $FB02
    .byte $B5 ; |X XX X X| $FB03
    .byte $EA ; |XXX X X | $FB04
    .byte $B5 ; |X XX X X| $FB05
    .byte $DB ; |XX XX XX| $FB06
    .byte $B5 ; |X XX X X| $FB07
    .byte $CC ; |XX  XX  | $FB08
    .byte $B5 ; |X XX X X| $FB09
    .byte $BD ; |X XXXX X| $FB0A
    .byte $B5 ; |X XX X X| $FB0B
LFB0C:
    .byte $97 ; |X  X XXX| $FB0C
    .byte $B7 ; |X XX XXX| $FB0D
    .byte $5D ; | X XXX X| $FB0E
    .byte $B7 ; |X XX XXX| $FB0F
    .byte $23 ; |  X   XX| $FB10
    .byte $B7 ; |X XX XXX| $FB11
    .byte $E9 ; |XXX X  X| $FB12
    .byte $B6 ; |X XX XX | $FB13
    .byte $AF ; |X X XXXX| $FB14
    .byte $B6 ; |X XX XX | $FB15
    .byte $75 ; | XXX X X| $FB16
    .byte $B6 ; |X XX XX | $FB17
LFB18:
    .byte $3C ; |  XXXX  | $FB18
    .byte $3D ; |  XXXX X| $FB19
    .byte $3E ; |  XXXXX | $FB1A
    .byte $3F ; |  XXXXXX| $FB1B
    .byte $40 ; | X      | $FB1C
    .byte $41 ; | X     X| $FB1D
    .byte $42 ; | X    X | $FB1E
    .byte $43 ; | X    XX| $FB1F
    .byte $44 ; | X   X  | $FB20
    .byte $45 ; | X   X X| $FB21
    .byte $46 ; | X   XX | $FB22
    .byte $47 ; | X   XXX| $FB23
    .byte $48 ; | X  X   | $FB24
    .byte $49 ; | X  X  X| $FB25
    .byte $4A ; | X  X X | $FB26
    .byte $4B ; | X  X XX| $FB27
    .byte $4C ; | X  XX  | $FB28
    .byte $4D ; | X  XX X| $FB29
    .byte $4E ; | X  XXX | $FB2A
    .byte $4F ; | X  XXXX| $FB2B
    .byte $50 ; | X X    | $FB2C
    .byte $51 ; | X X   X| $FB2D
    .byte $52 ; | X X  X | $FB2E
    .byte $53 ; | X X  XX| $FB2F
    .byte $54 ; | X X X  | $FB30
    .byte $55 ; | X X X X| $FB31
    .byte $56 ; | X X XX | $FB32
    .byte $57 ; | X X XXX| $FB33
    .byte $58 ; | X XX   | $FB34
    .byte $59 ; | X XX  X| $FB35
    .byte $5A ; | X XX X | $FB36
    .byte $5B ; | X XX XX| $FB37
    .byte $5C ; | X XXX  | $FB38
LFB39:
    .byte $33 ; |  XX  XX| $FB39
    .byte $23 ; |  X   XX| $FB3A
    .byte $13 ; |   X  XX| $FB3B
    .byte $03 ; |      XX| $FB3C
    .byte $F3 ; |XXXX  XX| $FB3D
    .byte $E3 ; |XXX   XX| $FB3E
    .byte $D3 ; |XX X  XX| $FB3F
    .byte $C3 ; |XX    XX| $FB40
    .byte $B3 ; |X XX  XX| $FB41
    .byte $A3 ; |X X   XX| $FB42
    .byte $93 ; |X  X  XX| $FB43
    .byte $83 ; |X     XX| $FB44
    .byte $64 ; | XX  X  | $FB45
    .byte $54 ; | X X X  | $FB46
    .byte $44 ; | X   X  | $FB47
    .byte $34 ; |  XX X  | $FB48
    .byte $24 ; |  X  X  | $FB49
    .byte $14 ; |   X X  | $FB4A
    .byte $04 ; |     X  | $FB4B
    .byte $F4 ; |XXXX X  | $FB4C
    .byte $E4 ; |XXX  X  | $FB4D
    .byte $D4 ; |XX X X  | $FB4E
    .byte $C4 ; |XX   X  | $FB4F
    .byte $B4 ; |X XX X  | $FB50
    .byte $A4 ; |X X  X  | $FB51
    .byte $94 ; |X  X X  | $FB52
    .byte $84 ; |X    X  | $FB53
    .byte $65 ; | XX  X X| $FB54
    .byte $55 ; | X X X X| $FB55
    .byte $45 ; | X   X X| $FB56
    .byte $35 ; |  XX X X| $FB57
    .byte $25 ; |  X  X X| $FB58
    .byte $15 ; |   X X X| $FB59
    .byte $05 ; |     X X| $FB5A
    .byte $F5 ; |XXXX X X| $FB5B
    .byte $E5 ; |XXX  X X| $FB5C
    .byte $D5 ; |XX X X X| $FB5D
    .byte $C5 ; |XX   X X| $FB5E
    .byte $B5 ; |X XX X X| $FB5F
    .byte $A5 ; |X X  X X| $FB60
    .byte $95 ; |X  X X X| $FB61
    .byte $85 ; |X    X X| $FB62
    .byte $66 ; | XX  XX | $FB63
    .byte $56 ; | X X XX | $FB64
    .byte $46 ; | X   XX | $FB65
    .byte $36 ; |  XX XX | $FB66
    .byte $26 ; |  X  XX | $FB67
    .byte $16 ; |   X XX | $FB68
    .byte $06 ; |     XX | $FB69
    .byte $F6 ; |XXXX XX | $FB6A
    .byte $E6 ; |XXX  XX | $FB6B
    .byte $D6 ; |XX X XX | $FB6C
    .byte $C6 ; |XX   XX | $FB6D
    .byte $B6 ; |X XX XX | $FB6E
    .byte $A6 ; |X X  XX | $FB6F
    .byte $96 ; |X  X XX | $FB70
    .byte $86 ; |X    XX | $FB71
    .byte $67 ; | XX  XXX| $FB72
    .byte $57 ; | X X XXX| $FB73
    .byte $47 ; | X   XXX| $FB74
    .byte $37 ; |  XX XXX| $FB75
    .byte $27 ; |  X  XXX| $FB76
    .byte $17 ; |   X XXX| $FB77
    .byte $07 ; |     XXX| $FB78
    .byte $F7 ; |XXXX XXX| $FB79
    .byte $E7 ; |XXX  XXX| $FB7A
    .byte $D7 ; |XX X XXX| $FB7B
    .byte $C7 ; |XX   XXX| $FB7C
    .byte $B7 ; |X XX XXX| $FB7D
    .byte $A7 ; |X X  XXX| $FB7E
    .byte $97 ; |X  X XXX| $FB7F
    .byte $87 ; |X    XXX| $FB80
    .byte $68 ; | XX X   | $FB81
    .byte $58 ; | X XX   | $FB82
    .byte $48 ; | X  X   | $FB83
    .byte $38 ; |  XXX   | $FB84
    .byte $28 ; |  X X   | $FB85
    .byte $18 ; |   XX   | $FB86
    .byte $08 ; |    X   | $FB87
    .byte $F8 ; |XXXXX   | $FB88
    .byte $E8 ; |XXX X   | $FB89
    .byte $D8 ; |XX XX   | $FB8A
    .byte $C8 ; |XX  X   | $FB8B
    .byte $B8 ; |X XXX   | $FB8C
    .byte $A8 ; |X X X   | $FB8D
    .byte $98 ; |X  XX   | $FB8E
    .byte $88 ; |X   X   | $FB8F
    .byte $69 ; | XX X  X| $FB90
    .byte $59 ; | X XX  X| $FB91
    .byte $49 ; | X  X  X| $FB92
    .byte $39 ; |  XXX  X| $FB93
    .byte $29 ; |  X X  X| $FB94
    .byte $19 ; |   XX  X| $FB95
    .byte $09 ; |    X  X| $FB96
    .byte $F9 ; |XXXXX  X| $FB97
    .byte $E9 ; |XXX X  X| $FB98
    .byte $D9 ; |XX XX  X| $FB99
    .byte $C9 ; |XX  X  X| $FB9A
    .byte $B9 ; |X XXX  X| $FB9B
    .byte $A9 ; |X X X  X| $FB9C
    .byte $99 ; |X  XX  X| $FB9D
    .byte $89 ; |X   X  X| $FB9E
    .byte $6A ; | XX X X | $FB9F
    .byte $5A ; | X XX X | $FBA0
    .byte $4A ; | X  X X | $FBA1
    .byte $3A ; |  XXX X | $FBA2
    .byte $2A ; |  X X X | $FBA3
    .byte $1A ; |   XX X | $FBA4
    .byte $0A ; |    X X | $FBA5
    .byte $FA ; |XXXXX X | $FBA6
    .byte $EA ; |XXX X X | $FBA7
    .byte $DA ; |XX XX X | $FBA8
    .byte $CA ; |XX  X X | $FBA9
    .byte $BA ; |X XXX X | $FBAA
    .byte $AA ; |X X X X | $FBAB
    .byte $9A ; |X  XX X | $FBAC
    .byte $8A ; |X   X X | $FBAD
    .byte $6B ; | XX X XX| $FBAE
    .byte $5B ; | X XX XX| $FBAF
    .byte $4B ; | X  X XX| $FBB0
    .byte $3B ; |  XXX XX| $FBB1
    .byte $2B ; |  X X XX| $FBB2
    .byte $1B ; |   XX XX| $FBB3
    .byte $0B ; |    X XX| $FBB4
    .byte $FB ; |XXXXX XX| $FBB5
    .byte $EB ; |XXX X XX| $FBB6
    .byte $DB ; |XX XX XX| $FBB7
    .byte $CB ; |XX  X XX| $FBB8
    .byte $BB ; |X XXX XX| $FBB9
    .byte $AB ; |X X X XX| $FBBA
    .byte $9B ; |X  XX XX| $FBBB
    .byte $8B ; |X   X XX| $FBBC
    .byte $6C ; | XX XX  | $FBBD
    .byte $5C ; | X XXX  | $FBBE
    .byte $4C ; | X  XX  | $FBBF
    .byte $3C ; |  XXXX  | $FBC0
    .byte $2C ; |  X XX  | $FBC1
    .byte $1C ; |   XXX  | $FBC2
    .byte $0C ; |    XX  | $FBC3
    .byte $FC ; |XXXXXX  | $FBC4
    .byte $EC ; |XXX XX  | $FBC5
    .byte $DC ; |XX XXX  | $FBC6
    .byte $CC ; |XX  XX  | $FBC7
    .byte $BC ; |X XXXX  | $FBC8
    .byte $AC ; |X X XX  | $FBC9
    .byte $9C ; |X  XXX  | $FBCA
    .byte $8C ; |X   XX  | $FBCB
    .byte $6D ; | XX XX X| $FBCC
    .byte $5D ; | X XXX X| $FBCD
    .byte $4D ; | X  XX X| $FBCE
    .byte $3D ; |  XXXX X| $FBCF
    .byte $2D ; |  X XX X| $FBD0
    .byte $1D ; |   XXX X| $FBD1
    .byte $0D ; |    XX X| $FBD2
    .byte $FD ; |XXXXXX X| $FBD3
    .byte $ED ; |XXX XX X| $FBD4
    .byte $DD ; |XX XXX X| $FBD5
    .byte $CD ; |XX  XX X| $FBD6
    .byte $BD ; |X XXXX X| $FBD7
    .byte $AD ; |X X XX X| $FBD8
LFBD9:
    INC    $C5             ; 5
    LDA    $C5             ; 3
    CMP    #$0A            ; 2
    BCC    LFC1F           ; 2³+1
    LDA    #0              ; 2
    STA    $C5             ; 3
LFBE5:
    INC    $C6             ; 5
    LDA    $C6             ; 3
    CMP    #$0A            ; 2
    BCC    LFC1F           ; 2³+1
    LDA    #0              ; 2
    STA    $C6             ; 3
LFBF1:
    INC    $C7             ; 5
    LDA    $C7             ; 3
    CMP    #$0A            ; 2
    BCC    LFC1F           ; 2³+1
    LDA    #0              ; 2
    STA    $C7             ; 3
LFBFD:
    INC    $C8             ; 5
    LDA    $C8             ; 3
    CMP    #$0A            ; 2
    BCC    LFC1F           ; 2³
    LDA    #0              ; 2
    STA    $C8             ; 3
    INC    $C9             ; 5
    LDA    $C9             ; 3
    CMP    #$0A            ; 2
    BCC    LFC1F           ; 2³
    LDA    #0              ; 2
    STA    $C4             ; 3
    STA    $C5             ; 3
    STA    $C6             ; 3
    STA    $C7             ; 3
    STA    $C8             ; 3
    STA    $C9             ; 3
LFC1F:
    RTS                    ; 6

LFC20:
    LDX    $C4             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #0              ; 2
    STA.wy $CA,Y           ; 5
    LDX    $C5             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #2              ; 2
    STA.wy $CA,Y           ; 5
    LDX    $C6             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #4              ; 2
    STA.wy $CA,Y           ; 5
    LDX    $C7             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #6              ; 2
    STA.wy $CA,Y           ; 5
    LDX    $C8             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #8              ; 2
    STA.wy $CA,Y           ; 5
    LDX    $C9             ; 3
    LDA    LFAAD,X         ; 4
    LDY    #$0A            ; 2
    STA.wy $CA,Y           ; 5
LFC5C:
    RTS                    ; 6

    .byte $02 ; |      X | $FC5D
    .byte $1F ; |   XXXXX| $FC5E
    .byte $02 ; |      X | $FC5F
    .byte $19 ; |   XX  X| $FC60
    .byte $02 ; |      X | $FC61
    .byte $18 ; |   XX   | $FC62
    .byte $02 ; |      X | $FC63
    .byte $12 ; |   X  X | $FC64
    .byte $02 ; |      X | $FC65
    .byte $0F ; |    XXXX| $FC66
    .byte $01 ; |       X| $FC67
    .byte $FF ; |XXXXXXXX| $FC68
    .byte $00 ; |        | $FC69
    .byte $03 ; |      XX| $FC6A
    .byte $1F ; |   XXXXX| $FC6B
    .byte $02 ; |      X | $FC6C
    .byte $1B ; |   XX XX| $FC6D
    .byte $02 ; |      X | $FC6E
    .byte $18 ; |   XX   | $FC6F
    .byte $02 ; |      X | $FC70
    .byte $17 ; |   X XXX| $FC71
    .byte $02 ; |      X | $FC72
    .byte $14 ; |   X X  | $FC73
    .byte $02 ; |      X | $FC74
    .byte $12 ; |   X  X | $FC75
    .byte $02 ; |      X | $FC76
    .byte $10 ; |   X    | $FC77
    .byte $02 ; |      X | $FC78
    .byte $0F ; |    XXXX| $FC79
    .byte $03 ; |      XX| $FC7A
    .byte $0D ; |    XX X| $FC7B
    .byte $02 ; |      X | $FC7C
    .byte $0F ; |    XXXX| $FC7D
    .byte $02 ; |      X | $FC7E
    .byte $10 ; |   X    | $FC7F
    .byte $02 ; |      X | $FC80
    .byte $12 ; |   X  X | $FC81
    .byte $02 ; |      X | $FC82
    .byte $14 ; |   X X  | $FC83
    .byte $02 ; |      X | $FC84
    .byte $17 ; |   X XXX| $FC85
    .byte $02 ; |      X | $FC86
    .byte $18 ; |   XX   | $FC87
    .byte $02 ; |      X | $FC88
    .byte $1B ; |   XX XX| $FC89
    .byte $01 ; |       X| $FC8A
    .byte $FF ; |XXXXXXXX| $FC8B
    .byte $01 ; |       X| $FC8C
    .byte $02 ; |      X | $FC8D
    .byte $05 ; |     X X| $FC8E
    .byte $06 ; |     XX | $FC8F
    .byte $07 ; |     XXX| $FC90
    .byte $08 ; |    X   | $FC91
    .byte $09 ; |    X  X| $FC92
    .byte $0A ; |    X X | $FC93
    .byte $0B ; |    X XX| $FC94
    .byte $0C ; |    XX  | $FC95
    .byte $01 ; |       X| $FC96
    .byte $FF ; |XXXXXXXX| $FC97
    .byte $01 ; |       X| $FC98
    .byte $02 ; |      X | $FC99
    .byte $05 ; |     X X| $FC9A
    .byte $06 ; |     XX | $FC9B
    .byte $07 ; |     XXX| $FC9C
    .byte $01 ; |       X| $FC9D
    .byte $FF ; |XXXXXXXX| $FC9E
LFC9F:
    LDA    SWCHA           ; 4
    STA    $86             ; 3
    LDA    $81             ; 3
    CMP    #1              ; 2
    BEQ    LFCB9           ; 2³
    LDA    $81             ; 3
    CMP    #2              ; 2
    BEQ    LFCBC           ; 2³
    LDA    $81             ; 3
    CMP    #3              ; 2
    BEQ    LFCBF           ; 2³
    JMP    LFD8E           ; 3
LFCB9:
    JMP    LFCC2           ; 3
LFCBC:
    JMP    LFD12           ; 3
LFCBF:
    JMP    LFD41           ; 3
LFCC2:
    LDA    $86             ; 3
    AND    #$20            ; 2
    BNE    LFCCB           ; 2³
    JSR    LFECF           ; 6
LFCCB:
    LDA    $82             ; 3
    BNE    LFCE9           ; 2³
    LDA    $85             ; 3
    CMP    #$28            ; 2
    BEQ    LFCD9           ; 2³
    CMP    #$86            ; 2
    BNE    LFCE9           ; 2³
LFCD9:
    LDA    INPT4           ; 3
    BMI    LFCE9           ; 2³
    LDA    #1              ; 2
    STA    $82             ; 3
    LDA    $95             ; 3
    BNE    LFCE9           ; 2³
    LDA    #$30            ; 2
    STA    $A2             ; 3
LFCE9:
    LDA    $86             ; 3
    AND    #$80            ; 2
    BNE    LFCFF           ; 2³
    LDA    $99             ; 3
    CMP    #2              ; 2
    BEQ    LFCFB           ; 2³
    INC    $8F             ; 5
    RTS                    ; 6

    JMP    LFCFF           ; 3
LFCFB:
    JSR    LFEBE           ; 6
    RTS                    ; 6

LFCFF:
    LDA    $86             ; 3
    AND    #$40            ; 2
    BNE    LFD11           ; 2³
    LDA    $99             ; 3
    CMP    #1              ; 2
    BEQ    LFD0E           ; 2³
    DEC    $8F             ; 5
    RTS                    ; 6

LFD0E:
    JSR    LFEE0           ; 6
LFD11:
    RTS                    ; 6

LFD12:
    LDA    $86             ; 3
    AND    #$40            ; 2
    BNE    LFD1B           ; 2³
    JSR    LFEE0           ; 6
LFD1B:
    LDA    $86             ; 3
    AND    #$10            ; 2
    BNE    LFD2E           ; 2³
    LDA    $99             ; 3
    CMP    #3              ; 2
    BEQ    LFD2A           ; 2³
    DEC    $91             ; 5
    RTS                    ; 6

LFD2A:
    JSR    LFEAD           ; 6
    RTS                    ; 6

LFD2E:
    LDA    $86             ; 3
    AND    #$20            ; 2
    BNE    LFD40           ; 2³
    LDA    $99             ; 3
    CMP    #4              ; 2
    BEQ    LFD3D           ; 2³
    INC    $91             ; 5
    RTS                    ; 6

LFD3D:
    JSR    LFECF           ; 6
LFD40:
    RTS                    ; 6

LFD41:
    LDA    $86             ; 3
    AND    #$10            ; 2
    BNE    LFD4A           ; 2³
    JSR    LFEAD           ; 6
LFD4A:
    LDA    $82             ; 3
    BNE    LFD68           ; 2³
    LDA    $85             ; 3
    CMP    #$28            ; 2
    BEQ    LFD58           ; 2³
    CMP    #$86            ; 2
    BNE    LFD68           ; 2³
LFD58:
    LDA    INPT4           ; 3
    BMI    LFD68           ; 2³
    LDA    #3              ; 2
    STA    $82             ; 3
    LDA    $95             ; 3
    BNE    LFD68           ; 2³
    LDA    #$30            ; 2
    STA    $A2             ; 3
LFD68:
    LDA    $86             ; 3
    AND    #$80            ; 2
    BNE    LFD7B           ; 2³
    LDA    $99             ; 3
    CMP    #2              ; 2
    BEQ    LFD77           ; 2³
    INC    $8F             ; 5
    RTS                    ; 6

LFD77:
    JSR    LFEBE           ; 6
    RTS                    ; 6

LFD7B:
    LDA    $86             ; 3
    AND    #$40            ; 2
    BNE    LFD8D           ; 2³
    LDA    $99             ; 3
    CMP    #1              ; 2
    BEQ    LFD8A           ; 2³
    DEC    $8F             ; 5
    RTS                    ; 6

LFD8A:
    JSR    LFEE0           ; 6
LFD8D:
    RTS                    ; 6

LFD8E:
    LDA    $86             ; 3
    AND    #$80            ; 2
    BNE    LFD97           ; 2³
    JSR    LFEBE           ; 6
LFD97:
    LDA    $86             ; 3
    AND    #$10            ; 2
    BNE    LFDAA           ; 2³
    LDA    $99             ; 3
    CMP    #3              ; 2
    BEQ    LFDA6           ; 2³
    DEC    $91             ; 5
    RTS                    ; 6

LFDA6:
    JSR    LFEAD           ; 6
    RTS                    ; 6

LFDAA:
    LDA    $86             ; 3
    AND    #$20            ; 2
    BNE    LFDBC           ; 2³
    LDA    $99             ; 3
    CMP    #4              ; 2
    BEQ    LFDB9           ; 2³
    INC    $91             ; 5
    RTS                    ; 6

LFDB9:
    JSR    LFECF           ; 6
LFDBC:
    RTS                    ; 6

LFDBD:
    LDA    $85             ; 3
    CMP    #$31            ; 2
    BCC    LFDFB           ; 2³
    LDA    CXP0FB          ; 3
    AND    #$40            ; 2
    BEQ    LFDD7           ; 2³
    LDA    #0              ; 2
    STA    $82             ; 3
    JSR    LFFBC           ; 6
    LDA    #0              ; 2
    STA    $95             ; 3
    JMP    LFE13           ; 3
LFDD7:
    LDA    $85             ; 3
    CMP    #$9A            ; 2
    BNE    LFDE8           ; 2³
    LDA    $A4             ; 3
    BEQ    LFDE8           ; 2³
    SEC                    ; 2
    LDA    $A4             ; 3
    SBC    #1              ; 2
    STA    $A4             ; 3
LFDE8:
    LDA    $85             ; 3
    CMP    #$9C            ; 2
    BCC    LFDFB           ; 2³
    LDA    INPT4           ; 3
    BPL    LFDF8           ; 2³
    LDA    #0              ; 2
    STA    $82             ; 3
    STA    $95             ; 3
LFDF8:
    JMP    LFE13           ; 3
LFDFB:
    INC    $85             ; 5
    LDA    $85             ; 3
    CMP    #$9A            ; 2
    BNE    LFE0F           ; 2³
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$11            ; 2
    STA    $DC             ; 3
    LDA    #2              ; 2
    STA    $DB             ; 3
LFE0F:
    LDA    #1              ; 2
    STA    $95             ; 3
LFE13:
    LDA    $82             ; 3
    CMP    #1              ; 2
    BEQ    LFE1E           ; 2³
    CMP    #3              ; 2
    BEQ    LFE1E           ; 2³
    RTS                    ; 6

LFE1E:
    LDX    $90             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LFE2B:
    DEY                    ; 2
    BPL    LFE2B           ; 2³
    STA    RESBL           ; 3
    STA    HMBL            ; 3
    STA    WSYNC           ; 3
    RTS                    ; 6

LFE35:
    LDA    $85             ; 3
    CMP    #$81            ; 2
    BCS    LFE73           ; 2³
    LDA    CXP0FB          ; 3
    AND    #$40            ; 2
    BEQ    LFE4F           ; 2³
    LDA    #0              ; 2
    STA    $82             ; 3
    JSR    LFFBC           ; 6
    LDA    #0              ; 2
    STA    $95             ; 3
    JMP    LFE8B           ; 3
LFE4F:
    LDA    $85             ; 3
    CMP    #$15            ; 2
    BNE    LFE60           ; 2³
    LDA    $A4             ; 3
    BEQ    LFE60           ; 2³
    SEC                    ; 2
    LDA    $A4             ; 3
    SBC    #1              ; 2
    STA    $A4             ; 3
LFE60:
    LDA    $85             ; 3
    CMP    #$13            ; 2
    BCS    LFE73           ; 2³
    LDA    INPT4           ; 3
    BPL    LFE70           ; 2³
    LDA    #0              ; 2
    STA    $82             ; 3
    STA    $95             ; 3
LFE70:
    JMP    LFE8B           ; 3
LFE73:
    DEC    $85             ; 5
    LDA    $85             ; 3
    CMP    #$15            ; 2
    BNE    LFE87           ; 2³
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$11            ; 2
    STA    $DC             ; 3
    LDA    #2              ; 2
    STA    $DB             ; 3
LFE87:
    LDA    #3              ; 2
    STA    $95             ; 3
LFE8B:
    LDA    $82             ; 3
    CMP    #3              ; 2
    BEQ    LFE96           ; 2³
    CMP    #1              ; 2
    BEQ    LFE96           ; 2³
    RTS                    ; 6

LFE96:
    LDX    $90             ; 3
    LDA    LFB39,X         ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFB39,X         ; 4
    STA    WSYNC           ; 3
LFEA3:
    DEY                    ; 2
    BPL    LFEA3           ; 2³
    STA    RESBL           ; 3
    STA    HMBL            ; 3
    STA    WSYNC           ; 3
    RTS                    ; 6

LFEAD:
    LDA    #1              ; 2
    STA    $81             ; 3
    LDA    #3              ; 2
    STA    $83             ; 3
    LDA    #$4C            ; 2
    STA    $8F             ; 3
    LDA    #$27            ; 2
    STA    $91             ; 3
    RTS                    ; 6

LFEBE:
    LDA    #2              ; 2
    STA    $81             ; 3
    LDA    #4              ; 2
    STA    $83             ; 3
    LDA    #$78            ; 2
    STA    $8F             ; 3
    LDA    #$56            ; 2
    STA    $91             ; 3
    RTS                    ; 6

LFECF:
    LDA    #3              ; 2
    STA    $81             ; 3
    LDA    #1              ; 2
    STA    $83             ; 3
    LDA    #$4C            ; 2
    STA    $8F             ; 3
    LDA    #$86            ; 2
    STA    $91             ; 3
    RTS                    ; 6

LFEE0:
    LDA    #4              ; 2
    STA    $81             ; 3
    LDA    #2              ; 2
    STA    $83             ; 3
    LDA    #$1E            ; 2
    STA    $8F             ; 3
    LDA    #$56            ; 2
    STA    $91             ; 3
    RTS                    ; 6

LFEF1:
    LDA    $A7             ; 3
    AND    #$03            ; 2
    CMP    #3              ; 2
    BNE    LFEFD           ; 2³
    LDA    #1              ; 2
    STA    $B5             ; 3
LFEFD:
    CMP    #2              ; 2
    BNE    LFF05           ; 2³
    LDA    #1              ; 2
    STA    $B5             ; 3
LFF05:
    RTS                    ; 6

LFF06:
    LDA    $B3             ; 3
    CMP    #1              ; 2
    BEQ    LFF26           ; 2³
    LDA    CXPPMM          ; 3
    BPL    LFF26           ; 2³
    LDA    $A4             ; 3
    CMP    #1              ; 2
    BNE    LFF1A           ; 2³
    LDA    $82             ; 3
    BNE    LFF26           ; 2³
LFF1A:
    LDA    $A4             ; 3
    BEQ    LFF26           ; 2³
    DEC    $A4             ; 5
    LDA    #1              ; 2
    STA    $A2             ; 3
    STA    $B3             ; 3
LFF26:
    RTS                    ; 6

LFF27:
    LDA    $93             ; 3
    CMP    #$C0            ; 2
    BNE    LFF3B           ; 2³
    LDA    #1              ; 2
    STA    $9C             ; 3
    LDA    $A7             ; 3
    AND    #$1F            ; 2
    TAX                    ; 2
    LDA    LFB18,X         ; 4
    STA    $92             ; 3
LFF3B:
    RTS                    ; 6

LFF3C:
    LDA    #0              ; 2
    STA    $AE             ; 3
    LDA    $9B             ; 3
    STA    $9D             ; 3
    LDA    $B0             ; 3
    CMP    #1              ; 2
    BEQ    LFF5A           ; 2³
    LDA    $B1             ; 3
    BEQ    LFF5A           ; 2³
    DEC    $B1             ; 5
    LDA    $B1             ; 3
    CMP    #0              ; 2
    BNE    LFF5A           ; 2³
    LDA    #0              ; 2
    STA    $A4             ; 3
LFF5A:
    LDA    #0              ; 2
    STA    $B0             ; 3
    RTS                    ; 6

LFF5F:
    LDA    $9F             ; 3
    CMP    #0              ; 2
    BNE    LFF69           ; 2³
    LDA    #0              ; 2
    STA    $A8             ; 3
LFF69:
    LDA    $9F             ; 3
    CMP    #1              ; 2
    BNE    LFF73           ; 2³
    LDA    #$20            ; 2
    STA    $A9             ; 3
LFF73:
    LDA    $9F             ; 3
    CMP    #2              ; 2
    BNE    LFF7D           ; 2³
    LDA    #$40            ; 2
    STA    $AA             ; 3
LFF7D:
    RTS                    ; 6

LFF7E:
    LDA    #1              ; 2
    STA    $9C             ; 3
    LDA    $A7             ; 3
    AND    #$1F            ; 2
    TAX                    ; 2
    LDA    LFB18,X         ; 4
    STA    $92             ; 3
    RTS                    ; 6

    LDA    #1              ; 2
    STA    $AE             ; 3
    STA    $B0             ; 3
    STA    $B8             ; 3
    STA    $AE             ; 3
    LDA    #0              ; 2
    STA    $B5             ; 3
    LDA    #$4B            ; 2
    STA    $B6             ; 3
    RTS                    ; 6

LFFA0:
    LDA    #0              ; 2
    STA    AUDV1           ; 3
    STA    AUDC1           ; 3
    STA    AUDF1           ; 3
    STA    $DB             ; 3
    RTS                    ; 6

LFFAB:
    LDA    $A4             ; 3
    BEQ    LFFBB           ; 2³
    LDA    #3              ; 2
    STA    $DB             ; 3
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$11            ; 2
    STA    $DC             ; 3
LFFBB:
    RTS                    ; 6

LFFBC:
    LDA    #$FF            ; 2
    STA    AUDV1           ; 3
    LDA    #$11            ; 2
    STA    $DC             ; 3
    LDA    #1              ; 2
    STA    $DB             ; 3
    RTS                    ; 6

LFFC9:
    LDA    #0              ; 2
    STA    $A2             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    AUDC0           ; 3
    STA    AUDC1           ; 3
    STA    AUDF0           ; 3
    STA    AUDF1           ; 3
    RTS                    ; 6

    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $00 ; |        | $FFDE
    .byte $00 ; |        | $FFDF
    .byte $00 ; |        | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $00 ; |        | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
LFFEA:
    LDA    $C0             ; 3
    AND    #$F0            ; 2
    CMP    #$F0            ; 2
    BEQ    LFFF5           ; 2³
    LDA    LFFF8           ; 4
LFFF5:
    JMP.ind ($00BF)        ; 5
LFFF8:
    .byte $00 ; |        | $FFF8
LFFF9:
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $F0 ; |XXXX    | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $F0 ; |XXXX    | $FFFF
