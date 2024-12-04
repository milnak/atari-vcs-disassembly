; Disassembly of tug.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line:    C:\DISTELLA.EXE -pasfcTUG.cfg TUG.bin
;
; TUG.cfg contents:
;
;      ORG F000
;      CODE F000 FB67
;      GFX FB68 FBF2
;      DATA FBF3 FBF4
;      CODE FBF5 FC10
;      GFX FC11 FD3E
;      DATA FD3F FD46
;      GFX FD47 FDFD
;      CODE FDFE FF1A
;      DATA FF1B FF1E
;      CODE FF1F FF35
;      GFX FF36 FFEA
;      CODE FFEB FFF7
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
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
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
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXM1P   =  $31
CXP1FB  =  $33
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;==================================================================================================
;              USER CONSTANTS
;==================================================================================================
TIME_VBLANK     = $20
TIME_OVERSCAN   = $40

;NUSIZx
DOUBLE_SIZE     = $05

;ball size
TWO_CLOCKS      = $10

;colors
COLOR_LOGO      = $47
COLOR_DEMO_P_R  = $0F

BLACK           = $00
VIOLET          = $78
BEIGE           = $3C
BROWN           = $2C
;==================================================================================================
;              RAM LOCATIONS
;==================================================================================================

scoreBCD        = $82 ; $82 - $84
largeCounter    = $B7

colorP0         = $DE
colorP1         = $DF

frameCounter    = $F8

;==================================================================================================
;              MAIN PROGRAM
;==================================================================================================

    ORG $F000

START:
    SEI
    CLD
    LDA    #0
    TAX
.loopClear:
    STA    0,X
    TXS
    STX    $D0
    INX
    BNE    .loopClear
    JSR    LFFEB           ; 6
    STA    $BA             ; 3   #$96

MainLoop:
    LDA    #TIME_OVERSCAN  ; 2
    STA    TIM64T          ; 4
    LDY    #2              ; 2
    STY    VBLANK          ; 3   start Vblank
    LDA    SWCHB           ; 4   console swicthes
    LSR                    ; 2   checking reset switch
    BCS    .noReset        ; 2³  branch if not pressed

;reset is pressed
    LDX    #5              ; 2
    LDA    #0              ; 2
.loopRamClear:
    STA    $82,X           ; 4   clear $82 to $87
    DEX                    ; 2
    BPL    .loopRamClear   ; 2³
    STX    $D0             ; 3   X is equal to #$FF
    STX    $D1             ; 3
    LDA    #$81            ; 2
    STA    $F2             ; 3
    LDA    #4              ; 2
    STA    $81             ; 3
    STA    $B8             ; 3
    STA    $B9             ; 3
    LDA    #$24            ; 2
    STA    $AF             ; 3
    LDA    $F7             ; 3
    LSR                    ; 2
    STA    $BE             ; 3
    STA    $BF             ; 3
LF045:
    JSR    LFE4C           ; 6
    JSR    LFF1F           ; 6
    LDA    $80             ; 3
    ORA    #$80            ; 2
    STA    $80             ; 3
    JMP    WaitOverscan    ; 3

.noReset:
    BIT    $80             ; 3
    BMI    LF0B0           ; 2³   if between $80 and $FF
    BVS    LF074           ; 2³
    DEC    $8A             ; 5
    LDA    $8A             ; 3
    BNE    LF066           ; 2³
    LDA    $80             ; 3
    ORA    #$01            ; 2
    STA    $80             ; 3
LF066:
    DEC    $88             ; 5
    BIT    CXP1FB          ; 3
    BPL    LF074           ; 2³
    LDA    $80             ; 3
    AND    #$FE            ; 2
    ORA    #$40            ; 2
    STA    $80             ; 3
LF074:
    LDX    #$68            ; 2   intial color of chasing ufo
    BIT    $80             ; 3
    BVC    LF08E           ; 2³
    INC    $8A             ; 5
    BIT    CXPPMM          ; 3
    BMI    LF045           ; 2³
    LDA    $F8             ; 3
    AND    #$0F            ; 2
    BEQ    LF088           ; 2³
    INC    $88             ; 5
LF088:
    AND    #$08            ; 2
    BNE    LF08E           ; 2³
    LDX    #$2D            ; 2   flashing color of ufo
LF08E:
    STX    $8C             ; 3
    LDX    #0              ; 2
    LDA    $80             ; 3
    LSR                    ; 2
    BCC    LF099           ; 2³
    LDX    #8              ; 2
LF099:
    STX    $8D             ; 3
    LDA    $88             ; 3
    JSR    LFE85           ; 6
    STY    $88             ; 3
    STA    $89             ; 3
    LDA    $8A             ; 3
    JSR    LFE85           ; 6
    STY    $8A             ; 3
    STA    $8B             ; 3
    JMP    WaitOverscan    ; 3

LF0B0:
    INC    $F8             ; 5
    LSR                    ; 2   test "A"
    BCS    LF0D6           ; 2³
    LDA    $AF             ; 3
    AND    #$02            ; 2
    BNE    LF0D6           ; 2³
    LDA    #$80            ; 2
    STA    $C7             ; 3
    INC    $F7             ; 5
    LDA    $F7             ; 3
    CMP    #$10            ; 2
    BCC    LF0CB           ; 2³
    LDA    #0              ; 2
    STA    $F7             ; 3
LF0CB:
    LSR                    ; 2
    STA    $BE             ; 3
    STA    $BF             ; 3
    LDA    $AF             ; 3
    ORA    #$40            ; 2
    STA    $AF             ; 3
LF0D6:
    LDA    $AF             ; 3
    ORA    #$02            ; 2
    STA    $AF             ; 3
    LDA    SWCHB           ; 4
    AND    #$02            ; 2   Game Select
    EOR    $AF             ; 3
    STA    $AF             ; 3
    AND    #$04            ; 2
    BNE    LF0FD           ; 2³
    LDA    $F8             ; 3
    BNE    LF0FA           ; 2³
    INC    $B7             ; 5
    LDX    #4              ; 2
    CPX    $B7             ; 3
    BCS    LF0FA           ; 2³
    STA    $B7             ; 3   $B7 value is now 5
    JSR    LFFEB           ; 6   start other man chased by ufo demo
LF0FA:
    JMP    WaitOverscan    ; 3

LF0FD:
    LDX    #0              ; 2
    BIT    $AF             ; 3
    BVC    LF11C           ; 2³
    BPL    LF106           ; 2³
    INX                    ; 2
LF106:
    LDA    INPT4,X         ; 4
    BMI    LF153           ; 2³
    LDA    $B8,X           ; 4
    STA    $81             ; 3
    LDA    $AF             ; 3
    ORA    #$20            ; 2
    AND    #$BF            ; 2
    STA    $AF             ; 3
    JSR    LFE4C           ; 6
    JMP    WaitOverscan    ; 3

LF11C:
    LDA    $B6             ; 3
    JSR    LFE85           ; 6
    STA    $B5             ; 3
    BIT    $F2             ; 3
    BMI    LF153           ; 2³
    LDA    $AF             ; 3
    AND    #$20            ; 2
    BEQ    LF156           ; 2³
    LDA    $F2             ; 3
    ORA    #$41            ; 2
    STA    $F2             ; 3
    LDA    $F9             ; 3
    AND    #$7F            ; 2
    STA    $F9             ; 3
    STA    CXCLR           ; 3
    LDA    #$1C            ; 2
    STA    $F5             ; 3
    INC    $B6             ; 5
    LDA    #$40            ; 2
    CMP    $B6             ; 3
    BCS    LF153           ; 2³
    LDA    $AF             ; 3
    AND    #$DF            ; 2
    STA    $AF             ; 3
    LDA    #0              ; 2
    STA    $C7             ; 3
    STA    $AD             ; 3
LF153:
    JMP    WaitOverscan    ; 3

LF156:
    BIT    $F9             ; 3
    BPL    LF16C           ; 2³
    INC    $AB             ; 5
    LDX    $AB             ; 3
    CPX    #$72            ; 2
    BCS    LF1BA           ; 2³
    JSR    LFE75           ; 6
    BIT    CXP1FB          ; 3
    BMI    LF1BA           ; 2³
    JMP    WaitOverscan    ; 3

LF16C:
    LDA    $F8             ; 3
    AND    #$3F            ; 2
    BNE    LF180           ; 2³
    LDA    $D2             ; 3
    AND    #$20            ; 2
    BEQ    LF17C           ; 2³
    DEC    $B6             ; 5
    BEQ    LF1BA           ; 2³
LF17C:
    DEC    $B6             ; 5
    BEQ    LF1BA           ; 2³
LF180:
    BIT    CXPPMM          ; 3
    BPL    LF1B2           ; 2³
    LDA    $D2             ; 3
    AND    #$08            ; 2
    BEQ    LF1BA           ; 2³
    LDA    $AB             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    ASL                    ; 2
    EOR    #$07            ; 2
    TAX                    ; 2
    LDA    #$6D            ; 2
    STA    $90,X           ; 4
    LDA    $C3,X           ; 4
    ADC    #$47            ; 2
    CMP    #$A0            ; 2
    BCC    LF1A3           ; 2³
    LDA    #$37            ; 2
LF1A3:
    STA    $C3,X           ; 4
    LDA    #5              ; 2
    STA    $CD             ; 3
    LDA    $F2             ; 3
    ORA    #$11            ; 2
    STA    $F2             ; 3
    JSR    LFECF           ; 6
LF1B2:
    BIT    CXM0P           ; 3
    BMI    LF1BA           ; 2³
    BIT    CXM1P           ; 3
    BVC    LF1F0           ; 2³
LF1BA:
    LDA    $AF             ; 3
    ORA    #$40            ; 2
    STA    $AF             ; 3
    LDA    $F2             ; 3
    ORA    #$21            ; 2
    STA    $F2             ; 3
    LDX    #0              ; 2
    LDA    $AF             ; 3
    BPL    LF1CD           ; 2³
    INX                    ; 2
LF1CD:
    DEC    $B8,X           ; 6
    LDA    $F7             ; 3
    LSR                    ; 2
    BCC    LF1E6           ; 2³
    TXA                    ; 2
    EOR    #$01            ; 2
    TAX                    ; 2
    LDA    $B8,X           ; 4
    BEQ    LF1E2           ; 2³
    LDA    $AF             ; 3
    EOR    #$80            ; 2
    STA    $AF             ; 3
LF1E2:
    LDA    $B9             ; 3
    BNE    LF1F0           ; 2³
LF1E6:
    LDA    $B8             ; 3
    BNE    LF1F0           ; 2³
    LDA    $AF             ; 3
    AND    #$FB            ; 2
    STA    $AF             ; 3
LF1F0:
    LDY    $CF             ; 3
    INC    $D3             ; 5
    LDA    $D3             ; 3
    CMP    LFFB5,Y         ; 4
    BCS    LF1FE           ; 2³
    JMP    LF35E           ; 3

LF1FE:
    LDA    #0              ; 2
    STA    $D3             ; 3
    LDA    $D2             ; 3
    AND    #$20            ; 2
    BNE    LF247           ; 2³
    LDX    $AB             ; 3
    CPX    #$71            ; 2
    BCC    LF214           ; 2³
    JSR    LFB30           ; 6
    JMP    LF2D5           ; 3

LF214:
    STA    $B2             ; 3
    STA    $B4             ; 3
    LDX    #7              ; 2
    STX    $B3             ; 3
    LDA    $AE             ; 3
    SEC                    ; 2
    SBC    #3              ; 2
    BCC    LF22E           ; 2³
    BEQ    LF237           ; 2³
LF225:
    INC    $B2             ; 5
    SEC                    ; 2
    SBC    #$14            ; 2
    BEQ    LF237           ; 2³
    BCS    LF225           ; 2³
LF22E:
    LDA    $F6             ; 3
    AND    #$F3            ; 2
    STA    $F6             ; 3
    JMP    LF2D5           ; 3

LF237:
    LDA    $F6             ; 3
    AND    #$FC            ; 2
    STA    $F6             ; 3
    LDA    $AB             ; 3
    BNE    LF24A           ; 2³
    LDA    $F6             ; 3
    ORA    #$01            ; 2
    STA    $F6             ; 3
LF247:
    JMP    LF2D5           ; 3

LF24A:
    SEC                    ; 2
    SBC    #2              ; 2
    BCC    LF247           ; 2³
    BEQ    LF267           ; 2³
LF251:
    DEC    $B3             ; 5
    SEC                    ; 2
    SBC    #$10            ; 2
    BCC    LF2D5           ; 2³
    BNE    LF251           ; 2³
    LDA    $B3             ; 3
    BNE    LF267           ; 2³
    LDA    $F6             ; 3
    EOR    #$0E            ; 2
    STA    $F6             ; 3
    JMP    LF2D5           ; 3

