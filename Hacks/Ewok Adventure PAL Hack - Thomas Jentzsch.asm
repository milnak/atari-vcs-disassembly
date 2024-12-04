    processor 6502
    include vcs.h

PAL = 1

  IF PAL
SAND        = $28
GREEN2      = $38
BROWN       = $44
ORANGE      = $4c
GREEN       = $58
RED         = $68
CYAN        = $78
MAGENTA     = $88
BLUE        = $98
MAGENTA2    = $a8
BLUE1       = $b8
BLUEM       = $c8
BLUE2       = $d8
  ELSE
SAND        = $f8 ; $f8  $28
GREEN2      = $d8 ; $38  $38
BROWN       = $24 ; $24  $44
ORANGE      = $2c ; $2c  $4c
GREEN       = $c8 ; $c8  $58
RED         = $48 ; $48  $68
CYAN        = $a8 ; $a8  $78
MAGENTA     = $68-$10 ; $68  $88
BLUE        = $98 ; $98  $98
MAGENTA2    = $78 ; $78  $a8
BLUE1       = $88 ; $b8  $b8
BLUEM       = $78 ; $78  $c8
BLUE2       = $88 ; $88  $d8
  ENDIF

;PAL -> PAL
; 50 -> D1
; 9C -> A0
; 7C -> C0
; 5C -> B0
; 3C -> D0

; sliece #0 ($d000..$d3ff) -> 0
; sliece #1 ($d400..$d7ff) -> 1
; sliece #2 ($d800..$dbff) -> 2
; sliece #3 ($b000..$b3ff) -> 0
; sliece #4 ($f000..$f3ff) -> 0
; sliece #5 ($f400..$f7ff) -> 1
; sliece #6 ($f800..$fbff) -> 2
; sliece #7 ($fc00..$ffff) -> 3 (fixed)

; *** Access ***
;    ZP  0  1  2  3  4  5  6  7
; 0   X  =  X  X  ·  ·  ·  ·  ·  0      1  2    7 -> 1
; 1   X  X  =  X  ·  ·  ·  ·  ·  0      1  2    7    ·
; 2   ·  ·  ·  ·  ·  ·  ·  ·  ·                      ·
; 3   X  ·  ·  ·  =  ·  X  ·  X      3  5  -    7    ·
; 4   X  ·  ·  ·  ·  =  X  ·  X      4  5  -    7    ·
; 5   X  ·  ·  X  X  X  =  ·  X    3/4  5  2    7 -> 2
; 6   X  ·  ·  ·  X  ·  X  =  X    3    5    6  7 -> 1
; 7   X  X  ·  X  ·  X  X  X  =  0/  4  5  2/6  7 -> 3

SEG0_0  = $ffe0     ; 1x
SEG0_3  = $ffe3     ; 3x    read! (write:0)
SEG0_4  = $ffe4     ; 3x    read! (write:4/$7x)

SEG1_1  = $ffe9     ; 1x
SEG1_5  = $ffed     ; 3x

SEG2_2  = $fff2     ; 1x    data
SEG2_6  = $fff6     ; 1x

;0/1/2    $fc86/$fc89
;3/5/2    $f411/$f41c
;3/5/6    $fd5d/$fd60
;4/5/2    $f417/$f422/$fc0a,$fc4c/$fc4f/$fc52/$fc8f

diffLst         = $9c           ; ..$9d
diffP0          = diffLst       ; $9c
diffP1          = diffLst+1     ; $9d

player          = $a0
playerLst       = $a1           ; ..$a2         lives, ? (llll????)
scoreLst        = $a3           ; ..$a8
scoreHi         = scoreLst      ; $a3..$a4
scoreMid        = scoreLst+2    ; $a5..$a6
scoreLo         = scoreLst+4    ; $a7..$a8

game            = $af

frameCnt        = $b9
switches        = $ba

    ORG $d000

; sliece #0 ($d000..$d3ff)
Ld000:
    lda    $a9              ; 3
    lsr                     ; 2
    lda    #$00             ; 2
    sta    $c8              ; 3
    sta    $c0              ; 3
    adc    #$0a             ; 2
    tay                     ; 2
    lda    ($ad),y          ; 5
    sta    WSYNC            ; 3
    sta    COLUBK           ; 3
    ldx    $80              ; 3
    ldy    $86              ; 3
    lda    $88              ; 3
    bne    Ld01e            ; 2³
    ldx    $81              ; 3
    ldy    $87              ; 3
Ld01e:
    sty    REFP1            ; 3
    lda    Ld810,x          ; 4
    sta    NUSIZ1           ; 3
    lda    Ld800,x          ; 4
    sta    COLUP1           ; 3
    lda    #$db             ; 2
    sta    $c3              ; 3
    sta    $c5              ; 3
    sta    $c7              ; 3
    lda    $b1              ; 3
    tay                     ; 2
    sty    $f3              ; 3
    lda    Ld6a3,y          ; 4
    sta    $c2              ; 3
    lda    Ld6af,y          ; 4
    sta    $c4              ; 3
    lda    Ld698,y          ; 4
    sta    $c6              ; 3
    lda    $ac              ; 3
    cmp    #$09             ; 2
    bne    Ld055            ; 2³
    lda    frameCnt         ; 3
    and    #$f7             ; 2
    sta    $bd              ; 3
    jmp    Ld06e            ; 3

Ld055:
    lda    frameCnt         ; 3
    and    #$1c             ; 2
    lsr                     ; 2
    lsr                     ; 2
    eor    #$ff             ; 2
    sta    $f1              ; 3
    lda    Ld6bc,y          ; 4
    cpy    #$07             ; 2
    beq    Ld06a            ; 2³
    cpy    #$08             ; 2
    bne    Ld06c            ; 2³
Ld06a:
    adc    $f1              ; 3
Ld06c:
    sta    $bc              ; 3
Ld06e:
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ReflectTbl,y     ; 4
    sta    CTRLPF           ; 3
    ldy    $b8              ; 3
    sty    $c1              ; 3
    ldx    #$be             ; 2
    sta    WSYNC            ; 3
    cpy    #$20             ; 2
    bne    Ld086            ; 2³
    jmp    Ld574            ; 3

Ld086:
    cpy    #$22             ; 2
    bne    Ld08d            ; 2³
    jmp    Ld4bb            ; 3

Ld08d:
    cpy    #$24             ; 2
    bne    Ld094            ; 2³
    jmp    Ld34f            ; 3

Ld094:
    cpy    #$26             ; 2
    bne    Ld09b            ; 2³
    jmp    Ld26e            ; 3

Ld09b:
    iny                     ; 2
    bne    Ld0df            ; 2³
Ld09e:
    dex                     ; 2
    bne    Ld0a4            ; 2³
    jmp    Ld67a            ; 3

Ld0a4:
    dey                     ; 2
    bpl    Ld0c5            ; 2³
    cpx    $d2              ; 3
    bcc    Ld0b4            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld25a            ; 3

Ld0b4:
    lda    $e7              ; 3
    sbc    #$27             ; 2
    sta    $e7              ; 3
    ldy    #$27             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    jmp    Ld293            ; 3

Ld0c5:
    cpx    $d2              ; 3
    bcc    Ld0f3            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
Ld0df:
    dex                     ; 2
    bne    Ld0e5            ; 2³
    jmp    Ld67a            ; 3

Ld0e5:
    dey                     ; 2
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    jmp    Ld11e            ; 3

Ld0f3:
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
    lda    ($e7),y          ; 5
    beq    Ld13b            ; 2³
Ld10d:
    dex                     ; 2
    bne    Ld113            ; 2³
    jmp    Ld67a            ; 3

Ld113:
    dey                     ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
Ld11e:
    lda    #$00             ; 2
    cpx    $d6              ; 3
    bne    Ld126            ; 2³
    lda    #$02             ; 2
Ld126:
    sta    ENAM1            ; 3
    cpx    $d4              ; 3
    bcc    Ld12f            ; 2³
    jmp    Ld09e            ; 3

Ld12f:
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld138            ; 2³
    jmp    Ld21b            ; 3

Ld138:
    jmp    Ld1ca            ; 3

Ld13b:
    dex                     ; 2
    bne    Ld141            ; 2³
    jmp    Ld67a            ; 3

Ld141:
    dey                     ; 2
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    $d3              ; 3
    sta    $d2              ; 3
    lda    $e4              ; 3
    sta    $e7              ; 3
    lda    #GREEN-8         ; 2
    sta    COLUP0           ; 3
    lda    #$00             ; 2
    sta    $d3              ; 3
    cpx    $d6              ; 3
    bne    Ld162            ; 2³
    lda    #$02             ; 2
Ld162:
    sta    ENAM1            ; 3
    cpx    $d4              ; 3
    bcc    Ld16b            ; 2³
    jmp    Ld09e            ; 3

Ld16b:
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld1a9            ; 2³
    dex                     ; 2
    bne    Ld177            ; 2³
    jmp    Ld67a            ; 3

Ld177:
    dey                     ; 2
    bpl    Ld17d            ; 2³
    jmp    Ld24a            ; 3

Ld17d:
    cpx    $d2              ; 3
    bcc    Ld186            ; 2³
    sta    GRP0             ; 3
    jmp    Ld22f            ; 3

Ld186:
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    lda    ($e7),y          ; 5
    beq    Ld13b            ; 2³
    jmp    Ld10d            ; 3

Ld1a9:
    dex                     ; 2
    bne    Ld1af            ; 2³
    jmp    Ld67a            ; 3

Ld1af:
    cpx    $d2              ; 3
    bcc    Ld1bd            ; 2³
    lda    #$00             ; 2
    sta    GRP0             ; 3
    dey                     ; 2
    bpl    Ld1e0            ; 2³
    jmp    Ld2c9            ; 3

Ld1bd:
    dey                     ; 2
    bpl    Ld1c3            ; 2³
    jmp    Ld2d9            ; 3

Ld1c3:
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    jmp    Ld1fd            ; 3

Ld1ca:
    dex                     ; 2
    bne    Ld1d0            ; 2³
    jmp    Ld67a            ; 3

Ld1d0:
    dey                     ; 2
    bpl    Ld1d6            ; 2³
    jmp    Ld2bf            ; 3

Ld1d6:
    cpx    $d2              ; 3
    bcc    Ld1f7            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld1e0:
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld0df            ; 3

Ld1f7:
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld1fd:
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    lda    ($e7),y          ; 5
    beq    Ld218            ; 2³
    jmp    Ld10d            ; 3

Ld218:
    jmp    Ld13b            ; 3

Ld21b:
    dex                     ; 2
    bne    Ld221            ; 2³
    jmp    Ld67a            ; 3

Ld221:
    dey                     ; 2
    bmi    Ld24a            ; 2³
    cpx    $d2              ; 3
    bcs    Ld22b            ; 2³
    jmp    Ld186            ; 3

Ld22b:
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld22f:
    lda    ($bc),y          ; 5
    sta    COLUPF           ; 3
    lda    ($c2),y          ; 5
    sta    PF0              ; 3
    lda    ($c4),y          ; 5
    sta    PF1              ; 3
    lda    ($c6),y          ; 5
    sta    PF2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    jmp    Ld0df            ; 3

Ld24a:
    cpx    $d2              ; 3
    bcc    Ld27d            ; 2³
    lda    #$00             ; 2
    sta    GRP0             ; 3
    ldy    $d5              ; 3
    sty    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
Ld25a:
    inc    $c0              ; 5
    ldy    $c0              ; 3
    lda    $00b1,y          ; 4
    sta    $f3              ; 3
    tay                     ; 2
    lda    Ld6a3,y          ; 4
    sta    $c2              ; 3
    lda    Ld6af,y          ; 4
    sta    $c4              ; 3
Ld26e:
    dex                     ; 2
    bne    Ld274            ; 2³
    jmp    Ld67a            ; 3

Ld274:
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld30d            ; 3

Ld27d:
    lda    $e7              ; 3
    sbc    #$27             ; 2
    sta    $e7              ; 3
    ldy    #$27             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
Ld293:
    inc    $c0              ; 5
    ldy    $c0              ; 3
    lda    $00b1,y          ; 4
    sta    $f3              ; 3
    tay                     ; 2
    lda    Ld6a3,y          ; 4
    sta    $c2              ; 3
    lda    Ld6af,y          ; 4
    sta    $c4              ; 3
    lda    $f2              ; 3
    bne    Ld2ae            ; 2³
    jmp    Ld2f5            ; 3

Ld2ae:
    dex                     ; 2
    bne    Ld2b4            ; 2³
    jmp    Ld67a            ; 3

Ld2b4:
    ldy    #$26             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    lda    #$00             ; 2
    jmp    Ld30d            ; 3

Ld2bf:
    cpx    $d2              ; 3
    bcc    Ld2d9            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld2c9:
    lda    $e9              ; 3
    sec                     ; 2
    sbc    #$28             ; 2
    sta    $e9              ; 3
    ldy    #$27             ; 2
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld25a            ; 3

Ld2d9:
    lda    $e7              ; 3
    sbc    #$27             ; 2
    sta    $e7              ; 3
    ldy    #$27             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    $e9              ; 3
    sec                     ; 2
    sbc    #$28             ; 2
    sta    $e9              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld293            ; 3

Ld2f5:
    dex                     ; 2
    bne    Ld2fb            ; 2³
    jmp    Ld67a            ; 3

Ld2fb:
    lda    #$00             ; 2
    sta    GRP0             ; 3
    ldy    $d3              ; 3
    sty    $d2              ; 3
    ldy    $e4              ; 3
    sty    $e7              ; 3
    ldy    #GREEN-8         ; 2
    sty    COLUP0           ; 3
    sta    $d3              ; 3
Ld30d:
    cpx    $d6              ; 3
    bne    Ld313            ; 2³
    lda    #$02             ; 2
Ld313:
    sta    ENAM1            ; 3
    ldy    $f3              ; 3
    lda    Ld698,y          ; 4
    sta    $c6              ; 3
    lda    ReflectTbl,y     ; 4
    sta    CTRLPF           ; 3
    cpx    $d4              ; 3
    bcc    Ld344            ; 2³
    dex                     ; 2
    bne    Ld32b            ; 2³
    jmp    Ld67a            ; 3

Ld32b:
    cpx    $d2              ; 3
    bcc    Ld337            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    beq    Ld35f            ; 2³
Ld337:
    ldy    #$25             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
    jmp    Ld389            ; 3

Ld344:
    ldy    #$26             ; 2
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld3b4            ; 2³
    jmp    Ld3d8            ; 3

Ld34f:
    dex                     ; 2
    bne    Ld355            ; 2³
    jmp    Ld67a            ; 3

Ld355:
    cpx    $d2              ; 3
    bcc    Ld37f            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld35f:
    ldy    $f3              ; 3
    lda    Ld6bc,y          ; 4
    cpy    #$07             ; 2
    beq    Ld36c            ; 2³
    cpy    #$08             ; 2
    bne    Ld36e            ; 2³
Ld36c:
    adc    $f1              ; 3
Ld36e:
    sta    $bc              ; 3
    dex                     ; 2
    bne    Ld376            ; 2³
    jmp    Ld67a            ; 3

Ld376:
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld440            ; 3

Ld37f:
    ldy    #$25             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
Ld389:
    ldy    $f3              ; 3
    lda    Ld6bc,y          ; 4
    cpy    #$07             ; 2
Ld390:
    beq    Ld396            ; 2³
    cpy    #$08             ; 2
    bne    Ld398            ; 2³
Ld396:
    adc    $f1              ; 3
Ld398:
    sta    $bc              ; 3
Ld39a:
    lda    $f2              ; 3
    bne    Ld3a1            ; 2³
    jmp    Ld426            ; 3

Ld3a1:
    dex                     ; 2
    bne    Ld3a7            ; 2³
    jmp    Ld67a            ; 3

Ld3a7:
    ldy    #$24             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    #$00             ; 2
    jmp    Ld440            ; 3

Ld3b4:
    dex                     ; 2
    bne    Ld3ba            ; 2³
    jmp    Ld67a            ; 3

Ld3ba:
    ldy    #$25             ; 2
    cpx    $d2              ; 3
    bcc    Ld3cb            ; 2³
    lda    #$00             ; 2
    sta    GRP0             ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld35f            ; 3

Ld3cb:
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld389            ; 3

Ld3d8:
    dex                     ; 2
    bne    Ld3de            ; 2³
    jmp    Ld67a            ; 3

Ld3de:
    cpx    $d2              ; 3
Ld3e0:
    bcc    Ld3f1            ; 2³
    lda    #$00             ; 2
    sta    GRP0             ; 3
    ldy    $d5              ; 3
Ld3e8:
    sty    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    jmp    Ld35f            ; 3

Ld3f1:
    ldy    #$25             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
; sliece #1 ($d400..$d7ff)
    ldy    $f3              ; 3
    lda    Ld6bc,y          ; 4
    cpy    #$07             ; 2
    beq    Ld40e            ; 2³
    cpy    #$08             ; 2
    bne    Ld410            ; 2³
Ld40e:
    adc    $f1              ; 3
Ld410:
    sta    $bc              ; 3
    lda    $f2              ; 3
    beq    Ld426            ; 2³
    dex                     ; 2
Ld417:
    bne    Ld41c            ; 2³
    jmp    Ld67a            ; 3

Ld41c:
    ldy    #$24             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
Ld422:
    lda    #$00             ; 2
    beq    Ld440            ; 2³
Ld426:
    dex                     ; 2
    bne    Ld42c            ; 2³
    jmp    Ld67a            ; 3

Ld42c:
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    ldy    $d3              ; 3
    sty    $d2              ; 3
    ldy    $e4              ; 3
    sty    $e7              ; 3
    ldy    #GREEN-8         ; 2
    sty    COLUP0           ; 3
    sta    $d3              ; 3
Ld440:
    cpx    $d6              ; 3
    bne    Ld446            ; 2³
    lda    #$02             ; 2
Ld446:
    sta    ENAM1            ; 3
    bit    $c8              ; 3
    bvs    Ld44e            ; 2³
    bpl    Ld459            ; 2³
Ld44e:
    ldy    $81              ; 3
    lda    Ld810,y          ; 4
    sta    NUSIZ1           ; 3
    sta    $c8              ; 3
    bne    Ld4bb            ; 2³
Ld459:
    cpx    $d4              ; 3
    bcs    Ld4bb            ; 2³
    ldy    #$24             ; 2
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld496            ; 2³
    dex                     ; 2
    bne    Ld46b            ; 2³
    jmp    Ld67a            ; 3

Ld46b:
    cpx    $d2              ; 3
    bcc    Ld480            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    ldy    $d5              ; 3
    sty    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    jmp    Ld4da            ; 3

Ld480:
    ldy    #$23             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    lda    $f2              ; 3
    beq    Ld50e            ; 2³+1
    bne    Ld501            ; 2³+1
Ld496:
    dex                     ; 2
    bne    Ld49c            ; 2³
    jmp    Ld67a            ; 3

Ld49c:
    dey                     ; 2
    cpx    $d2              ; 3
    bcc    Ld4ae            ; 2³
    lda    #$00             ; 2
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld4cb            ; 3

Ld4ae:
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld4ee            ; 3

Ld4bb:
    dex                     ; 2
    bne    Ld4c1            ; 2³
    jmp    Ld67a            ; 3

Ld4c1:
    cpx    $d2              ; 3
    bcc    Ld4e4            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld4cb:
    bit    $c8              ; 3
    bvc    Ld4da            ; 2³
    ldy    $81              ; 3
    lda    Ld800,y          ; 4
    sta    COLUP1           ; 3
    lda    $87              ; 3
    sta    REFP1            ; 3
Ld4da:
    dex                     ; 2
    bne    Ld4e0            ; 2³
    jmp    Ld67a            ; 3

Ld4e0:
    lda    #$00             ; 2
    beq    Ld522            ; 2³+1
Ld4e4:
    ldy    #$23             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
Ld4ee:
    bit    $c8              ; 3
    bvc    Ld4fd            ; 2³
    ldy    $81              ; 3
    lda    Ld800,y          ; 4
    sta    COLUP1           ; 3
    lda    $87              ; 3
    sta    REFP1            ; 3
Ld4fd:
    lda    $f2              ; 3
    beq    Ld50e            ; 2³
Ld501:
    dex                     ; 2
    bne    Ld507            ; 2³
    jmp    Ld67a            ; 3

Ld507:
    ldy    #$22             ; 2
    lda    ($e7),y          ; 5
    jmp    Ld522            ; 3

Ld50e:
    dex                     ; 2
    bne    Ld514            ; 2³
    jmp    Ld67a            ; 3

Ld514:
    ldy    $d3              ; 3
    sty    $d2              ; 3
    ldy    $e4              ; 3
    sty    $e7              ; 3
    ldy    #GREEN-8         ; 2
    sty    COLUP0           ; 3
    sta    $d3              ; 3
Ld522:
    bit    $c8              ; 3
    bvc    Ld557            ; 2³
    ldy    $83              ; 3
    cpy    #$09             ; 2
    bcc    Ld54b            ; 2³
    dey                     ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    dex                     ; 2
    bne    Ld537            ; 2³
    jmp    Ld67a            ; 3

Ld537:
    dey                     ; 2
    bpl    Ld537            ; 2³
    sta    RESP1            ; 3
    cpx    $d2              ; 3
    bcs    Ld584            ; 2³
    ldy    #$21             ; 2
    lda    ($e7),y          ; 5
    sta    GRP0             ; 3
    sta    $f2              ; 3
    jmp    Ld5ad            ; 3

Ld54b:
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld54f:
    dey                     ; 2
    bpl    Ld54f            ; 2³
    sta    RESP1            ; 3
    jmp    Ld574            ; 3

Ld557:
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    #$00             ; 2
    cpx    $d6              ; 3
    bne    Ld563            ; 2³
    lda    #$02             ; 2
Ld563:
    sta    ENAM1            ; 3
    cpx    $d4              ; 3
    bcs    Ld574            ; 2³
    ldy    #$22             ; 2
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld5d1            ; 2³
    jmp    Ld5fe            ; 3

Ld574:
    dex                     ; 2
    bne    Ld57a            ; 2³
    jmp    Ld67a            ; 3

Ld57a:
    cpx    $d2              ; 3
    bcc    Ld5a3            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
Ld584:
    bit    $c8              ; 3
    bvc    Ld592            ; 2³
    lda    #$00             ; 2
    sta    $c8              ; 3
    sta    $d5              ; 3
    lda    $e6              ; 3
    sta    $e9              ; 3
Ld592:
    dex                     ; 2
    bne    Ld598            ; 2³
    jmp    Ld67a            ; 3

Ld598:
    ldy    #$20             ; 2
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld648            ; 3

Ld5a3:
    ldy    #$21             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
Ld5ad:
    bit    $c8              ; 3
    bvc    Ld5bb            ; 2³
    lda    #$00             ; 2
    sta    $c8              ; 3
    sta    $d5              ; 3
    lda    $e6              ; 3
    sta    $e9              ; 3
Ld5bb:
    lda    $f2              ; 3
    beq    Ld62f            ; 2³+1
Ld5bf:
    dex                     ; 2
    bne    Ld5c5            ; 2³
    jmp    Ld67a            ; 3

Ld5c5:
    ldy    #$20             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    #$00             ; 2
    beq    Ld648            ; 2³+1
Ld5d1:
    dex                     ; 2
    bne    Ld5d7            ; 2³
    jmp    Ld67a            ; 3

Ld5d7:
    ldy    #$21             ; 2
    cpx    $d2              ; 3
    bcc    Ld5ec            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    jmp    Ld592            ; 3

Ld5ec:
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    lda    $f2              ; 3
    beq    Ld62f            ; 2³+1
    bne    Ld5bf            ; 2³
Ld5fe:
    dex                     ; 2
    bne    Ld604            ; 2³
    jmp    Ld67a            ; 3

Ld604:
    cpx    $d2              ; 3
    bcc    Ld619            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    jmp    Ld592            ; 3

Ld619:
    ldy    #$21             ; 2
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    sta    $f2              ; 3
    lda    $d5              ; 3
    sta    $d4              ; 3
    lda    #$80             ; 2
    sta    $c8              ; 3
    lda    $f2              ; 3
    bne    Ld5bf            ; 2³+1
Ld62f:
    dex                     ; 2
    beq    Ld67a            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    ldy    $d3              ; 3
    sty    $d2              ; 3
    ldy    $e4              ; 3
    sty    $e7              ; 3
    ldy    #GREEN-8         ; 2
    sty    COLUP0           ; 3
    sta    $d3              ; 3
    ldy    #$20             ; 2
Ld648:
    cpx    $d6              ; 3
    bne    Ld64e            ; 2³
    lda    #$02             ; 2
Ld64e:
    sta    ENAM1            ; 3
    cpx    $d4              ; 3
    bcc    Ld657            ; 2³
    jmp    Ld09e            ; 3

Ld657:
    lda    ($e9),y          ; 5
    sta    GRP1             ; 3
    bne    Ld660            ; 2³
    jmp    Ld21b            ; 3

Ld660:
    dex                     ; 2
    beq    Ld67a            ; 2³
    dey                     ; 2
    cpx    $d2              ; 3
    bcc    Ld671            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld1e0            ; 3

Ld671:
    lda    ($e7),y          ; 5
    sta    WSYNC            ; 3
    sta    GRP0             ; 3
    jmp    Ld1fd            ; 3

Ld67a:
    sta    WSYNC            ; 3
    stx    PF0              ; 3
    stx    PF1              ; 3
Ld680:
    stx    PF2              ; 3
    stx    GRP0             ; 3
    stx    GRP1             ; 3
    stx    GRP0             ; 3
    stx    ENAM1            ; 3
    rts                     ; 6

ReflectTbl:
    .byte %00000000 ; $d68b
    .byte %00000001
    .byte %00000000
    .byte %00000000
    .byte %00000001
    .byte %00000001
    .byte %00000001
    .byte %00000000
    .byte %00000001
    .byte %00000000
    .byte %00000001
    .byte %00000000
    .byte %00000000
Ld698:
    .byte %00100011 ; $23 ; |  X   XX| $d698
    .byte %00000001 ; $01 ; |       X| $d699
    .byte %00100011 ; $23 ; |  X   XX| $d69a
    .byte %00000001 ; $01 ; |       X| $d69b
    .byte %00100011 ; $23 ; |  X   XX| $d69c
    .byte %00100011 ; $23 ; |  X   XX| $d69d
    .byte %00000001 ; $01 ; |       X| $d69e
    .byte %01000100 ; $44 ; | X   X  | $d69f
    .byte %00100011 ; $23 ; |  X   XX| $d6a0
    .byte %10101011 ; $ab ; |X X X XX| $d6a1
    .byte %10001000 ; $88 ; |X   X   | $d6a2
