; Rough Disassembly of Pressure Cooker
; Using DiStella v3.0
; By Omegamatrix
;
;
; Command Line: distella -pasfcpc1.cfg pc1.bin > PressureCooker_1.asm
;
; pc1.cfg contents:
;
;      ORG D000
;      CODE D000 D1D0
;      GFX D1D1 D1FF
;      CODE D200 D60B
;      GFX D60C D63F
;      CODE D640 D87F
;      GFX D880 DDFF
;      CODE DE00 DE66
;      GFX DE67 DFCF
;      CODE DFD0 DFD5
;      GFX DFD6 DFE2
;      CODE DFE3 DFE5
;      GFX DFE6 DFFF
;
; Command Line: distella -pasfcpc2.cfg pc2.bin > PressureCooker_2.asm
;
; pc2.cfg contents:
;
;      ORG F000
;      CODE F000 F0EC
;      DATA F0ED F0ED
;      CODE F0EE F22A
;      GFX F22B F2FF
;      CODE F300 F56E
;      DATA F56F F56F
;      CODE F570 FA8A
;      GFX FA8B FABE
;      CODE FABF FB0B
;      GFX FB0C FB71
;      CODE FB72 FCFD
;      GFX FCFE FE13
;      CODE FE14 FE28
;      GFX FE29 FFDF
;      CODE FFE0 FFE5
;      GFX FFE6 FFFF
;


      processor 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      EQUATES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
RESM0   =  $12
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
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

;read TIA base line = $00
CXP0FB  =  $02
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $D000

START:
    STA    $FFF9           ; 4

LD003:
    LDX    #$FF            ; 2
    TXS                    ; 2
    LDX    $F5             ; 3
    CPX    #8              ; 2
    BCC    LD03D           ; 2³
    LDA    $F4             ; 3
    CMP    #2              ; 2
    BCS    LD03D           ; 2³
    INC    $F4             ; 5
    LDY    $B1             ; 3
    LDA    LD880,Y         ; 4
    SEC                    ; 2
    SBC    #$0B            ; 2
    STA    $FB             ; 3
    LDA    #$DA            ; 2
    STA    $FC             ; 3
    LDY    #$0A            ; 2
LD024:
    LDA    ($FB),Y         ; 5
    STA.wy $99,Y           ; 5
    DEY                    ; 2
    BPL    LD024           ; 2³
    TXA                    ; 2
    SEC                    ; 2
    SBC    #3              ; 2
    TAX                    ; 2
    INY                    ; 2
LD032:
    LDA    LDD9E,Y         ; 4
    STA    $99,X           ; 4
    INX                    ; 2
    INY                    ; 2
    CPY    #4              ; 2
    BCC    LD032           ; 2³
LD03D:
    LDA    $EE             ; 3
    BNE    LD043           ; 2³
    LDA    #$0C            ; 2
LD043:
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    STA    $FD             ; 3
LD049:
    LDA    INTIM           ; 4
    BNE    LD049           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $DD             ; 3
    ROL                    ; 2
    ROL                    ; 2
    ROL                    ; 2
    AND    #$02            ; 2
    STA    VBLANK          ; 3
    LDY    #$86            ; 2
    STY    COLUBK          ; 3
    JSR    LDE00           ; 6
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    LDA    #$70            ; 2
    STA    HMP0            ; 3
    STA    HMP1            ; 3
    LDX    $B4             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    JSR    LDE66           ; 6
LD075:
    DEX                    ; 2
    BPL    LD075           ; 2³
    STA.w  RESBL           ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    $B3             ; 3
    LDY    $B8             ; 3
    LDA    $B7             ; 3
    NOP                    ; 2
LD086:
    DEX                    ; 2
    BPL    LD086           ; 2³
    LDX    #$60            ; 2
    STA    RESM0           ; 3
    STA    HMM0            ; 3
    STY    HMBL            ; 3
    STX    HMP0            ; 3
    STX    HMP1            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$0A            ; 2
    LDY    $BD             ; 3
    CPY    #$69            ; 2
    BNE    LD0A3           ; 2³
    LDA    #8              ; 2
LD0A3:
    STA    $FB             ; 3
    LDA    #$DB            ; 2
    STA    $FC             ; 3
    LDA    #$32            ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    HMCLR           ; 3
    LDY    #$48            ; 2
    LDX    #$DD            ; 2
    STY    COLUPF          ; 3
    STX    $8C             ; 3
    LDA    #$35            ; 2
    STA    CTRLPF          ; 3
    LDY    #$F0            ; 2
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    $F3             ; 3
    BEQ    LD0CC           ; 2³
    JMP    LD425           ; 3
LD0CC:
    STY    PF2             ; 3
    JSR    LDE66           ; 6
    LDA    $81             ; 3
    AND    #$0C            ; 2
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LD891,Y         ; 4
    STA    $8B             ; 3
    STA    HMCLR           ; 3
    LDX    #$FF            ; 2
    STX    PF2             ; 3
    LDY    $C7             ; 3
    LDA    LD880,Y         ; 4
    ADC    #3              ; 2
    SEC                    ; 2
    SBC    $FA             ; 3
    STA    $95             ; 3
    LDY    #$0B            ; 2
    LDA    #$48            ; 2
LD0F3:
    LDX    #$F0            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUPF          ; 3
    STX    PF2             ; 3
    JSR    LDE66           ; 6
    JSR    LDE66           ; 6
    JSR    LDE66           ; 6
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    LDA    #$40            ; 2
    DEY                    ; 2
    CPY    #8              ; 2
    BNE    LD0F3           ; 2³+1
    LDA    #$5B            ; 2
    LDX    $C4             ; 3
    CPX    #$50            ; 2
    BNE    LD11B           ; 2³
    LDA    #$53            ; 2
LD11B:
    STA    $8D             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    $FD             ; 3
    STA    COLUP1          ; 3
    LDA    #$DD            ; 2
    STA    $8E             ; 3
    STA    $8E             ; 3
    LDX    #$2C            ; 2
    BNE    LD13F           ; 2³
LD12F:
    LDA    ($8D),Y         ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    ENABL           ; 3
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($89),Y         ; 5
    STA    GRP1            ; 3
LD13F:
    LDA    #$70            ; 2
    STA    PF2             ; 3
    LDA    #$40            ; 2
    STA    COLUPF          ; 3
    LDA    ($8B),Y         ; 5
    STA    GRP0            ; 3
    STX    COLUP0          ; 3
    LDA    #$73            ; 2
    STA    PF2             ; 3
    LDA    ($FB),Y         ; 5
    STA    COLUPF          ; 3
    LDA    $FD             ; 3
    STA    COLUP0          ; 3
    DEY                    ; 2
    BPL    LD12F           ; 2³
    LDX    #0              ; 2
    LDA    #$F0            ; 2
    LDY    #$30            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STA    PF2             ; 3
    LDA    #$40            ; 2
    STA    COLUPF          ; 3
    STY    NUSIZ0          ; 3
    INX                    ; 2
    STX    NUSIZ1          ; 3
    STX    VDELP0          ; 3
    LDA    $F9             ; 3
    AND    #$06            ; 2
    STA    RESBL           ; 3
    LSR                    ; 2
    TAY                    ; 2
    STA    RESP1           ; 3
    LDA    #$C0            ; 2
    STA    HMP1            ; 3
    LDA    LD895,Y         ; 4
    STA    $B3             ; 3
    LDA    #$EF            ; 2
    STA    HMBL            ; 3
    STA    REFP1           ; 3
    LDA    #$31            ; 2
    STA    CTRLPF          ; 3
    LDA    #$0E            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUP1          ; 3
    LDX    $B4             ; 3
    LDA    #$DD            ; 2
    STA    $B4             ; 3
    NOP                    ; 2
    LDY    $B8             ; 3
    LDA    #$DD            ; 2
LD1A7:
    DEX                    ; 2
    BNE    LD1A7           ; 2³
    STA    RESP0           ; 3
    STA    HMCLR           ; 3
    STY    HMP0            ; 3
    STA    $B8             ; 3
    STA    $FC             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    PF2             ; 3
    LDA    #2              ; 2
    STA    COLUPF          ; 3
    LDA    $C4             ; 3
    STA    $FB             ; 3
    LDA    #$14            ; 2
    STA    COLUP0          ; 3
    LDA    $C2             ; 3
    STA    $B7             ; 3
    LDY    #$14            ; 2
    STA    HMCLR           ; 3
    JMP    LD200           ; 3


  REPEAT ($D200 - *)       ;       empty bytes, $D1D1 - $D1FF
    .byte 0
  REPEND


LD200:
    LDA    ($FB),Y         ; 5
    STA    GRP0            ; 3
    STY    $FD             ; 3
    TYA                    ; 2
    SBC    $C3             ; 3
    TAY                    ; 2
    CPY    #8              ; 2
    BCC    LD214           ; 2³
    LDX    #$14            ; 2
    LDA    #0              ; 2
    BEQ    LD219           ; 2³
LD214:
    LDA    ($B7),Y         ; 5
    LDX    LDD10,Y         ; 4
LD219:
    LDY    $FD             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    ENAM0           ; 3
    STX    COLUP0          ; 3
    LDA    ($B3),Y         ; 5
    STA    GRP1            ; 3
    LDA    LD8BB,Y         ; 4
    STA    PF2             ; 3
    DEY                    ; 2
    CPY    #$0B            ; 2
    BNE    LD200           ; 2³
    LDA    ($FB),Y         ; 5
    STA    GRP0            ; 3
    TYA                    ; 2
    SBC    $C3             ; 3
    TAY                    ; 2
    CPY    #8              ; 2
    BCC    LD243           ; 2³
    LDX    #$14            ; 2
    LDA    #0              ; 2
    BEQ    LD248           ; 2³
LD243:
    LDA    ($B7),Y         ; 5
    LDX    LDD10,Y         ; 4
LD248:
    LDY    #2              ; 2
    STY    NUSIZ1          ; 3
    LDY    #$0B            ; 2
    CLC                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    ENAM0           ; 3
    STX    COLUP0          ; 3
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    REFP1           ; 3
    STA    $FC             ; 3
    LDA    $B3             ; 3
    ADC    #$0B            ; 2
    STA    $B3             ; 3
    LDA    #$CF            ; 2
    DEY                    ; 2
    STA    HMP1            ; 3
    SEC                    ; 2
    STY    $FD             ; 3
    JMP    LD27B           ; 3
LD270:
    LDA    LDAFE,Y         ; 4
    STA    HMCLR           ; 3
    STA    HMBL            ; 3
    STA    ENABL           ; 3
    STY    $FD             ; 3
LD27B:
    TYA                    ; 2
    SBC    $C3             ; 3
    TAY                    ; 2
    CPY    #8              ; 2
    LDA    #0              ; 2
    BCS    LD28A           ; 2³
    LDA    ($B7),Y         ; 5
    LDX    LDD10,Y         ; 4
LD28A:
    LDY    $FD             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    ENAM0           ; 3
    STX    COLUP0          ; 3
    LDA    ($B3),Y         ; 5
    STA    GRP1            ; 3
    LDA    LD8BB,Y         ; 4
    STA    PF2             ; 3
    DEY                    ; 2
    CPY    #1              ; 2
    BNE    LD270           ; 2³
    STA    HMCLR           ; 3
    LDX    $B5             ; 3
    TYA                    ; 2
    SBC    $C3             ; 3
    TAY                    ; 2
    CPY    #8              ; 2
    BCS    LD2B5           ; 2³
    LDA    ($B7),Y         ; 5
    STA    ENAM0           ; 3
    LDA    LDD10,Y         ; 4
LD2B5:
    LDY    $B9             ; 3
    STA    COLUP0          ; 3
    LDA    $F6             ; 3
    STA    REFP1           ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    SEC                    ; 2
    LDA    #0              ; 2
    STA    PF2             ; 3
    STA    GRP1            ; 3
    STA    NUSIZ1          ; 3
    SBC    $C3             ; 3
LD2CC:
    DEX                    ; 2
    BNE    LD2CC           ; 2³
    CMP    #8              ; 2
    STA    RESP1           ; 3
    STY    HMP1            ; 3
    TAY                    ; 2
    LDA    LDD10,Y         ; 4
    BCC    LD2E5           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    BCS    LD2EF           ; 2³
LD2E5:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUP0          ; 3
    LDA    ($B7),Y         ; 5
    STA    ENAM0           ; 3
LD2EF:
    STX    COLUBK          ; 3
    LDX    $B6             ; 3
LD2F3:
    DEX                    ; 2
    BPL    LD2F3           ; 2³
    STA.w  RESP0           ; 4
    LDA    $BA             ; 3
    STA    HMCLR           ; 3
    STA    HMP0            ; 3
    LDA    $C3             ; 3
    EOR    #$FF            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #$82            ; 2
    STX    COLUBK          ; 3
    CMP    #8              ; 2
    BCS    LD317           ; 2³
    TAY                    ; 2
    LDA    ($B7),Y         ; 5
    STA    ENAM0           ; 3
    LDA    LDD10,Y         ; 4
LD317:
    STA    COLUP0          ; 3
    LDA    #3              ; 2
    STA    PF1             ; 3
    LDY    #$5F            ; 2
    STY    $FB             ; 3
    LDA    $84             ; 3
    STA    CTRLPF          ; 3
    STA    HMCLR           ; 3
    NOP                    ; 2
    STX    COLUPF          ; 3
    LDX    $95             ; 3
    LDA    #0              ; 2
    STA    ENAM0           ; 3
    STA    CXCLR           ; 3
    JMP    LD343           ; 3
LD335:
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD33D           ; 2³
    LDA    ($AC),Y         ; 5
LD33D:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
LD343:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD351           ; 2³
    LDA    ($AA),Y         ; 5
LD351:
    STA    GRP1            ; 3
    LDA    LDA00,X         ; 4
    BEQ    LD366           ; 2³
    STA    COLUPF          ; 3
LD35A:
    DEX                    ; 2
    LDA    LD900,Y         ; 4
    DEY                    ; 2
    STA    COLUPF          ; 3
    BNE    LD335           ; 2³
LD363:
    JMP    LD422           ; 3
LD366:
    LDA    #4              ; 2
    STA    COLUPF          ; 3
    LDA    LD900,Y         ; 4
    DEY                    ; 2
    STA    COLUPF          ; 3
    BEQ    LD363           ; 2³
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD37A           ; 2³
    LDA    ($AC),Y         ; 5
LD37A:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD38E           ; 2³
    LDA    ($AA),Y         ; 5
LD38E:
    STA    GRP1            ; 3
    LDA    #4              ; 2
    STA    COLUPF          ; 3
    LDX    $FC             ; 3
    INX                    ; 2
    STX    $FC             ; 3
    LDA    LD900,Y         ; 4
    DEY                    ; 2
    STA    COLUPF          ; 3
    BEQ    LD363           ; 2³
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD3A9           ; 2³
    LDA    ($AC),Y         ; 5
LD3A9:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD3BD           ; 2³
    LDA    ($AA),Y         ; 5
LD3BD:
    STA    GRP1            ; 3
    LDA    #2              ; 2
    STA    COLUPF          ; 3
    LDA    $C7,X           ; 4
    TAX                    ; 2
    LDA    LD900,Y         ; 4
    DEY                    ; 2
    STA    COLUPF          ; 3
    BEQ    LD422           ; 2³+1
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD3D6           ; 2³
    LDA    ($AC),Y         ; 5
LD3D6:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD3EA           ; 2³
    LDA    ($AA),Y         ; 5
LD3EA:
    STA    GRP1            ; 3
    LDA    #2              ; 2
    STA    COLUPF          ; 3
    LDA    LD880,X         ; 4
    TAX                    ; 2
    LDA    LD900,Y         ; 4
    DEY                    ; 2
    STA    COLUPF          ; 3
    BEQ    LD422           ; 2³+1
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD404           ; 2³
    LDA    ($AC),Y         ; 5
LD404:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD418           ; 2³
    LDA    ($AA),Y         ; 5
LD418:
    STA    GRP1            ; 3
    LDA    #2              ; 2
    STA    COLUPF          ; 3
    NOP                    ; 2
    JMP    LD35A           ; 3
LD422:
    JMP    LD6DA           ; 3
LD425:
    LDA    #1              ; 2
    STA    PF1             ; 3
    LDA    #$FF            ; 2
    STA    PF2             ; 3
    LDA    #$82            ; 2
    STA    COLUPF          ; 3
    JSR    LDE66           ; 6
    STA    HMCLR           ; 3
    LDA    #0              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$31            ; 2
    STA    CTRLPF          ; 3
    LDY    #3              ; 2
LD442:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    DEY                    ; 2
    BPL    LD442           ; 2³
    LDY    #7              ; 2
LD44B:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($87),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($89),Y         ; 5
    STA    GRP1            ; 3
    DEY                    ; 2
    BPL    LD44B           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    INY                    ; 2
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    LDX    $B5             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    $BA             ; 3
    LDY    $B9             ; 3
LD470:
    DEX                    ; 2
    BPL    LD470           ; 2³
    STA.w  RESP1           ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    $FB             ; 3
    LDX    #$80            ; 2
    STX    COLUPF          ; 3
    LDX    $B6             ; 3
    INX                    ; 2
LD483:
    DEX                    ; 2
    BPL    LD483           ; 2³
    STA    RESP0           ; 3
    STY    HMP1            ; 3
    STA    HMP0            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #$82            ; 2
    STA    COLUBK          ; 3
    LDA    #0              ; 2
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$FF            ; 2
    STA    VDELP0          ; 3
    LDA    $F6             ; 3
    STA    REFP1           ; 3
    STA    HMCLR           ; 3
    STA    CXCLR           ; 3
    LDY    #$72            ; 2
LD4AC:
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD4B4           ; 2³
    LDA    ($AC),Y         ; 5
LD4B4:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    COLUP0          ; 3
    LDA    ($A8),Y         ; 5
    STA    COLUP1          ; 3
    AND    #$01            ; 2
    BEQ    LD4C8           ; 2³
    LDA    ($AA),Y         ; 5
LD4C8:
    STA    GRP1            ; 3
    DEY                    ; 2
    CPY    #$57            ; 2
    BNE    LD4AC           ; 2³
    LDA    #$82            ; 2
    STA    COLUPF          ; 3
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD4DB           ; 2³
    LDA    ($AC),Y         ; 5
LD4DB:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    LDX    LD904           ; 4
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA    COLUP0          ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    COLUBK          ; 3
    LDA    #0              ; 2
    STA    GRP1            ; 3
    STA    VDELP0          ; 3
    LDA    #$FC            ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    LDA    #$3C            ; 2
    STA    PF2             ; 3
    BNE    LD516           ; 2³+1
LD4FF:
    LDX    LD90E,Y         ; 4
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD50A           ; 2³
    LDA    ($AC),Y         ; 5
LD50A:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    COLUBK          ; 3
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
LD516:
    DEY                    ; 2
    CPY    #$51            ; 2
    BNE    LD4FF           ; 2³+1
    LDA    #6              ; 2
    STA    REFP1           ; 3
    STA    NUSIZ1          ; 3
    LDA    #0              ; 2
    LDX    #$82            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STX    COLUBK          ; 3
    LDA    $81             ; 3
    STA.w  RESBL           ; 4
    AND    #$0C            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LDX    #$10            ; 2
    STA    RESP1           ; 3
    STX    HMP1            ; 3
    LDX    #$70            ; 2
    STX    HMBL            ; 3
    ADC    #$65            ; 2
    SBC    #$35            ; 2
    STA    $B9             ; 3
    LDA    #$D9            ; 2
    SBC    #0              ; 2
    STA    $BA             ; 3
    DEY                    ; 2
LD553:
    LDA    LDACE,Y         ; 4
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    GRP1            ; 3
    LDA    #$C8            ; 2
    STA    COLUP1          ; 3
    JSR    LDE66           ; 6
    JSR    LDE66           ; 6
    LDA    #$48            ; 2
    STA    HMCLR           ; 3
    STA    COLUP1          ; 3
    LDA    #$88            ; 2
    NOP                    ; 2
    NOP                    ; 2
    STA    COLUP1          ; 3
    DEY                    ; 2
    CPY    #$49            ; 2
    BNE    LD553           ; 2³
    LDA    #$40            ; 2
    STA    HMBL            ; 3
LD57B:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    GRP1            ; 3
    LDA    LDACE,Y         ; 4
    STA    COLUBK          ; 3
    DEY                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    CPY    #$44            ; 2
    STA    HMCLR           ; 3
    BNE    LD57B           ; 2³
LD591:
    LDX    #$86            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    COLUBK          ; 3
    LDA    #3              ; 2
    STA    PF1             ; 3
    LDA    #$C3            ; 2
    STA    PF2             ; 3
    LDA    #$C4            ; 2
    STA    COLUPF          ; 3
    JSR    LDE66           ; 6
    NOP                    ; 2
    NOP                    ; 2
    NOP                    ; 2
    LDA    #$44            ; 2
    STA    COLUPF          ; 3
    LDA    #$84            ; 2
    NOP                    ; 2
    DEY                    ; 2
    STA    COLUPF          ; 3
    CPY    #$40            ; 2
    BNE    LD591           ; 2³
LD5B9:
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD5C1           ; 2³
    LDA    ($AC),Y         ; 5
LD5C1:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    LDA    ($B9),Y         ; 5
    STA    COLUP1          ; 3
    LDA    #$FF            ; 2
    STA    GRP1            ; 3
    LDA    #$86            ; 2
    STA    COLUPF          ; 3
    DEY                    ; 2
    CPY    #$35            ; 2
    BNE    LD5B9           ; 2³
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD5E4           ; 2³
    LDA    ($AC),Y         ; 5
LD5E4:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    LDA    #$82            ; 2
    STA    COLUBK          ; 3
    LDA    #4              ; 2
    STA    $B9             ; 3
    LDA    #0              ; 2
    STA    COLUPF          ; 3
    LDA    #$0F            ; 2
    STA    ENABL           ; 3
    DEY                    ; 2
    LDX    #0              ; 2
    LDA    #$D9            ; 2
    STA    $B6             ; 3
    STA    $B4             ; 3
    STA    $B8             ; 3
    JMP    LD66F           ; 3


  REPEAT ($D640 - *)       ;       empty bytes, $D60C - $D63F
    .byte 0
  REPEND


LD640:
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD648           ; 2³
    LDA    ($AC),Y         ; 5
LD648:
    STA    WSYNC           ; 3
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    LDA    LD8D3,X         ; 4
    STA    GRP1            ; 3
    TXA                    ; 2
    STY    $FB             ; 3
    TAY                    ; 2
    LDA    ($B3),Y         ; 5
    STA    COLUP1          ; 3
    LDA    ($B5),Y         ; 5
    STA    COLUP1          ; 3
    LDA    ($B7),Y         ; 5
    LDY    $FB             ; 3
    STA    COLUP1          ; 3
    DEY                    ; 2
    DEX                    ; 2
    BNE    LD640           ; 2³
    LDA    $B9             ; 3
    BEQ    LD6C2           ; 2³
LD66F:
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    BEQ    LD67B           ; 2³
    LDA    ($AC),Y         ; 5
LD67B:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    STX    GRP1            ; 3
    LDX    #$93            ; 2
    LDA    $E9             ; 3
    CMP    $B9             ; 3
    BCC    LD68D           ; 2³
    LDX    #$72            ; 2
LD68D:
    STX    $B3             ; 3
    LDX    #$93            ; 2
    LDA    $EA             ; 3
    CMP    $B9             ; 3
    BCC    LD699           ; 2³
    LDX    #$7D            ; 2
LD699:
    STX    $B5             ; 3
    LDX    #$93            ; 2
    LDA    $EB             ; 3
    CMP    $B9             ; 3
    BCC    LD6A5           ; 2³
    LDX    #$88            ; 2