LF267:
    LDA    $B2             ; 3
    CMP    #4              ; 2
    BCC    LF26F           ; 2³
    EOR    #$07            ; 2
LF26F:
    TAY                    ; 2
    LDX    $B3             ; 3
    LDA    $A2,X           ; 4
LF274:
    LSR                    ; 2
    ROR    $B4             ; 5
    DEY                    ; 2
    BPL    LF274           ; 2³
    LDA    $B4             ; 3
    CMP    #$40            ; 2
    BCC    LF2D5           ; 2³
    CMP    #$C0            ; 2
    BCC    LF290           ; 2³
    BIT    $F6             ; 3
    BVS    LF2D5           ; 2³
    LDA    $F6             ; 3
    EOR    #$0F            ; 2
    STA    $F6             ; 3
    BVC    LF2D5           ; 2³
LF290:
    BIT    $F6             ; 3
    BVS    LF2AB           ; 2³
    LDA    $F6             ; 3
    EOR    #$06            ; 2
    BPL    LF29C           ; 2³
    EOR    #$03            ; 2
LF29C:
    STA    $F6             ; 3
    AND    #$20            ; 2
    BEQ    LF2A8           ; 2³
    LDA    $F6             ; 3
    EOR    #$0C            ; 2
    STA    $F6             ; 3
LF2A8:
    JMP    LF2D5           ; 3

LF2AB:
    LDY    $B2             ; 3
    CPY    #4              ; 2
    BCC    LF2B7           ; 2³
    LDA    #$C0            ; 2
    EOR    $B4             ; 3
    STA    $B4             ; 3
LF2B7:
    BIT    $B4             ; 3
    BPL    LF2C7           ; 2³
    LDA    $F6             ; 3
    EOR    #$09            ; 2
    ORA    #$10            ; 2
    BPL    LF2C5           ; 2³
    EOR    #$13            ; 2
LF2C5:
    STA    $F6             ; 3
LF2C7:
    BVC    LF2D5           ; 2³
    LDA    $F6             ; 3
    EOR    #$05            ; 2
    AND    #$EF            ; 2
    BPL    LF2D3           ; 2³
    EOR    #$13            ; 2
LF2D3:
    STA    $F6             ; 3
LF2D5:
    LDA    $D2             ; 3
    AND    #$20            ; 2
    BEQ    .checkJoystick  ; 2³
    LDX    #0              ; 2
    LDA    $AB             ; 3
    BNE    LF2E2           ; 2³
    INX                    ; 2
LF2E2:
    STX    $F6             ; 3
.checkJoystick:
    LDA    SWCHA           ; 4
    BIT    $AF             ; 3   test
    BMI    LF2EF           ; 2³  if high bit is set branch (player zero)
    LSR                    ; 2   otherwise move to check player one
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
LF2EF:
    ORA    $F6             ; 3   what is $F6 for?
    AND    #$0F            ; 2   keep only low nybble
    CMP    #$0F            ; 2   is equal to fifteen?
    BEQ    LF34F           ; 2³+1   yes, branch
    LSR                    ; 2
    BCS    LF307           ; 2³+1
    DEC    $AB             ; 5
    LDA    $F6             ; 3
    ORA    #$4F            ; 2
    AND    #$7F            ; 2
    STA    $F6             ; 3
    JMP    LF341           ; 3

LF307:
    LSR                    ; 2
    BCS    LF315           ; 2³
    INC    $AB             ; 5
    LDA    $F6             ; 3
    ORA    #$CF            ; 2
    STA    $F6             ; 3
    JMP    LF341           ; 3

LF315:
    LSR                    ; 2
    BCS    LF328           ; 2³
    DEC    $AE             ; 5
    LDA    $F6             ; 3
    ORA    #$2F            ; 2
    AND    #$BF            ; 2
    STA    $F6             ; 3
    JSR    LFE38           ; 6
    JMP    LF338           ; 3

LF328:
    LSR                    ; 2
    BCS    LF341           ; 2³
    INC    $AE             ; 5
    LDA    $F6             ; 3
    ORA    #$0F            ; 2
    AND    #$9F            ; 2
    STA    $F6             ; 3
    JSR    LFE38           ; 6
LF338:
    LDA    $AE             ; 3
    JSR    LFE85           ; 6
    STA    $C0             ; 3
    STY    $AE             ; 3
LF341:
    LDA    $F2             ; 3
    ORA    #$05            ; 2
    STA    $F2             ; 3
    LDA    #$4A            ; 2
    STA    $9E             ; 3
    LDA    #$77            ; 2
    BNE    LF355           ; 2³
LF34F:
    LDA    #$74            ; 2
    STA    $9E             ; 3
    LDA    #$4D            ; 2
LF355:
    LDX    #$8E            ; 2
    STX    $B0             ; 3
    LDX    $AB             ; 3
    JSR    LFDFE           ; 6
LF35E:
    LDA    $D2             ; 3
    AND    #$20            ; 2
    BNE    LF398           ; 2³
    LDA    $AF             ; 3
    AND    #$08            ; 2
    BNE    LF398           ; 2³
    LDA    $AB             ; 3
    CMP    #$72            ; 2
    BCS    LF398           ; 2³
    BIT    CXP1FB          ; 3
    BMI    LF398           ; 2³
    LDA    $AB             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    EOR    #$07            ; 2
    TAX                    ; 2
    LDA    $B2             ; 3
    SEC                    ; 2
    SBC    #1              ; 2
    CMP    #4              ; 2
    BCC    LF38A           ; 2³
    ADC    #0              ; 2
    EOR    #$07            ; 2
LF38A:
    TAY                    ; 2
    LDA    $A2,X           ; 4
    AND    LFFCF,Y         ; 4
    BNE    LF398           ; 2³
    LDA    $F9             ; 3
    ORA    #$80            ; 2
    STA    $F9             ; 3
LF398:
    LDX    #$1C            ; 2
    LDA    $B6             ; 3
    CMP    #$10            ; 2
    BCS    LF3AE           ; 2³
    LDA    $F2             ; 3
    ORA    #$09            ; 2
    STA    $F2             ; 3
    LDA    $F8             ; 3
    AND    #$10            ; 2
    BNE    LF3AE           ; 2³
    LDX    #0              ; 2
LF3AE:
    STX    $F5             ; 3
    LDY    $CF             ; 3
    INC    $D4             ; 5
    LDA    LFFDB,Y         ; 4
    STA    $BB             ; 3
    LDA    $D4             ; 3
    CMP    LFFBD,Y         ; 4
    BCC    LF421           ; 2³+1
    LDA    #0              ; 2
    STA    $D4             ; 3
    LDX    #8              ; 2
LF3C6:
    LDA    $C2,X           ; 4
    AND    #$2F            ; 2
    BNE    LF3DA           ; 2³
    JSR    LFEC4           ; 6
    LSR                    ; 2
    LDA    $C3,X           ; 4
    ORA    #$01            ; 2
    BCS    LF3D8           ; 2³
    EOR    #$01            ; 2
LF3D8:
    STA    $C3,X           ; 4
LF3DA:
    LDA    $C3,X           ; 4
    LSR                    ; 2
    BCC    LF3E4           ; 2³
    DEC    $C2,X           ; 6
    JMP    LF3E6           ; 3

LF3E4:
    INC    $C2,X           ; 6
LF3E6:
    LDA    $C2,X           ; 4
    JSR    LFE85           ; 6
    STA    $97,X           ; 4
    STY    $C2,X           ; 4
    LDA    $C2,X           ; 4
    AND    #$1F            ; 2
    BNE    LF41D           ; 2³+1
    JSR    LFEC4           ; 6
    AND    $BB             ; 3
    STA    $F0             ; 3
    LDA    $D2             ; 3
    AND    #$08            ; 2
    TAY                    ; 2
    LDA    $8F,X           ; 4
    CPY    #1              ; 2
    BCS    LF413           ; 2³
    BIT    $BA             ; 3
    BPL    LF413           ; 2³
    SBC    $F0             ; 3
    CMP    #$27            ; 2
    BCS    LF41B           ; 2³
    ADC    #2              ; 2
LF413:
    ADC    $F0             ; 3
    CMP    #$37            ; 2
    BCC    LF41B           ; 2³
    LDA    #$30            ; 2
LF41B:
    STA    $8F,X           ; 4
LF41D:
    DEX                    ; 2
    DEX                    ; 2
    BNE    LF3C6           ; 2³+1
LF421:
    LDA    $D2             ; 3
    AND    #$10            ; 2
    BEQ    LF43C           ; 2³
    LDA    $AB             ; 3
    CMP    #$72            ; 2
    BNE    LF439           ; 2³
    LDA    $AF             ; 3
    ORA    #$20            ; 2
    STA    $AF             ; 3
    LDA    $D2             ; 3
    AND    #$C7            ; 2
    STA    $D2             ; 3
LF439:
    JMP    LF4D7           ; 3

LF43C:
    LDX    $AB             ; 3
    BNE    LF439           ; 2³
    LDX    #0              ; 2
    LDA    $AF             ; 3
    BPL    LF447           ; 2³
    INX                    ; 2
LF447:
    LDY    $B2             ; 3
    LDA    $D0,X           ; 4
    AND    LFF8A,Y         ; 4
    BEQ    LF439           ; 2³
    LDA    $F2             ; 3
    ORA    #$11            ; 2
    STA    $F2             ; 3
    LDA    $F9             ; 3
    ORA    #$40            ; 2
    STA    $F9             ; 3
    LDA    LFF8A,Y         ; 4
    EOR    #$FF            ; 2
    AND    $D0,X           ; 4
    STA    $D0,X           ; 4
    LDA    LFD3F,Y         ; 4
    STA    $CD             ; 3
    LDA    $D2             ; 3
    ORA    #$10            ; 2
    STA    $D2             ; 3
    CPY    #1              ; 2
    BEQ    LF4D1           ; 2³
    CPY    #4              ; 2
    BEQ    LF4D1           ; 2³
    CPY    #6              ; 2
    BEQ    LF4D1           ; 2³
    CPY    #0              ; 2
    BEQ    LF490           ; 2³
    CPY    #7              ; 2
    BEQ    LF490           ; 2³
    CPY    #3              ; 2
    BEQ    LF490           ; 2³
    LDA    $D2             ; 3
    ORA    #$28            ; 2
    STA    $D2             ; 3
    BNE    LF4CB           ; 2³
LF490:
    LDA    $D2             ; 3
    ORA    #$08            ; 2
    STA    $D2             ; 3
    LDA    $D0,X           ; 4
    AND    #$91            ; 2
    BNE    LF4CB           ; 2³
    LDA    $AF             ; 3
    ORA    #$20            ; 2
    STA    $AF             ; 3
    LDA    #$FF            ; 2
    STA    $D0,X           ; 4
    LDA    $BE,X           ; 4
    CMP    #7              ; 2
    BCS    LF4B2           ; 2³
    INC    $BE,X           ; 6
    LDA    $BE,X           ; 4   X is equal to 0 or 1, therefore $BE or $BF
    STA    $CF             ; 3
LF4B2:
    LDA    $B8,X           ; 4
    CMP    #4              ; 2
    BCS    LF4BE           ; 2³
    ADC    #1              ; 2
    STA    $B8,X           ; 4
    STA    $81             ; 3
LF4BE:
    LDA    #$30            ; 2
    STA    $CD             ; 3
    JSR    LFFEB           ; 6
    LDA    $F2             ; 3
    ORA    #$81            ; 2
    STA    $F2             ; 3
LF4CB:
    LDA    $F9             ; 3
    AND    #$BF            ; 2
    STA    $F9             ; 3
LF4D1:
    JSR    LFECF           ; 6
    JMP    WaitOverscan    ; 3

LF4D7:
    LDA    $F8             ; 3
    AND    #$07            ; 2
    BNE    LF4FB           ; 2³
    BIT    $BA             ; 3
    BVC    LF4EF           ; 2³
    LDA    $D2             ; 3
    AND    #$02            ; 2
    BNE    LF4ED           ; 2³
    LDA    $D2             ; 3
    ORA    #$81            ; 2
    STA    $D2             ; 3
LF4ED:
    BNE    LF4FB           ; 2³
LF4EF:
    LDA    $D2             ; 3
    AND    #$04            ; 2
    BNE    LF4FB           ; 2³
    LDA    $D2             ; 3
    ORA    #$41            ; 2
    STA    $D2             ; 3
LF4FB:
    LDY    $CF             ; 3
    INC    $D5             ; 5
    LDA    $D5             ; 3
    CMP    LFFE3,Y         ; 4
    BCC    LF542           ; 2³
    LDA    #0              ; 2
    STA    $D5             ; 3
    LDA    $D2             ; 3
    STA    $E0             ; 3
    LSR    $E0             ; 5
    BCC    LF578           ; 2³
    LDX    #1              ; 2
    STX    $E1             ; 3
