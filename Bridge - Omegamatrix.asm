; Rough disassembly of Bridge
; by Omegamatrix

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
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
HMOVE   =  $2A

; Read TIA Baseline = $00
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


ORIGINAL         = 1

TIME_OVERSCAN    = $23
TIME_VBLANK      = $2A

;colors
BLACK          = $00
BLUE           = $92
RED            = $44

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x41
ram_81             ds 1  ; x20
ram_82             ds 1  ; x14
ram_83             ds 1  ; x19
ram_84             ds 1  ; x12
ram_85             ds 1  ; x6
ram_86             ds 1  ; x7
ram_87             ds 1  ; x17
ram_88             ds 1  ; x47
ram_89             ds 1  ; x9
ram_8A             ds 2  ; x7
ram_8C             ds 4  ; x7
ram_90             ds 1  ; x10
ram_91             ds 2  ; x1
ram_93             ds 1  ; x1
ram_94             ds 2  ; x10
ram_96             ds 2  ; x1
ram_98             ds 26 ; x42
ram_B2             ds 26 ; x3
ram_CC             ds 1  ; x8
ram_CD             ds 4  ; x5
ram_D1             ds 4  ; x2
ram_D5             ds 8  ; x1
ram_DD             ds 1  ; x37 ; EOR screensaver
ram_DE             ds 1  ; x30
ram_DF             ds 1  ; x36
ram_E0             ds 1  ; x11
ram_E1             ds 1  ; x28
ram_E2             ds 1  ; x24
ram_E3             ds 1  ; x22

ram_E4             ds 1  ; x38
ram_E5             ds 1  ; x1
ram_E6             ds 1  ; x7
ram_E7             ds 1  ; x1
ram_E8             ds 1  ; x27
ram_E9             ds 1  ; x1
ram_EA             ds 2  ; x2
ram_EC             ds 2  ; x11
ram_EE             ds 2  ; x3
ram_F0             ds 1  ; x11
ram_F1             ds 1  ; x10
ram_F2             ds 1  ; x4
ram_F3             ds 1  ; x2
ram_F4             ds 1  ; x17
ram_F5             ds 1  ; x14
frameCounter       ds 1  ; x7
GameSelectLoPtr    ds 1  ; x9  ; holds low pointers to 1-7 number gfx, bit 7 is used to debounce select switch
ram_F8             ds 1  ; x11
ram_F9             ds 1  ; x3
ram_FA             ds 1  ; x3
ram_FB             ds 1  ; x2
ram_FC             ds 4  ; x1

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
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³
    jmp    Initialization        ; 3



.waitVblank:
    lda    INTIM                 ; 4
    bne    .waitVblank           ; 2³

    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$E0                  ; 2
    sty    HMP0                  ; 3
    sty    HMP1                  ; 3
    ldy    #3                    ; 2
LF01D:
    dey                          ; 2
    bpl    LF01D                 ; 2³
    ldy    #$08                  ; 2
    sta    RESP0                 ; 3
    sty    AUDV0                 ; 3
    ldy    #$03                  ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    ldx    #$0A                  ; 2
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    stx    AUDF0                 ; 3
LF03A:
    lda    #>BlankGfx            ; 2
    sta    ram_E5,X              ; 4   initially all gfx is blanked...
    lda    #<BlankGfx-1          ; 2
    sta    ram_E4,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF03A                 ; 2³

    lda    ram_85                ; 3
    bpl    LF057                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    ldy    #<MinusSignGfx-1      ; 2
    sty    ram_E4                ; 3   1st digit
    ldy    ram_F1                ; 3
    sty    COLUP0                ; 3
LF057:
    sta    ram_E6                ; 3   2nd digit
    sec                          ; 2
    sbc    #<TenGfx-1            ; 2
    bmi    LF064                 ; 2³
    ldy    #<OneGfx-1            ; 2
    sty    ram_E6                ; 3   2nd digit
    sta    ram_E8                ; 3   3rd digit
LF064:
    lda    ram_87                ; 3
    cmp    #5                    ; 2
    bne    LF06E                 ; 2³
    lda    #<BlankGfx-1          ; 2
    bne    LF073                 ; 3   always branch

LF06E:
    and    #$38                  ; 2
    clc                          ; 2
    adc    #$08                  ; 2
LF073:
    sta    ram_EC                ; 3   5th digit
    lda    ram_87                ; 3
    and    #$07                  ; 2
    tay                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_83                ; 3
    and    ram_CC                ; 3
    bpl    LF089                 ; 2³
    lda    #<BlankGfx-1          ; 2
    sta    ram_EC                ; 3
    ldy    #6                    ; 2   BlankGfx
LF089:
    lda    CharGfxTab,Y          ; 4
    sta    ram_EE                ; 3   6th digit
    lda    ram_F0,X              ; 4
    sta    COLUP1                ; 3
    jsr    SixByteDisplay        ; 6
    iny                          ; 2   Y=1
    sty    ram_E2                ; 3
    sty    CTRLPF                ; 3
LF09A:
    lda    #0                    ; 2   PF1, create indent
    jsr    BlueLineKernel        ; 6
    eor    #$02                  ; 2
    sta    COLUBK                ; 3
    lda    #6                    ; 2
    sta    ram_E0                ; 3
    lsr                          ; 2   A=3
    sta    ram_DF                ; 3
LF0AA:
    ldy    ram_DF                ; 3
    tya                          ; 2
    ldx    ram_E2                ; 3
    bne    LF0B3                 ; 2³
    ora    #$08                  ; 2
LF0B3:
    tax                          ; 2
    lda.wy ram_F0,Y              ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    CharGfxTab,Y          ; 4
    sta    ram_E4                ; 3
    lda    ram_CD,X              ; 4
    sta    ram_DE                ; 3
    ldy    ram_D1,X              ; 4
LF0C6:
    ldx    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF0CA:
    lda.wy ram_98,Y              ; 4
    bmi    LF0D1                 ; 2³
    bpl    LF0D3                 ; 3   always branch

LF0D1:
    lda    #<BlankGfx-1          ; 2
LF0D3:
    and    #$F8                  ; 2
    dec    ram_DE                ; 5
    bmi    LF0DB                 ; 2³
    bpl    LF0DD                 ; 3   always branch

LF0DB:
    lda    #<BlankGfx-1          ; 2
LF0DD:
    sta    ram_E6,X              ; 4
    iny                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF0CA                 ; 2³
    sty    ram_DD                ; 3
    dec    ram_E0                ; 5
    jsr    SixByteDisplay        ; 6
    ldx    ram_DE                ; 3
    dex                          ; 2
    bmi    LF0FA                 ; 2³
    ldy    ram_DD                ; 3
    lda    #<BlankGfx-1          ; 2
    sta    ram_E4                ; 3
    bne    LF0C6                 ; 3   always branch

LF0FA:
    dec    ram_DF                ; 5
    bpl    LF0AA                 ; 2³
LF0FE:
    dec    ram_E0                ; 5
    bmi    LF10B                 ; 2³
    ldx    #$0A                  ; 2
LF104:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF104                 ; 2³
    bmi    LF0FE                 ; 3+1  always branch

LF10B:
    lda    #$E0                  ; 2
    jsr    BlueLineKernel        ; 6
    dec    ram_E2                ; 5
    bmi    LF17B                 ; 2³
    ldy    #$05                  ; 2
LF116:
    lda    #$A8                  ; 2
    sta    ram_E4                ; 3
    sta    ram_E6                ; 3
    sta    ram_E8                ; 3
    sta    ram_EA                ; 3
    sta    ram_EC                ; 3
    sta    ram_EE                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$01                  ; 2
LF128:
    stx    ram_DE                ; 3
    ldx    LFFC5,Y               ; 4
    lda    ram_94,X              ; 4
    sta    ram_DF                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    and    #$03                  ; 2
    sta    ram_E0                ; 3
    lda    CharGfxTab,X          ; 4
    ldx    LFFCB,Y               ; 4
    sta    ram_E4,X              ; 4
    lda    ram_DF                ; 3
    bmi    LF14E                 ; 2³
    cmp    #$0D                  ; 2
    bne    LF156                 ; 2³
    ror    ram_DF                ; 5
    lda    #<BlankGfx-1          ; 2
    bne    LF15E                 ; 3   always branch

LF14E:
    lda    frameCounter          ; 3
    and    #$08                  ; 2
    beq    LF156                 ; 2³
    lda    ram_DF                ; 3
LF156:
    and    #$78                  ; 2
    bne    LF15E                 ; 2³
    lda    #<BlankGfx-1          ; 2
    sta    ram_E4,X              ; 4
LF15E:
    ldx    LFFD1,Y               ; 4
    sta    ram_E4,X              ; 4
    ldx    ram_E0                ; 3
    lda    ram_F0,X              ; 4
    ldx    ram_DE                ; 3
    sta    COLUP0,X              ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF128                 ; 2³
    sty    ram_DD                ; 3
    jsr    SixByteDisplay        ; 6
    ldy    ram_DD                ; 3
    bpl    LF116                 ; 2³
    jmp    LF09A                 ; 3

LF17B:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$07                  ; 2
.loopLogoP0_repos:
    dey                          ; 2
    bpl    .loopLogoP0_repos     ; 2³
    lda    #$01                  ; 2
    ldy    #$07                  ; 2
    sta    RESP0                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
.loopLogo:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LogoOne,Y             ; 4
    sta    GRP0                  ; 3
    lda    LogoTwo,Y             ; 4
    sta    GRP1                  ; 3
    lda    LogoThree,Y           ; 4
    ldx    #4                    ; 2
.loopLogoDelay:
    dex                          ; 2
    bpl    .loopLogoDelay        ; 2³
    ldx    LogoFour,Y            ; 4
    dey                          ; 2
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    bpl    .loopLogo             ; 2³

    sty    PF0                   ; 3

    lda    #TIME_OVERSCAN        ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    AUDC0                 ; 3
    ldy    SWCHA                 ; 4
    sty    ram_E2                ; 3
    iny                          ; 2
    beq    LF1C4                 ; 2³
    ldx    #$02                  ; 2
    stx    ram_86                ; 3
    jsr    LFECC                 ; 6
LF1C4:
    inc    frameCounter          ; 5
    lda    ram_83                ; 3
    cmp    #$FE                  ; 2
    bcs    LF1F4                 ; 2³
    lda    frameCounter          ; 3
    jsr    LFDB0                 ; 6
    lda    #$FF                  ; 2
    bit    ram_83                ; 3
    bpl    LF247                 ; 2³+1
    bvc    LF1E2                 ; 2³
    cmp    ram_88                ; 3
    bne    LF1E6                 ; 2³
    bit    SWCHB                 ; 4
    bpl    LF1E6                 ; 2³
LF1E2:
    sta    ram_CC                ; 3
    bmi    LF1F4                 ; 3   always branch

LF1E6:
    jsr    LFD9C                 ; 6
    bmi    LF1F7                 ; 2³
    lda    ram_87                ; 3
    ldy    #$02                  ; 2
    ldx    #$80                  ; 2
    jsr    LFE68                 ; 6
LF1F4:
    jmp    .waitOverscan         ; 3

LF1F7:
    lda    ram_F8                ; 3
    beq    LF200                 ; 2³+1
    inc    ram_F8                ; 5
LF1FD:
    jmp    LF2CD                 ; 3

LF200:
    ldx    ram_80                ; 3
    bmi    LF20B                 ; 2³
    jsr    LFCE5                 ; 6
    cmp    #$05                  ; 2
    beq    LF1FD                 ; 2³+1
