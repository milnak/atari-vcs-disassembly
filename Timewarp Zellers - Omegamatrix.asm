; Disassembly of time(zel).bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfctimezel.cfg time(zel).bin 
;
; timezel.cfg contents:
;
;      ORG 7000
;      CODE 7000 74BC
;      GFX 74BD 74F4
;      CODE 74F5 7AAE
;      GFX 7AAF 7AAF
;      CODE 7AB0 7AFF
;      GFX 7B00 7B8E
;      CODE 7B8F 7BF5
;      GFX 7BF6 7CBA
;      CODE 7CBB 7CE4
;      GFX 7CE5 7F57
;      CODE 7F58 7FAF
;      GFX 7FB0 7FD0
;      CODE 7FD1 7FF4
;      GFX 7FF5 7FFF

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
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
L7A73   =   $7A73

       ORG $7000
    CLD                    ; 2
    LDX    #$00            ; 2
    LDA    #$00            ; 2
L7005:
    STA    VSYNC,X         ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    L7005           ; 2
    LDA    #$22            ; 2
    STA    TIM64T          ; 4
    JSR    L7BBD           ; 6
L7013:
    LDA    INTIM           ; 4
    BNE    L7013           ; 2
    LDA    #$82            ; 2
    STA    WSYNC           ; 3
    STA    VBLANK          ; 3
    STA    VSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    STA    VSYNC           ; 3
    STA    VBLANK          ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    LDA    #$24            ; 2
    STA    TIM64T          ; 4
    LDA    $B1             ; 3
    CMP    #$88            ; 2
    BCS    L706F           ; 2
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BNE    L707A           ; 2
    LDX    $B2             ; 3
    INX                    ; 2
    CPX    #$04            ; 2
    BCC    L7057           ; 2
    LDX    #$01            ; 2
L7057:
    STX    $B2             ; 3
    STX    $B5             ; 3
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $BE             ; 3
    STA    $BD             ; 3
    STA    $B3             ; 3
    STA    $B4             ; 3
    LDA    #$88            ; 2
    STA    $B1             ; 3
    BNE    L707E           ; 2
L706F:
    LDA    SWCHB           ; 4
    AND    #$02            ; 2
    BEQ    L707A           ; 2
    LDA    #$80            ; 2
    STA    $B1             ; 3
L707A:
    LDA    $B1             ; 3
    BNE    L707E           ; 2
L707E:
    LDA    $8C             ; 3
    LDX    #$02            ; 2
    JSR    L7BAB           ; 6
    LDA    $A9             ; 3
    LDX    #$03            ; 2
    JSR    L7BAB           ; 6
    LDA    $AD             ; 3
    LDX    #$04            ; 2
    JSR    L7BAB           ; 6
L7093:
    LDA    INTIM           ; 4
    BNE    L7093           ; 2
    LDA    #$1A            ; 2
    LDX    #$00            ; 2
    LDY    $BD             ; 3
    JSR    L79DB           ; 6
    LDA    $85             ; 3
    LDX    #$00            ; 2
    JSR    L7BAB           ; 6
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    ENAM0           ; 3
    STX    ENAM1           ; 3
    STX    ENABL           ; 3
    STA    CXCLR           ; 3
    LDA    $B7             ; 3
    CMP    #$20            ; 2
    BEQ    L70D2           ; 2
    CMP    #$40            ; 2
    BEQ    L70D2           ; 2
    LDA    #$4B            ; 2
    STA    $8F             ; 3
    LDA    #$56            ; 2
    STA    COLUPF          ; 3
    LDX    #$08            ; 2
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    JSR    L7554           ; 6
    JMP    L7162           ; 3
L70D2:
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
    LDA    #$34            ; 2
    STA    COLUPF          ; 3
    LDA    $98             ; 3
    LDX    #$01            ; 2
    JSR    L7BAB           ; 6
    STX    CTRLPF          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$A0            ; 2
    LDA    #$00            ; 2
    STA    PF0             ; 3
    LDA    #$27            ; 2
    STA    $C0             ; 3
    STA    WSYNC           ; 3
    STA    HMCLR           ; 3
L70F5:
    LDY    $89             ; 3
    STA    WSYNC           ; 3
    BEQ    L7103           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    DEC    $89             ; 5
    BPL    L710B           ; 2
L7103:
    CPX    $86             ; 3
    BNE    L710B           ; 2
    LDA    #$09            ; 2
    STA    $89             ; 3
L710B:
    LDY    $C0             ; 3
    LDA    L7B67,Y         ; 4
    STA    PF1             ; 3
    LDA    L7C93,Y         ; 4
    STA    PF2             ; 3
    LDY    $89             ; 3
    LDA    ($8A),Y         ; 5
    STA    COLUP0          ; 3
    LDY    $A6             ; 3
    LDA    ($A4),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($A7),Y         ; 5
    STA    COLUP1          ; 3
    DEX                    ; 2
    STA    WSYNC           ; 3
    LDY    $89             ; 3
    BEQ    L713A           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($8A),Y         ; 5
    STA    COLUP0          ; 3
    DEC    $89             ; 5
    BPL    L7142           ; 2
L713A:
    CPX    $86             ; 3
    BNE    L7142           ; 2
    LDA    #$09            ; 2
    STA    $89             ; 3
L7142:
    TXA                    ; 2
    AND    #$02            ; 2
    BNE    L7149           ; 2
    DEC    $C0             ; 5
L7149:
    LDY    $A6             ; 3
    BEQ    L7152           ; 2
    DEC    $A6             ; 5
    JMP    L715A           ; 3
L7152:
    CPX    $99             ; 3
    BNE    L715A           ; 2
    LDA    #$13            ; 2
    STA    $A6             ; 3
L715A:
    DEX                    ; 2
    BNE    L70F5           ; 2
    JMP    L71E4           ; 3
L7160:
    STA    WSYNC           ; 3
L7162:
    LDY    $89             ; 3
    BEQ    L716E           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    DEC    $89             ; 5
    BPL    L7178           ; 2
L716E:
    LDA    $8F             ; 3
    CMP    $86             ; 3
    BNE    L7178           ; 2
    LDA    #$09            ; 2
    STA    $89             ; 3
L7178:
    LDY    #$FF            ; 2
    LDA    $8F             ; 3
    CMP    $8D             ; 3
    BNE    L7182           ; 2
    STY    ENAM0           ; 3
L7182:
    CMP    $AA             ; 3
    BNE    L7188           ; 2
    STY    ENAM1           ; 3
L7188:
    CMP    $AE             ; 3
    BNE    L718E           ; 2
    STY    ENABL           ; 3
L718E:
    DEC    $8F             ; 5
    BEQ    L71E1           ; 2
    CMP    $91,X           ; 4
    BEQ    L71C1           ; 2
    LDY    $89             ; 3
    STA    WSYNC           ; 3
    BEQ    L71A6           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($8A),Y         ; 5
    STA    COLUP0          ; 3
    DEC    $89             ; 5
L71A6:
    LDY    $A6             ; 3
    BEQ    L71B4           ; 2
    LDA    ($A4),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($A7),Y         ; 5
    STA    COLUP1          ; 3
    DEC    $A6             ; 5
L71B4:
    LDA    #$00            ; 2
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    STA    HMCLR           ; 3
    JMP    L7160           ; 3
L71C1:
    LDA    $90,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    STA    WSYNC           ; 3
    SEC                    ; 2
L71C8:
    SBC    #$0F            ; 2
    BCS    L71C8           ; 2
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP1            ; 3
    STA    RESP1           ; 3
    LDY    #$07            ; 2
    STY    $A6             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    JMP    L7162           ; 3
L71E1:
    JSR    L7554           ; 6
L71E4:
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    ENAM0           ; 3
    STA    ENAM1           ; 3
    STA    ENABL           ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    LDA    #$20            ; 2
    STA    CTRLPF          ; 3
    LDA    #$9C            ; 2
    STA    COLUPF          ; 3
    STA    WSYNC           ; 3
    LDA    #$00            ; 2
    LDY    #$04            ; 2
    LDX    $B6             ; 3
    BEQ    L721C           ; 2
    CPX    #$08            ; 2
    BCC    L720E           ; 2
    LDX    #$08            ; 2
    STX    $B6             ; 3
L720E:
    SEC                    ; 2
    ROR                    ; 2
    ROR                    ; 2
    DEX                    ; 2
    BEQ    L721C           ; 2
    DEY                    ; 2
    BNE    L720E           ; 2
    TAY                    ; 2
    LDA    #$00            ; 2
    BEQ    L7223           ; 2
L721C:
    STA    WSYNC           ; 3
    TAY                    ; 2
    LDA    #$00            ; 2
    BEQ    L7229           ; 2
L7223:
    SEC                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    DEX                    ; 2
    BNE    L7223           ; 2
L7229:
    TAX                    ; 2
    LDA    #$06            ; 2
    STA    $DC             ; 3
L722E:
    STA    WSYNC           ; 3
    DEC.w  $00DC           ; 6
    BEQ    L7252           ; 2
    LDA    #$00            ; 2
    STA.w  $000D           ; 4
    STY.w  $000E           ; 4
    STX.w  $000F           ; 4
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA.w  $000E           ; 4
    STA.w  $000F           ; 4
    JMP    L722E           ; 3
L7252:
    JSR    L7F58           ; 6
    LDA    #$27            ; 2
    STA    TIM64T          ; 4
    DEC    $BB             ; 5
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BEQ    L7296           ; 2
    LDA    $BB             ; 3
    AND    #$07            ; 2
    BEQ    L726D           ; 2
    CMP    #$04            ; 2
    BNE    L7270           ; 2
L726D:
    JSR    L7607           ; 6
L7270:
    LDA    $B1             ; 3
    BNE    L72CB           ; 2
    LDA    $BB             ; 3
    AND    #$07            ; 2
    BNE    L727D           ; 2
    JSR    L782A           ; 6
L727D:
    LDA    $B7             ; 3
    CMP    #$20            ; 2
    BEQ    L7293           ; 2
    CMP    #$40            ; 2
    BEQ    L7293           ; 2
    JSR    L78DA           ; 6
    JSR    L784E           ; 6
    JSR    L774E           ; 6
    JMP    L7013           ; 3
L7293:
    JSR    L76CD           ; 6
L7296:
    LDA    SWCHB           ; 4
    AND    #$01            ; 2
    BNE    L72C8           ; 2
L729D:
    LDA    #$14            ; 2
    STA    $C2             ; 3
    LDA    #$00            ; 2
    STA    $B3             ; 3
    STA    $B4             ; 3
    STA    $B5             ; 3
    STA    $BD             ; 3
    STA    $B1             ; 3
    STA    $BE             ; 3
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    LDX    #$40            ; 2
    LDA    $B2             ; 3
    STA    $C1             ; 3
    CMP    #$02            ; 2
    BNE    L72BF           ; 2
    LDX    #$20            ; 2
L72BF:
    STX    $B7             ; 3
    LDA    #$04            ; 2
    STA    $B6             ; 3
    JMP    L7338           ; 3
L72C8:
    JMP    L7013           ; 3
L72CB:
    CMP    #$01            ; 2
    BEQ    L72E1           ; 2
    CMP    #$60            ; 2
    BEQ    L7338           ; 2
    CMP    #$61            ; 2
    BEQ    L72DE           ; 2
    CMP    #$62            ; 2
    BEQ    L732C           ; 2
    JMP    L7457           ; 3
L72DE:
    JMP    L74F5           ; 3
L72E1:
    LDA    $BB             ; 3
    AND    #$0F            ; 2
    BNE    L72EA           ; 2
    JSR    L782A           ; 6
L72EA:
    LDA    #$39            ; 2
    STA    $87             ; 3
    LDA    #$00            ; 2
    STA    $AA             ; 3
    STA    $AE             ; 3
    INC    $BD             ; 5
    INC    $BD             ; 5
    BNE    L7322           ; 2
    LDA    #$62            ; 2
    STA    $B1             ; 3
    STA    $BB             ; 3
    LDA    $B6             ; 3
    BEQ    L7325           ; 2
    DEC    $B6             ; 5
    LDA    $B7             ; 3
    CMP    #$20            ; 2
    BEQ    L731F           ; 2
    CMP    #$40            ; 2
    BEQ    L731F           ; 2
    LDX    #$08            ; 2