LF516:
    LDX    $E1             ; 3
    LSR    $E0             ; 5
    BCC    LF53E           ; 2³
    LDA    LFF1D,X         ; 4
    STA    $B0             ; 3
    LDA    $D8,X           ; 4
    TAX                    ; 2
    LDA    #$C1            ; 2
    JSR    LFDFE           ; 6
    LDX    $E1             ; 3
    INC    $D8,X           ; 6
    LDA    $D8,X           ; 4
    CMP    #$7E            ; 2
    BCC    LF53E           ; 2³
    LDA    LFF1B,X         ; 4
    AND    $D2             ; 3
    STA    $D2             ; 3
    LDA    #0              ; 2
    STA    $D8,X           ; 4
LF53E:
    DEC    $E1             ; 5
    BPL    LF516           ; 2³
LF542:
    LDA    $F8             ; 3
    AND    #$0F            ; 2
    BNE    LF578           ; 2³
    LDX    #1              ; 2
LF54A:
    LDA    $D2             ; 3
    AND    LFFC7,X         ; 4
    BEQ    LF571           ; 2³
    INC    $D6,X           ; 6
    LDA    $D6,X           ; 4
    CMP    #$0A            ; 2
    BCC    LF56B           ; 2³
    LDA    $DC,X           ; 4
    STA    $BC,X           ; 4
    LDA    #0              ; 2
    STA    $D6,X           ; 4
    LDA    $D2             ; 3
    AND    LFFC9,X         ; 4
    ORA    LFFCB,X         ; 4
    STA    $D2             ; 3
LF56B:
    LDA    #$0F            ; 2
    CMP    $DE,X           ; 4
    BNE    LF573           ; 2³
LF571:
    LDA    #$3A            ; 2
LF573:
    STA    $DE,X           ; 4
    DEX                    ; 2
    BPL    LF54A           ; 2³
LF578:
    LDA    $F8             ; 3
    AND    #$03            ; 2
    BNE    LF5B0           ; 2³
    LDX    #1              ; 2
LF580:
    LDA    $DA,X           ; 4
    AND    #$1F            ; 2
    BNE    LF594           ; 2³
    LDA    LFFC5,X         ; 4
    ORA    $F9             ; 3
    BIT    $BA             ; 3
    BVC    LF592           ; 2³
    EOR    LFFC5,X         ; 4
LF592:
    STA    $F9             ; 3
LF594:
    INC    $DA,X           ; 6
    LDA    $F9             ; 3
    AND    LFFC5,X         ; 4
    BNE    LF5A1           ; 2³
    DEC    $DA,X           ; 6
    DEC    $DA,X           ; 6
LF5A1:
    LDA    $DA,X           ; 4
    JSR    LFE85           ; 6
    STA    $DC,X           ; 4
    STY    $DA,X           ; 4
    JSR    LFEC4           ; 6
    DEX                    ; 2
    BPL    LF580           ; 2³
LF5B0:
    LDA    $F8             ; 3
    AND    #$3F            ; 2
    BNE    LF5CB           ; 2³
    LDY    $CF             ; 3
    INC    $AD             ; 5
    LDA    LFFD3,Y         ; 4
    CMP    $AD             ; 3
    BCS    LF5CB           ; 2³
    LDA    #0              ; 2
    STA    $AD             ; 3
    LDA    $AF             ; 3
    ORA    #$10            ; 2
    STA    $AF             ; 3
LF5CB:
    LDA    $AF             ; 3
    AND    #$10            ; 2
    BEQ    LF5F2           ; 2³
LF5D1:
    JSR    LFEC4           ; 6
    AND    #$07            ; 2
    BEQ    LF5D1           ; 2³
    TAX                    ; 2
    STA    $C1             ; 3
    JSR    LFEC4           ; 6
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    $A2,X           ; 4
    AND    LFFCF,Y         ; 4
    BEQ    LF5D1           ; 2³
    STY    $C2             ; 3
    LDA    $AF             ; 3
    AND    #$EF            ; 2
    ORA    #$08            ; 2
    STA    $AF             ; 3
LF5F2:
    LDA    $AF             ; 3
    AND    #$08            ; 2
    BEQ    LF642           ; 2³+1
    LDA    $F8             ; 3
    AND    #$0F            ; 2
    BNE    LF609           ; 2³+1
    LDX    $C1             ; 3
    LDA    $A2,X           ; 4
    LDY    $C2             ; 3
    EOR    LFFCF,Y         ; 4
    STA    $A2,X           ; 4
LF609:
    LDA    $AC             ; 3
    CMP    #6              ; 2
    BCS    LF642           ; 2³
    LDA    #0              ; 2
    STA    $AC             ; 3
    LDA    $AF             ; 3
    AND    #$F7            ; 2
    STA    $AF             ; 3
    LDY    $C2             ; 3
    LDA    LFFCF,Y         ; 4
    EOR    #$FF            ; 2
    LDX    $C1             ; 3
    AND    $A2,X           ; 4
    STA    $A2,X           ; 4
LF626:
    JSR    LFEC4           ; 6
    AND    #$07            ; 2
    BEQ    LF626           ; 2³
    TAX                    ; 2
    JSR    LFEC4           ; 6
    AND    #$03            ; 2
    TAY                    ; 2
    LDA    $A2,X           ; 4
    AND    LFFCF,Y         ; 4
    BNE    LF626           ; 2³
    LDA    $A2,X           ; 4
    EOR    LFFCF,Y         ; 4
    STA    $A2,X           ; 4
LF642:
    NOP                    ; 2
WaitOverscan:
    LDA    INTIM           ; 4
    BNE    WaitOverscan    ; 2³
    STA    WSYNC           ; 3
    LDY    #2              ; 2
    STY    VSYNC           ; 3   start Vsync
    STA    WSYNC           ; 3
    STA    WSYNC           ; 3   wait three scanlines
    STA    WSYNC           ; 3
    STA    VSYNC           ; 3   stop Vsync
    LDA    #TIME_VBLANK    ; 2
    STA    TIM64T          ; 4
    LDA    $F2             ; 3
    LSR                    ; 2
    BCC    LF6BF           ; 2³
    LDY    #0              ; 2
LF662:
    LDA    $F2             ; 3
    AND    LFF8A,Y         ; 4
    BNE    LF670           ; 2³
    INY                    ; 2
    CPY    #7              ; 2
    BNE    LF662           ; 2³
    BEQ    LF6BF           ; 2³
LF670:
    LDA    $F8             ; 3
    AND    #$01            ; 2
    BNE    LF6BF           ; 2³
    LDA    $F3             ; 3
    BNE    LF6B7           ; 2³
    LDA    LFF49,Y         ; 4
    STA    $E0             ; 3
    LDA    #$FF            ; 2
    STA    $E1             ; 3
    LDA    #8              ; 2
    STA    AUDV0           ; 3
    LDY    $F4             ; 3
    LDA    ($E0),Y         ; 5
    BNE    LF695           ; 2³
    STA    $F2             ; 3
    STA    $F4             ; 3
    STA    AUDC0           ; 3
    BEQ    LF6BF           ; 2³
LF695:
    STA    $F0             ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
    LDA    LFF39,Y         ; 4
    STA    AUDF0           ; 3
    LDY    #$0C            ; 2
    ASL                    ; 2
    BCC    LF6A6           ; 2³
    LDY    #4              ; 2
LF6A6:
    ASL                    ; 2
    BCC    LF6AB           ; 2³
    LDY    #1              ; 2
LF6AB:
    STY    AUDC0           ; 3
    LDA    $F0             ; 3
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    LSR                    ; 2
    STA    $F3             ; 3
    INC    $F4             ; 5
LF6B7:
    DEC    $F3             ; 5
    BNE    LF6BF           ; 2³
    LDA    #0              ; 2
    STA    AUDC0           ; 3
LF6BF:
    LDY    #0              ; 2
    BIT    $AF             ; 3
    BPL    LF6C6           ; 2³
    INY                    ; 2
LF6C6:
    LDA    LFBF3,Y         ; 4
    STA    $9A             ; 3
    LDA.wy $D0,Y           ; 4
    STA    $F0             ; 3
    LDX    #$0E            ; 2   14 / 2 = 7 different shapes
    LDA    #>ScreenPattern ; 2   #$FD
LF6D4:
    LDY    #$A7            ; 2
    LSR    $F0             ; 5
    BCC    LF6DD           ; 2³
    LDY    ScreenPattern,X ; 4
LF6DD:
    STY    $E0,X           ; 4
    STA    $E1,X           ; 4
    DEX                    ; 2   decrease by 2 only loads the low nybble
    DEX                    ; 2
    BPL    LF6D4           ; 2³
    LDX    #$1C            ; 2
    LDA    $D2             ; 3
    AND    #$08            ; 2
    BEQ    LF6F5           ; 2³
    LDA    $F8             ; 3
    AND    #$08            ; 2
    BNE    LF6F5           ; 2³
    LDX    #$DA            ; 2
LF6F5:
    STX    $9A             ; 3
.waitVblank:
    LDA    INTIM           ; 4
    BNE    .waitVblank     ; 2³
    STA    VBLANK          ; 3   stop Vblank
    BIT    $80             ; 3   0 - value in $80
    BPL    .demoScreen     ; 2³   branch if value is between #$00 - #$7F
    JMP    PlayingScreen   ; 3

;==================================================================================================
;              DEMO SCREEN
;==================================================================================================

.demoScreen:
    LDX    #1              ; 2   do logo
    STX    $E1             ; 3
.loopDemoTopPtrs:
;load pointers for the logo/copyright into ram
    STA    WSYNC           ; 3
;-------------------------------
    LDX    #$0A            ; 2
    STX    $E0             ; 3
    LDY    #>LogoOne       ; 2   high nybble
    LDX    $E1             ; 3   1 = logo, 0 = copyright
    LDA    LogoTab,X       ; 4   low nybble
.loopStorePtrs:
    LDX    $E0             ; 3
    STA    $E4,X           ; 4   store low nybble pointer
    STY    $E5,X           ; 4   store high nybble pointer
    SEC                    ; 2
    SBC    #8              ; 2   set up next low nybble pointer
    DEX                    ; 2
    DEX                    ; 2
    STX    $E0             ; 3
    BPL    .loopStorePtrs  ; 2³
    JSR    CalcPosLogoCopyR; 6
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDY    #7              ; 2   height of logo/copyright
    JSR    DrawTextOrNum   ; 6
    STA    WSYNC           ; 3
;-------------------------------
    DEC    $E1             ; 5   do copyright
    BPL    .loopDemoTopPtrs; 2³
    LDY    #$3C            ; 2   scanlines between copyright and player
.loopBlankLines:
    STA    WSYNC           ; 3
;-------------------------------
    DEY                    ; 2
    BNE    .loopBlankLines ; 2³
    STA    WSYNC           ; 3
;-------------------------------
;position man
    LDA    $8B             ; 3
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    INC    $F8             ; 5   = 15 cycles
.loopCycles_P1:
    DEX                    ; 2
    BPL    .loopCycles_P1  ; 2³  add five cycles each time branch is taken
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $89             ; 3   positioning ufo
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    #$38            ; 2   what is drawn by the playfield now?
    STA    COLUPF          ; 3   = 15 cycles
.loopCycles_P0:
    DEX                    ; 2
    BPL    .loopCycles_P0  ; 2³  add five cycles each time branch is taken
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $8C             ; 3
    STA    COLUP0          ; 3
    LDA    #TWO_CLOCKS     ; 2   ball size
    STA    CTRLPF          ; 3
    LDA    #$70            ; 2   move ball left 7
    STA    HMBL            ; 3
    LDA    #$90            ; 2   move missile zero right 7
    STA    HMM0            ; 3
    NOP                    ; 2
    JSR    LFE2A           ; 6   @29 +6 cycles for RTS = 35 cycles
    STA    RESM0           ; 3
    STA    RESM1           ; 3
    STA    RESBL           ; 3
    STA    HMM1            ; 3   move missile one right 7
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    #DOUBLE_SIZE    ; 2
    STA    NUSIZ1          ; 3
    LDX    $F8             ; 3
    STX    REFP1           ; 3
    STX    REFP0           ; 3
    LDA    $8D             ; 3
    BEQ    LF792           ; 2³
    LDA    #2              ; 2
LF792:
    STA    ENABL           ; 3
    STA    CXCLR           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMCLR           ; 3
    LDY    #$13            ; 2
LF79C:
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    ManGraphics,Y   ; 4
    STA    GRP1            ; 3
    LDA    ManColorTab,Y   ; 4
    STA    COLUP1          ; 3
    LDA    UfoGraphics,Y   ; 4
    STA    GRP0            ; 3
    LDA    $8D             ; 3
    STA    PF2             ; 3
    STA    HMCLR           ; 3
    BEQ    LF7D3           ; 2³
    LDX    #$32            ; 2
    CPY    #6              ; 2
    BEQ    LF7CB           ; 2³
    CPY    #5              ; 2
    BEQ    LF7C7           ; 2³
    CPY    #4              ; 2
    BNE    LF7CF           ; 2³
    LDX    #$D0            ; 2