LD6A5:
    STX    $B7             ; 3
    DEY                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    ($97),Y         ; 5
    AND    #$01            ; 2
    BEQ    LD6B4           ; 2³
    LDA    ($AC),Y         ; 5
LD6B4:
    STA    GRP0            ; 3
    LDA    ($AE),Y         ; 5
    STA    COLUP0          ; 3
    LDX    #$0B            ; 2
    DEY                    ; 2
    DEC    $B9             ; 5
    JMP    LD640           ; 3
LD6C2:
    LDA    #0              ; 2
    LDX    #$80            ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    COLUBK          ; 3
    STA    PF0             ; 3
    STA    PF1             ; 3
    STA    PF2             ; 3
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
LD6DA:
    LDA    #0              ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    PF1             ; 3
    STA    ENABL           ; 3
    STA    REFP1           ; 3
    STA    COLUBK          ; 3
    STA    VDELP0          ; 3
    LDA    CXP0FB          ; 3
    STA    $BA             ; 3
    LDA    #2              ; 2
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    LDA    #$E0            ; 2
    STA.w  RESP0           ; 4
    LDY    #$D0            ; 2
    STA    RESP1           ; 3
    STA    HMP0            ; 3
    STY    HMP1            ; 3
    LDA    LDB92           ; 4
    LDX    #4              ; 2
    LDY    #9              ; 2
    STA    GRP0            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STX    COLUBK          ; 3
    NOP                    ; 2
    BNE    LD71D           ; 2³
LD713:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    LDB89,Y         ; 4
    STA.w  GRP0            ; 4
LD71D:
    LDA    LDDAE,Y         ; 4
    STA    COLUP0          ; 3
    LDA    LDBA6,Y         ; 4
    STA    GRP1            ; 3
    LDA    LDDBF,Y         ; 4
    STA    COLUP1          ; 3
    LDA    LDBC2,Y         ; 4
    LDX    LDDD0,Y         ; 4
    STA    GRP0            ; 3
    STX    COLUP0          ; 3
    LDA    #$FE            ; 2
    STA    GRP1            ; 3
    LDA    #$1A            ; 2
    STA    COLUP1          ; 3
    STA    HMCLR           ; 3
    DEY                    ; 2
    BPL    LD713           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    #0              ; 2
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    COLUP0          ; 3
    STX    COLUP1          ; 3
    LDX    #3              ; 2
    STX    $FB             ; 3
    LDA    #$F0            ; 2
    STA.w  RESP1           ; 4
    LDX    #$35            ; 2
    STA    RESP0           ; 3
    STA    HMP0            ; 3
    STX    CTRLPF          ; 3
    LDY    #4              ; 2
    LDA    $81             ; 3
    AND    #$0F            ; 2
    CMP    #4              ; 2
    BCC    LD76E           ; 2³
    LDY    #8              ; 2
LD76E:
    STY    $FC             ; 3
    LDY    #$FF            ; 2
LD772:
    LDA    #4              ; 2
    DEC    $FB             ; 5
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STY    PF0             ; 3
    STY    PF1             ; 3
    INY                    ; 2
    STA    COLUPF          ; 3
    LDA    #$0C            ; 2
    STA    COLUBK          ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STA    HMCLR           ; 3
    LDX    $FB             ; 3
    BMI    LD7C8           ; 2³
    LDA    $CE,X           ; 4
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LD89D,Y         ; 4
    STA    NUSIZ0          ; 3
    LDA    LD8AD,Y         ; 4
    STA    NUSIZ1          ; 3
    LDY    #4              ; 2
    LDX    $FB             ; 3
LD7A2:
    LDA    $CE,X           ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    TAX                    ; 2
    LDA    LD899,X         ; 4
    LDX    $FB             ; 3
    CPX    $C6             ; 3
    BNE    LD7BA           ; 2³
    AND    #$F0            ; 2
    ORA    $FC             ; 3
LD7BA:
    STA    COLUBK          ; 3
    LDA    LDF60,Y         ; 4
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    DEY                    ; 2
    BPL    LD7A2           ; 2³
    BMI    LD772           ; 2³
LD7C8:
    LDA    #$DF            ; 2
    STA    $8C             ; 3
    STA    $8E             ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    PF0             ; 3
    STA    PF1             ; 3
    LDA    #4              ; 2
    STA    COLUBK          ; 3
    LDA    #$0C            ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDY    #7              ; 2
    LDA    $DF             ; 3
    AND    #$1F            ; 2
    CMP    #$14            ; 2
    BCS    LD7F3           ; 2³
    LDY    #0              ; 2
    SBC    #$0B            ; 2
    BCC    LD7F3           ; 2³
    TAY                    ; 2
LD7F3:
    TYA                    ; 2
    EOR    #$07            ; 2
    STA    $FD             ; 3
    LDA    #$B6            ; 2
    LDX    #8              ; 2
    SEC                    ; 2
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
LD801:
    STA    $8D,X           ; 4
    SBC    #8              ; 2
    STA    $8B,X           ; 4
    SBC    #8              ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    DEX                    ; 2
    BPL    LD801           ; 2³
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDA    #0              ; 2
    STA    COLUBK          ; 3
    STA    COLUPF          ; 3
    LDA    #$30            ; 2
    STA    CTRLPF          ; 3
    TYA                    ; 2
    JSR    LDE02           ; 6
    LDA    #$1C            ; 2
    STA    PF2             ; 3
    LDA    #$11            ; 2
    STA    NUSIZ1          ; 3
    LDY    #7              ; 2
    STY    ENABL           ; 3
    STA    HMCLR           ; 3
    STA    HMBL            ; 3
LD831:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    LDX    LDF86,Y         ; 4
    LDA    LDF66,Y         ; 4
    STA    GRP0            ; 3
    LDA    LDFBE,Y         ; 4
    STA    COLUPF          ; 3
    LDA    LDF6E,Y         ; 4
    STA    GRP1            ; 3
    LDA    LDF76,Y         ; 4
    STA    GRP0            ; 3
    NOP                    ; 2
    NOP                    ; 2
    LDA    LDF7E,Y         ; 4
    DEY                    ; 2
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STA    GRP1            ; 3
    LDA    #0              ; 2
    STA    COLUPF          ; 3
    DEC    $FD             ; 5
    BPL    LD831           ; 2³
    LDA    #$1F            ; 2
    LDX    #$82            ; 2
    STA    WSYNC           ; 3
    STA    TIM64T          ; 4
    STX    VBLANK          ; 3
    LDX    #0              ; 2
    STX    VDELP0          ; 3
    STX    VDELP1          ; 3
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    STX    GRP0            ; 3
    STX    PF2             ; 3
    STX    ENABL           ; 3
    DEX                    ; 2
    TXS                    ; 2
    JMP    LDFD0           ; 3
LD880:
    .byte $0D ; |    XX X| $D880
    .byte $1E ; |   XXXX | $D881
    .byte $2B ; |  X X XX| $D882
    .byte $38 ; |  XXX   | $D883
    .byte $45 ; | X   X X| $D884
    .byte $52 ; | X X  X | $D885
    .byte $5F ; | X XXXXX| $D886
    .byte $6C ; | XX XX  | $D887
    .byte $79 ; | XXXX  X| $D888
    .byte $9E ; |X  XXXX | $D889
    .byte $AB ; |X X X XX| $D88A
    .byte $B8 ; |X XXX   | $D88B
    .byte $C5 ; |XX   X X| $D88C
    .byte $D2 ; |XX X  X | $D88D
    .byte $DF ; |XX XXXXX| $D88E
    .byte $EC ; |XXX XX  | $D88F
    .byte $F9 ; |XXXXX  X| $D890
LD891:
    .byte $6A ; | XX X X | $D891
    .byte $73 ; | XXX  XX| $D892
    .byte $7C ; | XXXXX  | $D893
    .byte $85 ; |X    X X| $D894
LD895:
    .byte $12 ; |   X  X | $D895
    .byte $1E ; |   XXXX | $D896
    .byte $2A ; |  X X X | $D897
    .byte $36 ; |  XX XX | $D898
LD899:
    .byte $C6 ; |XX   XX | $D899
    .byte $44 ; | X   X  | $D89A
    .byte $88 ; |X   X   | $D89B
    .byte $04 ; |     X  | $D89C
LD89D:
    .byte $00 ; |        | $D89D
    .byte $04 ; |     X  | $D89E
    .byte $00 ; |        | $D89F
    .byte $04 ; |     X  | $D8A0
    .byte $02 ; |      X | $D8A1
    .byte $06 ; |     XX | $D8A2
    .byte $02 ; |      X | $D8A3
    .byte $06 ; |     XX | $D8A4
    .byte $00 ; |        | $D8A5
    .byte $04 ; |     X  | $D8A6
    .byte $00 ; |        | $D8A7
    .byte $04 ; |     X  | $D8A8
    .byte $02 ; |      X | $D8A9
    .byte $06 ; |     XX | $D8AA
    .byte $02 ; |      X | $D8AB
    .byte $06 ; |     XX | $D8AC
LD8AD:
    .byte $00 ; |        | $D8AD
    .byte $00 ; |        | $D8AE
    .byte $04 ; |     X  | $D8AF
    .byte $04 ; |     X  | $D8B0
    .byte $00 ; |        | $D8B1
    .byte $00 ; |        | $D8B2
    .byte $04 ; |     X  | $D8B3
    .byte $04 ; |     X  | $D8B4
    .byte $02 ; |      X | $D8B5
    .byte $02 ; |      X | $D8B6
    .byte $06 ; |     XX | $D8B7
    .byte $06 ; |     XX | $D8B8
    .byte $02 ; |      X | $D8B9
    .byte $02 ; |      X | $D8BA
LD8BB:
    .byte $06 ; |     XX | $D8BB
    .byte $06 ; |     XX | $D8BC
    .byte $FF ; |XXXXXXXX| $D8BD
    .byte $FF ; |XXXXXXXX| $D8BE
    .byte $00 ; |        | $D8BF
    .byte $00 ; |        | $D8C0
    .byte $FF ; |XXXXXXXX| $D8C1
    .byte $FF ; |XXXXXXXX| $D8C2
    .byte $00 ; |        | $D8C3
    .byte $00 ; |        | $D8C4
    .byte $00 ; |        | $D8C5
    .byte $00 ; |        | $D8C6
    .byte $00 ; |        | $D8C7
    .byte $C0 ; |XX      | $D8C8
    .byte $C0 ; |XX      | $D8C9
    .byte $00 ; |        | $D8CA
    .byte $00 ; |        | $D8CB
    .byte $C0 ; |XX      | $D8CC
    .byte $C0 ; |XX      | $D8CD
    .byte $00 ; |        | $D8CE
    .byte $00 ; |        | $D8CF
    .byte $FF ; |XXXXXXXX| $D8D0
    .byte $FF ; |XXXXXXXX| $D8D1
    .byte $FF ; |XXXXXXXX| $D8D2
LD8D3:
    .byte $FF ; |XXXXXXXX| $D8D3
    .byte $FF ; |XXXXXXXX| $D8D4
    .byte $FF ; |XXXXXXXX| $D8D5
    .byte $FF ; |XXXXXXXX| $D8D6
    .byte $FF ; |XXXXXXXX| $D8D7
    .byte $FF ; |XXXXXXXX| $D8D8
    .byte $FF ; |XXXXXXXX| $D8D9
    .byte $FF ; |XXXXXXXX| $D8DA
    .byte $FF ; |XXXXXXXX| $D8DB
    .byte $FF ; |XXXXXXXX| $D8DC
    .byte $FF ; |XXXXXXXX| $D8DD
    .byte $7E ; | XXXXXX | $D8DE
    .byte $00 ; |        | $D8DF
    .byte $00 ; |        | $D8E0
    .byte $00 ; |        | $D8E1
    .byte $00 ; |        | $D8E2
    .byte $00 ; |        | $D8E3
    .byte $00 ; |        | $D8E4
    .byte $00 ; |        | $D8E5
    .byte $00 ; |        | $D8E6
    .byte $00 ; |        | $D8E7
    .byte $00 ; |        | $D8E8
    .byte $00 ; |        | $D8E9
    .byte $00 ; |        | $D8EA
    .byte $00 ; |        | $D8EB
    .byte $00 ; |        | $D8EC
    .byte $00 ; |        | $D8ED
    .byte $00 ; |        | $D8EE
    .byte $00 ; |        | $D8EF
    .byte $00 ; |        | $D8F0
    .byte $00 ; |        | $D8F1
    .byte $00 ; |        | $D8F2
    .byte $00 ; |        | $D8F3
    .byte $00 ; |        | $D8F4
    .byte $00 ; |        | $D8F5
    .byte $00 ; |        | $D8F6
    .byte $00 ; |        | $D8F7
    .byte $00 ; |        | $D8F8
    .byte $00 ; |        | $D8F9
    .byte $00 ; |        | $D8FA
    .byte $00 ; |        | $D8FB
    .byte $00 ; |        | $D8FC
    .byte $00 ; |        | $D8FD
    .byte $00 ; |        | $D8FE
    .byte $00 ; |        | $D8FF
LD900:
    .byte $82 ; |X     X | $D900
    .byte $82 ; |X     X | $D901
    .byte $82 ; |X     X | $D902
    .byte $82 ; |X     X | $D903
LD904:
    .byte $82 ; |X     X | $D904
    .byte $82 ; |X     X | $D905
    .byte $82 ; |X     X | $D906
    .byte $82 ; |X     X | $D907
    .byte $82 ; |X     X | $D908
    .byte $82 ; |X     X | $D909
    .byte $82 ; |X     X | $D90A
    .byte $10 ; |   X    | $D90B
    .byte $12 ; |   X  X | $D90C
    .byte $14 ; |   X X  | $D90D
LD90E:
    .byte $16 ; |   X XX | $D90E
    .byte $18 ; |   XX   | $D90F
    .byte $1A ; |   XX X | $D910
    .byte $1A ; |   XX X | $D911
    .byte $18 ; |   XX   | $D912
    .byte $16 ; |   X XX | $D913
    .byte $14 ; |   X X  | $D914
    .byte $12 ; |   X  X | $D915
    .byte $10 ; |   X    | $D916
    .byte $82 ; |X     X | $D917
    .byte $82 ; |X     X | $D918
    .byte $82 ; |X     X | $D919
    .byte $82 ; |X     X | $D91A
    .byte $16 ; |   X XX | $D91B
    .byte $18 ; |   XX   | $D91C
    .byte $1A ; |   XX X | $D91D
    .byte $1C ; |   XXX  | $D91E
    .byte $1E ; |   XXXX | $D91F
    .byte $1E ; |   XXXX | $D920
    .byte $1E ; |   XXXX | $D921
    .byte $1E ; |   XXXX | $D922
    .byte $1C ; |   XXX  | $D923
    .byte $1A ; |   XX X | $D924
    .byte $18 ; |   XX   | $D925
    .byte $16 ; |   X XX | $D926
    .byte $82 ; |X     X | $D927
    .byte $82 ; |X     X | $D928
    .byte $82 ; |X     X | $D929
    .byte $82 ; |X     X | $D92A
    .byte $C0 ; |XX      | $D92B
    .byte $C2 ; |XX    X | $D92C
    .byte $C4 ; |XX   X  | $D92D
    .byte $C6 ; |XX   XX | $D92E
    .byte $C8 ; |XX  X   | $D92F
    .byte $CA ; |XX  X X | $D930
    .byte $CA ; |XX  X X | $D931
    .byte $C8 ; |XX  X   | $D932
    .byte $C6 ; |XX   XX | $D933
    .byte $C4 ; |XX   X  | $D934
    .byte $C2 ; |XX    X | $D935
    .byte $C0 ; |XX      | $D936
    .byte $82 ; |X     X | $D937
    .byte $82 ; |X     X | $D938
    .byte $82 ; |X     X | $D939
    .byte $82 ; |X     X | $D93A
    .byte $10 ; |   X    | $D93B
    .byte $12 ; |   X  X | $D93C
    .byte $14 ; |   X X  | $D93D
    .byte $16 ; |   X XX | $D93E
    .byte $18 ; |   XX   | $D93F
    .byte $1A ; |   XX X | $D940
    .byte $1A ; |   XX X | $D941
    .byte $18 ; |   XX   | $D942
    .byte $16 ; |   X XX | $D943
    .byte $14 ; |   X X  | $D944
    .byte $12 ; |   X  X | $D945
    .byte $10 ; |   X    | $D946
    .byte $82 ; |X     X | $D947
    .byte $82 ; |X     X | $D948
    .byte $82 ; |X     X | $D949
    .byte $82 ; |X     X | $D94A
    .byte $30 ; |  XX    | $D94B
    .byte $32 ; |  XX  X | $D94C
    .byte $34 ; |  XX X  | $D94D
    .byte $36 ; |  XX XX | $D94E
    .byte $38 ; |  XXX   | $D94F
    .byte $3A ; |  XXX X | $D950
    .byte $3A ; |  XXX X | $D951
    .byte $38 ; |  XXX   | $D952
    .byte $36 ; |  XX XX | $D953
    .byte $34 ; |  XX X  | $D954
    .byte $32 ; |  XX  X | $D955
    .byte $30 ; |  XX    | $D956
    .byte $82 ; |X     X | $D957
    .byte $82 ; |X     X | $D958
    .byte $82 ; |X     X | $D959
    .byte $82 ; |X     X | $D95A
    .byte $82 ; |X     X | $D95B
    .byte $82 ; |X     X | $D95C
    .byte $82 ; |X     X | $D95D
    .byte $82 ; |X     X | $D95E
    .byte $82 ; |X     X | $D95F
    .byte $00 ; |        | $D960
    .byte $00 ; |        | $D961
    .byte $80 ; |X       | $D962
    .byte $80 ; |X       | $D963
    .byte $80 ; |X       | $D964
    .byte $04 ; |     X  | $D965
    .byte $02 ; |      X | $D966
    .byte $02 ; |      X | $D967
    .byte $04 ; |     X  | $D968
    .byte $04 ; |     X  | $D969
    .byte $02 ; |      X | $D96A
    .byte $02 ; |      X | $D96B
    .byte $04 ; |     X  | $D96C
    .byte $04 ; |     X  | $D96D
    .byte $02 ; |      X | $D96E
    .byte $02 ; |      X | $D96F
    .byte $04 ; |     X  | $D970
    .byte $04 ; |     X  | $D971
    .byte $02 ; |      X | $D972
    .byte $CA ; |XX  X X | $D973
    .byte $CA ; |XX  X X | $D974
    .byte $CA ; |XX  X X | $D975
    .byte $CA ; |XX  X X | $D976
    .byte $CE ; |XX  XXX | $D977
    .byte $CA ; |XX  X X | $D978
    .byte $CA ; |XX  X X | $D979
    .byte $CA ; |XX  X X | $D97A
    .byte $C8 ; |XX  X   | $D97B
    .byte $C6 ; |XX   XX | $D97C
    .byte $C4 ; |XX   X  | $D97D
    .byte $4A ; | X  X X | $D97E
    .byte $4A ; | X  X X | $D97F
    .byte $4A ; | X  X X | $D980
    .byte $4A ; | X  X X | $D981
    .byte $4E ; | X  XXX | $D982
    .byte $4A ; | X  X X | $D983
    .byte $4A ; | X  X X | $D984
    .byte $4A ; | X  X X | $D985
    .byte $48 ; | X  X   | $D986
    .byte $46 ; | X   XX | $D987
    .byte $44 ; | X   X  | $D988
    .byte $8A ; |X   X X | $D989
    .byte $8A ; |X   X X | $D98A
    .byte $8A ; |X   X X | $D98B
    .byte $8A ; |X   X X | $D98C
    .byte $8E ; |X   XXX | $D98D
    .byte $8A ; |X   X X | $D98E
    .byte $8A ; |X   X X | $D98F
    .byte $8A ; |X   X X | $D990
    .byte $88 ; |X   X   | $D991
    .byte $86 ; |X    XX | $D992
    .byte $84 ; |X    X  | $D993
    .byte $00 ; |        | $D994
    .byte $00 ; |        | $D995
    .byte $00 ; |        | $D996
    .byte $00 ; |        | $D997
    .byte $00 ; |        | $D998
    .byte $00 ; |        | $D999
    .byte $00 ; |        | $D99A
    .byte $00 ; |        | $D99B
    .byte $00 ; |        | $D99C
    .byte $00 ; |        | $D99D
    .byte $00 ; |        | $D99E
    .byte $00 ; |        | $D99F
    .byte $00 ; |        | $D9A0
    .byte $00 ; |        | $D9A1
    .byte $00 ; |        | $D9A2
    .byte $00 ; |        | $D9A3
    .byte $00 ; |        | $D9A4
    .byte $00 ; |        | $D9A5
    .byte $00 ; |        | $D9A6
    .byte $00 ; |        | $D9A7
    .byte $00 ; |        | $D9A8
    .byte $00 ; |        | $D9A9
    .byte $00 ; |        | $D9AA
    .byte $00 ; |        | $D9AB
    .byte $00 ; |        | $D9AC
    .byte $00 ; |        | $D9AD
    .byte $00 ; |        | $D9AE
    .byte $00 ; |        | $D9AF
    .byte $00 ; |        | $D9B0
    .byte $00 ; |        | $D9B1
    .byte $00 ; |        | $D9B2
    .byte $00 ; |        | $D9B3
    .byte $00 ; |        | $D9B4
    .byte $00 ; |        | $D9B5
    .byte $00 ; |        | $D9B6
    .byte $00 ; |        | $D9B7
    .byte $00 ; |        | $D9B8
    .byte $00 ; |        | $D9B9
    .byte $00 ; |        | $D9BA
    .byte $00 ; |        | $D9BB
    .byte $00 ; |        | $D9BC
    .byte $00 ; |        | $D9BD
    .byte $00 ; |        | $D9BE
    .byte $00 ; |        | $D9BF
    .byte $00 ; |        | $D9C0
    .byte $00 ; |        | $D9C1
    .byte $00 ; |        | $D9C2
    .byte $00 ; |        | $D9C3
    .byte $00 ; |        | $D9C4
    .byte $00 ; |        | $D9C5
    .byte $00 ; |        | $D9C6
    .byte $00 ; |        | $D9C7
    .byte $00 ; |        | $D9C8
    .byte $00 ; |        | $D9C9
    .byte $00 ; |        | $D9CA
    .byte $00 ; |        | $D9CB
    .byte $00 ; |        | $D9CC
    .byte $00 ; |        | $D9CD
    .byte $00 ; |        | $D9CE
    .byte $00 ; |        | $D9CF
    .byte $00 ; |        | $D9D0
    .byte $00 ; |        | $D9D1
    .byte $00 ; |        | $D9D2
    .byte $00 ; |        | $D9D3
    .byte $00 ; |        | $D9D4
    .byte $00 ; |        | $D9D5
    .byte $00 ; |        | $D9D6
    .byte $00 ; |        | $D9D7
    .byte $00 ; |        | $D9D8
    .byte $00 ; |        | $D9D9
    .byte $00 ; |        | $D9DA
    .byte $00 ; |        | $D9DB
    .byte $00 ; |        | $D9DC
    .byte $00 ; |        | $D9DD
    .byte $00 ; |        | $D9DE
    .byte $00 ; |        | $D9DF
    .byte $00 ; |        | $D9E0
    .byte $00 ; |        | $D9E1
    .byte $00 ; |        | $D9E2
    .byte $00 ; |        | $D9E3
    .byte $00 ; |        | $D9E4
    .byte $00 ; |        | $D9E5
    .byte $00 ; |        | $D9E6
    .byte $00 ; |        | $D9E7
    .byte $00 ; |        | $D9E8
    .byte $00 ; |        | $D9E9
    .byte $00 ; |        | $D9EA
    .byte $00 ; |        | $D9EB
    .byte $00 ; |        | $D9EC
    .byte $00 ; |        | $D9ED
    .byte $00 ; |        | $D9EE
    .byte $00 ; |        | $D9EF
    .byte $00 ; |        | $D9F0
    .byte $00 ; |        | $D9F1
    .byte $00 ; |        | $D9F2
    .byte $00 ; |        | $D9F3
    .byte $00 ; |        | $D9F4
    .byte $00 ; |        | $D9F5
    .byte $00 ; |        | $D9F6
    .byte $00 ; |        | $D9F7
    .byte $00 ; |        | $D9F8
    .byte $00 ; |        | $D9F9
    .byte $00 ; |        | $D9FA
    .byte $00 ; |        | $D9FB
    .byte $00 ; |        | $D9FC
    .byte $00 ; |        | $D9FD
    .byte $00 ; |        | $D9FE
    .byte $00 ; |        | $D9FF