L7312:
    LDA    L7CE5,X         ; 4
    STA    $90,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BPL    L7312           ; 2
    LDA    #$23            ; 2
    STA    $86             ; 3
L731F:
    JSR    L7CCE           ; 6
L7322:
    JMP    L7013           ; 3
L7325:
    LDA    #$44            ; 2
    STA    $B1             ; 3
    JMP    L7013           ; 3
L732C:
    LDA    $BB             ; 3
    BNE    L7332           ; 2
    STA    $B1             ; 3
L7332:
    JMP    L7013           ; 3
L7335:
    JMP    L73DC           ; 3
L7338:
    JSR    L733E           ; 6
    JMP    L7013           ; 3
L733E:
    LDA    #$FB            ; 2
    STA    $8B             ; 3
    LDA    #$FC            ; 2
    STA    $A8             ; 3
    LDA    $B7             ; 3
    CMP    #$11            ; 2
    BCC    L737E           ; 2
    BEQ    L738B           ; 2
    CMP    #$20            ; 2
    BCC    L7398           ; 2
    BEQ    L7366           ; 2
    CMP    #$31            ; 2
    BCC    L73C2           ; 2
    BEQ    L73CF           ; 2
    CMP    #$40            ; 2
    BCC    L7335           ; 2
    LDA    $B2             ; 3
    CMP    #$03            ; 2
    BEQ    L73B1           ; 2
    BNE    L736C           ; 2
L7366:
    LDA    $B2             ; 3
    CMP    #$01            ; 2
    BEQ    L73B1           ; 2
L736C:
    LDA    #$10            ; 2
    LDX    #$09            ; 2
    JSR    L7445           ; 6
    LDA    #$42            ; 2
    LDX    #$42            ; 2
    LDY    $C1             ; 3
    BEQ    L73F5           ; 2
    JMP    L73FE           ; 3
L737E:
    LDA    #$11            ; 2
    LDX    #$10            ; 2
    JSR    L7445           ; 6
    LDA    #$42            ; 2
    LDX    #$49            ; 2
    BNE    L73F5           ; 2
L738B:
    LDA    #$12            ; 2
    LDX    #$17            ; 2
    JSR    L7445           ; 6
    LDA    #$42            ; 2
    LDX    #$50            ; 2
    BNE    L73F5           ; 2
L7398:
    LDA    $C1             ; 3
    BEQ    L73A2           ; 2
    LDA    #$00            ; 2
    STA    $C1             ; 3
    BEQ    L736C           ; 2
L73A2:
    LDA    #$20            ; 2
    STA    $C1             ; 3
    LDX    #$26            ; 2
    JSR    L7445           ; 6
    LDA    #$54            ; 2
    LDX    #$6D            ; 2
    BNE    L7408           ; 2
L73B1:
    LDA    #$30            ; 2
    LDX    #$10            ; 2
    JSR    L7445           ; 6
    LDA    #$4B            ; 2
    LDX    #$57            ; 2
    LDY    $C1             ; 3
    BEQ    L73F5           ; 2
    BNE    L73FE           ; 2
L73C2:
    LDA    #$31            ; 2
    LDX    #$17            ; 2
    JSR    L7445           ; 6
    LDA    #$4B            ; 2
    LDX    #$5E            ; 2
    BNE    L73F5           ; 2
L73CF:
    LDA    #$32            ; 2
    LDX    #$1E            ; 2
    JSR    L7445           ; 6
    LDA    #$4B            ; 2
    LDX    #$65            ; 2
    BNE    L73F5           ; 2
L73DC:
    LDA    $C1             ; 3
    BEQ    L73E6           ; 2
    LDA    #$00            ; 2
    STA    $C1             ; 3
    BEQ    L73B1           ; 2
L73E6:
    LDA    #$40            ; 2
    STA    $C1             ; 3
    LDX    #$26            ; 2
    JSR    L7445           ; 6
    LDA    #$5D            ; 2
    LDX    #$80            ; 2
    BNE    L7408           ; 2
L73F5:
    STA    $8A             ; 3
    STX    $A7             ; 3
    LDA    #$61            ; 2
    STA    $B1             ; 3
    RTS                    ; 6

L73FE:
    STA    $8A             ; 3
    STX    $A7             ; 3
    JSR    L7CBB           ; 6
    JMP    L743E           ; 3
L7408:
    STA    $8A             ; 3
    STX    $A7             ; 3
    LDA    $99             ; 3
    ASL                    ; 2
    AND    #$F8            ; 2
    ORA    #$01            ; 2
    CMP    #$28            ; 2
    BCS    L7419           ; 2
    LDA    #$27            ; 2
L7419:
    CMP    #$9E            ; 2
    BCC    L741F           ; 2
    LDA    #$9E            ; 2
L741F:
    STA    $99             ; 3
    LDA    #$92            ; 2
    STA    $98             ; 3
    LDA    #$00            ; 2
    STA    $91             ; 3
    STA    $93             ; 3
    STA    $95             ; 3
    STA    $97             ; 3
    LDA    #$03            ; 2
    STA    $85             ; 3
    LDA    $86             ; 3
    ASL                    ; 2
    CMP    #$7D            ; 2
    BCC    L743C           ; 2
    LDA    #$7D            ; 2
L743C:
    STA    $86             ; 3
L743E:
    LDA    #$62            ; 2
    STA    $B1             ; 3
    STA    $BB             ; 3
    RTS                    ; 6

L7445:
    STA    $B7             ; 3
    STX    $A4             ; 3
    SED                    ; 2
    CLC                    ; 2
    LDA    $C2             ; 3
    ADC    #$05            ; 2
    BCC    L7453           ; 2
    LDA    #$99            ; 2
L7453:
    STA    $C2             ; 3
    CLD                    ; 2
    RTS                    ; 6

L7457:
    CMP    #$37            ; 2
    BEQ    L7492           ; 2
    CMP    #$44            ; 2
    BNE    L7487           ; 2
    LDA    REFP1           ; 3
    AND    #$80            ; 2
    BNE    L7468           ; 2
    JMP    L729D           ; 3
L7468:
    LDA    $BB             ; 3
    BNE    L7487           ; 2
    LDX    #$01            ; 2
    LDA    $B7             ; 3
    CMP    #$20            ; 2
    BEQ    L747E           ; 2
    CMP    #$40            ; 2
    BEQ    L747E           ; 2
    ORA    #$03            ; 2
    STA    $B7             ; 3
    LDX    #$00            ; 2
L747E:
    STX    $C1             ; 3
    JSR    L733E           ; 6
    LDA    #$44            ; 2
    STA    $B1             ; 3
L7487:
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $BE             ; 3
    JMP    L7013           ; 3
L7492:
    LDA    $BB             ; 3
    AND    #$07            ; 2
    BNE    L74B1           ; 2
    LDY    $C3             ; 3
    BEQ    L74B8           ; 2
    LDA    L74BD,Y         ; 4
    STA    AUDF0           ; 3
    LDA    #$0C            ; 2
    STA    AUDC0           ; 3
    LDA    #$08            ; 2
    STA    AUDV0           ; 3
L74A9:
    DEC    $C3             ; 5
    BPL    L74B1           ; 2
    LDA    #$60            ; 2
    STA    $B1             ; 3
L74B1:
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    JMP    L7013           ; 3
L74B8:
    STY    AUDV0           ; 3
    JMP    L74A9           ; 3
L74BD:
    .byte $00 ; |        | $74BD
    .byte $00 ; |        | $74BE
    .byte $00 ; |        | $74BF
    .byte $1A ; |   XX X | $74C0
    .byte $1A ; |   XX X | $74C1
    .byte $1A ; |   XX X | $74C2
    .byte $14 ; |   X X  | $74C3
    .byte $17 ; |   X XXX| $74C4
    .byte $1A ; |   XX X | $74C5
    .byte $1D ; |   XXX X| $74C6
    .byte $1D ; |   XXX X| $74C7
    .byte $00 ; |        | $74C8
    .byte $11 ; |   X   X| $74C9
    .byte $11 ; |   X   X| $74CA
    .byte $00 ; |        | $74CB
    .byte $11 ; |   X   X| $74CC
    .byte $00 ; |        | $74CD
    .byte $11 ; |   X   X| $74CE
    .byte $11 ; |   X   X| $74CF
    .byte $00 ; |        | $74D0
    .byte $0F ; |    XXXX| $74D1
    .byte $0F ; |    XXXX| $74D2
    .byte $00 ; |        | $74D3
    .byte $0F ; |    XXXX| $74D4
    .byte $00 ; |        | $74D5
    .byte $0F ; |    XXXX| $74D6
    .byte $0F ; |    XXXX| $74D7
    .byte $00 ; |        | $74D8
    .byte $1A ; |   XX X | $74D9
    .byte $00 ; |        | $74DA
    .byte $1A ; |   XX X | $74DB
    .byte $14 ; |   X X  | $74DC
    .byte $14 ; |   X X  | $74DD
    .byte $13 ; |   X  XX| $74DE
    .byte $00 ; |        | $74DF
    .byte $13 ; |   X  XX| $74E0
    .byte $00 ; |        | $74E1
    .byte $13 ; |   X  XX| $74E2
    .byte $00 ; |        | $74E3
    .byte $13 ; |   X  XX| $74E4
    .byte $13 ; |   X  XX| $74E5
    .byte $1A ; |   XX X | $74E6
    .byte $1A ; |   XX X | $74E7
    .byte $00 ; |        | $74E8
    .byte $1A ; |   XX X | $74E9
    .byte $00 ; |        | $74EA
    .byte $1A ; |   XX X | $74EB
    .byte $1A ; |   XX X | $74EC
    .byte $00 ; |        | $74ED
    .byte $1A ; |   XX X | $74EE
    .byte $1A ; |   XX X | $74EF
    .byte $00 ; |        | $74F0
    .byte $1A ; |   XX X | $74F1
    .byte $00 ; |        | $74F2
    .byte $1A ; |   XX X | $74F3
    .byte $1A ; |   XX X | $74F4
L74F5:
    LDA    $BB             ; 3
    AND    #$0F            ; 2
    BNE    L7551           ; 2
    LDY    #$00            ; 2
    STY    $AA             ; 3
    STY    $AE             ; 3
    LDX    #$08            ; 2
L7503:
    STX    $A6             ; 3
    LDA    $91,X           ; 4
    CMP    L7CE6,X         ; 4
    BEQ    L753F           ; 2
    LDY    #$FF            ; 2
    BCC    L7528           ; 2
L7510:
    LDA    $91,X           ; 4
    CMP    L7CE6,X         ; 4
    BEQ    L7519           ; 2
    DEC    $91,X           ; 6
L7519:
    LDA    #$92            ; 2
    CMP    $90,X           ; 4
    BEQ    L7521           ; 2
    INC    $90,X           ; 6
L7521:
    DEX                    ; 2
    DEX                    ; 2
    BPL    L7510           ; 2
    JMP    L753F           ; 3
L7528:
    LDA    $91,X           ; 4
    CMP    L7CE6,X         ; 4
    BEQ    L7531           ; 2
    INC    $91,X           ; 6
L7531:
    LDA    #$92            ; 2
    CMP    $90,X           ; 4
    BEQ    L7539           ; 2
    INC    $90,X           ; 6
L7539:
    INX                    ; 2
    INX                    ; 2
    CPX    #$09            ; 2
    BCC    L7528           ; 2
L753F:
    LDX    $A6             ; 3
    DEX                    ; 2
    DEX                    ; 2
    BPL    L7503           ; 2
    CPY    #$00            ; 2
    BNE    L7551           ; 2
    LDY    #$62            ; 2
    STY    $B1             ; 3
    LDA    #$05            ; 2
    STA    $BB             ; 3
L7551:
    JMP    L7013           ; 3
L7554:
    LDA    #$07            ; 2
    STA    $C0             ; 3
L7558:
    STA    WSYNC           ; 3
    LDY    $C0             ; 3
    LDA    ($C4),Y         ; 5
    STA    PF0             ; 3
    LDA    ($C6),Y         ; 5
    STA    PF1             ; 3
    LDA    ($C8),Y         ; 5
    STA    PF2             ; 3
    LDA    ($CA),Y         ; 5
    STA    PF0             ; 3
    LDA    ($CC),Y         ; 5
    STA    PF1             ; 3
    LDA    ($CE),Y         ; 5
    STA    PF2             ; 3
    LDY    $89             ; 3
    BEQ    L757E           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    DEC    $89             ; 5