LF20B:
    sta    ram_DF                ; 3
    lda    ram_E2                ; 3
    and    #$30                  ; 2
    cmp    #$30                  ; 2
    beq    LF1FD                 ; 2³+1
    and    #$10                  ; 2
    tay                          ; 2
    lda    ram_87                ; 3
    cmp    #$05                  ; 2
    bne    LF226                 ; 2³
    lda    ram_DF                ; 3
    cpy    #$10                  ; 2
    beq    LF1FD                 ; 2³+1
    bne    LF22E                 ; 3   always branch

LF226:
    ldx    #$05                  ; 2
    clc                          ; 2
    adc    LFFA0,Y               ; 4
    bmi    LF242                 ; 2³
LF22E:
    cmp    #$35                  ; 2
    bcs    LF1FD                 ; 2³+1
    cmp    ram_DF                ; 3
    bcc    LF242                 ; 2³
    tax                          ; 2
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcc    LF242                 ; 2³
    txa                          ; 2
    adc    LFFA8,Y               ; 4
    tax                          ; 2
LF242:
    stx    ram_87                ; 3
    jmp    LF2C5                 ; 3

LF247:
    bit    ram_80                ; 3
    bvs    LF1F4                 ; 2³+1
    ldx    ram_CC                ; 3
    asl    ram_98,X              ; 6
    lsr    ram_98,X              ; 6
    lda    ram_80                ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    ram_E0                ; 3
    and    #$03                  ; 2
    bne    LF2CD                 ; 2³
    jsr    LFD9C                 ; 6
    bmi    LF298                 ; 2³
    lda    ram_98,X              ; 4
    and    #$03                  ; 2
    ora    ram_80                ; 3
    bpl    LF27A                 ; 2³
    sta    ram_80                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_E3                ; 3
    lda    ram_81                ; 3
    and    #$07                  ; 2
    ora    ram_E3                ; 3
    sta    ram_81                ; 3
    jmp    LF28F                 ; 3

LF27A:
    lda    ram_98,X              ; 4
    eor    ram_80                ; 3
    and    #$03                  ; 2
    beq    LF28F                 ; 2³
    lda    #$0F                  ; 2
    sta    AUDC0                 ; 3
    ldy    ram_80                ; 3
    jsr    LFE57                 ; 6
    bpl    LF298                 ; 2³
    ldx    ram_CC                ; 3
LF28F:
    jsr    LFE18                 ; 6
    lda    #$D0                  ; 2
    sta    ram_F8                ; 3
    bne    .waitOverscan         ; 3   always branch

LF298:
    lda    ram_F8                ; 3
    beq    LF2A0                 ; 2³
    inc    ram_F8                ; 5
    bne    LF2CD                 ; 2³
LF2A0:
    ldy    ram_E0                ; 3
    ldx    ram_CC                ; 3
    lda    #$01                  ; 2
    bit    ram_E2                ; 3
    bpl    LF2AE                 ; 2³
    bvs    LF2CD                 ; 2³
    lda    #$FF                  ; 2
LF2AE:
    sta    ram_E3                ; 3
LF2B0:
    clc                          ; 2
    txa                          ; 2
    adc    ram_E3                ; 3
    cmp    LFFC1,Y               ; 4
    bcs    LF2CD                 ; 2³
    cmp    LFFC0,Y               ; 4
    bcc    LF2CD                 ; 2³
    tax                          ; 2
    lda    ram_98,X              ; 4
    bmi    LF2B0                 ; 2³
    stx    ram_CC                ; 3
LF2C5:
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #$E8                  ; 2
    sta    ram_F8                ; 3
LF2CD:
    ldx    #$34                  ; 2
    lda    ram_83                ; 3
    bmi    LF2D5                 ; 2³
    ldx    ram_CC                ; 3
LF2D5:
    asl    ram_98,X              ; 6
    lda    frameCounter          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ror    ram_98,X              ; 6

.waitOverscan:
    ldx    INTIM                 ; 4
    bne    .waitOverscan         ; 2³

    lda    #TIME_VBLANK          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3      Vsync
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    sta    TIM64T                ; 4

    jsr    LFECC                 ; 6
    lda    frameCounter          ; 3
    bne    LF305                 ; 2³+1
    inc    ram_86                ; 5
    bne    LF305                 ; 2³
    sec                          ; 2
    ror    ram_86                ; 5
LF305:
    and    #$1F                  ; 2
    bne    LF30D                 ; 2³
    asl    GameSelectLoPtr       ; 5
    lsr    GameSelectLoPtr       ; 5
LF30D:
    lda    SWCHB                 ; 4
    lsr                          ; 2   reset pressed?
    bcc    DoReset                 ; 2³  - yes
    lsr                          ; 2   select pressed?
    bcc    LF322                 ; 2³  - yes
    asl    GameSelectLoPtr       ; 5   - no, clear the debouncer flag for the select switch
    lsr    GameSelectLoPtr       ; 5
    ldy    ram_83                ; 3
    iny                          ; 2
    beq    LF353                 ; 2³
    jmp    LF428                 ; 3

LF322:
    bit    GameSelectLoPtr       ; 3
    bmi    LF33D                 ; 2³
Initialization:
    jsr    InitializeRam         ; 6
    inx                          ; 2   X=0
    stx    frameCounter          ; 3
    clc                          ; 2
    lda    GameSelectLoPtr       ; 3
    adc    #$08                  ; 2   increase by one digit
    cmp    #<EightGfx-1          ; 2   have we gone pass game 7?
    bcc    LF337                 ; 2³
    lda    #<OneGfx-1            ; 2   if rollover, reset to one
LF337:
    sta    ram_85                ; 3
    ora    #$80                  ; 2   debouncer flag for select switch, increase the game select one time only!!
    sta    GameSelectLoPtr       ; 3
LF33D:
    lda    #$06                  ; 2
    sta    ram_87                ; 3
    lda    #$FE                  ; 2
    sta    ram_83                ; 3
    sta    ram_80                ; 3
    bne    LF350                 ; 3   always branch

DoReset:
    jsr    InitializeRam         ; 6
    lda    #$0C                  ; 2
    sta    ram_84                ; 3
LF350:
    jmp    LFCB2                 ; 3

LF353:
    dec    ram_84                ; 5
    lda    ram_84                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    ldy    LFFC0,X               ; 4
    lda    ram_84                ; 3
    cmp    #$03                  ; 2
    bcc    LF3D4                 ; 2³
    beq    LF3BC                 ; 2³
    cmp    #$08                  ; 2
    bcc    LF392                 ; 2³
    lda    #$0C                  ; 2
    sta    ram_DE                ; 3
LF36D:
    ldx    #$00                  ; 2
    jsr    LFECC                 ; 6
    eor    ram_FC                ; 3
    and    #$3F                  ; 2
    tax                          ; 2
    sec                          ; 2
    sbc    #$34                  ; 2
    bmi    LF37D                 ; 2³
    tax                          ; 2
LF37D:
    lda    ram_98,X              ; 4
    sta    ram_DD                ; 3
    lda.wy ram_98,Y              ; 4
    sta    ram_98,X              ; 4
    lda    ram_DD                ; 3
    sta.wy ram_98,Y              ; 5
    iny                          ; 2
    dec    ram_DE                ; 5
    bpl    LF36D                 ; 2³
    bmi    LF350                 ; 3   always branch

LF392:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$E0                  ; 2
LF397:
    sta    ram_80                ; 3
    lda.wy ram_98,Y              ; 4
    and    #$03                  ; 2
    tax                          ; 2
    clc                          ; 2
    lda    ram_88,X              ; 4
    adc    LFFC0,X               ; 4
    inc    ram_88,X              ; 6
    tax                          ; 2
    lda    ram_98,X              ; 4
    and    #$03                  ; 2
    ora    ram_80                ; 3
    sta    ram_98,X              ; 4
    iny                          ; 2
    sec                          ; 2
    lda    ram_80                ; 3
    sbc    #$10                  ; 2
    cmp    #$20                  ; 2
    bcs    LF397                 ; 2³
    bcc    LF350                 ; 3   always branch

LF3BC:
    ldx    #$33                  ; 2
LF3BE:
    lda    ram_98,X              ; 4
    and    #$0C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_DD                ; 3
    lda    ram_98,X              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    ora    ram_DD                ; 3
    sta    ram_98,X              ; 4
    dex                          ; 2
    bpl    LF3BE                 ; 2³
    bmi    LF3E1                 ; 3   always branch

LF3D4:
    cmp    #$01                  ; 2
    beq    LF3E4                 ; 2³
    bcc    LF40B                 ; 2³+1
    lda    #$00                  ; 2
    jsr    LFDB0                 ; 6
    sta    ram_81                ; 3
LF3E1:
    jmp    LFCB2                 ; 3

LF3E4:
    lda    #$02                  ; 2
    jsr    LFDB0                 ; 6
    cmp    #$0D                  ; 2
    bcs    LF400                 ; 2³+1
    ldx    ram_81                ; 3
    sta    ram_81                ; 3
    stx    ram_82                ; 3
    ldx    #$0C                  ; 2
LF3F5:
    ldy    ram_98,X              ; 4
    lda    ram_B2,X              ; 4
    sta    ram_98,X              ; 4
    sty    ram_B2,X              ; 4
    dex                          ; 2
    bpl    LF3F5                 ; 2³+1
LF400:
    ldx    #$07                  ; 2
LF402:
    lda    ram_E4,X              ; 4
    sta    ram_D5,X              ; 4
    dex                          ; 2
    bpl    LF402                 ; 2³
    bmi    LF3E1                 ; 3+1  always branch

LF40B:
    lda    GameSelectLoPtr       ; 3
    and    #$18                  ; 2
    tay                          ; 2

;  4 >> Y=$00
;1,5 >> Y=$08
;2,6 >> Y=$10
;3,7 >> Y=$18

    lda    #$C0                  ; 2
    sta    ram_83                ; 3
    lda    #$FF                  ; 2
    sta    ram_80                ; 3
    lda    ram_82                ; 3
    cmp    #$0D                  ; 2
    bcc    LF425                 ; 2³
    adc    ram_81                ; 3
    cmp    LFF80,Y               ; 4

;Y=$00, $00  ; $FF80
;Y=$08, $16  ; $FF88
;Y=$10, $1A  ; $FF90
;Y=$18, $1E  ; $FF98

    bcs    LF3E1                 ; 2³+1
LF425:
    jmp    DoReset                 ; 3

LF428:
    jsr    LFD69                 ; 6
    lda    ram_F8                ; 3
    beq    LF433                 ; 2³
    inc    ram_F8                ; 5
    bne    LF3E1                 ; 2³+1
LF433:
    bit    ram_83                ; 3
    bmi    LF43A                 ; 2³
    jmp    LF8D8                 ; 3

LF43A:
    ldx    #$07                  ; 2
    lda    ram_E0                ; 3
    ldy    ram_88                ; 3
    iny                          ; 2
    bne    LF44A                 ; 2³
    sty    ram_94                ; 3
    bit    SWCHB                 ; 4
    bmi    LF45F                 ; 2³
LF44A:
    lsr                          ; 2
    bcs    LF3E1                 ; 2³+1
    bne    LF400                 ; 2³
    cpy    #$00                  ; 2
    beq    LF468                 ; 2³
    bit    SWCHB                 ; 4
    bvs    LF468                 ; 2³
LF458:
    sta    ram_CD,X              ; 4
    dex                          ; 2
    bpl    LF458                 ; 2³
    bmi    LF46F                 ; 3   always branch

LF45F:
    ldy    #$FE                  ; 2
    sty    ram_94                ; 3
    lsr                          ; 2
    bcc    LF4E0                 ; 2³
    bne    LF400                 ; 2³
LF468:
    lda    ram_E4,X              ; 4
    sta    ram_CD,X              ; 4
    dex                          ; 2
    bpl    LF468                 ; 2³