Ld6a3:
    .byte %00100011 ; $23 ; |  X   XX| $d6a3
    .byte %00100011 ; $23 ; |  X   XX| $d6a4
    .byte %00100011 ; $23 ; |  X   XX| $d6a5
    .byte %00100011 ; $23 ; |  X   XX| $d6a6
    .byte %00100011 ; $23 ; |  X   XX| $d6a7
    .byte %00000001 ; $01 ; |       X| $d6a8
    .byte %00100011 ; $23 ; |  X   XX| $d6a9
    .byte %00000010 ; $02 ; |      X | $d6aa
    .byte %01100110 ; $66 ; | XX  XX | $d6ab
    .byte %10001001 ; $89 ; |X   X  X| $d6ac
    .byte %00100011 ; $23 ; |  X   XX| $d6ad
    .byte %00100011 ; $23 ; |  X   XX| $d6ae
Ld6af:
    .byte %00100011 ; $23 ; |  X   XX| $d6af
    .byte %00000001 ; $01 ; |       X| $d6b0
    .byte %00000001 ; $01 ; |       X| $d6b1
    .byte %00100011 ; $23 ; |  X   XX| $d6b2
    .byte %00000001 ; $01 ; |       X| $d6b3
    .byte %00000001 ; $01 ; |       X| $d6b4
    .byte %00100011 ; $23 ; |  X   XX| $d6b5
    .byte %00100100 ; $24 ; |  X  X  | $d6b6
    .byte %01000101 ; $45 ; | X   X X| $d6b7
    .byte %10101010 ; $aa ; |X X X X | $d6b8
    .byte %01100111 ; $67 ; | XX  XXX| $d6b9
    .byte %11001101 ; $cd ; |XX  XX X| $d6ba
    .byte %11001100 ; $cc ; |XX  XX  | $d6bb

Ld6bc:
    .byte $bb           ; $bb
    .byte $08           ; $08
    .byte $08           ; $08
    .byte $00           ; $00
    .byte $08           ; $08
    .byte $00           ; $00
    .byte $08           ; $08
    .byte $2f           ; $2f
    .byte $57           ; $57
    .byte $79           ; $79
    .byte $9a           ; $9a
    .byte $bb           ; $bb
    .byte $79           ; $79
    .byte $00           ; $00

    .byte %00000000 ; |        | $d6ca
    .byte %11110000 ; |XXXX    |
    .byte %11110111 ; |XXXX XXX|
    .byte %01100111 ; | XX  XXX|
    .byte %01000011 ; | X    XX|
    .byte %01000010 ; | X    X |
    .byte %01000010 ; | X    X |
    .byte %01000010 ; | X    X |
    .byte %01000010 ; | X    X |
    .byte %01000110 ; | X   XX |
    .byte %01000110 ; | X   XX |
    .byte %11000100 ; |XX   X  |
    .byte %11000100 ; |XX   X  |
    .byte %10000100 ; |X    X  |
    .byte %10000100 ; |X    X  |
    .byte %10000100 ; |X    X  |
    .byte %10000100 ; |X    X  |
    .byte %11000110 ; |XX   XX |
    .byte %11000110 ; |XX   XX |
    .byte %11000011 ; |XX    XX|
    .byte %11000011 ; |XX    XX|
    .byte %01000011 ; | X    XX|
    .byte %01000001 ; | X     X|
    .byte %01011001 ; | X XX  X|
    .byte %01111111 ; | XXXXXXX|
    .byte %01111111 ; | XXXXXXX|
    .byte %00011110 ; |   XXXX |
    .byte %00011110 ; |   XXXX |
    .byte %00111100 ; |  XXXX  |
    .byte %00111100 ; |  XXXX  |
    .byte %01111100 ; | XXXXX  |
    .byte %01111100 ; | XXXXX  |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %01111110 ; | XXXXXX |
    .byte %00111100 ; |  XXXX  |
    .byte %00011000 ; |   XX   |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |
    .byte %00000000 ; |        |

    .byte BLUE+4          ; $9c  $d700
    .byte CYAN+4          ; CYAN+4
    .byte GREEN+4          ; $5c
    .byte GREEN2+4          ; GREEN2+4
    .byte BLUE+4          ; $9c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN+4          ; $5c
    .byte GREEN2+4          ; GREEN2+4
    .byte CYAN+4          ; CYAN+4  $d708
    .byte GREEN2+4          ; GREEN2+4
    .byte CYAN+4          ; CYAN+4
    .byte GREEN+4          ; $5c
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte GREEN+4          ; $5c
    .byte CYAN+4          ; CYAN+4
    .byte GREEN2+4          ; GREEN2+4
    .byte BLUE-6          ; $92
    .byte BLUE-6          ; $92
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE2-6          ; $d2
    .byte BLUE2-6          ; $d2

    .byte BLUE1-6          ; $b2  $d72f
    .byte BLUE1-6          ; $b2
    .byte BLUE-6          ; $92
    .byte BLUE-6          ; $92
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE2-6          ; $d2
    .byte BLUE2-6          ; $d2
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE-6          ; $92
    .byte BLUE-6          ; $92
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE2-6          ; $d2
    .byte BLUE2-6          ; $d2
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE-6          ; $92
    .byte BLUE-6          ; $92
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE2-6          ; $d2
    .byte BLUE2-6          ; $d2
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE-6          ; $92
    .byte BLUE-6          ; $92
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte BLUE2-6          ; $d2
    .byte BLUE2-6          ; $d2
    .byte BLUE1-6          ; $b2
    .byte BLUE1-6          ; $b2
    .byte GREEN+2          ; $5a
    .byte GREEN+2          ; $5a
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+6          ; $5e
    .byte GREEN+6          ; $5e

    .byte GREEN+4          ; $5c  $d757
    .byte GREEN+4          ; $5c
    .byte GREEN+2          ; $5a
    .byte GREEN+2          ; $5a
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+6          ; $5e
    .byte GREEN+6          ; $5e
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+2          ; $5a
    .byte GREEN+2          ; $5a
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+6          ; $5e
    .byte GREEN+6          ; $5e
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+2          ; $5a
    .byte GREEN+2          ; $5a
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+6          ; $5e
    .byte GREEN+6          ; $5e
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+2          ; $5a
    .byte GREEN+2          ; $5a
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c
    .byte GREEN+6          ; $5e
    .byte GREEN+6          ; $5e
    .byte GREEN+4          ; $5c
    .byte GREEN+4          ; $5c

    .byte GREEN2-8          ; $30  $d779
    .byte GREEN2-8          ; $30
    .byte BROWN-4          ; $40
    .byte GREEN2-8          ; $30
    .byte SAND-8          ; $20
    .byte BROWN-2          ; $42
    .byte GREEN2-6          ; $32
    .byte SAND-6          ; $22
    .byte BROWN-2          ; $42
    .byte BROWN          ; $44
    .byte BROWN-2          ; $42
    .byte SAND-6          ; $22
    .byte GREEN2-4          ; $34
    .byte GREEN2-4          ; $34
    .byte SAND-6          ; $22
    .byte BROWN-2          ; $42
    .byte GREEN2-6          ; $32
    .byte SAND-4          ; $24
    .byte BROWN          ; $44
    .byte GREEN2-4          ; $34
    .byte SAND-6          ; $22
    .byte BROWN-2          ; $42
    .byte GREEN2-8          ; $30
    .byte SAND-6          ; $22
    .byte BROWN-2          ; $42
    .byte GREEN2-4          ; $34
    .byte SAND-4          ; $24
    .byte BROWN          ; $44
    .byte GREEN2-4          ; $34
    .byte SAND-6          ; $22
    .byte BROWN-2          ; $42
    .byte GREEN2-4          ; $34
    .byte SAND-6          ; $22

    .byte $09          ; $09  $d79a
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09
    .byte $07          ; $07
    .byte $09          ; $09

    .byte $00   ; $d7bb
    .byte $00
    .byte $02
    .byte $00
    .byte $02
    .byte $02
    .byte $00
    .byte $02
    .byte $00
    .byte $02
    .byte $02
    .byte $00
    .byte $02
    .byte $02
    .byte $00
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $02
    .byte $00
    .byte $00
    .byte $02
    .byte $02
    .byte $02
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00

    .byte %00000000 ; |        | $d7da
    .byte %01101011 ; | XX X XX|
    .byte %01111111 ; | XXXXXXX|
    .byte %01111111 ; | XXXXXXX|
    .byte %01111111 ; | XXXXXXX|
    .byte %00111110 ; |  XXXXX |
    .byte %00111110 ; |  XXXXX |
    .byte %00011100 ; |   XXX  |
    .byte %01011101 ; | X XXX X|
    .byte %01111111 ; | XXXXXXX|
    .byte %01011101 ; | X XXX X|
    .byte %01011101 ; | X XXX X|
    .byte %01011101 ; | X XXX X|
    .byte %01011101 ; | X XXX X|
    .byte %00011100 ; |   XXX  |
    .byte %00111110 ; |  XXXXX |
    .byte %00111110 ; |  XXXXX |
    .byte %00111110 ; |  XXXXX |
    .byte %00011100 ; |   XXX  |
Ld7ed:
    .byte %00001000 ; $08 ; |    X   | $d7ed
    .byte %00010100 ; $14 ; |   X X  | $d7ee
    .byte %00010100 ; $14 ; |   X X  | $d7ef
    .byte %00010100 ; $14 ; |   X X  | $d7f0
    .byte %00010100 ; $14 ; |   X X  | $d7f1
    .byte %00010100 ; $14 ; |   X X  | $d7f2
    .byte %00010100 ; $14 ; |   X X  | $d7f3
    .byte %00111110 ; $3e ; |  XXXXX | $d7f4
    .byte %00101010 ; $2a ; |  X X X | $d7f5
    .byte %00101010 ; $2a ; |  X X X | $d7f6
    .byte %00101010 ; $2a ; |  X X X | $d7f7
    .byte %00001000 ; $08 ; |    X   | $d7f8
    .byte %00000000 ; $00 ; |        | $d7f9
    .byte %00000000 ; $00 ; |        | $d7fa
    .byte %00000000 ; $00 ; |        | $d7fb
    .byte %00000000 ; $00 ; |        | $d7fc
    .byte %00000000 ; $00 ; |        | $d7fd
    .byte %00000000 ; $00 ; |        | $d7fe
    .byte %00000000 ; $00 ; |        | $d7ff

; sliece #2 ($d800..$dbff)
Ld800:
    .byte BROWN+2       ; $46
    .byte BROWN         ; $44
    .byte SAND-4        ; $24
    .byte $00           ; $00
    .byte BROWN         ; $44
    .byte $0a           ; $0a
    .byte $0e           ; $0e
    .byte $00           ; $00
    .byte BROWN         ; $44
    .byte BLUE1-8       ; $b0
    .byte GREEN         ; $58
    .byte CYAN          ; $78
    .byte BROWN-2       ; $42
    .byte SAND+2        ; $2a
    .byte BLUE2-8       ; $d0
    .byte BLUE1+2       ; $ba
Ld810:
    .byte %00000101 ; $05 ; |     X X| $d810
    .byte %00000000 ; $00 ; |        | $d811
    .byte %00000101 ; $05 ; |     X X| $d812
    .byte %00000101 ; $05 ; |     X X| $d813
    .byte %01100000 ; $60 ; | XX     | $d814
    .byte %01100101 ; $65 ; | XX  X X| $d815
    .byte %01100000 ; $60 ; | XX     | $d816
    .byte %01100000 ; $60 ; | XX     | $d817
    .byte %01100101 ; $65 ; | XX  X X| $d818
    .byte %00000000 ; $00 ; |        | $d819
    .byte %11111111 ; $ff ; |XXXXXXXX| $d81a
    .byte %01000000 ; $40 ; | X      | $d81b
    .byte %00100000 ; $20 ; |  X     | $d81c
    .byte %00010000 ; $10 ; |   X    | $d81d
    .byte %00000100 ; $04 ; |     X  | $d81e
    .byte %00000010 ; $02 ; |      X | $d81f
    .byte %00001000 ; $08 ; |    X   | $d820
    .byte %00010000 ; $10 ; |   X    | $d821