L757E:
    LDA    $86             ; 3
    CMP    $8F             ; 3
    BNE    L7588           ; 2
    LDA    #$09            ; 2
    STA    $89             ; 3
L7588:
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    ENAM0           ; 3
    LDY    $89             ; 3
    BEQ    L759A           ; 2
    LDA    ($87),Y         ; 5
    DEC    $89             ; 5
L759A:
    DEC    $8F             ; 5
    DEC    $C0             ; 5
    STA    GRP0            ; 3
    BPL    L7558           ; 2
    RTS                    ; 6

L75A3:
    AND    #$04            ; 2
    BEQ    L75B1           ; 2
    LDA    $BE             ; 3
    AND    #$FB            ; 2
    STA    $BE             ; 3
    LDA    #$02            ; 2
    STA    $80             ; 3
L75B1:
    LDA    #$08            ; 2
    STA    AUDC0           ; 3
    DEC    $80             ; 5
    BMI    L75CB           ; 2
    LDX    $80             ; 3
    LDA    L7BFA,X         ; 4
    STA    AUDF0           ; 3
    LDA    #$17            ; 2
    STA    AUDV0           ; 3
    LDA    $BE             ; 3
    AND    #$3B            ; 2
    JMP    L7613           ; 3
L75CB:
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    LDA    $BE             ; 3
    AND    #$BB            ; 2
    STA    $BE             ; 3
    AND    #$3B            ; 2
    JMP    L7613           ; 3
L75DA:
    AND    #$01            ; 2
    BEQ    L75E8           ; 2
    LDA    $BE             ; 3
    AND    #$FE            ; 2
    STA    $BE             ; 3
    LDA    #$02            ; 2
    STA    $83             ; 3
L75E8:
    LDA    #$08            ; 2
    STA    AUDC1           ; 3
    DEC    $83             ; 5
    BMI    L75FC           ; 2
    LDX    $83             ; 3
    LDA    L7CF9,X         ; 4
    STA    AUDF1           ; 3
    LDA    #$16            ; 2
    STA    AUDV1           ; 3
    RTS                    ; 6

L75FC:
    LDA    #$00            ; 2
    STA    AUDV1           ; 3
    LDA    $BE             ; 3
    AND    #$EE            ; 2
    STA    $BE             ; 3
    RTS                    ; 6

L7607:
    LDA    $BE             ; 3
    BEQ    L761C           ; 2
    CMP    #$80            ; 2
    BCS    L7623           ; 2
L760F:
    CMP    #$40            ; 2
    BCS    L75A3           ; 2
L7613:
    CMP    #$20            ; 2
    BCS    L767C           ; 2
L7617:
    CMP    #$10            ; 2
    BCS    L75DA           ; 2
    RTS                    ; 6

L761C:
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    RTS                    ; 6

L7623:
    AND    #$08            ; 2
    BEQ    L7639           ; 2
    LDA    $BE             ; 3
    AND    #$F7            ; 2
    STA    $BE             ; 3
    LDA    #$04            ; 2
    STA    $80             ; 3
    LDA    #$0A            ; 2
    STA    $82             ; 3
    LDA    #$FF            ; 2
    STA    $81             ; 3
L7639:
    LDA    #$08            ; 2
    STA    AUDC0           ; 3
    LDX    $80             ; 3
    LDA.w  $0081           ; 4
    CMP    L7BF6,X         ; 4
    BCC    L7655           ; 2
    DEX                    ; 2
    BMI    L7660           ; 2
    STX    $80             ; 3
    LDA    L7BF6,X         ; 4
    STA    AUDV0           ; 3
    LDA    #$10            ; 2
    STA    $81             ; 3
L7655:
    STA    AUDF0           ; 3
    INC    $81             ; 5
    LDA    $BE             ; 3
    AND    #$37            ; 2
    JMP    L7613           ; 3
L7660:
    LDA    $82             ; 3
    STA    AUDV0           ; 3
    ORA    #$10            ; 2
    STA    AUDF0           ; 3
    DEC    $82             ; 5
    BMI    L7675           ; 2
    LDA    $BE             ; 3
    AND    #$33            ; 2
    STA    $BE             ; 3
    JMP    L7613           ; 3
L7675:
    LDA    $BE             ; 3
    AND    #$77            ; 2
    JMP    L760F           ; 3
L767C:
    AND    #$02            ; 2
    BEQ    L7692           ; 2
    LDA    $BE             ; 3
    AND    #$FD            ; 2
    STA    $BE             ; 3
    LDA    #$04            ; 2
    STA    $83             ; 3
    LDA    #$0D            ; 2
    STA    $82             ; 3
    LDA    #$FF            ; 2
    STA    $84             ; 3
L7692:
    LDA    #$08            ; 2
    STA    AUDC1           ; 3
    LDX    $83             ; 3
    LDA.w  $0084           ; 4
    CMP    L7BFC,X         ; 4
    BCC    L76AE           ; 2
    DEX                    ; 2
    BMI    L76B3           ; 2
    STX    $83             ; 3
    LDA    L7BFC,X         ; 4
    STA    AUDV1           ; 3
    LDA    #$10            ; 2
    STA    $84             ; 3
L76AE:
    STA    AUDF1           ; 3
    INC    $84             ; 5
    RTS                    ; 6

L76B3:
    LDA    $82             ; 3
    STA    AUDV1           ; 3
    ORA    #$10            ; 2
    STA    AUDF1           ; 3
    DEC    $82             ; 5
    BMI    L76C6           ; 2
    LDA    $BE             ; 3
    AND    #$DD            ; 2
    STA    $BE             ; 3
    RTS                    ; 6

L76C6:
    LDA    $BE             ; 3
    AND    #$11            ; 2
    JMP    L7617           ; 3
L76CD:
    LDA    #$04            ; 2
    STA    AUDC0           ; 3
    LDA    #$0C            ; 2
    STA    AUDF0           ; 3
    LDA    $BB             ; 3
    AND    #$07            ; 2
    BNE    L774D           ; 2
    LDA    #$01            ; 2
    LDX    #$00            ; 2
    JSR    L7B8F           ; 6
    LDA    $BB             ; 3
    AND    #$0F            ; 2
    BNE    L76F1           ; 2
    STA    AUDV0           ; 3
    LDA    SWCHA           ; 4
    AND    #$40            ; 2
    BEQ    L76FD           ; 2
L76F1:
    INC    $85             ; 5
    LDA    $BB             ; 3
    AND    #$10            ; 2
    BNE    L76FD           ; 2
    LDA    #$08            ; 2
    STA    AUDV0           ; 3
L76FD:
    LDA    SWCHA           ; 4
    TAX                    ; 2
    AND    #$10            ; 2
    BNE    L7707           ; 2
    INC    $86             ; 5
L7707:
    TXA                    ; 2
    AND    #$20            ; 2
    BNE    L770E           ; 2
    DEC    $86             ; 5
L770E:
    LDA    $85             ; 3
    CMP    #$98            ; 2
    BCS    L7745           ; 2
    LDA.w  $0002           ; 4
    AND    #$80            ; 2
    BNE    L7745           ; 2
    LDA.w  $0007           ; 4
    AND    #$80            ; 2
    BEQ    L774D           ; 2
    LDA    $99             ; 3
    SEC                    ; 2
    SBC    #$0A            ; 2
    SBC    $86             ; 3
    BCC    L7745           ; 2
    CMP    #$0E            ; 2
    BCS    L7745           ; 2
    LDA    $B6             ; 3
    CMP    #$08            ; 2
    BEQ    L7737           ; 2
    INC    $B6             ; 5
L7737:
    LDA    #$90            ; 2
    LDX    #$00            ; 2
    JSR    L7B8F           ; 6
    LDA    #$37            ; 2
    STA    $C3             ; 3
    STA    $B1             ; 3
    RTS                    ; 6

L7745:
    LDA    #$01            ; 2
    STA    $B1             ; 3
    LDA    #$AA            ; 2
    STA    $BE             ; 3
L774D:
    RTS                    ; 6

L774E:
    LDA    WSYNC           ; 3
    AND    #$80            ; 2
    BNE    L77C7           ; 2
    LDY    #$00            ; 2
    LDA    COLUP1          ; 3
    AND    #$40            ; 2
    BEQ    L7760           ; 2
    STY    $8D             ; 3
    STY    $AA             ; 3
L7760:
    LDA    NUSIZ0          ; 3
    AND    #$40            ; 2
    BEQ    L776A           ; 2
    STY    $8D             ; 3
    STY    $AE             ; 3
L776A:
    LDA    $AA             ; 3
    BEQ    L7779           ; 2
    LDA    VBLANK          ; 3
    AND    #$80            ; 2
    BEQ    L7779           ; 2
    STY    $AA             ; 3
    JMP    L77B9           ; 3
L7779:
    LDA    $AE             ; 3
    BEQ    L7788           ; 2
    LDA    WSYNC           ; 3
    AND    #$40            ; 2
    BEQ    L7788           ; 2
    STY    $AE             ; 3
    JMP    L77B9           ; 3
L7788:
    LDA    $8D             ; 3
    BEQ    L77A2           ; 2
    LDA    VSYNC           ; 3
    AND    #$80            ; 2
    BEQ    L77A2           ; 2
    LDA    $8D             ; 3
    JSR    L77D0           ; 6
    BNE    L77A2           ; 2
    STY    $8D             ; 3
    LDA    $C2             ; 3
    LDX    #$00            ; 2
    JSR    L7B8F           ; 6
L77A2:
    LDA    COLUP1          ; 3
    AND    #$80            ; 2
    BEQ    L77CF           ; 2
    LDA    $86             ; 3
    JSR    L77D0           ; 6
    BEQ    L77B9           ; 2
    LDA    $86             ; 3
    SEC                    ; 2
    SBC    #$04            ; 2
    JSR    L77D0           ; 6
    BNE    L77CF           ; 2
L77B9:
    LDA    $B1             ; 3
    BEQ    L77C7           ; 2
    LDA    #$00            ; 2
    STA    $91             ; 3
    STA    $93             ; 3
    STA    $95             ; 3
    STA    $97             ; 3
L77C7:
    LDA    #$01            ; 2
    STA    $B1             ; 3
    LDA    #$AA            ; 2
    STA    $BE             ; 3
L77CF:
    RTS                    ; 6

L77D0:
    TAX                    ; 2
    LDA    $97             ; 3
    BNE    L77F4           ; 2
    LDA    #$60            ; 2
    STA    $B1             ; 3
    LDA    $98             ; 3
    STA    $90             ; 3
    STA    $92             ; 3
    STA    $94             ; 3
    STA    $96             ; 3
    LDA    $99             ; 3
    STA    $91             ; 3
    STA    $93             ; 3
    STA    $95             ; 3
    STA    $97             ; 3
    LDA    #$AA            ; 2
    STA    $BE             ; 3
    LDA    #$00            ; 2
    RTS                    ; 6

L77F4:
    TXA                    ; 2
    LDX    #$08            ; 2
L77F7:
    CMP    $91,X           ; 4
    BEQ    L780C           ; 2
    BCS    L7801           ; 2
    DEX                    ; 2
    DEX                    ; 2
    BPL    L77F7           ; 2
L7801:
    INX                    ; 2
    INX                    ; 2
    CLC                    ; 2
    ADC    #$07            ; 2
    SEC                    ; 2
    SBC.wx $0091,X         ; 4
    BCC    L7829           ; 2
L780C:
    CPX    #$00            ; 2
    BEQ    L781C           ; 2
    LDA    $8F,X           ; 4
    STA    $91,X           ; 4
    LDA    $8E,X           ; 4
    STA    $90,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BNE    L780C           ; 2
L781C:
    LDA    #$88            ; 2
    ORA.w  $00BE           ; 4
    STA    $BE             ; 3
    LDA    #$00            ; 2
    STA    $90             ; 3
    STA    $91             ; 3
L7829:
    RTS                    ; 6

L782A:
    LDA    #$FB            ; 2
    CMP    $A5             ; 3
    BNE    L7832           ; 2
    LDA    #$FC            ; 2
L7832:
    LDX    $B7             ; 3
    CPX    #$20            ; 2
    BEQ    L783E           ; 2
    CPX    #$40            ; 2
    BEQ    L783E           ; 2
    STA    $88             ; 3
L783E:
    STA    $A5             ; 3
    LDX    #$0A            ; 2