LF46F:
    ldy    ram_80                ; 3
    bmi    LF4E0                 ; 2³
    bne    LF481                 ; 2³
    ldx    $88,Y                 ; 4
    cpx    #$05                  ; 2
    beq    LF425                 ; 2³
    lda    GameSelectLoPtr       ; 3
    and    #$20                  ; 2
    bne    LF488                 ; 2³  branch if game select is 4-7
LF481:
    ldx    $88,Y                 ; 4
    cpx    #$05                  ; 2
    bne    LF4E3                 ; 2³
    dey                          ; 2
LF488:
    ldx    #$07                  ; 2
LF48A:
    lda    ram_E4,X              ; 4
    sta    ram_CD,X              ; 4
    dex                          ; 2
    bpl    LF48A                 ; 2³
    lda.wy ram_88,Y              ; 4
    sta    ram_87                ; 3
    and    #$38                  ; 2
    clc                          ; 2
    adc    #$37                  ; 2
    eor    #$FF                  ; 2
    sta    ram_85                ; 3
    lda    #$00                  ; 2
    sta    ram_83                ; 3
    sta    ram_84                ; 3
    ldx    #$03                  ; 2
LF4A7:
    sta    ram_94,X              ; 4
    dex                          ; 2
    bpl    LF4A7                 ; 2³
LF4AC:
    inx                          ; 2
    lda    ram_88,X              ; 4
    eor    ram_87                ; 3
    and    #$07                  ; 2
    bne    LF4AC                 ; 2³
    ldy    #$CC                  ; 2
    txa                          ; 2
    lsr                          ; 2
    ldx    ram_89                ; 3
    lda    ram_88                ; 3
    sty    AUDC0                 ; 3
    sty    ram_88                ; 3
    sty    ram_F8                ; 3
    bcc    LF4CA                 ; 2³
    ldy    #$C4                  ; 2
    tax                          ; 2
    lda    ram_89                ; 3
LF4CA:
    sty    ram_80                ; 3
    and    #$07                  ; 2
    sta    ram_81                ; 3
    lda    ram_87                ; 3
    and    #$04                  ; 2
    bne    LF4D8                 ; 2³
    ldx    #$07                  ; 2
LF4D8:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_81                ; 3
    sta    ram_81                ; 3
LF4E0:
    jmp    LFCB2                 ; 3

LF4E3:
    bit    ram_83                ; 3
    bvs    LF4E0                 ; 2³
    lda    #$00                  ; 2
    sta    ram_DE                ; 3
    sta    ram_DF                ; 3
    ldx    #$03                  ; 2
LF4EF:
    lda    ram_E4,X              ; 4
    cmp    #$03                  ; 2
    bcs    LF4FB                 ; 2³
    eor    #$03                  ; 2
    adc    ram_DE                ; 3
    sta    ram_DE                ; 3
LF4FB:
    clc                          ; 2
    lda    ram_EC,X              ; 4
    beq    LF508                 ; 2³
    adc    ram_E4,X              ; 4
    cmp    #$05                  ; 2
    bcs    LF508                 ; 2³
    dec    ram_DF                ; 5
LF508:
    ror    ram_F5                ; 5
    dex                          ; 2
    bpl    LF4EF                 ; 2³+1
    clc                          ; 2
    lda    ram_82                ; 3
    adc    ram_DE                ; 3
    adc    ram_DF                ; 3
    sta    ram_DF                ; 3
    ldx    ram_80                ; 3
    beq    LF51D                 ; 2³
    jmp    LF687                 ; 3

LF51D:
    jsr    LFE35                 ; 6
    lda    ram_88                ; 3
    cmp    #$18                  ; 2
    bcs    LF59E                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF52E                 ; 2³
    jmp    LF5F3                 ; 3

LF52E:
    beq    LF537                 ; 2³
    cmp    #$01                  ; 2
    bne    LF59E                 ; 2³
    jmp    LF5C8                 ; 3

LF537:
    ldx    ram_88                ; 3
    ldy    ram_DF                ; 3
    cpy    #$06                  ; 2
    bcc    LF59E                 ; 2³
    cpy    #$0A                  ; 2
    bcc    LF561                 ; 2³
    jsr    LFD10                 ; 6
    cpy    #$0D                  ; 2
    bcc    LF5C3                 ; 2³
    cpy    #$10                  ; 2
    bcc    LF5A1                 ; 2³
    cpy    #$13                  ; 2
    bcc    LF557                 ; 2³
    lda    ram_F4                ; 3
    jmp    LF64D                 ; 3

LF557:
    ldy    ram_82                ; 3
    cpy    #$10                  ; 2
    bcc    LF5AF                 ; 2³
    lda    #$14                  ; 2
    bcs    LF5BD                 ; 3   always branch

LF561:
    lda    #$00                  ; 2
    jsr    LFD11                 ; 6
    ldx    ram_88                ; 3
    cpx    #$02                  ; 2
    bcc    LF582                 ; 2³
    ldy    ram_E4,X              ; 4
    cpy    #$03                  ; 2
    bcc    LF582                 ; 2³
    cpy    #$05                  ; 2
    bcc    LF57C                 ; 2³
    ldy    ram_DE                ; 3
    cpy    #$02                  ; 2
    bcs    LF5E0                 ; 2³
LF57C:
    lda    #$08                  ; 2
LF57E:
    ora    ram_88                ; 3
    bne    LF5E3                 ; 3   always branch

LF582:
    lda    ram_F4                ; 3
    ldx    ram_E2                ; 3
    cpx    #$04                  ; 2
    bcs    LF5E3                 ; 2³
    ldx    ram_88                ; 3
    cpx    #$02                  ; 2
    bcs    LF596                 ; 2³
    ldy    ram_E4,X              ; 4
    cpy    #$04                  ; 2
    bcs    LF57C                 ; 2³
LF596:
    lda    #$04                  ; 2
    ldx    ram_82                ; 3
    cpx    #$06                  ; 2
    bcs    LF5E3                 ; 2³
LF59E:
    jmp    LF8C9                 ; 3

LF5A1:
    ldx    ram_88                ; 3
    cpx    #$02                  ; 2
    bcc    LF5AF                 ; 2³
    lda    #$10                  ; 2
    ldy    ram_E4,X              ; 4
    cpy    #$04                  ; 2
    bcs    LF57E                 ; 2³
LF5AF:
    lda    #$0C                  ; 2
    ldy    ram_E2                ; 3
    cpy    #$05                  ; 2
    bcs    LF5C3                 ; 2³
    ldy    ram_82                ; 3
    cpy    #$0D                  ; 2
    bcc    LF5C3                 ; 2³
LF5BD:
    ldy    ram_DE                ; 3
    cpy    #$02                  ; 2
    bcc    LF5E3                 ; 2³
LF5C3:
    lda    ram_F4                ; 3
    jmp    LF836                 ; 3

LF5C8:
    lda    ram_88                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    jsr    LFD10                 ; 6
    ldy    ram_DF                ; 3
    cpy    #$06                  ; 2
    bcs    LF5E6                 ; 2³
    ldx    ram_E1                ; 3
    lda    #$0C                  ; 2   2 NT
    ldy    ram_E4,X              ; 4
    cpy    #$03                  ; 2
    bcc    LF5E3                 ; 2³
LF5E0:
    lda    LFEEE,X               ; 4
LF5E3:
    jmp    LF8BA                 ; 3

LF5E6:
    ldx    ram_E1                ; 3
    txa                          ; 2
    ora    #$10                  ; 2
    ldy    ram_E4,X              ; 4
    cpy    #$03                  ; 2
    bcs    LF5E3                 ; 2³
    bcc    LF5C3                 ; 3   always branch

LF5F3:
    lda    ram_88                ; 3
    and    #$18                  ; 2
    tay                          ; 2
    ldx    ram_82                ; 3
    jsr    LFD40                 ; 6
    lda    ram_DF                ; 3
    adc    LFF40,Y               ; 4
    cmp    ram_F1                ; 3
    bcs    LF608                 ; 2³
    lda    ram_F1                ; 3
LF608:
    cmp    #$21                  ; 2
    bcs    LF627                 ; 2³
    cpy    #$10                  ; 2
    beq    LF684                 ; 2³
    cmp    #$1A                  ; 2
    bcs    LF627                 ; 2³
    tya                          ; 2
    bne    LF684                 ; 2³
    ldx    ram_F4                ; 3
    bne    LF61D                 ; 2³
    ldx    ram_F5                ; 3
LF61D:
    txa                          ; 2
    ldy    ram_E4,X              ; 4
    cpy    #$05                  ; 2
    bcc    LF684                 ; 2³
LF624:
    jmp    LF836                 ; 3

LF627:
    lda    #$00                  ; 2
    ldy    ram_E6                ; 3
    cpy    #$04                  ; 2
    beq    LF624                 ; 2³
    ldy    ram_E7                ; 3
    cpy    #$04                  ; 2
    beq    LF624                 ; 2³
    ldx    #$03                  ; 2
    cpy    ram_E6                ; 3
    bcs    LF63C                 ; 2³
    dex                          ; 2
LF63C:
    ldy    ram_E4,X              ; 4
    cpy    #$05                  ; 2
    bcc    LF660                 ; 2³
    cpy    #$06                  ; 2
    bcs    LF64C                 ; 2³
    ldy    ram_88                ; 3
    cpy    #$04                  ; 2
    bne    LF624                 ; 2³
LF64C:
    txa                          ; 2
LF64D:
    jsr    LFCFC                 ; 6
    cmp    #$18                  ; 2   4 clubs
    bcc    LF65A                 ; 2³  if less than 4's of anything
    ldy    ram_F1                ; 3
    cpy    #$21                  ; 2
    bcc    LF65D                 ; 2³
LF65A:
    clc                          ; 2
    adc    #$08                  ; 2
LF65D:
    jmp    LF8BA                 ; 3

LF660:
    lda    #$34                  ; 2
    ldx    #$24                  ; 2
LF664:
    cpx    ram_F2                ; 3
    bcc    LF65D                 ; 2³
    sbc    #$10                  ; 2
    cpx    ram_F1                ; 3
    bcc    LF65D                 ; 2³
    ldx    #$20                  ; 2
    adc    #$07                  ; 2
    cmp    #$2C                  ; 2
    beq    LF664                 ; 2³
    lda    #$14                  ; 2
    ldx    #$19                  ; 2
    cpx    ram_F2                ; 3
    bcc    LF65D                 ; 2³
    lda    ram_88                ; 3
    cpx    ram_F1                ; 3
    bcc    LF65A                 ; 2³
LF684:
    jmp    LF8C9                 ; 3

LF687:
    ldy    #$70                  ; 2
    lda    ram_88,X              ; 4
    cmp    #$1C                  ; 2
    bcc    LF6E9                 ; 2³
    beq    LF69D                 ; 2³
    ldy    ram_86,X              ; 4
    cpy    #$1C                  ; 2
    bne    LF6A3                 ; 2³
    ldy    #$68                  ; 2
    cmp    #$24                  ; 2
    bne    LF6A3                 ; 2³
LF69D:
    jsr    LFD4E                 ; 6
LF6A0:
    jmp    LF836                 ; 3

LF6A3:
    cpx    #$04                  ; 2
    bcc    LF684                 ; 2³
    lda    ram_87,X              ; 4
    cmp    #$1C                  ; 2
    bne    LF6CE                 ; 2³
    ldy    #$70                  ; 2
    jsr    LFD4E                 ; 6
    beq    LF6CA                 ; 2³
    cmp    #$03                  ; 2
    bcs    LF6DD                 ; 2³
    lda    #$20                  ; 2
    ora    ram_81                ; 3
    cmp    #$24                  ; 2
    beq    LF6C4                 ; 2³
    cmp    ram_88,X              ; 4
    bcs    LF6C7                 ; 2³