LF7C7:
    STX    HMBL            ; 3
    STX    CTRLPF          ; 3
LF7CB:
    STX    ENAM0           ; 3
    STX    ENAM1           ; 3
LF7CF:
    LDA    #0              ; 2
    STA    PF2             ; 3
LF7D3:
    DEY                    ; 2
    BPL    LF79C           ; 2³
    STA    ENABL           ; 3
    LDY    #$3C            ; 2   scanlines from man to "1P R01" on title screen
LF7DA:
    STA    WSYNC           ; 3
;-------------------------------
    DEY                    ; 2
    BNE    LF7DA           ; 2³
    STY    REFP0           ; 3
    STY    REFP1           ; 3
    STA    HMCLR           ; 3
    JMP    LFA66           ; 3

;==================================================================================================
;              PLAYING SCREEN
;==================================================================================================

PlayingScreen:
    LDY    #8              ; 2
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $BC             ; 3
    STA    HMM0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    $DE             ; 3   color for left bird
    STA    COLUP0          ; 3
.loopCycles_M0:
    DEX                    ; 2
    BPL    .loopCycles_M0  ; 2³  add five cycles each time branch is taken
    STA    RESM0           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $BD             ; 3
    STA    HMM1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    $DF             ; 3
    STA    COLUP1          ; 3   color for right bird
.loopCycles_M1:
    DEX                    ; 2
    BPL    .loopCycles_M1  ; 2³  add five cycles each time branch is taken
    STA    RESM1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    #0              ; 2
    STA    NUSIZ0          ; 3
    LDA    $DC             ; 3
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
.loopCyclesB_P0:
    DEX                    ; 2
    BPL    .loopCyclesB_P0 ; 2³  add five cycles each time branch is taken
    STA    RESP0           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $DD             ; 3
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    LDA    #$5A            ; 2
    STA    COLUPF          ; 3
.loopCyclesB_P1:
    DEX                    ; 2
    BPL    .loopCyclesB_P1 ; 2³  add five cycles each time branch is taken
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    INX                    ; 2   from $FF to $00
    STX    NUSIZ0          ; 3
    STX    NUSIZ1          ; 3
.loopBirdGfx:
    STA    WSYNC           ; 3
;-------------------------------
    LDX    BirdWingsUp,Y   ; 4   Y is equal to 8 intially
    LDA    $F8             ; 3
    AND    #$08            ; 2
    BNE    .drawBirds      ; 2³
    LDX    BirdWingsDown,Y ; 4
.drawBirds:
    STX    GRP0            ; 3
    STX    GRP1            ; 3
    DEY                    ; 2
    BPL    .loopBirdGfx    ; 2³
    STA    HMCLR           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    #$BF            ; 2   actually becomes $BE
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    JSR    ClearCollisions ; 6
    NOP                    ; 2
    LDA    #$10            ; 2   TWO_CLOCKS
    STA    NUSIZ1          ; 3
    STA    NUSIZ0          ; 3
    STA    RESP0           ; 3   strobe
    JSR    ClearCollisions ; 6
    LDY    #$0A            ; 2
    STA    RESP1           ; 3   strobe
.loopTopObjects:
    STA    WSYNC           ; 3
;-------------------------------
    LDA    ($E0),Y         ; 5   PlusA
    STA    PF0             ; 3
    LDA    ($E2),Y         ; 5   MinusA
    STA    PF1             ; 3
    LDA    ($E4),Y         ; 5   Sword
    STA    GRP0            ; 3
    LDA    ($E6),Y         ; 5   PlusB
    STA    PF2             ; 3
    LDA    ($EA),Y         ; 5   Sword
    STA    GRP1            ; 3
    LDA    ($E8),Y         ; 5   MinusB
    STA    PF2             ; 3
    LDA    ($EC),Y         ; 5   MinusA
    STA    PF1             ; 3
    LDA    ($EE),Y         ; 5   PlusA
    STA    PF0             ; 3
    DEY                    ; 2   Y is equal to 10 intially
    BPL    .loopTopObjects ; 2³
    STA    WSYNC           ; 3
;-------------------------------
    LDX    $9A             ; 3   color
    LDA    $C0             ; 3
    STA    HMP1            ; 3
    AND    #$0F            ; 2
    TAY                    ; 2
.loopCyclesC_P1:
    DEY                    ; 2
    BPL    .loopCyclesC_P1 ; 2³  add five cycles each time branch is taken
    NOP                    ; 2
    STA    RESP1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    STX    COLUP0          ; 3
    LDX    #0              ; 2
    LDA    $D2             ; 3
    AND    #$20            ; 2
    BNE    LF8BD           ; 2³
    BIT    $AF             ; 3   testing game variation?
    BPL    LF8B6           ; 2³
    INX                    ; 2
LF8B6:
    LDY    $BE,X           ; 4   value in $BE or $BF
    STY    $CF             ; 3
    LDX    LFF82,Y         ; 4   colors for different game variations?
LF8BD:
    STX    COLUPF          ; 3   black, or other color
    LDY    #7              ; 2
    LDA    $F8             ; 3
    AND    #$08            ; 2
    BNE    LF8C8           ; 2³
    INY                    ; 2
LF8C8:
    STY    REFP0           ; 3   reflecting players
    STY    REFP1           ; 3
    LDA    #$FC            ; 2   high nybble
    STA    $E5             ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    $E7             ; 3
    STA    $E9             ; 3
    STA    $E1             ; 3
    STA    $E3             ; 3
    STA    HMCLR           ; 3
    JSR    LFE2A           ; 6   +6 cycles
    JSR    LFE2A           ; 6   +6 cycles   why??
    LDA    #$21            ; 2
    STA    CTRLPF          ; 3   ball size 8 clocks, playfield is reflected
    LDX    #8              ; 2
LF8E8:
    LDY    #$1F            ; 2
    LDA    $8E,X           ; 4   $96 and down
    STA    $E4             ; 3
    CLC                    ; 2
    ADC    $9E             ; 3
    STA    $E8             ; 3
; draw 8 vertical poles
    LDA    #$21            ; 2
    STA    PF2             ; 3
    LDA    #$10            ; 2
    STA    PF1             ; 3
    LDA    #$40            ; 2
    STA    PF0             ; 3
    LDA    ($E4),Y         ; 5   $FC6D + $1F?? = $FC8C??
    STA    GRP1            ; 3
    LDA    ($E8),Y         ; 5   $FCE1 + $1F?? = $FD00??
    STA    COLUP1          ; 3
    LDA    $86,X           ; 4
    STA    $E0             ; 3
    LDA    $87,X           ; 4
    STA    $E2             ; 3
    LDA    ($E0),Y         ; 5   $FCC4 + $1F?? = $FCE3, = #$2D
    STA    ENAM0           ; 3   D (%1101) = disabled
    LDA    ($E2),Y         ; 5   $FC6D + $1F?? = $FC8C?? = 0
    STA    ENAM1           ; 3
    STX    $98             ; 3   temp?
    LDA    $8F,X           ; 4
    STA    $E6             ; 3
    LDA    $97,X           ; 4
    STA    HMP0            ; 3
    AND    #$0F            ; 2
    TAX                    ; 2
    DEY                    ; 2
    STA    WSYNC           ; 3
;-------------------------------
    LDA    ($E4),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($E8),Y         ; 5
    STA    COLUP1          ; 3
.loopCyclesC_P0:
    DEX                    ; 2
    BPL    .loopCyclesC_P0 ; 2³
    STA    RESP0           ; 3
    DEY                    ; 2
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    ($E4),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($E8),Y         ; 5
    STA    COLUP1          ; 3
    LDA    ($E0),Y         ; 5
    STA    ENAM0           ; 3
    LDA    ($E2),Y         ; 5
    STA    ENAM1           ; 3
    LDA    #$FD            ; 2
    STA    $EB             ; 3
    DEY                    ; 2
LF94E:
    LDX    $98             ; 3
    LDA    $A1,X           ; 4
    ASL                    ; 2   times by 2
    ADC    $A1,X           ; 4   times by 3
    ADC    #$CB            ; 2   add with #$CB
    STA    $EA             ; 3   from $FD34 to $FDCE
LF959:
    LDA    ($E8),Y         ; 5
    TAX                    ; 2
    LDA    ($E4),Y         ; 5   $FC6D + $1C?? = $00??
    STA    WSYNC           ; 3
;-------------------------------
    STA    GRP1            ; 3
    STX    COLUP1          ; 3   #$2D, therefore #$2C
    LDA    ($E6),Y         ; 5   $FC27 + $1B = $FC42 (drawing UFO upside down), then drawing man
    STA    GRP0            ; 3
    LDA    ($E0),Y         ; 5
    STA    ENAM0           ; 3
    LDA    ($E2),Y         ; 5
    STA    ENAM1           ; 3
    DEY                    ; 2
    CPY    #$14            ; 2   now starts all the branching
    BCS    LF959           ; 2³
    CPY    #$10            ; 2
    BCS    LF97F           ; 2³
    CPY    #4              ; 2
    BCC    LF981           ; 2³
    BCS    LF959           ; 2³   always branch?
LF97F:
    NOP                    ; 2
    NOP                    ; 2
LF981:
    STY    $F0             ; 3   temp?
    LDY    #0              ; 2
; draw ledges
    LDA    ($EA),Y         ; 5   $FDCE??  = $21??
    INY                    ; 2
    STA    PF2             ; 3
    LDA    ($EA),Y         ; 5
    INY                    ; 2
    STA    PF1             ; 3
    LDA    ($EA),Y         ; 5
    STA    PF0             ; 3
    LDY    $F0             ; 3
    LDA    ($E4),Y         ; 5
LF997:
    STA    GRP1            ; 3
    LDA    ($E6),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($E8),Y         ; 5
    STA    COLUP1          ; 3
    LDA    ($E0),Y         ; 5
    STA    ENAM0           ; 3
    LDA    ($E2),Y         ; 5
    STA    ENAM1           ; 3
    DEY                    ; 2
    BPL    LF9B2           ; 2³
    DEX                    ; 2
    BEQ    LF9E6           ; 2³
    JMP    LF8E8           ; 3

LF9B2:
    CPY    #$0F            ; 2
    BEQ    LF9BE           ; 2³
    LDA    ($E4),Y         ; 5
    LDX    $98             ; 3
    STA    WSYNC           ; 3
;-------------------------------
    BNE    LF997           ; 2³
LF9BE:
    DEC    $98             ; 5
; draw poles again
    LDA    #$21            ; 2
    STA    PF2             ; 3
    LDX    #$10            ; 2
    LDA    ($E8),Y         ; 5
    STA    HMCLR           ; 3
    STX    PF1             ; 3
    LDX    #$40            ; 2
    STX    PF0             ; 3
    STA    COLUP1          ; 3
    LDA    ($E4),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($E6),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($E0),Y         ; 5
    STA    ENAM0           ; 3
    LDA    ($E2),Y         ; 5
    STA    ENAM1           ; 3
    DEY                    ; 2
    JMP    LF94E           ; 3

LF9E6:
    LDX    $CF             ; 3
    LDA    LFF7A,X         ; 4
    STA    $F1             ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    COLUPF          ; 3
    STY    PF0             ; 3   Y is equal to $FF
    STY    PF1             ; 3
    STY    PF2             ; 3
    INY                    ; 2   from $FF to $00
    STY    ENAM0           ; 3
    STY    ENAM1           ; 3
    STY    REFP0           ; 3
    STY    REFP1           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $B6             ; 3   #$40
    LSR                    ; 2
    LSR                    ; 2
    STA    $F0             ; 3   #$10
    LDA    $B5             ; 3   #$C4
    STA    HMBL            ; 3
    AND    #$0F            ; 2
    STA    RESP0           ; 3
    TAY                    ; 2
    LDA    #$45            ; 2   time bar
    STA    COLUBK          ; 3
.loopCycles_BL:
    DEY                    ; 2
    BPL    .loopCycles_BL  ; 2³
    STA.w  RESBL           ; 4
    STY    ENABL           ; 3
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    #>Lives         ; 2
    STA    $E5             ; 3
    LDX    #$AB            ; 2
    LDA    $81             ; 3   #$04
    CMP    #2              ; 2
    BCC    LFA2F           ; 2³
    LDX    #<Lives         ; 2
LFA2F:
    STX    $E4             ; 3
    LDY    #7              ; 2   height lives display and time bar
.loopDrawDisplay:
    LDX    $81             ; 3   #$04, $81 has number of lives?
    STA    WSYNC           ; 3