L7842:
    CLC                    ; 2
    LDA    $C4,X           ; 4
    ADC    #$08            ; 2
    STA    $C4,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BPL    L7842           ; 2
    RTS                    ; 6

L784E:
    LDA    #$02            ; 2
    STA    $B8             ; 3
    LDA    SWCHA           ; 4
    TAX                    ; 2
    AND    #$10            ; 2
    BNE    L785C           ; 2
    INC    $86             ; 5
L785C:
    TXA                    ; 2
    AND    #$20            ; 2
    BNE    L7863           ; 2
    DEC    $86             ; 5
L7863:
    TXA                    ; 2
    AND    #$80            ; 2
    BNE    L786E           ; 2
    INC    $85             ; 5
    LDA    #$03            ; 2
    STA    $B8             ; 3
L786E:
    TXA                    ; 2
    AND    #$40            ; 2
    BNE    L7879           ; 2
    DEC    $85             ; 5
    LDA    #$01            ; 2
    STA    $B8             ; 3
L7879:
    LDA    $85             ; 3
    CMP    #$03            ; 2
    BCS    L7881           ; 2
    LDA    #$03            ; 2
L7881:
    CMP    #$1F            ; 2
    BCC    L7887           ; 2
    LDA    #$1E            ; 2
L7887:
    STA    $85             ; 3
    LDA    $8D             ; 3
    BEQ    L789F           ; 2
    LDA    $8C             ; 3
    CLC                    ; 2
    ADC    #$02            ; 2
    ADC    $8E             ; 3
    CMP    #$94            ; 2
    BCC    L789C           ; 2
    LDA    #$00            ; 2
    STA    $8D             ; 3
L789C:
    STA    $8C             ; 3
    RTS                    ; 6

L789F:
    LDA    REFP1           ; 3
    AND    #$80            ; 2
    BNE    L78BC           ; 2
    LDA    $85             ; 3
    ADC    #$06            ; 2
    STA    $8C             ; 3
    LDA    $86             ; 3
    SBC    #$02            ; 2
    STA    $8D             ; 3
    LDA    $B8             ; 3
    STA    $8E             ; 3
    LDA    #$55            ; 2
    ORA.w  $00BE           ; 4
    STA    $BE             ; 3
L78BC:
    LDA    #$03            ; 2
    LDX    $B3             ; 3
    CPX    #$10            ; 2
    BCS    L78D4           ; 2
    LDA    #$02            ; 2
    CPX    #$01            ; 2
    BCS    L78D4           ; 2
    LDA    #$01            ; 2
    LDX    $B4             ; 3
    CPX    #$10            ; 2
    BCS    L78D4           ; 2
    LDA    #$00            ; 2
L78D4:
    CLC                    ; 2
    ADC    $B8             ; 3
    STA    $B8             ; 3
    RTS                    ; 6

L78DA:
    LDX    $BA             ; 3
    BPL    L78E0           ; 2
    LDX    #$08            ; 2
L78E0:
    LDA    $91,X           ; 4
    BEQ    L794F           ; 2
    LDA    $90,X           ; 4
    SBC    $9A,X           ; 4
    BEQ    L78F2           ; 2
    BCS    L78FC           ; 2
    CMP    #$FF            ; 2
    BEQ    L78F2           ; 2
    LDA    #$01            ; 2
L78F2:
    STA    $B9             ; 3
    STA    $9B,X           ; 4
    LDA    $B8             ; 3
    STA    $9A,X           ; 4
    LDA    #$94            ; 2
L78FC:
    STA    $90,X           ; 4
    LDA    $91,X           ; 4
    CLC                    ; 2
    ADC    $9B,X           ; 4
    TAY                    ; 2
    CPY    #$44            ; 2
    BCC    L7912           ; 2
    LDA    #$00            ; 2
    SEC                    ; 2
    SBC    $9B,X           ; 4
    STA    $9B,X           ; 4
    JMP    L794F           ; 3
L7912:
    CPY    #$09            ; 2
    BCS    L7920           ; 2
    LDA    #$00            ; 2
    SEC                    ; 2
    SBC    $9B,X           ; 4
    STA    $9B,X           ; 4
    JMP    L794F           ; 3
L7920:
    TYA                    ; 2
    CPX    #$00            ; 2
    BEQ    L7936           ; 2
    SBC.wx $008F,X         ; 4
    CMP    #$08            ; 2
    BCS    L7936           ; 2
    LDA    #$00            ; 2
    SEC                    ; 2
    SBC    $9B,X           ; 4
    STA    $9B,X           ; 4
    JMP    L794F           ; 3
L7936:
    TYA                    ; 2
    CPX    #$08            ; 2
    BEQ    L794C           ; 2
    ADC    #$07            ; 2
    CMP.wx $0093,X         ; 4
    BCC    L794C           ; 2
    LDA    #$00            ; 2
    SEC                    ; 2
    SBC    $9B,X           ; 4
    STA    $9B,X           ; 4
    JMP    L794F           ; 3
L794C:
    TYA                    ; 2
    STA    $91,X           ; 4
L794F:
    LDA    $AA             ; 3
    BNE    L7979           ; 2
    LDA    $AE             ; 3
    BEQ    L795D           ; 2
    LDA    $AD             ; 3
    CMP    #$50            ; 2
    BCS    L7979           ; 2
L795D:
    LDA    $90,X           ; 4
    STA    $A9             ; 3
    LDA    $91,X           ; 4
    SBC    #$04            ; 2
    STA    $AA             ; 3
    LDA    $9A,X           ; 4
    STA    $AB             ; 3
    LDA    $9B,X           ; 4
    STA    $AC             ; 3
    LDA    #$55            ; 2
    ORA.w  $00BE           ; 4
    STA    $BE             ; 3
    JMP    L79A4           ; 3
L7979:
    LDA    $AE             ; 3
    BNE    L79A4           ; 2
    LDA    $AA             ; 3
    BEQ    L798B           ; 2
    LDA    $A9             ; 3
    CMP    #$50            ; 2
    BCS    L79A4           ; 2
    LDA    $97             ; 3
    BEQ    L79A4           ; 2
L798B:
    LDA    $90,X           ; 4
    STA    $AD             ; 3
    LDA    $91,X           ; 4
    SBC    #$04            ; 2
    STA    $AE             ; 3
    LDA    $9A,X           ; 4
    STA    $AF             ; 3
    LDA    $9B,X           ; 4
    STA    $B0             ; 3
    LDA    #$55            ; 2
    ORA.w  $00BE           ; 4
    STA    $BE             ; 3
L79A4:
    DEX                    ; 2
    DEX                    ; 2
    STX    $BA             ; 3
    LDX    #$04            ; 2
    LDA    $BB             ; 3
    AND    #$01            ; 2
    BNE    L79B2           ; 2
    LDX    #$00            ; 2
L79B2:
    LDA    $A9,X           ; 4
    BEQ    L79D4           ; 2
    CLC                    ; 2
    SBC    $AB,X           ; 4
    BCC    L79D4           ; 2
    CMP    #$06            ; 2
    BCC    L79D4           ; 2
    STA    $A9,X           ; 4
    LDA    $BB             ; 3
    AND    #$02            ; 2
    BEQ    L79DA           ; 2
    LDA    $AA,X           ; 4
    CLC                    ; 2
    ADC    $AC,X           ; 4
    CMP    #$44            ; 2
    BCS    L79D4           ; 2
    CMP    #$05            ; 2
    BCS    L79D8           ; 2
L79D4:
    LDA    #$00            ; 2
    STA    $A9,X           ; 4
L79D8:
    STA    $AA,X           ; 4
L79DA:
    RTS                    ; 6

L79DB:
    STA    WSYNC           ; 3
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #$D0            ; 2
    STA    HMP0            ; 3
    LDA    #$A0            ; 2
    STA    HMP1            ; 3
    NOP                    ; 2
    LDA    #$03            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    RESP0           ; 3
    LDA.wx $00B3,X         ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $D0             ; 3
    LDA    $B3,X           ; 4
    AND    #$0F            ; 2
    JSR    L7AA8           ; 6
    STA    $D2             ; 3
    LDA    $B4,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    STA    $D4             ; 3
    LDA    $B4,X           ; 4
    AND    #$0F            ; 2
    JSR    L7AA8           ; 6
    STA    $D6             ; 3
    STY    COLUBK          ; 3
    LDA    $B5,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    STA    $D8             ; 3
    STA    HMCLR           ; 3
    LDA    $B5,X           ; 4
    AND    #$0F            ; 2
    JSR    L7AA8           ; 6
    STA    $DA             ; 3
    LDY    #$07            ; 2
    LDA    #$FF            ; 2
    STA    $D1             ; 3
    STA    $D3             ; 3
    STA    $D5             ; 3
    STA    $D7             ; 3
    STA    $D9             ; 3
    STA    $DB             ; 3
    LDX    #$00            ; 2
    LDA    $D0             ; 3
    CMP    #$08            ; 2
    BNE    L7A70           ; 2
    STX    $D0             ; 3
    LDA    $D2             ; 3
    CMP    #$08            ; 2
    BNE    L7A70           ; 2
    STX    $D2             ; 3
    LDA    $D4             ; 3
    CMP    #$08            ; 2
    BNE    L7A70           ; 2
    STX    $D4             ; 3
    LDA    $D6             ; 3
    CMP    #$08            ; 2
    BNE    L7A70           ; 2
    STX    $D6             ; 3
    LDA    $D8             ; 3
    CMP    #$08            ; 2
    BNE    L7A70           ; 2
    STX    $D8             ; 3
L7A70:
    STA    WSYNC           ; 3
    LDA    ($D2),Y         ; 5
    TAX                    ; 2
    LDA    ($D0),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($D6),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($DA),Y         ; 5
    PHA                    ; 3
    STX    GRP0            ; 3
    LDA    ($D4),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($D8),Y         ; 5
    STA    GRP1            ; 3
    PLA                    ; 4
    STA    GRP1            ; 3
    DEY                    ; 2
    BNE    L7A70           ; 2
    LDA    #$00            ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #$20            ; 2
    STA    NUSIZ0          ; 3
    LDX    #$20            ; 2
    LDA    SWCHB           ; 4
    AND    #$40            ; 2
    BNE    L7AA5           ; 2
    LDX    #$25            ; 2
L7AA5:
    STX    NUSIZ1          ; 3
    RTS                    ; 6

L7AA8:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    CLC                    ; 2
    ADC    #$08            ; 2
    RTS                    ; 6

    .byte $FF ; |XXXXXXXX| $7AAF
    LDX    $CA             ; 3
    DEX                    ; 2
    BPL    L7A73           ; 2
    CPY    #$00            ; 2
    BNE    L7AC1           ; 2
    LDY    #$62            ; 2
    STY    $B1             ; 3
    LDA    #$05            ; 2
    STA    $BB             ; 3
L7AC1:
    JMP    L7013           ; 3
    LDA    #$07            ; 2
    STA    $C0             ; 3
    STA    WSYNC           ; 3
    LDY    $C0             ; 3
    LDA    ($C4),Y         ; 5
    STA    PF0             ; 3
    LDA    ($C6),Y         ; 5
    STA    PF1             ; 3
    LDA    ($C8),Y         ; 5
    STA    PF2             ; 3
    LDA    ($CA),Y         ; 5
    STA    PF0             ; 3
    LDA    ($CC),Y         ; 5
    STA    PF1             ; 3
    LDA    ($CE),Y         ; 5
    STA    PF2             ; 3
    LDY    $89             ; 3
    BEQ    L7AEE           ; 2
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    DEC    $89             ; 5
L7AEE:
    LDA    $86             ; 3
    CMP    $8F             ; 3
    BNE    L7AF8           ; 2
    LDA    #$09            ; 2
    STA    $89             ; 3