GameTbl:
    .byte $00 ; $d822
    .byte $01
    .byte $02
    .byte $03
    .byte $00
    .byte $01
    .byte $02
    .byte $03

    .byte %00000110 ; $06 ; |     XX | $d82a
    .byte %00000100 ; $04 ; |     X  | $d82b
    .byte %00000101 ; $05 ; |     X X| $d82c
    .byte %00000111 ; $07 ; |     XXX| $d82d
    .byte %00000110 ; $06 ; |     XX | $d82e
    .byte %00000101 ; $05 ; |     X X| $d82f
    .byte %00000111 ; $07 ; |     XXX| $d830
    .byte %00000110 ; $06 ; |     XX | $d831
    .byte %00000000 ; $00 ; |        | $d832
    .byte %00000000 ; |        | $d833
    .byte %00100100 ; |  X  X  |
    .byte %01100110 ; | XX  XX |
    .byte %11111111 ; |XXXXXXXX|
    .byte %11111111 ; |XXXXXXXX|
    .byte %11100111 ; |XXX  XXX|
    .byte %11100111 ; |XXX  XXX|
    .byte %11111111 ; |XXXXXXXX|
    .byte %01111110 ; | XXXXXX |
    .byte %01100110 ; | XX  XX |
    .byte %01100110 ; | XX  XX |
    .byte %01100110 ; | XX  XX |
    .byte %00100100 ; |  X  X  |
    .byte %00100100 ; |  X  X  |
    .byte %00100100 ; |  X  X  |
    .byte %00100100 ; |  X  X  |
    .byte %00100100 ; |  X  X  |
    .byte %00000000 ; |        | $d844
    .byte %00000000 ; |        | $d845
    .byte %00110010 ; |  XX  X | $d846
    .byte %00110010 ; |  XX  X | $d847
    .byte %00110010 ; |  XX  X | $d848
    .byte %00110011 ; |  XX  XX| $d849
    .byte %01111111 ; | XXXXXXX| $d84a
    .byte %01111111 ; | XXXXXXX| $d84b
    .byte %01100111 ; | XX  XXX| $d84c
    .byte %01100111 ; | XX  XXX| $d84d
    .byte %01111111 ; | XXXXXXX| $d84e
    .byte %11111110 ; |XXXXXXX | $d84f
    .byte %11001110 ; |XX  XXX | $d850
    .byte %11001100 ; |XX  XX  | $d851
    .byte %10001100 ; |X   XX  | $d852
    .byte %10011000 ; |X  XX   | $d853
    .byte %10011000 ; |X  XX   | $d854
    .byte %00010000 ; |   X    | $d855
    .byte %00000000 ; |        | $d856
    .byte %00000000 ; |        | $d857
    .byte %00001100 ; |    XX  | $d858
    .byte %00011110 ; |   XXXX | $d859
    .byte %00011111 ; |   XXXXX| $d85a
    .byte %00111111 ; |  XXXXXX| $d85b
    .byte %00111110 ; |  XXXXX | $d85c
    .byte %01111010 ; | XXXX X | $d85d
    .byte %01101010 ; | XX X X | $d85e
    .byte %11001011 ; |XX  X XX| $d85f
    .byte %10001011 ; |X   X XX| $d860
    .byte %00001111 ; |    XXXX| $d861
    .byte %00001110 ; |    XXX | $d862
    .byte %00011110 ; |   XXXX | $d863
    .byte %00111110 ; |  XXXXX | $d864
    .byte %01111100 ; | XXXXX  | $d865
    .byte %11110000 ; |XXXX    | $d866
    .byte %11000000 ; |XX      | $d867
    .byte %00000000 ; |        | $d868
    .byte %00000000 ; |        | $d869
    .byte %00001100 ; |    XX  | $d86a
    .byte %00011100 ; |   XXX  | $d86b
    .byte %00111110 ; |  XXXXX | $d86c
    .byte %01111111 ; | XXXXXXX| $d86d
    .byte %11111111 ; |XXXXXXXX| $d86e
    .byte %11111111 ; |XXXXXXXX| $d86f
    .byte %00001010 ; |    X X | $d870
    .byte %00001010 ; |    X X | $d871
    .byte %00001010 ; |    X X | $d872
    .byte %00001010 ; |    X X | $d873
    .byte %11111111 ; |XXXXXXXX| $d874
    .byte %11111111 ; |XXXXXXXX| $d875
    .byte %01111111 ; | XXXXXXX| $d876
    .byte %00111110 ; |  XXXXX | $d877
    .byte %00011100 ; |   XXX  | $d878
    .byte %00001100 ; |    XX  | $d879
    .byte %00000000 ; |        | $d87a
    .byte %00000000 ; |        | $d87b
    .byte %11000000 ; |XX      | $d87c
    .byte %11110000 ; |XXXX    | $d87d
    .byte %01111100 ; | XXXXX  | $d87e
    .byte %00111110 ; |  XXXXX | $d87f
    .byte %00011110 ; |   XXXX | $d880
    .byte %00001110 ; |    XXX | $d881
    .byte %00001111 ; |    XXXX| $d882
    .byte %10001011 ; |X   X XX| $d883
    .byte %11001011 ; |XX  X XX| $d884
    .byte %01101010 ; | XX X X | $d885
    .byte %01111010 ; | XXXX X | $d886
    .byte %00111110 ; |  XXXXX | $d887
    .byte %00111111 ; |  XXXXXX| $d888
    .byte %00011111 ; |   XXXXX| $d889
    .byte %00011110 ; |   XXXX | $d88a
    .byte %00001100 ; |    XX  | $d88b
    .byte %00000000 ; |        | $d88c
    .byte %00000000 ; |        | $d88d
    .byte %00010000 ; |   X    | $d88e
    .byte %10011000 ; |X  XX   | $d88f
    .byte %10011000 ; |X  XX   | $d890
    .byte %10001100 ; |X   XX  | $d891
    .byte %11001100 ; |XX  XX  | $d892
    .byte %11001110 ; |XX  XXX | $d893
    .byte %11111110 ; |XXXXXXX | $d894
    .byte %01111111 ; | XXXXXXX| $d895
    .byte %01100111 ; | XX  XXX| $d896
    .byte %01100111 ; | XX  XXX| $d897
    .byte %01111111 ; | XXXXXXX| $d898
    .byte %01111111 ; | XXXXXXX| $d899
    .byte %00110011 ; |  XX  XX| $d89a
    .byte %00110010 ; |  XX  X | $d89b
    .byte %00110010 ; |  XX  X | $d89c
    .byte %00110010 ; |  XX  X | $d89d
    .byte %00000000 ; |        | $d89e
    .byte %00000000 ; |        | $d89f
    .byte %00100100 ; |  X  X  | $d8a0
    .byte %00100100 ; |  X  X  | $d8a1
    .byte %00100100 ; |  X  X  | $d8a2
    .byte %00100100 ; |  X  X  | $d8a3
    .byte %00100100 ; |  X  X  | $d8a4
    .byte %01100110 ; | XX  XX | $d8a5
    .byte %01100110 ; | XX  XX | $d8a6
    .byte %01100110 ; | XX  XX | $d8a7
    .byte %01111110 ; | XXXXXX | $d8a8
    .byte %11111111 ; |XXXXXXXX| $d8a9
    .byte %11100111 ; |XXX  XXX| $d8aa
    .byte %11100111 ; |XXX  XXX| $d8ab
    .byte %11111111 ; |XXXXXXXX| $d8ac
    .byte %11111111 ; |XXXXXXXX| $d8ad
    .byte %01100110 ; | XX  XX | $d8ae
    .byte %00100100 ; |  X  X  | $d8af
    .byte %00000000 ; |        | $d8b0
    .byte %00000000 ; |        | $d8b1
    .byte %00000111 ; |     XXX| $d8b2
    .byte %01110110 ; | XXX XX | $d8b3
    .byte %00110110 ; |  XX XX | $d8b4
    .byte %00110110 ; |  XX XX | $d8b5
    .byte %10111110 ; |X XXXXX | $d8b6
    .byte %10111000 ; |X XXX   | $d8b7
    .byte %10111101 ; |X XXXX X| $d8b8
    .byte %10111101 ; |X XXXX X| $d8b9
    .byte %11111101 ; |XXXXXX X| $d8ba
    .byte %11111111 ; |XXXXXXXX| $d8bb
    .byte %01100010 ; | XX   X | $d8bc
    .byte %00110110 ; |  XX XX | $d8bd
    .byte %00101010 ; |  X X X | $d8be
    .byte %00101010 ; |  X X X | $d8bf
    .byte %00111110 ; |  XXXXX | $d8c0
    .byte %00100010 ; |  X   X | $d8c1
    .byte %00000000 ; |        | $d8c2
    .byte %00000000 ; |        | $d8c3
    .byte %11111111 ; |XXXXXXXX| $d8c4
    .byte %01110111 ; | XXX XXX|
    .byte %01101110 ; | XX XXX |
    .byte %00111100 ; |  XXXX  |
    .byte %01111000 ; | XXXX   |
    .byte %01111110 ; | XXXXXX |
    .byte %00110101 ; |  XX X X|
    .byte %00111101 ; |  XXXX X|
    .byte %01110000 ; | XXX    |
    .byte %11011101 ; |XX XXX X|
    .byte %10000100 ; |X    X  |
    .byte %00011110 ; |   XXXX |
    .byte %10010010 ; |X  X  X |
    .byte %00010010 ; |   X  X |
    .byte %10010001 ; |X  X   X|
    .byte %00110000 ; |  XX    |
    .byte %00100010 ; |  X   X |
    .byte %01000100 ; | X   X  |
    .byte %00010000 ; |   X    |
    .byte %10000000 ; $80 ; |X       | $d8d7
    .byte %01000011 ; $43 ; | X    XX| $d8d8
    .byte %01001111 ; $4f ; | X  XXXX| $d8d9
    .byte %01010000 ; $50 ; | X X    | $d8da
    .byte %01010010 ; $52 ; | X X  X | $d8db
    .byte %00100000 ; $20 ; |  X     | $d8dc
    .byte %00110001 ; $31 ; |  XX   X| $d8dd
    .byte %00111001 ; $39 ; |  XXX  X| $d8de
    .byte %00111000 ; $38 ; |  XXX   | $d8df
    .byte %00110011 ; $33 ; |  XX  XX| $d8e0
    .byte %00100000 ; $20 ; |  X     | $d8e1
    .byte %01010000 ; $50 ; | X X    | $d8e2
    .byte %01000001 ; $41 ; | X     X| $d8e3
    .byte %01010010 ; $52 ; | X X  X | $d8e4
    .byte %01001011 ; $4b ; | X  X XX| $d8e5
    .byte %01000101 ; $45 ; | X   X X| $d8e6
    .byte %01010010 ; $52 ; | X X  X | $d8e7
    .byte %00100000 ; $20 ; |  X     | $d8e8
    .byte %01000010 ; $42 ; | X    X | $d8e9
    .byte %01010010 ; $52 ; | X X  X | $d8ea
    .byte %01001111 ; $4f ; | X  XXXX| $d8eb
    .byte %01010100 ; $54 ; | X X X  | $d8ec
    .byte %01001000 ; $48 ; | X  X   | $d8ed
    .byte %01000101 ; $45 ; | X   X X| $d8ee
    .byte %01010010 ; $52 ; | X X  X | $d8ef
    .byte %01010011 ; $53 ; | X X  XX| $d8f0
    .byte %00101101 ; $2d ; |  X XX X| $d8f1
    .byte %01001100 ; $4c ; | X  XX  | $d8f2
    .byte %00101110 ; $2e ; |  X XXX | $d8f3
    .byte %00100000 ; $20 ; |  X     | $d8f4
    .byte %01000111 ; $47 ; | X   XXX| $d8f5
    .byte %01000101 ; $45 ; | X   X X| $d8f6
    .byte %01001100 ; $4c ; | X  XX  | $d8f7
    .byte %01000010 ; $42 ; | X    X | $d8f8
    .byte %01000101 ; $45 ; | X   X X| $d8f9
    .byte %01010010 ; $52 ; | X X  X | $d8fa
    .byte %01000111 ; $47 ; | X   XXX| $d8fb
    .byte %00000000 ; $00 ; |        | $d8fc
    .byte %00000000 ; $00 ; |        | $d8fd
    .byte %00000000 ; $00 ; |        | $d8fe
    .byte %00000000 ; $00 ; |        | $d8ff
    .byte %00000000 ; $00 ; |        | $d900
    .byte %00000000 ; $00 ; |        | $d901
    .byte %00000000 ; $00 ; |        | $d902
    .byte %00000000 ; $00 ; |        | $d903
    .byte %00000000 ; $00 ; |        | $d904
    .byte %00000000 ; $00 ; |        | $d905
    .byte %00000000 ; $00 ; |        | $d906
    .byte %00000000 ; $00 ; |        | $d907
    .byte %00000000 ; $00 ; |        | $d908
    .byte %00000000 ; $00 ; |        | $d909
    .byte %00000000 ; $00 ; |        | $d90a
    .byte %00000000 ; $00 ; |        | $d90b
    .byte %00000000 ; $00 ; |        | $d90c
    .byte %00000000 ; $00 ; |        | $d90d
    .byte %00000000 ; $00 ; |        | $d90e
    .byte %00000000 ; $00 ; |        | $d90f
    .byte %00000000 ; $00 ; |        | $d910
    .byte %00000000 ; $00 ; |        | $d911
    .byte %00000000 ; $00 ; |        | $d912
    .byte %00000000 ; $00 ; |        | $d913
    .byte %00000000 ; $00 ; |        | $d914
    .byte %00000000 ; $00 ; |        | $d915
    .byte %00000000 ; $00 ; |        | $d916
    .byte %00000000 ; $00 ; |        | $d917
    .byte %00000000 ; $00 ; |        | $d918
    .byte %00000000 ; $00 ; |        | $d919
    .byte %00000000 ; $00 ; |        | $d91a
    .byte %00000000 ; $00 ; |        | $d91b
    .byte %00000000 ; $00 ; |        | $d91c
    .byte %00000000 ; $00 ; |        | $d91d
    .byte %00000000 ; $00 ; |        | $d91e
    .byte %00000000 ; $00 ; |        | $d91f
    .byte %00000000 ; $00 ; |        | $d920
    .byte %00000000 ; $00 ; |        | $d921
    .byte %00000000 ; $00 ; |        | $d922
    .byte %00000000 ; $00 ; |        | $d923
    .byte %00000000 ; $00 ; |        | $d924
    .byte %00000000 ; $00 ; |        | $d925
    .byte %00000000 ; $00 ; |        | $d926
    .byte %00000000 ; $00 ; |        | $d927
    .byte %00000000 ; $00 ; |        | $d928
    .byte %00000000 ; $00 ; |        | $d929
    .byte %00000000 ; $00 ; |        | $d92a
    .byte %00000111 ; |     XXX| $d92b
    .byte %01110110 ; | XXX XX | $d92c
    .byte %00110110 ; |  XX XX | $d92d
    .byte %00110110 ; |  XX XX | $d92e
    .byte %00111110 ; |  XXXXX | $d92f
    .byte %00111000 ; |  XXX   | $d930
    .byte %00111110 ; |  XXXXX | $d931
    .byte %00111101 ; |  XXXX X| $d932
    .byte %00111101 ; |  XXXX X| $d933
    .byte %00111101 ; |  XXXX X| $d934
    .byte %01111111 ; | XXXXXXX| $d935
    .byte %10100010 ; |X X   X | $d936
    .byte %10110110 ; |X XX XX | $d937
    .byte %10101010 ; |X X X X | $d938
    .byte %00111110 ; |  XXXXX | $d939
    .byte %00100010 ; |  X   X | $d93a
    .byte %00000000 ; |        | $d93b
    .byte %00000000 ; |        | $d93c
    .byte %01111000 ; | XXXX   | $d93d
    .byte %01111000 ; | XXXX   | $d93e
    .byte %00110000 ; |  XX    | $d93f
    .byte %00110000 ; |  XX    | $d940
    .byte %00100000 ; |  X     | $d941
    .byte %00100111 ; |  X  XXX| $d942
    .byte %00100111 ; |  X  XXX| $d943
    .byte %00100011 ; |  X   XX| $d944
    .byte %00100010 ; |  X   X | $d945
    .byte %00100010 ; |  X   X | $d946
    .byte %01100010 ; | XX   X | $d947
    .byte %01100110 ; | XX  XX | $d948
    .byte %01000110 ; | X   XX | $d949
    .byte %01001100 ; | X  XX  | $d94a
    .byte %11001100 ; |XX  XX  | $d94b
    .byte %10001100 ; |X   XX  | $d94c
    .byte %10000100 ; |X    X  | $d94d
    .byte %11000110 ; |XX   XX | $d94e
    .byte %11000110 ; |XX   XX | $d94f
    .byte %01000011 ; | X    XX| $d950
    .byte %01000011 ; | X    XX| $d951
    .byte %01000001 ; | X     X| $d952
    .byte %01001001 ; | X  X  X| $d953
    .byte %01111011 ; | XXXX XX| $d954
    .byte %01111111 ; | XXXXXXX| $d955
    .byte %00011110 ; |   XXXX | $d956
    .byte %00010110 ; |   X XX | $d957
    .byte %01110100 ; | XXX X  | $d958
    .byte %01110100 ; | XXX X  | $d959
    .byte %01110100 ; | XXX X  | $d95a
    .byte %11111100 ; |XXXXXX  | $d95b
    .byte %11111100 ; |XXXXXX  | $d95c
    .byte %11111100 ; |XXXXXX  | $d95d
    .byte %11111110 ; |XXXXXXX | $d95e
    .byte %11101010 ; |XXX X X | $d95f
    .byte %11101010 ; |XXX X X | $d960
    .byte %01111110 ; | XXXXXX | $d961
    .byte %01111100 ; | XXXXX  | $d962
    .byte %00111100 ; |  XXXX  | $d963
    .byte %00010000 ; |   X    | $d964
    .byte %00000000 ; |        | $d965
    .byte %00000000 ; |        | $d966
    .byte %11110000 ; |XXXX    | $d967
    .byte %11110111 ; |XXXX XXX| $d968
    .byte %01100111 ; | XX  XXX| $d969
    .byte %01000011 ; | X    XX| $d96a
    .byte %01000010 ; | X    X | $d96b
    .byte %01000010 ; | X    X | $d96c
    .byte %01000010 ; | X    X | $d96d
    .byte %01000010 ; | X    X | $d96e
    .byte %01000110 ; | X   XX | $d96f
    .byte %01000110 ; | X   XX | $d970
    .byte %11000100 ; |XX   X  | $d971
    .byte %11000100 ; |XX   X  | $d972
    .byte %10000100 ; |X    X  | $d973
    .byte %10000100 ; |X    X  | $d974
    .byte %10000100 ; |X    X  | $d975
    .byte %10000100 ; |X    X  | $d976
    .byte %11000110 ; |XX   XX | $d977
    .byte %11000110 ; |XX   XX | $d978
    .byte %11000011 ; |XX    XX| $d979
    .byte %11000011 ; |XX    XX| $d97a
    .byte %01000011 ; | X    XX| $d97b
    .byte %01000001 ; | X     X| $d97c
    .byte %01011001 ; | X XX  X| $d97d
    .byte %01111111 ; | XXXXXXX| $d97e
    .byte %01111111 ; | XXXXXXX| $d97f
    .byte %00011110 ; |   XXXX | $d980
    .byte %00010110 ; |   X XX | $d981
    .byte %00110100 ; |  XX X  | $d982
    .byte %00110100 ; |  XX X  | $d983
    .byte %01110100 ; | XXX X  | $d984
    .byte %01111100 ; | XXXXX  | $d985
    .byte %01111110 ; | XXXXXX | $d986
    .byte %01111110 ; | XXXXXX | $d987
    .byte %01111110 ; | XXXXXX | $d988
    .byte %01101010 ; | XX X X | $d989
    .byte %01101010 ; | XX X X | $d98a
    .byte %01111110 ; | XXXXXX | $d98b
    .byte %01111110 ; | XXXXXX | $d98c
    .byte %00111100 ; |  XXXX  | $d98d
    .byte %00011000 ; |   XX   | $d98e
    .byte %00000000 ; |        | $d98f
    .byte %00000000 ; |        | $d990
    .byte %11100000 ; |XXX     | $d991
    .byte %01100000 ; | XX     | $d992
    .byte %01100111 ; | XX  XXX| $d993
    .byte %00000110 ; |     XX | $d994
    .byte %01100110 ; | XX  XX | $d995
    .byte %01100000 ; | XX     | $d996
    .byte %01110110 ; | XXX XX | $d997
    .byte %00111110 ; |  XXXXX | $d998
    .byte %00111100 ; |  XXXX  | $d999
    .byte %00111100 ; |  XXXX  | $d99a
    .byte %00111110 ; |  XXXXX | $d99b
    .byte %01111101 ; | XXXXX X| $d99c
    .byte %01111011 ; | XXXX XX| $d99d
    .byte %01110011 ; | XXX  XX| $d99e
    .byte %00110110 ; |  XX XX | $d99f
    .byte %00111100 ; |  XXXX  | $d9a0
    .byte %01111000 ; | XXXX   | $d9a1
    .byte %01111000 ; | XXXX   | $d9a2
    .byte %00111100 ; |  XXXX  | $d9a3
    .byte %00110000 ; |  XX    | $d9a4
    .byte %00111100 ; |  XXXX  | $d9a5
    .byte %00011000 ; |   XX   | $d9a6
    .byte %00000000 ; |        | $d9a7
    .byte %00000000 ; |        | $d9a8
    .byte %11100000 ; |XXX     | $d9a9
    .byte %01100111 ; | XX  XXX| $d9aa
    .byte %01100110 ; | XX  XX | $d9ab
    .byte %00000110 ; |     XX | $d9ac
    .byte %01100110 ; | XX  XX | $d9ad
    .byte %01100000 ; | XX     | $d9ae
    .byte %01100110 ; | XX  XX | $d9af
    .byte %01111110 ; | XXXXXX | $d9b0
    .byte %00111100 ; |  XXXX  | $d9b1
    .byte %00111100 ; |  XXXX  | $d9b2
    .byte %00111110 ; |  XXXXX | $d9b3
    .byte %01111110 ; | XXXXXX | $d9b4
    .byte %01111001 ; | XXXX  X| $d9b5
    .byte %01100011 ; | XX   XX| $d9b6
    .byte %01111110 ; | XXXXXX | $d9b7
    .byte %00111100 ; |  XXXX  | $d9b8
    .byte %01011010 ; | X XX X | $d9b9
    .byte %01111110 ; | XXXXXX | $d9ba
    .byte %00111100 ; |  XXXX  | $d9bb
    .byte %00100100 ; |  X  X  | $d9bc
    .byte %00111100 ; |  XXXX  | $d9bd
    .byte %00011000 ; |   XX   | $d9be
    .byte %00000000 ; |        | $d9bf
    .byte %00000000 ; |        | $d9c0
    .byte %00001000 ; |    X   | $d9c1
    .byte %00101010 ; |  X X X | $d9c2
    .byte %00101010 ; |  X X X | $d9c3
    .byte %00101010 ; |  X X X | $d9c4
    .byte %00111110 ; |  XXXXX | $d9c5
    .byte %00010100 ; |   X X  | $d9c6
    .byte %00010100 ; |   X X  | $d9c7
    .byte %00010100 ; |   X X  | $d9c8
    .byte %00010100 ; |   X X  | $d9c9
    .byte %00010100 ; |   X X  | $d9ca
    .byte %00010100 ; |   X X  | $d9cb
    .byte %00001000 ; |    X   | $d9cc
    .byte %00011100 ; |   XXX  | $d9cd
    .byte %00111110 ; |  XXXXX | $d9ce
    .byte %00111110 ; |  XXXXX | $d9cf
    .byte %00111110 ; |  XXXXX | $d9d0
    .byte %00011100 ; |   XXX  | $d9d1
    .byte %01011101 ; | X XXX X| $d9d2
    .byte %01011101 ; | X XXX X| $d9d3
    .byte %01011101 ; | X XXX X| $d9d4
    .byte %01011101 ; | X XXX X| $d9d5
    .byte %01111111 ; | XXXXXXX| $d9d6
    .byte %01011101 ; | X XXX X| $d9d7
    .byte %00011100 ; |   XXX  | $d9d8
    .byte %00111110 ; |  XXXXX | $d9d9
    .byte %00111110 ; |  XXXXX | $d9da
    .byte %01111111 ; | XXXXXXX| $d9db
    .byte %01111111 ; | XXXXXXX| $d9dc
    .byte %01111111 ; | XXXXXXX| $d9dd
    .byte %01101011 ; | XX X XX| $d9de
    .byte %00000000 ; |        | $d9df
    .byte %11111111 ; |XXXXXXXX| $d9e0
    .byte %01110111 ; | XXX XXX| $d9e1
    .byte %01101110 ; | XX XXX | $d9e2
    .byte %00111100 ; |  XXXX  | $d9e3
    .byte %01111000 ; | XXXX   | $d9e4
    .byte %01111110 ; | XXXXXX | $d9e5
    .byte %00110101 ; |  XX X X| $d9e6
    .byte %00111101 ; |  XXXX X| $d9e7
    .byte %01110000 ; | XXX    | $d9e8
    .byte %11011101 ; |XX XXX X| $d9e9
    .byte %10000100 ; |X    X  | $d9ea
    .byte %00101110 ; |  X XXX | $d9eb
    .byte %10010010 ; |X  X  X | $d9ec
    .byte %00010010 ; |   X  X | $d9ed
    .byte %10010001 ; |X  X   X| $d9ee
    .byte %00110000 ; |  XX    | $d9ef
    .byte %00100010 ; |  X   X | $d9f0
    .byte %01000100 ; | X   X  | $d9f1
    .byte %00010000 ; |   X    | $d9f2
    .byte %10000000 ; |X       | $d9f3
    .byte %00111011 ; |  XXX XX| $d9f4
    .byte %00010001 ; |   X   X| $d9f5
    .byte %00010001 ; |   X   X| $d9f6
    .byte %00010001 ; |   X   X| $d9f7
    .byte %00010010 ; |   X  X | $d9f8
    .byte %00010000 ; |   X    | $d9f9
    .byte %00010000 ; |   X    | $d9fa
    .byte %10010010 ; |X  X  X | $d9fb
    .byte %11111110 ; |XXXXXXX | $d9fc
    .byte %00000000 ; |        | $d9fd
    .byte %00000000 ; |        | $d9fe
    .byte %00000000 ; |        | $d9ff
    .byte %10011101 ; |X  XXX X| $da00
    .byte %00001001 ; |    X  X| $da01
    .byte %00001001 ; |    X  X| $da02
    .byte %00001001 ; |    X  X| $da03
    .byte %11011001 ; |XX XX  X| $da04
    .byte %00000001 ; |       X| $da05
    .byte %00001001 ; |    X  X| $da06
    .byte %00000001 ; |       X| $da07
    .byte %00000011 ; |      XX| $da08
    .byte %11001111 ; |XX  XXXX| $da09
    .byte %00101000 ; |  X X   | $da0a
    .byte %00101111 ; |  X XXXX| $da0b
    .byte %00101001 ; |  X X  X| $da0c
    .byte %11000111 ; |XX   XXX| $da0d
    .byte %00000000 ; |        | $da0e
    .byte %00000000 ; |        | $da0f
    .byte %00000000 ; |        | $da10
    .byte %00000000 ; |        | $da11
    .byte %00011100 ; |   XXX  | $da12
    .byte %00110110 ; |  XX XX | $da13
    .byte %01101011 ; | XX X XX| $da14
    .byte %01011101 ; | X XXX X| $da15
    .byte %01011101 ; | X XXX X| $da16
    .byte %01011101 ; | X XXX X| $da17
    .byte %01101011 ; | XX X XX| $da18
    .byte %00110110 ; |  XX XX | $da19
    .byte %00011100 ; |   XXX  | $da1a
    .byte %00111110 ; |  XXXXX | $da1b
    .byte %00100010 ; |  X   X | $da1c
    .byte %00110110 ; |  XX XX | $da1d
    .byte %00010100 ; |   X X  | $da1e
    .byte %00010100 ; |   X X  | $da1f
    .byte %00110100 ; |  XX X  | $da20
    .byte %00100100 ; |  X  X  | $da21
    .byte %00110100 ; |  XX X  | $da22
    .byte %00011100 ; |   XXX  | $da23
    .byte %01111111 ; | XXXXXXX| $da24
    .byte %01000001 ; | X     X| $da25
    .byte %01011111 ; | X XXXXX| $da26
    .byte %01011000 ; | X XX   | $da27
    .byte %00100110 ; |  X  XX | $da28
    .byte %01111011 ; | XXXX XX| $da29
    .byte %01011101 ; | X XXX X| $da2a
    .byte %01100011 ; | XX   XX| $da2b
    .byte %00111110 ; |  XXXXX | $da2c
    .byte %00111110 ; |  XXXXX | $da2d
    .byte %01100011 ; | XX   XX| $da2e
    .byte %01011101 ; | X XXX X| $da2f
    .byte %01111101 ; | XXXXX X| $da30
    .byte %00010011 ; |   X  XX| $da31
    .byte %01111101 ; | XXXXX X| $da32
    .byte %01011101 ; | X XXX X| $da33
    .byte %01100011 ; | XX   XX| $da34
    .byte %00111110 ; |  XXXXX | $da35
    .byte %00011111 ; |   XXXXX| $da36
    .byte %00010001 ; |   X   X| $da37
    .byte %01111011 ; | XXXX XX| $da38
    .byte %01000001 ; | X     X| $da39
    .byte %01011011 ; | X XX XX| $da3a
    .byte %01101010 ; | XX X X | $da3b
    .byte %00110010 ; |  XX  X | $da3c
    .byte %00011010 ; |   XX X | $da3d
    .byte %00001110 ; |    XXX | $da3e
    .byte %00111110 ; |  XXXXX | $da3f
    .byte %01100011 ; | XX   XX| $da40
    .byte %01011101 ; | X XXX X| $da41
    .byte %01111101 ; | XXXXX X| $da42
    .byte %01111101 ; | XXXXX X| $da43
    .byte %01000001 ; | X     X| $da44
    .byte %01011111 ; | X XXXXX| $da45
    .byte %01000001 ; | X     X| $da46
    .byte %01111111 ; | XXXXXXX| $da47
    .byte %00111110 ; |  XXXXX | $da48
    .byte %01100011 ; | XX   XX| $da49
    .byte %01011101 ; | X XXX X| $da4a
    .byte %01011101 ; | X XXX X| $da4b
    .byte %01000011 ; | X    XX| $da4c
    .byte %01011111 ; | X XXXXX| $da4d
    .byte %01011101 ; | X XXX X| $da4e
    .byte %01100011 ; | XX   XX| $da4f
    .byte %00111110 ; |  XXXXX | $da50
    .byte %01110000 ; | XXX    | $da51
    .byte %01011000 ; | X XX   | $da52
    .byte %01001100 ; | X  XX  | $da53
    .byte %01100110 ; | XX  XX | $da54
    .byte %00110011 ; |  XX  XX| $da55
    .byte %01111001 ; | XXXX  X| $da56
    .byte %01011101 ; | X XXX X| $da57
    .byte %01000001 ; | X     X| $da58
    .byte %01111111 ; | XXXXXXX| $da59
    .byte %00111110 ; |  XXXXX | $da5a
    .byte %01100011 ; | XX   XX| $da5b
    .byte %01011101 ; | X XXX X| $da5c
    .byte %01011101 ; | X XXX X| $da5d
    .byte %01100011 ; | XX   XX| $da5e
    .byte %01011101 ; | X XXX X| $da5f
    .byte %01011101 ; | X XXX X| $da60
    .byte %01100011 ; | XX   XX| $da61
    .byte %00111110 ; |  XXXXX | $da62
    .byte %00111110 ; |  XXXXX | $da63
    .byte %01100011 ; | XX   XX| $da64
    .byte %01011101 ; | X XXX X| $da65
    .byte %01111101 ; | XXXXX X| $da66
    .byte %01100001 ; | XX    X| $da67
    .byte %01011101 ; | X XXX X| $da68
    .byte %01011101 ; | X XXX X| $da69
    .byte %01100011 ; | XX   XX| $da6a
    .byte %00111110 ; |  XXXXX | $da6b
    .byte %00000000 ; |        | $da6c
    .byte %00000000 ; |        | $da6d
    .byte %00000000 ; |        | $da6e
    .byte %11111000 ; |XXXXX   | $da6f
    .byte %00001000 ; |    X   | $da70
    .byte %11111000 ; |XXXXX   | $da71
    .byte %00000000 ; |        | $da72
    .byte %00000000 ; |        | $da73
    .byte %00000000 ; |        | $da74
    .byte %00000000 ; |        | $da75
    .byte %00000000 ; |        | $da76
    .byte %00000000 ; |        | $da77
    .byte %00000000 ; |        | $da78
    .byte %00000000 ; |        | $da79
    .byte %00000000 ; |        | $da7a
    .byte %00011111 ; |   XXXXX| $da7b
    .byte %00010000 ; |   X    | $da7c
    .byte %00011111 ; |   XXXXX| $da7d
    .byte %00000000 ; |        | $da7e
    .byte %00000000 ; |        | $da7f
    .byte %00000000 ; |        | $da80
    .byte %11100000 ; |XXX     | $da81
    .byte %10110000 ; |X XX    | $da82
    .byte %11011000 ; |XX XX   | $da83
    .byte %11101100 ; |XXX XX  | $da84
    .byte %00000100 ; |     X  | $da85
    .byte %11101100 ; |XXX XX  | $da86
    .byte %11011000 ; |XX XX   | $da87
    .byte %10110000 ; |X XX    | $da88
    .byte %11100000 ; |XXX     | $da89
    .byte %00000111 ; |     XXX| $da8a
    .byte %00001101 ; |    XX X| $da8b
    .byte %00011011 ; |   XX XX| $da8c
    .byte %00110111 ; |  XX XXX| $da8d
    .byte %00100000 ; |  X     | $da8e
    .byte %00110111 ; |  XX XXX| $da8f
    .byte %00011011 ; |   XX XX| $da90
    .byte %00001101 ; |    XX X| $da91
    .byte %00000111 ; |     XXX| $da92
    .byte %00111000 ; |  XXX   | $da93
    .byte %00101110 ; |  X XXX | $da94
    .byte %00110011 ; |  XX  XX| $da95
    .byte %01011111 ; | X XXXXX| $da96
    .byte %01011111 ; | X XXXXX| $da97
    .byte %01011111 ; | X XXXXX| $da98
    .byte %01111111 ; | XXXXXXX| $da99
    .byte %00111110 ; |  XXXXX | $da9a
    .byte %00011100 ; |   XXX  | $da9b
    .byte %00110110 ; |  XX XX | $da9c
    .byte %01111111 ; | XXXXXXX| $da9d
    .byte %01110111 ; | XXX XXX| $da9e
    .byte %00110110 ; |  XX XX | $da9f
    .byte %00110110 ; |  XX XX | $daa0
    .byte %00010100 ; |   X X  | $daa1
    .byte %00010100 ; |   X X  | $daa2
    .byte %00001000 ; |    X   | $daa3
    .byte %00001000 ; |    X   | $daa4
    .byte %00010000 ; |   X    | $daa5
    .byte %00010000 ; |   X    | $daa6
    .byte %00111000 ; |  XXX   | $daa7
    .byte %00111000 ; |  XXX   | $daa8
    .byte %00111000 ; |  XXX   | $daa9
    .byte %00111000 ; |  XXX   | $daaa
    .byte %00000000 ; |        | $daab
    .byte %00010000 ; |   X    | $daac
    .byte %00000000 ; |        | $daad
    .byte %01000010 ; | X    X | $daae
    .byte %01000010 ; | X    X | $daaf
    .byte %11100111 ; |XXX  XXX| $dab0
    .byte %11100111 ; |XXX  XXX| $dab1
    .byte %11100111 ; |XXX  XXX| $dab2
    .byte %11100111 ; |XXX  XXX| $dab3
    .byte %00000000 ; |        | $dab4
    .byte %01000010 ; | X    X | $dab5
    .byte %00000000 ; |        | $dab6
    .byte %00000000 ; |        | $dab7
    .byte %10000000 ; |X       | $dab8
    .byte %10000010 ; |X     X | $dab9
    .byte %10000010 ; |X     X | $daba
    .byte %11110010 ; |XXXX  X | $dabb
    .byte %10001010 ; |X   X X | $dabc
    .byte %10001010 ; |X   X X | $dabd
    .byte %10001010 ; |X   X X | $dabe
    .byte %11110010 ; |XXXX  X | $dabf
    .byte %00000000 ; |        | $dac0
    .byte %00000011 ; |      XX| $dac1
    .byte %11101000 ; |XXX X   | $dac2
    .byte %10010001 ; |X  X   X| $dac3
    .byte %11110010 ; |XXXX  X | $dac4
    .byte %00010010 ; |   X  X | $dac5
    .byte %11100010 ; |XXX   X | $dac6
    .byte %00000000 ; |        | $dac7
    .byte %00000000 ; |        | $dac8
    .byte %00000000 ; |        | $dac9
    .byte %11000000 ; |XX      | $daca
    .byte %01011110 ; | X XXXX | $dacb
    .byte %11010000 ; |XX X    | $dacc
    .byte %01011110 ; | X XXXX | $dacd
    .byte %01010010 ; | X X  X | $dace
    .byte %01001110 ; | X  XXX | $dacf
    .byte %00000000 ; |        | $dad0
    .byte %00000000 ; |        | $dad1
    .byte %00000000 ; |        | $dad2
    .byte %00000000 ; |        | $dad3
    .byte %01000000 ; | X      | $dad4
    .byte %01000000 ; | X      | $dad5
    .byte %01000000 ; | X      | $dad6
    .byte %01000000 ; | X      | $dad7
    .byte %10110000 ; |X XX    | $dad8
    .byte %00000000 ; |        | $dad9
    .byte %00000000 ; |        | $dada
    .byte %11100011 ; |XXX   XX| $dadb
    .byte %01000001 ; | X     X| $dadc
    .byte %01000001 ; | X     X| $dadd
    .byte %01000001 ; | X     X| $dade
    .byte %01001001 ; | X  X  X| $dadf
    .byte %01011101 ; | X XXX X| $dae0
    .byte %01110111 ; | XXX XXX| $dae1
    .byte %01100011 ; | XX   XX| $dae2
    .byte %11000001 ; |XX     X| $dae3
    .byte %10111101 ; |X XXXX X| $dae4
    .byte %00100000 ; |  X     | $dae5
    .byte %00111100 ; |  XXXX  | $dae6
    .byte %00100100 ; |  X  X  | $dae7
    .byte %00011101 ; |   XXX X| $dae8
    .byte %00000000 ; |        | $dae9
    .byte %00000000 ; |        | $daea
    .byte %00000000 ; |        | $daeb
    .byte %10000000 ; |X       | $daec
    .byte %11011101 ; |XX XXX X| $daed
    .byte %10101001 ; |X X X  X| $daee
    .byte %10101001 ; |X X X  X| $daef
    .byte %11111001 ; |XXXXX  X| $daf0
    .byte %10101001 ; |X X X  X| $daf1
    .byte %00000001 ; |       X| $daf2
    .byte %00000001 ; |       X| $daf3
    .byte %00000001 ; |       X| $daf4
    .byte %00000011 ; |      XX| $daf5
    .byte %01110001 ; | XXX   X| $daf6
    .byte %00100001 ; |  X    X| $daf7
    .byte %00100000 ; |  X     | $daf8
    .byte %00100001 ; |  X    X| $daf9
    .byte %01011001 ; | X XX  X| $dafa
    .byte %00000001 ; |       X| $dafb
    .byte %00000001 ; |       X| $dafc
    .byte %00000001 ; |       X| $dafd
    .byte %00000001 ; |       X| $dafe
    .byte %00000000 ; $00 ; |        | $daff
    .byte %00000000 ; $00 ; |        | $db00
    .byte %00000000 ; $00 ; |        | $db01
    .byte %00000000 ; $00 ; |        | $db02
    .byte %00000000 ; $00 ; |        | $db03
    .byte %00000000 ; $00 ; |        | $db04
    .byte %00000000 ; $00 ; |        | $db05
    .byte %00010000 ; $10 ; |   X    | $db06
    .byte %10000000 ; $80 ; |X       | $db07
    .byte %00010000 ; $10 ; |   X    | $db08
    .byte %11000000 ; $c0 ; |XX      | $db09
    .byte %00010000 ; $10 ; |   X    | $db0a
    .byte %11100000 ; $e0 ; |XXX     | $db0b
    .byte %00111000 ; $38 ; |  XXX   | $db0c
    .byte %11110000 ; $f0 ; |XXXX    | $db0d
    .byte %11111110 ; $fe ; |XXXXXXX | $db0e
    .byte %01110000 ; $70 ; | XXX    | $db0f
    .byte %01111100 ; $7c ; | XXXXX  | $db10
    .byte %00010000 ; $10 ; |   X    | $db11
    .byte %11111110 ; $fe ; |XXXXXXX | $db12
    .byte %00000000 ; $00 ; |        | $db13
    .byte %00111100 ; $3c ; |  XXXX  | $db14
    .byte %00000000 ; $00 ; |        | $db15
    .byte %01111000 ; $78 ; | XXXX   | $db16
    .byte %00000000 ; $00 ; |        | $db17
    .byte %00111100 ; $3c ; |  XXXX  | $db18
    .byte %00000000 ; $00 ; |        | $db19
    .byte %01111000 ; $78 ; | XXXX   | $db1a
    .byte %00000000 ; $00 ; |        | $db1b
    .byte %00111000 ; $38 ; |  XXX   | $db1c
    .byte %00000000 ; $00 ; |        | $db1d
    .byte %00010000 ; $10 ; |   X    | $db1e
    .byte %00000000 ; $00 ; |        | $db1f
    .byte %00010000 ; $10 ; |   X    | $db20
    .byte %00000000 ; $00 ; |        | $db21
    .byte %00000000 ; $00 ; |        | $db22
    .byte %00000000 ; $00 ; |        | $db23
    .byte %00000000 ; $00 ; |        | $db24
    .byte %00000000 ; $00 ; |        | $db25
    .byte %00000000 ; $00 ; |        | $db26
    .byte %00000000 ; $00 ; |        | $db27
    .byte %00000000 ; $00 ; |        | $db28
    .byte %00000000 ; $00 ; |        | $db29
    .byte %00000000 ; $00 ; |        | $db2a
    .byte %11000000 ; $c0 ; |XX      | $db2b
    .byte %00000000 ; $00 ; |        | $db2c
    .byte %11100000 ; $e0 ; |XXX     | $db2d
    .byte %00000000 ; $00 ; |        | $db2e
    .byte %11111000 ; $f8 ; |XXXXX   | $db2f
    .byte %00000000 ; $00 ; |        | $db30
    .byte %01111100 ; $7c ; | XXXXX  | $db31
    .byte %00000000 ; $00 ; |        | $db32
    .byte %00111110 ; $3e ; |  XXXXX | $db33
    .byte %00000000 ; $00 ; |        | $db34
    .byte %00001111 ; $0f ; |    XXXX| $db35
    .byte %00000000 ; $00 ; |        | $db36
    .byte %00000111 ; $07 ; |     XXX| $db37
    .byte %00000000 ; $00 ; |        | $db38
    .byte %00000011 ; $03 ; |      XX| $db39
    .byte %00000000 ; $00 ; |        | $db3a
    .byte %00000001 ; $01 ; |       X| $db3b
    .byte %00000000 ; $00 ; |        | $db3c
    .byte %00000000 ; $00 ; |        | $db3d
    .byte %00000000 ; $00 ; |        | $db3e
    .byte %00000000 ; $00 ; |        | $db3f
    .byte %00000000 ; $00 ; |        | $db40
    .byte %00000000 ; $00 ; |        | $db41
    .byte %00000000 ; $00 ; |        | $db42
    .byte %00000000 ; $00 ; |        | $db43
    .byte %00000000 ; $00 ; |        | $db44
    .byte %00000000 ; $00 ; |        | $db45
    .byte %00000000 ; $00 ; |        | $db46
    .byte %00000000 ; $00 ; |        | $db47
    .byte %11111000 ; $f8 ; |XXXXX   | $db48
    .byte %00000000 ; $00 ; |        | $db49
    .byte %10000000 ; $80 ; |X       | $db4a
    .byte %00000000 ; $00 ; |        | $db4b
    .byte %00000000 ; $00 ; |        | $db4c
    .byte %00000000 ; $00 ; |        | $db4d
    .byte %11111100 ; $fc ; |XXXXXX  | $db4e
    .byte %10000000 ; $80 ; |X       | $db4f
    .byte %11111110 ; $fe ; |XXXXXXX | $db50
    .byte %11000000 ; $c0 ; |XX      | $db51
    .byte %10001111 ; $8f ; |X   XXXX| $db52
    .byte %11100000 ; $e0 ; |XXX     | $db53
    .byte %11000111 ; $c7 ; |XX   XXX| $db54
    .byte %11111000 ; $f8 ; |XXXXX   | $db55
    .byte %11110011 ; $f3 ; |XXXX  XX| $db56
    .byte %00111111 ; $3f ; |  XXXXXX| $db57
    .byte %11111011 ; $fb ; |XXXXX XX| $db58
    .byte %00001111 ; $0f ; |    XXXX| $db59
    .byte %10011001 ; $99 ; |X  XX  X| $db5a
    .byte %00000011 ; $03 ; |      XX| $db5b
    .byte %00111001 ; $39 ; |  XXX  X| $db5c
    .byte %00000001 ; $01 ; |       X| $db5d
    .byte %00111001 ; $39 ; |  XXX  X| $db5e
    .byte %00000000 ; $00 ; |        | $db5f
    .byte %11111001 ; $f9 ; |XXXXX  X| $db60
    .byte %00000000 ; $00 ; |        | $db61
    .byte %11100011 ; $e3 ; |XXX   XX| $db62
    .byte %00000000 ; $00 ; |        | $db63
    .byte %11000111 ; $c7 ; |XX   XXX| $db64
    .byte %00000000 ; $00 ; |        | $db65
    .byte %00000000 ; $00 ; |        | $db66
    .byte %00000000 ; $00 ; |        | $db67
    .byte %00000000 ; $00 ; |        | $db68
    .byte %11110011 ; $f3 ; |XXXX  XX| $db69
    .byte %11111111 ; $ff ; |XXXXXXXX| $db6a
    .byte %11111011 ; $fb ; |XXXXX XX| $db6b
    .byte %11111111 ; $ff ; |XXXXXXXX| $db6c
    .byte %00111011 ; $3b ; |  XXX XX| $db6d
    .byte %11111111 ; $ff ; |XXXXXXXX| $db6e
    .byte %00011011 ; $1b ; |   XX XX| $db6f
    .byte %01110001 ; $71 ; | XXX   X| $db70
    .byte %10011011 ; $9b ; |X  XX XX| $db71
    .byte %01111100 ; $7c ; | XXXXX  | $db72
    .byte %10010011 ; $93 ; |X  X  XX| $db73
    .byte %01111111 ; $7f ; | XXXXXXX| $db74
    .byte %10110110 ; $b6 ; |X XX XX | $db75
    .byte %00111111 ; $3f ; |  XXXXXX| $db76
    .byte %11100110 ; $e6 ; |XXX  XX | $db77
    .byte %00111000 ; $38 ; |  XXX   | $db78
    .byte %11001110 ; $ce ; |XX  XXX | $db79
    .byte %00011111 ; $1f ; |   XXXXX| $db7a
    .byte %10001100 ; $8c ; |X   XX  | $db7b
    .byte %00011111 ; $1f ; |   XXXXX| $db7c
    .byte %11111000 ; $f8 ; |XXXXX   | $db7d
    .byte %00001100 ; $0c ; |    XX  | $db7e
    .byte %01110000 ; $70 ; | XXX    | $db7f
    .byte %00001111 ; $0f ; |    XXXX| $db80
    .byte %00000000 ; $00 ; |        | $db81
    .byte %00000111 ; $07 ; |     XXX| $db82
    .byte %11111100 ; $fc ; |XXXXXX  | $db83
    .byte %00000111 ; $07 ; |     XXX| $db84
    .byte %11111111 ; $ff ; |XXXXXXXX| $db85
    .byte %00000111 ; $07 ; |     XXX| $db86
    .byte %00000000 ; $00 ; |        | $db87
    .byte %00000000 ; $00 ; |        | $db88
    .byte %00000000 ; $00 ; |        | $db89
    .byte %00000000 ; $00 ; |        | $db8a
    .byte %11111111 ; $ff ; |XXXXXXXX| $db8b
    .byte %11110000 ; $f0 ; |XXXX    | $db8c
    .byte %00001111 ; $0f ; |    XXXX| $db8d
    .byte %11110000 ; $f0 ; |XXXX    | $db8e
    .byte %00001111 ; $0f ; |    XXXX| $db8f
    .byte %11110000 ; $f0 ; |XXXX    | $db90
    .byte %00011111 ; $1f ; |   XXXXX| $db91
    .byte %11110000 ; $f0 ; |XXXX    | $db92
    .byte %00011000 ; $18 ; |   XX   | $db93
    .byte %11110000 ; $f0 ; |XXXX    | $db94
    .byte %00011111 ; $1f ; |   XXXXX| $db95
    .byte %11100000 ; $e0 ; |XXX     | $db96
    .byte %00111111 ; $3f ; |  XXXXXX| $db97
    .byte %11010000 ; $d0 ; |XX X    | $db98
    .byte %00111110 ; $3e ; |  XXXXX | $db99
    .byte %10110000 ; $b0 ; |X XX    | $db9a
    .byte %00110000 ; $30 ; |  XX    | $db9b
    .byte %10010000 ; $90 ; |X  X    | $db9c
    .byte %00111111 ; $3f ; |  XXXXXX| $db9d
    .byte %10010000 ; $90 ; |X  X    | $db9e
    .byte %11111000 ; $f8 ; |XXXXX   | $db9f
    .byte %10000000 ; $80 ; |X       | $dba0
    .byte %11100011 ; $e3 ; |XXX   XX| $dba1
    .byte %00000000 ; $00 ; |        | $dba2
    .byte %11111111 ; $ff ; |XXXXXXXX| $dba3
    .byte %00000000 ; $00 ; |        | $dba4
    .byte %11111111 ; $ff ; |XXXXXXXX| $dba5
    .byte %00000000 ; $00 ; |        | $dba6
    .byte %11111111 ; $ff ; |XXXXXXXX| $dba7
    .byte %00000000 ; $00 ; |        | $dba8
    .byte %00000000 ; $00 ; |        | $dba9
    .byte %00000000 ; $00 ; |        | $dbaa
    .byte %00000000 ; $00 ; |        | $dbab
    .byte %00000000 ; $00 ; |        | $dbac
    .byte %11111011 ; $fb ; |XXXXX XX| $dbad
    .byte %11011111 ; $df ; |XX XXXXX| $dbae
    .byte %11111101 ; $fd ; |XXXXXX X| $dbaf
    .byte %10111111 ; $bf ; |X XXXXXX| $dbb0
    .byte %11111111 ; $ff ; |XXXXXXXX| $dbb1
    .byte %01111111 ; $7f ; | XXXXXXX| $dbb2
    .byte %11111110 ; $fe ; |XXXXXXX | $dbb3
    .byte %01111110 ; $7e ; | XXXXXX | $dbb4
    .byte %11111111 ; $ff ; |XXXXXXXX| $dbb5
    .byte %11111110 ; $fe ; |XXXXXXX | $dbb6
    .byte %11111111 ; $ff ; |XXXXXXXX| $dbb7
    .byte %11111100 ; $fc ; |XXXXXX  | $dbb8
    .byte %11111110 ; $fe ; |XXXXXXX | $dbb9
    .byte %11111101 ; $fd ; |XXXXXX X| $dbba
    .byte %11111110 ; $fe ; |XXXXXXX | $dbbb
    .byte %11111011 ; $fb ; |XXXXX XX| $dbbc
    .byte %11111101 ; $fd ; |XXXXXX X| $dbbd
    .byte %11111011 ; $fb ; |XXXXX XX| $dbbe
    .byte %11111011 ; $fb ; |XXXXX XX| $dbbf
    .byte %11110001 ; $f1 ; |XXXX   X| $dbc0
    .byte %11110111 ; $f7 ; |XXXX XXX| $dbc1
    .byte %11110001 ; $f1 ; |XXXX   X| $dbc2
    .byte %11110011 ; $f3 ; |XXXX  XX| $dbc3
    .byte %11110000 ; $f0 ; |XXXX    | $dbc4
    .byte %11110001 ; $f1 ; |XXXX   X| $dbc5
    .byte %01100000 ; $60 ; | XX     | $dbc6
    .byte %11000000 ; $c0 ; |XX      | $dbc7
    .byte %01100000 ; $60 ; | XX     | $dbc8
    .byte %00000000 ; $00 ; |        | $dbc9
    .byte %00100000 ; $20 ; |  X     | $dbca
    .byte %00000000 ; $00 ; |        | $dbcb
    .byte %00000000 ; $00 ; |        | $dbcc
    .byte %00000000 ; $00 ; |        | $dbcd
    .byte %00000000 ; $00 ; |        | $dbce
    .byte %11111100 ; $fc ; |XXXXXX  | $dbcf
    .byte %00000000 ; $00 ; |        | $dbd0
    .byte %11111100 ; $fc ; |XXXXXX  | $dbd1
    .byte %00000000 ; $00 ; |        | $dbd2
    .byte %01000100 ; $44 ; | X   X  | $dbd3
    .byte %00000000 ; $00 ; |        | $dbd4
    .byte %01000000 ; $40 ; | X      | $dbd5
    .byte %00010000 ; $10 ; |   X    | $dbd6
    .byte %01000100 ; $44 ; | X   X  | $dbd7
    .byte %00111000 ; $38 ; |  XXX   | $dbd8
    .byte %01001110 ; $4e ; | X  XXX | $dbd9
    .byte %01101100 ; $6c ; | XX XX  | $dbda
    .byte %01011011 ; $5b ; | X XX XX| $dbdb
    .byte %01011100 ; $5c ; | X XXX  | $dbdc
    .byte %01010001 ; $51 ; | X X   X| $dbdd
    .byte %01111100 ; $7c ; | XXXXX  | $dbde
    .byte %01010001 ; $51 ; | X X   X| $dbdf
    .byte %01111000 ; $78 ; | XXXX   | $dbe0
    .byte %01010011 ; $53 ; | X X  XX| $dbe1
    .byte %00111000 ; $38 ; |  XXX   | $dbe2
    .byte %01010000 ; $50 ; | X X    | $dbe3
    .byte %00011000 ; $18 ; |   XX   | $dbe4
    .byte %01011011 ; $5b ; | X XX XX| $dbe5
    .byte %00010000 ; $10 ; |   X    | $dbe6
    .byte %01001110 ; $4e ; | X  XXX | $dbe7
    .byte %00000000 ; $00 ; |        | $dbe8
    .byte %11100100 ; $e4 ; |XXX  X  | $dbe9
    .byte %00000000 ; $00 ; |        | $dbea
    .byte %00000000 ; $00 ; |        | $dbeb
    .byte %00000000 ; $00 ; |        | $dbec
    .byte %00000000 ; $00 ; |        | $dbed
    .byte %00000000 ; $00 ; |        | $dbee
    .byte %00000000 ; $00 ; |        | $dbef
    .byte %00000000 ; $00 ; |        | $dbf0
    .byte %00000000 ; $00 ; |        | $dbf1
    .byte %00000000 ; $00 ; |        | $dbf2
    .byte %00000000 ; $00 ; |        | $dbf3
    .byte %00000000 ; $00 ; |        | $dbf4
    .byte %00000000 ; $00 ; |        | $dbf5
    .byte %00000000 ; $00 ; |        | $dbf6
    .byte %00000000 ; $00 ; |        | $dbf7
    .byte %00000000 ; $00 ; |        | $dbf8
    .byte %00000000 ; $00 ; |        | $dbf9
    .byte %00000000 ; $00 ; |        | $dbfa
    .byte %00000000 ; $00 ; |        | $dbfb
    .byte %00000000 ; $00 ; |        | $dbfc
    .byte %00000000 ; $00 ; |        | $dbfd
    .byte %00000000 ; $00 ; |        | $dbfe
    .byte %00000000 ; $00 ; |        | $dbff