LDA00:
    .byte $00 ; |        | $DA00
    .byte $02 ; |      X | $DA01
    .byte $1A ; |   XX X | $DA02
    .byte $1A ; |   XX X | $DA03
    .byte $1A ; |   XX X | $DA04
    .byte $14 ; |   X X  | $DA05
    .byte $14 ; |   X X  | $DA06
    .byte $02 ; |      X | $DA07
    .byte $02 ; |      X | $DA08
    .byte $02 ; |      X | $DA09
    .byte $02 ; |      X | $DA0A
    .byte $02 ; |      X | $DA0B
    .byte $02 ; |      X | $DA0C
    .byte $02 ; |      X | $DA0D
    .byte $02 ; |      X | $DA0E
    .byte $02 ; |      X | $DA0F
    .byte $04 ; |     X  | $DA10
    .byte $00 ; |        | $DA11
    .byte $02 ; |      X | $DA12
    .byte $1A ; |   XX X | $DA13
    .byte $1A ; |   XX X | $DA14
    .byte $1A ; |   XX X | $DA15
    .byte $14 ; |   X X  | $DA16
    .byte $14 ; |   X X  | $DA17
    .byte $1A ; |   XX X | $DA18
    .byte $02 ; |      X | $DA19
    .byte $02 ; |      X | $DA1A
    .byte $02 ; |      X | $DA1B
    .byte $02 ; |      X | $DA1C
    .byte $02 ; |      X | $DA1D
    .byte $00 ; |        | $DA1E
    .byte $02 ; |      X | $DA1F
    .byte $1A ; |   XX X | $DA20
    .byte $1A ; |   XX X | $DA21
    .byte $1A ; |   XX X | $DA22
    .byte $14 ; |   X X  | $DA23
    .byte $14 ; |   X X  | $DA24
    .byte $C6 ; |XX   XX | $DA25
    .byte $C6 ; |XX   XX | $DA26
    .byte $02 ; |      X | $DA27
    .byte $02 ; |      X | $DA28
    .byte $02 ; |      X | $DA29
    .byte $02 ; |      X | $DA2A
    .byte $00 ; |        | $DA2B
    .byte $02 ; |      X | $DA2C
    .byte $1A ; |   XX X | $DA2D
    .byte $1A ; |   XX X | $DA2E
    .byte $1A ; |   XX X | $DA2F
    .byte $14 ; |   X X  | $DA30
    .byte $14 ; |   X X  | $DA31
    .byte $1A ; |   XX X | $DA32
    .byte $C6 ; |XX   XX | $DA33
    .byte $C6 ; |XX   XX | $DA34
    .byte $02 ; |      X | $DA35
    .byte $02 ; |      X | $DA36
    .byte $02 ; |      X | $DA37
    .byte $00 ; |        | $DA38
    .byte $02 ; |      X | $DA39
    .byte $1A ; |   XX X | $DA3A
    .byte $1A ; |   XX X | $DA3B
    .byte $1A ; |   XX X | $DA3C
    .byte $14 ; |   X X  | $DA3D
    .byte $14 ; |   X X  | $DA3E
    .byte $0E ; |    XXX | $DA3F
    .byte $02 ; |      X | $DA40
    .byte $02 ; |      X | $DA41
    .byte $02 ; |      X | $DA42
    .byte $02 ; |      X | $DA43
    .byte $02 ; |      X | $DA44
    .byte $00 ; |        | $DA45
    .byte $02 ; |      X | $DA46
    .byte $1A ; |   XX X | $DA47
    .byte $1A ; |   XX X | $DA48
    .byte $1A ; |   XX X | $DA49
    .byte $14 ; |   X X  | $DA4A
    .byte $14 ; |   X X  | $DA4B
    .byte $0E ; |    XXX | $DA4C
    .byte $1A ; |   XX X | $DA4D
    .byte $02 ; |      X | $DA4E
    .byte $02 ; |      X | $DA4F
    .byte $02 ; |      X | $DA50
    .byte $02 ; |      X | $DA51
    .byte $00 ; |        | $DA52
    .byte $02 ; |      X | $DA53
    .byte $1A ; |   XX X | $DA54
    .byte $1A ; |   XX X | $DA55
    .byte $1A ; |   XX X | $DA56
    .byte $14 ; |   X X  | $DA57
    .byte $14 ; |   X X  | $DA58
    .byte $0E ; |    XXX | $DA59
    .byte $C6 ; |XX   XX | $DA5A
    .byte $C6 ; |XX   XX | $DA5B
    .byte $02 ; |      X | $DA5C
    .byte $02 ; |      X | $DA5D
    .byte $02 ; |      X | $DA5E
    .byte $00 ; |        | $DA5F
    .byte $02 ; |      X | $DA60
    .byte $1A ; |   XX X | $DA61
    .byte $1A ; |   XX X | $DA62
    .byte $1A ; |   XX X | $DA63
    .byte $14 ; |   X X  | $DA64
    .byte $14 ; |   X X  | $DA65
    .byte $0E ; |    XXX | $DA66
    .byte $C6 ; |XX   XX | $DA67
    .byte $C6 ; |XX   XX | $DA68
    .byte $1A ; |   XX X | $DA69
    .byte $02 ; |      X | $DA6A
    .byte $02 ; |      X | $DA6B
    .byte $00 ; |        | $DA6C
    .byte $02 ; |      X | $DA6D
    .byte $1A ; |   XX X | $DA6E
    .byte $1A ; |   XX X | $DA6F
    .byte $1A ; |   XX X | $DA70
    .byte $14 ; |   X X  | $DA71
    .byte $14 ; |   X X  | $DA72
    .byte $34 ; |  XX X  | $DA73
    .byte $34 ; |  XX X  | $DA74
    .byte $02 ; |      X | $DA75
    .byte $02 ; |      X | $DA76
    .byte $02 ; |      X | $DA77
    .byte $02 ; |      X | $DA78
    .byte $07 ; |     XXX| $DA79
    .byte $07 ; |     XXX| $DA7A
    .byte $0D ; |    XX X| $DA7B
    .byte $0D ; |    XX X| $DA7C
    .byte $0D ; |    XX X| $DA7D
    .byte $0D ; |    XX X| $DA7E
    .byte $0D ; |    XX X| $DA7F
    .byte $0D ; |    XX X| $DA80
    .byte $0D ; |    XX X| $DA81
    .byte $0B ; |    X XX| $DA82
    .byte $09 ; |    X  X| $DA83
    .byte $2B ; |  X X XX| $DA84
    .byte $2B ; |  X X XX| $DA85
    .byte $2B ; |  X X XX| $DA86
    .byte $2B ; |  X X XX| $DA87
    .byte $2B ; |  X X XX| $DA88
    .byte $15 ; |   X X X| $DA89
    .byte $0D ; |    XX X| $DA8A
    .byte $0D ; |    XX X| $DA8B
    .byte $0D ; |    XX X| $DA8C
    .byte $0D ; |    XX X| $DA8D
    .byte $0D ; |    XX X| $DA8E
    .byte $0D ; |    XX X| $DA8F
    .byte $0D ; |    XX X| $DA90
    .byte $00 ; |        | $DA91
    .byte $02 ; |      X | $DA92
    .byte $1A ; |   XX X | $DA93
    .byte $1A ; |   XX X | $DA94
    .byte $1A ; |   XX X | $DA95
    .byte $14 ; |   X X  | $DA96
    .byte $14 ; |   X X  | $DA97
    .byte $1A ; |   XX X | $DA98
    .byte $34 ; |  XX X  | $DA99
    .byte $34 ; |  XX X  | $DA9A
    .byte $02 ; |      X | $DA9B
    .byte $02 ; |      X | $DA9C
    .byte $02 ; |      X | $DA9D
    .byte $00 ; |        | $DA9E
    .byte $02 ; |      X | $DA9F
    .byte $1A ; |   XX X | $DAA0
    .byte $1A ; |   XX X | $DAA1
    .byte $1A ; |   XX X | $DAA2
    .byte $14 ; |   X X  | $DAA3
    .byte $14 ; |   X X  | $DAA4
    .byte $C6 ; |XX   XX | $DAA5
    .byte $C6 ; |XX   XX | $DAA6
    .byte $34 ; |  XX X  | $DAA7
    .byte $34 ; |  XX X  | $DAA8
    .byte $02 ; |      X | $DAA9
    .byte $02 ; |      X | $DAAA
    .byte $00 ; |        | $DAAB
    .byte $02 ; |      X | $DAAC
    .byte $1A ; |   XX X | $DAAD
    .byte $1A ; |   XX X | $DAAE
    .byte $1A ; |   XX X | $DAAF
    .byte $14 ; |   X X  | $DAB0
    .byte $14 ; |   X X  | $DAB1
    .byte $C6 ; |XX   XX | $DAB2
    .byte $C6 ; |XX   XX | $DAB3
    .byte $1A ; |   XX X | $DAB4
    .byte $34 ; |  XX X  | $DAB5
    .byte $34 ; |  XX X  | $DAB6
    .byte $02 ; |      X | $DAB7
    .byte $00 ; |        | $DAB8
    .byte $02 ; |      X | $DAB9
    .byte $1A ; |   XX X | $DABA
    .byte $1A ; |   XX X | $DABB
    .byte $1A ; |   XX X | $DABC
    .byte $14 ; |   X X  | $DABD
    .byte $14 ; |   X X  | $DABE
    .byte $0E ; |    XXX | $DABF
    .byte $34 ; |  XX X  | $DAC0
    .byte $34 ; |  XX X  | $DAC1
    .byte $02 ; |      X | $DAC2
    .byte $02 ; |      X | $DAC3
    .byte $02 ; |      X | $DAC4
    .byte $00 ; |        | $DAC5
    .byte $02 ; |      X | $DAC6
    .byte $1A ; |   XX X | $DAC7
    .byte $1A ; |   XX X | $DAC8
    .byte $1A ; |   XX X | $DAC9
    .byte $14 ; |   X X  | $DACA
    .byte $14 ; |   X X  | $DACB
    .byte $0E ; |    XXX | $DACC
    .byte $34 ; |  XX X  | $DACD
LDACE:
    .byte $34 ; |  XX X  | $DACE
    .byte $1A ; |   XX X | $DACF
    .byte $02 ; |      X | $DAD0
    .byte $02 ; |      X | $DAD1
    .byte $00 ; |        | $DAD2
    .byte $02 ; |      X | $DAD3
    .byte $1A ; |   XX X | $DAD4
    .byte $1A ; |   XX X | $DAD5
    .byte $1A ; |   XX X | $DAD6
    .byte $14 ; |   X X  | $DAD7
    .byte $14 ; |   X X  | $DAD8
    .byte $C6 ; |XX   XX | $DAD9
    .byte $C6 ; |XX   XX | $DADA
    .byte $0E ; |    XXX | $DADB
    .byte $34 ; |  XX X  | $DADC
    .byte $34 ; |  XX X  | $DADD
    .byte $02 ; |      X | $DADE
    .byte $00 ; |        | $DADF
    .byte $02 ; |      X | $DAE0
    .byte $1A ; |   XX X | $DAE1
    .byte $1A ; |   XX X | $DAE2
    .byte $1A ; |   XX X | $DAE3
    .byte $14 ; |   X X  | $DAE4
    .byte $14 ; |   X X  | $DAE5
    .byte $1A ; |   XX X | $DAE6
    .byte $C6 ; |XX   XX | $DAE7
    .byte $C6 ; |XX   XX | $DAE8
    .byte $0E ; |    XXX | $DAE9
    .byte $34 ; |  XX X  | $DAEA
    .byte $34 ; |  XX X  | $DAEB
    .byte $00 ; |        | $DAEC
    .byte $02 ; |      X | $DAED
    .byte $02 ; |      X | $DAEE
    .byte $02 ; |      X | $DAEF
    .byte $02 ; |      X | $DAF0
    .byte $02 ; |      X | $DAF1
    .byte $02 ; |      X | $DAF2
    .byte $02 ; |      X | $DAF3
    .byte $02 ; |      X | $DAF4
    .byte $02 ; |      X | $DAF5
    .byte $02 ; |      X | $DAF6
    .byte $02 ; |      X | $DAF7
    .byte $02 ; |      X | $DAF8
    .byte $02 ; |      X | $DAF9
    .byte $02 ; |      X | $DAFA
    .byte $02 ; |      X | $DAFB
    .byte $04 ; |     X  | $DAFC
    .byte $00 ; |        | $DAFD
LDAFE:
    .byte $00 ; |        | $DAFE
    .byte $00 ; |        | $DAFF
    .byte $1F ; |   XXXXX| $DB00
    .byte $0F ; |    XXXX| $DB01
    .byte $1F ; |   XXXXX| $DB02
    .byte $1F ; |   XXXXX| $DB03
    .byte $2F ; |  X XXXX| $DB04
    .byte $1F ; |   XXXXX| $DB05
    .byte $00 ; |        | $DB06
    .byte $00 ; |        | $DB07
    .byte $86 ; |X    XX | $DB08
    .byte $86 ; |X    XX | $DB09
    .byte $1A ; |   XX X | $DB0A
    .byte $1A ; |   XX X | $DB0B
    .byte $1A ; |   XX X | $DB0C
    .byte $86 ; |X    XX | $DB0D
    .byte $1A ; |   XX X | $DB0E
    .byte $1A ; |   XX X | $DB0F
    .byte $1A ; |   XX X | $DB10
    .byte $86 ; |X    XX | $DB11
    .byte $1A ; |   XX X | $DB12
    .byte $80 ; |X       | $DB13
    .byte $80 ; |X       | $DB14
    .byte $80 ; |X       | $DB15
    .byte $82 ; |X     X | $DB16
    .byte $82 ; |X     X | $DB17
    .byte $02 ; |      X | $DB18
    .byte $47 ; | X   XXX| $DB19
    .byte $6E ; | XX XXX | $DB1A
    .byte $7C ; | XXXXX  | $DB1B
    .byte $78 ; | XXXX   | $DB1C
    .byte $7C ; | XXXXX  | $DB1D
    .byte $7E ; | XXXXXX | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $00 ; |        | $DB22
    .byte $00 ; |        | $DB23
    .byte $00 ; |        | $DB24
    .byte $00 ; |        | $DB25
    .byte $00 ; |        | $DB26
    .byte $00 ; |        | $DB27
    .byte $00 ; |        | $DB28
    .byte $00 ; |        | $DB29
    .byte $00 ; |        | $DB2A
    .byte $00 ; |        | $DB2B
    .byte $00 ; |        | $DB2C
    .byte $00 ; |        | $DB2D
    .byte $00 ; |        | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $00 ; |        | $DB30
    .byte $00 ; |        | $DB31
    .byte $00 ; |        | $DB32
    .byte $00 ; |        | $DB33
    .byte $00 ; |        | $DB34
    .byte $00 ; |        | $DB35
    .byte $00 ; |        | $DB36
    .byte $00 ; |        | $DB37
    .byte $00 ; |        | $DB38
    .byte $00 ; |        | $DB39
    .byte $00 ; |        | $DB3A
    .byte $00 ; |        | $DB3B
    .byte $00 ; |        | $DB3C
    .byte $00 ; |        | $DB3D
    .byte $00 ; |        | $DB3E
    .byte $00 ; |        | $DB3F
    .byte $00 ; |        | $DB40
    .byte $00 ; |        | $DB41
    .byte $00 ; |        | $DB42
    .byte $00 ; |        | $DB43
    .byte $00 ; |        | $DB44
    .byte $00 ; |        | $DB45
    .byte $00 ; |        | $DB46
    .byte $00 ; |        | $DB47
    .byte $00 ; |        | $DB48
    .byte $00 ; |        | $DB49
    .byte $00 ; |        | $DB4A
    .byte $00 ; |        | $DB4B
    .byte $00 ; |        | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $00 ; |        | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $00 ; |        | $DB69
    .byte $00 ; |        | $DB6A
    .byte $00 ; |        | $DB6B
    .byte $00 ; |        | $DB6C
    .byte $00 ; |        | $DB6D
    .byte $00 ; |        | $DB6E
    .byte $FF ; |XXXXXXXX| $DB6F
    .byte $FF ; |XXXXXXXX| $DB70
    .byte $FF ; |XXXXXXXX| $DB71
    .byte $7E ; | XXXXXX | $DB72
    .byte $00 ; |        | $DB73
    .byte $00 ; |        | $DB74
    .byte $00 ; |        | $DB75
    .byte $00 ; |        | $DB76
    .byte $00 ; |        | $DB77
    .byte $00 ; |        | $DB78
    .byte $00 ; |        | $DB79
    .byte $00 ; |        | $DB7A
    .byte $00 ; |        | $DB7B
    .byte $00 ; |        | $DB7C
    .byte $00 ; |        | $DB7D
    .byte $00 ; |        | $DB7E
    .byte $00 ; |        | $DB7F
    .byte $00 ; |        | $DB80
    .byte $00 ; |        | $DB81
    .byte $00 ; |        | $DB82
    .byte $00 ; |        | $DB83
    .byte $00 ; |        | $DB84
    .byte $00 ; |        | $DB85
    .byte $00 ; |        | $DB86
    .byte $00 ; |        | $DB87
    .byte $00 ; |        | $DB88
LDB89:
    .byte $7C ; | XXXXX  | $DB89
    .byte $FE ; |XXXXXXX | $DB8A
    .byte $FE ; |XXXXXXX | $DB8B
    .byte $FE ; |XXXXXXX | $DB8C
    .byte $FE ; |XXXXXXX | $DB8D
    .byte $FE ; |XXXXXXX | $DB8E
    .byte $6C ; | XX XX  | $DB8F
    .byte $38 ; |  XXX   | $DB90
    .byte $7C ; | XXXXX  | $DB91
LDB92:
    .byte $28 ; |  X X   | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $00 ; |        | $DB9B
    .byte $00 ; |        | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $00 ; |        | $DBA3
    .byte $00 ; |        | $DBA4
    .byte $00 ; |        | $DBA5
LDBA6:
    .byte $38 ; |  XXX   | $DBA6
    .byte $7C ; | XXXXX  | $DBA7
    .byte $7C ; | XXXXX  | $DBA8
    .byte $7C ; | XXXXX  | $DBA9
    .byte $7C ; | XXXXX  | $DBAA
    .byte $7C ; | XXXXX  | $DBAB
    .byte $38 ; |  XXX   | $DBAC
    .byte $10 ; |   X    | $DBAD
    .byte $30 ; |  XX    | $DBAE
    .byte $60 ; | XX     | $DBAF
    .byte $00 ; |        | $DBB0
    .byte $00 ; |        | $DBB1
    .byte $00 ; |        | $DBB2
    .byte $00 ; |        | $DBB3
    .byte $00 ; |        | $DBB4
    .byte $00 ; |        | $DBB5
    .byte $00 ; |        | $DBB6
    .byte $00 ; |        | $DBB7
    .byte $00 ; |        | $DBB8
    .byte $00 ; |        | $DBB9
    .byte $00 ; |        | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $00 ; |        | $DBC1