L7AF8:
    LDA    #$00            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    .byte $FF ; |XXXXXXXX| $7B00
    .byte $00 ; |        | $7B01
    .byte $60 ; | XX     | $7B02
    .byte $30 ; |  XX    | $7B03
    .byte $18 ; |   XX   | $7B04
    .byte $FC ; |XXXXXX  | $7B05
    .byte $FF ; |XXXXXXXX| $7B06
    .byte $48 ; | X  X   | $7B07
    .byte $30 ; |  XX    | $7B08
    .byte $20 ; |  X     | $7B09
    .byte $00 ; |        | $7B0A
    .byte $78 ; | XXXX   | $7B0B
    .byte $DF ; |XX XXXXX| $7B0C
    .byte $DC ; |XX XXX  | $7B0D
    .byte $78 ; | XXXX   | $7B0E
    .byte $30 ; |  XX    | $7B0F
    .byte $78 ; | XXXX   | $7B10
    .byte $00 ; |        | $7B11
    .byte $24 ; |  X  X  | $7B12
    .byte $99 ; |X  XX  X| $7B13
    .byte $6E ; | XX XXX | $7B14
    .byte $76 ; | XXX XX | $7B15
    .byte $99 ; |X  XX  X| $7B16
    .byte $24 ; |  X  X  | $7B17
    .byte $00 ; |        | $7B18
    .byte $18 ; |   XX   | $7B19
    .byte $24 ; |  X  X  | $7B1A
    .byte $42 ; | X    X | $7B1B
    .byte $FF ; |XXXXXXXX| $7B1C
    .byte $3C ; |  XXXX  | $7B1D
    .byte $99 ; |X  XX  X| $7B1E
    .byte $00 ; |        | $7B1F
    .byte $24 ; |  X  X  | $7B20
    .byte $18 ; |   XX   | $7B21
    .byte $18 ; |   XX   | $7B22
    .byte $24 ; |  X  X  | $7B23
    .byte $42 ; | X    X | $7B24
    .byte $81 ; |X      X| $7B25
    .byte $00 ; |        | $7B26
    .byte $00 ; |        | $7B27
    .byte $00 ; |        | $7B28
    .byte $10 ; |   X    | $7B29
    .byte $10 ; |   X    | $7B2A
    .byte $12 ; |   X  X | $7B2B
    .byte $16 ; |   X XX | $7B2C
    .byte $0E ; |    XXX | $7B2D
    .byte $FE ; |XXXXXXX | $7B2E
    .byte $7E ; | XXXXXX | $7B2F
    .byte $1E ; |   XXXX | $7B30
    .byte $1E ; |   XXXX | $7B31
    .byte $7E ; | XXXXXX | $7B32
    .byte $FE ; |XXXXXXX | $7B33
    .byte $0E ; |    XXX | $7B34
    .byte $16 ; |   X XX | $7B35
    .byte $12 ; |   X  X | $7B36
    .byte $10 ; |   X    | $7B37
    .byte $10 ; |   X    | $7B38
    .byte $00 ; |        | $7B39
    .byte $00 ; |        | $7B3A
    .byte $81 ; |X      X| $7B3B
    .byte $42 ; | X    X | $7B3C
    .byte $18 ; |   XX   | $7B3D
    .byte $42 ; | X    X | $7B3E
    .byte $42 ; | X    X | $7B3F
    .byte $18 ; |   XX   | $7B40
    .byte $42 ; | X    X | $7B41
    .byte $81 ; |X      X| $7B42
    .byte $4C ; | X  XX  | $7B43
    .byte $4C ; | X  XX  | $7B44
    .byte $4A ; | X  X X | $7B45
    .byte $4A ; | X  X X | $7B46
    .byte $48 ; | X  X   | $7B47
    .byte $4A ; | X  X X | $7B48
    .byte $4A ; | X  X X | $7B49
    .byte $4C ; | X  XX  | $7B4A
    .byte $4C ; | X  XX  | $7B4B
    .byte $1F ; |   XXXXX| $7B4C
    .byte $1F ; |   XXXXX| $7B4D
    .byte $1D ; |   XXX X| $7B4E
    .byte $1D ; |   XXX X| $7B4F
    .byte $1B ; |   XX XX| $7B50
    .byte $1D ; |   XXX X| $7B51
    .byte $1D ; |   XXX X| $7B52
    .byte $1F ; |   XXXXX| $7B53
    .byte $1F ; |   XXXXX| $7B54
    .byte $0F ; |    XXXX| $7B55
    .byte $0F ; |    XXXX| $7B56
    .byte $0F ; |    XXXX| $7B57
    .byte $0F ; |    XXXX| $7B58
    .byte $0F ; |    XXXX| $7B59
    .byte $0F ; |    XXXX| $7B5A
    .byte $0F ; |    XXXX| $7B5B
    .byte $0F ; |    XXXX| $7B5C
    .byte $0F ; |    XXXX| $7B5D
    .byte $0F ; |    XXXX| $7B5E
    .byte $0F ; |    XXXX| $7B5F
    .byte $0F ; |    XXXX| $7B60
    .byte $0F ; |    XXXX| $7B61
    .byte $0F ; |    XXXX| $7B62
    .byte $0F ; |    XXXX| $7B63
    .byte $0F ; |    XXXX| $7B64
    .byte $0F ; |    XXXX| $7B65
    .byte $0F ; |    XXXX| $7B66
L7B67:
    .byte $FF ; |XXXXXXXX| $7B67
    .byte $7F ; | XXXXXXX| $7B68
    .byte $0F ; |    XXXX| $7B69
    .byte $06 ; |     XX | $7B6A
    .byte $00 ; |        | $7B6B
    .byte $00 ; |        | $7B6C
    .byte $00 ; |        | $7B6D
    .byte $06 ; |     XX | $7B6E
    .byte $0F ; |    XXXX| $7B6F
    .byte $18 ; |   XX   | $7B70
    .byte $00 ; |        | $7B71
    .byte $00 ; |        | $7B72
    .byte $01 ; |       X| $7B73
    .byte $00 ; |        | $7B74
    .byte $00 ; |        | $7B75
    .byte $18 ; |   XX   | $7B76
    .byte $0F ; |    XXXX| $7B77
    .byte $07 ; |     XXX| $7B78
    .byte $00 ; |        | $7B79
    .byte $00 ; |        | $7B7A
    .byte $00 ; |        | $7B7B
    .byte $00 ; |        | $7B7C
    .byte $07 ; |     XXX| $7B7D
    .byte $0F ; |    XXXX| $7B7E
    .byte $18 ; |   XX   | $7B7F
    .byte $00 ; |        | $7B80
    .byte $00 ; |        | $7B81
    .byte $01 ; |       X| $7B82
    .byte $00 ; |        | $7B83
    .byte $00 ; |        | $7B84
    .byte $18 ; |   XX   | $7B85
    .byte $0F ; |    XXXX| $7B86
    .byte $06 ; |     XX | $7B87
    .byte $00 ; |        | $7B88
    .byte $00 ; |        | $7B89
    .byte $00 ; |        | $7B8A
    .byte $06 ; |     XX | $7B8B
    .byte $0F ; |    XXXX| $7B8C
    .byte $7F ; | XXXXXXX| $7B8D
    .byte $FF ; |XXXXXXXX| $7B8E
L7B8F:
    SEC                    ; 2
    SED                    ; 2
    ADC    $B5,X           ; 4
    STA    $B5,X           ; 4
    LDA    $B4,X           ; 4
    ADC    #$00            ; 2
    STA    $B4,X           ; 4
    LDA    $B3,X           ; 4
    ADC    #$00            ; 2
    STA    $B3,X           ; 4
    CLD                    ; 2
    LDA    $B4,X           ; 4
    ORA    $B5,X           ; 4
    BNE    L7BAA           ; 2
    INC    $B6             ; 5
L7BAA:
    RTS                    ; 6

L7BAB:
    SEC                    ; 2
    STA    WSYNC           ; 3
L7BAE:
    SBC    #$0F            ; 2
    BCS    L7BAE           ; 2
    EOR    #$07            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    HMP0,X          ; 4
    STA    RESP0,X         ; 4
    RTS                    ; 6

L7BBD:
    LDA    #$01            ; 2
    STA    $B2             ; 3
    STA    $B5             ; 3
    LDA    #$FD            ; 2
    STA    $C5             ; 3
    STA    $C9             ; 3
    STA    $CB             ; 3
    STA    $CF             ; 3
    LDA    #$FE            ; 2
    STA    $C7             ; 3
    STA    $CD             ; 3
    LDA    #$00            ; 2
    STA    AUDV0           ; 3
    STA    AUDV1           ; 3
    STA    $BE             ; 3
    STA    $C4             ; 3
    LDA    #$40            ; 2
    STA    $C6             ; 3
    LDA    #$80            ; 2
    STA    $C8             ; 3
    LDA    #$A0            ; 2
    STA    $CA             ; 3
    LDA    #$E0            ; 2
    STA    $CC             ; 3
    LDA    #$20            ; 2
    STA    $CE             ; 3
    LDA    #$44            ; 2
    STA    $B1             ; 3
    RTS                    ; 6

L7BF6:
    .byte $19 ; |   XX  X| $7BF6
    .byte $1D ; |   XXX X| $7BF7
    .byte $1C ; |   XXX  | $7BF8
    .byte $18 ; |   XX   | $7BF9
L7BFA:
    .byte $06 ; |     XX | $7BFA
    .byte $08 ; |    X   | $7BFB