; sliece #3 ($b000..$b3ff)
    ldx    #$01             ; 2
Ldc02:
    ldy    $cc,x            ; 4
    beq    Ldc6f            ; 2³
    lda    $d0,x            ; 4
    and    #$1f             ; 2
    sta    $f0              ; 3
    lda    $d0,x            ; 4
    sec                     ; 2
    sbc    #$20             ; 2
    and    #$e0             ; 2
    sta    $f1              ; 3
    bne    Ldc5f            ; 2³
    lda    $ff77,y          ; 4
    and    #$e0             ; 2
    sta    $f1              ; 3
    lda    $b086,y          ; 4
    and    #$0f             ; 2
    sta    $f3              ; 3
    lda    $b086,y          ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    clc                     ; 2
    adc    $ce,x            ; 4
    and    #$0f             ; 2
    cmp    $f3              ; 3
    beq    Ldc67            ; 2³
    sta    $f2              ; 3
    lda    $ce,x            ; 4
    and    #$f0             ; 2
    ora    $f2              ; 3
    sta    $ce,x            ; 4
    lda    $b09d,y          ; 4
    and    #$1f             ; 2
    sta    $f3              ; 3
    lda    $b09d,y          ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    cmp    #$04             ; 2
    bcc    Ldc54            ; 2³
    ora    #$f8             ; 2
Ldc54:
    clc                     ; 2
    adc    $f0              ; 3
    and    #$1f             ; 2
    cmp    $f3              ; 3
    beq    Ldc67            ; 2³
    sta    $f0              ; 3
Ldc5f:
    lda    $f0              ; 3
    ora    $f1              ; 3
    sta    $d0,x            ; 4
    bne    Ldc6f            ; 2³
Ldc67:
    lda    #$00             ; 2
    sta    $cc,x            ; 4
    sta    $ce,x            ; 4
    sta    $d0,x            ; 4
Ldc6f:
    dex                     ; 2
    bpl    Ldc02            ; 2³
    ldx    #$01             ; 2
Ldc74:
    lda    $ce,x            ; 4
    sta    AUDV0,x          ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    sta    AUDC0,x          ; 4
    lda    $d0,x            ; 4
    sta    AUDF0,x          ; 4
    dex                     ; 2
    bpl    Ldc74            ; 2³
    rts                     ; 6

    .byte %00000000 ; $00 ; |        | $dc86
    .byte %11110000 ; $f0 ; |XXXX    | $dc87
    .byte %11110000 ; $f0 ; |XXXX    | $dc88
    .byte %11110000 ; $f0 ; |XXXX    | $dc89
    .byte %00011111 ; $1f ; |   XXXXX| $dc8a
    .byte %11110010 ; $f2 ; |XXXX  X | $dc8b
    .byte %11110100 ; $f4 ; |XXXX X  | $dc8c
    .byte %11110000 ; $f0 ; |XXXX    | $dc8d
    .byte %11110000 ; $f0 ; |XXXX    | $dc8e
    .byte %11110000 ; $f0 ; |XXXX    | $dc8f
    .byte %11110000 ; $f0 ; |XXXX    | $dc90
    .byte %11110010 ; $f2 ; |XXXX  X | $dc91
    .byte %11100000 ; $e0 ; |XXX     | $dc92
    .byte %11110111 ; $f7 ; |XXXX XXX| $dc93
    .byte %11110000 ; $f0 ; |XXXX    | $dc94
    .byte %00111111 ; $3f ; |  XXXXXX| $dc95
    .byte %00101111 ; $2f ; |  X XXXX| $dc96
    .byte %00011111 ; $1f ; |   XXXXX| $dc97
    .byte %11111000 ; $f8 ; |XXXXX   | $dc98
    .byte %11110100 ; $f4 ; |XXXX X  | $dc99
    .byte %11110000 ; $f0 ; |XXXX    | $dc9a
    .byte %00011111 ; $1f ; |   XXXXX| $dc9b
    .byte %11110000 ; $f0 ; |XXXX    | $dc9c
    .byte %00000000 ; $00 ; |        | $dc9d
    .byte %00111000 ; $38 ; |  XXX   | $dc9e
    .byte %00101010 ; $2a ; |  X X X | $dc9f
    .byte %00111000 ; $38 ; |  XXX   | $dca0
    .byte %00111111 ; $3f ; |  XXXXXX| $dca1
    .byte %11100000 ; $e0 ; |XXX     | $dca2
    .byte %00101011 ; $2b ; |  X X XX| $dca3
    .byte %00111111 ; $3f ; |  XXXXXX| $dca4
    .byte %00111111 ; $3f ; |  XXXXXX| $dca5
    .byte %00000000 ; $00 ; |        | $dca6
    .byte %00111111 ; $3f ; |  XXXXXX| $dca7
    .byte %00101000 ; $28 ; |  X X   | $dca8
    .byte %00100101 ; $25 ; |  X  X X| $dca9
    .byte %00111011 ; $3b ; |  XXX XX| $dcaa
    .byte %00111111 ; $3f ; |  XXXXXX| $dcab
    .byte %00111111 ; $3f ; |  XXXXXX| $dcac
    .byte %11100000 ; $e0 ; |XXX     | $dcad
    .byte %00000000 ; $00 ; |        | $dcae
    .byte %11010000 ; $d0 ; |XX X    | $dcaf
    .byte %00111111 ; $3f ; |  XXXXXX| $dcb0
    .byte %00111100 ; $3c ; |  XXXX  | $dcb1
    .byte %00111111 ; $3f ; |  XXXXXX| $dcb2
    .byte %11100000 ; $e0 ; |XXX     | $dcb3

Lb0b4:
    bit    $ac
    bpl    Lb0ba
    bvc    Lb0bd
Lb0ba:
    jmp    Lf422
Lb0bd:
    ldx    player           ; 3
    lda    diffLst,x        ; 4
    and    #$03             ; 2
    sec                     ; 2
    adc    $91              ; 3
    sta    $91              ; 3
    bpl    Ldcf4            ; 2³
    lda    #$00             ; 2
    sta    $91              ; 3
    dec    $92              ; 5
    dec    $92              ; 5
    bpl    Ldcf4            ; 2³
    lda    $93              ; 3
    beq    Ldcf1            ; 2³
    lda    diffLst,x        ; 4
    cmp    #$02             ; 2
    bcc    Ldce4            ; 2³
    lda    $be,x            ; 4
    and    #$01             ; 2
    beq    Ldcf1            ; 2³
Ldce4:
    lda    #$02             ; 2
    sta    $92              ; 3
    lda    $8b              ; 3
    clc                     ; 2
    adc    #$02             ; 2
    sta    $8a              ; 3
    bne    Ldcf4            ; 2³
Ldcf1:
    jsr    Lf680            ; 6
Ldcf4:
    lda    $b7              ; 3
    cmp    #$01             ; 2
    bne    Ldd29            ; 2³+1
    lda    $a9              ; 3
    cmp    #$20             ; 2
    bne    Ldd29            ; 2³+1
    ldx    player           ; 3
    lda    diffLst,x        ; 4
    cmp    #$05             ; 2
    bne    Ldd29            ; 2³
    lda    #$08             ; 2
    sta    $ac              ; 3
    lda    #$00             ; 2
    sta    $d7              ; 3
    sta    $d9              ; 3
    sta    $8e              ; 3
    sta    $8b              ; 3
    sta    $9a              ; 3
    sta    $db              ; 3
    lda    #$50             ; 2
    sta    $8d              ; 3
    lda    #$01             ; 2
    sta    $8c              ; 3
    lda    #$93             ; 2
    sta    $b7              ; 3
    jsr    $f7ed            ; 6
Ldd29:
    lda    $b7              ; 3
    bit    $d9              ; 3
    bpl    Ldd39            ; 2³
    cmp    #$8c             ; 2
    bcc    Ldd46            ; 2³
    cmp    #$8a             ; 2
    bcc    Ldd46            ; 2³
    bcs    Ldd41            ; 2³
Ldd39:
    cmp    #$08             ; 2
    bcs    Ldd46            ; 2³
    cmp    #$05             ; 2
    bcc    Ldd46            ; 2³
Ldd41:
    ldy    #$10             ; 2
    jsr    $ff43            ; 6
Ldd46:
    ldy    $b7              ; 3
    lda    $8b              ; 3
    sbc    #$16             ; 2
    sta    $f0              ; 3
    lda    $b8              ; 3
    beq    Ldd59            ; 2³
    lda    #$be             ; 2
    sec                     ; 2
    sbc    $b8              ; 3
    adc    #$08             ; 2
Ldd59:
    cmp    $8b              ; 3
    bcc    Ldd63            ; 2³
    sec                     ; 2
    sbc    #$28             ; 2
    iny                     ; 2
    bne    Ldd59            ; 2³
Ldd63:
    cmp    $f0              ; 3
    bcc    Ldddd            ; 2³
    lda    ($e0),y          ; 5
    cmp    #$08             ; 2
    beq    Lddbf            ; 2³
    cmp    #$0b             ; 2
    bne    Ldddd            ; 2³
    lda    $92              ; 3
    cmp    #$11             ; 2
    bcs    Ldddd            ; 2³
    lda    $8d              ; 3
    cmp    #$0a             ; 2
    bcc    Ldddd            ; 2³
    cmp    #$80             ; 2
    bcs    Ldddd            ; 2³
    cmp    #$30             ; 2
    bcc    Ldd89            ; 2³
    cmp    #$50             ; 2
    bcc    Ldddd            ; 2³
Ldd89:
    ldx    player           ; 3
    lda    playerLst,x      ; 4
    and    #$0f             ; 2
    cmp    #$09             ; 2
    bcs    Ldddd            ; 2³
    cmp    #$06             ; 2
    bcc    Ldda2            ; 2³
    adc    #$f6             ; 2
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
    sta    $c0              ; 3
    bne    Ldda6            ; 2³
Ldda2:
    lda    #$03             ; 2
    sta    $c0              ; 3
Ldda6:
    lda    playerLst,x      ; 4
    clc                     ; 2
    adc    $c0              ; 3
    sta    playerLst,x      ; 4
    lda    $c0              ; 3
    beq    Lddb6            ; 2³
    ldy    #$0f             ; 2
    jsr    $ff43            ; 6
Lddb6:
    lda    #$00             ; 2
    sta    $c2              ; 3
    jsr    $ff13            ; 6
    beq    Ldddd            ; 2³