LF6C4:
    jsr    LFCE5                 ; 6
LF6C7:
    jmp    LF8BA                 ; 3

LF6CA:
    lda    #$24                  ; 2
    bne    LF6C7                 ; 3   always branch

LF6CE:
    cmp    #$24                  ; 2
    bne    LF684                 ; 2³
    ldy    #$68                  ; 2
    jsr    LFD4E                 ; 6
    bne    LF6DD                 ; 2³
    lda    #$30                  ; 2
    bne    LF6DF                 ; 3   always branch

LF6DD:
    lda    #$28                  ; 2
LF6DF:
    ora    ram_81                ; 3
    cmp    ram_88,X              ; 4
    bcs    LF6C7                 ; 2³
    lda    #$04                  ; 2
    bne    LF6A0                 ; 3   always branch

LF6E9:
    and    #$07                  ; 2
    tay                          ; 2
    lda    ram_88,X              ; 4
    cmp    LFEEE,Y               ; 4
    bcc    LF703                 ; 2³+1
    eor    ram_88                ; 3
    and    #$07                  ; 2
    beq    LF6FD                 ; 2³
    and    #$04                  ; 2
    beq    LF703                 ; 2³+1
LF6FD:
    lda    ram_89                ; 3
    and    #$04                  ; 2
    bne    LF684                 ; 2³+1
LF703:
    lda    ram_88                ; 3
    and    #$38                  ; 2
    tay                          ; 2
    tax                          ; 2
    lda    ram_88                ; 3
    and    #$04                  ; 2
    sta    ram_DD                ; 3
    bne    LF786                 ; 2³
    ldy    #$18                  ; 2
    cpx    #$08                  ; 2
    beq    LF786                 ; 2³
    lda    ram_8A                ; 3
    and    #$07                  ; 2
    ldx    #$01                  ; 2
    jsr    LFCFE                 ; 6
    cmp    ram_8A                ; 3
    beq    LF747                 ; 2³
    ldy    #$38                  ; 2
    eor    ram_89                ; 3
    and    #$07                  ; 2
    beq    LF738                 ; 2³
    lda    ram_8A                ; 3
    eor    ram_88                ; 3
    and    #$07                  ; 2
    bne    LF786                 ; 2³
    ldy    #$30                  ; 2
    bne    LF786                 ; 3   always branch

LF738:
    ldy    #$30                  ; 2
    clc                          ; 2
    lda    ram_89                ; 3
    adc    #$10                  ; 2
    cmp    ram_8A                ; 3
    beq    LF786                 ; 2³
    ldy    #$38                  ; 2
    bne    LF786                 ; 3   always branch

LF747:
    ldy    #$28                  ; 2
    eor    ram_89                ; 3
    and    #$07                  ; 2
    beq    LF786                 ; 2³
    lda    ram_89                ; 3
    and    #$07                  ; 2
    ldx    #$00                  ; 2
    jsr    LFCFE                 ; 6
    cmp    ram_89                ; 3
    bne    LF786                 ; 2³
    lda    ram_8A                ; 3
    cmp    #$08                  ; 2
    bcc    LF786                 ; 2³
    and    #$07                  ; 2
    cmp    #$04                  ; 2
    bcs    LF786                 ; 2³
    sta    ram_E1                ; 3
    lda    ram_88                ; 3
    and    #$07                  ; 2
    cmp    ram_E1                ; 3
    beq    LF786                 ; 2³
    ldy    #$38                  ; 2
    bcc    LF786                 ; 2³
    lda    ram_8A                ; 3
    cmp    #$10                  ; 2
    bcs    LF786                 ; 2³
    ldy    #$28                  ; 2
    lda    ram_80                ; 3
    cmp    #$02                  ; 2
    bcs    LF786                 ; 2³
    ldy    #$20                  ; 2
LF786:
    sty    ram_F3                ; 3
    ldx    ram_DF                ; 3
    jsr    LFD40                 ; 6
    ldx    #$04                  ; 2
    ldy    #$00                  ; 2
LF791:
    sty    ram_E8,X              ; 4
    dex                          ; 2
    bpl    LF791                 ; 2³
LF796:
    lda.wy ram_88,Y              ; 4
    and    #$07                  ; 2
    tax                          ; 2
    cpy    #$02                  ; 2
    bne    LF7A8                 ; 2³
    cmp    #$01                  ; 2
    bne    LF7A8                 ; 2³
    lda    ram_DD                ; 3
    bne    LF7E6                 ; 2³
LF7A8:
    tya                          ; 2
    ror                          ; 2
    lda    ram_E8,X              ; 4
    bne    LF7CB                 ; 2³
    lda    #$7F                  ; 2
    bcs    LF7C1                 ; 2³
    lda    #$03                  ; 2
    cpy    #$00                  ; 2
    bne    LF7C1                 ; 2³
    lda    ram_88                ; 3
    cmp    #$08                  ; 2
    lda    #$02                  ; 2
    rol                          ; 2
    cpx    #$02                  ; 2
LF7C1:
    adc    ram_E4,X              ; 4
    bpl    LF7D9                 ; 2³
    ora    #$40                  ; 2
    sta    ram_E8,X              ; 4
    bmi    LF7E6                 ; 3   always branch

LF7CB:
    bcs    LF7E6                 ; 2³
    inc    ram_E8,X              ; 6
    bpl    LF7DB                 ; 2³
    asl                          ; 2
    asl                          ; 2
    lda    ram_E8,X              ; 4
    adc    #$02                  ; 2
    and    #$0F                  ; 2
LF7D9:
    sta    ram_E8,X              ; 4
LF7DB:
    ldx    #$04                  ; 2
LF7DD:
    lda    ram_E8,X              ; 4
    and    #$8F                  ; 2
    sta    ram_E8,X              ; 4
    dex                          ; 2
    bpl    LF7DD                 ; 2³
LF7E6:
    iny                          ; 2
    cpy    ram_80                ; 3
    bcc    LF796                 ; 2³
    beq    LF796                 ; 2³
    ldx    #$04                  ; 2
LF7EF:
    lda    ram_E8,X              ; 4
    and    #$0F                  ; 2
    sta    ram_E8,X              ; 4
    dex                          ; 2
    bpl    LF7EF                 ; 2³
    lda    #$07                  ; 2
    ldx    #$02                  ; 2
    jsr    LFD38                 ; 6
    bcs    LF83C                 ; 2³
LF801:
    stx    ram_81                ; 3
    lda    #$1C                  ; 2
    ldy    #$20                  ; 2
    cpy    ram_F1                ; 3
    bcc    LF839                 ; 2³
    lda    LFEEE,X               ; 4
    ldy    LFEF3,X               ; 4
    cpy    ram_F2                ; 3
    bcc    LF839                 ; 2³
    sbc    #$08                  ; 2
    cpy    ram_F1                ; 3
    ldx    ram_80                ; 3
    ldy    ram_81                ; 3
    bcs    LF82E                 ; 2³
    cmp    ram_88,X              ; 4
    beq    LF835                 ; 2³
    bcs    LF839                 ; 2³
LF825:
    tya                          ; 2
    jsr    LFCFC                 ; 6
    cmp    LFEEE,Y               ; 4
    bcc    LF839                 ; 2³
LF82E:
    tya                          ; 2
    eor    ram_88,X              ; 4
    and    #$07                  ; 2
    beq    LF839                 ; 2³
LF835:
    tya                          ; 2
LF836:
    jsr    LFCFC                 ; 6
LF839:
    jmp    LF8BA                 ; 3

LF83C:
    ldx    #$01                  ; 2
LF83E:
    inx                          ; 2
    cpx    #$04                  ; 2
    bcs    LF87E                 ; 2³
    lda    ram_80                ; 3
    lsr                          ; 2
    adc    #$03                  ; 2
    ldy    ram_E8,X              ; 4
    sty    ram_E2                ; 3
    bne    LF850                 ; 2³
    lda    #$03                  ; 2
LF850:
    ldy    #$04                  ; 2
    cpy    ram_DD                ; 3
    beq    LF85E                 ; 2³
    cpy    ram_8A                ; 3
    bne    LF860                 ; 2³
    cpx    ram_89                ; 3
    beq    LF860                 ; 2³
LF85E:
    adc    #$00                  ; 2
LF860:
    cmp    ram_E4,X              ; 4
    bcs    LF83E                 ; 2³
    txa                          ; 2
    jsr    LFCFC                 ; 6
    cmp    #$18                  ; 2
    bcc    LF870                 ; 2³
    ldy    ram_E2                ; 3
    beq    LF87E                 ; 2³
LF870:
    cmp    #$10                  ; 2
    bcs    LF8BA                 ; 2³
    ldy    ram_DF                ; 3
    cpy    #$0C                  ; 2
    bcc    LF8BA                 ; 2³
    adc    #$07                  ; 2
    bne    LF8BA                 ; 2³
LF87E:
    ldx    #$00                  ; 2
    lda    #$08                  ; 2
    jsr    LFD38                 ; 6
    bcc    LF8A3                 ; 2³
    lda    ram_EC                ; 3
    bne    LF89A                 ; 2³
    ldx    #$00                  ; 2
LF88D:
    asl    ram_F5                ; 5
    bcs    LF895                 ; 2³
    lda    ram_E8,X              ; 4
    beq    LF8A6                 ; 2³
LF895:
    inx                          ; 2
    cpx    #$04                  ; 2
    bcc    LF88D                 ; 2³
LF89A:
    ldx    ram_82                ; 3
    ldy    ram_F3                ; 3
    jsr    LFD40                 ; 6
    ldx    #$04                  ; 2
LF8A3:
    jmp    LF801                 ; 3

LF8A6:
    ldy    #$19                  ; 2
    cpy    ram_F1                ; 3
    bcs    LF8C9                 ; 2³
    ldx    ram_80                ; 3
    ldy    #$00                  ; 2
    lda    ram_E8                ; 3
    cmp    ram_E9                ; 3
    bcs    LF8B7                 ; 2³
    iny                          ; 2
LF8B7:
    jmp    LF825                 ; 3

;--------------------------------------------------------------------------------------------------

;From DP (http://www.digitpress.com/eastereggs/26bridge.htm)

; BUG: The original version allows you to bid 8, and crashes when you do.
; This was fixed in a re-released version (carts with a full screenshot on the label).
; To reproduce the bug, you must get the computer to bid 7 NT, and then the player
; bids 8 whatever and it crashes. If your starting bid is 6 NT, the computer will
; almost always bid 7 of something, often NT.  {Larry Kaplan}

;--------------------------------------------------------------------------------------------------

;This section of code seems to be reached:
;
;1) when the left difficult switch is set to "A", pro setting
;2) the opening bid has been made by you

;Set a "breakif pc==f8be" in Stella's debugger, and examine how the value in the
;accumulator relates to the "bid response" by the computer. The table below summerizies
;the results. Clearly anything above $35 must be in the 8's. So the computer must choose
;higher then 7 NT to crash the game in the original rom.


;        Club   Diamond  Heart  Spade  NoTrump      N/A   N/A   N/A

;1's      $00     $01     $02    $03     $04        $05   $06   $07
;2's      $08     $09     $0A    $0B     $0C        $0D   $0E   $0F
;3's      $10     $11     $12    $13     $14        $15   $16   $17
;4's      $18     $19     $1A    $1B     $1C        $1D   $1E   $1F
;5's      $20     $21     $22    $23     $24        $25   $26   $27
;6's      $28     $29     $2A    $2B     $2C        $2D   $2E   $2F
;7's      $30     $31     $32    $33     $34        $35   $36   $37