L7BFC:
    .byte $1B ; |   XX XX| $7BFC
    .byte $1C ; |   XXX  | $7BFD
    .byte $19 ; |   XX  X| $7BFE
    .byte $1A ; |   XX X | $7BFF
    .byte $FF ; |XXXXXXXX| $7C00
    .byte $00 ; |        | $7C01
    .byte $C0 ; |XX      | $7C02
    .byte $60 ; | XX     | $7C03
    .byte $30 ; |  XX    | $7C04
    .byte $FF ; |XXXXXXXX| $7C05
    .byte $BE ; |X XXXXX | $7C06
    .byte $50 ; | X X    | $7C07
    .byte $30 ; |  XX    | $7C08
    .byte $20 ; |  X     | $7C09
    .byte $00 ; |        | $7C0A
    .byte $7A ; | XXXX X | $7C0B
    .byte $DF ; |XX XXXXX| $7C0C
    .byte $DC ; |XX XXX  | $7C0D
    .byte $78 ; | XXXX   | $7C0E
    .byte $30 ; |  XX    | $7C0F
    .byte $30 ; |  XX    | $7C10
    .byte $00 ; |        | $7C11
    .byte $00 ; |        | $7C12
    .byte $18 ; |   XX   | $7C13
    .byte $6E ; | XX XXX | $7C14
    .byte $76 ; | XXX XX | $7C15
    .byte $18 ; |   XX   | $7C16
    .byte $00 ; |        | $7C17
    .byte $00 ; |        | $7C18
    .byte $5A ; | X XX X | $7C19
    .byte $3C ; |  XXXX  | $7C1A
    .byte $FF ; |XXXXXXXX| $7C1B
    .byte $42 ; | X    X | $7C1C
    .byte $24 ; |  X  X  | $7C1D
    .byte $18 ; |   XX   | $7C1E
    .byte $00 ; |        | $7C1F
    .byte $24 ; |  X  X  | $7C20
    .byte $99 ; |X  XX  X| $7C21
    .byte $5A ; | X XX X | $7C22
    .byte $24 ; |  X  X  | $7C23
    .byte $00 ; |        | $7C24
    .byte $00 ; |        | $7C25
    .byte $00 ; |        | $7C26
    .byte $10 ; |   X    | $7C27
    .byte $10 ; |   X    | $7C28
    .byte $12 ; |   X  X | $7C29
    .byte $16 ; |   X XX | $7C2A
    .byte $0E ; |    XXX | $7C2B
    .byte $FE ; |XXXXXXX | $7C2C
    .byte $7E ; | XXXXXX | $7C2D
    .byte $1E ; |   XXXX | $7C2E
    .byte $00 ; |        | $7C2F
    .byte $00 ; |        | $7C30
    .byte $00 ; |        | $7C31
    .byte $1E ; |   XXXX | $7C32
    .byte $7E ; | XXXXXX | $7C33
    .byte $FE ; |XXXXXXX | $7C34
    .byte $0E ; |    XXX | $7C35
    .byte $16 ; |   X XX | $7C36
    .byte $12 ; |   X  X | $7C37
    .byte $10 ; |   X    | $7C38
    .byte $10 ; |   X    | $7C39
    .byte $00 ; |        | $7C3A
    .byte $00 ; |        | $7C3B
    .byte $00 ; |        | $7C3C
    .byte $22 ; |  X   X | $7C3D
    .byte $08 ; |    X   | $7C3E
    .byte $08 ; |    X   | $7C3F
    .byte $22 ; |  X   X | $7C40
    .byte $00 ; |        | $7C41
    .byte $00 ; |        | $7C42
    .byte $18 ; |   XX   | $7C43
    .byte $18 ; |   XX   | $7C44
    .byte $16 ; |   X XX | $7C45
    .byte $16 ; |   X XX | $7C46
    .byte $18 ; |   XX   | $7C47
    .byte $18 ; |   XX   | $7C48
    .byte $9F ; |X  XXXXX| $7C49
    .byte $66 ; | XX  XX | $7C4A
    .byte $68 ; | XX X   | $7C4B
    .byte $6A ; | XX X X | $7C4C
    .byte $6C ; | XX XX  | $7C4D
    .byte $6A ; | XX X X | $7C4E
    .byte $68 ; | XX X   | $7C4F
    .byte $66 ; | XX  XX | $7C50
    .byte $A6 ; |X X  XX | $7C51
    .byte $A8 ; |X X X   | $7C52
    .byte $AA ; |X X X X | $7C53
    .byte $AC ; |X X XX  | $7C54
    .byte $AA ; |X X X X | $7C55
    .byte $A8 ; |X X X   | $7C56
    .byte $A6 ; |X X  XX | $7C57
    .byte $46 ; | X   XX | $7C58
    .byte $48 ; | X  X   | $7C59
    .byte $4A ; | X  X X | $7C5A
    .byte $4C ; | X  XX  | $7C5B
    .byte $4A ; | X  X X | $7C5C
    .byte $48 ; | X  X   | $7C5D
    .byte $46 ; | X   XX | $7C5E
    .byte $B6 ; |X XX XX | $7C5F
    .byte $B8 ; |X XXX   | $7C60
    .byte $BA ; |X XXX X | $7C61
    .byte $BC ; |X XXXX  | $7C62
    .byte $BA ; |X XXX X | $7C63
    .byte $B8 ; |X XXX   | $7C64
    .byte $B6 ; |X XX XX | $7C65
    .byte $56 ; | X X XX | $7C66
    .byte $58 ; | X XX   | $7C67
    .byte $5A ; | X XX X | $7C68
    .byte $5C ; | X XXX  | $7C69
    .byte $5A ; | X XX X | $7C6A
    .byte $58 ; | X XX   | $7C6B
    .byte $56 ; | X X XX | $7C6C
    .byte $1F ; |   XXXXX| $7C6D
    .byte $1F ; |   XXXXX| $7C6E
    .byte $1D ; |   XXX X| $7C6F
    .byte $1B ; |   XX XX| $7C70
    .byte $1B ; |   XX XX| $7C71
    .byte $19 ; |   XX  X| $7C72
    .byte $19 ; |   XX  X| $7C73
    .byte $17 ; |   X XXX| $7C74
    .byte $17 ; |   X XXX| $7C75
    .byte $15 ; |   X X X| $7C76
    .byte $15 ; |   X X X| $7C77
    .byte $17 ; |   X XXX| $7C78
    .byte $17 ; |   X XXX| $7C79
    .byte $19 ; |   XX  X| $7C7A
    .byte $19 ; |   XX  X| $7C7B
    .byte $1B ; |   XX XX| $7C7C
    .byte $1B ; |   XX XX| $7C7D
    .byte $1D ; |   XXX X| $7C7E
    .byte $1F ; |   XXXXX| $7C7F
    .byte $BD ; |X XXXX X| $7C80
    .byte $BD ; |X XXXX X| $7C81
    .byte $BB ; |X XXX XX| $7C82
    .byte $BB ; |X XXX XX| $7C83
    .byte $B9 ; |X XXX  X| $7C84
    .byte $B9 ; |X XXX  X| $7C85
    .byte $B7 ; |X XX XXX| $7C86
    .byte $B7 ; |X XX XXX| $7C87
    .byte $B5 ; |X XX X X| $7C88
    .byte $B5 ; |X XX X X| $7C89
    .byte $B7 ; |X XX XXX| $7C8A
    .byte $B7 ; |X XX XXX| $7C8B
    .byte $B9 ; |X XXX  X| $7C8C
    .byte $B9 ; |X XXX  X| $7C8D
    .byte $BB ; |X XXX XX| $7C8E
    .byte $BB ; |X XXX XX| $7C8F
    .byte $BD ; |X XXXX X| $7C90
    .byte $BD ; |X XXXX X| $7C91
    .byte $BF ; |X XXXXXX| $7C92
L7C93:
    .byte $F3 ; |XXXX  XX| $7C93
    .byte $C1 ; |XX     X| $7C94
    .byte $80 ; |X       | $7C95
    .byte $00 ; |        | $7C96
    .byte $08 ; |    X   | $7C97
    .byte $1C ; |   XXX  | $7C98
    .byte $30 ; |  XX    | $7C99
    .byte $E0 ; |XXX     | $7C9A
    .byte $A1 ; |X X    X| $7C9B
    .byte $40 ; | X      | $7C9C
    .byte $80 ; |X       | $7C9D
    .byte $03 ; |      XX| $7C9E
    .byte $0C ; |    XX  | $7C9F
    .byte $03 ; |      XX| $7CA0
    .byte $80 ; |X       | $7CA1
    .byte $E0 ; |XXX     | $7CA2
    .byte $C1 ; |XX     X| $7CA3
    .byte $80 ; |X       | $7CA4
    .byte $00 ; |        | $7CA5
    .byte $1C ; |   XXX  | $7CA6
    .byte $1C ; |   XXX  | $7CA7
    .byte $00 ; |        | $7CA8
    .byte $80 ; |X       | $7CA9
    .byte $C1 ; |XX     X| $7CAA
    .byte $E0 ; |XXX     | $7CAB
    .byte $80 ; |X       | $7CAC
    .byte $03 ; |      XX| $7CAD
    .byte $0C ; |    XX  | $7CAE
    .byte $03 ; |      XX| $7CAF
    .byte $80 ; |X       | $7CB0
    .byte $40 ; | X      | $7CB1
    .byte $A1 ; |X X    X| $7CB2
    .byte $E0 ; |XXX     | $7CB3
    .byte $30 ; |  XX    | $7CB4
    .byte $1C ; |   XXX  | $7CB5
    .byte $08 ; |    X   | $7CB6
    .byte $00 ; |        | $7CB7
    .byte $80 ; |X       | $7CB8
    .byte $C1 ; |XX     X| $7CB9
    .byte $F3 ; |XXXX  XX| $7CBA
L7CBB:
    LDX    #$09            ; 2
L7CBD:
    LDA    L7CEF,X         ; 4
    STA    $9A,X           ; 4
    LDA    L7CE5,X         ; 4
    STA    $90,X           ; 4
    DEX                    ; 2
    BPL    L7CBD           ; 2
    LDA    #$23            ; 2
    STA    $86             ; 3
L7CCE:
    LDA    #$0A            ; 2
    STA    $85             ; 3
    LDA    #$00            ; 2
    STA    $87             ; 3
    LDA    #$FC            ; 2
    STA    $88             ; 3
    STA    $A5             ; 3
    LDA    #$00            ; 2
    STA    $8D             ; 3
    STA    $AA             ; 3
    STA    $AE             ; 3
    RTS                    ; 6

L7CE5:
    .byte $90 ; |X  X    | $7CE5
L7CE6:
    .byte $0A ; |    X X | $7CE6
    .byte $86 ; |X    XX | $7CE7
    .byte $18 ; |   XX   | $7CE8
    .byte $92 ; |X  X  X | $7CE9
    .byte $23 ; |  X   XX| $7CEA
    .byte $83 ; |X     XX| $7CEB
    .byte $33 ; |  XX  XX| $7CEC
    .byte $91 ; |X  X   X| $7CED
    .byte $40 ; | X      | $7CEE
L7CEF:
    .byte $02 ; |      X | $7CEF
    .byte $01 ; |       X| $7CF0
    .byte $02 ; |      X | $7CF1
    .byte $01 ; |       X| $7CF2
    .byte $02 ; |      X | $7CF3
    .byte $01 ; |       X| $7CF4
    .byte $02 ; |      X | $7CF5
    .byte $01 ; |       X| $7CF6
    .byte $02 ; |      X | $7CF7
    .byte $01 ; |       X| $7CF8