Lddbf:
    lda    $92              ; 3
    cmp    #$2d             ; 2
    bcs    Ldddd            ; 2³
    lda    $8d              ; 3
    cmp    #$30             ; 2
    bcc    Lddcf            ; 2³
    cmp    #$64             ; 2
    bcc    Ldddd            ; 2³
Lddcf:
    lda    $92              ; 3
    clc                     ; 2
    adc    #$04             ; 2
    sta    $92              ; 3
    lda    $8a              ; 3
    clc                     ; 2
    adc    #$04             ; 2
    sta    $8a              ; 3
Ldddd:
    jmp    $f422            ; 3

    bit    $ac              ; 3
    bmi    Ldde7            ; 2³
    jmp    Lf417            ; 3

Ldde7:
    bvs    Lde65            ; 2³+1
    lda    $80              ; 3
    cmp    #$07             ; 2
    bne    Lddf5            ; 2³
    lda    $88              ; 3
    beq    Lddf5            ; 2³
    bne    Lddff            ; 2³
Lddf5:
    lda    $81              ; 3
    cmp    #$07             ; 2
    bne    Lde0a            ; 2³+1
    lda    $89              ; 3
    beq    Lde0a            ; 2³+1
Lddff:
    ldy    #$04             ; 2
    bit    frameCnt         ; 3
    bvc    Lde07            ; 2³
    ldy    #$05             ; 2
Lde07:
    jsr    $ff43            ; 6
Lde0a:
    bit    CXPPMM           ; 3
    bpl    Lde3e            ; 2³
    lda    $8a              ; 3
    sec                     ; 2
    sbc    #$10             ; 2
    sta    $f4              ; 3
    lda    $88              ; 3
    cmp    $8a              ; 3
    beq    Lde1d            ; 2³
    bcs    Lde2b            ; 2³
Lde1d:
    cmp    $f4              ; 3
    bcc    Lde2b            ; 2³
    ldx    $80              ; 3
    ldy    #$00             ; 2
    jsr    $b2d7            ; 6
    jmp    $b23e            ; 3

Lde2b:
    lda    $89              ; 3
    cmp    $8a              ; 3
    beq    Lde33            ; 2³
    bcs    Lde3e            ; 2³
Lde33:
    cmp    $f4              ; 3
    bcc    Lde3e            ; 2³
    ldx    $81              ; 3
    ldy    #$01             ; 2
    jsr    $b2d7            ; 6
Lde3e:
    lda    $ac              ; 3
    cmp    #$c0             ; 2
    beq    Lde65            ; 2³
    bit    CXM1P            ; 3
    bpl    Lde65            ; 2³
    lda    $8a              ; 3
    cmp    $9a              ; 3
    bcc    Lde65            ; 2³
    sec                     ; 2
    sbc    #$10             ; 2
    cmp    $9a              ; 3
    bcs    Lde65            ; 2³
    lda    $8d              ; 3
    cmp    $94              ; 3
    bcs    Lde65            ; 2³
    clc                     ; 2
    adc    #$10             ; 2
    cmp    $94              ; 3
    bcc    Lde65            ; 2³
    jsr    Lf680            ; 6
Lde65:
    bit    CXM1P            ; 3
    bvc    Ldea6            ; 2³
    ldx    $80              ; 3
    lda    $fe93,x          ; 4
    sta    $f4              ; 3
    lda    $88              ; 3
    sec                     ; 2
    sbc    $f4              ; 3
    sta    $f4              ; 3
    lda    $9b              ; 3
    cmp    $88              ; 3
    bcs    Lde89            ; 2³
    cmp    $f4              ; 3
    bcc    Lde89            ; 2³
    ldx    #$00             ; 2
    jsr    $b39a            ; 6
    jmp    $b2a6            ; 3

Lde89:
    ldx    $81              ; 3
    lda    $fe93,x          ; 4
    sta    $f4              ; 3
    lda    $89              ; 3
    sec                     ; 2
Lde93:
    sbc    $f4              ; 3
    sta    $f4              ; 3
    lda    $9b              ; 3
    cmp    $89              ; 3
    bcs    Ldea6            ; 2³
    cmp    $f4              ; 3
    bcc    Ldea6            ; 2³
    ldx    #$01             ; 2
    jsr    $b39a            ; 6
Ldea6:
    sta    CXCLR            ; 3
    lda    $ac              ; 3
    cmp    #$c0             ; 2
    bne    Lded4            ; 2³
    lda    $8c              ; 3
    cmp    #$09             ; 2
    bne    Lded4            ; 2³
    lda    SWCHA            ; 4
    ldx    player           ; 3
    beq    Ldebf            ; 2³
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
Ldebf:
    asl                     ; 2
    bcc    .right           ; 2³
    asl                     ; 2
    bcc    .left            ; 2³
    bcs    Ldecf            ; 3

.left:
    lda    #$c8             ; 2
    bne    Ldecd            ; 3

.right:
    lda    #$38             ; 2
Ldecd:
    sta    $d7              ; 3
Ldecf:
    ldy    #$08             ; 2
    jsr    $ff43            ; 6
Lded4:
    jmp    Lf417            ; 3

    cpx    #$05             ; 2
    beq    Ldf43            ; 2³+1
    cpx    #$04             ; 2
    beq    Ldefb            ; 2³
    cpx    #$07             ; 2
    beq    Ldf21            ; 2³+1
    cpx    #$06             ; 2
    bne    Ldeea            ; 2³
    jmp    $b390            ; 3

Ldeea:
    lda    $92              ; 3         explosions give you a real rise
    cmp    #$2d             ; 2
    bcs    Ldef8            ; 2³
    inc    $92              ; 5         GHGT
    inc    $92              ; 5
    inc    $8a              ; 5
    inc    $8a              ; 5
Ldef8:
    jmp    $b399            ; 3

Ldefb:
    lda    $92              ; 3
    cmp    #$0f             ; 2
    bcs    Ldef8            ; 2³+1
    ldx    player           ; 3
    lda    $be,x            ; 4         FLAGS
    and    #$40             ; 2
    bne    Ldef8            ; 2³+1
    lda    $be,x            ; 4
    ora    #$40             ; 2
    sta    $be,x            ; 4
    ldy    #$0f             ; 2
    jsr    $ff43            ; 6
    lda    #$50             ; 2
    sta    $c0              ; 3
    lda    #$00             ; 2
    sta    $c2              ; 3
    jsr    $ff13            ; 6
    beq    Ldf99            ; 2³
Ldf21:
    lda    $ec              ; 3
    cmp    #$1e             ; 2
    bcs    Ldf90            ; 2³
    ldx    player           ; 3
    lda    diffLst,x        ; 4
    tax                     ; 2
    lda    $92              ; 3
    cmp    #$09             ; 2
    bcc    Ldf90            ; 2³
    cmp    $b3e8,x          ; 4
    bcs    Ldf90            ; 2³
    lda    #$d7             ; 2
    sta    $e8              ; 3
    lda    #$20             ; 2
    sta    $d9              ; 3
    lda    #$09             ; 2
    bne    Ldf59            ; 2³
Ldf43:
    lda    $ec              ; 3
    cmp    #$1e             ; 2
    bcs    Ldf90            ; 2³
    lda    $92              ; 3
    cmp    #$25             ; 2
    bcc    Ldf90            ; 2³
    cmp    #$35             ; 2
    bcs    Ldf90            ; 2³
    lda    #$d6             ; 2
    sta    $e8              ; 3
    lda    #$03             ; 2
Ldf59:
    sta    $8c              ; 3
    lda    #$c0             ; 2
    sta    $ac              ; 3
    lda    #$00             ; 2
    sta    $92              ; 3
    sta    $8b              ; 3
    sta    $8e              ; 3
    sta    $c0              ; 3
    sta    $90              ; 3
    sta    $0088,y          ; 5
    lda    #$50             ; 2
    sta    $8a              ; 3
    lda    $8c              ; 3
    cmp    #$03             ; 2
    beq    Ldf7c            ; 2³
    ldy    #$08             ; 2
    bne    Ldf7e            ; 2³
Ldf7c:
    ldy    #$09             ; 2
Ldf7e:
    jsr    $ff43            ; 6
    inc    $ec              ; 5
    inc    $ec              ; 5
    lda    #$10             ; 2
    sta    $db              ; 3
    sta    $c2              ; 3
    jsr    $ff13            ; 6
    beq    Ldf99            ; 2³
Ldf90:
    lda    $92              ; 3
    cmp    #$0a             ; 2
    bcs    Ldf99            ; 2³
    jsr    Lf680            ; 6
Ldf99:
    rts                     ; 6
;B390 A5 92 MAYBE:   LDA GHGT    WE MIGHT DIE HERE
;B392 C9 DA          CMP 10      ARE WE FLYING LESS THAN 21
;B394 B0 03          BCS CADONE
;B396 20 82 F6       JSR CRASH   NOPE - DIE RODENT

;; BLOW UP A B-SPRITE
;; X = 0 FOR B1, 1 FOR B2
;BLOWUP: LDY      B1ID,X
;        CPY      #EWKBID
;        BEQ      BULEEV
;        CPY      #EXPLID
;        BNE      BUSCOR
;
;BULEEV: LDA      #00
;        BEQ      BUDONE
;
;BUSCOR: LDA      GLDMIY
;        CMP      #04
;        BCC      BULEEV
;        LDA      B1VP,X
;        CMP      #30
;        BCC      BULEEV

    ldy    $80,x            ; 4
    cpy    #$04             ; 2
    beq    Ldfa4            ; 2³
    cpy    #$08             ; 2
    bne    Ldfa8            ; 2³
Ldfa4:
    lda    #$00             ; 2
    beq    Ldfdc            ; 2³
Ldfa8:
    lda    $9b              ; 3
    cmp    #$04             ; 2
    bcc    Ldfa4            ; 2³
    lda    $88,x            ; 4
    cmp    #$1e             ; 2
    bcc    Ldfa4            ; 2³
    cmp    #$be             ; 2
    bcc    Ldfbc            ; 2³
    lda    #$be             ; 2
    sta    $88,x            ; 4
Ldfbc:
    lda    $b3dd,y          ; 4
    sta    $c0              ; 3
    lda    $b3e0,y          ; 4
    sta    $c2              ; 3
    lda    #$08             ; 2
    sta    $80,x            ; 4
    inc    $ec              ; 5
    lda    #$00             ; 2
    sta    $9a              ; 3
    sta    $9b              ; 3
    sta    $84,x            ; 4
    jsr    $ff13            ; 6
    ldy    #$0e             ; 2
    jsr    $ff43            ; 6
Ldfdc:
    rts                     ; 6

    .byte %00000000 ; $00 ; |        | $dfdd
    .byte %00000000 ; $00 ; |        | $dfde
    .byte %00000000 ; $00 ; |        | $dfdf
    .byte %00000000 ; $00 ; |        | $dfe0
    .byte %00000000 ; $00 ; |        | $dfe1
    .byte %01010000 ; $50 ; | X X    | $dfe2
    .byte %00000000 ; $00 ; |        | $dfe3
    .byte %00000000 ; $00 ; |        | $dfe4
    .byte %00000010 ; $02 ; |      X | $dfe5
    .byte %00000001 ; $01 ; |       X| $dfe6
    .byte %00000100 ; $04 ; |     X  | $dfe7
    .byte %00011000 ; $18 ; |   XX   | $dfe8
    .byte %00010111 ; $17 ; |   X XXX| $dfe9
    .byte %00010110 ; $16 ; |   X XX | $dfea
    .byte %00010101 ; $15 ; |   X X X| $dfeb
    .byte %00010100 ; $14 ; |   X X  | $dfec
    .byte %00010011 ; $13 ; |   X  XX| $dfed
    .byte %00000000 ; $00 ; |        | $dfee
    .byte %00000000 ; $00 ; |        | $dfef
    .byte %00000000 ; $00 ; |        | $dff0
    .byte %00000000 ; $00 ; |        | $dff1
    .byte %00000000 ; $00 ; |        | $dff2
    .byte %00000000 ; $00 ; |        | $dff3
    .byte %00000000 ; $00 ; |        | $dff4
    .byte %00000000 ; $00 ; |        | $dff5
    .byte %00000000 ; $00 ; |        | $dff6
    .byte %00000000 ; $00 ; |        | $dff7
    .byte %00000000 ; $00 ; |        | $dff8
    .byte %00000000 ; $00 ; |        | $dff9
Ldffa:
    .byte $00,$00,$00,$00,$00,$00


    ORG  $e000
    RORG $f000

Lf000:
    lda    #$02             ; 2
    sta    WSYNC            ; 3
  IF PAL
    sta    VBLANK           ; 3
    sta    WSYNC            ; 3
    sta    WSYNC            ; 3
    sta    WSYNC            ; 3
    sta    VSYNC            ; 3
  ELSE
    sta    VSYNC            ; 3
    sta    VBLANK           ; 3
    bit    WSYNC            ; 3
    bit    WSYNC            ; 3
    bit    WSYNC            ; 3
  ENDIF
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    WSYNC            ; 3
    sta    WSYNC            ; 3
    sta    VSYNC            ; 3
  IF PAL
    ldx    #$9e             ; 2
  ELSE
    ldx    #$8c             ; 2
  ENDIF
    stx    TIM64T           ; 4     top1
    inc    frameCnt         ; 5
    sta    $f4              ; 3
    lda    $d7              ; 3
    clc                     ; 2
    adc    $d8              ; 3
    cmp    #$08             ; 2
    bcc    Lf06f            ; 2³
    cmp    #$f8             ; 2
    bcs    Lf06f            ; 2³
    cmp    #$80             ; 2
    bcs    Lf04d            ; 2³
Lf032:
    inc    $8d              ; 5
    ldx    $8d              ; 3
    cpx    #$90             ; 2
    bcc    Lf046            ; 2³
    inc    $a9              ; 5
    ldx    #$80             ; 2
    stx    $f4              ; 3
    ldx    #$08             ; 2
    stx    $8d              ; 3
    bne    Lf05d            ; 2³
Lf046:
    sec                     ; 2
    sbc    #$10             ; 2
    bpl    Lf032            ; 2³
    bmi    Lf06f            ; 2³
Lf04d:
    dec    $8d              ; 5
    ldx    $8d              ; 3
    cpx    #$90             ; 2
    bcc    Lf06a            ; 2³
    dec    $a9              ; 5
    ldx    #$88             ; 2
    stx    $8d              ; 3
    stx    $f4              ; 3
Lf05d:
    ldx    #$00             ; 2
    stx    $88              ; 3
    stx    $89              ; 3
    stx    $9a              ; 3
    stx    $9b              ; 3
    txa                     ; 2
    beq    Lf06f            ; 2³
Lf06a:
    clc                     ; 2
    adc    #$10             ; 2
    bmi    Lf04d            ; 2³
Lf06f:
    sta    $d8              ; 3
    lda    $b7              ; 3
    cmp    #$05             ; 2
    bcs    Lf07d            ; 2³
    lda    $a9              ; 3
    beq    Lf08a            ; 2³
    bne    Lf085            ; 2³
Lf07d:
    bit    $f4              ; 3
    bpl    Lf08d            ; 2³
    bit    $e2              ; 3
    bmi    Lf08a            ; 2³
Lf085:
    jsr    Lf7e1            ; 6
    bne    Lf08d            ; 2³
Lf08a:
    jsr    Lf7ed            ; 6
Lf08d:
    lda    #$00             ; 2
    sta    $f0              ; 3
    lda    $d9              ; 3
    clc                     ; 2
    adc    $da              ; 3
    cmp    #$10             ; 2
    bcs    Lf09d            ; 2³
Lf09a:
    jmp    Lf0b5            ; 3

Lf09d:
    cmp    #$f0             ; 2
    bcs    Lf09a            ; 2³
    cmp    #$80             ; 2
    bcs    Lf0ae            ; 2³
Lf0a5:
    inc    $f0              ; 5
    sec                     ; 2
    sbc    #$10             ; 2
    bpl    Lf0a5            ; 2³
    bmi    Lf0b5            ; 2³
Lf0ae:
    dec    $f0              ; 5
    clc                     ; 2
    adc    #$10             ; 2
    bmi    Lf0ae            ; 2³
Lf0b5:
    sta    $da              ; 3
    bit    $d9              ; 3
    bpl    Lf0be            ; 2³
    jmp    Lf151            ; 3

Lf0be:
    ldy    #$00             ; 2
    jsr    Lf6ac            ; 6
    bcc    Lf0cf            ; 2³
    ldx    $80              ; 3
    lda    Lfe93,x          ; 4
    clc                     ; 2
    adc    #$be             ; 2
    sta    $88              ; 3
Lf0cf:
    lda    $b8              ; 3
    cmp    #$26             ; 2
    bcs    Lf0d8            ; 2³
    jmp    Lf180            ; 3

Lf0d8:
    lda    $b7              ; 3
    bne    Lf149            ; 2³+1
    tay                     ; 2
    iny                     ; 2
    iny                     ; 2
    iny                     ; 2
    lda    $ac              ; 3
    cmp    #$01             ; 2
    beq    Lf0ed            ; 2³
    bit    $ac              ; 3
    bvc    Lf0f0            ; 2³
    asl                     ; 2
    bcs    Lf0f0            ; 2³
Lf0ed:
    jmp    Lf1ca            ; 3

Lf0f0:
    and    #$08             ; 2
    bne    Lf0ed            ; 2³
    lda    ($e0),y          ; 5
    cmp    #$0a             ; 2
    bne    Lf13d            ; 2³+1  no - you die
    lda    $ac              ; 3     now, are we a zombie
    cmp    #$c0             ; 2
    beq    Lf118            ; 2³+1  yes - you win!
    ldx    player           ; 3     are you carrying explosives?
    lda    $be,x            ; 4
    and    #$40             ; 2
    beq    Lf13d            ; 2³    nope - die, mutha
    lda    $8d              ; 3     seconfd are we
    cmp    #$3c             ; 2       64 < AXP < 95?
    bcc    Lf13d            ; 2³    no - die
    cmp    #$5a             ; 2
    bcs    Lf13d            ; 2³    no - die again
    lda    $92              ; 3     finally is (GHGT < 15)
    cmp    #$0f             ; 2
    bcs    Lf13d            ; 2³    too bad - you're a loser
; whoopie - wowie! you've won!
Lf118:
    lda    #$08             ; 2     set up win mode
    sta    $ac              ; 3
; put a happy noise in here
    lda    #$00             ; 2
    sta    $d7              ; 3     DELTAX  addsc6 teeturns with a = 0
    sta    $d9              ; 3     DELTAY
    sta    $8e              ; 3
    sta    $8b              ; 3
    sta    $9b              ; 3
    sta    $9a              ; 3
    lda    #$50             ; 2
    sta    $8d              ; 3
    lda    #$30             ; 2
    sta    $db              ; 3
    lda    #$01             ; 2
    sta    $8c              ; 3
    lda    #$d8             ; 2
    sta    $e8              ; 3
    jmp    Lf1ca            ; 3

Lf13d:
    lda    $8a              ; 3
    sta    $8b              ; 3
    jsr    Lf680            ; 6
    sta    $89              ; 3
    jmp    Lf1ca            ; 3

Lf149:
    dec    $b7              ; 5
    lda    #$00             ; 2
    sta    $b8              ; 3
    beq    Lf192            ; 2³
Lf151:
    ldy    #$01             ; 2
    jsr    Lf6ac            ; 6
    bcc    Lf15c            ; 2³
    lda    #$02             ; 2
    sta    $89              ; 3
Lf15c:
    lda    $b8              ; 3
    cmp    #$01             ; 2
    bpl    Lf180            ; 2³
    lda    #$91             ; 2
    cmp    $b7              ; 3
    bne    Lf178            ; 2³
    bit    $ac              ; 3
    bvs    Lf171            ; 2³
    jsr    Lf680            ; 6
    beq    Lf1ca            ; 2³
Lf171:
    lda    #$70             ; 2
    sta    $ac              ; 3
    jmp    Lf1ca            ; 3

Lf178:
    lda    #$26             ; 2
    sta    $b8              ; 3
    inc    $b7              ; 5
    bne    Lf192            ; 2³
Lf180:
    lda    $b8              ; 3
    clc                     ; 2
    adc    $f0              ; 3
    bpl    Lf189            ; 2³
    lda    #$00             ; 2
Lf189:
    sta    $b8              ; 3
    lsr                     ; 2
    bcc    Lf192            ; 2³
    dec    $b8              ; 5
    dec    $f0              ; 5
Lf192:
    lda    $9a              ; 3
    beq    Lf19b            ; 2³
    sec                     ; 2
    sbc    $f0              ; 3
    sta    $9a              ; 3
Lf19b:
    lda    $89              ; 3
    beq    Lf1ae            ; 2³
    sec                     ; 2
    sbc    $f0              ; 3
    sta    $89              ; 3
    cmp    #$be             ; 2
    bcs    Lf1aa            ; 2³
    bcc    Lf1ae            ; 2³
Lf1aa:
    lda    #$00             ; 2
    sta    $89              ; 3
Lf1ae:
    lda    $88              ; 3
    beq    Lf1ca            ; 2³
    sec                     ; 2
    sbc    $f0              ; 3
    sta    $88              ; 3
    ldy    $80              ; 3
    lda    Lfe93,y          ; 4
    clc                     ; 2
    adc    #$bf             ; 2
    cmp    $88              ; 3
    bcs    Lf1ca            ; 2³
    jsr    Lf702            ; 6
    lda    #$00             ; 2
    sta    $89              ; 3
Lf1ca:
    lda    INTIM            ; 4
    bmi    Lf1ca            ; 2³
    lda    #$00             ; 2
    sta    WSYNC            ; 3
    sta    VBLANK           ; 3
    lda    #$98             ; 2
    sta    TIM64T           ; 4     screen1
    lda    frameCnt         ; 3
    and    #$03             ; 2
    beq    Lf1e6            ; 2³
Lf1e0:
    lsr                     ; 2
    bcs    Lf1e9            ; 2³
    jmp    Lf411            ; 3     ->

Lf1e6:
    jmp    Lf41c            ; 3     ->

Lf1e9:
    lsr                     ; 2
    bcc    Lf1ef            ; 2³
    jmp    Lf363            ; 3

Lf1ef:
    bit    $ac              ; 3
    bvs    Lf1f5            ; 2³
    bmi    Lf20d            ; 2³+1
Lf1f5:
    lda    $ac              ; 3
    cmp    #$03             ; 2
    bcs    Lf238            ; 2³+1
    inc    $db              ; 5
    bne    Lf201            ; 2³+1
    inc    $ad              ; 5
Lf201:
    cmp    #$02             ; 2
    beq    Lf215            ; 2³
    lda    INPT4            ; 3
    bpl    Lf210            ; 2³
    lda    INPT5            ; 3
    bpl    Lf210            ; 2³
Lf20d:
    jmp    Lf3ea            ; 3

Lf210:
    sta    $bb              ; 3
    jmp    Reset            ; 3

Lf215:
    ldx    player           ; 3
    lda    playerLst,x      ; 4
    and    #$f0             ; 2
    bne    Lf220            ; 2³
    jmp    Lf294            ; 3

Lf220:
    lda    INPT4,x          ; 4
    bpl    Lf228            ; 2³
    sta    $bb              ; 3
    bmi    Lf235            ; 2³
Lf228:
    cmp    $bb              ; 3
    sta    $bb              ; 3
    beq    Lf235            ; 2³
    lda    #$80             ; 2
    sta    $ac              ; 3
    asl                     ; 2
    sta    $ad              ; 3
Lf235:
    jmp    Lf3ea            ; 3

Lf238:
    cmp    #$4f             ; 2
    bne    Lf254            ; 2³
    inc    $db              ; 5
    bmi    Lf246            ; 2³
    jsr    Lf652            ; 6
    jmp    Lf3ea            ; 3

Lf246:
    lda    #$6f             ; 2
    sta    $db              ; 3
    lda    #$01             ; 2
    sta    $8c              ; 3
    lda    #$50             ; 2
    sta    $ac              ; 3
    bne    Lf235            ; 2³
Lf254:
    cmp    #$50             ; 2
    bne    Lf26d            ; 2³
    inc    $db              ; 5
    bmi    Lf262            ; 2³
    jsr    Lf652            ; 6
    jmp    Lf3ea            ; 3

Lf262:
    lda    #$60             ; 2
    sta    $ac              ; 3
    lda    #$ea             ; 2
    sta    $d9              ; 3
    jmp    Lf3ea            ; 3

Lf26d:
    cmp    #$70             ; 2
    beq    LooseLife        ; 2³
    cmp    #$60             ; 2
    bne    Lf2d1            ; 2³
    lda    $b7              ; 3
    cmp    #$96             ; 2
    beq    LooseLife        ; 2³
    clc                     ; 2
    adc    #$03             ; 2
    tay                     ; 2
    lda    ($e0),y          ; 5
    cmp    #$07             ; 2
    beq    LooseLife        ; 2³
    jsr    Lf652            ; 6
    jmp    Lf3ea            ; 3

LooseLife SUBROUTINE
    ldx    player           ; 3
    lda    playerLst,x      ; 4
    sec                     ; 2
    sbc    #$10             ; 2
    sta    playerLst,x      ; 4
Lf294:
    lda    game             ; 3
    cmp    #$04             ; 2         two player game?
    bcc    Lf2ab            ; 2³
    txa                     ; 2
    eor    #$01             ; 2
    tax                     ; 2
    lda    playerLst,x      ; 4
    and    #$f0             ; 2
    beq    Lf2ab            ; 2³
    jsr    SwitchPlayers    ; 6
    lda    #$50             ; 2
    sta    $8d              ; 3
Lf2ab:
    ldx    player           ; 3
    lda    playerLst,x      ; 4
    and    #$f0             ; 2
    beq    Lf2bf            ; 2³
    lda    #$00             ; 2
    sta    $8c              ; 3
    sta    $ad              ; 3
    jsr    Lf5b2            ; 6
    jmp    Lf3ea            ; 3

Lf2bf:
    lda    #$00             ; 2
    sta    $d7              ; 3
    sta    $d9              ; 3
    sta    $90              ; 3
    sta    $8a              ; 3
    lda    #$40             ; 2
    sta    $db              ; 3
    lda    #$04             ; 2
    sta    $ac              ; 3
Lf2d1:
    cmp    #$04             ; 2
    bne    Lf2e4            ; 2³
    inc    $db              ; 5
    bpl    Lf2e1            ; 2³
    lda    #$00             ; 2
    sta    $db              ; 3
    sta    $ac              ; 3
    sta    $ad              ; 3