LDBC2:
    .byte $38 ; |  XXX   | $DBC2
    .byte $5C ; | X XXX  | $DBC3
    .byte $6A ; | XX X X | $DBC4
    .byte $E6 ; |XXX  XX | $DBC5
    .byte $D6 ; |XX X XX | $DBC6
    .byte $D6 ; |XX X XX | $DBC7
    .byte $B8 ; |X XXX   | $DBC8
    .byte $BE ; |X XXXXX | $DBC9
    .byte $7C ; | XXXXX  | $DBCA
    .byte $38 ; |  XXX   | $DBCB
    .byte $00 ; |        | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $00 ; |        | $DBD0
    .byte $00 ; |        | $DBD1
    .byte $00 ; |        | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $00 ; |        | $DBD4
    .byte $00 ; |        | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $00 ; |        | $DBDA
    .byte $00 ; |        | $DBDB
    .byte $00 ; |        | $DBDC
    .byte $00 ; |        | $DBDD
    .byte $00 ; |        | $DBDE
    .byte $FE ; |XXXXXXX | $DBDF
    .byte $FE ; |XXXXXXX | $DBE0
    .byte $FE ; |XXXXXXX | $DBE1
    .byte $FE ; |XXXXXXX | $DBE2
    .byte $FE ; |XXXXXXX | $DBE3
    .byte $FE ; |XXXXXXX | $DBE4
    .byte $FE ; |XXXXXXX | $DBE5
    .byte $FE ; |XXXXXXX | $DBE6
    .byte $FE ; |XXXXXXX | $DBE7
    .byte $FE ; |XXXXXXX | $DBE8
    .byte $00 ; |        | $DBE9
    .byte $00 ; |        | $DBEA
    .byte $00 ; |        | $DBEB
    .byte $00 ; |        | $DBEC
    .byte $00 ; |        | $DBED
    .byte $00 ; |        | $DBEE
    .byte $00 ; |        | $DBEF
    .byte $00 ; |        | $DBF0
    .byte $00 ; |        | $DBF1
    .byte $00 ; |        | $DBF2
    .byte $00 ; |        | $DBF3
    .byte $00 ; |        | $DBF4
    .byte $00 ; |        | $DBF5
    .byte $00 ; |        | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $00 ; |        | $DBF9
    .byte $00 ; |        | $DBFA
    .byte $00 ; |        | $DBFB
    .byte $00 ; |        | $DBFC
    .byte $00 ; |        | $DBFD
    .byte $00 ; |        | $DBFE
    .byte $00 ; |        | $DBFF
    .byte $01 ; |       X| $DC00
    .byte $43 ; | X    XX| $DC01
    .byte $7F ; | XXXXXXX| $DC02
    .byte $78 ; | XXXX   | $DC03
    .byte $4B ; | X  X XX| $DC04
    .byte $33 ; |  XX  XX| $DC05
    .byte $6B ; | XX X XX| $DC06
    .byte $7B ; | XXXX XX| $DC07
    .byte $79 ; | XXXX  X| $DC08
    .byte $76 ; | XXX XX | $DC09
    .byte $6C ; | XX XX  | $DC0A
    .byte $1E ; |   XXXX | $DC0B
    .byte $3C ; |  XXXX  | $DC0C
    .byte $6D ; | XX XX X| $DC0D
    .byte $5B ; | X XX XX| $DC0E
    .byte $5A ; | X XX X | $DC0F
    .byte $7E ; | XXXXXX | $DC10
    .byte $3C ; |  XXXX  | $DC11
    .byte $3C ; |  XXXX  | $DC12
    .byte $3C ; |  XXXX  | $DC13
    .byte $7E ; | XXXXXX | $DC14
    .byte $7E ; | XXXXXX | $DC15
    .byte $7E ; | XXXXXX | $DC16
    .byte $24 ; |  X  X  | $DC17
    .byte $0E ; |    XXX | $DC18
    .byte $2C ; |  X XX  | $DC19
    .byte $7F ; | XXXXXXX| $DC1A
    .byte $78 ; | XXXX   | $DC1B
    .byte $4B ; | X  X XX| $DC1C
    .byte $33 ; |  XX  XX| $DC1D
    .byte $6B ; | XX X XX| $DC1E
    .byte $7B ; | XXXX XX| $DC1F
    .byte $79 ; | XXXX  X| $DC20
    .byte $76 ; | XXX XX | $DC21
    .byte $6C ; | XX XX  | $DC22
    .byte $1E ; |   XXXX | $DC23
    .byte $3C ; |  XXXX  | $DC24
    .byte $6D ; | XX XX X| $DC25
    .byte $5B ; | X XX XX| $DC26
    .byte $5A ; | X XX X | $DC27
    .byte $7E ; | XXXXXX | $DC28
    .byte $3C ; |  XXXX  | $DC29
    .byte $3C ; |  XXXX  | $DC2A
    .byte $3C ; |  XXXX  | $DC2B
    .byte $7E ; | XXXXXX | $DC2C
    .byte $7E ; | XXXXXX | $DC2D
    .byte $7E ; | XXXXXX | $DC2E
    .byte $24 ; |  X  X  | $DC2F
    .byte $30 ; |  XX    | $DC30
    .byte $62 ; | XX   X | $DC31
    .byte $7F ; | XXXXXXX| $DC32
    .byte $78 ; | XXXX   | $DC33
    .byte $4B ; | X  X XX| $DC34
    .byte $33 ; |  XX  XX| $DC35
    .byte $6B ; | XX X XX| $DC36
    .byte $7B ; | XXXX XX| $DC37
    .byte $79 ; | XXXX  X| $DC38
    .byte $76 ; | XXX XX | $DC39
    .byte $6C ; | XX XX  | $DC3A
    .byte $1E ; |   XXXX | $DC3B
    .byte $3C ; |  XXXX  | $DC3C
    .byte $6D ; | XX XX X| $DC3D
    .byte $5B ; | X XX XX| $DC3E
    .byte $5A ; | X XX X | $DC3F
    .byte $7E ; | XXXXXX | $DC40
    .byte $3C ; |  XXXX  | $DC41
    .byte $3C ; |  XXXX  | $DC42
    .byte $3C ; |  XXXX  | $DC43
    .byte $7E ; | XXXXXX | $DC44
    .byte $7E ; | XXXXXX | $DC45
    .byte $7E ; | XXXXXX | $DC46
    .byte $24 ; |  X  X  | $DC47
    .byte $80 ; |X       | $DC48
    .byte $C7 ; |XX   XXX| $DC49
    .byte $FF ; |XXXXXXXX| $DC4A
    .byte $78 ; | XXXX   | $DC4B
    .byte $4B ; | X  X XX| $DC4C
    .byte $33 ; |  XX  XX| $DC4D
    .byte $6B ; | XX X XX| $DC4E
    .byte $7B ; | XXXX XX| $DC4F
    .byte $79 ; | XXXX  X| $DC50
    .byte $76 ; | XXX XX | $DC51
    .byte $6C ; | XX XX  | $DC52
    .byte $1E ; |   XXXX | $DC53
    .byte $3C ; |  XXXX  | $DC54
    .byte $6D ; | XX XX X| $DC55
    .byte $5B ; | X XX XX| $DC56
    .byte $5A ; | X XX X | $DC57
    .byte $7E ; | XXXXXX | $DC58
    .byte $3C ; |  XXXX  | $DC59
    .byte $3C ; |  XXXX  | $DC5A
    .byte $3C ; |  XXXX  | $DC5B
    .byte $7E ; | XXXXXX | $DC5C
    .byte $7E ; | XXXXXX | $DC5D
    .byte $7E ; | XXXXXX | $DC5E
    .byte $24 ; |  X  X  | $DC5F
    .byte $00 ; |        | $DC60
    .byte $01 ; |       X| $DC61
    .byte $FF ; |XXXXXXXX| $DC62
    .byte $F8 ; |XXXXX   | $DC63
    .byte $4B ; | X  X XX| $DC64
    .byte $33 ; |  XX  XX| $DC65
    .byte $6B ; | XX X XX| $DC66
    .byte $7B ; | XXXX XX| $DC67
    .byte $79 ; | XXXX  X| $DC68
    .byte $76 ; | XXX XX | $DC69
    .byte $6C ; | XX XX  | $DC6A
    .byte $1E ; |   XXXX | $DC6B
    .byte $3C ; |  XXXX  | $DC6C
    .byte $6D ; | XX XX X| $DC6D
    .byte $5B ; | X XX XX| $DC6E
    .byte $5A ; | X XX X | $DC6F
    .byte $7E ; | XXXXXX | $DC70
    .byte $3C ; |  XXXX  | $DC71
    .byte $3C ; |  XXXX  | $DC72
    .byte $3C ; |  XXXX  | $DC73
    .byte $7E ; | XXXXXX | $DC74
    .byte $7E ; | XXXXXX | $DC75
    .byte $7E ; | XXXXXX | $DC76
    .byte $24 ; |  X  X  | $DC77
    .byte $77 ; | XXX XXX| $DC78
    .byte $66 ; | XX  XX | $DC79
    .byte $7F ; | XXXXXXX| $DC7A
    .byte $78 ; | XXXX   | $DC7B
    .byte $4B ; | X  X XX| $DC7C
    .byte $33 ; |  XX  XX| $DC7D
    .byte $6B ; | XX X XX| $DC7E
    .byte $7B ; | XXXX XX| $DC7F
    .byte $79 ; | XXXX  X| $DC80
    .byte $76 ; | XXX XX | $DC81
    .byte $6C ; | XX XX  | $DC82
    .byte $1E ; |   XXXX | $DC83
    .byte $3C ; |  XXXX  | $DC84
    .byte $6D ; | XX XX X| $DC85
    .byte $5B ; | X XX XX| $DC86
    .byte $5A ; | X XX X | $DC87
    .byte $7E ; | XXXXXX | $DC88
    .byte $3C ; |  XXXX  | $DC89
    .byte $3C ; |  XXXX  | $DC8A
    .byte $3C ; |  XXXX  | $DC8B
    .byte $7E ; | XXXXXX | $DC8C
    .byte $7E ; | XXXXXX | $DC8D
    .byte $7E ; | XXXXXX | $DC8E
    .byte $24 ; |  X  X  | $DC8F
    .byte $30 ; |  XX    | $DC90
    .byte $36 ; |  XX XX | $DC91
    .byte $3E ; |  XXXXX | $DC92
    .byte $22 ; |  X   X | $DC93
    .byte $5D ; | X XXX X| $DC94
    .byte $5D ; | X XXX X| $DC95
    .byte $5D ; | X XXX X| $DC96
    .byte $5D ; | X XXX X| $DC97
    .byte $63 ; | XX   XX| $DC98
    .byte $2A ; |  X X X | $DC99
    .byte $1C ; |   XXX  | $DC9A
    .byte $3E ; |  XXXXX | $DC9B
    .byte $22 ; |  X   X | $DC9C
    .byte $36 ; |  XX XX | $DC9D
    .byte $2A ; |  X X X | $DC9E
    .byte $2A ; |  X X X | $DC9F
    .byte $3E ; |  XXXXX | $DCA0
    .byte $3E ; |  XXXXX | $DCA1
    .byte $3E ; |  XXXXX | $DCA2
    .byte $3E ; |  XXXXX | $DCA3
    .byte $7F ; | XXXXXXX| $DCA4
    .byte $7F ; | XXXXXXX| $DCA5
    .byte $7F ; | XXXXXXX| $DCA6
    .byte $36 ; |  XX XX | $DCA7
    .byte $30 ; |  XX    | $DCA8
    .byte $36 ; |  XX XX | $DCA9
    .byte $3E ; |  XXXXX | $DCAA
    .byte $3E ; |  XXXXX | $DCAB
    .byte $7F ; | XXXXXXX| $DCAC
    .byte $7F ; | XXXXXXX| $DCAD
    .byte $7F ; | XXXXXXX| $DCAE
    .byte $7F ; | XXXXXXX| $DCAF
    .byte $7F ; | XXXXXXX| $DCB0
    .byte $3E ; |  XXXXX | $DCB1
    .byte $1C ; |   XXX  | $DCB2
    .byte $3E ; |  XXXXX | $DCB3
    .byte $3E ; |  XXXXX | $DCB4
    .byte $3E ; |  XXXXX | $DCB5
    .byte $3E ; |  XXXXX | $DCB6
    .byte $3E ; |  XXXXX | $DCB7
    .byte $3E ; |  XXXXX | $DCB8
    .byte $3E ; |  XXXXX | $DCB9
    .byte $3E ; |  XXXXX | $DCBA
    .byte $3E ; |  XXXXX | $DCBB
    .byte $7F ; | XXXXXXX| $DCBC
    .byte $7F ; | XXXXXXX| $DCBD
    .byte $7F ; | XXXXXXX| $DCBE
    .byte $36 ; |  XX XX | $DCBF
    .byte $36 ; |  XX XX | $DCC0
    .byte $36 ; |  XX XX | $DCC1
    .byte $3E ; |  XXXXX | $DCC2
    .byte $22 ; |  X   X | $DCC3
    .byte $5D ; | X XXX X| $DCC4
    .byte $5D ; | X XXX X| $DCC5
    .byte $5D ; | X XXX X| $DCC6
    .byte $5D ; | X XXX X| $DCC7
    .byte $63 ; | XX   XX| $DCC8
    .byte $2A ; |  X X X | $DCC9
    .byte $1C ; |   XXX  | $DCCA
    .byte $3E ; |  XXXXX | $DCCB
    .byte $22 ; |  X   X | $DCCC
    .byte $36 ; |  XX XX | $DCCD
    .byte $2A ; |  X X X | $DCCE
    .byte $2A ; |  X X X | $DCCF
    .byte $3E ; |  XXXXX | $DCD0
    .byte $3E ; |  XXXXX | $DCD1
    .byte $3E ; |  XXXXX | $DCD2
    .byte $3E ; |  XXXXX | $DCD3
    .byte $7F ; | XXXXXXX| $DCD4
    .byte $7F ; | XXXXXXX| $DCD5
    .byte $7F ; | XXXXXXX| $DCD6
    .byte $36 ; |  XX XX | $DCD7
    .byte $36 ; |  XX XX | $DCD8
    .byte $36 ; |  XX XX | $DCD9
    .byte $3E ; |  XXXXX | $DCDA
    .byte $3E ; |  XXXXX | $DCDB
    .byte $7F ; | XXXXXXX| $DCDC
    .byte $7F ; | XXXXXXX| $DCDD
    .byte $7F ; | XXXXXXX| $DCDE
    .byte $7F ; | XXXXXXX| $DCDF
    .byte $7F ; | XXXXXXX| $DCE0
    .byte $3E ; |  XXXXX | $DCE1
    .byte $1C ; |   XXX  | $DCE2
    .byte $3E ; |  XXXXX | $DCE3
    .byte $3E ; |  XXXXX | $DCE4
    .byte $3E ; |  XXXXX | $DCE5
    .byte $3E ; |  XXXXX | $DCE6
    .byte $3E ; |  XXXXX | $DCE7
    .byte $3E ; |  XXXXX | $DCE8
    .byte $3E ; |  XXXXX | $DCE9
    .byte $3E ; |  XXXXX | $DCEA
    .byte $3E ; |  XXXXX | $DCEB
    .byte $7F ; | XXXXXXX| $DCEC
    .byte $7F ; | XXXXXXX| $DCED
    .byte $7F ; | XXXXXXX| $DCEE
    .byte $36 ; |  XX XX | $DCEF
    .byte $00 ; |        | $DCF0
    .byte $00 ; |        | $DCF1
    .byte $00 ; |        | $DCF2
    .byte $00 ; |        | $DCF3
    .byte $00 ; |        | $DCF4
    .byte $00 ; |        | $DCF5
    .byte $00 ; |        | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $00 ; |        | $DCFB
    .byte $00 ; |        | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
    .byte $00 ; |        | $DD00
    .byte $00 ; |        | $DD01
    .byte $FF ; |XXXXXXXX| $DD02
    .byte $FF ; |XXXXXXXX| $DD03
    .byte $FF ; |XXXXXXXX| $DD04
    .byte $FF ; |XXXXXXXX| $DD05
    .byte $FF ; |XXXXXXXX| $DD06
    .byte $00 ; |        | $DD07
    .byte $00 ; |        | $DD08
    .byte $00 ; |        | $DD09
    .byte $FF ; |XXXXXXXX| $DD0A
    .byte $FF ; |XXXXXXXX| $DD0B
    .byte $FF ; |XXXXXXXX| $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
LDD10:
    .byte $14 ; |   X X  | $DD10
    .byte $14 ; |   X X  | $DD11
    .byte $1A ; |   XX X | $DD12
    .byte $1A ; |   XX X | $DD13
    .byte $1A ; |   XX X | $DD14
    .byte $14 ; |   X X  | $DD15
    .byte $14 ; |   X X  | $DD16
    .byte $14 ; |   X X  | $DD17
    .byte $00 ; |        | $DD18
    .byte $00 ; |        | $DD19
    .byte $00 ; |        | $DD1A
    .byte $00 ; |        | $DD1B
    .byte $00 ; |        | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $0E ; |    XXX | $DD1F
    .byte $17 ; |   X XXX| $DD20
    .byte $1B ; |   XX XX| $DD21
    .byte $1D ; |   XXX X| $DD22
    .byte $0E ; |    XXX | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $00 ; |        | $DD27
    .byte $00 ; |        | $DD28
    .byte $00 ; |        | $DD29
    .byte $00 ; |        | $DD2A
    .byte $0E ; |    XXX | $DD2B
    .byte $1B ; |   XX XX| $DD2C
    .byte $1B ; |   XX XX| $DD2D
    .byte $1B ; |   XX XX| $DD2E
    .byte $0E ; |    XXX | $DD2F
    .byte $00 ; |        | $DD30
    .byte $00 ; |        | $DD31
    .byte $00 ; |        | $DD32
    .byte $00 ; |        | $DD33
    .byte $00 ; |        | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $0E ; |    XXX | $DD37
    .byte $1D ; |   XXX X| $DD38
    .byte $1B ; |   XX XX| $DD39
    .byte $17 ; |   X XXX| $DD3A
    .byte $0E ; |    XXX | $DD3B
    .byte $00 ; |        | $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $00 ; |        | $DD40
    .byte $00 ; |        | $DD41
    .byte $00 ; |        | $DD42
    .byte $0E ; |    XXX | $DD43
    .byte $1F ; |   XXXXX| $DD44
    .byte $11 ; |   X   X| $DD45
    .byte $1F ; |   XXXXX| $DD46
    .byte $0E ; |    XXX | $DD47
    .byte $00 ; |        | $DD48
    .byte $00 ; |        | $DD49
    .byte $00 ; |        | $DD4A
    .byte $00 ; |        | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $00 ; |        | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $00 ; |        | $DD58
    .byte $FF ; |XXXXXXXX| $DD59
    .byte $FF ; |XXXXXXXX| $DD5A
    .byte $00 ; |        | $DD5B
    .byte $00 ; |        | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $00 ; |        | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $00 ; |        | $DD61
    .byte $00 ; |        | $DD62
    .byte $00 ; |        | $DD63
    .byte $00 ; |        | $DD64
    .byte $00 ; |        | $DD65
    .byte $00 ; |        | $DD66
    .byte $00 ; |        | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $FF ; |XXXXXXXX| $DD6A
    .byte $58 ; | X XX   | $DD6B
    .byte $30 ; |  XX    | $DD6C
    .byte $64 ; | XX  X  | $DD6D
    .byte $20 ; |  X     | $DD6E
    .byte $00 ; |        | $DD6F
    .byte $00 ; |        | $DD70
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $FF ; |XXXXXXXX| $DD73
    .byte $3C ; |  XXXX  | $DD74
    .byte $58 ; | X XX   | $DD75
    .byte $50 ; | X X    | $DD76
    .byte $10 ; |   X    | $DD77
    .byte $00 ; |        | $DD78
    .byte $00 ; |        | $DD79
    .byte $00 ; |        | $DD7A
    .byte $00 ; |        | $DD7B
    .byte $FF ; |XXXXXXXX| $DD7C
    .byte $1C ; |   XXX  | $DD7D
    .byte $14 ; |   X X  | $DD7E
    .byte $04 ; |     X  | $DD7F
    .byte $44 ; | X   X  | $DD80
    .byte $00 ; |        | $DD81
    .byte $00 ; |        | $DD82
    .byte $00 ; |        | $DD83
    .byte $00 ; |        | $DD84
    .byte $FF ; |XXXXXXXX| $DD85
    .byte $3C ; |  XXXX  | $DD86
    .byte $14 ; |   X X  | $DD87
    .byte $10 ; |   X    | $DD88
    .byte $00 ; |        | $DD89
    .byte $00 ; |        | $DD8A
    .byte $00 ; |        | $DD8B
    .byte $00 ; |        | $DD8C
    .byte $00 ; |        | $DD8D
    .byte $00 ; |        | $DD8E
    .byte $00 ; |        | $DD8F
    .byte $00 ; |        | $DD90
    .byte $00 ; |        | $DD91
    .byte $00 ; |        | $DD92
    .byte $00 ; |        | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $80 ; |X       | $DD96
    .byte $80 ; |X       | $DD97
    .byte $80 ; |X       | $DD98
    .byte $80 ; |X       | $DD99
    .byte $80 ; |X       | $DD9A
    .byte $80 ; |X       | $DD9B
    .byte $80 ; |X       | $DD9C
    .byte $1A ; |   XX X | $DD9D
LDD9E:
    .byte $1A ; |   XX X | $DD9E
    .byte $1A ; |   XX X | $DD9F
    .byte $18 ; |   XX   | $DDA0
    .byte $16 ; |   X XX | $DDA1
    .byte $1A ; |   XX X | $DDA2
    .byte $1A ; |   XX X | $DDA3
    .byte $1A ; |   XX X | $DDA4
    .byte $1A ; |   XX X | $DDA5
    .byte $1A ; |   XX X | $DDA6
    .byte $80 ; |X       | $DDA7
    .byte $80 ; |X       | $DDA8
    .byte $80 ; |X       | $DDA9
    .byte $80 ; |X       | $DDAA
    .byte $80 ; |X       | $DDAB
    .byte $80 ; |X       | $DDAC
    .byte $80 ; |X       | $DDAD
LDDAE:
    .byte $32 ; |  XX  X | $DDAE
    .byte $34 ; |  XX X  | $DDAF
    .byte $36 ; |  XX XX | $DDB0
    .byte $36 ; |  XX XX | $DDB1
    .byte $36 ; |  XX XX | $DDB2
    .byte $34 ; |  XX X  | $DDB3
    .byte $32 ; |  XX  X | $DDB4
    .byte $C4 ; |XX   X  | $DDB5
    .byte $C4 ; |XX   X  | $DDB6
    .byte $C4 ; |XX   X  | $DDB7
    .byte $80 ; |X       | $DDB8
    .byte $80 ; |X       | $DDB9
    .byte $80 ; |X       | $DDBA
    .byte $80 ; |X       | $DDBB
    .byte $80 ; |X       | $DDBC
    .byte $80 ; |X       | $DDBD
    .byte $80 ; |X       | $DDBE
LDDBF:
    .byte $14 ; |   X X  | $DDBF
    .byte $16 ; |   X XX | $DDC0
    .byte $18 ; |   XX   | $DDC1
    .byte $1A ; |   XX X | $DDC2
    .byte $18 ; |   XX   | $DDC3
    .byte $16 ; |   X XX | $DDC4
    .byte $14 ; |   X X  | $DDC5
    .byte $16 ; |   X XX | $DDC6
    .byte $16 ; |   X XX | $DDC7
    .byte $16 ; |   X XX | $DDC8
    .byte $80 ; |X       | $DDC9
    .byte $80 ; |X       | $DDCA
    .byte $80 ; |X       | $DDCB
    .byte $80 ; |X       | $DDCC
    .byte $80 ; |X       | $DDCD
    .byte $80 ; |X       | $DDCE
    .byte $80 ; |X       | $DDCF
LDDD0:
    .byte $C2 ; |XX    X | $DDD0
    .byte $C4 ; |XX   X  | $DDD1
    .byte $C6 ; |XX   XX | $DDD2
    .byte $C8 ; |XX  X   | $DDD3
    .byte $CA ; |XX  X X | $DDD4
    .byte $CA ; |XX  X X | $DDD5
    .byte $CA ; |XX  X X | $DDD6
    .byte $C8 ; |XX  X   | $DDD7
    .byte $C6 ; |XX   XX | $DDD8
    .byte $C4 ; |XX   X  | $DDD9
    .byte $80 ; |X       | $DDDA
    .byte $80 ; |X       | $DDDB
    .byte $80 ; |X       | $DDDC
    .byte $80 ; |X       | $DDDD
    .byte $80 ; |X       | $DDDE
    .byte $80 ; |X       | $DDDF
    .byte $80 ; |X       | $DDE0
    .byte $1A ; |   XX X | $DDE1
    .byte $1A ; |   XX X | $DDE2
    .byte $1A ; |   XX X | $DDE3
    .byte $1A ; |   XX X | $DDE4
    .byte $1A ; |   XX X | $DDE5
    .byte $1A ; |   XX X | $DDE6
    .byte $1A ; |   XX X | $DDE7
    .byte $1A ; |   XX X | $DDE8
    .byte $1A ; |   XX X | $DDE9
    .byte $1A ; |   XX X | $DDEA
    .byte $00 ; |        | $DDEB
    .byte $00 ; |        | $DDEC
    .byte $00 ; |        | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $00 ; |        | $DDF0
    .byte $00 ; |        | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $00 ; |        | $DDF3
    .byte $00 ; |        | $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
LDE00:
    LDA    #7              ; 2
LDE02:
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    STA    $FC             ; 3
    LDY    #0              ; 2
    STY    GRP0            ; 3
    LDA    #3              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    LDX    #$90            ; 2
    STX    HMP1            ; 3
    LDX    #$80            ; 2
    STX    HMP0            ; 3
    NOP                    ; 2
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    STA.w  RESBL           ; 4
    STA    NUSIZ1          ; 3
    LDA    ($8B),Y         ; 5
    LDA    ($8B),Y         ; 5
    NOP                    ; 2
    NOP                    ; 2
LDE2C:
    LDY    $FC             ; 3
    LDA    ($93),Y         ; 5
    TAX                    ; 2
    LDA    ($95),Y         ; 5
    STA    HMOVE           ; 3
    STA    $FB             ; 3
    LDA    ($8B),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($8D),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($8F),Y         ; 5
    STA    HMCLR           ; 3
    STA    GRP0            ; 3
    LDA    ($91),Y         ; 5
    LDY    $FB             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    DEC    $FC             ; 5
    BPL    LDE2C           ; 2³
    LDA    #$80            ; 2
    STA    HMP0            ; 3
    STA    HMP1            ; 3
    STA    WSYNC           ; 3
    STA    HMOVE           ; 3
    ASL                    ; 2
    STA    GRP0            ; 3
    STA    GRP1            ; 3
    STA    GRP0            ; 3