L7CF9:
    .byte $09 ; |    X  X| $7CF9
    .byte $05 ; |     X X| $7CFA
    .byte $FF ; |XXXXXXXX| $7CFB
    .byte $FF ; |XXXXXXXX| $7CFC
    .byte $FF ; |XXXXXXXX| $7CFD
    .byte $FF ; |XXXXXXXX| $7CFE
    .byte $FF ; |XXXXXXXX| $7CFF
    .byte $00 ; |        | $7D00
    .byte $80 ; |X       | $7D01
    .byte $40 ; | X      | $7D02
    .byte $38 ; |  XXX   | $7D03
    .byte $04 ; |     X  | $7D04
    .byte $03 ; |      XX| $7D05
    .byte $01 ; |       X| $7D06
    .byte $00 ; |        | $7D07
    .byte $00 ; |        | $7D08
    .byte $40 ; | X      | $7D09
    .byte $A0 ; |X X     | $7D0A
    .byte $9C ; |X  XXX  | $7D0B
    .byte $82 ; |X     X | $7D0C
    .byte $01 ; |       X| $7D0D
    .byte $00 ; |        | $7D0E
    .byte $00 ; |        | $7D0F
    .byte $00 ; |        | $7D10
    .byte $20 ; |  X     | $7D11
    .byte $50 ; | X X    | $7D12
    .byte $4E ; | X  XXX | $7D13
    .byte $C1 ; |XX     X| $7D14
    .byte $80 ; |X       | $7D15
    .byte $00 ; |        | $7D16
    .byte $00 ; |        | $7D17
    .byte $00 ; |        | $7D18
    .byte $10 ; |   X    | $7D19
    .byte $28 ; |  X X   | $7D1A
    .byte $27 ; |  X  XXX| $7D1B
    .byte $60 ; | XX     | $7D1C
    .byte $C0 ; |XX      | $7D1D
    .byte $00 ; |        | $7D1E
    .byte $00 ; |        | $7D1F
    .byte $00 ; |        | $7D20
    .byte $08 ; |    X   | $7D21
    .byte $14 ; |   X X  | $7D22
    .byte $13 ; |   X  XX| $7D23
    .byte $B0 ; |X XX    | $7D24
    .byte $60 ; | XX     | $7D25
    .byte $00 ; |        | $7D26
    .byte $00 ; |        | $7D27
    .byte $00 ; |        | $7D28
    .byte $04 ; |     X  | $7D29
    .byte $A0 ; |X X     | $7D2A
    .byte $89 ; |X   X  X| $7D2B
    .byte $D8 ; |XX XX   | $7D2C
    .byte $30 ; |  XX    | $7D2D
    .byte $00 ; |        | $7D2E
    .byte $00 ; |        | $7D2F
    .byte $00 ; |        | $7D30
    .byte $02 ; |      X | $7D31
    .byte $05 ; |     X X| $7D32
    .byte $44 ; | X   X  | $7D33
    .byte $EC ; |XXX XX  | $7D34
    .byte $18 ; |   XX   | $7D35
    .byte $00 ; |        | $7D36
    .byte $00 ; |        | $7D37
    .byte $00 ; |        | $7D38
    .byte $01 ; |       X| $7D39
    .byte $02 ; |      X | $7D3A
    .byte $22 ; |  X   X | $7D3B
    .byte $76 ; | XXX XX | $7D3C
    .byte $8C ; |X   XX  | $7D3D
    .byte $80 ; |X       | $7D3E
    .byte $00 ; |        | $7D3F
    .byte $00 ; |        | $7D40
    .byte $00 ; |        | $7D41
    .byte $01 ; |       X| $7D42
    .byte $11 ; |   X   X| $7D43
    .byte $3B ; |  XXX XX| $7D44
    .byte $46 ; | X   XX | $7D45
    .byte $40 ; | X      | $7D46
    .byte $80 ; |X       | $7D47
    .byte $00 ; |        | $7D48
    .byte $00 ; |        | $7D49
    .byte $00 ; |        | $7D4A
    .byte $08 ; |    X   | $7D4B
    .byte $1D ; |   XXX X| $7D4C
    .byte $23 ; |  X   XX| $7D4D
    .byte $A0 ; |X X     | $7D4E
    .byte $C0 ; |XX      | $7D4F
    .byte $00 ; |        | $7D50
    .byte $00 ; |        | $7D51
    .byte $00 ; |        | $7D52
    .byte $04 ; |     X  | $7D53
    .byte $8E ; |X   XXX | $7D54
    .byte $91 ; |X  X   X| $7D55
    .byte $50 ; | X X    | $7D56
    .byte $60 ; | XX     | $7D57
    .byte $00 ; |        | $7D58
    .byte $00 ; |        | $7D59
    .byte $00 ; |        | $7D5A
    .byte $82 ; |X     X | $7D5B
    .byte $47 ; | X   XXX| $7D5C
    .byte $48 ; | X  X   | $7D5D
    .byte $28 ; |  X X   | $7D5E
    .byte $30 ; |  XX    | $7D5F
    .byte $00 ; |        | $7D60
    .byte $00 ; |        | $7D61
    .byte $80 ; |X       | $7D62
    .byte $41 ; | X     X| $7D63
    .byte $23 ; |  X   XX| $7D64
    .byte $24 ; |  X  X  | $7D65
    .byte $14 ; |   X X  | $7D66
    .byte $18 ; |   XX   | $7D67
    .byte $00 ; |        | $7D68
    .byte $80 ; |X       | $7D69
    .byte $40 ; | X      | $7D6A
    .byte $20 ; |  X     | $7D6B
    .byte $11 ; |   X   X| $7D6C
    .byte $12 ; |   X  X | $7D6D
    .byte $0A ; |    X X | $7D6E
    .byte $0C ; |    XX  | $7D6F
    .byte $00 ; |        | $7D70
    .byte $C0 ; |XX      | $7D71
    .byte $20 ; |  X     | $7D72
    .byte $10 ; |   X    | $7D73
    .byte $08 ; |    X   | $7D74
    .byte $09 ; |    X  X| $7D75
    .byte $05 ; |     X X| $7D76
    .byte $06 ; |     XX | $7D77
    .byte $00 ; |        | $7D78
    .byte $60 ; | XX     | $7D79
    .byte $90 ; |X  X    | $7D7A
    .byte $88 ; |X   X   | $7D7B
    .byte $84 ; |X    X  | $7D7C
    .byte $04 ; |     X  | $7D7D
    .byte $02 ; |      X | $7D7E
    .byte $03 ; |      XX| $7D7F
    .byte $00 ; |        | $7D80
    .byte $30 ; |  XX    | $7D81
    .byte $48 ; | X  X   | $7D82
    .byte $44 ; | X   X  | $7D83
    .byte $42 ; | X    X | $7D84
    .byte $82 ; |X     X | $7D85
    .byte $01 ; |       X| $7D86
    .byte $01 ; |       X| $7D87
    .byte $00 ; |        | $7D88
    .byte $18 ; |   XX   | $7D89
    .byte $24 ; |  X  X  | $7D8A
    .byte $22 ; |  X   X | $7D8B
    .byte $A1 ; |X X    X| $7D8C
    .byte $C1 ; |XX     X| $7D8D
    .byte $00 ; |        | $7D8E
    .byte $00 ; |        | $7D8F
    .byte $00 ; |        | $7D90
    .byte $0C ; |    XX  | $7D91
    .byte $92 ; |X  X  X | $7D92
    .byte $91 ; |X  X   X| $7D93
    .byte $50 ; | X X    | $7D94
    .byte $60 ; | XX     | $7D95
    .byte $00 ; |        | $7D96
    .byte $00 ; |        | $7D97
    .byte $00 ; |        | $7D98
    .byte $86 ; |X    XX | $7D99
    .byte $49 ; | X  X  X| $7D9A
    .byte $48 ; | X  X   | $7D9B
    .byte $28 ; |  X X   | $7D9C
    .byte $30 ; |  XX    | $7D9D
    .byte $00 ; |        | $7D9E
    .byte $00 ; |        | $7D9F
    .byte $80 ; |X       | $7DA0
    .byte $43 ; | X    XX| $7DA1
    .byte $24 ; |  X  X  | $7DA2
    .byte $24 ; |  X  X  | $7DA3
    .byte $14 ; |   X X  | $7DA4
    .byte $18 ; |   XX   | $7DA5
    .byte $00 ; |        | $7DA6
    .byte $00 ; |        | $7DA7
    .byte $40 ; | X      | $7DA8
    .byte $A1 ; |X X    X| $7DA9
    .byte $12 ; |   X  X | $7DAA
    .byte $12 ; |   X  X | $7DAB
    .byte $0A ; |    X X | $7DAC
    .byte $0C ; |    XX  | $7DAD
    .byte $00 ; |        | $7DAE
    .byte $00 ; |        | $7DAF
    .byte $20 ; |  X     | $7DB0
    .byte $50 ; | X X    | $7DB1
    .byte $19 ; |   XX  X| $7DB2
    .byte $19 ; |   XX  X| $7DB3
    .byte $05 ; |     X X| $7DB4
    .byte $06 ; |     XX | $7DB5
    .byte $00 ; |        | $7DB6
    .byte $00 ; |        | $7DB7
    .byte $10 ; |   X    | $7DB8
    .byte $28 ; |  X X   | $7DB9
    .byte $44 ; | X   X  | $7DBA
    .byte $44 ; | X   X  | $7DBB
    .byte $82 ; |X     X | $7DBC
    .byte $03 ; |      XX| $7DBD
    .byte $00 ; |        | $7DBE
    .byte $00 ; |        | $7DBF
    .byte $08 ; |    X   | $7DC0
    .byte $14 ; |   X X  | $7DC1
    .byte $22 ; |  X   X | $7DC2
    .byte $22 ; |  X   X | $7DC3
    .byte $41 ; | X     X| $7DC4
    .byte $81 ; |X      X| $7DC5
    .byte $00 ; |        | $7DC6
    .byte $00 ; |        | $7DC7
    .byte $04 ; |     X  | $7DC8
    .byte $0A ; |    X X | $7DC9
    .byte $11 ; |   X   X| $7DCA
    .byte $11 ; |   X   X| $7DCB
    .byte $20 ; |  X     | $7DCC
    .byte $C0 ; |XX      | $7DCD
    .byte $80 ; |X       | $7DCE
    .byte $00 ; |        | $7DCF
    .byte $02 ; |      X | $7DD0
    .byte $05 ; |     X X| $7DD1
    .byte $08 ; |    X   | $7DD2
    .byte $08 ; |    X   | $7DD3
    .byte $10 ; |   X    | $7DD4
    .byte $E0 ; |XXX     | $7DD5
    .byte $40 ; | X      | $7DD6
    .byte $00 ; |        | $7DD7
    .byte $01 ; |       X| $7DD8
    .byte $02 ; |      X | $7DD9
    .byte $04 ; |     X  | $7DDA
    .byte $04 ; |     X  | $7DDB
    .byte $88 ; |X   X   | $7DDC
    .byte $70 ; | XXX    | $7DDD
    .byte $20 ; |  X     | $7DDE
    .byte $00 ; |        | $7DDF
    .byte $00 ; |        | $7DE0
    .byte $01 ; |       X| $7DE1
    .byte $02 ; |      X | $7DE2
    .byte $82 ; |X     X | $7DE3
    .byte $44 ; | X   X  | $7DE4
    .byte $38 ; |  XXX   | $7DE5
    .byte $10 ; |   X    | $7DE6
    .byte $00 ; |        | $7DE7
    .byte $00 ; |        | $7DE8
    .byte $00 ; |        | $7DE9
    .byte $01 ; |       X| $7DEA
    .byte $C1 ; |XX     X| $7DEB
    .byte $22 ; |  X   X | $7DEC
    .byte $1C ; |   XXX  | $7DED
    .byte $08 ; |    X   | $7DEE
    .byte $00 ; |        | $7DEF
    .byte $00 ; |        | $7DF0
    .byte $00 ; |        | $7DF1
    .byte $00 ; |        | $7DF2
    .byte $E0 ; |XXX     | $7DF3
    .byte $11 ; |   X   X| $7DF4
    .byte $0E ; |    XXX | $7DF5
    .byte $04 ; |     X  | $7DF6
    .byte $00 ; |        | $7DF7
    .byte $00 ; |        | $7DF8
    .byte $00 ; |        | $7DF9
    .byte $80 ; |X       | $7DFA
    .byte $70 ; | XXX    | $7DFB
    .byte $08 ; |    X   | $7DFC
    .byte $07 ; |     XXX| $7DFD
    .byte $02 ; |      X | $7DFE
    .byte $00 ; |        | $7DFF
    .byte $00 ; |        | $7E00
    .byte $01 ; |       X| $7E01
    .byte $02 ; |      X | $7E02
    .byte $1C ; |   XXX  | $7E03
    .byte $20 ; |  X     | $7E04
    .byte $C0 ; |XX      | $7E05
    .byte $80 ; |X       | $7E06
    .byte $00 ; |        | $7E07
    .byte $00 ; |        | $7E08
    .byte $02 ; |      X | $7E09
    .byte $05 ; |     X X| $7E0A
    .byte $39 ; |  XXX  X| $7E0B
    .byte $41 ; | X     X| $7E0C
    .byte $80 ; |X       | $7E0D
    .byte $00 ; |        | $7E0E
    .byte $00 ; |        | $7E0F
    .byte $00 ; |        | $7E10
    .byte $04 ; |     X  | $7E11
    .byte $0A ; |    X X | $7E12
    .byte $72 ; | XXX  X | $7E13
    .byte $83 ; |X     XX| $7E14
    .byte $01 ; |       X| $7E15
    .byte $00 ; |        | $7E16
    .byte $00 ; |        | $7E17
    .byte $00 ; |        | $7E18
    .byte $08 ; |    X   | $7E19
    .byte $14 ; |   X X  | $7E1A
    .byte $E4 ; |XXX  X  | $7E1B
    .byte $06 ; |     XX | $7E1C
    .byte $03 ; |      XX| $7E1D
    .byte $00 ; |        | $7E1E
    .byte $00 ; |        | $7E1F
    .byte $00 ; |        | $7E20
    .byte $10 ; |   X    | $7E21
    .byte $28 ; |  X X   | $7E22
    .byte $C8 ; |XX  X   | $7E23
    .byte $0D ; |    XX X| $7E24
    .byte $06 ; |     XX | $7E25
    .byte $00 ; |        | $7E26
    .byte $00 ; |        | $7E27
    .byte $00 ; |        | $7E28
    .byte $20 ; |  X     | $7E29
    .byte $50 ; | X X    | $7E2A
    .byte $91 ; |X  X   X| $7E2B
    .byte $1B ; |   XX XX| $7E2C
    .byte $0C ; |    XX  | $7E2D
    .byte $00 ; |        | $7E2E
    .byte $00 ; |        | $7E2F
    .byte $00 ; |        | $7E30
    .byte $40 ; | X      | $7E31
    .byte $A0 ; |X X     | $7E32
    .byte $22 ; |  X   X | $7E33
    .byte $37 ; |  XX XXX| $7E34
    .byte $18 ; |   XX   | $7E35
    .byte $00 ; |        | $7E36
    .byte $00 ; |        | $7E37
    .byte $00 ; |        | $7E38
    .byte $80 ; |X       | $7E39
    .byte $40 ; | X      | $7E3A
    .byte $44 ; | X   X  | $7E3B
    .byte $6E ; | XX XXX | $7E3C
    .byte $31 ; |  XX   X| $7E3D
    .byte $01 ; |       X| $7E3E
    .byte $00 ; |        | $7E3F
    .byte $00 ; |        | $7E40
    .byte $00 ; |        | $7E41
    .byte $80 ; |X       | $7E42
    .byte $88 ; |X   X   | $7E43
    .byte $DC ; |XX XXX  | $7E44
    .byte $62 ; | XX   X | $7E45
    .byte $02 ; |      X | $7E46
    .byte $01 ; |       X| $7E47
    .byte $00 ; |        | $7E48
    .byte $00 ; |        | $7E49
    .byte $00 ; |        | $7E4A
    .byte $10 ; |   X    | $7E4B
    .byte $B8 ; |X XXX   | $7E4C
    .byte $C4 ; |XX   X  | $7E4D
    .byte $05 ; |     X X| $7E4E
    .byte $03 ; |      XX| $7E4F
    .byte $00 ; |        | $7E50
    .byte $00 ; |        | $7E51
    .byte $00 ; |        | $7E52
    .byte $20 ; |  X     | $7E53
    .byte $71 ; | XXX   X| $7E54
    .byte $19 ; |   XX  X| $7E55
    .byte $0A ; |    X X | $7E56
    .byte $06 ; |     XX | $7E57
    .byte $00 ; |        | $7E58
    .byte $00 ; |        | $7E59
    .byte $00 ; |        | $7E5A
    .byte $41 ; | X     X| $7E5B
    .byte $E2 ; |XXX   X | $7E5C
    .byte $12 ; |   X  X | $7E5D
    .byte $14 ; |   X X  | $7E5E
    .byte $0C ; |    XX  | $7E5F
    .byte $00 ; |        | $7E60
    .byte $00 ; |        | $7E61
    .byte $01 ; |       X| $7E62
    .byte $82 ; |X     X | $7E63
    .byte $C4 ; |XX   X  | $7E64
    .byte $24 ; |  X  X  | $7E65
    .byte $28 ; |  X X   | $7E66
    .byte $18 ; |   XX   | $7E67
    .byte $00 ; |        | $7E68
    .byte $01 ; |       X| $7E69
    .byte $02 ; |      X | $7E6A
    .byte $04 ; |     X  | $7E6B
    .byte $88 ; |X   X   | $7E6C
    .byte $48 ; | X  X   | $7E6D
    .byte $50 ; | X X    | $7E6E
    .byte $30 ; |  XX    | $7E6F
    .byte $00 ; |        | $7E70
    .byte $03 ; |      XX| $7E71
    .byte $04 ; |     X  | $7E72
    .byte $08 ; |    X   | $7E73
    .byte $10 ; |   X    | $7E74
    .byte $90 ; |X  X    | $7E75
    .byte $A0 ; |X X     | $7E76
    .byte $60 ; | XX     | $7E77
    .byte $00 ; |        | $7E78
    .byte $06 ; |     XX | $7E79
    .byte $09 ; |    X  X| $7E7A
    .byte $11 ; |   X   X| $7E7B
    .byte $21 ; |  X    X| $7E7C
    .byte $20 ; |  X     | $7E7D
    .byte $40 ; | X      | $7E7E
    .byte $C0 ; |XX      | $7E7F
    .byte $00 ; |        | $7E80
    .byte $0C ; |    XX  | $7E81
    .byte $12 ; |   X  X | $7E82
    .byte $22 ; |  X   X | $7E83
    .byte $42 ; | X    X | $7E84
    .byte $41 ; | X     X| $7E85
    .byte $80 ; |X       | $7E86
    .byte $80 ; |X       | $7E87
    .byte $00 ; |        | $7E88
    .byte $18 ; |   XX   | $7E89
    .byte $24 ; |  X  X  | $7E8A
    .byte $44 ; | X   X  | $7E8B
    .byte $85 ; |X    X X| $7E8C
    .byte $83 ; |X     XX| $7E8D
    .byte $00 ; |        | $7E8E
    .byte $00 ; |        | $7E8F
    .byte $00 ; |        | $7E90
    .byte $30 ; |  XX    | $7E91
    .byte $49 ; | X  X  X| $7E92
    .byte $89 ; |X   X  X| $7E93
    .byte $0A ; |    X X | $7E94
    .byte $06 ; |     XX | $7E95
    .byte $00 ; |        | $7E96
    .byte $00 ; |        | $7E97
    .byte $00 ; |        | $7E98
    .byte $61 ; | XX    X| $7E99
    .byte $92 ; |X  X  X | $7E9A
    .byte $12 ; |   X  X | $7E9B
    .byte $14 ; |   X X  | $7E9C
    .byte $0C ; |    XX  | $7E9D
    .byte $00 ; |        | $7E9E
    .byte $00 ; |        | $7E9F
    .byte $01 ; |       X| $7EA0
    .byte $C2 ; |XX    X | $7EA1
    .byte $24 ; |  X  X  | $7EA2
    .byte $24 ; |  X  X  | $7EA3
    .byte $28 ; |  X X   | $7EA4
    .byte $18 ; |   XX   | $7EA5
    .byte $00 ; |        | $7EA6
    .byte $00 ; |        | $7EA7
    .byte $02 ; |      X | $7EA8
    .byte $85 ; |X    X X| $7EA9
    .byte $48 ; | X  X   | $7EAA
    .byte $48 ; | X  X   | $7EAB
    .byte $50 ; | X X    | $7EAC
    .byte $30 ; |  XX    | $7EAD
    .byte $00 ; |        | $7EAE
    .byte $00 ; |        | $7EAF
    .byte $04 ; |     X  | $7EB0
    .byte $0A ; |    X X | $7EB1
    .byte $91 ; |X  X   X| $7EB2
    .byte $91 ; |X  X   X| $7EB3
    .byte $A0 ; |X X     | $7EB4
    .byte $60 ; | XX     | $7EB5
    .byte $00 ; |        | $7EB6
    .byte $00 ; |        | $7EB7
    .byte $08 ; |    X   | $7EB8
    .byte $14 ; |   X X  | $7EB9
    .byte $22 ; |  X   X | $7EBA
    .byte $22 ; |  X   X | $7EBB
    .byte $41 ; | X     X| $7EBC
    .byte $C0 ; |XX      | $7EBD
    .byte $00 ; |        | $7EBE
    .byte $00 ; |        | $7EBF
    .byte $10 ; |   X    | $7EC0
    .byte $28 ; |  X X   | $7EC1
    .byte $44 ; | X   X  | $7EC2
    .byte $44 ; | X   X  | $7EC3
    .byte $82 ; |X     X | $7EC4
    .byte $81 ; |X      X| $7EC5
    .byte $00 ; |        | $7EC6
    .byte $00 ; |        | $7EC7
    .byte $20 ; |  X     | $7EC8
    .byte $50 ; | X X    | $7EC9
    .byte $88 ; |X   X   | $7ECA
    .byte $88 ; |X   X   | $7ECB
    .byte $04 ; |     X  | $7ECC
    .byte $03 ; |      XX| $7ECD
    .byte $01 ; |       X| $7ECE
    .byte $00 ; |        | $7ECF
    .byte $40 ; | X      | $7ED0
    .byte $A0 ; |X X     | $7ED1
    .byte $10 ; |   X    | $7ED2
    .byte $10 ; |   X    | $7ED3
    .byte $08 ; |    X   | $7ED4
    .byte $07 ; |     XXX| $7ED5
    .byte $02 ; |      X | $7ED6
    .byte $00 ; |        | $7ED7
    .byte $80 ; |X       | $7ED8
    .byte $40 ; | X      | $7ED9
    .byte $20 ; |  X     | $7EDA
    .byte $20 ; |  X     | $7EDB
    .byte $11 ; |   X   X| $7EDC
    .byte $0E ; |    XXX | $7EDD
    .byte $04 ; |     X  | $7EDE
    .byte $00 ; |        | $7EDF
    .byte $00 ; |        | $7EE0
    .byte $80 ; |X       | $7EE1
    .byte $40 ; | X      | $7EE2
    .byte $41 ; | X     X| $7EE3
    .byte $22 ; |  X   X | $7EE4
    .byte $1C ; |   XXX  | $7EE5
    .byte $08 ; |    X   | $7EE6
    .byte $00 ; |        | $7EE7
    .byte $00 ; |        | $7EE8
    .byte $00 ; |        | $7EE9
    .byte $80 ; |X       | $7EEA
    .byte $83 ; |X     XX| $7EEB
    .byte $44 ; | X   X  | $7EEC
    .byte $38 ; |  XXX   | $7EED
    .byte $10 ; |   X    | $7EEE
    .byte $00 ; |        | $7EEF
    .byte $00 ; |        | $7EF0
    .byte $00 ; |        | $7EF1
    .byte $00 ; |        | $7EF2
    .byte $07 ; |     XXX| $7EF3
    .byte $88 ; |X   X   | $7EF4
    .byte $70 ; | XXX    | $7EF5
    .byte $20 ; |  X     | $7EF6
    .byte $00 ; |        | $7EF7
    .byte $00 ; |        | $7EF8
    .byte $00 ; |        | $7EF9
    .byte $01 ; |       X| $7EFA
    .byte $0E ; |    XXX | $7EFB
    .byte $10 ; |   X    | $7EFC
    .byte $E0 ; |XXX     | $7EFD
    .byte $40 ; | X      | $7EFE
    .byte $00 ; |        | $7EFF
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
L7F58:
    LDA    #$00            ; 2
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    RESBL           ; 3
    LDX    #$00            ; 2
    STX    PF0             ; 3
    STX    PF1             ; 3
    STX    PF2             ; 3
    STX    COLUPF          ; 3
    INX                    ; 2
    STX    NUSIZ0          ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STX    NUSIZ1          ; 3
    LDA    #$30            ; 2
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    HMBL            ; 3
    LSR                    ; 2
    STA    HMP1            ; 3
    LDA    #$0C            ; 2
    STA    COLUP1          ; 3
    STA    COLUP0          ; 3
    LDX    #$07            ; 2
    LDA    #$00            ; 2
    STA    REFP0           ; 3
    STA    REFP1           ; 3
    STA    HMCLR           ; 3