;-------------------------------
    LDA    SizeCopyTab,X   ; 4
    STA    NUSIZ0          ; 3
    LDA    ($E4),Y         ; 5   lives graphics
    STA    GRP0            ; 3
    LDA    ColorLivesTab,Y ; 4
    STA    COLUP0          ; 3
    LDX    $F0             ; 3   #$10
    LDA    LFDBA,X         ; 4   $FDCA intially
    STA    PF2             ; 3
    LDA    $F5             ; 3   #$1C
    STA.w  COLUPF          ; 4
    LDA    LFDA9,X         ; 4
    NOP                    ; 2
    STA    PF2             ; 3
    NOP                    ; 2
    NOP                    ; 2
    LDA    $F1             ; 3
    DEY                    ; 2
    STA    COLUPF          ; 3   return to border color
    BPL    .loopDrawDisplay; 2³
    STA    HMCLR           ; 3
    BIT    $C7             ; 3
    BPL    LFA7E           ; 2³

;==================================================================================================
;              SHARED DEMO AND PLAYING SCREEN
;==================================================================================================

LFA66:
    LDY    $CF             ; 3   y is zero in some cases
    INY                    ; 2
    STY    $E2             ; 3
    LDA    #$CB            ; 2
    STA    $E1             ; 3
    LDX    #$1A            ; 2
    LDA    $F7             ; 3
    LSR                    ; 2
    BCC    LFA78           ; 2³
    LDX    #$2A            ; 2
LFA78:
    STX    $E0             ; 3
    LDA    #$E0            ; 2   for demo screen (ram pointer, in ram)
    BNE    LFA86           ; 3   always branch
LFA7E:
    LDA    #$82            ; 2
    BIT    $AF             ; 3
    BPL    LFA86           ; 2³
    LDA    #$85            ; 2   maybe for main screen
LFA86:
    STA    $A0             ; 3   or #$82
    STA    WSYNC           ; 3
;-------------------------------
    LDA    $F1             ; 3
    STA    COLUBK          ; 3   draw last bit of border with background
    LDY    #0              ; 2
    STY    PF0             ; 3
    STY    PF1             ; 3
    STY    GRP0            ; 3
    STY    ENABL           ; 3
    STY    PF2             ; 3
    LDA    #3              ; 2
    STA    VDELP0          ; 3
    STA    VDELP1          ; 3
    STA    NUSIZ0          ; 3
    STA    NUSIZ1          ; 3
    STA    RESP0           ; 3
    STA    RESP1           ; 3
    LDA    #$10            ; 2
    STA    HMP1            ; 3
    LDA    #COLOR_DEMO_P_R ; 2   and color of score
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    LDA    #$FD            ; 2   high nybble
    STA    $E5             ; 3
    STA    $E7             ; 3
    STA    $E9             ; 3
    STA    $EB             ; 3
    STA    $ED             ; 3
    STA    $EF             ; 3
    CLD                    ; 2
    STY    $A1             ; 3
    LDY    #2              ; 2
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMOVE           ; 3
    LDA    #BLACK          ; 2
    STA    COLUBK          ; 3   back in black
    LDX    #$0A            ; 2
.loopScorePtrs:
    LDA    ($A0),Y         ; 5   Y = 2 intially, $A0 had #$E0, so load $E2, which is #$01, or load $82-$84
    AND    #$0F            ; 2   keep low nybble
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2   times by eight
    CLC                    ; 2
    ADC    #<Zero          ; 2   start at zero
    STA    $E4,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    LDA    ($A0),Y         ; 5
    AND    #$F0            ; 2
    LSR                    ; 2   divide by two
    ADC    #<Zero          ; 2
    STA    $E4,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    DEY                    ; 2
    BPL    .loopScorePtrs  ; 2³
    LDY    #7              ; 2   logo height
    JSR    DrawTextOrNum   ; 6
    JMP    MainLoop        ; 3


DrawTextOrNum SUBROUTINE
    STY    $F0             ; 3   temp storage
    LDA    ($EE),Y         ; 5
    STA    $F1             ; 3
    STA    WSYNC           ; 3
;-------------------------------
    LDA    ($E4),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($E6),Y         ; 5
    STA    GRP1            ; 3
    LDA    ($E8),Y         ; 5
    STA    GRP0            ; 3
    LDA    ($EC),Y         ; 5
    TAX                    ; 2
    NOP                    ; 2
    LDA    ($EA),Y         ; 5
    LDY    $F1             ; 3
    STA    GRP1            ; 3
    STX    GRP0            ; 3
    STY    GRP1            ; 3
    STA    GRP0            ; 3
    LDY    $F0             ; 3   $F0 equals zero in the end
    DEY                    ; 2
    BPL    DrawTextOrNum   ; 2³+1
    STA    WSYNC           ; 3
;-------------------------------
    STA    HMCLR           ; 3
    INY                    ; 2   from $FF to $00
    STY    NUSIZ1          ; 3   and clear everything
    STY    NUSIZ0          ; 3
    STY    VDELP0          ; 3
    STY    VDELP1          ; 3
    STY    GRP0            ; 3
    STY    GRP1            ; 3
    STY    GRP0            ; 3
    RTS                    ; 6

LFB30:
    LDA    $F6             ; 3
    ORA    #$0F            ; 2
    AND    #$F2            ; 2
    STA    $F6             ; 3
    CPX    #$72            ; 2
    BNE    LFB57           ; 2³
    LDA    #0              ; 2
    STA    $AA             ; 3
    LDA    $AE             ; 3
    SEC                    ; 2
    SBC    #2              ; 2
LFB45:
    CMP    #3              ; 2
    BCC    LFB67           ; 2³
    INC    $AA             ; 5
    SBC    #$14            ; 2
    BPL    LFB45           ; 2³
    LDA    $F6             ; 3
    ORA    #$01            ; 2
    STA    $F6             ; 3
    BNE    LFB67           ; 2³
LFB57:
    EOR    #$0E            ; 2
    STA    $F6             ; 3
    LDY    $AA             ; 3
    LDA    #$EF            ; 2
LFB5F:
    CLC                    ; 2
    ADC    #$14            ; 2
    DEY                    ; 2
    BPL    LFB5F           ; 2³
    STA    $AE             ; 3
LFB67:
    RTS                    ; 6

LogoOne:
    .byte $00 ; |        | $FB68
    .byte $F2 ; |XXXX  X | $FB69         XXXX   XXX  XXXXX  XXX  XXXXX XXXXX  XXX  X   X
    .byte $8A ; |X   X X | $FB6A         X   X X   X   X   X   X   X   X     X   X X   X
    .byte $8A ; |X   X X | $FB6B         X   X X   X   X   X   X   X   X     X     X   X
    .byte $8B ; |X   X XX| $FB6C         X   X XXXXX   X   XXXXX   X   XXXX  X     XXXXX
    .byte $8A ; |X   X X | $FB6D         X   X X   X   X   X   X   X   X     X     X   X
    .byte $8A ; |X   X X | $FB6E         X   X X   X   X   X   X   X   X     X   X X   X
    .byte $F1 ; |XXXX   X| $FB6F         XXXX  X   X   X   X   X   X   XXXXX  XXX  X   X
LogoTwo:
    .byte $00 ; |        | $FB70
    .byte $22 ; |  X   X | $FB71
    .byte $22 ; |  X   X | $FB72
    .byte $22 ; |  X   X | $FB73
    .byte $E2 ; |XXX   X | $FB74
    .byte $22 ; |  X   X | $FB75
    .byte $22 ; |  X   X | $FB76
    .byte $CF ; |XX  XXXX| $FB77
LogoThree:
    .byte $00 ; |        | $FB78
    .byte $22 ; |  X   X | $FB79
    .byte $22 ; |  X   X | $FB7A
    .byte $22 ; |  X   X | $FB7B
    .byte $3E ; |  XXXXX | $FB7C
    .byte $22 ; |  X   X | $FB7D
    .byte $22 ; |  X   X | $FB7E
    .byte $9C ; |X  XXX  | $FB7F
LogoFour:
    .byte $00 ; |        | $FB80
    .byte $23 ; |  X   XX| $FB81
    .byte $22 ; |  X   X | $FB82
    .byte $22 ; |  X   X | $FB83
    .byte $23 ; |  X   XX| $FB84
    .byte $22 ; |  X   X | $FB85
    .byte $22 ; |  X   X | $FB86
    .byte $FB ; |XXXXX XX| $FB87
LogoFive:
    .byte $00 ; |        | $FB88
    .byte $E7 ; |XXX  XXX| $FB89
    .byte $08 ; |    X   | $FB8A
    .byte $08 ; |    X   | $FB8B
    .byte $C8 ; |XX  X   | $FB8C
    .byte $08 ; |    X   | $FB8D
    .byte $08 ; |    X   | $FB8E
    .byte $E7 ; |XXX  XXX| $FB8F
LogoSix:
    .byte $00 ; |        | $FB90
    .byte $22 ; |  X   X | $FB91
    .byte $A2 ; |X X   X | $FB92
    .byte $22 ; |  X   X | $FB93
    .byte $3E ; |  XXXXX | $FB94
    .byte $22 ; |  X   X | $FB95
    .byte $A2 ; |X X   X | $FB96
    .byte $22 ; |  X   X | $FB97

CopyrightOne:
    .byte $00 ; |        | $FB98                                     XXXX
    .byte $00 ; |        | $FB99           X   XX    XX    XX       X    X
    .byte $00 ; |        | $FB9A          XX  X  X  X  X  X  X     X  XX  X
    .byte $00 ; |        | $FB9B           X  X  X  X  X     X     X X    X
    .byte $00 ; |        | $FB9C           X   XXX   XX    XX      X X    X
    .byte $00 ; |        | $FB9D           X     X  X  X     X     X  XX  X
    .byte $00 ; |        | $FB9E           X  X  X  X  X  X  X      X    X
    .byte $00 ; |        | $FB9F           X   XX    XX    XX        XXXX
CopyrightTwo:
    .byte $23 ; |  X   XX| $FBA0
    .byte $24 ; |  X  X  | $FBA1
    .byte $20 ; |  X     | $FBA2
    .byte $23 ; |  X   XX| $FBA3
    .byte $24 ; |  X  X  | $FBA4
    .byte $64 ; | XX  X  | $FBA5
    .byte $23 ; |  X   XX| $FBA6
    .byte $00 ; |        | $FBA7
CopyrightThree:
    .byte $0C ; |    XX  | $FBA8
    .byte $92 ; |X  X  X | $FBA9
    .byte $92 ; |X  X  X | $FBAA
    .byte $8C ; |X   XX  | $FBAB
    .byte $92 ; |X  X  X | $FBAC
    .byte $92 ; |X  X  X | $FBAD
    .byte $0C ; |    XX  | $FBAE
    .byte $00 ; |        | $FBAF
CopyrightFour:
    .byte $30 ; |  XX    | $FBB0
    .byte $48 ; | X  X   | $FBB1
    .byte $08 ; |    X   | $FBB2
    .byte $30 ; |  XX    | $FBB3
    .byte $08 ; |    X   | $FBB4
    .byte $48 ; | X  X   | $FBB5
    .byte $30 ; |  XX    | $FBB6
    .byte $00 ; |        | $FBB7
CopyrightFive:
    .byte $0F ; |    XXXX| $FBB8
    .byte $10 ; |   X    | $FBB9
    .byte $26 ; |  X  XX | $FBBA
    .byte $28 ; |  X X   | $FBBB
    .byte $28 ; |  X X   | $FBBC
    .byte $26 ; |  X  XX | $FBBD
    .byte $10 ; |   X    | $FBBE
    .byte $0F ; |    XXXX| $FBBF
CopyrightSix:
    .byte $00 ; |        | $FBC0
    .byte $80 ; |X       | $FBC1
    .byte $40 ; | X      | $FBC2
    .byte $40 ; | X      | $FBC3
    .byte $40 ; | X      | $FBC4
    .byte $40 ; | X      | $FBC5
    .byte $80 ; |X       | $FBC6
    .byte $00 ; |        | $FBC7

LogoTab:
; endpoint references used while loading pointers into ram
    .byte <CopyrightSix    ; $C0
    .byte <LogoSix         ; $90

ManGraphics:
; man from the demo
    .byte $00 ; |        | $FBCA
    .byte $03 ; |      XX| $FBCB
    .byte $02 ; |      X | $FBCC
    .byte $02 ; |      X | $FBCD
    .byte $C2 ; |XX    X | $FBCE
    .byte $42 ; | X    X | $FBCF
    .byte $42 ; | X    X | $FBD0
    .byte $7E ; | XXXXXX | $FBD1
    .byte $3C ; |  XXXX  | $FBD2
    .byte $7F ; | XXXXXXX| $FBD3
    .byte $98 ; |X  XX   | $FBD4
    .byte $7E ; | XXXXXX | $FBD5
    .byte $5A ; | X XX X | $FBD6
    .byte $42 ; | X    X | $FBD7
    .byte $7E ; | XXXXXX | $FBD8
    .byte $5A ; | X XX X | $FBD9
    .byte $FF ; |XXXXXXXX| $FBDA
    .byte $7E ; | XXXXXX | $FBDB
    .byte $7E ; | XXXXXX | $FBDC
    .byte $7E ; | XXXXXX | $FBDD
    .byte $7E ; | XXXXXX | $FBDE   unused byte