LDE66:
    RTS                    ; 6

    .byte $00 ; |        | $DE67
    .byte $00 ; |        | $DE68
    .byte $00 ; |        | $DE69
    .byte $00 ; |        | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $00 ; |        | $DE6C
    .byte $00 ; |        | $DE6D
    .byte $81 ; |X      X| $DE6E
    .byte $66 ; | XX  XX | $DE6F
    .byte $66 ; | XX  XX | $DE70
    .byte $3C ; |  XXXX  | $DE71
    .byte $3C ; |  XXXX  | $DE72
    .byte $3C ; |  XXXX  | $DE73
    .byte $3C ; |  XXXX  | $DE74
    .byte $66 ; | XX  XX | $DE75
    .byte $66 ; | XX  XX | $DE76
    .byte $81 ; |X      X| $DE77
    .byte $00 ; |        | $DE78
    .byte $00 ; |        | $DE79
    .byte $00 ; |        | $DE7A
    .byte $00 ; |        | $DE7B
    .byte $00 ; |        | $DE7C
    .byte $00 ; |        | $DE7D
    .byte $00 ; |        | $DE7E
    .byte $00 ; |        | $DE7F
    .byte $81 ; |X      X| $DE80
    .byte $24 ; |  X  X  | $DE81
    .byte $42 ; | X    X | $DE82
    .byte $00 ; |        | $DE83
    .byte $18 ; |   XX   | $DE84
    .byte $18 ; |   XX   | $DE85
    .byte $00 ; |        | $DE86
    .byte $42 ; | X    X | $DE87
    .byte $24 ; |  X  X  | $DE88
    .byte $81 ; |X      X| $DE89
    .byte $00 ; |        | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $00 ; |        | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $00 ; |        | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $00 ; |        | $DE90
    .byte $00 ; |        | $DE91
    .byte $24 ; |  X  X  | $DE92
    .byte $81 ; |X      X| $DE93
    .byte $42 ; | X    X | $DE94
    .byte $42 ; | X    X | $DE95
    .byte $81 ; |X      X| $DE96
    .byte $81 ; |X      X| $DE97
    .byte $42 ; | X    X | $DE98
    .byte $42 ; | X    X | $DE99
    .byte $81 ; |X      X| $DE9A
    .byte $24 ; |  X  X  | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $00 ; |        | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $00 ; |        | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $00 ; |        | $DEA2
    .byte $00 ; |        | $DEA3
    .byte $00 ; |        | $DEA4
    .byte $00 ; |        | $DEA5
    .byte $00 ; |        | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $00 ; |        | $DEA8
    .byte $00 ; |        | $DEA9
    .byte $00 ; |        | $DEAA
    .byte $00 ; |        | $DEAB
    .byte $00 ; |        | $DEAC
    .byte $00 ; |        | $DEAD
    .byte $00 ; |        | $DEAE
    .byte $00 ; |        | $DEAF
    .byte $00 ; |        | $DEB0
    .byte $00 ; |        | $DEB1
    .byte $00 ; |        | $DEB2
    .byte $00 ; |        | $DEB3
    .byte $00 ; |        | $DEB4
    .byte $00 ; |        | $DEB5
    .byte $00 ; |        | $DEB6
    .byte $00 ; |        | $DEB7
    .byte $00 ; |        | $DEB8
    .byte $00 ; |        | $DEB9
    .byte $00 ; |        | $DEBA
    .byte $00 ; |        | $DEBB
    .byte $00 ; |        | $DEBC
    .byte $00 ; |        | $DEBD
    .byte $00 ; |        | $DEBE
    .byte $00 ; |        | $DEBF
    .byte $00 ; |        | $DEC0
    .byte $00 ; |        | $DEC1
    .byte $00 ; |        | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $00 ; |        | $DEC4
    .byte $00 ; |        | $DEC5
    .byte $00 ; |        | $DEC6
    .byte $00 ; |        | $DEC7
    .byte $00 ; |        | $DEC8
    .byte $00 ; |        | $DEC9
    .byte $00 ; |        | $DECA
    .byte $00 ; |        | $DECB
    .byte $00 ; |        | $DECC
    .byte $00 ; |        | $DECD
    .byte $00 ; |        | $DECE
    .byte $00 ; |        | $DECF
    .byte $00 ; |        | $DED0
    .byte $00 ; |        | $DED1
    .byte $00 ; |        | $DED2
    .byte $00 ; |        | $DED3
    .byte $00 ; |        | $DED4
    .byte $00 ; |        | $DED5
    .byte $00 ; |        | $DED6
    .byte $00 ; |        | $DED7
    .byte $00 ; |        | $DED8
    .byte $00 ; |        | $DED9
    .byte $00 ; |        | $DEDA
    .byte $00 ; |        | $DEDB
    .byte $00 ; |        | $DEDC
    .byte $00 ; |        | $DEDD
    .byte $00 ; |        | $DEDE
    .byte $00 ; |        | $DEDF
    .byte $00 ; |        | $DEE0
    .byte $00 ; |        | $DEE1
    .byte $00 ; |        | $DEE2
    .byte $00 ; |        | $DEE3
    .byte $00 ; |        | $DEE4
    .byte $00 ; |        | $DEE5
    .byte $00 ; |        | $DEE6
    .byte $00 ; |        | $DEE7
    .byte $00 ; |        | $DEE8
    .byte $00 ; |        | $DEE9
    .byte $00 ; |        | $DEEA
    .byte $00 ; |        | $DEEB
    .byte $00 ; |        | $DEEC
    .byte $00 ; |        | $DEED
    .byte $00 ; |        | $DEEE
    .byte $00 ; |        | $DEEF
    .byte $00 ; |        | $DEF0
    .byte $00 ; |        | $DEF1
    .byte $00 ; |        | $DEF2
    .byte $00 ; |        | $DEF3
    .byte $00 ; |        | $DEF4
    .byte $00 ; |        | $DEF5
    .byte $00 ; |        | $DEF6
    .byte $00 ; |        | $DEF7
    .byte $00 ; |        | $DEF8
    .byte $00 ; |        | $DEF9
    .byte $00 ; |        | $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $00 ; |        | $DEFD
    .byte $00 ; |        | $DEFE
    .byte $00 ; |        | $DEFF
    .byte $3C ; |  XXXX  | $DF00
    .byte $66 ; | XX  XX | $DF01
    .byte $66 ; | XX  XX | $DF02
    .byte $66 ; | XX  XX | $DF03
    .byte $66 ; | XX  XX | $DF04
    .byte $66 ; | XX  XX | $DF05
    .byte $66 ; | XX  XX | $DF06
    .byte $3C ; |  XXXX  | $DF07
    .byte $3C ; |  XXXX  | $DF08
    .byte $18 ; |   XX   | $DF09
    .byte $18 ; |   XX   | $DF0A
    .byte $18 ; |   XX   | $DF0B
    .byte $18 ; |   XX   | $DF0C
    .byte $18 ; |   XX   | $DF0D
    .byte $38 ; |  XXX   | $DF0E
    .byte $18 ; |   XX   | $DF0F
    .byte $7E ; | XXXXXX | $DF10
    .byte $60 ; | XX     | $DF11
    .byte $60 ; | XX     | $DF12
    .byte $3C ; |  XXXX  | $DF13
    .byte $06 ; |     XX | $DF14
    .byte $06 ; |     XX | $DF15
    .byte $46 ; | X   XX | $DF16
    .byte $3C ; |  XXXX  | $DF17
    .byte $3C ; |  XXXX  | $DF18
    .byte $46 ; | X   XX | $DF19
    .byte $06 ; |     XX | $DF1A
    .byte $0C ; |    XX  | $DF1B
    .byte $0C ; |    XX  | $DF1C
    .byte $06 ; |     XX | $DF1D
    .byte $46 ; | X   XX | $DF1E
    .byte $3C ; |  XXXX  | $DF1F
    .byte $0C ; |    XX  | $DF20
    .byte $0C ; |    XX  | $DF21
    .byte $0C ; |    XX  | $DF22
    .byte $7E ; | XXXXXX | $DF23
    .byte $4C ; | X  XX  | $DF24
    .byte $2C ; |  X XX  | $DF25
    .byte $1C ; |   XXX  | $DF26
    .byte $0C ; |    XX  | $DF27
    .byte $7C ; | XXXXX  | $DF28
    .byte $46 ; | X   XX | $DF29
    .byte $06 ; |     XX | $DF2A
    .byte $06 ; |     XX | $DF2B
    .byte $7C ; | XXXXX  | $DF2C
    .byte $60 ; | XX     | $DF2D
    .byte $60 ; | XX     | $DF2E
    .byte $7E ; | XXXXXX | $DF2F
    .byte $3C ; |  XXXX  | $DF30
    .byte $66 ; | XX  XX | $DF31
    .byte $66 ; | XX  XX | $DF32
    .byte $66 ; | XX  XX | $DF33
    .byte $7C ; | XXXXX  | $DF34
    .byte $60 ; | XX     | $DF35
    .byte $62 ; | XX   X | $DF36
    .byte $3C ; |  XXXX  | $DF37
    .byte $18 ; |   XX   | $DF38
    .byte $18 ; |   XX   | $DF39
    .byte $18 ; |   XX   | $DF3A
    .byte $18 ; |   XX   | $DF3B
    .byte $0C ; |    XX  | $DF3C
    .byte $06 ; |     XX | $DF3D
    .byte $42 ; | X    X | $DF3E
    .byte $7E ; | XXXXXX | $DF3F
    .byte $3C ; |  XXXX  | $DF40
    .byte $66 ; | XX  XX | $DF41
    .byte $66 ; | XX  XX | $DF42
    .byte $3C ; |  XXXX  | $DF43
    .byte $3C ; |  XXXX  | $DF44
    .byte $66 ; | XX  XX | $DF45
    .byte $66 ; | XX  XX | $DF46
    .byte $3C ; |  XXXX  | $DF47
    .byte $3C ; |  XXXX  | $DF48
    .byte $46 ; | X   XX | $DF49
    .byte $06 ; |     XX | $DF4A
    .byte $3E ; |  XXXXX | $DF4B
    .byte $66 ; | XX  XX | $DF4C
    .byte $66 ; | XX  XX | $DF4D
    .byte $66 ; | XX  XX | $DF4E
    .byte $3C ; |  XXXX  | $DF4F
    .byte $00 ; |        | $DF50
    .byte $00 ; |        | $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $00 ; |        | $DF57
    .byte $1C ; |   XXX  | $DF58
    .byte $1C ; |   XXX  | $DF59
    .byte $1C ; |   XXX  | $DF5A
    .byte $7F ; | XXXXXXX| $DF5B
    .byte $7F ; | XXXXXXX| $DF5C
    .byte $7F ; | XXXXXXX| $DF5D
    .byte $7F ; | XXXXXXX| $DF5E
    .byte $36 ; |  XX XX | $DF5F
LDF60:
    .byte $20 ; |  X     | $DF60
    .byte $70 ; | XXX    | $DF61
    .byte $D8 ; |XX XX   | $DF62
    .byte $0C ; |    XX  | $DF63
    .byte $06 ; |     XX | $DF64
    .byte $00 ; |        | $DF65
LDF66:
    .byte $0C ; |    XX  | $DF66
    .byte $06 ; |     XX | $DF67
    .byte $03 ; |      XX| $DF68
    .byte $01 ; |       X| $DF69
    .byte $00 ; |        | $DF6A
    .byte $00 ; |        | $DF6B
    .byte $00 ; |        | $DF6C
    .byte $00 ; |        | $DF6D
LDF6E:
    .byte $2D ; |  X XX X| $DF6E
    .byte $29 ; |  X X  X| $DF6F
    .byte $E9 ; |XXX X  X| $DF70
    .byte $A9 ; |X X X  X| $DF71
    .byte $ED ; |XXX XX X| $DF72
    .byte $61 ; | XX    X| $DF73
    .byte $2F ; |  X XXXX| $DF74
    .byte $00 ; |        | $DF75
LDF76:
    .byte $50 ; | X X    | $DF76
    .byte $58 ; | X XX   | $DF77
    .byte $5C ; | X XXX  | $DF78
    .byte $56 ; | X X XX | $DF79
    .byte $53 ; | X X  XX| $DF7A
    .byte $11 ; |   X   X| $DF7B
    .byte $F0 ; |XXXX    | $DF7C
    .byte $00 ; |        | $DF7D
LDF7E:
    .byte $BA ; |X XXX X | $DF7E
    .byte $8A ; |X   X X | $DF7F
    .byte $BA ; |X XXX X | $DF80
    .byte $A2 ; |X X   X | $DF81
    .byte $3A ; |  XXX X | $DF82
    .byte $80 ; |X       | $DF83
    .byte $FE ; |XXXXXXX | $DF84
    .byte $00 ; |        | $DF85
LDF86:
    .byte $E9 ; |XXX X  X| $DF86
    .byte $AB ; |X X X XX| $DF87
    .byte $AF ; |X X XXXX| $DF88
    .byte $AD ; |X X XX X| $DF89
    .byte $E9 ; |XXX X  X| $DF8A
    .byte $00 ; |        | $DF8B
    .byte $00 ; |        | $DF8C
    .byte $00 ; |        | $DF8D
    .byte $00 ; |        | $DF8E
    .byte $00 ; |        | $DF8F
    .byte $00 ; |        | $DF90
    .byte $F7 ; |XXXX XXX| $DF91
    .byte $95 ; |X  X X X| $DF92
    .byte $87 ; |X    XXX| $DF93
    .byte $90 ; |X  X    | $DF94
    .byte $F0 ; |XXXX    | $DF95
    .byte $00 ; |        | $DF96
    .byte $47 ; | X   XXX| $DF97
    .byte $41 ; | X     X| $DF98
    .byte $77 ; | XXX XXX| $DF99
    .byte $55 ; | X X X X| $DF9A
    .byte $75 ; | XXX X X| $DF9B
    .byte $00 ; |        | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $03 ; |      XX| $DF9F
    .byte $00 ; |        | $DFA0
    .byte $4B ; | X  X XX| $DFA1
    .byte $4A ; | X  X X | $DFA2
    .byte $6B ; | XX X XX| $DFA3
    .byte $00 ; |        | $DFA4
    .byte $08 ; |    X   | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $80 ; |X       | $DFA7
    .byte $80 ; |X       | $DFA8
    .byte $AA ; |X X X X | $DFA9
    .byte $AA ; |X X X X | $DFAA
    .byte $BA ; |X XXX X | $DFAB
    .byte $27 ; |  X  XXX| $DFAC
    .byte $22 ; |  X   X | $DFAD
    .byte $00 ; |        | $DFAE
    .byte $00 ; |        | $DFAF
    .byte $00 ; |        | $DFB0
    .byte $11 ; |   X   X| $DFB1
    .byte $11 ; |   X   X| $DFB2
    .byte $17 ; |   X XXX| $DFB3
    .byte $15 ; |   X X X| $DFB4
    .byte $17 ; |   X XXX| $DFB5
    .byte $00 ; |        | $DFB6
    .byte $00 ; |        | $DFB7
    .byte $00 ; |        | $DFB8
    .byte $77 ; | XXX XXX| $DFB9
    .byte $51 ; | X X   X| $DFBA
    .byte $73 ; | XXX  XX| $DFBB
    .byte $51 ; | X X   X| $DFBC
    .byte $77 ; | XXX XXX| $DFBD
LDFBE:
    .byte $84 ; |X    X  | $DFBE
    .byte $D6 ; |XX X XX | $DFBF
    .byte $D6 ; |XX X XX | $DFC0
    .byte $1A ; |   XX X | $DFC1
    .byte $26 ; |  X  XX | $DFC2
    .byte $26 ; |  X  XX | $DFC3
    .byte $44 ; | X   X  | $DFC4
    .byte $00 ; |        | $DFC5
    .byte $00 ; |        | $DFC6
    .byte $00 ; |        | $DFC7
    .byte $00 ; |        | $DFC8
    .byte $00 ; |        | $DFC9
    .byte $00 ; |        | $DFCA
    .byte $00 ; |        | $DFCB
    .byte $00 ; |        | $DFCC
    .byte $00 ; |        | $DFCD
    .byte $00 ; |        | $DFCE
    .byte $00 ; |        | $DFCF
LDFD0:
    STA    $FFF9           ; 4
    JSR    $F300           ; 6

    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $00 ; |        | $DFD8
    .byte $00 ; |        | $DFD9
    .byte $00 ; |        | $DFDA
    .byte $00 ; |        | $DFDB
    .byte $00 ; |        | $DFDC
    .byte $00 ; |        | $DFDD
    .byte $00 ; |        | $DFDE
    .byte $00 ; |        | $DFDF
    .byte $00 ; |        | $DFE0
    .byte $00 ; |        | $DFE1
    .byte $00 ; |        | $DFE2

    JMP    LD003           ; 3

    .byte $00 ; |        | $DFE6
    .byte $00 ; |        | $DFE7
    .byte $00 ; |        | $DFE8
    .byte $00 ; |        | $DFE9
    .byte $00 ; |        | $DFEA
    .byte $00 ; |        | $DFEB
    .byte $00 ; |        | $DFEC
    .byte $00 ; |        | $DFED
    .byte $00 ; |        | $DFEE
    .byte $00 ; |        | $DFEF
    .byte $00 ; |        | $DFF0
    .byte $00 ; |        | $DFF1
    .byte $00 ; |        | $DFF2
    .byte $00 ; |        | $DFF3
    .byte $00 ; |        | $DFF4
    .byte $00 ; |        | $DFF5
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
LDFF9:
    .byte $00 ; |        | $DFF9
    .byte $00 ; |        | $DFFA
    .byte $00 ; |        | $DFFB

       ORG $DFFC

    .word START,START



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       RORG $F000

START_2:
    STA    LFFF9           ; 4
LF003:
    CLI                    ; 2
    CLD                    ; 2
    LDX    #0              ; 2
    LDY    #$1E            ; 2
LF009:
    LDA    #0              ; 2
LF00B:
    STA    VSYNC,X         ; 4
    TXS                    ; 2
    INX                    ; 2
    BNE    LF00B           ; 2³
    JSR    LFC08           ; 6
    LDX    $82             ; 3
    BNE    LF01F           ; 2³
    LDX    #$20            ; 2
    STX    $82             ; 3
    JMP    LF45D           ; 3
LF01F:
    LDA    $E3             ; 3
    BPL    LF03A           ; 2³
    LDA    $81             ; 3
    BNE    LF03A           ; 2³
    LDA    $EE             ; 3
    EOR    #$01            ; 2
    STA    $EE             ; 3
    LDX    #2              ; 2
LF02F:
    LDA    $D9,X           ; 4
    LDY    $E4,X           ; 4
    STA    $E4,X           ; 4
    STY    $D9,X           ; 4
    DEX                    ; 2
    BPL    LF02F           ; 2³
LF03A:
    LDA    $86             ; 3
    BPL    LF076           ; 2³
    LDY    $E7             ; 3
    DEC    $E8             ; 5
    BPL    LF08D           ; 2³
    LDA    #4              ; 2
    STA    $E8             ; 3
    INY                    ; 2
    CPY    #$44            ; 2
    BNE    LF079           ; 2³
    LDA    $80             ; 3
    LSR                    ; 2
    BCC    LF05C           ; 2³
    LDA    $BB             ; 3
    ORA    $BC             ; 3
    BNE    LF08B           ; 2³
    LDA    #$FF            ; 2
    STA    $E3             ; 3
LF05C:
    LDA    $F4             ; 3
    CMP    #7              ; 2
    BCS    LF08B           ; 2³
    LDA    $D1             ; 3
    ORA    $D8             ; 3
    BNE    LF08B           ; 2³
    STA    $E7             ; 3
    STA    $86             ; 3
    LDY    $DE             ; 3
    STA    $DE             ; 3
    BMI    LF076           ; 2³
    LDA    #$FF            ; 2
    STA    $DF             ; 3
LF076:
    JMP    LF0BF           ; 3
LF079:
    CPY    #$24            ; 2
    BNE    LF085           ; 2³
    DEC    $D6             ; 5
    BMI    LF08B           ; 2³
    LDY    #4              ; 2
    BNE    LF08B           ; 2³
LF085:
    CPY    #$64            ; 2
    BCC    LF08B           ; 2³
    LDY    #$44            ; 2
LF08B:
    STY    $E7             ; 3
LF08D:
    BIT    $DE             ; 3
    BMI    LF0BF           ; 2³
    LDA    $F4             ; 3
    CMP    #7              ; 2
    BCC    LF09B           ; 2³
LF097:
    LDA    #0              ; 2
    BEQ    LF0BA           ; 2³
LF09B:
    CPY    #$44            ; 2
    BCS    LF0AA           ; 2³
    LDX    LFE8F,Y         ; 4
    LDA    LFE00,X         ; 4
    LDX    #0              ; 2
    JSR    LFE14           ; 6
LF0AA:
    CPY    #$44            ; 2
    BCC    LF0B4           ; 2³
    LDA    SWCHB           ; 4
    ASL                    ; 2
    BMI    LF097           ; 2³
LF0B4:
    LDX    LFE2B,Y         ; 4
    LDA    LFE00,X         ; 4
LF0BA:
    LDX    #1              ; 2
    JSR    LFE14           ; 6
LF0BF:
    LDX    $E0             ; 3
    BEQ    LF13C           ; 2³+1
    CPX    #9              ; 2
    BCC    LF0CC           ; 2³
    LDA    $81             ; 3
    LSR                    ; 2
    BCS    LF0F2           ; 2³
LF0CC:
    DEC    $E1             ; 5
    BMI    LF0F5           ; 2³
    BIT    $DE             ; 3
    BMI    LF0F2           ; 2³
    LDA    LFB0B,X         ; 4
    STA    AUDC0           ; 3
    LDA    #$0F            ; 2
    CPX    #6              ; 2
    BCC    LF0E1           ; 2³
    LDA    $E1             ; 3
LF0E1:
    STA    AUDV0           ; 3
    LDA    LFB14,X         ; 4
    BPL    LF0F0           ; 2³
    LSR                    ; 2
    BCC    LF0EE           ; 2³
    AND    $E1             ; 3

LF0ED:
    .byte $2C  ; BIT opcode

LF0EE:
    EOR    $E1             ; 3
LF0F0:
    STA    AUDF0           ; 3
LF0F2:
    JMP    LF14C           ; 3
LF0F5:
    CPX    #3              ; 2
    BNE    LF0FE           ; 2³
    JSR    LFAF9           ; 6
    BNE    LF14C           ; 2³+1
LF0FE:
    CPX    #7              ; 2
    BNE    LF109           ; 2³
    LDA    #9              ; 2
    JSR    LFAFB           ; 6
    BNE    LF14C           ; 2³
LF109:
    LDY    $BB             ; 3
    BNE    LF11F           ; 2³
    INC    $E1             ; 5
    STY    AUDC0           ; 3
    STY    AUDF0           ; 3
    DEC    $D1             ; 5
    BNE    LF14C           ; 2³
    STY    $D1             ; 3
    JSR    LFB9F           ; 6
    JMP    LF13C           ; 3
LF11F:
    LDA    $F1             ; 3
    CMP    #$0C            ; 2
    BCC    LF13C           ; 2³
    LDY    #6              ; 2
    CPY    $F4             ; 3
    BCC    LF13C           ; 2³
    LDA    $D8             ; 3
    BEQ    LF13C           ; 2³
    STA    $DC             ; 3
    LDA    $F4             ; 3
    STA    $D5             ; 3
    INY                    ; 2
    STY    $F4             ; 3
    LDA    #$40            ; 2
    STA    $D1             ; 3
LF13C:
    LDA    #0              ; 2
    STA    $E0             ; 3
    STA    $E1             ; 3
    LDX    $E7             ; 3
    CPX    #$44            ; 2
    BCC    LF14C           ; 2³
    STA    AUDC0           ; 3
    STA    AUDF0           ; 3
LF14C:
    LDA    #$79            ; 2
    SEC                    ; 2
    SBC    $C1             ; 3
    STA    $A8             ; 3
    LDA    #$DA            ; 2
    SBC    #0              ; 2
    STA    $A9             ; 3
    LDY    $C5             ; 3
    LDA    LFA8F,Y         ; 4
    SEC                    ; 2
    SBC    $C1             ; 3
    STA    $AA             ; 3
    LDA    #$DC            ; 2
    SBC    #0              ; 2
    STA    $AB             ; 3
    LDX    #$DB            ; 2
    LDY    $F5             ; 3
    CPY    #5              ; 2
    BCC    LF173           ; 2³
    LDX    #$D8            ; 2
LF173:
    LDA    $F2             ; 3
    BEQ    LF183           ; 2³
    LDX    #$DE            ; 2
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFA9D,Y         ; 4
    LDY    $F5             ; 3
    BPL    LF186           ; 2³
LF183:
    LDA    LFAA1,Y         ; 4