Lf2e1:
    jmp    Lf3ea            ; 3

Lf2e4:
    cmp    #$c0             ; 2
    bne    Lf30c            ; 2³+1
    jsr    Lf652            ; 6
    inc    $db              ; 5
    bpl    Lf2e1            ; 2³
    lda    #$80             ; 2
    sta    $ac              ; 3
    lda    #$28             ; 2
    sta    $92              ; 3
    lda    $8a              ; 3
    sec                     ; 2
    sbc    #$28             ; 2
    sta    $8b              ; 3
    lda    #$d8             ; 2
    sta    $e8              ; 3
    lda    #$00             ; 2
    sta    $8c              ; 3
    sta    $8e              ; 3
    sta    $90              ; 3
    beq    Lf319            ; 2³
Lf30c:
    cmp    #$08             ; 2
    bne    Lf31c            ; 2³
    dec    $8a              ; 5
    dec    $8a              ; 5
    bmi    Lf321            ; 2³
    jsr    Lf652            ; 6
Lf319:
    jmp    Lf3ea            ; 3

Lf31c:
    lsr                     ; 2
    bcs    Lf321            ; 2³
    bcc    Lf319            ; 2³
Lf321:
    ldy    #$14             ; 2
    bit    frameCnt         ; 3
    bvc    Lf329            ; 2³
    ldy    #$13             ; 2
Lf329:
    jsr    Lff43            ; 6
    lda    #$09             ; 2
    sta    $ac              ; 3
    lda    #$00             ; 2
    sta    $8a              ; 3
    sta    $88              ; 3
    sta    $89              ; 3
    sta    $c2              ; 3
    lda    #$25             ; 2
    sta    $c0              ; 3
    jsr    AddScore         ; 6
    inc    $ad              ; 5
    inc    $db              ; 5
    bpl    Lf319            ; 2³
    ldx    player           ; 3
    lda    diffLst,x        ; 4
    cmp    #$05             ; 2
    bcc    Lf359            ; 2³
    lda    $be,x            ; 4
    ora    #$80             ; 2
    sta    $be,x            ; 4
    lda    diffLst,x        ; 4
    bne    Lf35d            ; 3

Lf359:
    inc    diffLst,x        ; 6
    lda    diffLst,x        ; 4
Lf35d:
    jsr    Lf58c            ; 6
    jmp    Lf3ea            ; 3

Lf363:
    lda    SWCHB            ; 4
    tax                     ; 2
    eor    switches         ; 3
    tay                     ; 2
    stx    switches         ; 3
    txa                     ; 2
    and    #$02             ; 2
    beq    .select          ; 2³
    tya                     ; 2
    lsr                     ; 2
    bcc    .contSwitches    ; 2³
    lda    #$00             ; 2
    sta    $ad              ; 3
    txa                     ; 2
    lsr                     ; 2
    bcc    Reset            ; 2³
    lda    #$02             ; 2
    sta    $ac              ; 3
    lda    #$00             ; 2
    sta    $db              ; 3
    beq    .contSwitches    ; 3

Reset:
    lda    #$00             ; 2
    sta    $be              ; 3
    sta    $bf              ; 3
    sta    player           ; 3
    ldx    game             ; 3
    lda    GameTbl,x        ; 4
    sta    diffP0           ; 3
    sta    diffP1           ; 3
    jsr    Lf58c            ; 6
    jsr    Lff9a            ; 6
    lda    $b7              ; 3
    sta    $ab              ; 3
    lda    $a9              ; 3
    sta    $aa              ; 3
    lda    #$02             ; 2
    sta    $ac              ; 3
    bne    .contSwitches    ; 3

.select:
    lda    #$00             ; 2
    sta    $ad              ; 3
    sta    $8e              ; 3
    lda    #$01             ; 2
    sta    $ac              ; 3
    tya                     ; 2     SELECT pressed after release?
    and    #$02             ; 2      yes, skip delay
    bne    .skipDelay       ; 2³
    dec    $dc              ; 5     decrease select delay
    bne    .contSwitches    ; 2³
.skipDelay:
    inc    game             ; 5
    lda    game             ; 3
    and    #$07             ; 2
    sta    game             ; 3
    tax                     ; 2
    lda    GameTbl,x        ; 4
    sta    diffP0           ; 3
    sta    diffP1           ; 3
    lda    #10              ; 2     init select delay
    sta    $dc              ; 3
.contSwitches:

    ldx    #$01             ; 2
Lf3d5:
    lda    $be,x            ; 4
    ldy    diffLst,x        ; 4
    cpy    #$02             ; 2
    bcc    Lf3e3            ; 2³
    and    #$fe             ; 2
    bit    switches         ; 3     left difficulty = A
    bvc    Lf3e5            ; 2³     no, skip
Lf3e3:
    ora    #$01             ; 2
Lf3e5:
    sta    $be,x            ; 4
    dex                     ; 2
    bpl    Lf3d5            ; 2³
Lf3ea:
    ldx    #$01             ; 2
    lda    $9a              ; 3
    beq    Lf3fc            ; 2³
    lda    $9b              ; 3
    bne    Lf3f7            ; 2³
    dex                     ; 2
    beq    Lf3fc            ; 2³
Lf3f7:
    lda    frameCnt         ; 3
    and    #$01             ; 2
    tax                     ; 2
Lf3fc:
    lda    $9a,x            ; 4
    sta    $d6              ; 3
    beq    Lf407            ; 2³
    lsr                     ; 2
    bcs    Lf407            ; 2³
    inc    $d6              ; 5
Lf407:
    lda    $94,x            ; 4
    ldx    #$03             ; 2
    jsr    HPosObject       ; 6     h-position M1
    jmp    Lf425            ; 3

Lf411:
    lda    SEG0_3           ; 4     3/5/2
    jmp    $b1e0            ; 3

Lf417:
    lda    SEG0_4           ; 4     4/5/2
    bne    Lf3ea            ; 2³+1          always false! ???
Lf41c:
    lda    SEG0_3           ; 4     3/5/2
    jmp    $b0b4            ; 3

Lf422:
    lda    SEG0_4           ; 4     0/4/2 -> 4/5/2
Lf425:
    lda    $88              ; 3
    beq    Lf431            ; 2³
    cmp    $89              ; 3
    bcs    Lf431            ; 2³
    lda    #$00             ; 2
    sta    $89              ; 3
Lf431:
    lda    $8a              ; 3
    cmp    $8b              ; 3
    bcs    Lf439            ; 2³
    sta    $8b              ; 3
Lf439:
    ldx    #$01             ; 2
Lf43b:
    lda    $88,x            ; 4
    lsr                     ; 2
    bcc    Lf442            ; 2³
    inc    $88,x            ; 6
Lf442:
    lda    $8a,x            ; 4
    lsr                     ; 2
    bcs    Lf449            ; 2³
    inc    $8a,x            ; 6
Lf449:
    dex                     ; 2
    bpl    Lf43b            ; 2³
    ldx    #$01             ; 2
Lf44e:
    jsr    Lf61f            ; 6
    sta    $f0,x            ; 4
    ldy    $80,x            ; 4
    lda    Lfea1,y          ; 4
    clc                     ; 2
    adc    $84,x            ; 4
    sec                     ; 2
    sbc    $f0,x            ; 4
    sta    $e5,x            ; 4
    dex                     ; 2
    bpl    Lf44e            ; 2³
    ldx    #$03             ; 2
Lf465:
    jsr    Lf61f            ; 6
    sta    $f0,x            ; 4
    ldy    $8c              ; 3
    lda    Lfea1,y          ; 4
    clc                     ; 2
    adc    $8e              ; 3
    sec                     ; 2
    sbc    $f0,x            ; 4
    sta    $e1,x            ; 4
    dex                     ; 2
    cpx    #$01             ; 2
    bne    Lf465            ; 2³
    lda    $e3              ; 3
    sta    $e7              ; 3
    lda    $8a              ; 3
    sta    $d2              ; 3
    ldy    $8b              ; 3
    lda    $92              ; 3
    bne    Lf48b            ; 2³
    tay                     ; 2
Lf48b:
    sty    $d3              ; 3
    lda    #$10             ; 2
    cmp    $92              ; 3
    bcc    Lf4a2            ; 2³
    cmp    $f2              ; 3
    bcc    Lf4a2            ; 2³
    cmp    $f3              ; 3
    bcc    Lf4a2            ; 2³
    lda    $e4              ; 3
    sec                     ; 2
    sbc    #$28             ; 2
    sta    $e4              ; 3
Lf4a2:
    lda    $88              ; 3
    bne    Lf4b6            ; 2³
    lda    $89              ; 3
    sta    $d4              ; 3
    lda    $e6              ; 3
    sta    $e9              ; 3
    lda    $83              ; 3
    sta    $82              ; 3
    lda    #$00             ; 2
    beq    Lf4be            ; 2³
Lf4b6:
    sta    $d4              ; 3
    lda    $e5              ; 3
    sta    $e9              ; 3
    lda    $89              ; 3
Lf4be:
    sta    $d5              ; 3
    ldy    $b7              ; 3
    ldx    #$00             ; 2
Lf4c4:
    lda    ($e0),y          ; 5
    sta    $b1,x            ; 4
    iny                     ; 2
    inx                     ; 2
    cpx    #$06             ; 2
    bcc    Lf4c4            ; 2³
Lf4ce:
    lda    INTIM            ; 4
    bmi    Lf4ce            ; 2³
    sta    WSYNC            ; 3
    lda    #$85             ; 2
    sta    TIM64T           ; 4     screen2
    ldx    #$0a             ; 2
    lda    #$72             ; 2
Lf4de:
    sta    $c0,x            ; 4
    dex                     ; 2
    dex                     ; 2
    bpl    Lf4de            ; 2³
    ldy    $ac              ; 3
    cpy    #$01             ; 2
    bne    Lf503            ; 2³+1
    lda    game             ; 3
    clc                     ; 2
    adc    #$01             ; 2
    tax                     ; 2
    lda    DigitOfsTbl,x    ; 4
    sta    $c0              ; 3
    ldy    #$a5             ; 2     display single player game mode
    lda    game             ; 3
    cmp    #$04             ; 2     two player game?
    bcc    Lf4ff            ; 2³     no, skip
    ldy    #$ae             ; 2     display two player game mode
Lf4ff:
    sty    $ca              ; 3
    bne    Lf51d            ; 2³
Lf503:
    cpy    #$02             ; 2
    bne    Lf537            ; 2³
    ldx    player           ; 3
    lda    $be,x            ; 4
    bpl    Lf51f            ; 2³
    lda    #$f4             ; 2
    sta    $c2              ; 3
    lda    #$00             ; 2
    sta    $c4              ; 3
    lda    #$09             ; 2
    sta    $c6              ; 3
    lda    #$d9             ; 2
    sta    $c3              ; 3
Lf51d:
    bne    Lf548            ; 2³
Lf51f:
    inx                     ; 2
    lda    #$b7             ; 2
    sta    $c0              ; 3
    lda    #$c0             ; 2
    sta    $c2              ; 3
    lda    #$c9             ; 2
    sta    $c4              ; 3
    lda    #$d2             ; 2
    sta    $c6              ; 3
    lda    DigitOfsTbl,x    ; 4
    sta    $ca              ; 3
    bne    Lf548            ; 2³
Lf537:
    lda    $ac              ; 3
    beq    Lf53f            ; 2³
    cmp    #$04             ; 2
    bne    Lf543            ; 2³
Lf53f:
    ldx    #$00             ; 2
    beq    Lf545            ; 3

Lf543:
    ldx    player           ; 3
Lf545:
    jsr    SetScorePtrs     ; 6
Lf548:
    lda    INTIM            ; 4
    bmi    Lf548            ; 2³
    jsr    Lf557            ; 6
    lda    #$00             ; 2
    sta    VDELP0           ; 3
    jmp    Lfc58            ; 3

Lf557:
    ldy    #$08             ; 2
    sty    $f0              ; 3
Lf55b:
    ldy    $f0              ; 3
    lda    ($c0),y          ; 5
    sta    GRP0             ; 3
    sta    WSYNC            ; 3
    lda    ($c2),y          ; 5
    sta    GRP1             ; 3
    lda    ($c4),y          ; 5
    sta    GRP0             ; 3
    lda    ($c6),y          ; 5
    sta    $f1              ; 3
    lda    ($c8),y          ; 5
    tax                     ; 2
    lda    ($ca),y          ; 5
    tay                     ; 2
    lda    $f1              ; 3
    sta    GRP1             ; 3
    stx    GRP0             ; 3
    sty    GRP1             ; 3
    sty    GRP0             ; 3
    dec    $f0              ; 5
    bpl    Lf55b            ; 2³
    lda    #$00             ; 2
    sta    GRP1             ; 3
    sta    GRP0             ; 3
    sta    GRP1             ; 3
    rts                     ; 6

Lf58c:
    tax                     ; 2
    lda    Lfeab,x          ; 4
    sec                     ; 2
    sbc    #$08             ; 2
    sta    $b7              ; 3
    lda    Lfeb1,x          ; 4
    sta    $a9              ; 3
    lda    #$d7             ; 2
    sta    $bd              ; 3
    lda    #$00             ; 2
    sta    $89              ; 3
    sta    $88              ; 3
    sta    $ad              ; 3
    sta    $b8              ; 3
    sta    $ec              ; 3
    lda    #$d8             ; 2
    sta    $e8              ; 3
    lda    #$50             ; 2
    sta    $8d              ; 3
Lf5b2:
    lda    #$00             ; 2
    sta    $90              ; 3
    sta    $8e              ; 3
    sta    $db              ; 3
    sta    $91              ; 3
    sta    $de              ; 3
    sta    $88              ; 3
    sta    $89              ; 3
    ldx    #$07             ; 2
Lf5c4:
    sta    $94,x            ; 4
    dex                     ; 2
    bpl    Lf5c4            ; 2³
    sta    $d7              ; 3
    sta    $d9              ; 3
    sta    $8c              ; 3
    lda    $a9              ; 3
    lsr                     ; 2
    bcc    Lf5d9            ; 2³
    jsr    Lf7e1            ; 6
    bne    Lf5dc            ; 2³
Lf5d9:
    jsr    Lf7ed            ; 6
Lf5dc:
    ldx    player           ; 3
    ldy    diffLst,x        ; 4
    lda    $be,x            ; 4
    cpy    #$02             ; 2
    bcs    Lf5ea            ; 2³
    ora    #$40             ; 2
    bne    Lf5ec            ; 2³
Lf5ea:
    and    #$bf             ; 2
Lf5ec:
    sta    $be,x            ; 4
    cpy    #$02             ; 2
    bcs    Lf5fa            ; 2³
    lda    playerLst,x      ; 4
    and    #$f0             ; 2
    ora    #$09             ; 2
    sta    playerLst,x      ; 4
Lf5fa:
    lda    #$04             ; 2
    sta    $93              ; 3
    lda    #$14             ; 2
    sta    $92              ; 3
    lda    #$30             ; 2
    sta    $8b              ; 3
    lda    #$44             ; 2
    sta    $8a              ; 3
    lda    $ec              ; 3
    cmp    #$0a             ; 2
    bcc    Lf615            ; 2³
    sec                     ; 2
    sbc    #$0a             ; 2
    sta    $ec              ; 3
Lf615:
    lda    #$02             ; 2
    sta    $ac              ; 3
    ldy    #$12             ; 2
    jsr    Lff43            ; 6
    rts                     ; 6

Lf61f:
    ldy    $88,x            ; 4
    beq    Lf645            ; 2³
    iny                     ; 2
    sty    $f0,x            ; 4
    lda    #$be             ; 2
    sec                     ; 2
    sbc    $b8              ; 3
Lf62b:
    cmp    $88,x            ; 4
    bcc    Lf645            ; 2³
    beq    Lf645            ; 2³
    cmp    $f0,x            ; 4
    bne    Lf63b            ; 2³
    sec                     ; 2
    sbc    #$01             ; 2
    jmp    Lf645            ; 3

Lf63b:
    cmp    #$28             ; 2
    bcc    Lf645            ; 2³
    sec                     ; 2
    sbc    #$28             ; 2
    jmp    Lf62b            ; 3

Lf645:
    sta    $f0,x            ; 4
    lda    $88,x            ; 4
    sec                     ; 2
    sbc    $f0,x            ; 4
    bpl    Lf651            ; 2³
    clc                     ; 2
    adc    #$28             ; 2
Lf651:
    rts                     ; 6

Lf652:
    lda    frameCnt         ; 3
    and    #$07             ; 2
    cmp    #$05             ; 2
    bne    Lf67f            ; 2³
    lda    $8c              ; 3
    cmp    #$01             ; 2
    bne    Lf668            ; 2³
    ldy    #$0c             ; 2
    jsr    Lff43            ; 6
    jmp    Lf679            ; 3

Lf668:
    cmp    #$03             ; 2
    bne    Lf679            ; 2³
    lda    frameCnt         ; 3
    and    #$1f             ; 2
    cmp    #$05             ; 2
    bne    Lf67f            ; 2³
    ldy    #$09             ; 2
    jsr    Lff43            ; 6
Lf679:
    lda    $8f              ; 3
    eor    #$ff             ; 2
    sta    $8f              ; 3
Lf67f:
    rts                     ; 6

Lf680:
    lda    $8b              ; 3
    sta    $8a              ; 3
    lda    #$d8             ; 2
    sta    $e8              ; 3
    ldy    #$0d             ; 2
    jsr    Lff43            ; 6
    lda    #$4f             ; 2
    sta    $ac              ; 3
    lda    #$60             ; 2
    sta    $db              ; 3
    ldy    #$02             ; 2
    sty    $8c              ; 3
    lda    #$00             ; 2
    sta    $d7              ; 3
    sta    $d9              ; 3
    sta    $93              ; 3
    sta    $8e              ; 3
    sta    $92              ; 3
    sta    $8b              ; 3
    sta    $9a              ; 3
    sta    $9b              ; 3
    rts                     ; 6

Lf6ac:
    bit    $ac              ; 3
    bvc    Lf6b5            ; 2³
    bmi    Lf6b5            ; 2³
    clc                     ; 2
    bcc    Lf6e7            ; 2³
Lf6b5:
    jsr    Lffb0            ; 6
    bcc    Lf6e7            ; 2³
    jsr    Lf6e8            ; 6
    bcc    Lf6e7            ; 2³
    tya                     ; 2
    tax                     ; 2
    jsr    Lff8e            ; 6
    adc    frameCnt         ; 3
    and    #$07             ; 2
    tay                     ; 2
    lda    $d82a,y          ; 4
    sta    $80,x            ; 4
    jsr    Lff8e            ; 6
    adc    frameCnt         ; 3
    and    #$0f             ; 2
    clc                     ; 2
    adc    #$02             ; 2
    cmp    #$0b             ; 2
    bcc    Lf6de            ; 2³
    sbc    #$07             ; 2
Lf6de:
    sta    $82,x            ; 4
    lda    #$00             ; 2
    sta    $84,x            ; 4
    sta    $86,x            ; 4
    sec                     ; 2
Lf6e7:
    rts                     ; 6

Lf6e8:
    lda    $88              ; 3
    bne    Lf6f2            ; 2³
    lda    $89              ; 3
    bne    Lf6f8            ; 2³
Lf6f0:
    sec                     ; 2
    rts                     ; 6

Lf6f2:
    lda    $89              ; 3
    beq    Lf716            ; 2³+1
Lf6f6:
    clc                     ; 2
Lf6f7:
    rts                     ; 6

Lf6f8:
    bit    $d9              ; 3
    bpl    Lf70e            ; 2³+1
    lda    $89              ; 3
    cmp    #$50             ; 2
    bcc    Lf6f7            ; 2³+1
Lf702:
    ldx    #$09             ; 2
Lf704:
    lda    $80,x            ; 4
    sta    $7f,x            ; 4
    dex                     ; 2
    dex                     ; 2
    bpl    Lf704            ; 2³
    bmi    Lf6f0            ; 2³+1
Lf70e:
    lda    $89              ; 3
    cmp    #$6e             ; 2
    bcs    Lf6f6            ; 2³+1
    bcc    Lf6f0            ; 2³+1
Lf716:
    bit    $d9              ; 3
    bpl    Lf71f            ; 2³
    lda    $88              ; 3
    cmp    #$50             ; 2
    rts                     ; 6

Lf71f:
    lda    $88              ; 3
    cmp    #$6e             ; 2
    bcs    Lf6f6            ; 2³+1
    lda    #$01             ; 2
    sta    $dd              ; 3
    ldx    #$09             ; 2
Lf72b:
    lda    $7f,x            ; 4
    sta    $80,x            ; 4
    dex                     ; 2
    dex                     ; 2
    bpl    Lf72b            ; 2³
    bmi    Lf6f0            ; 2³+1

SetScorePtrs SUBROUTINE
    lda    scoreHi,x        ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c0              ; 3
    lda    scoreHi,x        ; 4
    and    #$0f             ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c2              ; 3
    lda    scoreMid,x       ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c4              ; 3
    lda    scoreMid,x       ; 4
    and    #$0f             ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c6              ; 3
    lda    scoreLo,x        ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c8              ; 3
    lda    scoreLo,x        ; 4
    and    #$0f             ; 2
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $ca              ; 3
    ldx    #$00             ; 2
    ldy    #$72             ; 2
Lf77b:
    lda    $c0,x            ; 4
    cmp    #$12             ; 2
    bne    Lf789            ; 2³
    sty    $c0,x            ; 4
    inx                     ; 2
    inx                     ; 2
    cpx    #$09             ; 2
    bcc    Lf77b            ; 2³
Lf789:
    rts                     ; 6

Lf78a:
    cpx    #$05             ; 2
    beq    Lf7a1            ; 2³
    cpx    #$06             ; 2
    beq    Lf7a1            ; 2³
Lf792:
    cpx    #$07             ; 2
    beq    Lf7d7            ; 2³
    lda    $0086,y          ; 4
    eor    #$ff             ; 2
    sta    $0086,y          ; 5
    jmp    Lf7d7            ; 3

Lf7a1:
    lda    frameCnt         ; 3
    and    #$30             ; 2
    cmp    #$10             ; 2
    beq    Lf792            ; 2³
    and    #$10             ; 2
    beq    Lf7b0            ; 2³
    jmp    Lf7d7            ; 3

Lf7b0:
    lda    $0084,y          ; 4
    beq    Lf7bc            ; 2³
    lda    #$00             ; 2
    sta    $0084,y          ; 5
    beq    Lf7d7            ; 2³
Lf7bc:
    lda    Lfe93,x          ; 4
    clc                     ; 2
    adc    #$02             ; 2
    sta    $0084,y          ; 5
    cpx    #$05             ; 2
    beq    Lf7cd            ; 2³
    ldy    #$06             ; 2
    bne    Lf7d4            ; 2³
Lf7cd:
    ldy    #$07             ; 2
    jsr    Lff43            ; 6
    ldy    #$02             ; 2
Lf7d4:
    jsr    Lff43            ; 6
Lf7d7:
    cpx    #$04             ; 2
    bne    Lf7e0            ; 2³
    ldy    #$0c             ; 2
    jsr    Lff43            ; 6
Lf7e0:
    rts                     ; 6

Lf7e1:
    ldx    #$69             ; 2
    stx    $e0              ; 3
    ldx    #$fd             ; 2
    stx    $e1              ; 3
    ldx    #$ff             ; 2
    bne    Lf7f7            ; 2³
Lf7ed:
    ldx    #$00             ; 2
    stx    $e0              ; 3
    ldx    #$fe             ; 2
    stx    $e1              ; 3
    ldx    #$00             ; 2
Lf7f7:
    stx    $e2              ; 3
    rts                     ; 6

    .byte $00 ; $f7fa
    .byte $00 ;
    .byte $00 ;
    .byte $00 ;
    .byte $00 ;
    .byte $00 ;

Lf800:
  IF PAL
    lda    #$a2             ; 2
  ELSE
    lda    #$8a             ; 2
  ENDIF
    sta    TIM64T           ; 4     bottom
    jsr    $b000            ; 6
    bit    $ac              ; 3
    bpl    Lf842            ; 2³
    lda    frameCnt         ; 3
    and    #$07             ; 2
Lf810:
    beq    Lf842            ; 2³
    ldy    $8c              ; 3
    lda    SWCHA            ; 4
    eor    #$ff             ; 2
    ldx    player           ; 3
    beq    Lf821            ; 2³
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
Lf821:
    sta    $f1              ; 3
    bit    $f1              ; 3
    bmi    .right           ; 2³
    bvs    .left            ; 2³
    bvc    Lf842            ; 2³
.left:
    cpy    #$03             ; 2
    bne    Lf833            ; 2³
    lda    #$f4             ; 2
    bne    Lf83e            ; 3

Lf833:
    dec    $90              ; 5
    jmp    Lf842            ; 3

.right:
    cpy    #$03             ; 2
    bne    Lf840            ; 2³
    lda    #$0c             ; 2
Lf83e:
    sta    $d7              ; 3
Lf840:
    inc    $90              ; 5
Lf842:
    lda    frameCnt         ; 3
    and    #$03             ; 2
    beq    Lf857            ; 2³
    lsr                     ; 2
    bcc    Lf854            ; 2³
    lsr                     ; 2
    bcs    Lf851            ; 2³
    jmp    Lf915            ; 3

Lf851:
    jmp    Lfa35            ; 3

Lf854:
    jmp    Lf950            ; 3

Lf857:
    lda    $ac              ; 3
    bmi    Lf85e            ; 2³
Lf85b:
    jmp    Lfba8            ; 3

Lf85e:
    lda    $9b              ; 3
    beq    Lf89a            ; 2³
    lda    $dc              ; 3
    cmp    $9b              ; 3
    bcc    Lf86e            ; 2³
Lf868:
    lda    #$00             ; 2
    sta    $9b              ; 3
    beq    Lf85b            ; 2³
Lf86e:
    lda    $d7              ; 3
    bpl    Lf87c            ; 2³
    eor    #$fe             ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    eor    #$fe             ; 2
    jmp    Lf87f            ; 3

Lf87c:
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
Lf87f:
    clc                     ; 2
    adc    $95              ; 3
    adc    $97              ; 3
    cmp    #$92             ; 2
    bcs    Lf868            ; 2³
    sta    $95              ; 3
    lda    $9b              ; 3
    clc                     ; 2
    adc    $99              ; 3
    sta    $9b              ; 3
    cmp    #$be             ; 2
    bcs    Lf868            ; 2³
    dec    $99              ; 5
    jmp    Lfba8            ; 3