ManColorTab:
; man from the demo
    .byte BLACK     ; |        |
    .byte VIOLET    ; |      XX| lower body
    .byte VIOLET    ; |      X |
    .byte VIOLET    ; |      X |
    .byte VIOLET    ; |XX    X |
    .byte VIOLET    ; | X    X |
    .byte VIOLET    ; | X    X |
    .byte VIOLET    ; | XXXXXX |
    .byte VIOLET    ; |  XXXX  |
    .byte VIOLET    ; | XXXXXXX|
    .byte VIOLET+6  ; |X  XX   | hand and neck
    .byte BEIGE     ; | XXXXXX | face
    .byte BEIGE     ; | X XX X |
    .byte BEIGE     ; | X    X |
    .byte BEIGE     ; | XXXXXX |
    .byte BEIGE     ; | X XX X |
    .byte VIOLET    ; |XXXXXXXX| hat
    .byte VIOLET    ; | XXXXXX |
    .byte VIOLET    ; | XXXXXX |
    .byte VIOLET    ; | XXXXXX |

LFBF3:
    .byte $1B,$5A

CalcPosLogoCopyR:
    STA    WSYNC           ; 3
;-------------------------------
    LDA    #$13            ; 2
    STA    HMP1            ; 3   move left 1 clock
    STA    NUSIZ0          ; 3   missile size 2 clocks, 3 copies (close)
    STA    NUSIZ1          ; 3   missile size 2 clocks, 3 copies (close)
    STA    VDELP0          ; 3   delay
    STA    VDELP1          ; 3   delay
    LDA    #COLOR_LOGO     ; 2
    STA    COLUP0          ; 3
    STA    COLUP1          ; 3
    JSR    LFE2A           ; 6   @31 +6 cycles for RTS = 37 cycles
    STA    RESP0           ; 3   pos 39, hmove 0
    STA    RESP1           ; 3   pos 42, hmove 1, = 41
    RTS                    ; 6

    .byte $20 ; |  X     | $FC11
    .byte $0C ; |    XX  | $FC12
    .byte $D0 ; |XX X    | $FC13
BirdWingsUp:
    .byte $00 ; |        | $FC14
    .byte $24 ; |  X  X  | $FC15
    .byte $18 ; |   XX   | $FC16
    .byte $18 ; |   XX   | $FC17
    .byte $7E ; | XXXXXX | $FC18
    .byte $7E ; | XXXXXX | $FC19
    .byte $C3 ; |XX    XX| $FC1A
    .byte $81 ; |X      X| $FC1B
    .byte $81 ; |X      X| $FC1C
BirdWingsDown:
    .byte $00 ; |        | $FC1D
    .byte $A5 ; |X X  X X| $FC1E
    .byte $99 ; |X  XX  X| $FC1F
    .byte $DB ; |XX XX XX| $FC20
    .byte $FF ; |XXXXXXXX| $FC21
    .byte $66 ; | XX  XX | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25

    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
UfoGraphics:
    .byte $00 ; |        | $FC35
    .byte $00 ; |        | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38
    .byte $18 ; |   XX   | $FC39
    .byte $7E ; | XXXXXX | $FC3A
    .byte $FF ; |XXXXXXXX| $FC3B
    .byte $00 ; |        | $FC3C
    .byte $B6 ; |X XX XX | $FC3D
    .byte $B6 ; |X XX XX | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $FF ; |XXXXXXXX| $FC40
    .byte $7E ; | XXXXXX | $FC41
    .byte $18 ; |   XX   | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48

    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $00 ; |        | $FC52
    .byte $00 ; |        | $FC53
    .byte $00 ; |        | $FC54
    .byte $00 ; |        | $FC55
    .byte $00 ; |        | $FC56
    .byte $00 ; |        | $FC57
    .byte $00 ; |        | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $E7 ; |XXX  XXX| $FC63
    .byte $24 ; |  X  X  | $FC64
    .byte $24 ; |  X  X  | $FC65
    .byte $BD ; |X XXXX X| $FC66
    .byte $66 ; | XX  XX | $FC67
    .byte $7E ; | XXXXXX | $FC68
    .byte $5A ; | X XX X | $FC69
    .byte $FF ; |XXXXXXXX| $FC6A
    .byte $7E ; | XXXXXX | $FC6B
    .byte $7E ; | XXXXXX | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $00 ; |        | $FC74
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $00 ; |        | $FC77
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $00 ; |        | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B

    .byte $00 ; |        | $FC8C
    .byte $07 ; |     XXX| $FC8D
    .byte $E2 ; |XXX   X | $FC8E
    .byte $24 ; |  X  X  | $FC8F
    .byte $BD ; |X XXXX X| $FC90
    .byte $66 ; | XX  XX | $FC91
    .byte $7E ; | XXXXXX | $FC92
    .byte $5A ; | X XX X | $FC93
    .byte $FF ; |XXXXXXXX| $FC94
    .byte $7E ; | XXXXXX | $FC95
    .byte $7E ; | XXXXXX | $FC96
    .byte $00 ; |        | $FC97
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
    .byte $00 ; |        | $FC9A
    .byte $00 ; |        | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $00 ; |        | $FCA3
    .byte $00 ; |        | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $00 ; |        | $FCA6
    .byte $00 ; |        | $FCA7
    .byte $00 ; |        | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $00 ; |        | $FCAA
    .byte $00 ; |        | $FCAB
    .byte $00 ; |        | $FCAC
    .byte $00 ; |        | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $00 ; |        | $FCAF
    .byte $00 ; |        | $FCB0
    .byte $00 ; |        | $FCB1
    .byte $00 ; |        | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $00 ; |        | $FCB6
    .byte $2D ; |  X XX X| $FCB7
    .byte $2D ; |  X XX X| $FCB8
    .byte $2D ; |  X XX X| $FCB9
    .byte $2D ; |  X XX X| $FCBA
    .byte $2D ; |  X XX X| $FCBB
    .byte $2D ; |  X XX X| $FCBC
    .byte $2D ; |  X XX X| $FCBD
    .byte $2D ; |  X XX X| $FCBE
    .byte $2D ; |  X XX X| $FCBF
    .byte $2D ; |  X XX X| $FCC0
    .byte $2D ; |  X XX X| $FCC1
    .byte $2D ; |  X XX X| $FCC2
    .byte $2D ; |  X XX X| $FCC3
    .byte $2D ; |  X XX X| $FCC4
    .byte $2D ; |  X XX X| $FCC5
    .byte $2D ; |  X XX X| $FCC6
    .byte $2D ; |  X XX X| $FCC7
    .byte $2D ; |  X XX X| $FCC8
    .byte $2D ; |  X XX X| $FCC9
    .byte $2D ; |  X XX X| $FCCA
    .byte $2D ; |  X XX X| $FCCB
    .byte $2D ; |  X XX X| $FCCC
    .byte $2D ; |  X XX X| $FCCD
    .byte $2D ; |  X XX X| $FCCE
    .byte $2D ; |  X XX X| $FCCF
    .byte $2D ; |  X XX X| $FCD0
    .byte $2D ; |  X XX X| $FCD1
    .byte $2D ; |  X XX X| $FCD2
    .byte $2D ; |  X XX X| $FCD3
    .byte $2D ; |  X XX X| $FCD4
    .byte $2D ; |  X XX X| $FCD5
    .byte $2D ; |  X XX X| $FCD6

ShortManColorTab:
    .byte VIOLET    ; |     XXX| lower body
    .byte VIOLET    ; |XXX   X |
    .byte VIOLET    ; |  X  X  |
    .byte VIOLET+2  ; |X XXXX X| arms
    .byte BEIGE+2   ; | XX  XX | face
    .byte BEIGE+2   ; | XXXXXX |
    .byte BEIGE+2   ; | X XX X |
    .byte VIOLET    ; |XXXXXXXX| hat
    .byte VIOLET    ; | XXXXXX |
    .byte VIOLET    ; | XXXXXX |

    .byte $2D ; |  X XX X| $FCE1
    .byte $2D ; |  X XX X| $FCE2
    .byte $2D ; |  X XX X| $FCE3
    .byte $2D ; |  X XX X| $FCE4
    .byte $2D ; |  X XX X| $FCE5
    .byte $2D ; |  X XX X| $FCE6
    .byte $2D ; |  X XX X| $FCE7
    .byte $2D ; |  X XX X| $FCE8
    .byte $2D ; |  X XX X| $FCE9
    .byte $2D ; |  X XX X| $FCEA
    .byte $2D ; |  X XX X| $FCEB
    .byte $2D ; |  X XX X| $FCEC
    .byte $2D ; |  X XX X| $FCED
    .byte $2D ; |  X XX X| $FCEE
    .byte $2D ; |  X XX X| $FCEF
    .byte $2D ; |  X XX X| $FCF0
    .byte $2D ; |  X XX X| $FCF1
    .byte $2D ; |  X XX X| $FCF2
    .byte $2D ; |  X XX X| $FCF3
    .byte $2D ; |  X XX X| $FCF4
    .byte $2D ; |  X XX X| $FCF5
    .byte $2D ; |  X XX X| $FCF6
    .byte $2D ; |  X XX X| $FCF7
    .byte $2D ; |  X XX X| $FCF8
    .byte $2D ; |  X XX X| $FCF9
    .byte $2D ; |  X XX X| $FCFA
    .byte $2D ; |  X XX X| $FCFB
    .byte $2D ; |  X XX X| $FCFC
    .byte $2D ; |  X XX X| $FCFD
    .byte $2D ; |  X XX X| $FCFE
    .byte $2D ; |  X XX X| $FCFF

ScreenPattern:
    .byte <PlusA     ; $0F    byte also shared for color, becomes $0E
    .byte $00        ; never used
    .byte <MinusA    ; $23
    .byte $48        ; never used
    .byte <Sword     ; $34
    .byte $FD        ; never used
    .byte <PlusB     ; $19
    .byte $FD        ; never used
    .byte <MinusB    ; $2A
    .byte $FD        ; never used
    .byte <Sword     ; $34
    .byte $FD        ; never used
    .byte <MinusA    ; $23
    .byte $FD        ; never used
    .byte <PlusA     ; $0F

PlusA:
    .byte $00 ; |        | $FD0F
    .byte $40 ; | X      | $FD10
    .byte $40 ; | X      | $FD11
    .byte $40 ; | X      | $FD12
    .byte $A0 ; |X X     | $FD13
    .byte $40 ; | X      | $FD14
    .byte $A0 ; |X X     | $FD15
    .byte $40 ; | X      | $FD16
    .byte $40 ; | X      | $FD17
    .byte $40 ; | X      | $FD18
PlusB:
    .byte $00 ; |        | $FD19   byte shared by "PlusA"
    .byte $20 ; |  X     | $FD1A
    .byte $20 ; |  X     | $FD1B
    .byte $20 ; |  X     | $FD1C
    .byte $50 ; | X X    | $FD1D
    .byte $20 ; |  X     | $FD1E
    .byte $50 ; | X X    | $FD1F
    .byte $20 ; |  X     | $FD20
    .byte $20 ; |  X     | $FD21
    .byte $20 ; |  X     | $FD22
MinusA:
    .byte $00 ; |        | $FD23   byte shared by "PlusB"
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $38 ; |  XXX   | $FD27
    .byte $38 ; |  XXX   | $FD28
    .byte $38 ; |  XXX   | $FD29
MinusB:
    .byte $00 ; |        | $FD2A   byte shared by "MinusA"
    .byte $00 ; |        | $FD2B   byte shared by "MinusA"
    .byte $00 ; |        | $FD2C   byte shared by "MinusA"
    .byte $00 ; |        | $FD2D   byte shared by "MinusA"
    .byte $70 ; | XXX    | $FD2E
    .byte $70 ; | XXX    | $FD2F
    .byte $70 ; | XXX    | $FD30
    .byte $00 ; |        | $FD31
    .byte $00 ; |        | $FD32
    .byte $00 ; |        | $FD33
Sword:
    .byte $00 ; |        | $FD34   byte shared by "MinusB"
    .byte $3E ; |  XXXXX | $FD35
    .byte $1C ; |   XXX  | $FD36
    .byte $7F ; | XXXXXXX| $FD37
    .byte $5D ; | X XXX X| $FD38
    .byte $1C ; |   XXX  | $FD39
    .byte $1C ; |   XXX  | $FD3A
    .byte $1C ; |   XXX  | $FD3B
    .byte $1C ; |   XXX  | $FD3C
    .byte $1C ; |   XXX  | $FD3D
    .byte $08 ; |    X   | $FD3E