LF186:
    SEC                    ; 2
    SBC    $B0             ; 3
    STA    $AC             ; 3
    CPY    #8              ; 2
    BCC    LF19B           ; 2³
    LDA    #$D8            ; 2
    STA    $AD             ; 3
    LDA    #0              ; 2
    STA    $AF             ; 3
    LDA    #$93            ; 2
    BNE    LF1AA           ; 2³
LF19B:
    STX    $AD             ; 3
    LDA    #$DD            ; 2
    CPY    #5              ; 2
    BCC    LF1A5           ; 2³
    LDA    #$D9            ; 2
LF1A5:
    STA    $AF             ; 3
    LDA    LFAB0,Y         ; 4
LF1AA:
    SEC                    ; 2
    SBC    $B0             ; 3
    STA    $AE             ; 3
    LDA    #$79            ; 2
    CPX    #$DE            ; 2
    BEQ    LF1C8           ; 2³
    LDY    $F4             ; 3
    CPY    #7              ; 2
    BCC    LF1BD           ; 2³
    LDY    $D5             ; 3
LF1BD:
    CPY    #0              ; 2
    BEQ    LF1C8           ; 2³
    CPY    #4              ; 2
    BEQ    LF1C8           ; 2³
    SEC                    ; 2
    SBC    #6              ; 2
LF1C8:
    SEC                    ; 2
    SBC    $B0             ; 3
    LDY    $EF             ; 3
    BPL    LF1D1           ; 2³
    LDA    #0              ; 2
LF1D1:
    STA    $97             ; 3
    LDA    #$DA            ; 2
    STA    $98             ; 3
    LDA    #$35            ; 2
    LDY    $C0             ; 3
    CPY    #$50            ; 2
    BCS    LF1E1           ; 2³
    LDA    #$31            ; 2
LF1E1:
    STA    $84             ; 3
    LDX    #3              ; 2
LF1E5:
    TXA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    TAY                    ; 2
    LDA    $D8,X           ; 4
    AND    #$F0            ; 2
    LSR                    ; 2
    STA.wy $87,Y           ; 5
    LDA    #$DF            ; 2
    STA.wy $88,Y           ; 5
    LDA    $D8,X           ; 4
    AND    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA.wy $89,Y           ; 5
    LDA    #$DF            ; 2
    STA.wy $8A,Y           ; 5
    DEX                    ; 2
    BPL    LF1E5           ; 2³+1
    INX                    ; 2
    LDY    #$50            ; 2
LF20B:
    LDA    $8B,X           ; 4
    BNE    LF217           ; 2³
    STY    $8B,X           ; 4
    INX                    ; 2
    INX                    ; 2
    CPX    #$0A            ; 2
    BCC    LF20B           ; 2³
LF217:
    LDY    #3              ; 2
LF219:
    LDA.wy $BD,Y           ; 4
    LDX    #$FF            ; 2
    JSR    LFB72           ; 6
    BPL    LF219           ; 2³
    DEC    $B6             ; 5
    LDX    #$FF            ; 2
    TXS                    ; 2
    JMP    LFFE0           ; 3


  REPEAT ($F300 - *)       ;       empty bytes, $F22B - $F2FF
    .byte 0
  REPEND


    LDX    #$FF            ; 2
    TXS                    ; 2
    JSR    LFAEC           ; 6
    LDY    $EE             ; 3
    LDA.wy INPT4,Y         ; 4
    BMI    LF310           ; 2³
    JSR    LFAEC           ; 6
LF310:
    LDA    $DE             ; 3
    BMI    LF317           ; 2³
    JMP    LF3C2           ; 3
LF317:
    STA    $85             ; 3
    LDA    #$0F            ; 2
    STA    $84             ; 3
    LDX    #6              ; 2
LF31F:
    LDA    $C7,X           ; 4
    CMP    #$10            ; 2
    BNE    LF328           ; 2³
    DEX                    ; 2
    BPL    LF31F           ; 2³
LF328:
    STA    $FB             ; 3
    STX    $FC             ; 3
    LDA    $F4             ; 3
    BNE    LF377           ; 2³
    LDA    $F3             ; 3
    BEQ    LF341           ; 2³
    LDY    #$FF            ; 2
    JSR    LFAC4           ; 6
    LDY    #$50            ; 2
    JSR    LFAD5           ; 6
    JMP    LF3C2           ; 3
LF341:
    LDA    $BF             ; 3
    CMP    #$44            ; 2
    BCC    LF34B           ; 2³
    CMP    #$56            ; 2
    BCC    LF350           ; 2³
LF34B:
    LDY    #$4C            ; 2
    JSR    LFAD5           ; 6
LF350:
    LDY    $B0             ; 3
    JSR    LFAC4           ; 6
    LDA    $D0             ; 3
    AND    #$0F            ; 2
    EOR    $FB             ; 3
    STA    $FB             ; 3
    BNE    LF367           ; 2³
    LDA    $F5             ; 3
    CMP    #4              ; 2
    BEQ    LF374           ; 2³
    BNE    LF370           ; 2³
LF367:
    LDY    $F5             ; 3
    LDA    LFB1E,Y         ; 4
    AND    $FB             ; 3
    BNE    LF374           ; 2³
LF370:
    LDX    #0              ; 2
    STX    $85             ; 3
LF374:
    JMP    LF3C2           ; 3
LF377:
    CMP    #1              ; 2
    BNE    LF395           ; 2³
    LDX    $FC             ; 3
    LDA    LFB32,X         ; 4
    CLC                    ; 2
    ADC    #8              ; 2
    BPL    LF387           ; 2³
    LDA    #5              ; 2
LF387:
    TAY                    ; 2
    JSR    LFAC4           ; 6
    BNE    LF392           ; 2³
    LDY    #$30            ; 2
    JSR    LFAD5           ; 6
LF392:
    JMP    LF3C2           ; 3
LF395:
    CMP    #2              ; 2
    BNE    LF3C2           ; 2³
    LDY    #0              ; 2
    JSR    LFAC4           ; 6
    LDY    $C6             ; 3
    CPY    #3              ; 2
    BCC    LF3A6           ; 2³
    LDY    #2              ; 2
LF3A6:
    LDA.wy $CE,Y           ; 4
    AND    #$F0            ; 2
    ASL                    ; 2
    ADC    #$2C            ; 2
    TAY                    ; 2
    JSR    LFAD5           ; 6
    BNE    LF3C2           ; 2³
    LDA    $F3             ; 3
    BEQ    LF3C2           ; 2³
    LDA    $C1             ; 3
    CMP    #$59            ; 2
    BCS    LF3C2           ; 2³
    LDY    #0              ; 2
    STY    $85             ; 3
LF3C2:
    LDA    INTIM           ; 4
    BNE    LF3C2           ; 2³
    LDY    #$82            ; 2
    STY    WSYNC           ; 3
    STY    VSYNC           ; 3
    STY    WSYNC           ; 3
    STY    WSYNC           ; 3
    STY    WSYNC           ; 3
    STA    VSYNC           ; 3
    INC    $81             ; 5
    BNE    LF3EC           ; 2³
    INC    $DE             ; 5
    LDA    $DE             ; 3
    AND    #$C7            ; 2
    STA    $DE             ; 3
    AND    #$07            ; 2
    BNE    LF3EC           ; 2³
    INC    $DD             ; 5
    BNE    LF3EC           ; 2³
    SEC                    ; 2
    ROR    $DD             ; 5
LF3EC:
    LDA    #$30            ; 2
    STA    WSYNC           ; 3
    STA    TIM64T          ; 4
    LDY    SWCHA           ; 4
    LDA    $81             ; 3
    AND    #$07            ; 2
    BNE    LF416           ; 2³+1
    LDA    $DF             ; 3
    BEQ    LF416           ; 2³
    LDY    #$FF            ; 2
    DEC    $DF             ; 5
    BNE    LF416           ; 2³
    DEC    $DF             ; 5
    LDA    $DE             ; 3
    BMI    LF416           ; 2³
    ORA    #$80            ; 2
    STA    $DE             ; 3
    LDX    #$E7            ; 2
    LDY    #$1B            ; 2
    BNE    LF439           ; 2³
LF416:
    TYA                    ; 2
    CMP    #$FF            ; 2
    BEQ    LF41F           ; 2³
    LDY    #0              ; 2
    STY    $DD             ; 3
LF41F:
    LDY    $EE             ; 3
    BNE    LF427           ; 2³
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF427:
    AND    #$0F            ; 2
    BIT    $DE             ; 3
    BMI    LF42F           ; 2³
    STA    $84             ; 3
LF42F:
    LDA    SWCHB           ; 4
    LSR                    ; 2
    BCS    LF440           ; 2³
    LDX    #$DD            ; 2
    LDY    #$1E            ; 2
LF439:
    LDA    #$FF            ; 2
    STA    $86             ; 3
    JMP    LF009           ; 3
LF440:
    LDY    #0              ; 2
    LSR                    ; 2
    BCS    LF483           ; 2³
    STY    $EE             ; 3
    STY    $E3             ; 3
    STY    AUDC0           ; 3
    STY    AUDC1           ; 3
    STY    AUDF0           ; 3
    STY    AUDF1           ; 3
    STY    $E0             ; 3
    LDA    $83             ; 3
    BEQ    LF45B           ; 2³
    DEC    $83             ; 5
    BPL    LF485           ; 2³
LF45B:
    INC    $80             ; 5
LF45D:
    LDA    $80             ; 3
    AND    #$07            ; 2
    STA    $80             ; 3
    STA    $DD             ; 3
    STA    $DE             ; 3
    ORA    #$A0            ; 2
    TAY                    ; 2
    INY                    ; 2
    STY    $DB             ; 3
    LDY    #$BB            ; 2
    LSR                    ; 2
    BCS    LF474           ; 2³
    LDY    #$AB            ; 2
LF474:
    STY    $D9             ; 3
    LDY    #$AA            ; 2
    STY    $DA             ; 3
    LDY    #0              ; 2
    STY    $86             ; 3
    DEY                    ; 2
    STY    $DF             ; 3
    LDY    #$1E            ; 2
LF483:
    STY    $83             ; 3
LF485:
    LDA    $86             ; 3
    BMI    LF48C           ; 2³
LF489:
    JMP    LFA88           ; 3
LF48C:
    LDA    $F4             ; 3
    CMP    #7              ; 2
    BCS    LF49C           ; 2³
    LDA    $D8             ; 3
    BEQ    LF489           ; 2³
    LDX    $E7             ; 3
    CPX    #$44            ; 2
    BCS    LF49F           ; 2³
LF49C:
    JMP    LF7FC           ; 3
LF49F:
    LDA    #0              ; 2
    STA    $FB             ; 3
    LDA    $C5             ; 3
    AND    #$07            ; 2
    STA    $C5             ; 3
    LDY    $C1             ; 3
    LDA    $84             ; 3
    LSR                    ; 2
    BCS    LF4EA           ; 2³
    LDA    #6              ; 2
    INY                    ; 2
    LDX    $F3             ; 3
    BNE    LF4BD           ; 2³
    CPY    #$49            ; 2
    BCC    LF509           ; 2³+1
    LDY    #$48            ; 2
LF4BD:
    CPY    #$5A            ; 2
    BCC    LF509           ; 2³+1
    LDY    #$59            ; 2
    LDX    $BF             ; 3
    CPX    #$31            ; 2
    BCC    LF509           ; 2³+1
    CPX    #$65            ; 2
    BCS    LF509           ; 2³+1
    LDX    $F4             ; 3
    CPX    #2              ; 2
    BEQ    LF509           ; 2³+1
    LDX    $F1             ; 3
    CPX    #$0B            ; 2
    BCC    LF4E1           ; 2³
    BEQ    LF4DD           ; 2³
    BCS    LF509           ; 2³+1
LF4DD:
    LDX    $F4             ; 3
    BNE    LF509           ; 2³+1
LF4E1:
    JSR    LFC3F           ; 6
    DEC    $F3             ; 5
    LDY    #2              ; 2
    BNE    LF509           ; 2³+1
LF4EA:
    LSR                    ; 2
    BCS    LF511           ; 2³+1
    LDA    #5              ; 2
    DEY                    ; 2
    LDX    $F3             ; 3
    BNE    LF503           ; 2³+1
    CPY    #4              ; 2
    BNE    LF509           ; 2³+1
    INY                    ; 2
    LDX    $F5             ; 3
    CPX    #8              ; 2
    BCC    LF509           ; 2³+1
    INC    $F3             ; 5
    LDY    #$59            ; 2
LF503:
    CPY    #$58            ; 2
    BCS    LF509           ; 2³
    LDY    #$58            ; 2
LF509:
    STY    $C1             ; 3
    STA    $FB             ; 3
    LDA    $84             ; 3
    LSR                    ; 2
    LSR                    ; 2
LF511:
    LDX    $F3             ; 3
    LSR                    ; 2
    BCS    LF523           ; 2³
    LDA    #8              ; 2
    DEC    $BF             ; 5
    LDY    LFA8B,X         ; 4
    CPY    $BF             ; 3
    BCC    LF577           ; 2³
    BCS    LF531           ; 2³
LF523:
    LSR                    ; 2
    BCS    LF536           ; 2³
    LDA    #0              ; 2
    INC    $BF             ; 5
    LDY    LFA8D,X         ; 4
    CPY    $BF             ; 3
    BCS    LF577           ; 2³
LF531:
    STY    $BF             ; 3
    JMP    LF577           ; 3
LF536:
    LDA    $FB             ; 3
    BNE    LF544           ; 2³
    STA    $E2             ; 3
    LDA    $C5             ; 3
    ORA    #$08            ; 2
    STA    $C5             ; 3
    BPL    LF59B           ; 2³
LF544:
    CMP    $C5             ; 3
    BEQ    LF55E           ; 2³
    LDX    $C5             ; 3
    CPX    #5              ; 2
    BCC    LF556           ; 2³
    LDA    #4              ; 2
    STA    $E2             ; 3
    LDA    #8              ; 2
    BNE    LF55E           ; 2³
LF556:
    DEC    $E2             ; 5
    BPL    LF560           ; 2³
    LDX    #0              ; 2
    STX    $E2             ; 3
LF55E:
    STA    $C5             ; 3
LF560:
    LDA    $C1             ; 3
    ASL                    ; 2
    STA    $F6             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LDA    $BF             ; 3
    BCC    LF570           ; 2³
    ORA    #$01            ; 2

LF56F:
    .byte $2C  ; BIT opcode

LF570:
    AND    #$FE            ; 2
    STA    $BF             ; 3
    JMP    LF59B           ; 3
LF577:
    LDY    #0              ; 2
    STY    $E2             ; 3
    LDY    $C5             ; 3
    CPY    #5              ; 2
    BCC    LF585           ; 2³
    STA    $F6             ; 3
    BCS    LF597           ; 2³
LF585:
    CMP    $F6             ; 3
    BEQ    LF58D           ; 2³
    LDY    #$0D            ; 2
    BNE    LF599           ; 2³
LF58D:
    LDA    $81             ; 3
    LSR                    ; 2
    BCS    LF59B           ; 2³
    INY                    ; 2
    CPY    #5              ; 2
    BCC    LF599           ; 2³
LF597:
    LDY    #0              ; 2
LF599:
    STY    $C5             ; 3
LF59B:
    LDA    $F4             ; 3
    ORA    $F3             ; 3
    BNE    LF60C           ; 2³+1
    LDA    $81             ; 3
    AND    #$01            ; 2
    BNE    LF60C           ; 2³+1
    LDY    $F5             ; 3
    LDA    LFB38,Y         ; 4
    STA    $B0             ; 3
    LDA    $F2             ; 3
    BMI    LF622           ; 2³+1
    DEC    $C0             ; 5
    LDA    #0              ; 2
    STA    $EF             ; 3
    LDA    #$2F            ; 2
    CMP    $C0             ; 3
    BCC    LF5CA           ; 2³
    STA    $C0             ; 3
    LDA    #$80            ; 2
    JSR    LFAF7           ; 6
    LDA    #1              ; 2
    JSR    LFB87           ; 6
LF5CA:
    LDA    CXPPMM          ; 3
    BPL    LF622           ; 2³+1
    LDA    $C1             ; 3
    SEC                    ; 2
    SBC    $B0             ; 3
    CMP    #$0C            ; 2
    BCS    LF618           ; 2³+1
    JSR    LFABF           ; 6
    CMP    #5              ; 2
    BCS    LF5EC           ; 2³
    LDA    $F6             ; 3
    AND    #$08            ; 2
    BEQ    LF5EC           ; 2³
    LDA    $BF             ; 3
    CMP    $C0             ; 3
    BCC    LF618           ; 2³+1
    BCS    LF60F           ; 2³+1
LF5EC:
    LDX    $EE             ; 3
    BIT    $DE             ; 3
    BPL    LF5F7           ; 2³
    LDA    $85             ; 3
    JMP    LF5F9           ; 3
LF5F7:
    LDA    INPT4,X         ; 4
LF5F9:
    BMI    LF60F           ; 2³+1
    LDA    #4              ; 2
    STA    $F4             ; 3
    LDA    #8              ; 2
    STA    $C5             ; 3
    LDA    #0              ; 2
    STA    $F6             ; 3
    LDA    #8              ; 2
    JSR    LFAFB           ; 6
LF60C:
    JMP    LF622           ; 3
LF60F:
    LDA    #5              ; 2
    JSR    LFCA5           ; 6
    INC    $F4             ; 5
    BNE    LF622           ; 2³
LF618:
    LDA    #$81            ; 2
    JSR    LFAF7           ; 6
    LDA    #1              ; 2
    JSR    LFB87           ; 6
LF622:
    LDA    $F2             ; 3
    BPL    LF64F           ; 2³
    AND    #$0F            ; 2
    BEQ    LF630           ; 2³
    LDA    $81             ; 3
    AND    #$03            ; 2
    BNE    LF64F           ; 2³
LF630:
    LDA    #0              ; 2
    STA    $F4             ; 3
    INC    $F2             ; 5
    LDY    $F2             ; 3
    CPY    #$84            ; 2
    BNE    LF64F           ; 2³
    LDA    #0              ; 2
    STA    $F2             ; 3
    LDA    #$70            ; 2
    STA    $C0             ; 3
    LDA    #$FF            ; 2
    STA    $EF             ; 3
    LDA    $F3             ; 3
    BNE    LF64F           ; 2³
    JSR    LFC3F           ; 6
LF64F:
    LDA    $F4             ; 3
    BEQ    LF657           ; 2³
    CMP    #3              ; 2
    BCC    LF65A           ; 2³
LF657:
    JMP    LF766           ; 3
LF65A:
    LDY    #4              ; 2
    LDA    $F6             ; 3
    AND    #$08            ; 2
    BEQ    LF664           ; 2³
    LDY    #$FD            ; 2
LF664:
    TYA                    ; 2
    CLC                    ; 2
    ADC    $BF             ; 3
    STA    $C0             ; 3
    LDY    #0              ; 2
    JSR    LFABF           ; 6
    CMP    #5              ; 2
    BCC    LF67F           ; 2³
    LSR                    ; 2
    BCS    LF679           ; 2³
    DEY                    ; 2
    BMI    LF67F           ; 2³
LF679:
    LDA    $BF             ; 3
    ORA    #$01            ; 2
    STA    $C0             ; 3
LF67F:
    STY    $EF             ; 3
    LDY    $C1             ; 3
    TYA                    ; 2
    SEC                    ; 2
    SBC    #4              ; 2
    STA    $B0             ; 3
    LDA    $F4             ; 3
    CMP    #2              ; 2
    BNE    LF6DE           ; 2³
    LDA    $F3             ; 3
    BEQ    LF657           ; 2³
    JSR    LFABF           ; 6
    CMP    #6              ; 2
    BEQ    LF657           ; 2³
    LDX    $EE             ; 3
    BIT    $DE             ; 3
    BPL    LF6A5           ; 2³
    LDA    $85             ; 3
    JMP    LF6A7           ; 3
LF6A5:
    LDA    INPT4,X         ; 4
LF6A7:
    BMI    LF657           ; 2³
    LDA    $C0             ; 3
    LDX    #0              ; 2
    SEC                    ; 2
    SBC    #$28            ; 2
    JMP    LF6B6           ; 3
LF6B3:
    SEC                    ; 2
    SBC    #$20            ; 2
LF6B6:
    CMP    #9              ; 2
    BCC    LF6C1           ; 2³
    INX                    ; 2
    CPX    #3              ; 2
    BCC    LF6B3           ; 2³
    BCS    LF6D4           ; 2³
LF6C1:
    STX    $B2             ; 3
    TXA                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ORA    $B1             ; 3
    LDY    #2              ; 2
LF6CC:
    CMP.wy $CE,Y           ; 4
    BEQ    LF6D8           ; 2³
    DEY                    ; 2
    BPL    LF6CC           ; 2³
LF6D4:
    LDA    #$FF            ; 2
    STA    $B2             ; 3
LF6D8:
    STY    $C6             ; 3
    INC    $F4             ; 5
    BNE    LF6FD           ; 2³
LF6DE:
    LDA    $BA             ; 3
    BPL    LF6FD           ; 2³
    LDX    #0              ; 2
    LDA    $B0             ; 3
    SEC                    ; 2
    SBC    #5              ; 2
    STA    $FB             ; 3
LF6EB:
    LDA    LFB32,X         ; 4
    CLC                    ; 2
    ADC    $FA             ; 3
    SEC                    ; 2
    SBC    $FB             ; 3
    CMP    #$0A            ; 2
    BCC    LF700           ; 2³+1
    INX                    ; 2
    CPX    #6              ; 2
    BCC    LF6EB           ; 2³
LF6FD:
    JMP    LF766           ; 3
LF700:
    LDA    $C7,X           ; 4
    CMP    #$10            ; 2
    BEQ    LF766           ; 2³
    LDA    #1              ; 2
    LDY    #8              ; 2
    JSR    LFAFD           ; 6
    LDY    $F5             ; 3
    CPY    #4              ; 2
    BNE    LF73D           ; 2³
    LDY    $C7,X           ; 4
    STY    $B1             ; 3
    LDA    #$10            ; 2
    STA    $C7,X           ; 4
    LDA    LFB22,Y         ; 4
    STA    $F5             ; 3
    LDX    #0              ; 2
LF722:
    LDA    $CE,X           ; 4
    CMP    #$30            ; 2
    BEQ    LF72E           ; 2³
    AND    #$0F            ; 2
    CMP    $B1             ; 3
    BEQ    LF733           ; 2³
LF72E:
    INX                    ; 2
    CPX    #3              ; 2
    BCC    LF722           ; 2³
LF733:
    STX    $C6             ; 3
    LDA    #$10            ; 2
    JSR    LFCA5           ; 6
    JMP    LF766           ; 3
LF73D:
    LDA    LFB1E,Y         ; 4
    AND    $C7,X           ; 4
    BEQ    LF74C           ; 2³
    LDA    #1              ; 2
    JSR    LFB87           ; 6
    JMP    LF758           ; 3
LF74C:
    LDA    LFB1E,Y         ; 4
    ORA    $C7,X           ; 4
    STA    $C7,X           ; 4
    LDA    #$10            ; 2
    JSR    LFCA5           ; 6
LF758:
    LDY    #0              ; 2
    STY    $F4             ; 3
    DEY                    ; 2
    STY    $EF             ; 3
    LDA    #$70            ; 2
    STA    $C0             ; 3
    JSR    LFC3F           ; 6
LF766:
    LDA    $F2             ; 3
    BMI    LF7E5           ; 2³
    LDA    $F4             ; 3
    CMP    #3              ; 2
    BNE    LF7E5           ; 2³
    LDA    $F3             ; 3
    BEQ    LF7C2           ; 2³
    LDX    $B2             ; 3
    LDY    $B0             ; 3
    BMI    LF794           ; 2³
    CPY    #$4D            ; 2
    BCC    LF794           ; 2³
    LDA    $BA             ; 3
    BPL    LF797           ; 2³