;I tried as much as I could, but I could never get the computer to bid higher then 6 NT...

;--------------------------------------------------------------------------------------------------

LF8BA:
    ldx    #$C0                  ; 2
    ldy    ram_80                ; 3
    cmp    #$35                  ; 2

  IF ORIGINAL
    bcs    LF8C9-1               ; 2³   This jumps between the operator and the operand... it is replaced by LF8C9 in the fixed rom
  ELSE
    bcs    LF8C9                 ; 2³
  ENDIF

    cmp.wy ram_88,Y              ; 4
    bcc    LF8C9                 ; 2³
    bne    LF8CD                 ; 2³

;LF8C8:                           ;     if the bad branch is left...
;    nop    $A9                   ; 3   NOP zero page
;    ora    $A2                   ; 3
;    nop    #$A0                  ; 2   NOP immediate
;    brk                          ; 7   the break vector contains $FFFF, big trouble!!

LF8C9:
    lda    #$05                  ; 2
    ldx    #$80                  ; 2
LF8CD:
    ldy    #$00                  ; 2
    jsr    LFE68                 ; 6
    jsr    LFCE5                 ; 6
    jmp    LF95C                 ; 3

LF8D8:
    lda    ram_84                ; 3
    cmp    #$04                  ; 2
    beq    LF909                 ; 2³+1
    bcs    LF91F                 ; 2³+1
    bit    ram_80                ; 3
    bvc    LF962                 ; 2³+1
    lda    ram_80                ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    ram_E0                ; 3
    and    #$03                  ; 2
    beq    LF8FC                 ; 2³
    lsr                          ; 2
    bcs    LF962                 ; 2³+1
    ldx    #$07                  ; 2
LF8F3:
    lda    ram_E8,X              ; 4
    sta    ram_88,X              ; 4
    dex                          ; 2
    bpl    LF8F3                 ; 2³
    bmi    LF962                 ; 3+1  always branch

LF8FC:
    lda    ram_88                ; 3
    cmp    #$CC                  ; 2
    beq    LF962                 ; 2³
    lda    ram_80                ; 3
    bpl    LF97C                 ; 2³
    jmp    LFAFF                 ; 3

LF909:
    ldx    ram_DE                ; 3
    lda    ram_94,X              ; 4
    ora    #$80                  ; 2
    sta    ram_94,X              ; 4
    inc    ram_84                ; 5
    txa                          ; 2
    lsr                          ; 2
    bcs    LF962                 ; 2³
    lda    ram_85                ; 3
    adc    #$08                  ; 2
    sta    ram_85                ; 3
    bne    LF962                 ; 2³
LF91F:
    jsr    LFD9C                 ; 6
    bmi    LF962                 ; 2³
    ldx    #$03                  ; 2
LF926:
    lda    #$00                  ; 2
    sta    ram_94,X              ; 4
    dex                          ; 2
    bpl    LF926                 ; 2³
    sta    ram_84                ; 3
    lda    SWCHA                 ; 4
    and    #$20                  ; 2
    beq    LF942                 ; 2³
    lda    #$CC                  ; 2
    sta    ram_88                ; 3
    inc    ram_83                ; 5
    lda    ram_83                ; 3
    cmp    #$0D                  ; 2
    bcc    LF965                 ; 2³
LF942:
    lda    #$C0                  ; 2
    sta    ram_83                ; 3
    stx    ram_80                ; 3
    stx    ram_88                ; 3
    clc                          ; 2
    lda    ram_87                ; 3
    adc    #$08                  ; 2
    sta    ram_96                ; 3
    ldx    #$33                  ; 2
LF953:
    asl    ram_98,X              ; 6
    lsr    ram_98,X              ; 6
    dex                          ; 2
    bpl    LF953                 ; 2³
    lda    #$05                  ; 2
LF95C:
    sta    ram_87                ; 3
LF95E:
    lda    #$C0                  ; 2
    sta    ram_F8                ; 3
LF962:
    jmp    LFCB2                 ; 3

LF965:
    lda    ram_DE                ; 3
    asl                          ; 2
    asl                          ; 2
    ora    #$C0                  ; 2
    sta    ram_80                ; 3
    lsr    ram_DE                ; 5
    bcs    LF95E                 ; 2³
    and    #$8F                  ; 2
    sta    ram_80                ; 3
    and    #$0C                  ; 2
    ora    ram_DF                ; 3
    jmp    LFC9B                 ; 3

LF97C:
    ldx    ram_E1                ; 3
    lda    ram_E4,X              ; 4
    beq    LF985                 ; 2³
    jmp    LFA5B                 ; 3

LF985:
    ldx    #$07                  ; 2
LF987:
    sta    ram_8C,X              ; 4
    dex                          ; 2
    bpl    LF987                 ; 2³
    ldy    #$0C                  ; 2
LF98E:
    lda.wy ram_98,Y              ; 4
    bmi    LF998                 ; 2³
    and    #$03                  ; 2
    tax                          ; 2
    inc    ram_8C,X              ; 6
LF998:
    lda.wy ram_B2,Y              ; 4
    bmi    LF9A2                 ; 2³
    and    #$03                  ; 2
    tax                          ; 2
    inc    ram_90,X              ; 6
LF9A2:
    dey                          ; 2
    bpl    LF98E                 ; 2³
    ldx    #$03                  ; 2
LF9A7:
    lda    ram_8C,X              ; 4
    cmp    ram_90,X              ; 4
    bcs    LF9AF                 ; 2³
    lda    ram_90,X              ; 4
LF9AF:
    ldy    #$00                  ; 2
    cmp    ram_E4,X              ; 4
    bcs    LF9B7                 ; 2³
    ldy    #$FF                  ; 2
LF9B7:
    sty    ram_8C,X              ; 4
    dex                          ; 2
    bpl    LF9A7                 ; 2³
    lda    ram_87                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    sta    ram_E2                ; 3
    cmp    #$04                  ; 2
    bcs    LFA14                 ; 2³+1
    lda    ram_E4,X              ; 4
    beq    LFA14                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_8C,X              ; 4
    cpx    ram_F5                ; 3
    bne    LF9D7                 ; 2³
    lda    ram_F4                ; 3
    sta    ram_F5                ; 3
LF9D7:
    cpx    ram_F4                ; 3
    bne    LF9E2                 ; 2³
    jsr    LFE35                 ; 6
    lda    ram_F5                ; 3
    sta    ram_F4                ; 3
LF9E2:
    ldx    ram_E2                ; 3
    cpx    ram_DF                ; 3
    bne    LF9F8                 ; 2³
    lda    ram_DE                ; 3
    lsr                          ; 2
    bcs    LFA14                 ; 2³+1
    ldy    ram_E8,X              ; 4
    lda.wy ram_98,Y              ; 4
    cmp    ram_DD                ; 3
    bcs    LFA6D                 ; 2³+1
    bcc    LFA14                 ; 3+1  always branch
LF9F8:
    lda    ram_84                ; 3
    cmp    #$01                  ; 2
    beq    LFA56                 ; 2³+1
    cmp    #$03                  ; 2
    beq    LFA0D                 ; 2³
    jsr    LFE4F                 ; 6
    bmi    LFA0D                 ; 2³
    ldx    ram_E2                ; 3
    cmp    ram_DD                ; 3
    bcs    LFA56                 ; 2³
LFA0D:
    ldx    ram_E2                ; 3
    lda    ram_DE                ; 3
    lsr                          ; 2
    bcc    LFA56                 ; 2³
LFA14:
    lda    ram_F4                ; 3
    ldy    #$03                  ; 2
LFA18:
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_8C,X              ; 4
    bne    LFA56                 ; 2³
    inx                          ; 2
    txa                          ; 2
    dey                          ; 2
    bpl    LFA18                 ; 2³
    ldx    ram_F5                ; 3
    sec                          ; 2
    lda    #$05                  ; 2
    sbc    ram_EC,X              ; 4
    bmi    LFA31                 ; 2³
    cmp    ram_E4,X              ; 4
    bcc    LFA56                 ; 2³
LFA31:
    ldy    ram_F4                ; 3
    ldx    $F0,Y                 ; 4
    lda    ram_98,X              ; 4
    sta    ram_E3                ; 3
    jsr    LFE57                 ; 6
    bmi    LFA42                 ; 2³
    cmp    ram_E3                ; 3
    bcs    LFA50                 ; 2³
LFA42:
    lda    ram_F4                ; 3
    ora    #$08                  ; 2
    tay                          ; 2
    jsr    LFE57                 ; 6
    bmi    LFA54                 ; 2³
    cmp    ram_E3                ; 3
    bcc    LFA54                 ; 2³
LFA50:
    ldx    ram_F4                ; 3
    bpl    LFA56                 ; 2³
LFA54:
    ldx    ram_F5                ; 3
LFA56:
    ldy    ram_F0,X              ; 4
    jmp    LFC86                 ; 3

LFA5B:
    cmp    #$01                  ; 2
    beq    LFA56                 ; 2³
    lda    ram_84                ; 3
    cmp    #$01                  ; 2
    beq    LFA70                 ; 2³
    cpx    ram_DF                ; 3
    bne    LFA56                 ; 2³
    cmp    #$02                  ; 2
    beq    LFAB2                 ; 2³
LFA6D:
    jmp    LFAE2                 ; 3

LFA70:
    jsr    LFE4F                 ; 6
    sta    ram_E3                ; 3
    bmi    LFA88                 ; 2³
    lda    ram_83                ; 3
    cmp    #$09                  ; 2
    bcs    LFA82                 ; 2³
    jsr    LFE64                 ; 6
    bpl    LFA84                 ; 2³
LFA82:
    lda    ram_E3                ; 3
LFA84:
    cmp    ram_DD                ; 3
    bcs    LFA8A                 ; 2³
LFA88:
    lda    ram_DD                ; 3
LFA8A:
    ldx    ram_E1                ; 3
    ldy    ram_88,X              ; 4
    beq    LFA95                 ; 2³
    cmp.wy ram_98,Y              ; 4
    bcc    LFA56                 ; 2³
LFA95:
    lda    ram_E3                ; 3
    bmi    LFA6D                 ; 2³
    cmp    ram_DD                ; 3
    bcc    LFA6D                 ; 2³
    ldx    ram_E1                ; 3
    ldy    ram_E8,X              ; 4
    cmp.wy ram_98,Y              ; 4
    bcs    LFAAA                 ; 2³
    sta    ram_DD                ; 3
    bcc    LFA6D                 ; 3   always branch

LFAAA:
    lda    ram_DD                ; 3
    cmp    #$58                  ; 2
    bcs    LFAE2                 ; 2³
    bcc    LFA56                 ; 3   always branch

LFAB2:
    ldy    ram_E8,X              ; 4
    lda.wy ram_98,Y              ; 4
    cmp    ram_DD                ; 3
    bcc    LFA56                 ; 2³
    sta    ram_E1                ; 3
    jsr    LFE4F                 ; 6
    bmi    LFAE2                 ; 2³
    cmp    ram_DD                ; 3
    bcc    LFAE2                 ; 2³
    cmp    ram_E1                ; 3
    bcc    LFADD                 ; 2³
LFACA:
    jsr    LFE64                 ; 6
    bpl    LFAD5                 ; 2³
    ldx    ram_DF                ; 3
    ldy    ram_F0,X              ; 4
    bne    LFAFC                 ; 2³
LFAD5:
    cmp    ram_E1                ; 3
    bcs    LFACA                 ; 2³
    cmp    ram_DD                ; 3
    bcc    LFAE2                 ; 2³
LFADD:
    sta    ram_DD                ; 3
    asl                          ; 2
    sta    ram_DE                ; 3