Lf89a:
    ldx    player           ; 3
    lda    INPT4,x          ; 4
    bmi    Lf8a4            ; 2³
    cmp    $bb              ; 3
    bne    Lf8a9            ; 2³
Lf8a4:
    sta    $bb              ; 3
    jmp    Lfba8            ; 3

Lf8a9:
    sta    $bb              ; 3
    lda    $ac              ; 3
    cmp    #$c0             ; 2
    bne    Lf8c5            ; 2³
    lda    $8d              ; 3
    adc    #$06             ; 2
    sta    $95              ; 3
    lda    $8a              ; 3
    sta    $9b              ; 3
    lda    #$18             ; 2
    sta    $99              ; 3
    lda    #$00             ; 2
    sta    $97              ; 3
    beq    Lf912            ; 2³+1
Lf8c5:
    lda    playerLst,x      ; 4
    and    #$0f             ; 2
    beq    Lf912            ; 2³+1
    dec    playerLst,x      ; 6
    lda    $8d              ; 3
    clc                     ; 2
    adc    #$08             ; 2
    sta    $95              ; 3
    lda    $8a              ; 3
    sec                     ; 2
    sbc    #$04             ; 2
    sta    $9b              ; 3
    lda    $8b              ; 3
    sec                     ; 2
    sbc    #$10             ; 2
    sta    $dc              ; 3
    lsr                     ; 2
    bcs    Lf8e7            ; 2³
    dec    $dc              ; 5
Lf8e7:
    ldx    #$00             ; 2
    lda    $90              ; 3
    clc                     ; 2
    adc    #$0a             ; 2
    sec                     ; 2
    bpl    Lf8f9            ; 2³
    inx                     ; 2
Lf8f2:
    inx                     ; 2
    sbc    #$15             ; 2
    bmi    Lf8f2            ; 2³
    bpl    Lf8fa            ; 2³
Lf8f9:
    inx                     ; 2
Lf8fa:
    sbc    #$15             ; 2
    bpl    Lf8f9            ; 2³
    lda    Lfbe4,x          ; 4
    sta    $97              ; 3
    lda    Lfbf2,x          ; 4
    sta    $99              ; 3
    ldy    #$01             ; 2
    jsr    Lff43            ; 6
    ldy    #$0a             ; 2
    jsr    Lff43            ; 6
Lf912:
    jmp    Lfba8            ; 3

Lf915:
    ldx    $80              ; 3
    lda    frameCnt         ; 3
    and    #$07             ; 2
    cmp    #$05             ; 2
    bne    Lf94d            ; 2³
    bit    $ac              ; 3
    bmi    Lf927            ; 2³
    bvs    Lf927            ; 2³
    bvc    Lf94d            ; 2³
Lf927:
    lda    $88              ; 3
    beq    Lf94d            ; 2³
    sec                     ; 2
    sbc    $89              ; 3
    cmp    $88              ; 3
    beq    Lf938            ; 2³
    cmp    #$55             ; 2
    bcc    Lf940            ; 2³
    beq    Lf940            ; 2³
Lf938:
    lda    $88              ; 3
    sec                     ; 2
    sbc    Lfe98,x          ; 4
    sta    $88              ; 3
Lf940:
    lda    frameCnt         ; 3
    and    #$0f             ; 2
    cmp    #$05             ; 2
    bne    Lf94d            ; 2³
    ldy    #$00             ; 2
    jsr    Lf78a            ; 6
Lf94d:
    jmp    Lfba8            ; 3

Lf950:
    ldx    $81              ; 3
    lda    frameCnt         ; 3
    and    #$07             ; 2
    cmp    #$06             ; 2
    bne    Lf979            ; 2³
    lda    $ac              ; 3
    bmi    Lf962            ; 2³
    bvs    Lf962            ; 2³
    bvc    Lf979            ; 2³
Lf962:
    lda    $89              ; 3
    beq    Lf979            ; 2³
    sec                     ; 2
    sbc    Lfe98,x          ; 4
    sta    $89              ; 3
    lda    frameCnt         ; 3
    and    #$0f             ; 2
    cmp    #$06             ; 2
    bne    Lf979            ; 2³
    ldy    #$01             ; 2
    jsr    Lf78a            ; 6
Lf979:
    bit    $ac              ; 3
    bmi    Lf980            ; 2³
    jmp    Lfa32            ; 3

Lf980:
    lda    $9a              ; 3
    beq    Lf9a0            ; 2³
    clc                     ; 2
    adc    $98              ; 3
    sta    $9a              ; 3
    cmp    #$be             ; 2
    bcs    Lf99d            ; 2³
    lda    $94              ; 3
    clc                     ; 2
    adc    $96              ; 3
    sta    $94              ; 3
    beq    Lf99d            ; 2³
    cmp    #$88             ; 2
    bcs    Lf99d            ; 2³
    jmp    Lfa32            ; 3

Lf99d:
    jmp    Lfa2c            ; 3

Lf9a0:
    lda    $de              ; 3
    bne    Lf9d8            ; 2³
    lda    $ec              ; 3
    cmp    #$1e             ; 2
    bcs    Lf9ba            ; 2³
    jsr    Lff8e            ; 6
    ldx    player           ; 3
    ldy    diffLst,x        ; 4
    lda    Lfebd,y          ; 4
    cmp    $eb              ; 3
    beq    Lfa32            ; 2³+1
    bcc    Lfa32            ; 2³+1
Lf9ba:
    lda    $88              ; 3
    beq    Lfa2c            ; 2³+1
    cmp    #$dc             ; 2
    bcs    Lfa2c            ; 2³+1
    lda    $80              ; 3
    cmp    #$04             ; 2
    beq    Lfa2c            ; 2³+1
    cmp    #$08             ; 2
    beq    Lfa2c            ; 2³+1
    lda    #$6c             ; 2
    sta    $de              ; 3
    ldy    #$11             ; 2
    jsr    Lff43            ; 6
    jmp    Lfa32            ; 3

Lf9d8:
    lda    $de              ; 3
    beq    Lfa32            ; 2³+1
    inc    $de              ; 5
    bpl    Lfa32            ; 2³+1
    lda    $80              ; 3
    cmp    #$04             ; 2
    beq    Lfa2c            ; 2³+1
    cmp    #$08             ; 2
    beq    Lfa2c            ; 2³+1
    lda    $88              ; 3
    sec                     ; 2
    sbc    #$08             ; 2
    sta    $9a              ; 3
    sec                     ; 2
    sbc    $8a              ; 3
    and    #$0f             ; 2
    eor    #$fe             ; 2
    sta    $98              ; 3
    ldx    $82              ; 3
    dex                     ; 2
    dex                     ; 2
    dex                     ; 2
    lda    #$00             ; 2
    sta    $de              ; 3
    clc                     ; 2
Lfa04:
    adc    #$0f             ; 2
    dex                     ; 2
    bpl    Lfa04            ; 2³
    sta    $94              ; 3
    sec                     ; 2
    sbc    $8d              ; 3
    bpl    Lfa15            ; 2³
    and    #$0f             ; 2
    jmp    Lfa19            ; 3

Lfa15:
    and    #$0f             ; 2
    eor    #$fe             ; 2
Lfa19:
    sta    $96              ; 3
    ora    $98              ; 3
    beq    Lfa2c            ; 2³
    ldy    #$03             ; 2
    jsr    Lff43            ; 6
    ldy    #$0b             ; 2
    jsr    Lff43            ; 6
    jmp    Lfba8            ; 3

Lfa2c:
    lda    #$00             ; 2
    sta    $9a              ; 3
    sta    $de              ; 3
Lfa32:
    jmp    Lfba8            ; 3

Lfa35:
    lda    $ac              ; 3
    bmi    Lfa46            ; 2³
    cmp    #$03             ; 2
    bcs    Lfa43            ; 2³
    lda    #$00             ; 2
    sta    $d7              ; 3
    sta    $d9              ; 3
Lfa43:
    jmp    Lfba8            ; 3

Lfa46:
    lda    $f1              ; 3
    ldx    $8c              ; 3
    cpx    #$09             ; 2
    beq    Lfa5c            ; 2³
    cpx    #$03             ; 2
    bne    Lfa5f            ; 2³
    ldx    #$18             ; 2
    and    #$20             ; 2         joystick down?
    beq    Lfa5a            ; 2³
    ldx    #$f0             ; 2
Lfa5a:
    stx    $d9              ; 3
Lfa5c:
    jmp    Lfba8            ; 3

Lfa5f:
    ldx    player           ; 3
    ldy    diffLst,x        ; 4
    and    #$10             ; 2         joystick up?
    bne    Lfab2            ; 2³
    lda    $f1              ; 3
    and    #$20             ; 2         joystick down?
    bne    Lfa70            ; 2³
    jmp    Lfad4            ; 3

Lfa70:
    dec    $93              ; 5
    lda    frameCnt         ; 3
    and    #$04             ; 2
    bne    Lfad4            ; 2³
    lda    $93              ; 3
    beq    Lfa7e            ; 2³
    bpl    Lfa88            ; 2³
Lfa7e:
    tya                     ; 2
    bne    Lfa94            ; 2³
    lda    #$00             ; 2
    sta    $93              ; 3
    jmp    Lfad4            ; 3

Lfa88:
    lda    $92              ; 3
    cmp    #$2d             ; 2
    bcs    Lfad4            ; 2³
    inc    $92              ; 5
    inc    $92              ; 5
    bpl    Lfad4            ; 2³
Lfa94:
    lda    $be,x            ; 4
    and    #$01             ; 2
    bne    Lfaa2            ; 2³
Lfa9a:
    dec    $92              ; 5
    dec    $92              ; 5
    bmi    Lface            ; 2³
    bpl    Lfad4            ; 2³
Lfaa2:
    lda    $92              ; 3
    cmp    #$04             ; 2
    bcs    Lfa9a            ; 2³
    lda    $93              ; 3
    beq    Lface            ; 2³
    lda    #$02             ; 2
    sta    $92              ; 3
    bne    Lfad4            ; 2³
Lfab2:
    lda    $93              ; 3
    bpl    Lfabd            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
    sta    $93              ; 3
Lfabd:
    lda    Lfeb7,y          ; 4
    cmp    $93              ; 3
    bcc    Lfac6            ; 2³
    inc    $93              ; 5
Lfac6:
    lda    frameCnt         ; 3
    and    #$04             ; 2
    bne    Lfad4            ; 2³
    beq    Lfa94            ; 3

Lface:
    jsr    Lf680            ; 6
    jmp    Lfba8            ; 3

Lfad4:
    lda    $90              ; 3
    and    #$7f             ; 2
    cmp    #$40             ; 2
    bcc    Lfb12            ; 2³+1
    and    #$3f             ; 2
    tax                     ; 2
    lda    $93              ; 3
    bpl    Lfae8            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfae8:
    jsr    Lfbb0            ; 6
    ldy    $90              ; 3
    cpy    #$c0             ; 2
    bpl    Lfaf6            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfaf6:
    sta    $d9              ; 3
    lda    $93              ; 3
    bpl    Lfb01            ; 2³+1
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb01:
    jsr    Lfbca            ; 6
    ldy    $90              ; 3
    bpl    Lfb0d            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb0d:
    sta    $d7              ; 3
    jmp    Lfb45            ; 3

Lfb12:
    and    #$3f             ; 2
    tax                     ; 2
    lda    $93              ; 3
    bpl    Lfb1e            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb1e:
    jsr    Lfbca            ; 6
    ldy    $90              ; 3
    bpl    Lfb2a            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb2a:
    sta    $d9              ; 3
    lda    $93              ; 3
    bpl    Lfb35            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb35:
    jsr    Lfbb0            ; 6
    ldy    $90              ; 3
    cpy    #$c0             ; 2
    bpl    Lfb43            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lfb43:
    sta    $d7              ; 3
Lfb45:
    bit    $93              ; 3
    bpl    Lfb5b            ; 2³
    lda    $d7              ; 3
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
    sta    $d7              ; 3
    lda    $d9              ; 3
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
    sta    $d9              ; 3
Lfb5b:
    lda    $90              ; 3
    bpl    Lfb6a            ; 2³
    lsr                     ; 2
    lsr                     ; 2
    sta    $f3              ; 3
    lda    #$70             ; 2
    sec                     ; 2
    sbc    $f3              ; 3
    bne    Lfb6f            ; 2³
Lfb6a:
    lsr                     ; 2
    lsr                     ; 2
    clc                     ; 2
    adc    #$30             ; 2
Lfb6f:
    sta    $8b              ; 3
    clc                     ; 2
    adc    $92              ; 3
    sta    $8a              ; 3
    ldy    #$00             ; 2
    ldx    $90              ; 3
    stx    $f0              ; 3
    cpx    #$88             ; 2
    bcc    Lfb92            ; 2³
    sty    $8f              ; 3
Lfb82:
    lda    $f0              ; 3
    clc                     ; 2
    adc    #$15             ; 2
    bpl    Lfba6            ; 2³
    sta    $f0              ; 3
    tya                     ; 2
    clc                     ; 2
    adc    #$12             ; 2
    tay                     ; 2
    bne    Lfb82            ; 2³
Lfb92:
    lda    #$ff             ; 2
    sta    $8f              ; 3
Lfb96:
    lda    $f0              ; 3
    sec                     ; 2
    sbc    #$15             ; 2
    bmi    Lfba6            ; 2³
    sta    $f0              ; 3
    tya                     ; 2
    clc                     ; 2
    adc    #$12             ; 2
    tay                     ; 2
    bne    Lfb96            ; 2³
Lfba6:
    sty    $8e              ; 3
Lfba8:
    lda    INTIM            ; 4
    bmi    Lfba8            ; 2³
    jmp    Lfd66            ; 3

Lfbb0:
    cpx    #$20             ; 2
    bcs    Lfbc9            ; 2³
    lsr                     ; 2
    cpx    #$10             ; 2
    bcs    Lfbc9            ; 2³
    lsr                     ; 2
    cpx    #$08             ; 2
    bcs    Lfbc9            ; 2³
    lsr                     ; 2
    cpx    #$04             ; 2
    bcs    Lfbc9            ; 2³
    lsr                     ; 2
    cpx    #$02             ; 2
    bcs    Lfbc9            ; 2³
    lsr                     ; 2
Lfbc9:
    rts                     ; 6

Lfbca:
    cpx    #$20             ; 2
    bcc    Lfbe3            ; 2³
    lsr                     ; 2
    cpx    #$30             ; 2
    bcc    Lfbe3            ; 2³
    lsr                     ; 2
    cpx    #$38             ; 2
    bcc    Lfbe3            ; 2³
    lsr                     ; 2
    cpx    #$3c             ; 2
    bcc    Lfbe3            ; 2³
    lsr                     ; 2
    cpx    #$3e             ; 2
    bcc    Lfbe3            ; 2³
    lsr                     ; 2
Lfbe3:
    rts                     ; 6

Lfbe4:
    .byte %11111111 ; $ff ; |XXXXXXXX| $fbe4
    .byte %00000000 ; $00 ; |        | $fbe5
    .byte %00000001 ; $01 ; |       X| $fbe6
    .byte %00000010 ; $02 ; |      X | $fbe7
    .byte %00000011 ; $03 ; |      XX| $fbe8
    .byte %00000010 ; $02 ; |      X | $fbe9
    .byte %00000001 ; $01 ; |       X| $fbea
    .byte %00000000 ; $00 ; |        | $fbeb
    .byte %11111111 ; $ff ; |XXXXXXXX| $fbec
    .byte %11111110 ; $fe ; |XXXXXXX | $fbed
    .byte %11111101 ; $fd ; |XXXXXX X| $fbee
    .byte %11111110 ; $fe ; |XXXXXXX | $fbef
    .byte %11111111 ; $ff ; |XXXXXXXX| $fbf0
    .byte %00000000 ; $00 ; |        | $fbf1
Lfbf2:
    .byte %00000110 ; $06 ; |     XX | $fbf2
    .byte %00000111 ; $07 ; |     XXX| $fbf3
    .byte %00000110 ; $06 ; |     XX | $fbf4
    .byte %00000101 ; $05 ; |     X X| $fbf5
    .byte %00000011 ; $03 ; |      XX| $fbf6
    .byte %00000001 ; $01 ; |       X| $fbf7
    .byte %00000000 ; $00 ; |        | $fbf8
    .byte %11111111 ; $ff ; |XXXXXXXX| $fbf9
    .byte %00000000 ; $00 ; |        | $fbfa
    .byte %00000001 ; $01 ; |       X| $fbfb
    .byte %00000011 ; $03 ; |      XX| $fbfc
    .byte %00000101 ; $05 ; |     X X| $fbfd
    .byte %00000110 ; $06 ; |     XX | $fbfe
    .byte %00000111 ; $07 ; |     XXX| $fbff

START:
    cld                     ; 2
    ldx    #$00             ; 2
    txa                     ; 2
Lfc04:
    sta    VSYNC,x          ; 4
    txs                     ; 2
    inx                     ; 2
    bne    Lfc04            ; 2³
    sta    SEG1_5           ; 4     ?/5/?
    lda    #$d8             ; 2
    sta    $ae              ; 3
    lda    #$d7             ; 2
    sta    $bd              ; 3
    lda    #$00             ; 2
    sta    $e0              ; 3
    lda    #$fe             ; 2
    sta    $e1              ; 3
    lda    #$d8             ; 2
    sta    $e8              ; 3
    lda    #$d9             ; 2
    sta    $ea              ; 3
    lda    #$01             ; 2
    sta    VDELP1           ; 3
    lda    #$3f             ; 2
    sta    switches         ; 3
    lda    #$01             ; 2
    sta    $ac              ; 3
    txa                     ; 2
    jsr    Lf58c            ; 6
    lda    $b7              ; 3
    sta    $ab              ; 3
    lda    $a9              ; 3
    sta    $aa              ; 3
    jsr    Lff9a            ; 6
    sta    $89              ; 3
    sta    $88              ; 3
    sta    $d8              ; 3
    sta    $da              ; 3
    lda    #$04             ; 2
    sta    $93              ; 3
Lfc4c:
    sta    SEG0_4           ; 4
    sta    SEG1_5           ; 4     4/5/2
    sta    SEG2_2           ; 4
    jmp    Lf000            ; 3

Lfc58:
    ldx    $8c              ; 3
    lda    $d810,x          ; 4
    sta    NUSIZ0           ; 3
    lda    $d800,x          ; 4
    ldx    $ac              ; 3
    cpx    #$c0             ; 2
    bne    Lfc6c            ; 2³
    lda    frameCnt         ; 3
    and    #$0f             ; 2
Lfc6c:
    sta    COLUP0           ; 3
    lda    $8f              ; 3
    sta    REFP0            ; 3
    ldy    $82              ; 3
    sta    WSYNC            ; 3
    sta    REFP0            ; 3
Lfc78:
    dey                     ; 2
    bpl    Lfc78            ; 2³
    sta    RESP1            ; 3
    sta    WSYNC            ; 3
    lda    $8d              ; 3
    ldx    #$00             ; 2
    jsr    HPosObject       ; 6     h-position P0
    sta    SEG0_0           ; 4     0/1/2
    sta    SEG1_1           ; 4
    jsr    Ld000            ; 6
    sta    SEG1_5           ; 4     0/5/2
    ldy    #$0f             ; 2
    ldx    player           ; 3
    lda    $be,x            ; 4
    and    #$40             ; 2
    beq    Lfc9e            ; 2³
    dey                     ; 2
    dey                     ; 2
Lfc9e:
    sta    WSYNC            ; 3
    lda    ($ad),y          ; 5
    dey                     ; 2
    sta    COLUP0           ; 3
    sta    COLUP0           ; 3
    sta    COLUP1           ; 3
    sta    HMCLR            ; 3
    lda    #$f0             ; 2
    sta    HMP0             ; 3
    lda    #$00             ; 2
    sta    HMP1             ; 3
    sta    REFP0            ; 3
    sta    REFP1            ; 3
    sta    RESP0            ; 3
    sta    RESP1            ; 3
    sta    WSYNC            ; 3
    sta    HMOVE            ; 3
    lda    ($ad),y          ; 5
    sta    COLUBK           ; 3
    ldy    #$da             ; 2
    ldx    #$0a             ; 2
    lda    #$72             ; 2
Lfcc9:
    sta    $c0,x            ; 4
    sty    $c1,x            ; 4
    dex                     ; 2
    dex                     ; 2
    bpl    Lfcc9            ; 2³
    lda    #$85             ; 2
    sta    TIM64T           ; 4     screen3
    lda    $ac              ; 3
    beq    Lfce2            ; 2³
    cmp    #$01             ; 2
    beq    Lfd49            ; 2³+1
    cmp    #$04             ; 2
    bne    Lfcf0            ; 2³
Lfce2:
    lda    game             ; 3
    cmp    #$04             ; 2
    bcc    Lfced            ; 2³
    ldx    #$01             ; 2
    jsr    SetScorePtrs     ; 6
Lfced:
    jmp    Lfd49            ; 3

Lfcf0:
    ldx    player           ; 3
    cmp    #$02             ; 2
    bne    Lfd10            ; 2³+1
    lda    $be,x            ; 4
    bpl    Lfd10            ; 2³+1
    lda    #$db             ; 2
    sta    $c0              ; 3
    lda    #$e4             ; 2
    sta    $c2              ; 3
    lda    #$ed             ; 2
    sta    $c4              ; 3
    lda    #$09             ; 2
    sta    $c6              ; 3
    lda    #$f6             ; 2
    sta    $c8              ; 3
    bne    Lfd49            ; 2³
Lfd10:
    lda    playerLst,x      ; 4
    and    #$0f             ; 2
    beq    Lfd20            ; 2³
    tay                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c8              ; 3
    lda    #$93             ; 2
    sta    $ca              ; 3
Lfd20:
    lda    playerLst,x      ; 4
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    tay                     ; 2
    dey                     ; 2
    lda    DigitOfsTbl,y    ; 4
    sta    $c0              ; 3
    lda    #$9c             ; 2
    sta    $c2              ; 3
    lda    $a9              ; 3
    beq    Lfd49            ; 2³
    bpl    Lfd41            ; 2³
    lda    #$78             ; 2
    sta    $c4              ; 3
    lda    #$81             ; 2
    sta    $c6              ; 3
    bne    Lfd49            ; 2³
Lfd41:
    lda    #$8a             ; 2
    sta    $c4              ; 3
    lda    #$6c             ; 2
    sta    $c6              ; 3
Lfd49:
    lda    INTIM            ; 4
    bmi    Lfd49            ; 2³
    sta    WSYNC            ; 3
    lda    #$03             ; 2
    sta    NUSIZ0           ; 3
    sta    NUSIZ1           ; 3
    sta    VDELP0           ; 3
    sta    VDELP1           ; 3
    jsr    Lf557            ; 6
    sta    SEG0_3           ; 4     3/5/6
    sta    SEG2_6           ; 4
    jmp    Lf800            ; 3