LF782:
    LDA    #5              ; 2
    JSR    LFB87           ; 6
    LDA    #$81            ; 2
    JSR    LFAF7           ; 6
    INC    $F1             ; 5
    LDA    #0              ; 2
    STA    $F5             ; 3
    BEQ    LF7E1           ; 2³
LF794:
    TXA                    ; 2
    BMI    LF782           ; 2³
LF797:
    CPY    #$3C            ; 2
    BCS    LF7B0           ; 2³
    TXA                    ; 2
    CLC                    ; 2
    ADC    #5              ; 2
    STA    $F5             ; 3
    LDA    LFAB8,X         ; 4
    STA    $C0             ; 3
    CPY    #$2E            ; 2
    BCC    LF7B0           ; 2³
    LDA    $81             ; 3
    AND    #$03            ; 2
    BNE    LF7E5           ; 2³
LF7B0:
    DEC    $B0             ; 5
    TXA                    ; 2
    BMI    LF7E5           ; 2³
    LDA    $B0             ; 3
    LDY    $E9,X           ; 4
    CMP    LFABB,Y         ; 4
    BNE    LF7E5           ; 2³
    LDA    #$FF            ; 2
    STA    $EF             ; 3
LF7C2:
    LDX    $B2             ; 3
    BMI    LF782           ; 2³
    INC    $E9,X           ; 6
    LDA    #2              ; 2
    LDY    #$1F            ; 2
    JSR    LFAFD           ; 6
    LDA    #1              ; 2
    TAY                    ; 2
    JSR    LFCA7           ; 6
    INC    $F1             ; 5
    LDX    $C6             ; 3
    LDA    #$30            ; 2
    STA    $CE,X           ; 4
    LDA    #0              ; 2
    STA    $F4             ; 3
LF7E1:
    LDA    #3              ; 2
    STA    $C6             ; 3
LF7E5:
    LDA    $F4             ; 3
    CMP    #4              ; 2
    BNE    LF7FC           ; 2³
    INC    $C0             ; 5
    INC    $C0             ; 5
    LDA    $C0             ; 3
    CMP    #$70            ; 2
    BCC    LF7FC           ; 2³
    LDA    #0              ; 2
    STA    $F4             ; 3
    JSR    LFC3F           ; 6
LF7FC:
    LDA    $F4             ; 3
    CMP    #7              ; 2
    BNE    LF861           ; 2³
    DEC    $D1             ; 5
    BPL    LF861           ; 2³
    LDA    #0              ; 2
    STA    $D1             ; 3
    LDA    $F3             ; 3
    BNE    LF818           ; 2³
    LDA    #8              ; 2
    STA    $C5             ; 3
    INC    $F3             ; 5
    LDA    #$58            ; 2
    STA    $C1             ; 3
LF818:
    LDA    #$FF            ; 2
    STA    $EF             ; 3
    LDA    $E0             ; 3
    CMP    #5              ; 2
    BEQ    LF861           ; 2³
    LDA    $81             ; 3
    AND    #$03            ; 2
    BNE    LF861           ; 2³
    SED                    ; 2
    LDA    $D8             ; 3
    SEC                    ; 2
    SBC    #1              ; 2
    CLD                    ; 2
    BCS    LF83F           ; 2³
    LDA    $DC             ; 3
    STA    $D8             ; 3
    LDA    #2              ; 2
    STA    $D1             ; 3
    LDA    #8              ; 2
    STA    $F4             ; 3
    BNE    LF861           ; 2³
LF83F:
    STA    $D8             ; 3
    LDA    #4              ; 2
    LDY    #3              ; 2
    JSR    LFAFD           ; 6
    LDA    $EC             ; 3
    JSR    LFC2B           ; 6
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $FB             ; 3
    BCC    LF85C           ; 2³
    LDY    #1              ; 2
    LDA    #1              ; 2
    JSR    LFCA7           ; 6
LF85C:
    LDA    $FB             ; 3
    JSR    LFCA5           ; 6
LF861:
    LDA    $F4             ; 3
    CMP    #8              ; 2
    BNE    LF86D           ; 2³
    LDA    $81             ; 3
    AND    #$1F            ; 2
    BEQ    LF870           ; 2³
LF86D:
    JMP    LF8D1           ; 3
LF870:
    LDA    $E9             ; 3
    ORA    $EA             ; 3
    ORA    $EB             ; 3
    BEQ    LF8B1           ; 2³
    DEC    $D1             ; 5
    BPL    LF8D1           ; 2³
    LDA    $E0             ; 3
    CMP    #5              ; 2
    BEQ    LF8D1           ; 2³
    LDX    #0              ; 2
    STX    $D1             ; 3
LF886:
    LDA    $E9,X           ; 4
    BNE    LF891           ; 2³
    INX                    ; 2
    CPX    #3              ; 2
    BCC    LF886           ; 2³
    BCS    LF8B1           ; 2³
LF891:
    DEC    $E9,X           ; 6
    BNE    LF89D           ; 2³
    CPX    #2              ; 2
    BNE    LF89D           ; 2³
    LDA    #4              ; 2
    STA    $D1             ; 3
LF89D:
    LDA    #7              ; 2
    JSR    LFAFB           ; 6
    LDA    $EC             ; 3
    LSR                    ; 2
    LSR                    ; 2
    JSR    LFC2B           ; 6
    LDY    #1              ; 2
    JSR    LFCA7           ; 6
    JMP    LF8D1           ; 3
LF8B1:
    DEC    $D1             ; 5
    BPL    LF8D1           ; 2³
    INC    $EC             ; 5
    BNE    LF8BB           ; 2³
    DEC    $EC             ; 5
LF8BB:
    LDA    $EC             ; 3
    CMP    #$14            ; 2
    BCC    LF8C3           ; 2³
    LDA    #$14            ; 2
LF8C3:
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LFD02,Y         ; 4
    STA    $BB             ; 3
    JSR    LFB9F           ; 6
    JSR    LFC3F           ; 6
LF8D1:
    LDA    $BB             ; 3
    CLC                    ; 2
    ADC    $F8             ; 3
    STA    $F8             ; 3
    BCS    LF8DD           ; 2³
    JMP    LFA88           ; 3
LF8DD:
    INC    $F9             ; 5
    LDA    $F9             ; 3
    AND    #$0F            ; 2
    BNE    LF8F6           ; 2³
    LDA    $F4             ; 3
    CMP    #7              ; 2
    BCS    LF8F6           ; 2³
    LDX    #2              ; 2
LF8ED:
    LDA    $CE,X           ; 4
    CMP    #$30            ; 2
    BEQ    LF8F9           ; 2³
    DEX                    ; 2
    BPL    LF8ED           ; 2³
LF8F6:
    JMP    LF96C           ; 3
LF8F9:
    TXA                    ; 2
    BEQ    LF907           ; 2³+1
    LSR                    ; 2
    BCS    LF903           ; 2³+1
    LDA    $CF             ; 3
    STA    $D0             ; 3
LF903:
    LDA    $CE             ; 3
    STA    $CF             ; 3
LF907:
    LDA    $E9             ; 3
    CLC                    ; 2
    ADC    $EA             ; 3
    ADC    $EB             ; 3
    CMP    #$0A            ; 2
    LDA    #$30            ; 2
    BCS    LF96A           ; 2³
    LDA    $82             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    AND    #$03            ; 2
LF91C:
    CMP    #3              ; 2
    BCC    LF922           ; 2³
    LDA    #0              ; 2
LF922:
    TAY                    ; 2
    STA    $FB             ; 3
    LDX    $E9,Y           ; 4
    LDA    $CF             ; 3
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    CMP    $FB             ; 3
    BNE    LF934           ; 2³
    INX                    ; 2
LF934:
    LDA    $D0             ; 3
    AND    #$F0            ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    CMP    $FB             ; 3
    BNE    LF941           ; 2³
    INX                    ; 2
LF941:
    CPX    #4              ; 2
    BNE    LF94B           ; 2³
    LDA    $FB             ; 3
    ADC    #0              ; 2
    BCC    LF91C           ; 2³
LF94B:
    LDA    $FB             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STA    $FB             ; 3
    LDA    $EC             ; 3
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    $82             ; 3
    AND    #$0F            ; 2
LF95C:
    CMP    LFB3D,Y         ; 4
    BCC    LF964           ; 2³
    LSR                    ; 2
    BPL    LF95C           ; 2³
LF964:
    TAY                    ; 2
    LDA    LFB41,Y         ; 4
    ORA    $FB             ; 3
LF96A:
    STA    $CE             ; 3
LF96C:
    LDA    $C3             ; 3
    BMI    LF981           ; 2³
    CMP    #6              ; 2
    BCC    LF981           ; 2³
    SBC    #5              ; 2
    CMP    #5              ; 2
    BCS    LF97C           ; 2³
    LDA    #5              ; 2
LF97C:
    STA    $C3             ; 3
    JMP    LF9B7           ; 3
LF981:
    LDA    $BD             ; 3
    DEC    $BD             ; 5
    CMP    #$29            ; 2
    BNE    LF9B1           ; 2³
    STA    $BD             ; 3
    LDA    $F9             ; 3
    AND    #$07            ; 2
    BNE    LF9B7           ; 2³
    LDY    $C3             ; 3
    CPY    #$FF            ; 2
    BNE    LF99F           ; 2³
    LDA    $C6             ; 3
    BPL    LF99F           ; 2³
    LDA    #3              ; 2
    STA    $C6             ; 3
LF99F:
    CPY    #$E7            ; 2
    BNE    LF9B1           ; 2³
    LDA    $F0             ; 3
    CMP    #$0C            ; 2
    BCS    LF9B7           ; 2³
    LDA    #$0D            ; 2
    STA    $C3             ; 3
    LDA    #$69            ; 2
    STA    $BD             ; 3
LF9B1:
    CMP    #$2F            ; 2
    BCS    LF9B7           ; 2³
    DEC    $C3             ; 5
LF9B7:
    LDY    #0              ; 2
    LDA    $BD             ; 3
    CMP    #$5E            ; 2
    BCC    LF9C1           ; 2³
    LDY    #8              ; 2
LF9C1:
    STY    $C2             ; 3
    LDA    $C4             ; 3
    CMP    #$50            ; 2
    BNE    LF9FC           ; 2³
    LDA    $BE             ; 3
    CMP    #$55            ; 2
    BCC    LF9DD           ; 2³
    LDY    $C3             ; 3
    CPY    #$ED            ; 2
    BNE    LFA2E           ; 2³+1
    LDA    $F0             ; 3
    CMP    #$0C            ; 2
    BEQ    LFA2E           ; 2³+1
    BNE    LF9E2           ; 2³
LF9DD:
    LDA    $F9             ; 3
    LSR                    ; 2
    BCS    LFA2E           ; 2³+1
LF9E2:
    LDA    $BE             ; 3
    DEC    $BE             ; 5
    CMP    #$44            ; 2
    BNE    LFA2E           ; 2³+1
    STA    $BE             ; 3
    LDA    $C3             ; 3
    CMP    #$E8            ; 2
    BNE    LFA2E           ; 2³+1
    LDA    #$42            ; 2
    STA    $BE             ; 3
    LDA    #$45            ; 2
    STA    $C4             ; 3
    BNE    LFA2E           ; 2³+1
LF9FC:
    LDA    $C4             ; 3
    CMP    #$47            ; 2
    BCS    LFA11           ; 2³
    ADC    #2              ; 2
    STA    $C4             ; 3
    CMP    #$47            ; 2
    BCC    LFA0C           ; 2³
    LDA    #$47            ; 2
LFA0C:
    STA    $C4             ; 3
    JMP    LFA2E           ; 3
LFA11:
    LDA    $BE             ; 3
    CMP    #$5C            ; 2
    BCS    LFA1B           ; 2³
    INC    $BE             ; 5
    BNE    LFA2E           ; 2³
LFA1B:
    LDA    $C4             ; 3
    CLC                    ; 2
    ADC    #3              ; 2
    STA    $C4             ; 3
    CMP    #$4F            ; 2
    BCC    LFA2E           ; 2³
    LDA    #$50            ; 2
    STA    $C4             ; 3
    LDA    #$55            ; 2
    STA    $BE             ; 3
LFA2E:
    LDA    $F9             ; 3
    AND    #$07            ; 2
    BNE    LFA88           ; 2³
    DEC    $FA             ; 5
    BPL    LFA6C           ; 2³
    LDA    #$10            ; 2
    STA    $FA             ; 3
    LDY    #0              ; 2
    LDX    #5              ; 2
LFA40:
    LDA    $C7,X           ; 4
    STA    $C8,X           ; 4
    CMP    #$10            ; 2
    BEQ    LFA4A           ; 2³
    LDY    #$FF            ; 2
LFA4A:
    INY                    ; 2
    DEX                    ; 2
    BPL    LFA40           ; 2³
    LDA    #0              ; 2
    LDX    $F0             ; 3
    CPX    #$0C            ; 2
    BCC    LFA58           ; 2³
    LDA    #$10            ; 2
LFA58:
    LDX    $C6             ; 3
    BPL    LFA5E           ; 2³
    LDA    #$10            ; 2
LFA5E:
    CPY    #1              ; 2
    BCS    LFA64           ; 2³
    LDA    #$10            ; 2
LFA64:
    CMP    #0              ; 2
    BNE    LFA6A           ; 2³
    INC    $F0             ; 5
LFA6A:
    STA    $C7             ; 3
LFA6C:
    LDA    $FA             ; 3
    CMP    #5              ; 2
    BNE    LFA88           ; 2³
    LDA    $CC             ; 3
    CMP    #$10            ; 2
    BEQ    LFA84           ; 2³
    LDA    #$10            ; 2
    JSR    LFB87           ; 6
    INC    $F1             ; 5
    LDA    #3              ; 2
    JSR    LFAFB           ; 6
LFA84:
    LDA    #$10            ; 2
    STA    $CC             ; 3
LFA88:
    JMP    LF01F           ; 3
LFA8B:
    .byte $30 ; |  XX    | $FA8B
    .byte $15 ; |   X X X| $FA8C
LFA8D:
    .byte $64 ; | XX  X  | $FA8D
    .byte $82 ; |X     X | $FA8E
LFA8F:
    .byte $00 ; |        | $FA8F
    .byte $18 ; |   XX   | $FA90
    .byte $30 ; |  XX    | $FA91
    .byte $48 ; | X  X   | $FA92
    .byte $60 ; | XX     | $FA93
    .byte $90 ; |X  X    | $FA94
    .byte $A8 ; |X X X   | $FA95
    .byte $00 ; |        | $FA96
    .byte $78 ; | XXXX   | $FA97
    .byte $78 ; | XXXX   | $FA98
    .byte $78 ; | XXXX   | $FA99
    .byte $78 ; | XXXX   | $FA9A
    .byte $78 ; | XXXX   | $FA9B
    .byte $C0 ; |XX      | $FA9C
LFA9D:
    .byte $D8 ; |XX XX   | $FA9D
    .byte $67 ; | XX  XXX| $FA9E
    .byte $79 ; | XXXX  X| $FA9F
    .byte $8B ; |X   X XX| $FAA0
LFAA1:
    .byte $82 ; |X     X | $FAA1
    .byte $9F ; |X  XXXXX| $FAA2
    .byte $BB ; |X XXX XX| $FAA3
    .byte $D8 ; |XX XX   | $FAA4
    .byte $67 ; | XX  XXX| $FAA5
    .byte $CE ; |XX  XXX | $FAA6
    .byte $CE ; |XX  XXX | $FAA7
    .byte $CE ; |XX  XXX | $FAA8
    .byte $D0 ; |XX X    | $FAA9
    .byte $CF ; |XX  XXXX| $FAAA
    .byte $CE ; |XX  XXX | $FAAB
    .byte $CD ; |XX  XX X| $FAAC
    .byte $CC ; |XX  XX  | $FAAD
    .byte $CB ; |XX  X XX| $FAAE
    .byte $CA ; |XX  X X | $FAAF
LFAB0:
    .byte $A7 ; |X X  XXX| $FAB0
    .byte $B8 ; |X XXX   | $FAB1
    .byte $C9 ; |XX  X  X| $FAB2
    .byte $DA ; |XX XX X | $FAB3
    .byte $96 ; |X  X XX | $FAB4
    .byte $6D ; | XX XX X| $FAB5
    .byte $78 ; | XXXX   | $FAB6
    .byte $83 ; |X     XX| $FAB7
LFAB8:
    .byte $2C ; |  X XX  | $FAB8
    .byte $4C ; | X  XX  | $FAB9
    .byte $6C ; | XX XX  | $FABA
LFABB:
    .byte $FB ; |XXXXX XX| $FABB
    .byte $08 ; |    X   | $FABC
    .byte $15 ; |   X X X| $FABD
    .byte $22 ; |  X   X | $FABE
LFABF:
    LDA    $C5             ; 3
    AND    #$07            ; 2
    RTS                    ; 6

LFAC4:
    LDA    $84             ; 3
    CPY    $C1             ; 3
    BEQ    LFAD2           ; 2³
    BCS    LFAD0           ; 2³
    AND    #$FD            ; 2
    BCC    LFAD2           ; 2³
LFAD0:
    AND    #$FE            ; 2
LFAD2:
    STA    $84             ; 3
    RTS                    ; 6

LFAD5:
    LDA    $BF             ; 3
    AND    #$FE            ; 2
    STA    $FD             ; 3
    LDA    $84             ; 3
    CPY    $FD             ; 3
    BEQ    LFAE9           ; 2³
    BCS    LFAE7           ; 2³
    AND    #$FB            ; 2
    BCC    LFAE9           ; 2³
LFAE7:
    AND    #$F7            ; 2
LFAE9:
    STA    $84             ; 3
    RTS                    ; 6

LFAEC:
    LDA    $82             ; 3
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    EOR    $82             ; 3
    ASL                    ; 2
    ROL    $82             ; 5
    RTS                    ; 6

LFAF7:
    STA    $F2             ; 3
LFAF9:
    LDA    #6              ; 2
LFAFB:
    LDY    #$0F            ; 2
LFAFD:
    STA    $FB             ; 3
    LDA    $E0             ; 3
    CMP    #5              ; 2
    BEQ    LFB0B           ; 2³
    LDA    $FB             ; 3
    STA    $E0             ; 3
    STY    $E1             ; 3
LFB0B:
    RTS                    ; 6

    .byte $08 ; |    X   | $FB0C
    .byte $0C ; |    XX  | $FB0D
    .byte $0C ; |    XX  | $FB0E
    .byte $08 ; |    X   | $FB0F
    .byte $0C ; |    XX  | $FB10
    .byte $08 ; |    X   | $FB11
    .byte $08 ; |    X   | $FB12
    .byte $09 ; |    X  X| $FB13
LFB14:
    .byte $0C ; |    XX  | $FB14
    .byte $BF ; |X XXXXXX| $FB15
    .byte $8D ; |X   XX X| $FB16
    .byte $9E ; |X  XXXX | $FB17
    .byte $06 ; |     XX | $FB18
    .byte $87 ; |X    XXX| $FB19
    .byte $BF ; |X XXXXXX| $FB1A
    .byte $06 ; |     XX | $FB1B
    .byte $BF ; |X XXXXXX| $FB1C
    .byte $08 ; |    X   | $FB1D
LFB1E:
    .byte $08 ; |    X   | $FB1E
    .byte $04 ; |     X  | $FB1F
    .byte $02 ; |      X | $FB20
    .byte $01 ; |       X| $FB21
LFB22:
    .byte $08 ; |    X   | $FB22
    .byte $09 ; |    X  X| $FB23
    .byte $09 ; |    X  X| $FB24
    .byte $0B ; |    X XX| $FB25
    .byte $09 ; |    X  X| $FB26
    .byte $0A ; |    X X | $FB27
    .byte $0B ; |    X XX| $FB28
    .byte $0C ; |    XX  | $FB29
    .byte $0A ; |    X X | $FB2A
    .byte $0B ; |    X XX| $FB2B
    .byte $0C ; |    XX  | $FB2C
    .byte $0D ; |    XX X| $FB2D
    .byte $0B ; |    X XX| $FB2E
    .byte $0C ; |    XX  | $FB2F
    .byte $0D ; |    XX X| $FB30
    .byte $0E ; |    XXX | $FB31
LFB32:
    .byte $4A ; | X  X X | $FB32
    .byte $39 ; |  XXX  X| $FB33
    .byte $28 ; |  X X   | $FB34
    .byte $17 ; |   X XXX| $FB35
    .byte $06 ; |     XX | $FB36
    .byte $F5 ; |XXXX X X| $FB37
LFB38:
    .byte $45 ; | X   X X| $FB38
    .byte $35 ; |  XX X X| $FB39
    .byte $25 ; |  X  X X| $FB3A
    .byte $15 ; |   X X X| $FB3B
    .byte $05 ; |     X X| $FB3C
LFB3D:
    .byte $05 ; |     X X| $FB3D
    .byte $0B ; |    X XX| $FB3E
    .byte $0F ; |    XXXX| $FB3F
    .byte $10 ; |   X    | $FB40
LFB41:
    .byte $00 ; |        | $FB41
    .byte $01 ; |       X| $FB42
    .byte $02 ; |      X | $FB43
    .byte $04 ; |     X  | $FB44
    .byte $08 ; |    X   | $FB45
    .byte $03 ; |      XX| $FB46
    .byte $05 ; |     X X| $FB47
    .byte $06 ; |     XX | $FB48
    .byte $09 ; |    X  X| $FB49
    .byte $0A ; |    X X | $FB4A
    .byte $0C ; |    XX  | $FB4B
    .byte $07 ; |     XXX| $FB4C
    .byte $0B ; |    X XX| $FB4D
    .byte $0D ; |    XX X| $FB4E
    .byte $0E ; |    XXX | $FB4F
    .byte $0F ; |    XXXX| $FB50
LFB51:
    .byte $29 ; |  X X  X| $FB51
    .byte $56 ; | X X XX | $FB52
    .byte $50 ; | X X    | $FB53
    .byte $70 ; | XXX    | $FB54
    .byte $40 ; | X      | $FB55
    .byte $00 ; |        | $FB56
    .byte $EE ; |XXX XXX | $FB57
    .byte $50 ; | X X    | $FB58
    .byte $08 ; |    X   | $FB59
    .byte $FF ; |XXXXXXXX| $FB5A
    .byte $10 ; |   X    | $FB5B
    .byte $10 ; |   X    | $FB5C
    .byte $10 ; |   X    | $FB5D
    .byte $10 ; |   X    | $FB5E
    .byte $10 ; |   X    | $FB5F
    .byte $10 ; |   X    | $FB60
    .byte $10 ; |   X    | $FB61
    .byte $30 ; |  XX    | $FB62
    .byte $30 ; |  XX    | $FB63
    .byte $30 ; |  XX    | $FB64
    .byte $01 ; |       X| $FB65
    .byte $01 ; |       X| $FB66
    .byte $01 ; |       X| $FB67
    .byte $01 ; |       X| $FB68
    .byte $FF ; |XXXXXXXX| $FB69
    .byte $02 ; |      X | $FB6A
    .byte $50 ; | X X    | $FB6B
    .byte $50 ; | X X    | $FB6C
    .byte $00 ; |        | $FB6D
    .byte $00 ; |        | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $A2 ; |X X   X | $FB70
    .byte $FF ; |XXXXXXXX| $FB71
LFB72:
    SEC                    ; 2
LFB73:
    INX                    ; 2
    SBC    #$0F            ; 2
    BCS    LFB73           ; 2³
    STX    $B3,Y           ; 4
    EOR    #$0F            ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ADC    #$80            ; 2
    STA.wy $B7,Y           ; 5
    DEY                    ; 2
    RTS                    ; 6