LFAE2:
    ldx    ram_DF                ; 3
    ldy    ram_F0,X              ; 4
    lda    ram_DE                ; 3
    lsr                          ; 2
    bcs    LFAFC                 ; 2³
LFAEB:
    lda.wy ram_98,Y              ; 4
    bmi    LFAF4                 ; 2³
    cmp    ram_DD                ; 3
    bcs    LFAFC                 ; 2³
LFAF4:
    dey                          ; 2
    tya                          ; 2
    cmp    ram_E8,X              ; 4
    bcs    LFAEB                 ; 2³
    ldy    ram_F0,X              ; 4
LFAFC:
    jmp    LFC86                 ; 3

LFAFF:
    inx                          ; 2
    txa                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_E4,X              ; 4
    beq    LFAFF                 ; 2³+1
    stx    ram_82                ; 3
    stx    ram_F5                ; 3
    lda    #$00                  ; 2
    sta    ram_E3                ; 3
    lda    ram_87                ; 3
    and    #$07                  ; 2
    sta    ram_DF                ; 3
    cmp    #$04                  ; 2
    bcs    LFB2B                 ; 2³
    ora    #$08                  ; 2
    tay                          ; 2
    jsr    LFE57                 ; 6
    bmi    LFB2B                 ; 2³
    ldy    ram_DF                ; 3
    jsr    LFE57                 ; 6
    bmi    LFB2B                 ; 2³
    dec    ram_E3                ; 5
LFB2B:
    ldx    #$03                  ; 2
LFB2D:
    txa                          ; 2
    sta    ram_E1                ; 3
    ora    #$08                  ; 2
    tay                          ; 2
    jsr    LFE57                 ; 6
    bpl    LFB3A                 ; 2³
    lda    #$00                  ; 2
LFB3A:
    sta    ram_E2                ; 3
    jsr    LFE64                 ; 6
    sty    ram_DE                ; 3
    ldy    ram_E1                ; 3
    jsr    LFE57                 ; 6
    bmi    LFB53                 ; 2³
    cmp    ram_E2                ; 3
    bcc    LFB53                 ; 2³
    sta    ram_E2                ; 3
    jsr    LFE64                 ; 6
    sty    ram_DE                ; 3
LFB53:
    lda    ram_E2                ; 3
    ldx    ram_E1                ; 3
    asl    ram_DE                ; 5
    ror    ram_90,X              ; 6
    ldy    ram_E8,X              ; 4
    cmp.wy ram_98,Y              ; 4
    ror    ram_90,X              ; 6
    sec                          ; 2
    ldy    ram_88,X              ; 4
    beq    LFB6A                 ; 2³
    cmp.wy ram_98,Y              ; 4
LFB6A:
    ror    ram_90,X              ; 6
    sec                          ; 2
    bit    ram_E3                ; 3
    bpl    LFB73                 ; 2³
    cmp    #$01                  ; 2
LFB73:
    ror    ram_90,X              ; 6
    dex                          ; 2
    bpl    LFB2D                 ; 2³
    lda    ram_83                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    ram_85                ; 3
    cmp    #$68                  ; 2
    beq    LFBA6                 ; 2³
    ldy    ram_83                ; 3
    beq    LFBC8                 ; 2³
    lda    ram_81                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_E4,X              ; 4
    beq    LFBA2                 ; 2³
    lda    ram_90,X              ; 4
    bpl    LFBA2                 ; 2³
    asl                          ; 2
    asl                          ; 2
    bcc    LFB9F                 ; 2³
    bpl    LFB9F                 ; 2³
    eor    #$40                  ; 2
    asl                          ; 2
    asl                          ; 2
LFB9F:
    jmp    LFC60                 ; 3

LFBA2:
    cpy    #$06                  ; 2
    bcc    LFBC8                 ; 2³
LFBA6:
    lda    ram_81                ; 3
    ldy    #$07                  ; 2
LFBAA:
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_E4,X              ; 4
    beq    LFBC3                 ; 2³
    lda    ram_90,X              ; 4
    bpl    LFBC3                 ; 2³
    cpy    #$04                  ; 2
    bcc    LFBBF                 ; 2³
    and    #$20                  ; 2
    beq    LFB9F                 ; 2³
    bne    LFBC3                 ; 3   always branch

LFBBF:
    asl                          ; 2
    clc                          ; 2
    bpl    LFB9F                 ; 2³
LFBC3:
    inx                          ; 2
    txa                          ; 2
    dey                          ; 2
    bpl    LFBAA                 ; 2³
LFBC8:
    lda    #$00                  ; 2
    sta    ram_DE                ; 3
    sta    ram_E2                ; 3
    lda    #$FF                  ; 2
    sta    ram_DD                ; 3
    lda    ram_81                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    sta    ram_E3                ; 3
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    ram_DF                ; 3
    bne    LFBE5                 ; 2³
    lda    #$07                  ; 2
LFBE5:
    sta    ram_E1                ; 3
    ldx    #$03                  ; 2
LFBE9:
    ldy    ram_E4,X              ; 4
    beq    LFC1E                 ; 2³+1
    cpx    ram_E1                ; 3
    beq    LFC1E                 ; 2³+1
    cpx    ram_E3                ; 3
    beq    LFC1E                 ; 2³+1
    lda    ram_90,X              ; 4
    bpl    LFC1E                 ; 2³+1
    clc                          ; 2
    lda    ram_8C,X              ; 4
    adc    ram_EC,X              ; 4
    cmp    ram_DD                ; 3
    bcs    LFC0E                 ; 2³
    cpx    ram_DF                ; 3
    bne    LFC0A                 ; 2³
    cmp    #$02                  ; 2
    bcs    LFC0E                 ; 2³
LFC0A:
    sta    ram_DD                ; 3
    stx    ram_F5                ; 3
LFC0E:
    cpy    ram_DE                ; 3
    bcc    LFC1E                 ; 2³
    bne    LFC18                 ; 2³
    cmp    ram_E2                ; 3
    bcc    LFC1E                 ; 2³
LFC18:
    sta    ram_E2                ; 3
    sty    ram_DE                ; 3
    stx    ram_82                ; 3
LFC1E:
    dex                          ; 2
    bpl    LFBE9                 ; 2³+1
    ldx    ram_82                ; 3
    lda    ram_87                ; 3
    and    #$04                  ; 2
    bne    LFC3C                 ; 2³
    ldx    ram_DF                ; 3
    lda    ram_E4,X              ; 4
    cmp    #$04                  ; 2
    bcc    LFC3A                 ; 2³
    jsr    LFE35                 ; 6
    ldx    ram_F4                ; 3
    cpx    ram_DF                ; 3
    bne    LFC3C                 ; 2³
LFC3A:
    ldx    ram_F5                ; 3
LFC3C:
    ldy    ram_E8,X              ; 4
    lda.wy ram_98,Y              ; 4
    sec                          ; 2
    sbc    #$08                  ; 2
    iny                          ; 2
    cmp.wy ram_98,Y              ; 4
    bne    LFC5C                 ; 2³
    sta    ram_E3                ; 3
    lda    ram_87                ; 3
    and    #$04                  ; 2
    beq    LFC64                 ; 2³
    lda    ram_E3                ; 3
    sbc    #$08                  ; 2
    iny                          ; 2
    cmp.wy ram_98,Y              ; 4
    beq    LFC64                 ; 2³
LFC5C:
    lda    #$02                  ; 2
    cmp    ram_E4,X              ; 4
LFC60:
    ldy    ram_F0,X              ; 4
    bcc    LFC66                 ; 2³
LFC64:
    ldy    ram_E8,X              ; 4
LFC66:
    txa                          ; 2
    ora    ram_80                ; 3
    sta    ram_80                ; 3
    stx    ram_E3                ; 3
    lda    ram_81                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    eor    ram_E3                ; 3
    beq    LFC7E                 ; 2³
    lda    ram_83                ; 3
    beq    LFC7E                 ; 2³
    lda    ram_88,X              ; 4
    bne    LFC86                 ; 2³
LFC7E:
    lda    ram_81                ; 3
    and    #$38                  ; 2
    ora    ram_E3                ; 3
    sta    ram_81                ; 3
LFC86:
    tya                          ; 2
    tax                          ; 2
    jsr    LFE18                 ; 6
    ldy    ram_84                ; 3
    cpy    #$04                  ; 2
    bcs    LFCB2                 ; 2³
    and    #$8F                  ; 2
    sta    ram_80                ; 3
    lda    #$CC                  ; 2
    sta    ram_88                ; 3
    lda    ram_80                ; 3
LFC9B:
    and    #$0B                  ; 2
    sta    ram_DD                ; 3
    tay                          ; 2
    jsr    LFE57                 ; 6
    bpl    LFCAB                 ; 2³
    ldy    ram_DD                ; 3
    iny                          ; 2
    tya                          ; 2
    bne    LFC9B                 ; 2³
LFCAB:
    stx    ram_CC                ; 3
    jsr    LFE64                 ; 6
    bpl    LFCAB                 ; 2³
LFCB2:
    ldx    #$05                  ; 2
    ldy    #$FF                  ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2   check color/B&W switch
    bne    LFCBF                 ; 2³  - color
    ldy    #$0F                  ; 2   - black and white
LFCBF:
    lda    #00                  ; 2
    sta    ram_DD                ; 3
    sty    ram_DE                ; 3
    lda    #$08                  ; 2
    bit    ram_86                ; 3
    bpl    LFCD9                 ; 2³
    tya                          ; 2
    and    #$F7                  ; 2
    tay                          ; 2
    lda    ram_86                ; 3
    asl                          ; 2
    sta    ram_DD                ; 3
    sty    ram_DE                ; 3
LFCD6:
    lda    ColorTab,X            ; 4
LFCD9:
    eor    ram_DD                ; 3   EOR screensaver
    and    ram_DE                ; 3   black and white #$0F, or color #$FF
    sta    ram_F0,X              ; 4
    dex                          ; 2
    bpl    LFCD6                 ; 2³
    jmp    .waitVblank           ; 3



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFCE5 x 3
;LFCFC x 4
;LFCFE X 2

LFCE5 SUBROUTINE
    ldx    ram_80                ; 3
    lda    ram_88,X              ; 4
    cmp    #$34                  ; 2
    bcc    LFCF0                 ; 2³
LFCED:
    lda    #$05                  ; 2
    rts                          ; 6

LFCF0:
    adc    #$01                  ; 2
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcc    LFCFC                 ; 2³
    bne    LFCED                 ; 2³
    lda    #$00                  ; 2
LFCFC SUBROUTINE
    ldx    ram_80                ; 3
LFCFE SUBROUTINE
    sta    ram_E3                ; 3
    lda    ram_88,X              ; 4
    and    #$38                  ; 2
    ora    ram_E3                ; 3
    cmp    ram_88,X              ; 4
    beq    LFD0C                 ; 2³
    bcs    LFD0F                 ; 2³
LFD0C:
    clc                          ; 2
    adc    #$08                  ; 2
LFD0F:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD10 x 2
;LFD11 X 1

LFD10 SUBROUTINE
    txa                          ; 2
LFD11 SUBROUTINE
    sta    ram_E1                ; 3
    lda    #$00                  ; 2
    sta    ram_E2                ; 3
LFD17:
    inx                          ; 2
    txa                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    cpx    ram_E1                ; 3
    beq    LFD37                 ; 2³
    lda    ram_E4,X              ; 4
    cmp    ram_E2                ; 3
    bcc    LFD17                 ; 2³
    bne    LFD30                 ; 2³
    cmp    #$05                  ; 2
    bcc    LFD17                 ; 2³
    cpx    ram_F4                ; 3
    bcc    LFD17                 ; 2³
LFD30:
    sta    ram_E2                ; 3
    stx    ram_F4                ; 3
    jmp    LFD17                 ; 3