Lfd66:
    jmp    Lfc4c            ; 3

    .byte %00000000 ; $00 ; |        | $fd69
    .byte %00000000 ; $00 ; |        | $fd6a
    .byte %00001001 ; $09 ; |    X  X| $fd6b
    .byte %00000000 ; $00 ; |        | $fd6c
    .byte %00000000 ; $00 ; |        | $fd6d
    .byte %00000110 ; $06 ; |     XX | $fd6e
    .byte %00000101 ; $05 ; |     X X| $fd6f
    .byte %00000100 ; $04 ; |     X  | $fd70
    .byte %00000000 ; $00 ; |        | $fd71
    .byte %00000010 ; $02 ; |      X | $fd72
    .byte %00000000 ; $00 ; |        | $fd73
    .byte %00000001 ; $01 ; |       X| $fd74
    .byte %00000111 ; $07 ; |     XXX| $fd75
    .byte %00001000 ; $08 ; |    X   | $fd76
    .byte %00000101 ; $05 ; |     X X| $fd77
    .byte %00000000 ; $00 ; |        | $fd78
    .byte %00000010 ; $02 ; |      X | $fd79
    .byte %00000011 ; $03 ; |      XX| $fd7a
    .byte %00000000 ; $00 ; |        | $fd7b
    .byte %00000100 ; $04 ; |     X  | $fd7c
    .byte %00000001 ; $01 ; |       X| $fd7d
    .byte %00000111 ; $07 ; |     XXX| $fd7e
    .byte %00000101 ; $05 ; |     X X| $fd7f
    .byte %00000010 ; $02 ; |      X | $fd80
    .byte %00001000 ; $08 ; |    X   | $fd81
    .byte %00001011 ; $0b ; |    X XX| $fd82
    .byte %00000110 ; $06 ; |     XX | $fd83
    .byte %00000010 ; $02 ; |      X | $fd84
    .byte %00000011 ; $03 ; |      XX| $fd85
    .byte %00000001 ; $01 ; |       X| $fd86
    .byte %00000111 ; $07 ; |     XXX| $fd87
    .byte %00000000 ; $00 ; |        | $fd88
    .byte %00000100 ; $04 ; |     X  | $fd89
    .byte %00000010 ; $02 ; |      X | $fd8a
    .byte %00000011 ; $03 ; |      XX| $fd8b
    .byte %00000000 ; $00 ; |        | $fd8c
    .byte %00000001 ; $01 ; |       X| $fd8d
    .byte %00000111 ; $07 ; |     XXX| $fd8e
    .byte %00000100 ; $04 ; |     X  | $fd8f
    .byte %00000011 ; $03 ; |      XX| $fd90
    .byte %00000000 ; $00 ; |        | $fd91
    .byte %00000110 ; $06 ; |     XX | $fd92
    .byte %00001000 ; $08 ; |    X   | $fd93
    .byte %00000001 ; $01 ; |       X| $fd94
    .byte %00000010 ; $02 ; |      X | $fd95
    .byte %00000011 ; $03 ; |      XX| $fd96
    .byte %00000000 ; $00 ; |        | $fd97
    .byte %00000001 ; $01 ; |       X| $fd98
    .byte %00000111 ; $07 ; |     XXX| $fd99
    .byte %00000010 ; $02 ; |      X | $fd9a
    .byte %00000011 ; $03 ; |      XX| $fd9b
    .byte %00001000 ; $08 ; |    X   | $fd9c
    .byte %00000010 ; $02 ; |      X | $fd9d
    .byte %00000001 ; $01 ; |       X| $fd9e
    .byte %00000111 ; $07 ; |     XXX| $fd9f
    .byte %00000101 ; $05 ; |     X X| $fda0
    .byte %00000011 ; $03 ; |      XX| $fda1
    .byte %00000000 ; $00 ; |        | $fda2
    .byte %00001000 ; $08 ; |    X   | $fda3
    .byte %00000001 ; $01 ; |       X| $fda4
    .byte %00000000 ; $00 ; |        | $fda5
    .byte %00000100 ; $04 ; |     X  | $fda6
    .byte %00000010 ; $02 ; |      X | $fda7
    .byte %00000001 ; $01 ; |       X| $fda8
    .byte %00000111 ; $07 ; |     XXX| $fda9
    .byte %00000010 ; $02 ; |      X | $fdaa
    .byte %00001000 ; $08 ; |    X   | $fdab
    .byte %00000000 ; $00 ; |        | $fdac
    .byte %00000101 ; $05 ; |     X X| $fdad
    .byte %00000010 ; $02 ; |      X | $fdae
    .byte %00000011 ; $03 ; |      XX| $fdaf
    .byte %00000101 ; $05 ; |     X X| $fdb0
    .byte %00000001 ; $01 ; |       X| $fdb1
    .byte %00000111 ; $07 ; |     XXX| $fdb2
    .byte %00000100 ; $04 ; |     X  | $fdb3
    .byte %00000010 ; $02 ; |      X | $fdb4
    .byte %00000011 ; $03 ; |      XX| $fdb5
    .byte %00001011 ; $0b ; |    X XX| $fdb6
    .byte %00001000 ; $08 ; |    X   | $fdb7
    .byte %00000000 ; $00 ; |        | $fdb8
    .byte %00000100 ; $04 ; |     X  | $fdb9
    .byte %00000001 ; $01 ; |       X| $fdba
    .byte %00000111 ; $07 ; |     XXX| $fdbb
    .byte %00000110 ; $06 ; |     XX | $fdbc
    .byte %00000000 ; $00 ; |        | $fdbd
    .byte %00000011 ; $03 ; |      XX| $fdbe
    .byte %00000010 ; $02 ; |      X | $fdbf
    .byte %00000110 ; $06 ; |     XX | $fdc0
    .byte %00000000 ; $00 ; |        | $fdc1
    .byte %00000001 ; $01 ; |       X| $fdc2
    .byte %00000111 ; $07 ; |     XXX| $fdc3
    .byte %00000010 ; $02 ; |      X | $fdc4
    .byte %00000011 ; $03 ; |      XX| $fdc5
    .byte %00001000 ; $08 ; |    X   | $fdc6
    .byte %00000000 ; $00 ; |        | $fdc7
    .byte %00000001 ; $01 ; |       X| $fdc8
    .byte %00000111 ; $07 ; |     XXX| $fdc9
    .byte %00000110 ; $06 ; |     XX | $fdca
    .byte %00000101 ; $05 ; |     X X| $fdcb
    .byte %00000000 ; $00 ; |        | $fdcc
    .byte %00001000 ; $08 ; |    X   | $fdcd
    .byte %00000001 ; $01 ; |       X| $fdce
    .byte %00000000 ; $00 ; |        | $fdcf
    .byte %00000100 ; $04 ; |     X  | $fdd0
    .byte %00000010 ; $02 ; |      X | $fdd1
    .byte %00000000 ; $00 ; |        | $fdd2
    .byte %00000001 ; $01 ; |       X| $fdd3
    .byte %00000111 ; $07 ; |     XXX| $fdd4
    .byte %00001000 ; $08 ; |    X   | $fdd5
    .byte %00000000 ; $00 ; |        | $fdd6
    .byte %00000110 ; $06 ; |     XX | $fdd7
    .byte %00000010 ; $02 ; |      X | $fdd8
    .byte %00000011 ; $03 ; |      XX| $fdd9
    .byte %00000001 ; $01 ; |       X| $fdda
    .byte %00000111 ; $07 ; |     XXX| $fddb
    .byte %00000000 ; $00 ; |        | $fddc
    .byte %00001000 ; $08 ; |    X   | $fddd
    .byte %00000010 ; $02 ; |      X | $fdde
    .byte %00000011 ; $03 ; |      XX| $fddf
    .byte %00000000 ; $00 ; |        | $fde0
    .byte %00000101 ; $05 ; |     X X| $fde1
    .byte %00000100 ; $04 ; |     X  | $fde2
    .byte %00000101 ; $05 ; |     X X| $fde3
    .byte %00000010 ; $02 ; |      X | $fde4
    .byte %00000001 ; $01 ; |       X| $fde5
    .byte %00000111 ; $07 ; |     XXX| $fde6
    .byte %00000110 ; $06 ; |     XX | $fde7
    .byte %00000010 ; $02 ; |      X | $fde8
    .byte %00001000 ; $08 ; |    X   | $fde9
    .byte %00001011 ; $0b ; |    X XX| $fdea
    .byte %00000010 ; $02 ; |      X | $fdeb
    .byte %00000101 ; $05 ; |     X X| $fdec
    .byte %00000011 ; $03 ; |      XX| $fded
    .byte %00000001 ; $01 ; |       X| $fdee
    .byte %00000111 ; $07 ; |     XXX| $fdef
    .byte %00000000 ; $00 ; |        | $fdf0
    .byte %00000100 ; $04 ; |     X  | $fdf1
    .byte %00000010 ; $02 ; |      X | $fdf2
    .byte %00000011 ; $03 ; |      XX| $fdf3
    .byte %00000000 ; $00 ; |        | $fdf4
    .byte %00000001 ; $01 ; |       X| $fdf5
    .byte %00000111 ; $07 ; |     XXX| $fdf6
    .byte %00000100 ; $04 ; |     X  | $fdf7
    .byte %00001000 ; $08 ; |    X   | $fdf8
    .byte %00000000 ; $00 ; |        | $fdf9
    .byte %00000110 ; $06 ; |     XX | $fdfa
    .byte %00000000 ; $00 ; |        | $fdfb
    .byte %00000000 ; $00 ; |        | $fdfc
    .byte %00001001 ; $09 ; |    X  X| $fdfd
    .byte %00000000 ; $00 ; |        | $fdfe
    .byte %00000000 ; $00 ; |        | $fdff
    .byte %00000000 ; $00 ; |        | $fe00
    .byte %00001001 ; $09 ; |    X  X| $fe01
    .byte %00001001 ; $09 ; |    X  X| $fe02
    .byte %00001010 ; $0a ; |    X X | $fe03
    .byte %00000000 ; $00 ; |        | $fe04
    .byte %00000110 ; $06 ; |     XX | $fe05
    .byte %00000101 ; $05 ; |     X X| $fe06
    .byte %00000100 ; $04 ; |     X  | $fe07
    .byte %00000000 ; $00 ; |        | $fe08
    .byte %00000011 ; $03 ; |      XX| $fe09
    .byte %00000110 ; $06 ; |     XX | $fe0a
    .byte %00000001 ; $01 ; |       X| $fe0b
    .byte %00000111 ; $07 ; |     XXX| $fe0c
    .byte %00000100 ; $04 ; |     X  | $fe0d
    .byte %00000101 ; $05 ; |     X X| $fe0e
    .byte %00000000 ; $00 ; |        | $fe0f
    .byte %00001000 ; $08 ; |    X   | $fe10
    .byte %00000011 ; $03 ; |      XX| $fe11
    .byte %00000010 ; $02 ; |      X | $fe12
    .byte %00000110 ; $06 ; |     XX | $fe13
    .byte %00000001 ; $01 ; |       X| $fe14
    .byte %00000111 ; $07 ; |     XXX| $fe15
    .byte %00000101 ; $05 ; |     X X| $fe16
    .byte %00000110 ; $06 ; |     XX | $fe17
    .byte %00000000 ; $00 ; |        | $fe18
    .byte %00000010 ; $02 ; |      X | $fe19
    .byte %00001011 ; $0b ; |    X XX| $fe1a
    .byte %00000011 ; $03 ; |      XX| $fe1b
    .byte %00000000 ; $00 ; |        | $fe1c
    .byte %00000001 ; $01 ; |       X| $fe1d
    .byte %00000111 ; $07 ; |     XXX| $fe1e
    .byte %00000011 ; $03 ; |      XX| $fe1f
    .byte %00001000 ; $08 ; |    X   | $fe20
    .byte %00000110 ; $06 ; |     XX | $fe21
    .byte %00000000 ; $00 ; |        | $fe22
    .byte %00000011 ; $03 ; |      XX| $fe23
    .byte %00000001 ; $01 ; |       X| $fe24
    .byte %00000111 ; $07 ; |     XXX| $fe25
    .byte %00000000 ; $00 ; |        | $fe26
    .byte %00000010 ; $02 ; |      X | $fe27
    .byte %00000000 ; $00 ; |        | $fe28
    .byte %00000011 ; $03 ; |      XX| $fe29
    .byte %00000000 ; $00 ; |        | $fe2a
    .byte %00000010 ; $02 ; |      X | $fe2b
    .byte %00000100 ; $04 ; |     X  | $fe2c
    .byte %00000101 ; $05 ; |     X X| $fe2d
    .byte %00001000 ; $08 ; |    X   | $fe2e
    .byte %00000001 ; $01 ; |       X| $fe2f
    .byte %00000111 ; $07 ; |     XXX| $fe30
    .byte %00001000 ; $08 ; |    X   | $fe31
    .byte %00001011 ; $0b ; |    X XX| $fe32
    .byte %00000011 ; $03 ; |      XX| $fe33
    .byte %00000010 ; $02 ; |      X | $fe34
    .byte %00000001 ; $01 ; |       X| $fe35
    .byte %00000111 ; $07 ; |     XXX| $fe36
    .byte %00000101 ; $05 ; |     X X| $fe37
    .byte %00001000 ; $08 ; |    X   | $fe38
    .byte %00000110 ; $06 ; |     XX | $fe39
    .byte %00000011 ; $03 ; |      XX| $fe3a
    .byte %00000001 ; $01 ; |       X| $fe3b
    .byte %00000000 ; $00 ; |        | $fe3c
    .byte %00000011 ; $03 ; |      XX| $fe3d
    .byte %00000110 ; $06 ; |     XX | $fe3e
    .byte %00000001 ; $01 ; |       X| $fe3f
    .byte %00000111 ; $07 ; |     XXX| $fe40
    .byte %00000100 ; $04 ; |     X  | $fe41
    .byte %00000001 ; $01 ; |       X| $fe42
    .byte %00000000 ; $00 ; |        | $fe43
    .byte %00000101 ; $05 ; |     X X| $fe44
    .byte %00000011 ; $03 ; |      XX| $fe45
    .byte %00000010 ; $02 ; |      X | $fe46
    .byte %00000101 ; $05 ; |     X X| $fe47
    .byte %00000001 ; $01 ; |       X| $fe48
    .byte %00000111 ; $07 ; |     XXX| $fe49
    .byte %00000101 ; $05 ; |     X X| $fe4a
    .byte %00000110 ; $06 ; |     XX | $fe4b
    .byte %00000000 ; $00 ; |        | $fe4c
    .byte %00000010 ; $02 ; |      X | $fe4d
    .byte %00000000 ; $00 ; |        | $fe4e
    .byte %00000011 ; $03 ; |      XX| $fe4f
    .byte %00001000 ; $08 ; |    X   | $fe50
    .byte %00000001 ; $01 ; |       X| $fe51
    .byte %00000111 ; $07 ; |     XXX| $fe52
    .byte %00000011 ; $03 ; |      XX| $fe53
    .byte %00001000 ; $08 ; |    X   | $fe54
    .byte %00000110 ; $06 ; |     XX | $fe55
    .byte %00000000 ; $00 ; |        | $fe56
    .byte %00000101 ; $05 ; |     X X| $fe57
    .byte %00000010 ; $02 ; |      X | $fe58
    .byte %00000001 ; $01 ; |       X| $fe59
    .byte %00000111 ; $07 ; |     XXX| $fe5a
    .byte %00001011 ; $0b ; |    X XX| $fe5b
    .byte %00000000 ; $00 ; |        | $fe5c
    .byte %00000011 ; $03 ; |      XX| $fe5d
    .byte %00000000 ; $00 ; |        | $fe5e
    .byte %00000001 ; $01 ; |       X| $fe5f
    .byte %00000111 ; $07 ; |     XXX| $fe60
    .byte %00000010 ; $02 ; |      X | $fe61
    .byte %00000101 ; $05 ; |     X X| $fe62
    .byte %00000011 ; $03 ; |      XX| $fe63
    .byte %00001000 ; $08 ; |    X   | $fe64
    .byte %00000011 ; $03 ; |      XX| $fe65
    .byte %00000101 ; $05 ; |     X X| $fe66
    .byte %00000110 ; $06 ; |     XX | $fe67
    .byte %00000000 ; $00 ; |        | $fe68
    .byte %00000011 ; $03 ; |      XX| $fe69
    .byte %00000001 ; $01 ; |       X| $fe6a
    .byte %00000111 ; $07 ; |     XXX| $fe6b
    .byte %00000000 ; $00 ; |        | $fe6c
    .byte %00000010 ; $02 ; |      X | $fe6d
    .byte %00001000 ; $08 ; |    X   | $fe6e
    .byte %00000011 ; $03 ; |      XX| $fe6f
    .byte %00000000 ; $00 ; |        | $fe70
    .byte %00000001 ; $01 ; |       X| $fe71
    .byte %00000111 ; $07 ; |     XXX| $fe72
    .byte %00000101 ; $05 ; |     X X| $fe73
    .byte %00000000 ; $00 ; |        | $fe74
    .byte %00000011 ; $03 ; |      XX| $fe75
    .byte %00000010 ; $02 ; |      X | $fe76
    .byte %00000100 ; $04 ; |     X  | $fe77
    .byte %00000101 ; $05 ; |     X X| $fe78
    .byte %00001000 ; $08 ; |    X   | $fe79
    .byte %00000010 ; $02 ; |      X | $fe7a
    .byte %00000000 ; $00 ; |        | $fe7b
    .byte %00000001 ; $01 ; |       X| $fe7c
    .byte %00000111 ; $07 ; |     XXX| $fe7d
    .byte %00000100 ; $04 ; |     X  | $fe7e
    .byte %00000011 ; $03 ; |      XX| $fe7f
    .byte %00000010 ; $02 ; |      X | $fe80
    .byte %00000110 ; $06 ; |     XX | $fe81
    .byte %00000000 ; $00 ; |        | $fe82
    .byte %00000101 ; $05 ; |     X X| $fe83
    .byte %00001000 ; $08 ; |    X   | $fe84
    .byte %00000001 ; $01 ; |       X| $fe85
    .byte %00000111 ; $07 ; |     XXX| $fe86
    .byte %00001000 ; $08 ; |    X   | $fe87
    .byte %00000000 ; $00 ; |        | $fe88
    .byte %00000011 ; $03 ; |      XX| $fe89
    .byte %00001011 ; $0b ; |    X XX| $fe8a
    .byte %00000010 ; $02 ; |      X | $fe8b
    .byte %00000001 ; $01 ; |       X| $fe8c
    .byte %00000111 ; $07 ; |     XXX| $fe8d
    .byte %00000110 ; $06 ; |     XX | $fe8e
    .byte %00000000 ; $00 ; |        | $fe8f
    .byte %00000100 ; $04 ; |     X  | $fe90
    .byte %00000011 ; $03 ; |      XX| $fe91
    .byte %00000010 ; $02 ; |      X | $fe92
Lfe93:
    .byte %00000000 ; $00 ; |        | $fe93
    .byte %00001001 ; $09 ; |    X  X| $fe94
    .byte %00000000 ; $00 ; |        | $fe95
    .byte %00001100 ; $0c ; |    XX  | $fe96
    .byte %00010000 ; $10 ; |   X    | $fe97
Lfe98:
    .byte %00101000 ; $28 ; |  X X   | $fe98
    .byte %00010110 ; $16 ; |   X XX | $fe99
    .byte %00011110 ; $1e ; |   XXXX | $fe9a
    .byte %00010100 ; $14 ; |   X X  | $fe9b
    .byte %00000010 ; $02 ; |      X | $fe9c
    .byte %00000100 ; $04 ; |     X  | $fe9d
    .byte %00000010 ; $02 ; |      X | $fe9e
    .byte %00001000 ; $08 ; |    X   | $fe9f
    .byte %00000000 ; $00 ; |        | $fea0
Lfea1:
    .byte %01000011 ; $43 ; | X    XX| $fea1
    .byte %11000001 ; $c1 ; |XX     X| $fea2
    .byte %11010111 ; $d7 ; |XX X XXX| $fea3
    .byte %11110010 ; $f2 ; |XXXX  X | $fea4
    .byte %00111010 ; $3a ; |  XXX X | $fea5
    .byte %01100100 ; $64 ; | XX  X  | $fea6
    .byte %10100110 ; $a6 ; |X X  XX | $fea7
    .byte %11011110 ; $de ; |XX XXXX | $fea8
    .byte %11110011 ; $f3 ; |XXXX  XX| $fea9
    .byte %11111000 ; $f8 ; |XXXXX   | $feaa
Lfeab:
    .byte %00111111 ; $3f ; |  XXXXXX| $feab
    .byte %01101110 ; $6e ; | XX XXX | $feac
    .byte %10000010 ; $82 ; |X     X | $fead
    .byte %10001100 ; $8c ; |X   XX  | $feae
    .byte %10010001 ; $91 ; |X  X   X| $feaf
    .byte %10010001 ; $91 ; |X  X   X| $feb0
Lfeb1:
    .byte %00000000 ; $00 ; |        | $feb1
    .byte %00000100 ; $04 ; |     X  | $feb2
    .byte %11110110 ; $f6 ; |XXXX XX | $feb3
    .byte %00001000 ; $08 ; |    X   | $feb4
    .byte %11111000 ; $f8 ; |XXXXX   | $feb5
    .byte %00001010 ; $0a ; |    X X | $feb6
Lfeb7:
    .byte %00100010 ; $22 ; |  X   X | $feb7
    .byte %00100011 ; $23 ; |  X   XX| $feb8
    .byte %00100100 ; $24 ; |  X  X  | $feb9
    .byte %00100101 ; $25 ; |  X  X X| $feba
    .byte %00100110 ; $26 ; |  X  XX | $febb
    .byte %00101000 ; $28 ; |  X X   | $febc
Lfebd:
    .byte %00000000 ; $00 ; |        | $febd
    .byte %00000011 ; $03 ; |      XX| $febe
    .byte %00001000 ; $08 ; |    X   | $febf
    .byte %00010000 ; $10 ; |   X    | $fec0
    .byte %00111000 ; $38 ; |  XXX   | $fec1
    .byte %10000000 ; $80 ; |X       | $fec2

DigitOfsTbl:
    .byte $12 ; $fec3
    .byte $1b ;
    .byte $24 ;
    .byte $2d ;
    .byte $36 ;
    .byte $3f ;
    .byte $48 ;
    .byte $51 ;
    .byte $5a ;
    .byte $63 ;

HPosObject SUBROUTINE
    tay                     ; 2
    and    #$0f             ; 2
    sta    $f2              ; 3
    tya                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    tay                     ; 2
    clc                     ; 2
    adc    $f2              ; 3
    cmp    #$0f             ; 2
    bcc    Lfee2            ; 2³
    sbc    #$0f             ; 2
    iny                     ; 2
Lfee2:
    eor    #$07             ; 2
    sta    WSYNC            ; 3
    sta    HMCLR            ; 3
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    sta    HMP0,x           ; 4
Lfeee:
    dey                     ; 2
    bpl    Lfeee            ; 2³
    sta    RESP0,x          ; 4
    sta    WSYNC            ; 3
    sta    HMOVE            ; 3
    rts                     ; 6

SwitchPlayers SUBROUTINE
    ldx    $b7              ; 3
    lda    $ab              ; 3
    sta    $b7              ; 3
    stx    $ab              ; 3
    ldx    $a9              ; 3
    lda    $aa              ; 3
    sta    $a9              ; 3
    stx    $aa              ; 3
    lda    #$00             ; 2
    sta    $ec              ; 3
    lda    player           ; 3
    eor    #$01             ; 2
    sta    player           ; 3
    rts                     ; 6

AddScore SUBROUTINE
    sed                     ; 2
    clc                     ; 2
    ldx    player           ; 3
    lda    scoreLo,x        ; 4
    adc    $c0              ; 3
    sta    scoreLo,x        ; 4
    lda    scoreMid,x       ; 4
    adc    $c2              ; 3
    sta    scoreMid,x       ; 4
    bcc    .exit            ; 2³
    lda    scoreHi,x        ; 4
    adc    #$00             ; 2
    sta    scoreHi,x        ; 4
    lda    playerLst,x      ; 4
    cmp    #$90             ; 2     up to nine extra lives
    bcs    .exit            ; 2³
    adc    #$10             ; 2
    sta    playerLst,x      ; 4
    ldy    #$15             ; 2
    jsr    Lff43            ; 6
    ldy    #$16             ; 2
    jsr    Lff43            ; 6
.exit:
    cld                     ; 2
    lda    #$00             ; 2
    rts                     ; 6

Lff43:
    ldx    #$00             ; 2
    lda    $cc              ; 3
    cmp    $cd              ; 3
    bcc    Lff4c            ; 2³
    inx                     ; 2
Lff4c:
    tya                     ; 2
    cmp    $cc,x            ; 4
    bcc    Lff5f            ; 2³
    beq    Lff5f            ; 2³
    sty    $cc,x            ; 4
    lda    Lff60,y          ; 4
    sta    $ce,x            ; 4
    lda    Lff77,y          ; 4
    sta    $d0,x            ; 4
Lff5f:
    rts                     ; 6

Lff60:
    .byte %00000000 ; $00 ; |        | $ff60
    .byte %11001000 ; $c8 ; |XX  X   | $ff61
    .byte %10001000 ; $88 ; |X   X   | $ff62
    .byte %10001000 ; $88 ; |X   X   | $ff63
    .byte %00110000 ; $30 ; |  XX    | $ff64
    .byte %00111010 ; $3a ; |  XXX X | $ff65
    .byte %10001100 ; $8c ; |X   XX  | $ff66
    .byte %11111111 ; $ff ; |XXXXXXXX| $ff67
    .byte %00111000 ; $38 ; |  XXX   | $ff68
    .byte %11101111 ; $ef ; |XXX XXXX| $ff69
    .byte %01001111 ; $4f ; | X  XXXX| $ff6a
    .byte %10001100 ; $8c ; |X   XX  | $ff6b
    .byte %10001000 ; $88 ; |X   X   | $ff6c
    .byte %10001110 ; $8e ; |X   XXX | $ff6d
    .byte %10001111 ; $8f ; |X   XXXX| $ff6e
    .byte %01110000 ; $70 ; | XXX    | $ff6f
    .byte %11000100 ; $c4 ; |XX   X  | $ff70
    .byte %00110000 ; $30 ; |  XX    | $ff71
    .byte %11001101 ; $cd ; |XX  XX X| $ff72
    .byte %00101111 ; $2f ; |  X XXXX| $ff73
    .byte %10001111 ; $8f ; |X   XXXX| $ff74
    .byte %11000000 ; $c0 ; |XX      | $ff75
    .byte %11001111 ; $cf ; |XX  XXXX| $ff76
Lff77:
    .byte %00000000 ; $00 ; |        | $ff77
    .byte %00111000 ; $38 ; |  XXX   | $ff78
    .byte %01001000 ; $48 ; | X  X   | $ff79
    .byte %00100001 ; $21 ; |  X    X| $ff7a
    .byte %10001000 ; $88 ; |X   X   | $ff7b
    .byte %11111111 ; $ff ; |XXXXXXXX| $ff7c
    .byte %00100111 ; $27 ; |  X  XXX| $ff7d
    .byte %00110000 ; $30 ; |  XX    | $ff7e
    .byte %01000000 ; $40 ; | X      | $ff7f
    .byte %01100111 ; $67 ; | XX  XXX| $ff80
    .byte %00101000 ; $28 ; |  X X   | $ff81
    .byte %10000000 ; $80 ; |X       | $ff82
    .byte %00100011 ; $23 ; |  X   XX| $ff83
    .byte %10100100 ; $a4 ; |X X  X  | $ff84
    .byte %11000100 ; $c4 ; |XX   X  | $ff85
    .byte %01100100 ; $64 ; | XX  X  | $ff86
    .byte %01011111 ; $5f ; | X XXXXX| $ff87
    .byte %10101000 ; $a8 ; |X X X   | $ff88
    .byte %10001000 ; $88 ; |X   X   | $ff89
    .byte %11000100 ; $c4 ; |XX   X  | $ff8a
    .byte %11101010 ; $ea ; |XXX X X | $ff8b
    .byte %10000000 ; $80 ; |X       | $ff8c
    .byte %10001111 ; $8f ; |X   XXXX| $ff8d

Lff8e:
    lda    $eb              ; 3
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    asl                     ; 2
    sec                     ; 2
    adc    $eb              ; 3
    sta    $eb              ; 3
    rts                     ; 6

Lff9a:
    lda    #$49             ; 2
    sta    $a1              ; 3
    sta    $a2              ; 3
    lda    #$00             ; 2
    ldx    #$06             ; 2
Lffa4:
    dex                     ; 2
    sta    scoreLst,x       ; 4
    sta    $ca,x            ; 4
    beq    Lffad            ; 2³
    bpl    Lffa4            ; 2³
Lffad:
    sta    player           ; 3
    rts                     ; 6

Lffb0:
    jsr    Lff8e            ; 6
    lda    $b7              ; 3
    lsr                     ; 2
    lsr                     ; 2
    lsr                     ; 2
    sta    $f5              ; 3
    lda    $a9              ; 3
    bpl    Lffc3            ; 2³
    eor    #$ff             ; 2
    clc                     ; 2
    adc    #$01             ; 2
Lffc3:
    clc                     ; 2
    adc    $f5              ; 3
    and    #$07             ; 2
    tax                     ; 2
    lda    $d81a,x          ; 4
    cmp    $eb              ; 3
    rts                     ; 6

  IF PAL = 0
    .byte "Ewok Adventure PAL Hack-(C)2001 Th. Jentzsch"
  ENDIF

    ORG     $effc,0
    RORG    $fffc

    .byte $00,$fc,$ff,$ff