LFD3F:
    .byte $10,$03,$05,$10,$03,$05,$03,$10

Zero:
    .byte $3C ; |  XXXX  | $FD47
    .byte $46 ; | X   XX | $FD48
    .byte $26 ; |  X  XX | $FD49
    .byte $56 ; | X X XX | $FD4A
    .byte $6A ; | XX X X | $FD4B
    .byte $64 ; | XX  X  | $FD4C
    .byte $62 ; | XX   X | $FD4D
    .byte $3C ; |  XXXX  | $FD4E
One:
    .byte $3C ; |  XXXX  | $FD4F
    .byte $18 ; |   XX   | $FD50
    .byte $18 ; |   XX   | $FD51
    .byte $18 ; |   XX   | $FD52
    .byte $18 ; |   XX   | $FD53
    .byte $18 ; |   XX   | $FD54
    .byte $38 ; |  XXX   | $FD55
    .byte $18 ; |   XX   | $FD56
Two:
    .byte $7E ; | XXXXXX | $FD57
    .byte $60 ; | XX     | $FD58
    .byte $60 ; | XX     | $FD59
    .byte $3C ; |  XXXX  | $FD5A
    .byte $06 ; |     XX | $FD5B
    .byte $06 ; |     XX | $FD5C
    .byte $46 ; | X   XX | $FD5D
    .byte $3C ; |  XXXX  | $FD5E
Three:
    .byte $3C ; |  XXXX  | $FD5F
    .byte $46 ; | X   XX | $FD60
    .byte $06 ; |     XX | $FD61
    .byte $0C ; |    XX  | $FD62
    .byte $0C ; |    XX  | $FD63
    .byte $06 ; |     XX | $FD64
    .byte $46 ; | X   XX | $FD65
    .byte $3C ; |  XXXX  | $FD66
Four:
    .byte $0C ; |    XX  | $FD67
    .byte $0C ; |    XX  | $FD68
    .byte $0C ; |    XX  | $FD69
    .byte $7E ; | XXXXXX | $FD6A
    .byte $4C ; | X  XX  | $FD6B
    .byte $2C ; |  X XX  | $FD6C
    .byte $1C ; |   XXX  | $FD6D
    .byte $0C ; |    XX  | $FD6E
Five:
    .byte $7C ; | XXXXX  | $FD6F
    .byte $46 ; | X   XX | $FD70
    .byte $06 ; |     XX | $FD71
    .byte $06 ; |     XX | $FD72
    .byte $7C ; | XXXXX  | $FD73
    .byte $60 ; | XX     | $FD74
    .byte $60 ; | XX     | $FD75
    .byte $7E ; | XXXXXX | $FD76
Six:
    .byte $3C ; |  XXXX  | $FD77
    .byte $66 ; | XX  XX | $FD78
    .byte $66 ; | XX  XX | $FD79
    .byte $66 ; | XX  XX | $FD7A
    .byte $7C ; | XXXXX  | $FD7B
    .byte $60 ; | XX     | $FD7C
    .byte $62 ; | XX   X | $FD7D
    .byte $3C ; |  XXXX  | $FD7E
Seven:
    .byte $30 ; |  XX    | $FD7F
    .byte $30 ; |  XX    | $FD80
    .byte $30 ; |  XX    | $FD81
    .byte $30 ; |  XX    | $FD82
    .byte $18 ; |   XX   | $FD83
    .byte $0C ; |    XX  | $FD84
    .byte $06 ; |     XX | $FD85
    .byte $7E ; | XXXXXX | $FD86
Eight:
    .byte $3C ; |  XXXX  | $FD87
    .byte $66 ; | XX  XX | $FD88
    .byte $66 ; | XX  XX | $FD89
    .byte $66 ; | XX  XX | $FD8A
    .byte $3C ; |  XXXX  | $FD8B
    .byte $66 ; | XX  XX | $FD8C
    .byte $66 ; | XX  XX | $FD8D
    .byte $3C ; |  XXXX  | $FD8E
Nine:
    .byte $3C ; |  XXXX  | $FD8F
    .byte $46 ; | X   XX | $FD90
    .byte $06 ; |     XX | $FD91
    .byte $3E ; |  XXXXX | $FD92
    .byte $66 ; | XX  XX | $FD93
    .byte $66 ; | XX  XX | $FD94
    .byte $66 ; | XX  XX | $FD95
    .byte $3C ; |  XXXX  | $FD96
LetterP:
    .byte $80 ; |X       | $FD97
    .byte $80 ; |X       | $FD98
    .byte $80 ; |X       | $FD99
    .byte $FC ; |XXXXXX  | $FD9A
    .byte $82 ; |X     X | $FD9B
    .byte $82 ; |X     X | $FD9C
    .byte $82 ; |X     X | $FD9D
    .byte $FC ; |XXXXXX  | $FD9E
LetterR:
    .byte $82 ; |X     X | $FD9F
    .byte $84 ; |X    X  | $FDA0
    .byte $88 ; |X   X   | $FDA1
    .byte $FC ; |XXXXXX  | $FDA2
    .byte $82 ; |X     X | $FDA3
    .byte $82 ; |X     X | $FDA4
    .byte $82 ; |X     X | $FDA5
    .byte $FC ; |XXXXXX  | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $00 ; |        | $FDA8
LFDA9:
    .byte $00 ; |        | $FDA9   playfield
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $80 ; |X       | $FDB2
    .byte $C0 ; |XX      | $FDB3
    .byte $E0 ; |XXX     | $FDB4
    .byte $F0 ; |XXXX    | $FDB5
    .byte $F8 ; |XXXXX   | $FDB6
    .byte $FC ; |XXXXXX  | $FDB7
    .byte $FE ; |XXXXXXX | $FDB8
    .byte $FF ; |XXXXXXXX| $FDB9
LFDBA:
    .byte $00 ; |        | $FDBA   playfield
    .byte $01 ; |       X| $FDBB
    .byte $03 ; |      XX| $FDBC
    .byte $07 ; |     XXX| $FDBD
    .byte $0F ; |    XXXX| $FDBE
    .byte $1F ; |   XXXXX| $FDBF
    .byte $3F ; |  XXXXXX| $FDC0
    .byte $7F ; | XXXXXXX| $FDC1
    .byte $FF ; |XXXXXXXX| $FDC2
    .byte $FF ; |XXXXXXXX| $FDC3
    .byte $FF ; |XXXXXXXX| $FDC4
    .byte $FF ; |XXXXXXXX| $FDC5
    .byte $FF ; |XXXXXXXX| $FDC6
    .byte $FF ; |XXXXXXXX| $FDC7
    .byte $FF ; |XXXXXXXX| $FDC8
    .byte $FF ; |XXXXXXXX| $FDC9
    .byte $FF ; |XXXXXXXX| $FDCA

    .byte $21 ; |  X    X| $FDCB
    .byte $10 ; |   X    | $FDCC
    .byte $40 ; | X      | $FDCD
    .byte $21 ; |  X    X| $FDCE
    .byte $F0 ; |XXXX    | $FDCF
    .byte $C0 ; |XX      | $FDD0
    .byte $21 ; |  X    X| $FDD1
    .byte $1F ; |   XXXXX| $FDD2
    .byte $40 ; | X      | $FDD3
    .byte $21 ; |  X    X| $FDD4
    .byte $FF ; |XXXXXXXX| $FDD5
    .byte $C0 ; |XX      | $FDD6
    .byte $3F ; |  XXXXXX| $FDD7
    .byte $10 ; |   X    | $FDD8
    .byte $40 ; | X      | $FDD9
    .byte $3F ; |  XXXXXX| $FDDA
    .byte $F0 ; |XXXX    | $FDDB
    .byte $C0 ; |XX      | $FDDC
    .byte $3F ; |  XXXXXX| $FDDD
    .byte $1F ; |   XXXXX| $FDDE
    .byte $40 ; | X      | $FDDF
    .byte $3F ; |  XXXXXX| $FDE0
    .byte $FF ; |XXXXXXXX| $FDE1
    .byte $C0 ; |XX      | $FDE2
    .byte $E1 ; |XXX    X| $FDE3
    .byte $10 ; |   X    | $FDE4
    .byte $40 ; | X      | $FDE5
    .byte $E1 ; |XXX    X| $FDE6
    .byte $F0 ; |XXXX    | $FDE7
    .byte $C0 ; |XX      | $FDE8
    .byte $E1 ; |XXX    X| $FDE9
    .byte $1F ; |   XXXXX| $FDEA
    .byte $40 ; | X      | $FDEB
    .byte $E1 ; |XXX    X| $FDEC
    .byte $FF ; |XXXXXXXX| $FDED
    .byte $C0 ; |XX      | $FDEE
    .byte $FF ; |XXXXXXXX| $FDEF
    .byte $10 ; |   X    | $FDF0
    .byte $40 ; | X      | $FDF1
    .byte $FF ; |XXXXXXXX| $FDF2
    .byte $F0 ; |XXXX    | $FDF3
    .byte $C0 ; |XX      | $FDF4
    .byte $FF ; |XXXXXXXX| $FDF5
    .byte $1F ; |   XXXXX| $FDF6
    .byte $40 ; | X      | $FDF7
    .byte $FF ; |XXXXXXXX| $FDF8
    .byte $FF ; |XXXXXXXX| $FDF9
    .byte $C0 ; |XX      | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $00 ; |        | $FDFD
LFDFE:
    STA    $EE             ; 3
    CLC                    ; 2
    ADC    #$16            ; 2
    STA    $EF             ; 3
    JSR    LFE2B           ; 6
    TXA                    ; 2
LFE09:
    CMP    #$20            ; 2
    BCC    LFE14           ; 2³
    SBC    #$20            ; 2
    DEY                    ; 2
    DEY                    ; 2
    JMP    LFE09           ; 3

LFE14:
    STA    $F0             ; 3
    ADC    $EE             ; 3
    STA    ($B0),Y         ; 6
    CMP    $EF             ; 3
    BCC    LFE2A           ; 2³
    LDA    $EE             ; 3
    SBC    #$21            ; 2
    ADC    $F0             ; 3
    DEY                    ; 2
    DEY                    ; 2
    BEQ    LFE2A           ; 2³
    STA    ($B0),Y         ; 6
LFE2A:
    RTS                    ; 6

LFE2B:
    LDY    #0              ; 2
    LDA    #$6D            ; 2
LFE2F:
    INY                    ; 2
    INY                    ; 2
    STA    ($B0),Y         ; 6
    CPY    #8              ; 2
    BNE    LFE2F           ; 2³
    RTS                    ; 6

LFE38:
    AND    #$30            ; 2
    TAX                    ; 2
    LDA    $F6             ; 3
    ORA    #$80            ; 2
    CPX    #0              ; 2
    BEQ    LFE49           ; 2³
    CPX    #$30            ; 2
    BEQ    LFE49           ; 2³
    EOR    #$80            ; 2
LFE49:
    STA    $F6             ; 3
    RTS                    ; 6

LFE4C SUBROUTINE
    LDY    #0              ; 2
    STY    $D2             ; 3
    STY    $D8             ; 3
    STY    $D9             ; 3
    STY    $AE             ; 3
    STY    $C0             ; 3
    STY    $B5             ; 3
    STY    $B6             ; 3
    LDX    #8              ; 2
    LDA    #$26            ; 2
LFE60:
    STA    $8F,X           ; 4
    STY    $97,X           ; 4
    DEX                    ; 2
    DEX                    ; 2
    BNE    LFE60           ; 2³
    LDX    #7              ; 2
    LDY    #$6D            ; 2
LFE6C:
    STY    $88,X           ; 4
    DEX                    ; 2
    BPL    LFE6C           ; 2³
    LDX    #$72            ; 2
    STX    $AB             ; 3
LFE75:
    LDA    #$74            ; 2
    STA    $9E             ; 3
    LDA    #$8E            ; 2
    STA    $B0             ; 3
    LDA    #$4D            ; 2
    JSR    LFDFE           ; 6
ClearCollisions:
    STA    CXCLR           ; 3
    RTS                    ; 6

LFE85 SUBROUTINE
    LDY    #0              ; 2
    STA    $F1             ; 3
    CMP    #$99            ; 2
    BCC    LFEA4           ; 2³
    CMP    #$A0            ; 2
    BNE    LFE95           ; 2³
    LDA    #0              ; 2
    BEQ    LFEC3           ; 2³
LFE95:
    CMP    #$FE            ; 2
    BCC    LFE9B           ; 2³
    LDA    #$9F            ; 2
LFE9B:
    STA    $F1             ; 3
    LDA    #$A0            ; 2
    SBC    $F1             ; 3
    JMP    LFEB9           ; 3