L7F92:
    STA    WSYNC           ; 3
    NOP                    ; 2
    LDA    L7FB0,X         ; 4
    STA.w  $001B           ; 4
    LDA    L7FB8,X         ; 4
    STA    GRP1            ; 3
    NOP                    ; 2
    LDA    L7FC8,X         ; 4
    TAY                    ; 2
    LDA    L7FC0,X         ; 4
    STA    GRP0            ; 3
    STY    GRP1            ; 3
    DEX                    ; 2
    BPL    L7F92           ; 2
    RTS                    ; 6

L7FB0:
    .byte $00 ; |        | $7FB0
    .byte $00 ; |        | $7FB1
    .byte $00 ; |        | $7FB2
    .byte $00 ; |        | $7FB3
    .byte $00 ; |        | $7FB4
    .byte $00 ; |        | $7FB5
    .byte $00 ; |        | $7FB6
    .byte $00 ; |        | $7FB7
L7FB8:
    .byte $00 ; |        | $7FB8
    .byte $00 ; |        | $7FB9
    .byte $00 ; |        | $7FBA
    .byte $00 ; |        | $7FBB
    .byte $00 ; |        | $7FBC
    .byte $00 ; |        | $7FBD
    .byte $00 ; |        | $7FBE
    .byte $00 ; |        | $7FBF
L7FC0:
    .byte $00 ; |        | $7FC0
    .byte $00 ; |        | $7FC1
    .byte $00 ; |        | $7FC2
    .byte $00 ; |        | $7FC3
    .byte $00 ; |        | $7FC4
    .byte $00 ; |        | $7FC5
    .byte $00 ; |        | $7FC6
    .byte $00 ; |        | $7FC7
L7FC8:
    .byte $00 ; |        | $7FC8
    .byte $00 ; |        | $7FC9
    .byte $00 ; |        | $7FCA
    .byte $00 ; |        | $7FCB
    .byte $00 ; |        | $7FCC
    .byte $00 ; |        | $7FCD
    .byte $00 ; |        | $7FCE
    .byte $00 ; |        | $7FCF
    .byte $81 ; |X      X| $7FD0
    LDA    $BE             ; 3
    AND    #$37            ; 2
    JMP    L7613           ; 3
    LDA    $82             ; 3
    STA    AUDV0           ; 3
    ORA    #$10            ; 2
    STA    AUDF0           ; 3
    DEC    $82             ; 5
    BMI    L7FED           ; 2
    LDA    $BE             ; 3
    AND    #$33            ; 2
    STA    $BE             ; 3
    JMP    L7613           ; 3
L7FED:
    LDA    $BE             ; 3
    AND    #$77            ; 2
    JMP    L760F           ; 3
    AND    #$FF            ; 2
    .byte $FF ; |XXXXXXXX| $7FF6
    .byte $FF ; |XXXXXXXX| $7FF7
    .byte $FF ; |XXXXXXXX| $7FF8
    .byte $FF ; |XXXXXXXX| $7FF9
    .byte $FF ; |XXXXXXXX| $7FFA
    .byte $FF ; |XXXXXXXX| $7FFB
    .byte $00 ; |        | $7FFC
    .byte $F0 ; |XXXX    | $7FFD
    .byte $00 ; |        | $7FFE
    .byte $F0 ; |XXXX    | $7FFF