LFD37:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD38 x 2

LFD38 SUBROUTINE
    cmp    ram_E8,X              ; 4
    bcc    LFD3F                 ; 2³
    inx                          ; 2
    cmp    ram_E8,X              ; 4
LFD3F:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD40 x 3

LFD40 SUBROUTINE
    clc                          ; 2
    txa                          ; 2
    adc    LFF00,Y               ; 4
    sta    ram_F2                ; 3
    txa                          ; 2
    adc    LFF40,Y               ; 4
    sta    ram_F1                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD4E x 3

LFD4E SUBROUTINE
    sty    ram_E1                ; 3
    ldx    #$0C                  ; 2
    ldy    #$00                  ; 2
LFD54:
    lda    ram_98,X              ; 4
    and    #$78                  ; 2
    cmp    ram_E1                ; 3
    bne    LFD5D                 ; 2³
    iny                          ; 2
LFD5D:
    dex                          ; 2
    bpl    LFD54                 ; 2³
    tya                          ; 2
    ldx    ram_80                ; 3
    clc                          ; 2
    adc    ram_88,X              ; 4
    and    #$03                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD69 x 1

LFD69 SUBROUTINE
    lda    ram_80                ; 3
    and    #$03                  ; 2
    sta    ram_DF                ; 3
    sta    ram_E1                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    ldx    #$03                  ; 2
LFD77:
    ldy    ram_94,X              ; 4
    beq    LFD98                 ; 2³
    tya                          ; 2
    eor    ram_DF                ; 3
    and    #$03                  ; 2
    beq    LFD90                 ; 2³
    tya                          ; 2
    eor    ram_87                ; 3
    and    #$07                  ; 2
    bne    LFD98                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    sta    ram_DF                ; 3
    bpl    LFD94                 ; 3   always branch

LFD90:
    cpy    ram_DD                ; 3
    bcc    LFD98                 ; 2³
LFD94:
    sty    ram_DD                ; 3
    stx    ram_DE                ; 3
LFD98:
    dex                          ; 2
    bpl    LFD77                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFD9C x 3

LFD9C SUBROUTINE
    lda    ram_F9                ; 3
    eor    #$40                  ; 2
    asl                          ; 2
    asl                          ; 2
    lda    INPT4                 ; 3
    sta    ram_F9                ; 3
    bmi    LFDAC                 ; 2³
    sta    ram_86                ; 3
    bcc    LFDAD                 ; 2³
LFDAC:
    sec                          ; 2
LFDAD:
    ror    ram_F9                ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFDB0 x 3

LFDB0 SUBROUTINE
    and    #$03                  ; 2
    sta    ram_E0                ; 3
    tax                          ; 2
    lda    #$00                  ; 2
    ldy    LFFC0,X               ; 4
    ldx    #$0F                  ; 2
LFDBC:
    sta    ram_E4,X              ; 4
    dex                          ; 2
    bpl    LFDBC                 ; 2³
    sta    ram_DD                ; 3
    sta    ram_82                ; 3
    stx    ram_DF                ; 3
    lda    #$0C                  ; 2
    sta    ram_E1                ; 3
    ldx    #$07                  ; 2
    bne    LFDF8                 ; 3   always branch

LFDCF:
    lda.wy ram_98,Y              ; 4
    and    #$03                  ; 2
    tax                          ; 2
    sty    ram_E8,X              ; 4
LFDD7:
    inc    ram_E4,X              ; 6
    lda.wy ram_98,Y              ; 4
    sty    ram_F0,X              ; 4
    cmp    ram_DF                ; 3
    bcs    LFDE6                 ; 2³
    sta    ram_DF                ; 3
    stx    ram_F5                ; 3
LFDE6:
    sec                          ; 2
    sbc    #$50                  ; 2
    bcc    LFDF3                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_EC,X              ; 4
    sta    ram_EC,X              ; 4
LFDF3:
    iny                          ; 2
    dec    ram_E1                ; 5
    bmi    LFE02                 ; 2³+1
LFDF8:
    txa                          ; 2
    eor.wy ram_98,Y              ; 4
    bmi    LFDF3                 ; 2³
    and    #$07                  ; 2
    beq    LFDD7                 ; 2³+1
LFE02:
    lda    ram_E4,X              ; 4
    cmp    ram_DD                ; 3
    bcc    LFE0C                 ; 2³
    sta    ram_DD                ; 3
    stx    ram_F4                ; 3
LFE0C:
    clc                          ; 2
    lda    ram_EC,X              ; 4
    adc    ram_82                ; 3
    sta    ram_82                ; 3
    ldx    ram_E1                ; 3
    bpl    LFDCF                 ; 2³+1
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE18 x 2

LFE18 SUBROUTINE
    lda    ram_98,X              ; 4
    ldy    ram_E0                ; 3
    sta.wy ram_94,Y              ; 5
    ora    #$80                  ; 2
    sta    ram_98,X              ; 4
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    clc                          ; 2
    lda    ram_80                ; 3
    adc    #$04                  ; 2
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    sta    ram_80                ; 3
    inc    ram_84                ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE35 x 3

LFE35 SUBROUTINE
    lda    #$00                  ; 2
    sta    ram_E1                ; 3
    ldx    #$03                  ; 2
    cpx    ram_F4                ; 3
LFE3D:
    beq    LFE4B                 ; 2³
    lda    ram_E4,X              ; 4
    beq    LFE4B                 ; 2³
    cmp    ram_E1                ; 3
    bcc    LFE4B                 ; 2³
    sta    ram_E1                ; 3
    stx    ram_F5                ; 3
LFE4B:
    dex                          ; 2
    bpl    LFE3D                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE4F x 3
;LFE57 x 8
;LFE64 x 5

LFE4F SUBROUTINE
    clc                          ; 2
    lda    ram_80                ; 3
    adc    #$04                  ; 2
    and    #$0F                  ; 2
    tay                          ; 2
LFE57 SUBROUTINE
    ldx    $D1,Y                 ; 4
    lda.wy ram_CD,Y              ; 4
    tay                          ; 2
LFE5D:
    dey                          ; 2
    bmi    LFE67                 ; 2³
    lda    ram_98,X              ; 4
    bpl    LFE67                 ; 2³
LFE64 SUBROUTINE
    inx                          ; 2
    bne    LFE5D                 ; 2³
LFE67:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFE68 x 2

LFE68 SUBROUTINE
    stx    ram_F8                ; 3
    stx    ram_83                ; 3
    ldx    ram_80                ; 3
    inx                          ; 2
    cpx    #$0C                  ; 2
    bcc    LFE79                 ; 2³
    ldx    ram_93                ; 3
    stx    ram_91                ; 3
    ldx    #$0A                  ; 2
LFE79:
    stx    ram_80                ; 3
    sta    ram_88,X              ; 4
    clc                          ; 2
    adc    #$08                  ; 2
    sta.wy ram_94,Y              ; 5
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;InitializeRam x 2

InitializeRam SUBROUTINE
    ldx    #$54                  ; 2
    lda    #0                    ; 2
.loopClearRam:
    sta    ram_80,X              ; 4   clear $80-$D4
    dex                          ; 2
    bpl    .loopClearRam         ; 2³
    stx    ram_83                ; 3   X=$FF
    ldx    #$34                  ; 2
    ldy    frameCounter          ; 3   randomization on reset or select
LFE97:
    tya                          ; 2
    ora    #$80                  ; 2
    sta    ram_98,X              ; 4   $98-$CC
    iny                          ; 2
    dex                          ; 2
    bpl    LFE97                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SixByteDisplay x 3

SixByteDisplay SUBROUTINE
    ldy    #$07                  ; 2
.loopSixByteDisplay:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_E4),Y            ;5  @5
    sta    GRP0                  ;3  @8
    lda    (ram_EA),Y            ;5  @13
    sta    GRP1                  ;3  @16
    lda    (ram_EE),Y            ;5  @21
    sta    ram_E1                ;3  @24
    lda    (ram_E8),Y            ;5  @29
    tax                          ;2  @31
    lda    (ram_E6),Y            ;5  @36
    sta    GRP0                  ;3  @39
    nop                          ;2  @41
    stx    GRP0                  ;3  @44
    ldx    ram_E1                ;3  @47
    lda    (ram_EC),Y            ;5  @52
    sta    GRP1                  ;3  @55
    nop                          ;2  @57
    stx    GRP1                  ;3  @60
    dey                          ;2  @62
    bne    .loopSixByteDisplay   ;2  @64
    sty    GRP0                  ;3  @67   clear
    sty    GRP1                  ;3  @70
    rts                          ;6  @76


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFECC x 3

LFECC SUBROUTINE
    lsr    ram_FA,X              ; 6
    ror    ram_FB,X              ; 6
    rol                          ; 2
    eor    ram_FB,X              ; 4
    lsr                          ; 2
    lda    ram_FA,X              ; 4
    bcs    LFEDC                 ; 2³
    ora    #$40                  ; 2
    sta    ram_FA,X              ; 4
LFEDC:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BlueLineKernel X 2

BlueLineKernel SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    ram_F4                ; 3
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_F5                ; 3
    sta    COLUBK                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEEE:
    .byte $20 ; |  X     | $FEEE
    .byte $21 ; |  X    X| $FEEF
    .byte $1A ; |   XX X | $FEF0
    .byte $1B ; |   XX XX| $FEF1
    .byte $14 ; |   X X  | $FEF2
LFEF3:
    .byte $1C ; |   XXX  | $FEF3
    .byte $1C ; |   XXX  | $FEF4
    .byte $19 ; |   XX  X| $FEF5
    .byte $19 ; |   XX  X| $FEF6
    .byte $19 ; |   XX  X| $FEF7
CharGfxTab:
    .byte <ClubGfx-1       ; $FEF8   clubs
    .byte <DiamondGfx-1    ; $FEF9   diamonds
    .byte <HeartGfx-1      ; $FEFA   HeartGfxs
    .byte <SpadeGfx-1      ; $FEFB   spades
    .byte <NoTrumpGfx-1    ; $FEFC   NT (no trump)
    .byte <PassLetterGfx-1 ; $FEFD   P (pass)
    .byte <BlankGfx-1      ; $FEFE

  IF ORIGINAL
    .byte $FF ; |XXXXXXXX| $FEFF
  ELSE
    .byte $FE ; |XXXXXXX | $FEFF
  ENDIF

       ORG $FF00

LFF00:
    .byte $10  ; $FF00
ZeroGfx:
    .byte $3C ; |  XXXX  | $FF01
    .byte $66 ; | XX  XX | $FF02
    .byte $66 ; | XX  XX | $FF03
    .byte $66 ; | XX  XX | $FF04
    .byte $66 ; | XX  XX | $FF05
    .byte $66 ; | XX  XX | $FF06
    .byte $3C ; |  XXXX  | $FF07

    .byte $16  ; $FF08
OneGfx:
    .byte $7E ; | XXXXXX | $FF09
    .byte $18 ; |   XX   | $FF0A
    .byte $18 ; |   XX   | $FF0B
    .byte $18 ; |   XX   | $FF0C
    .byte $78 ; | XXXX   | $FF0D
    .byte $38 ; |  XXX   | $FF0E
    .byte $18 ; |   XX   | $FF0F

    .byte $19  ; $FF10
TwoGfx:
    .byte $7E ; | XXXXXX | $FF11
    .byte $60 ; | XX     | $FF12
    .byte $60 ; | XX     | $FF13
    .byte $3C ; |  XXXX  | $FF14
    .byte $06 ; |     XX | $FF15
    .byte $46 ; | X   XX | $FF16
    .byte $3C ; |  XXXX  | $FF17

    .byte $16  ; $FF18