LFEA4:
    CMP    #$0F            ; 2
    BCC    LFEAF           ; 2³
.loopDivide:
    SBC    #$0F            ; 2
    INY                    ; 2
    CMP    #$0F            ; 2
    BCS    .loopDivide     ; 2³
LFEAF:
    EOR    #$0F            ; 2   flip the bits in the lower nybble A register
    CMP    #8              ; 2
    BCC    LFEB8           ; 2³
    ADC    #0              ; 2   this in effects clears the carry
    DEY                    ; 2   decrease to keep Y the same when it increases?
LFEB8:
    INY                    ; 2
LFEB9:
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    ASL                    ; 2
    STY    $F0             ; 3
    ORA    $F0             ; 3
    LDY    $F1             ; 3
LFEC3:
    RTS                    ; 6

LFEC4 SUBROUTINE
    LDA    $BA             ; 3
    LSR                    ; 2   divide by two
    EOR    $BA             ; 3
    LSR                    ; 2
    ROR    $BA             ; 5
    LDA    $BA             ; 3
    RTS                    ; 6

LFECF:
    LDA    #0              ; 2
    STA    $CC             ; 3
    STA    $CE             ; 3
    SED                    ; 2
    LDA    #$82            ; 2
    LDY    $AF             ; 3
    BPL    LFEDE           ; 2³
    LDA    #$85            ; 2
LFEDE:
    STA    $B0             ; 3
    BIT    $F9             ; 3
    BVC    LFEFD           ; 2³
    LDY    #0              ; 2
LFEE6:
    LDA    ($B0),Y         ; 5
    CMP.wy $CC,Y           ; 4
    BEQ    LFEEF           ; 2³
    BCS    LFEFD           ; 2³
LFEEF:
    INY                    ; 2
    CPY    #2              ; 2
    BNE    LFEE6           ; 2³
    LDA    #0              ; 2
LFEF6:
    STA    ($B0),Y         ; 6
    DEY                    ; 2
    BPL    LFEF6           ; 2³
    BMI    LFF19           ; 2³+1
LFEFD:
    LDY    #2              ; 2
    CLC                    ; 2
    BIT    $F9             ; 3
    BVC    LFF05           ; 2³
    SEC                    ; 2
LFF05:
    LDA    ($B0),Y         ; 5
    BIT    $F9             ; 3
    BVC    LFF11           ; 2³
    SBC.wy $CC,Y           ; 4
    JMP    LFF14           ; 3

LFF11:
    ADC.wy $CC,Y           ; 4
LFF14:
    STA    ($B0),Y         ; 6
    DEY                    ; 2
    BPL    LFF05           ; 2³
LFF19:
    CLD                    ; 2
    RTS                    ; 6

LFF1B:
    .byte $FB,$FD
LFF1D:
    .byte $86,$87

LFF1F SUBROUTINE
    LDX    #7              ; 2
LFF21:
    JSR    LFEC4           ; 6
    AND    #$0F            ; 2
    BEQ    LFF21           ; 2³
    CMP    #$0F            ; 2
    BEQ    LFF21           ; 2³
    STA    $A2,X           ; 4
    DEX                    ; 2
    BNE    LFF21           ; 2³
    LDA    #$10            ; 2
    STA    $A2             ; 3
    RTS                    ; 6

    .byte $13 ; |   X  XX| $FF36
    .byte $A8 ; |X X X   | $FF37
    .byte $AC ; |X X XX  | $FF38
LFF39:
    .byte $00 ; |        | $FF39   frequency
    .byte $1C ; |   XXX  | $FF3A
    .byte $19 ; |   XX  X| $FF3B
    .byte $16 ; |   X XX | $FF3C
    .byte $15 ; |   X X X| $FF3D
    .byte $13 ; |   X  XX| $FF3E
    .byte $11 ; |   X   X| $FF3F
    .byte $10 ; |   X    | $FF40
    .byte $0E ; |    XXX | $FF41
    .byte $0D ; |    XX X| $FF42
    .byte $9F ; |X  XXXXX| $FF43
    .byte $0B ; |    X XX| $FF44
    .byte $0A ; |    X X | $FF45
    .byte $09 ; |    X  X| $FF46
    .byte $98 ; |X  XX   | $FF47
    .byte $5F ; | X XXXXX| $FF48
LFF49:
    .byte $5B ; | X XX XX| $FF49
    .byte $4F ; | X  XXXX| $FF4A
    .byte $A4 ; |X X  X  | $FF4B
    .byte $36 ; |  XX XX | $FF4C
    .byte $F8 ; |XXXXX   | $FF4D
    .byte $92 ; |X  X  X | $FF4E
    .byte $21 ; |  X    X| $FF4F
    .byte $22 ; |  X   X | $FF50
    .byte $23 ; |  X   XX| $FF51
    .byte $24 ; |  X  X  | $FF52
    .byte $25 ; |  X  X X| $FF53
    .byte $26 ; |  X  XX | $FF54
    .byte $27 ; |  X  XXX| $FF55
    .byte $28 ; |  X X   | $FF56
    .byte $29 ; |  X X  X| $FF57
    .byte $2A ; |  X X X | $FF58
    .byte $2B ; |  X X XX| $FF59
    .byte $00 ; |        | $FF5A
    .byte $86 ; |X    XX | $FF5B
    .byte $86 ; |X    XX | $FF5C
    .byte $87 ; |X    XXX| $FF5D
    .byte $88 ; |X   X   | $FF5E
    .byte $88 ; |X   X   | $FF5F
    .byte $87 ; |X    XXX| $FF60
    .byte $86 ; |X    XX | $FF61
    .byte $85 ; |X    X X| $FF62
    .byte $84 ; |X    X  | $FF63
    .byte $84 ; |X    X  | $FF64
    .byte $85 ; |X    X X| $FF65
    .byte $86 ; |X    XX | $FF66
    .byte $86 ; |X    XX | $FF67
    .byte $85 ; |X    X X| $FF68
    .byte $F5 ; |XXXX X X| $FF69
    .byte $86 ; |X    XX | $FF6A
    .byte $86 ; |X    XX | $FF6B
    .byte $87 ; |X    XXX| $FF6C
    .byte $88 ; |X   X   | $FF6D
    .byte $88 ; |X   X   | $FF6E
    .byte $87 ; |X    XXX| $FF6F
    .byte $86 ; |X    XX | $FF70
    .byte $85 ; |X    X X| $FF71
    .byte $84 ; |X    X  | $FF72
    .byte $84 ; |X    X  | $FF73
    .byte $85 ; |X    X X| $FF74
    .byte $86 ; |X    XX | $FF75
    .byte $85 ; |X    X X| $FF76
    .byte $84 ; |X    X  | $FF77
    .byte $F4 ; |XXXX X  | $FF78
    .byte $00 ; |        | $FF79
LFF7A:
    .byte $D7 ; |XX X XXX| $FF7A   color bottom border
    .byte $C7 ; |XX   XXX| $FF7B
    .byte $E7 ; |XXX  XXX| $FF7C
    .byte $37 ; |  XX XXX| $FF7D
    .byte $47 ; | X   XXX| $FF7E
    .byte $57 ; | X X XXX| $FF7F
    .byte $B7 ; |X XX XXX| $FF80
    .byte $67 ; | XX  XXX| $FF81
LFF82:
    .byte $DA ; |XX XX X | $FF82   colors playfield
    .byte $CA ; |XX  X X | $FF83
    .byte $EA ; |XXX X X | $FF84
    .byte $3A ; |  XXX X | $FF85
    .byte $4A ; | X  X X | $FF86
    .byte $5A ; | X XX X | $FF87
    .byte $BA ; |X XXX X | $FF88
    .byte $6A ; | XX X X | $FF89
LFF8A:
    .byte $80 ; |X       | $FF8A
    .byte $40 ; | X      | $FF8B
    .byte $20 ; |  X     | $FF8C
    .byte $10 ; |   X    | $FF8D
    .byte $08 ; |    X   | $FF8E
    .byte $04 ; |     X  | $FF8F
    .byte $02 ; |      X | $FF90
    .byte $01 ; |       X| $FF91
    .byte $54 ; | X X X  | $FF92
    .byte $58 ; | X XX   | $FF93

Lives:
    .byte $00 ; |        | $FF94
    .byte $7E ; | XXXXXX | $FF95
    .byte $66 ; | XX  XX | $FF96
    .byte $7E ; | XXXXXX | $FF97
    .byte $5A ; | X XX X | $FF98
    .byte $FF ; |XXXXXXXX| $FF99
    .byte $3C ; |  XXXX  | $FF9A
    .byte $3C ; |  XXXX  | $FF9B

ColorLivesTab:
    .byte BROWN     ; |        |
    .byte BROWN     ; | XXXXXX | face
    .byte BROWN     ; | XX  XX |
    .byte BROWN     ; | XXXXXX |
    .byte BROWN     ; | X XX X |
    .byte VIOLET+4  ; |XXXXXXXX| hat
    .byte VIOLET+4  ; |  XXXX  |
    .byte VIOLET+4  ; |  XXXX  |

    .byte $FB ; |XXXXX XX| $FFA4
    .byte $88 ; |X   X   | $FFA5
    .byte $88 ; |X   X   | $FFA6
    .byte $89 ; |X   X  X| $FFA7
    .byte $88 ; |X   X   | $FFA8
    .byte $FB ; |XXXXX XX| $FFA9
    .byte $FB ; |XXXXX XX| $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
SizeCopyTab:
    .byte $00 ; |        | $FFB0   NUSIZ0, X is in $81
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $01 ; |       X| $FFB3
    .byte $03 ; |      XX| $FFB4
LFFB5:
    .byte $03 ; |      XX| $FFB5
    .byte $03 ; |      XX| $FFB6
    .byte $02 ; |      X | $FFB7
    .byte $02 ; |      X | $FFB8
    .byte $02 ; |      X | $FFB9
    .byte $02 ; |      X | $FFBA
    .byte $01 ; |       X| $FFBB
    .byte $01 ; |       X| $FFBC
LFFBD:
    .byte $05 ; |     X X| $FFBD
    .byte $04 ; |     X  | $FFBE
    .byte $03 ; |      XX| $FFBF
    .byte $03 ; |      XX| $FFC0
    .byte $02 ; |      X | $FFC1
    .byte $02 ; |      X | $FFC2
    .byte $01 ; |       X| $FFC3
    .byte $01 ; |       X| $FFC4
LFFC5:
    .byte $01 ; |       X| $FFC5
    .byte $02 ; |      X | $FFC6
LFFC7:
    .byte $40 ; | X      | $FFC7
    .byte $80 ; |X       | $FFC8
LFFC9:
    .byte $BF ; |X XXXXXX| $FFC9
    .byte $7F ; | XXXXXXX| $FFCA
LFFCB:
    .byte $04 ; |     X  | $FFCB
    .byte $02 ; |      X | $FFCC
    .byte $81 ; |X      X| $FFCD
    .byte $41 ; | X     X| $FFCE
LFFCF:
    .byte $01 ; |       X| $FFCF
    .byte $02 ; |      X | $FFD0
    .byte $04 ; |     X  | $FFD1
    .byte $08 ; |    X   | $FFD2
LFFD3:
    .byte $30 ; |  XX    | $FFD3
    .byte $24 ; |  X  X  | $FFD4
    .byte $20 ; |  X     | $FFD5
    .byte $18 ; |   XX   | $FFD6
    .byte $12 ; |   X  X | $FFD7
    .byte $12 ; |   X  X | $FFD8
    .byte $10 ; |   X    | $FFD9
    .byte $10 ; |   X    | $FFDA
LFFDB:
    .byte $03 ; |      XX| $FFDB
    .byte $07 ; |     XXX| $FFDC
    .byte $06 ; |     XX | $FFDD
    .byte $07 ; |     XXX| $FFDE
    .byte $0D ; |    XX X| $FFDF
    .byte $0E ; |    XXX | $FFE0
    .byte $07 ; |     XXX| $FFE1
    .byte $0F ; |    XXXX| $FFE2
LFFE3:
    .byte $03 ; |      XX| $FFE3
    .byte $03 ; |      XX| $FFE4
    .byte $02 ; |      X | $FFE5
    .byte $01 ; |       X| $FFE6
    .byte $02 ; |      X | $FFE7
    .byte $01 ; |       X| $FFE8
    .byte $01 ; |       X| $FFE9
    .byte $01 ; |       X| $FFEA

LFFEB SUBROUTINE
    LDA    #2              ; 2
    STA    $80             ; 3
    LDA    #$6E            ; 2
    STA    $8A             ; 3
    LDA    #$96            ; 2
    STA    $88             ; 3
    RTS                    ; 6

    .byte $FE,$00

    ORG $FFFA

    .word START,START,START