LFB87:
    SED                    ; 2
    STA    $FB             ; 3
    LDA    $D8             ; 3
    SEC                    ; 2
    SBC    $FB             ; 3
    BCS    LFB93           ; 2³
    LDA    #0              ; 2
LFB93:
    STA    $D8             ; 3
LFB95:
    CLD                    ; 2
    BNE    LFB9E           ; 2³
    STA    $BB             ; 3
    LDA    #$7F            ; 2
    STA    $D1             ; 3
LFB9E:
    RTS                    ; 6

LFB9F:
    LDA    $80             ; 3
    LSR                    ; 2
    BCC    LFBD7           ; 2³
    LDA    $BC             ; 3
    BEQ    LFBD3           ; 2³
    LDA    $EE             ; 3
    EOR    #$01            ; 2
    STA    $EE             ; 3
    LDA    $BB             ; 3
    LDY    $BC             ; 3
    STA    $BC             ; 3
    STY    $BB             ; 3
    LDA    $EC             ; 3
    LDY    $ED             ; 3
    STA    $ED             ; 3
    STY    $EC             ; 3
    LDA    $D8             ; 3
    LDY    $D7             ; 3
    STA    $D7             ; 3
    STY    $D8             ; 3
    LDX    #2              ; 2
LFBC8:
    LDA    $D9,X           ; 4
    LDY    $E4,X           ; 4
    STA    $E4,X           ; 4
    STY    $D9,X           ; 4
    DEX                    ; 2
    BPL    LFBC8           ; 2³
LFBD3:
    LDA    $BC             ; 3
    BNE    LFBDE           ; 2³
LFBD7:
    LDA    $BB             ; 3
    BNE    LFBDE           ; 2³
    STA    $E7             ; 3
    RTS                    ; 6

LFBDE:
    LDA    #0              ; 2
    STA    $D1             ; 3
    STA    $F4             ; 3
    STA    $F3             ; 3
    STA    $F0             ; 3
    STA    $F1             ; 3
    STA    $FA             ; 3
    STA    $E7             ; 3
    STA    $E9             ; 3
    STA    $EA             ; 3
    STA    $EB             ; 3
    STA    $D6             ; 3
    STA    $EF             ; 3
    LDA    $82             ; 3
    AND    #$03            ; 2
    STA    $F5             ; 3
    LDA    #$30            ; 2
    STA    $CE             ; 3
    STA    $CF             ; 3
    STA    $D0             ; 3
    LDY    #$18            ; 2
LFC08:
    CPY    #$1B            ; 2
LFC0A:
    LDA    LFB51,Y         ; 4
    STA.wy $BD,Y           ; 5
    DEY                    ; 2
    BPL    LFC0A           ; 2³
    BCC    LFC2A           ; 2³
    LDA    $80             ; 3
    LSR                    ; 2
    TAX                    ; 2
    LDA    LFCFE,X         ; 4
    STA    $EC             ; 3
    STA    $ED             ; 3
    LSR                    ; 2
    LSR                    ; 2
    TAY                    ; 2
    LDA    LFD02,Y         ; 4
    STA    $BB             ; 3
    STA    $BC             ; 3
LFC2A:
    RTS                    ; 6

LFC2B:
    CMP    #$10            ; 2
    BCC    LFC33           ; 2³
    LDA    #$15            ; 2
    BNE    LFC3B           ; 2³
LFC33:
    CMP    #$0A            ; 2
    BCC    LFC3B           ; 2³
    SBC    #$0A            ; 2
    ADC    #$0F            ; 2
LFC3B:
    CLC                    ; 2
    ADC    #1              ; 2
    RTS                    ; 6

LFC3F:
    LDX    #5              ; 2
LFC41:
    LDY    #2              ; 2
LFC43:
    LDA.wy $CE,Y           ; 4
    CMP    #$30            ; 2
    BEQ    LFC50           ; 2³
    AND    #$0F            ; 2
    EOR    $C7,X           ; 4
    BEQ    LFC77           ; 2³
LFC50:
    DEY                    ; 2
    BPL    LFC43           ; 2³
    DEX                    ; 2
    BPL    LFC41           ; 2³
LFC56:
    LDX    #3              ; 2
    LDA    $EC             ; 3
    LSR                    ; 2
    LSR                    ; 2
    CMP    #8              ; 2
    BCC    LFC62           ; 2³
    LDA    #7              ; 2
LFC62:
    TAY                    ; 2
LFC63:
    LDA    $D1,X           ; 4
    CMP    LFD08,Y         ; 4
    BCS    LFC79           ; 2³
    DEX                    ; 2
    BPL    LFC63           ; 2³
    LDA    $82             ; 3
LFC6F:
    CLC                    ; 2
    ADC    #1              ; 2
    AND    #$03            ; 2
    TAX                    ; 2
    BPL    LFC79           ; 2³
LFC77:
    LDX    #4              ; 2
LFC79:
    LDA    $D1,X           ; 4
    BNE    LFC84           ; 2³
    TXA                    ; 2
    CMP    #4              ; 2
    BEQ    LFC56           ; 2³
    BNE    LFC6F           ; 2³
LFC84:
    STX    $F5             ; 3
    LDA    #0              ; 2
    STA    $D1,X           ; 4
    LDX    #4              ; 2
LFC8C:
    CPX    $F5             ; 3
    BEQ    LFC92           ; 2³
    INC    $D1,X           ; 6
LFC92:
    DEX                    ; 2
    BPL    LFC8C           ; 2³
    LDY    $F5             ; 3
    LDA    LFB38,Y         ; 4
    STA    $B0             ; 3
    LDA    #$70            ; 2
    STA    $C0             ; 3
    LDA    #0              ; 2
    STA    $EF             ; 3
    RTS                    ; 6

LFCA5:
    LDY    #2              ; 2
LFCA7:
    BIT    $DE             ; 3
    BMI    LFCFD           ; 2³
    LDX    $D9             ; 3
    CLC                    ; 2
    SED                    ; 2
LFCAF:
    ADC.wy $D9,Y           ; 4
    STA.wy $D9,Y           ; 5
    LDA    #0              ; 2
    DEY                    ; 2
    BPL    LFCAF           ; 2³
    BCC    LFCD5           ; 2³
    LDY    #$BB            ; 2
    STY    $D9             ; 3
    STY    $DA             ; 3
    STY    $DB             ; 3
    LDA    #5              ; 2
    STA    $E0             ; 3
    LDA    #$1F            ; 2
    STA    $E1             ; 3
    LDA    #0              ; 2
    STA    $D8             ; 3
    STA    $F4             ; 3
    JMP    LFB95           ; 3
LFCD5:
    CPX    $D9             ; 3
    BEQ    LFCFC           ; 2³
    LDA    #5              ; 2
    STA    $E0             ; 3
    LDA    #$1F            ; 2
    STA    $E1             ; 3
    LDA    $D8             ; 3
    LDY    $F4             ; 3
    CPY    #7              ; 2
    BNE    LFCEB           ; 2³
    LDA    $DC             ; 3
LFCEB:
    CLC                    ; 2
    ADC    #$10            ; 2
    BCC    LFCF2           ; 2³
    LDA    #$99            ; 2
LFCF2:
    CPY    #7              ; 2
    BNE    LFCFA           ; 2³
    STA    $DC             ; 3
    BEQ    LFCFC           ; 2³
LFCFA:
    STA    $D8             ; 3
LFCFC:
    CLD                    ; 2
LFCFD:
    RTS                    ; 6

LFCFE:
    .byte $00 ; |        | $FCFE
    .byte $04 ; |     X  | $FCFF
    .byte $08 ; |    X   | $FD00
    .byte $0C ; |    XX  | $FD01
LFD02:
    .byte $70 ; | XXX    | $FD02
    .byte $90 ; |X  X    | $FD03
    .byte $B0 ; |X XX    | $FD04
    .byte $D0 ; |XX X    | $FD05
    .byte $F0 ; |XXXX    | $FD06
    .byte $FF ; |XXXXXXXX| $FD07
LFD08:
    .byte $08 ; |    X   | $FD08
    .byte $07 ; |     XXX| $FD09
    .byte $06 ; |     XX | $FD0A
    .byte $05 ; |     X X| $FD0B
    .byte $04 ; |     X  | $FD0C
    .byte $04 ; |     X  | $FD0D
    .byte $04 ; |     X  | $FD0E
    .byte $04 ; |     X  | $FD0F
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
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $00 ; |        | $FD2A
    .byte $00 ; |        | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $00 ; |        | $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $00 ; |        | $FD31
    .byte $00 ; |        | $FD32
    .byte $00 ; |        | $FD33
    .byte $00 ; |        | $FD34
    .byte $00 ; |        | $FD35
    .byte $00 ; |        | $FD36
    .byte $00 ; |        | $FD37
    .byte $00 ; |        | $FD38
    .byte $00 ; |        | $FD39
    .byte $00 ; |        | $FD3A
    .byte $00 ; |        | $FD3B
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
    .byte $00 ; |        | $FD47
    .byte $00 ; |        | $FD48
    .byte $00 ; |        | $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $00 ; |        | $FD4D
    .byte $00 ; |        | $FD4E
    .byte $00 ; |        | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $00 ; |        | $FD59
    .byte $00 ; |        | $FD5A
    .byte $00 ; |        | $FD5B
    .byte $00 ; |        | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $00 ; |        | $FD60
    .byte $00 ; |        | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
    .byte $00 ; |        | $FD64
    .byte $00 ; |        | $FD65
    .byte $00 ; |        | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $00 ; |        | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $00 ; |        | $FD81
    .byte $00 ; |        | $FD82
    .byte $00 ; |        | $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $00 ; |        | $FD8C
    .byte $00 ; |        | $FD8D
    .byte $00 ; |        | $FD8E
    .byte $00 ; |        | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $00 ; |        | $FD99
    .byte $00 ; |        | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $00 ; |        | $FDA4
    .byte $00 ; |        | $FDA5
    .byte $00 ; |        | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $00 ; |        | $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $00 ; |        | $FDB2
    .byte $00 ; |        | $FDB3
    .byte $00 ; |        | $FDB4
    .byte $00 ; |        | $FDB5
    .byte $00 ; |        | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
    .byte $00 ; |        | $FDBA
    .byte $00 ; |        | $FDBB
    .byte $00 ; |        | $FDBC
    .byte $00 ; |        | $FDBD
    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $00 ; |        | $FDC0
    .byte $00 ; |        | $FDC1
    .byte $00 ; |        | $FDC2
    .byte $00 ; |        | $FDC3
    .byte $00 ; |        | $FDC4
    .byte $00 ; |        | $FDC5
    .byte $00 ; |        | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $00 ; |        | $FDD9
    .byte $00 ; |        | $FDDA
    .byte $00 ; |        | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $00 ; |        | $FDE5
    .byte $00 ; |        | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $00 ; |        | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $00 ; |        | $FDED
    .byte $00 ; |        | $FDEE
    .byte $00 ; |        | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $00 ; |        | $FDF2
    .byte $00 ; |        | $FDF3
    .byte $00 ; |        | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $00 ; |        | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
    .byte $00 ; |        | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $00 ; |        | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF
LFE00:
    .byte $00 ; |        | $FE00
    .byte $7F ; | XXXXXXX| $FE01
    .byte $7D ; | XXXXX X| $FE02
    .byte $7A ; | XXXX X | $FE03
    .byte $77 ; | XXX XXX| $FE04
    .byte $73 ; | XXX  XX| $FE05
    .byte $72 ; | XXX  X | $FE06
    .byte $71 ; | XXX   X| $FE07
    .byte $70 ; | XXX    | $FE08
    .byte $6F ; | XX XXXX| $FE09
    .byte $6E ; | XX XXX | $FE0A
    .byte $6B ; | XX X XX| $FE0B
    .byte $3F ; |  XXXXXX| $FE0C
    .byte $69 ; | XX X  X| $FE0D
    .byte $3B ; |  XXX XX| $FE0E
    .byte $3A ; |  XXX X | $FE0F
    .byte $67 ; | XX  XXX| $FE10
    .byte $34 ; |  XX X  | $FE11
    .byte $32 ; |  XX  X | $FE12
    .byte $65 ; | XX  X X| $FE13
LFE14:
    STA    AUDF0,X         ; 4
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    AND    #$0C            ; 2
    STA    AUDC0,X         ; 4
    LDA    LFE29,X         ; 4
    CPY    #$44            ; 2
    BCC    LFE26           ; 2³
    LDA    #2              ; 2
LFE26:
    STA    AUDV0,X         ; 4
    RTS                    ; 6

LFE29:
    .byte $08 ; |    X   | $FE29
    .byte $0D ; |    XX X| $FE2A
LFE2B:
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $09 ; |    X  X| $FE2D
    .byte $09 ; |    X  X| $FE2E
    .byte $0B ; |    X XX| $FE2F
    .byte $00 ; |        | $FE30
    .byte $0B ; |    X XX| $FE31
    .byte $00 ; |        | $FE32
    .byte $0E ; |    XXX | $FE33
    .byte $0E ; |    XXX | $FE34
    .byte $0B ; |    X XX| $FE35
    .byte $00 ; |        | $FE36
    .byte $0F ; |    XXXX| $FE37
    .byte $0F ; |    XXXX| $FE38
    .byte $0E ; |    XXX | $FE39
    .byte $0E ; |    XXX | $FE3A
    .byte $0B ; |    X XX| $FE3B
    .byte $00 ; |        | $FE3C
    .byte $0B ; |    X XX| $FE3D
    .byte $00 ; |        | $FE3E
    .byte $0F ; |    XXXX| $FE3F
    .byte $0F ; |    XXXX| $FE40
    .byte $13 ; |   X  XX| $FE41
    .byte $13 ; |   X  XX| $FE42
    .byte $12 ; |   X  X | $FE43
    .byte $12 ; |   X  X | $FE44
    .byte $13 ; |   X  XX| $FE45
    .byte $13 ; |   X  XX| $FE46
    .byte $10 ; |   X    | $FE47
    .byte $00 ; |        | $FE48
    .byte $13 ; |   X  XX| $FE49
    .byte $13 ; |   X  XX| $FE4A
    .byte $12 ; |   X  X | $FE4B
    .byte $12 ; |   X  X | $FE4C
    .byte $13 ; |   X  XX| $FE4D
    .byte $00 ; |        | $FE4E
    .byte $13 ; |   X  XX| $FE4F
    .byte $13 ; |   X  XX| $FE50
    .byte $12 ; |   X  X | $FE51
    .byte $11 ; |   X   X| $FE52
    .byte $10 ; |   X    | $FE53
    .byte $10 ; |   X    | $FE54
    .byte $13 ; |   X  XX| $FE55
    .byte $13 ; |   X  XX| $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $0F ; |    XXXX| $FE59
    .byte $00 ; |        | $FE5A
    .byte $10 ; |   X    | $FE5B
    .byte $00 ; |        | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $00 ; |        | $FE5E
    .byte $0F ; |    XXXX| $FE5F
    .byte $00 ; |        | $FE60
    .byte $0F ; |    XXXX| $FE61
    .byte $0E ; |    XXX | $FE62
    .byte $0C ; |    XX  | $FE63
    .byte $00 ; |        | $FE64
    .byte $10 ; |   X    | $FE65
    .byte $10 ; |   X    | $FE66
    .byte $00 ; |        | $FE67
    .byte $00 ; |        | $FE68
    .byte $09 ; |    X  X| $FE69
    .byte $00 ; |        | $FE6A
    .byte $0B ; |    X XX| $FE6B
    .byte $0B ; |    X XX| $FE6C
    .byte $0B ; |    X XX| $FE6D
    .byte $00 ; |        | $FE6E
    .byte $04 ; |     X  | $FE6F
    .byte $04 ; |     X  | $FE70
    .byte $04 ; |     X  | $FE71
    .byte $00 ; |        | $FE72
    .byte $04 ; |     X  | $FE73
    .byte $00 ; |        | $FE74
    .byte $04 ; |     X  | $FE75
    .byte $00 ; |        | $FE76
    .byte $04 ; |     X  | $FE77
    .byte $00 ; |        | $FE78
    .byte $01 ; |       X| $FE79
    .byte $01 ; |       X| $FE7A
    .byte $01 ; |       X| $FE7B
    .byte $01 ; |       X| $FE7C
    .byte $00 ; |        | $FE7D
    .byte $00 ; |        | $FE7E
    .byte $07 ; |     XXX| $FE7F
    .byte $07 ; |     XXX| $FE80
    .byte $07 ; |     XXX| $FE81
    .byte $00 ; |        | $FE82
    .byte $07 ; |     XXX| $FE83
    .byte $07 ; |     XXX| $FE84
    .byte $07 ; |     XXX| $FE85
    .byte $00 ; |        | $FE86
    .byte $09 ; |    X  X| $FE87
    .byte $09 ; |    X  X| $FE88
    .byte $09 ; |    X  X| $FE89
    .byte $00 ; |        | $FE8A
    .byte $01 ; |       X| $FE8B
    .byte $01 ; |       X| $FE8C
    .byte $01 ; |       X| $FE8D
    .byte $00 ; |        | $FE8E
LFE8F:
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $04 ; |     X  | $FE93
    .byte $04 ; |     X  | $FE94
    .byte $04 ; |     X  | $FE95
    .byte $00 ; |        | $FE96
    .byte $04 ; |     X  | $FE97
    .byte $00 ; |        | $FE98
    .byte $04 ; |     X  | $FE99
    .byte $00 ; |        | $FE9A
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $07 ; |     XXX| $FEA3
    .byte $07 ; |     XXX| $FEA4
    .byte $07 ; |     XXX| $FEA5
    .byte $00 ; |        | $FEA6
    .byte $07 ; |     XXX| $FEA7
    .byte $07 ; |     XXX| $FEA8
    .byte $07 ; |     XXX| $FEA9
    .byte $00 ; |        | $FEAA
    .byte $09 ; |    X  X| $FEAB
    .byte $09 ; |    X  X| $FEAC
    .byte $09 ; |    X  X| $FEAD
    .byte $00 ; |        | $FEAE
    .byte $01 ; |       X| $FEAF
    .byte $01 ; |       X| $FEB0
    .byte $01 ; |       X| $FEB1
    .byte $00 ; |        | $FEB2
    .byte $07 ; |     XXX| $FEB3
    .byte $07 ; |     XXX| $FEB4
    .byte $07 ; |     XXX| $FEB5
    .byte $07 ; |     XXX| $FEB6
    .byte $07 ; |     XXX| $FEB7
    .byte $07 ; |     XXX| $FEB8
    .byte $06 ; |     XX | $FEB9
    .byte $06 ; |     XX | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $01 ; |       X| $FEC3
    .byte $01 ; |       X| $FEC4
    .byte $01 ; |       X| $FEC5
    .byte $01 ; |       X| $FEC6
    .byte $01 ; |       X| $FEC7
    .byte $01 ; |       X| $FEC8
    .byte $04 ; |     X  | $FEC9
    .byte $04 ; |     X  | $FECA
    .byte $00 ; |        | $FECB
    .byte $00 ; |        | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $00 ; |        | $FED8
    .byte $00 ; |        | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $00 ; |        | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $00 ; |        | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
    .byte $00 ; |        | $FEEA
    .byte $00 ; |        | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $00 ; |        | $FF03
    .byte $00 ; |        | $FF04
    .byte $00 ; |        | $FF05
    .byte $00 ; |        | $FF06
    .byte $00 ; |        | $FF07
    .byte $00 ; |        | $FF08
    .byte $00 ; |        | $FF09
    .byte $00 ; |        | $FF0A
    .byte $00 ; |        | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $00 ; |        | $FF0D
    .byte $00 ; |        | $FF0E
    .byte $00 ; |        | $FF0F
    .byte $00 ; |        | $FF10
    .byte $00 ; |        | $FF11
    .byte $00 ; |        | $FF12
    .byte $00 ; |        | $FF13
    .byte $00 ; |        | $FF14
    .byte $00 ; |        | $FF15
    .byte $00 ; |        | $FF16
    .byte $00 ; |        | $FF17
    .byte $00 ; |        | $FF18
    .byte $00 ; |        | $FF19
    .byte $00 ; |        | $FF1A
    .byte $00 ; |        | $FF1B
    .byte $00 ; |        | $FF1C
    .byte $00 ; |        | $FF1D
    .byte $00 ; |        | $FF1E
    .byte $00 ; |        | $FF1F
    .byte $00 ; |        | $FF20
    .byte $00 ; |        | $FF21
    .byte $00 ; |        | $FF22
    .byte $00 ; |        | $FF23
    .byte $00 ; |        | $FF24
    .byte $00 ; |        | $FF25
    .byte $00 ; |        | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $00 ; |        | $FF29
    .byte $00 ; |        | $FF2A
    .byte $00 ; |        | $FF2B
    .byte $00 ; |        | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $00 ; |        | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $00 ; |        | $FF30
    .byte $00 ; |        | $FF31
    .byte $00 ; |        | $FF32
    .byte $00 ; |        | $FF33
    .byte $00 ; |        | $FF34
    .byte $00 ; |        | $FF35
    .byte $00 ; |        | $FF36
    .byte $00 ; |        | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $00 ; |        | $FF3B
    .byte $00 ; |        | $FF3C
    .byte $00 ; |        | $FF3D
    .byte $00 ; |        | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $00 ; |        | $FF40
    .byte $00 ; |        | $FF41
    .byte $00 ; |        | $FF42
    .byte $00 ; |        | $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
    .byte $00 ; |        | $FF46
    .byte $00 ; |        | $FF47
    .byte $00 ; |        | $FF48
    .byte $00 ; |        | $FF49
    .byte $00 ; |        | $FF4A
    .byte $00 ; |        | $FF4B
    .byte $00 ; |        | $FF4C
    .byte $00 ; |        | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
    .byte $00 ; |        | $FF58
    .byte $00 ; |        | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
    .byte $00 ; |        | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $00 ; |        | $FF6F
    .byte $00 ; |        | $FF70
    .byte $00 ; |        | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $00 ; |        | $FF77
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
    .byte $00 ; |        | $FF84
    .byte $00 ; |        | $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $00 ; |        | $FF88
    .byte $00 ; |        | $FF89
    .byte $00 ; |        | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $00 ; |        | $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $00 ; |        | $FF8F
    .byte $00 ; |        | $FF90
    .byte $00 ; |        | $FF91
    .byte $00 ; |        | $FF92
    .byte $00 ; |        | $FF93
    .byte $00 ; |        | $FF94
    .byte $00 ; |        | $FF95
    .byte $00 ; |        | $FF96
    .byte $00 ; |        | $FF97
    .byte $00 ; |        | $FF98
    .byte $00 ; |        | $FF99
    .byte $00 ; |        | $FF9A
    .byte $00 ; |        | $FF9B
    .byte $00 ; |        | $FF9C
    .byte $00 ; |        | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $00 ; |        | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $00 ; |        | $FFA2
    .byte $00 ; |        | $FFA3
    .byte $00 ; |        | $FFA4
    .byte $00 ; |        | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $00 ; |        | $FFA8
    .byte $00 ; |        | $FFA9
    .byte $00 ; |        | $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $00 ; |        | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $00 ; |        | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $00 ; |        | $FFBE
    .byte $00 ; |        | $FFBF
    .byte $00 ; |        | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $00 ; |        | $FFC2
    .byte $00 ; |        | $FFC3
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $00 ; |        | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $00 ; |        | $FFCA
    .byte $00 ; |        | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
    .byte $00 ; |        | $FFD2
    .byte $4C ; | X  XX  | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $F3 ; |XXXX  XX| $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $00 ; |        | $FFDE
    .byte $00 ; |        | $FFDF

LFFE0:
    STA    LFFF8           ; 4
    JSR    $D003           ; 6

    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
LFFF8:
    .byte $00 ; |        | $FFF8
LFFF9:
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

      RORG $FFFC

    .word START_2, START_2