ThreeGfx:
    .byte $3C ; |  XXXX  | $FF19
    .byte $46 ; | X   XX | $FF1A
    .byte $06 ; |     XX | $FF1B
    .byte $0C ; |    XX  | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $46 ; | X   XX | $FF1E
    .byte $3C ; |  XXXX  | $FF1F

    .byte $0D  ; $FF20
FourGfx:
    .byte $0C ; |    XX  | $FF21
    .byte $0C ; |    XX  | $FF22
    .byte $7E ; | XXXXXX | $FF23
    .byte $4C ; | X  XX  | $FF24
    .byte $2C ; |  X XX  | $FF25
    .byte $1C ; |   XXX  | $FF26
    .byte $0C ; |    XX  | $FF27

    .byte $0D  ; $FF28
FiveGfx:
    .byte $7C ; | XXXXX  | $FF29
    .byte $46 ; | X   XX | $FF2A
    .byte $06 ; |     XX | $FF2B
    .byte $7C ; | XXXXX  | $FF2C
    .byte $60 ; | XX     | $FF2D
    .byte $60 ; | XX     | $FF2E
    .byte $7E ; | XXXXXX | $FF2F

    .byte $10  ; $FF30
SixGfx:
    .byte $3C ; |  XXXX  | $FF31
    .byte $66 ; | XX  XX | $FF32
    .byte $66 ; | XX  XX | $FF33
    .byte $7C ; | XXXXX  | $FF34
    .byte $60 ; | XX     | $FF35
    .byte $62 ; | XX   X | $FF36
    .byte $3C ; |  XXXX  | $FF37

    .byte $13  ; $FF38
SevenGfx:
    .byte $18 ; |   XX   | $FF39
    .byte $18 ; |   XX   | $FF3A
    .byte $18 ; |   XX   | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $06 ; |     XX | $FF3D
    .byte $42 ; | X    X | $FF3E
    .byte $7E ; | XXXXXX | $FF3F
LFF40:
    .byte $12  ; $FF40
EightGfx:
    .byte $3C ; |  XXXX  | $FF41
    .byte $66 ; | XX  XX | $FF42
    .byte $66 ; | XX  XX | $FF43
    .byte $3C ; |  XXXX  | $FF44
    .byte $66 ; | XX  XX | $FF45
    .byte $66 ; | XX  XX | $FF46
    .byte $3C ; |  XXXX  | $FF47

    .byte $18  ; $FF48
NineGfx:
    .byte $3C ; |  XXXX  | $FF49
    .byte $46 ; | X   XX | $FF4A
    .byte $06 ; |     XX | $FF4B
    .byte $3E ; |  XXXXX | $FF4C
    .byte $66 ; | XX  XX | $FF4D
    .byte $66 ; | XX  XX | $FF4E
    .byte $3C ; |  XXXX  | $FF4F

    .byte $1B  ; $FF50
TenGfx:
    .byte $EE ; |XXX XXX | $FF51
    .byte $5B ; | X XX XX| $FF52
    .byte $5B ; | X XX XX| $FF53
    .byte $5B ; | X XX XX| $FF54
    .byte $5B ; | X XX XX| $FF55
    .byte $DB ; |XX XX XX| $FF56
    .byte $4E ; | X  XXX | $FF57

    .byte $19  ; $FF58
JackGfx:
    .byte $38 ; |  XXX   | $FF59
    .byte $6C ; | XX XX  | $FF5A
    .byte $6C ; | XX XX  | $FF5B
    .byte $0C ; |    XX  | $FF5C
    .byte $0C ; |    XX  | $FF5D
    .byte $7E ; | XXXXXX | $FF5E
    .byte $7E ; | XXXXXX | $FF5F

    .byte $12  ; $FF60
QueenGfx:
    .byte $3A ; |  XXX X | $FF61
    .byte $64 ; | XX  X  | $FF62
    .byte $6A ; | XX X X | $FF63
    .byte $66 ; | XX  XX | $FF64
    .byte $66 ; | XX  XX | $FF65
    .byte $66 ; | XX  XX | $FF66
    .byte $3C ; |  XXXX  | $FF67

    .byte $0F  ; $FF68
KingGfx:
    .byte $33 ; |  XX  XX| $FF69
    .byte $36 ; |  XX XX | $FF6A
    .byte $3C ; |  XXXX  | $FF6B
    .byte $38 ; |  XXX   | $FF6C
    .byte $3C ; |  XXXX  | $FF6D
    .byte $36 ; |  XX XX | $FF6E
    .byte $33 ; |  XX  XX| $FF6F

    .byte $12  ; $FF70
AceGfx:
    .byte $63 ; | XX   XX| $FF71
    .byte $63 ; | XX   XX| $FF72
    .byte $7F ; | XXXXXXX| $FF73
    .byte $7F ; | XXXXXXX| $FF74
    .byte $63 ; | XX   XX| $FF75
    .byte $3E ; |  XXXXX | $FF76
    .byte $1C ; |   XXX  | $FF77

    .byte $15  ; $FF78
EvenLetterGfx:
    .byte $FE ; |XXXXXXX | $FF79
    .byte $C0 ; |XX      | $FF7A
    .byte $C0 ; |XX      | $FF7B
    .byte $FC ; |XXXXXX  | $FF7C
    .byte $C0 ; |XX      | $FF7D
    .byte $C0 ; |XX      | $FF7E
    .byte $FE ; |XXXXXXX | $FF7F
LFF80:
    .byte $00  ; $FF80
HeartGfx:
    .byte $08 ; |    X   | $FF81
    .byte $1C ; |   XXX  | $FF82
    .byte $3E ; |  XXXXX | $FF83
    .byte $7F ; | XXXXXXX| $FF84
    .byte $7F ; | XXXXXXX| $FF85
    .byte $77 ; | XXX XXX| $FF86
    .byte $22 ; |  X   X | $FF87

    .byte $16  ; $FF88
DiamondGfx:
    .byte $08 ; |    X   | $FF89
    .byte $1C ; |   XXX  | $FF8A
    .byte $3E ; |  XXXXX | $FF8B
    .byte $7F ; | XXXXXXX| $FF8C
    .byte $3E ; |  XXXXX | $FF8D
    .byte $1C ; |   XXX  | $FF8E
    .byte $08 ; |    X   | $FF8F

    .byte $1A  ; $FF90
ClubGfx:
    .byte $18 ; |   XX   | $FF91
    .byte $7E ; | XXXXXX | $FF92
    .byte $FF ; |XXXXXXXX| $FF93
    .byte $7E ; | XXXXXX | $FF94
    .byte $18 ; |   XX   | $FF95
    .byte $3C ; |  XXXX  | $FF96
    .byte $18 ; |   XX   | $FF97

    .byte $1E  ; $FF98
NoTrumpGfx:
    .byte $8A ; |X   X X | $FF99
    .byte $9A ; |X  XX X | $FF9A
    .byte $AA ; |X X X X | $FF9B
    .byte $CA ; |XX  X X | $FF9C
    .byte $8A ; |X   X X | $FF9D
    .byte $02 ; |      X | $FF9E
    .byte $07 ; |     XXX| $FF9F
LFFA0:
    .byte $01  ; $FFA0
SpadeGfx:
    .byte $1C ; |   XXX  | $FFA1
    .byte $5D ; | X XXX X| $FFA2
    .byte $7F ; | XXXXXXX| $FFA3
    .byte $7F ; | XXXXXXX| $FFA4
    .byte $3E ; |  XXXXX | $FFA5
    .byte $1C ; |   XXX  | $FFA6
    .byte $08 ; |    X   | $FFA7
LFFA8:
    .byte $02  ; $FFA8
BlankGfx:
    .byte $00 ; |        | $FFA9
    .byte $00 ; |        | $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF

    .byte $FF  ; $FFB0
MinusSignGfx:
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $7E ; | XXXXXX | $FFB3
    .byte $7E ; | XXXXXX | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7

    .byte $FC  ; $FFB8
PassLetterGfx:
    .byte $C0 ; |XX      | $FFB9
    .byte $C0 ; |XX      | $FFBA
    .byte $F8 ; |XXXXX   | $FFBB
    .byte $FC ; |XXXXXX  | $FFBC
    .byte $CC ; |XX  XX  | $FFBD
    .byte $FC ; |XXXXXX  | $FFBE
    .byte $F8 ; |XXXXX   | $FFBF


LFFC0:
    .byte $00 ; |        | $FFC0
LFFC1:
    .byte $0D ; |    XX X| $FFC1
    .byte $1A ; |   XX X | $FFC2
    .byte $27 ; |  X  XXX| $FFC3
    .byte $34 ; |  XX X  | $FFC4
LFFC5:
    .byte $02 ; |      X | $FFC5
    .byte $02 ; |      X | $FFC6
    .byte $03 ; |      XX| $FFC7
    .byte $01 ; |       X| $FFC8
    .byte $00 ; |        | $FFC9
    .byte $00 ; |        | $FFCA
LFFCB:
    .byte $06 ; |     XX | $FFCB
    .byte $06 ; |     XX | $FFCC
    .byte $02 ; |      X | $FFCD
    .byte $0A ; |    X X | $FFCE
    .byte $06 ; |     XX | $FFCF
    .byte $06 ; |     XX | $FFD0
LFFD1:
    .byte $04 ; |     X  | $FFD1
    .byte $04 ; |     X  | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $08 ; |    X   | $FFD4
    .byte $04 ; |     X  | $FFD5
    .byte $04 ; |     X  | $FFD6
ColorTab:
    .byte BLACK          ; $FFD7  clubs, activison logo, score
    .byte RED            ; $FFD8  diamonds, score (when in the minus)
    .byte RED            ; $FFD9  hearts
    .byte BLACK          ; $FFDA  spades
    .byte BLUE           ; $FFDB  borders
    .byte $04 ; |     X  | $FFDC
LogoOne:
    .byte $00 ; |        | $FFDD
    .byte $AD ; |X X XX X| $FFDE
    .byte $A9 ; |X X X  X| $FFDF
    .byte $E9 ; |XXX X  X| $FFE0
    .byte $A9 ; |X X X  X| $FFE1
    .byte $ED ; |XXX XX X| $FFE2
    .byte $41 ; | X     X| $FFE3
    .byte $0F ; |    XXXX| $FFE4
LogoTwo:
    .byte $00 ; |        | $FFE5
    .byte $50 ; | X X    | $FFE6
    .byte $58 ; | X XX   | $FFE7
    .byte $5C ; | X XXX  | $FFE8
    .byte $56 ; | X X XX | $FFE9
    .byte $53 ; | X X  XX| $FFEA
    .byte $11 ; |   X   X| $FFEB
    .byte $F0 ; |XXXX    | $FFEC
LogoThree:
    .byte $00 ; |        | $FFED
    .byte $BA ; |X XXX X | $FFEE
    .byte $8A ; |X   X X | $FFEF
    .byte $BA ; |X XXX X | $FFF0
    .byte $A2 ; |X X   X | $FFF1
    .byte $3A ; |  XXX X | $FFF2
    .byte $80 ; |X       | $FFF3
    .byte $FE ; |XXXXXXX | $FFF4
LogoFour:
    .byte $00 ; |        | $FFF5
    .byte $E9 ; |XXX X  X| $FFF6
    .byte $AB ; |X X X XX| $FFF7
    .byte $AF ; |X X XXXX| $FFF8
    .byte $AD ; |X X XX X| $FFF9
    .byte $E9 ; |XXX X  X| $FFFA
    .byte $00 ; |        | $FFFB

       ORG $FFFC

    .word START

    .byte $FF ; |XXXXXXXX| $FFFE
    .byte $FF ; |XXXXXXXX| $FFFF
