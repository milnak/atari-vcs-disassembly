;  POLE POSITION

SWCHA     EQU     $280  ;PO, P1 JOYSTICKS
SWCHB     EQU     $282  ;CONSOLE SWITCHES
CTLSWA    EQU     $281
CTLSWB    EQU     $283
INTIM     EQU     $284  ;INTERVAL TIMER IN
TIM8T     EQU     $295  ;TIMER 8T WRITE OUT
TIM64T    EQU     $296  ;TIMER 64T WRITE OUT
VSYNC     EQU     $00      ;BIT        1  VERTICAL SYNC SET-CLR
VBLANK    EQU     $01      ;BIT        1  VERTICAL BLANK SET-CLR
WSYNC     EQU     $02      ;STROBE        WAIT FOR HORIZ BLANK
RSYNC     EQU     $03      ;STROBE        RESET HORIZ SYNC COUNTER
NUSIZ0    EQU     $04      ;BITS   54 210 NUMBER-SIZE PLAYER/MISSILE 0
NUSIZ1    EQU     $05      ;BITS   54 210 NUMBER-SIZE PLAYER/MISSILE 1
COLUP0    EQU     $06      ;BITS 7654321  COLOR(4)-LUM(3) PLAYER 0
COLUP1    EQU     $07      ;BITS 7654321  COLOR(4)-LUM(3) PLAYER 1
COLUPF    EQU     $08      ;BITS 7654321  COLOR(4)-LUM(3) PLAYFIELD
COLUBK    EQU     $09      ;BITS 7654321  COLOR(4)-LUM(3) BACKGROUND
CTRLPF    EQU     $0A      ;BITS 7 54 210 PLAYFIELD CONTROL
REFP0     EQU     $0B      ;BIT      3    REFLECT PLAYER 0
REFP1     EQU     $0C      ;BIT      3    REFLECT PLAYER 1
PF0       EQU     $0D      ;BITS 7654     PLAYFIELD REG BYTE 0
PF1       EQU     $0E      ;BITS ALL      PLAYFIELD REG BYTE 1
PF2       EQU     $0F      ;BITS ALL      PLAYFIELD REG BYTE 2
RESP0     EQU     $10      ;STROBE        RESET PLAYER 0
RESP1     EQU     $11      ;STROBE        RESET PLAYER 1
RESM0     EQU     $12      ;STROBE        RESET MISSILE 0
RESM1     EQU     $13      ;STROBE        RESET MISSILE 1
RESBL     EQU     $14      ;STROBE        RESET BALL
AUDC0     EQU     $15      ;BITS     3210 AUDIO CONTROL 0
AUDC1     EQU     $16      ;BITS     3210 AUDIO CONTROL 1
AUDF0     EQU     $17      ;BITS     3210 AUDIO FREQUENCY 0
AUDF1     EQU     $18      ;BITS     3210 AUDIO FREQUENCY 1
AUDV0     EQU     $19      ;BITS     3210 AUDIO VOLUME 0
AUDV1     EQU     $1A      ;BITS     3210 AUDIO VOLUME 1
GRP0      EQU     $1B      ;BITS ALL      GRAPHICS FOR PLAYER 0
GRP1      EQU     $1C      ;BITS ALL      GRAPHICS FOR PLAYER 1
ENAM0     EQU     $1D      ;BIT        1  ENABLE MISSILE 0
ENAM1     EQU     $1E      ;BIT        1  ENABLE MISSILE 1
ENABL     EQU     $1F      ;BIT        1  ENABLE BALL
HMP0      EQU     $20      ;BITS 7654     HORIZ MOTION PLAYER 0
HMP1      EQU     $21      ;BITS 7654     HORIZ MOTION PLAYER 1
HMM0      EQU     $22      ;BITS 7654     HORIZ MOTION MISSILE 0
HMM1      EQU     $23      ;BITS 7654     HORIZ MOTION MISSILE 1
HMBL      EQU     $24      ;BITS 7654     HORIZ MOTION BALL
VDELP0    EQU     $25      ;BIT         0 VERTICAL DELAY PLAYER 0
VDELP1    EQU     $26      ;BIT         0 VERTICAL DELAY PLAYER 1
VDELBL    EQU     $27      ;BIT         0 VERTICAL DELAY BALL
RESMP0    EQU     $28      ;BIT        1  RESET MISSILE TO PLAYER 0
RESMP1    EQU     $29      ;BIT        1  RESET MISSILE TO PLAYER 1
HMOVE     EQU     $2A      ;STROBE        ACT ON HORIZ MOTION
HMCLR     EQU     $2B      ;STROBE        CLEAR ALL HM REGISTERS
CXCLR     EQU     $2C      ;STROBE        CLEAR ALL COLLISION LATCHES
CXM0P     EQU     $30           ;READ ADDRESSES BITS 6 + 7 ONLY
CXM1P     EQU     $31
CXP0FB    EQU     $32
CXP1FB    EQU     $33
CXM0FB    EQU     $34
CXM1FB    EQU     $35
CXBLPF    EQU     $36
CXPPMM    EQU     $37
INPT0     EQU     $38
INPT1     EQU     $39
INPT2     EQU     $3A
INPT3     EQU     $3B
INPT4     EQU     $3C                    ;PLAYER-0 TRIGGER
INPT5     EQU     $3D                    ;PLAYER-1 TRIGGER

;   RAM TABLE

RBORDER   EQU     $50
ROADCENT  EQU     $56

          ORG     $80
CAR1PTR   DS      2
ROADX     DS      1
LEFTEDGE  DS      1
LEFTEDG2  DS      1                      ;BUFFERED COPY OF LEFTEDGE
GEAR      DS      1
CARY      DS      1
CARYH     DS      1
VEL       DS      1
CAR1Y     DS      1                      ;0=TOP OF SCREEN,$27=BOTTOM
PER       DS      1
ROADTOT   DS      1
BEND      DS      50
ZERX      DS      1                      ;COMBINE WITH BLLEX, MISEX, AND SHFTREG
SHFTREG   DS      1
CHUNK     DS      24
CAR1X     DS      1
CAR1GR    DS      1
CAR1MASK  DS      1
POS       DS      1
TIMER     DS      1
TIMER2    DS      1
TIMER3    DS      1
                                         ;LAST KILLED
PSCORE0   DS      1                      ;SCORE FOR PLAYER 0
PSCORE1   DS      1
PSCORE2   DS      1
PASSEDCS  DS      1                      ;NUMBER OF PASSED CARS
FRMCNT    DS      1
CAR1OFF   DS      1
NEXTNUSZ  DS      1
RTLEFT    DS      1                      ;BIT 7 LANE FOR CAR1 ,BIT 6=LANE CHANGE
                                         ;IN PROGRESS, BIT6=BUTTON DEBOUNCE

LNCHSEQ   DS      1                      ;LANE CHANGE SEQUENCE
VELC1     DS      1                      ;CAR1 VELOCITY
MOVEC1CT  DS      1                      ;MOD COUNTER FOR CHANGING CAR1Y
DPER      DS      1
NOTE      DS      1
DURATION  DS      1
PTR0      DS      1                      ;*
PTR0H     DS      1                      ;*
PTR1      DS      1                      ;*
PTR1H     DS      1                      ;*
PTR2      DS      1
PTR2H     DS      1
PTR3      DS      1
PTR3H     DS      1
PTR4      DS      1
PTR4H     DS      1
PTR5      DS      1
PTR5H     DS      1
TEMPX     DS      1
TEMPY     DS      1
TEMPZ     DS      1
VELOFRAC  DS      1
DDPER     DS      1
MISC      DS      1
QUALED    DS      1
ENDZERO   DS      0

LINECOLR  EQU     PTR0
DASHENA   EQU     PTR1
CARCOLOR  EQU     PTR2
CARGRAPH  EQU     PTR3
CARPF     EQU     PTR4

MULT      EQU     PTR0
ROADPOS   EQU     PTR1
ACCUM     EQU     PTR2
TEMP3     EQU     PTR3
TEMP2     EQU     PTR3H
ADDER     EQU     PTR4
STACK     EQU     PTR5H
TEMP4     EQU     TEMPY
TEMP1     EQU     TEMPX
ROWCNT    EQU     TEMP2
CUMHMOVE  EQU     TEMP3
HOLD1     EQU     DURATION
HOLD2     EQU     VELC1

;   START OF EXECUTABLE CODE
          ORG     $F000                  ;SET UP FOR 4K
          NOP
          NOP
          NOP
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@    INITIALIZATION     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
START     SEI                            ;DISABLE INTERRUPTS
          CLD                            ;CLEAR DECIMAL MODE
          LDX     #STACK                ;SET STACK
          TXS
          LDA     #0
          TAX
LOOP      STA     $02,X                  :ZERO OUT RAM, ALL OF ZERO PAGE EXCEPT
          DEX                            ;   0, 1, AND 2
          BNE     LOOP

          DEX
          STX     NOTE
          JSR     SWTCHS
          LDA     #$40                   ;NO END MUSIC
          STA     QUALED

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@    VBLANK     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

VBLNK     LDA     #2                     ;TURN VSYNC ON
          STA     WSYNC
          STA     VSYNC
          STA     VBLANK

SKIDNOIS  LDA     NOTE
          CMP     #$FF
          BNE     NONOISE
          LDA     GEAR
          AND     #$10
          BEQ     ZEROSKID
          LDA     FRMCNT
          AND     #$F
          TAX
          LDA     SKIDSOUN,X
          STA     AUDF0
          LDA     #$4
          STA     AUDC0
          LDA     #$8
ZEROSKID  STA     AUDV0
NONOISE
          STA     WSYNC
          STA     WSYNC                  ;FOUR LINES NEEDED BEFORE TURNING OFF
          LDA     FRMCNT
          LSR     A
          LDA     #$2C                   ;DOUG!!!!!!!!!!!!!!!!!!!!
          LDX     #48
          STX     TEMP1
          STA     WSYNC                  ;   VBLANK
          STX     VSYNC
          STA     TIM64T                 ;START VBLANK TIMER

          BCC     EVENVBLA

          JSR     RTORLEFT

          BMI     BENDR2
          STA     TEMPZ
          JSR     CURVELP

FALLOUT   LDA     #ROADCENT
          SEC
          SBC     ROADTOT
          CMP     #$11
          BCC     XYZZY1
          ADC     #$10
XYZZY1    TAY
          LDA     FINECORS,Y
          STA     ROADX
          LDA     #ROADCENT-16
          SEC
          SBC     ROADTOT                ;ALL THIS IS VERY WRONG
          BPL     LOK
          LDA     #0
LOK       LSR     A
          STA     LEFTEDGE
          STA     LEFTEDG2
          BPL     JGOKERN

BENDR2    AND     #$7F
          STA     TEMPZ
          JSR     CURVELPR
FALLOUTR  LDA     #ROADCENT
          CLC
          ADC     ROADTOT
          CMP     #$11
          BCC     XYZZY2
          ADC     #$10
XYZZY2    TAY
          LDA     FINECORS,Y
          STA     ROADX
          LDA     #$4A
          ADC     ROADTOT                ;ALL THIS IS VERY WRONG
          LSR     A
          STA     LEFTEDGE
          STA     LEFTEDG2
JGOKERN   JMP     GOKERN

EVENVBLA  LDA     LEFTEDG2
          STA     LEFTEDGE

MOVECAR1  LDA     CARYH
          BEQ     CMP35
          CMP     #20
          BCS     CMP35

          CMP     #1
          BNE     RMC1

          LDA     CARY
          CMP     #$40
          BCC     CMP35

RMC1      LDA     TIMER
          BEQ     CMP35
          CMP     #$90
          BEQ     CMP35

          LDA     CARY
          BNE     RRRMC1

          LDA     CARYH
          AND     #$03
          BNE     RRRMC1

CMP35     LDA     CAR1Y
          CMP     #$35
          BEQ     JDOCAR1X

RRRMC1    DEC     MOVEC1CT
          BPL     JDOCAR1X

          LDA     #1
          STA     TEMP1

          LDA     VEL
          SEC
          SBC     VELC1
          BCS     CLOSING3

          DEC     TEMP1

          EOR     #$FF
          ADC     #1                     ;CARRY CLEAR FROM ABOVE

CLOSING3  STA     TEMP2

          LDX     #6

CKRANGE   CMP     RANGETBL,X
          BCS     FOUNDRN

          DEX
          BPL     CKRANGE

FOUNDRN   LDA     TEMP2
          BEQ     DOCAR1X

          LDA     SPEEDTBL,X

          LDY     CAR1Y
          CPY     #35
          BCS     STAMC1CT

          STA     TEMP2

          TYA
          LDY     #7

CMPITN    CMP     TOPZNTBL-1,Y
          BCC     FOUNDTZN

          DEY
          BNE     CMPITN

FOUNDTZN  STY     TEMP3
          LDA     TEMP2
          CLC
          ADC     TEMP3

STAMC1CT  STA     MOVEC1CT

          LDA     CAR1Y
          LDX     #3

          CMP     #$32
          BCC     CMPDY

          LDA     RTLEFT
          AND     #$3F
          BIT     PER
          BMI     PTC1RT
          ORA     #$80
PTC1RT    STA     RTLEFT
          LDA     CAR1Y

CMPDY     CMP     DYZN,X
          BCS     FNYZN

          DEX
          BPL     CMPDY

FNYZN     LDA     TEMP1
          BNE     CLOSE

DECAG     DEC     CAR1Y
          DEX
          BPL     DECAG

          LDA     CAR1Y
          BPL     JDOCAR1X

          LDA     #$35
          STA     CAR1Y

          BIT     RTLEFT
          BVC     DOCAR1X
          LDA     RTLEFT
          EOR     #$C0
          STA     RTLEFT                 ;STOP LANE CHANGE ON OFF SCREEN
JDOCAR1X  JMP     DOCAR1X

CLOSE     INC     CAR1Y
          DEX
          BPL     CLOSE

          LDA     CAR1Y
          CMP     #$35
          BCC     DOCAR1X

          INC     PASSEDCS

          LDA     FRMCNT
          LSR     A
          LSR     A
          STA     VELC1

          LDA     #0
          STA     CAR1Y

          LDA     FRMCNT
          AND     #$80
          STA     RTLEFT


DOCAR1X
          LDA     CAR1Y
          STA     CAR1PTR

          LDX     #5

CKYZN     CMP     YZN,X
          BCS     FOUNDYZN

          DEX
          BPL     CKYZN

FOUNDYZN  CLC
          ADC     STAMPZN,X
          STA     CAR1PTR

          LDA     #H(STAMP1)
          ADC     HSTAMP,X               ;CARRY IS MEANINGFUL
          STA     CAR1PTR+1

          LDA     CAROFF,X
          STA     CAR1OFF

          LDA     NEXTNZ,X
          STA     NEXTNUSZ

          JSR     RTORLEFT

          BMI     RIGHT

          LDA     #ROADCENT
          SEC
          SBC     ROADTOT
          BMI     DO10
          CMP     #8
          BCS     ADDUPHM

DO10      LDA     #$10
          BPL     ADDUPHM

RIGHT     LDA     #ROADCENT
          CLC
          ADC     ROADTOT

ADDUPHM
          STA     CAR1X
          LDA     #0
          STA     CUMHMOVE

          LDA     #50
          SEC
          SBC     CAR1Y

          TAX
          TAY
          INY

          CMP     #50
          BNE     DOITYETA

          LDA     #0
          BEQ     EORFF


DOITYETA  LDA     BEND,X
          STA     TEMPX
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          BIT     TEMPX
          BPL     ADDIT

          ORA     #$F0

ADDIT     CLC
          ADC     CUMHMOVE
          STA     CUMHMOVE

          INX
          CPX     #50
          BNE     DOITYETA

EORFF     EOR     #$FF
          CLC
          ADC     #1

          ASL     A                      ;DOUBLE HMOVE VALUE

          CLC
          ADC     CAR1X
          CLC
          ADC     CAR1OFF

STAC1X    STA     CAR1X                  ;CAR1X=CENTER OF ROAD

CKRTL     BIT     RTLEFT
          BVS     LNCH

          LDA     CARYH
          CMP     #4
          BCC     JDOWCALC

          LSR     A
          LSR     A
          TAX

          LDA     FRMCNT
          ADC     PSCORE0
          ADC     TIMER3
          ADC     PER
          AND     RTLNCH-1,X
          BNE     DOWCALC

          LDA     CAR1Y
          CMP     #$0E
          BCS     DOWCALC

          LDA     RTLEFT
          ORA     #$40
          STA     RTLEFT

          BMI     LTTORT

          LDA     #4                     ;RIGHT TO LEFT LANE CHANGE
          STA     LNCHSEQ
          BPL     LNCH

LTTORT    LDA     #-4                    ;LEFT TO RIGHT LANE CHANGE
          STA     LNCHSEQ

LNCH      LDA     FRMCNT
          AND     #$07
          BNE     DOLNCH

          LDA     CAR1Y
          CMP     #2
          BCS     BITRT

          LDA     RTLEFT
          EOR     #$40
          STA     RTLEFT

JDOWCALC  JMP     DOWCALC

BITRT     BIT     RTLEFT
          BMI     LEFTTORT

          DEC     LNCHSEQ
          LDA     LNCHSEQ
          CMP     #-4
          BNE     DOLNCH

DONELNCH  LDA     RTLEFT
          EOR     #$C0
          STA     RTLEFT
          JMP     DOWCALC

LEFTTORT  INC     LNCHSEQ
          LDA     LNCHSEQ
          CMP     #4
          BEQ     DONELNCH

DOLNCH    LDA     WIDTH,Y
          LSR     A
          LSR     A
          STA     TEMP2

          LDX     LNCHSEQ
          BPL     DOADD

          EOR     #$FF
          CLC
          ADC     #1
          STA     TEMP2

          TXA
          EOR     #$FF
          CLC
          ADC     #1
          TAX

DOADD     BEQ     DONEWADD

          LDA     CAR1X
ADDLOOP   CLC
          ADC     TEMP2
          DEX
          BNE     ADDLOOP

          STA     CAR1X
DONEWADD  LDA     CAR1X
          JMP     CKBOUNDS

DOWCALC   LDA     #50
          SEC
          SBC     CAR1Y
          TAY

          LDA     CAR1X
          LDX     RTLEFT
          BMI     DOLEFT

          CLC                            ;RIGHT LANE
          ADC     WIDTH,Y
          STA     CAR1X
          JMP     CKBOUNDS

DOLEFT    SEC
          SBC     WIDTH,Y
          STA     CAR1X

CKBOUNDS  LDX     #$FF
          STX     CAR1MASK

          LDX     CAR1Y
          CPX     #$33
          BCS     ZEROIT

          CMP     #0
          BPL     TAYIT

          BIT     RTLEFT
          BVC     CKRTLT

          CMP     #$9D
          BCS     CKLEFT

CKRIGHT   CMP     #$85
          BCC     TAYIT

          CMP     #$9C
          BCS     KILLIT

          LDX     #5

CKRNS     CMP     LEFTRN,X
          BCS     FNDRN

          DEX
          BPL     CKRNS

FNDRN     LDY     LEFTMASK,X
          STY     CAR1MASK
          BMI     TAYIT

CKRTLT    BPL     CKRIGHT
CKLEFT    SEC
          SBC     #$61

          CMP     #$84
          BCC     KILLIT

          LDX     #5

CKRNRT    CMP     RTRN,X
          BCS     FOUNDRNS

          DEX
          BPL     CKRNRT

FOUNDRNS
          LDY     RTMASK,X
          STY     CAR1MASK
          BPL     TAYIT

KILLIT    LDA     #0
          STA     CAR1MASK
ZEROIT    LDA     #0
TAYIT     TAY
          LDA     CARFCORS,Y
          STA     CAR1GR                 ;TEST*********************************
          AND     #$F
          BEQ     GETOUT
          LDA     CARFCORS+8,Y
          STA     CAR1GR
GETOUT

DOATTRAC  JSR     SW4
RETDOATT

GOKERN
VBLANKLP  LDY     INTIM                  ;WAIT OUT THE END OF VBLANK
          BNE     VBLANKLP
          STY     GRP0
          STY     GRP1
          STY     GRP0
          STY     ENABL
          STY     PTR0
          LDX     #0
          LDA     #$86
          STA     COLUBK
          LDA     GEAR
          AND     #$20
          STA     WSYNC
          STA     HMOVE
          STY     VBLANK

          JMP     GOBANKD

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@    OVERSCAN    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

OVERSCAN  INC     FRMCNT
          STA     WSYNC
          LDA     #2
          STA     VBLANK
          LDX     #STACK                ;RESET STACK PTR FOR SUBR CALLS
          TXS
          LDA     #$24                   ;OVERSCAN TIME
          STA     TIM64T                 ;START TIMER

MUSICPLA  LDA     FRMCNT
          LSR     A
          BCC     EVENOVER

ODDOVER
DOPER     LDA     PER
          LDX     #50
          LSR     A
          LSR     A
          LSR     A
          TAY
          LDA     PERSP1,Y
          AND     #$F0
          STA     TEMP1
          LDA     PERSP1,Y
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          STA     TEMP2
          LDA     PERSP2,Y
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          STA     TEMP3
          LDA     PERSP2,Y
          AND     #$F
          STA     TEMP4
PERLOOP1  LDY     TEMP3
          LDA     TEMP1
PERLOOP2  DEX
          BMI     PEROUT
          STA     BEND,X
          DEY
          BPL     PERLOOP2
          DEX
          BMI     PEROUT
          LDY     TEMP4
          LDA     TEMP2
PERLOOP3  STA     BEND,X
          DEY
          BMI     PERLOOP1
          DEX
          BPL     PERLOOP3
PEROUT

DOCURVE   LDA     CARY
          STA     ROADPOS
          LDA     #H(ROADCURV)
          STA     ROADPOS+1
          LDA     #H(MULTIPLY)
          STA     MULT+1
NOCURVES  LDY     #0
          STY     ROWCNT
          STY     ROADTOT
          STY     ACCUM
          STY     ADDER
          LDX     #$C
          STX     TEMP1

          JSR     RTORLEFT

          BMI     BENDR
          STA     TEMPZ
          JSR     CURVELP
JEND3     JMP     ENDOVSCN

BENDR     AND     #$7F
          STA     TEMPZ
          JSR     CURVELPR
          JMP     ENDOVSCN

TRACK     DB      0,203,50,178,75,153,178,153

EVENOVER  JSR     CHKSWCHS

          JSR     COLISION

          JSR     MUSIC

          LDA     NOTE
          BPL     JEND3

          BIT     GEAR
          BVC     MIKE
          JMP     JSPEED

;   THIS SECTION TESTS TWO PLACES ON THE ROAD TO CHECK FOR CURVES.  IF BOTH ARE
;   ZERO, THEN NO CURVE.  IF BOTH ARE NON-ZERO THEN IN CURVE.  IF ONLY ONE IS
;   ZERO THEN THE CAR IS ENTERING OR EXITING A CURVE.  THIS INFORMATION CAN BE
;   USED TO HELP SMOOTH OUT THE STARTING AND ENDING OF THE CENTRIPITAL FORCE.

MIKE      LDX     #0
          STX     TEMP3
          LDY     CARY
          LDA     ROADCURV-8,Y          ;FIRST TEST FOR IN CURVE
          BEQ     DONTDO1
          INX
DONTDO1   LDA     ROADCURV+4,Y          ;SECOND TEST FOR IN CURVE
          BEQ     DONTDO2
          INX
DONTDO2   LDA     #0
          DEX
          BMI     OUT
          STX     TEMP3

;WE ARE NOW IN A CURVE, FIND OUT HOW SEVERE IT IS.
          JSR     RTORLEFT
          TAY

          AND     #$7F                   ;MSB = RIGHT/LEFT
          BEQ     OUT
          INX
          CMP     #25
          BEQ     OUT
          INX
          CMP     #50
          BEQ     OUT
          INX
;X=0 FOR MILD, 1 FOR SHARP, OR 2 FOR CENTIPEDE   + 1 IF ALL THE WAY IN A CURVE
;NOW OR ON A COMPONENT FOR VELOCITY
OUT       DEX
          BPL     T1OUT
          LDX     #0
T1OUT     STX     TEMP1

          LDA     DPER                   ;DAMPEN LAST FRAMES AMOUNT BY 25%
          BEQ     NULDPER
          BMI     DAMPNEG
          LSR     DPER
          LSR     DPER
          CLC
          BPL     SUBDPER                ;JUMP
DAMPNEG   SEC
          ROR     DPER
          SEC
          ROR     DPER
          SEC
SUBDPER   SBC     DPER
          STA     DPER

NULDPER   LDA     VELOFRAC
          ADC     VEL
          AND     #$F8
          STA     VELOFRAC
          LDA     #0
          ROL     A
          STA     TEMP4
          BEQ     NOINCER
          ASL     TEMP3
NOINCER

          LDA     #0
          BIT     SWCHA                  ;TEST JOYSTICK
          BVC     TURNLEFT
          BMI     NOTURN

RIGHTURN  LDA     DDPER
          BPL     ISRIGHT
          LDA     #0
ISRIGHT   CLC
          ADC     TEMP4
          CMP     #8                     ;UPPER LIMIT ON RIGHT TURN
          BEQ     DOSKID
          BCS     DOSKID1
          STA     DDPER
          BNE     NOSKID


TURNLEFT  LDA     DDPER
          BMI     ISLEFT
          LDA     #0
ISLEFT    SEC
          SBC     TEMP4
          CMP     #$F8                   ;UPPER LIMIT ON LEFT TURN
          BEQ     DOSKID
          BCC     DOSKID1
          STA     DDPER
          BNE     NOSKID


NOTURN    LDA     DDPER
          BEQ     NOSKID
          BMI     DAMPNEG2
          LSR     DDPER
          LSR     DDPER
          CLC
          BPL     SUBDDPER               ;JUMP
DAMPNEG2  SEC
          ROR     DDPER
          SEC
          ROR     DDPER
          SEC
SUBDDPER  SBC     DDPER
          STA     DDPER

NOSKID    LDA     GEAR
          AND     #$EF
          STA     GEAR
          JMP     DOCENT
;

DOSKID    STA     DDPER
DOSKID1   LDA     VEL
          AND     #$F0
          LSR     A
          LSR     A
          ORA     TEMP1
          TAX
          LDA     CENTRIP,X
          SBC     #2
          BMI     NOSKID
          STA     TEMP2

          LDA     GEAR
          AND     #$10
          BNE     OLDSKID
;
; CAR IS NOT SKIDDING YET
          LDA     VEL
          CMP     NSKIDVEL,X
          BCC     NOSKID
          SBC     TEMP2
          STA     VEL
          LDA     GEAR
          ORA     #$10
          STA     GEAR
          BNE     DOCENT
;
;  IS CAR IS ALREADY SKIDDING
OLDSKID   LDA     VEL
          CMP     OSKIDVEL,X
          BCC     NOSKID
          SBC     TEMP2
          STA     VEL

DOCENT    LDA     VEL
          AND     #$F0
          BEQ     STRAIGHT
          LSR     A
          LSR     A
          ORA     TEMP1
          TAX

*  SET LOWER THREE BITS OF VELOFRAC FOR J.A.'S MOUNTAINS
          LDA     CENTRIP,X
          LSR     A
          STA     TEMP1
          LSR     A
          CLC
          ADC     TEMP1
          ORA     VELOFRAC
          ORA     TEMP3
          STA     VELOFRAC

          LDA     GEAR                   ;ADD IN SKID VALUE - 1/2 OF CENTRIP
          AND     #$10
          BEQ     NOADDSK
          LDA     CENTRIP,X
          LSR     A
          LSR     A
NOADDSK   CLC
          ADC     CENTRIP,X              ;LOOK UP THE DESIRED CENTRIPITAL FORCE
          LSR     A
                                         ;FIND OUT THE DIRECTION OF THE FORCE
          CPY     #0
          BPL     STRAIGHT
          EOR     #$FF
          CLC
          ADC     #1

STRAIGHT  CLC
          ADC     DPER                   ;ADD OLD VALUE PLUS NEW CENTRIPITAL

          CLC
          ADC     DDPER                  ;ADD IN CURRENT STEERING SLIDER

;   CHECK TO SEE IF DPER HAS GONE BEYOND ITS LIMITS
DEAD      STA     DPER
          BMI     DPERNEG
          CMP     #$3F
          BCC     STOREDPE
          LDA     #$3F
          BNE     STOREDPE
DPERNEG   CMP     #$C0
          BCS     STOREDPE
          LDA     #$C0
STOREDPE  STA     DPER
          LDA     DPER

; IS DPER POSITIVE OR NEGATIVE
          BMI     DPERNEG2
          LSR     A
          CLC                            ;/2 TO MAKE LESS SEVERE
          ADC     PER                    ;ADD TO CURRENT POSITION
          BVS     NOMJMP
          BMI     CHKNPER
CHKPPER   CMP     #$6F                   ;CHECK BOUNDARIES
          BCC     PERJOIN
NOMJMP    LDA     #$6F
          BNE     PERJOIN

DPERNEG2  SEC
          ROR     A                      ;/2 TO MAKE LESS SEVERE
          CLC
          ADC     PER                    ;ADD TO CURRENT POSITION
          BVS     NOPJMP
          BPL     CHKPPER
CHKNPER   CMP     #$90                   ;CHECK BOUNDARIES
          BCS     PERJOIN
NOPJMP    LDA     #$90

PERJOIN
          STA     PER
JSPEED    BIT     GEAR
          BVC     RSPEED

          LDA     VEL
          SEC
          SBC     #6

          CMP     #$F0
          BCS     ZEROITN

          CMP     #90
          BCS     STVEL

          TAX
          LDA     GEAR
          ORA     #$02
          STA     GEAR
          TXA
          BNE     STVEL

ZEROITN   LDA     NOTE
          CMP     #$FF
          BNE     NOZER
          LDA     GEAR
          AND     #$BF
          STA     GEAR
NOZER     LDA     #0
STVEL     STA     VEL

RSPEED    JMP     GOSUBRD                ;WAS JSR SPEED (NOW IN DBANK)

JOYST     LDA     FRMCNT
          AND     #$03
          BNE     DOMNTS
          JSR     JOYSTICK

DOMNTS    JSR     RTORLEFT
          BEQ     JEND2

          LDA     VELOFRAC
          AND     #$07
          TAX

          LDA     VELOFRAC
          AND     #$F8
          STA     VELOFRAC

          LDY     CARY
          LDA     ROADCURV+12,Y
          BNE     DOTURN

          LDA     ROADCURV+5,Y
JEND2     BEQ     JEND1

DOTURN    JSR     RTORLEFT

          BMI     DORIGHT
;.........................................
WESTMNT   STX     TEMP1
          TXA
          ASL     A
          STA     TEMP2

          LDA     ZERX
          ADC     TEMP1
          CMP     #160
          BCC     STMTXA
;         SEC
          SBC     #160
STMTXA    STA     ZERX
          LDA     SHFTREG
          CLC
          ADC     TEMP2
          STA     SHFTREG
          CMP     #16
          BCC     DONESHE
;         SEC
SBC8      SBC     #8
          STA     SHFTREG
SHIFTR    LDX     #18
SHRLP     ASL     CHUNK,X
          ROR     CHUNK+1,X
          ROL     CHUNK+2,X
          BCC     SKIPSH
          LDA     CHUNK+3,X
          ORA     #$08
          STA     CHUNK+3,X
SKIPSH    ASL     CHUNK+3,X
          ROR     CHUNK+4,X
          ROL     CHUNK+5,X
          BCC     RSDONE
          LDA     CHUNK,X
          ORA     #$10
          STA     CHUNK,X

RSDONE    TXA
          SEC
          SBC     #6
          TAX
          BPL     SHRLP

          LDA     SHFTREG
          CMP     #16
          BCS     SBC8

DONESHE
JEND1     JMP     ENDOVSCN

DORIGHT
EASTMNT   STX     TEMP1
          TXA
          ASL     A
          STA     TEMP2

          LDA     ZERX
          SEC
          SBC     TEMP1
          CMP     #160
          BCC     STMTXM
          ADC     #159
STMTXM    STA     ZERX
          LDA     SHFTREG
          SEC
          SBC     TEMP2
          STA     SHFTREG
          CMP     #1
          BEQ     SHIFTME
          BPL     DONSHFB

SHIFTME   CLC
          ADC     #8
          STA     SHFTREG
SHIFTL    LDX     #18
SHLLP     LSR     CHUNK+5,X
          ROL     CHUNK+4,X
          ROR     CHUNK+3,X
          LDA     CHUNK+3,X
          AND     #$08
          BEQ     CLEARME
          SEC
          LDA     CHUNK+3,X
          AND     #$F0
          STA     CHUNK+3,X
          BCS     POSTCLR
CLEARME   CLC
POSTCLR   ROR     CHUNK+2,X
          ROL     CHUNK+1,X
          ROR     CHUNK,X
          LDA     CHUNK,X
          AND     #$08
          BEQ     DONE
          LDA     CHUNK+5,X
          ORA     #$80
          STA     CHUNK+5,X
          LDA     CHUNK,X
          AND     #$F0
          STA     CHUNK,X
DONE      TXA
          SEC
          SBC     #6
          TAX
          BPL     SHLLP

          LDA     SHFTREG
          CMP     #1
          BEQ     SHIFTME
          BMI     SHIFTME

DONSHFB


ENDOVSCN  LDA     INTIM                  ;CHECK IF OVERSCAN IS DONE
          BNE     ENDOVSCN               ;  IF NOT, WAIT
          JMP     VBLNK

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@    SUBROUTINES    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

RTORLEFT  LDA     CARYH
          AND     #3
          ASL     A
          TAY
          BIT     CARY
          BPL     NOPLUS19
          INY
NOPLUS19  LDA     TRACK,Y
RTS1      RTS


MUSIC     LDY     NOTE
          CPY     #$FF
          BNE     DOMU
          JMP     NOMUSIC
DOMU      CPY     #L(CLOSING-OPENING)
          BNE     DOMUS
          LDA     PSCORE0
          ORA     PSCORE1
          BNE     DOMUS
          LDA     PSCORE2
          CMP     #$01
          BNE     DOMUS

          LDY     #5
          LDA     TIMER2
CMPTIME   CMP     TIMES,Y
          BCS     GOTIT
          DEY
          BPL     CMPTIME
          CMP     #$58
          BCC     LOWER
          BNE     GOTIT
          LDA     TIMER3
          CMP     #$50
          BCS     GOTIT
LOWER     DEY
GOTIT     TYA
          EOR     #-1
          CLC
          ADC     #L(STALL-OPENING+1+7+1)
          STA     NOTE
          TAY
          LDA     #6
          STA     DURATION

DOMUS
          CPY     #L(STALL-OPENING+1)
          BNE     DOMUS2
          LDA     #L(STARTING-OPENING+9)
          STA     NOTE
          LDA     #$1E
          STA     DURATION
          LDA     #0
          STA     TIMER2
          STA     TIMER3
          LDA     #$75
          STA     TIMER
          LDA     GEAR
          AND     #$7F
          STA     GEAR
DOMUS2

          LDA     DURATION
          AND     FRMCNT
          BNE     RTS1

          DEY
          CPY     #L(STALL-OPENING+2)
          BCC     NOPOINT
          CPY     #L(STALL-OPENING+10)
          BCS     NOPOINT
          LDA     PNTTAB-STALL+OPENING-2,Y
          SED
          CLC
          ADC     PSCORE1
          STA     PSCORE1
          LDA     #0
          TAX

          ADC     PSCORE2
          STA     PSCORE2
          CLD
          BIT     PER
          BPL     NODEX
          DEX
NODEX     STX     PER

NOPOINT   BIT     GEAR
          BVC     DOREG
          LDA     #8
          STA     AUDC0
          LDA     #2
          STA     AUDC1
          LDA     F0TBL-16,Y
          STA     AUDV0
          LDA     F1TBL-16,Y
          STA     AUDV1
          BPL     NOX
DOREG     LDA     #8
          STA     AUDV0
          STA     AUDV1
          LDA     #4
          STA     AUDC0
          LDA     #$D
          STA     AUDC1
NOX       LDA     F0TBL,Y
          BPL     STOREIT

          LDY     #$FF
          STY     NOTE
          INY
          STY     AUDV0
          BEQ     NOMUSIC

STOREIT   BNE     STF0
          STA     AUDV0
STF0      STA     AUDF0
          STY     NOTE

          LDA     F1TBL,Y
          BNE     STF1
          STA     AUDV1
STF1      STA     AUDF1
          RTS


NOMUSIC   LDA     CARYH
          SEC
          SBC     #20
          ORA     VEL
          BEQ     NOENG
          LDA     TIMER
          ORA     VEL
          BNE     DOENG
NOENG     STA     AUDV0
          STA     AUDV1
          RTS
DOENG     LDA     VEL
          ADC     #30
          LSR     A
          LSR     A
          LSR     A
          BIT     GEAR
          BMI     HIG
          ASL     A
          CMP     #$1F
          BCC     HIG
          LDA     #$1F
HIG       TAX
          LSR     A
          LSR     A
          LSR     A
          BCC     DOFASTA
          LDA     FRMCNT
          AND     #2
          BNE     DONEMUS
DOFASTA   LDA     SOUND,X
          STA     AUDF1
          LDA     #$FF
          STA     AUDC1
          LDA     #7
          STA     AUDV1
          LDA     #$30
          SEC
          SBC     CAR1Y
          BMI     DONEMUS
          CMP     #$14
          BCS     DONEMUS
          LSR     A
          TAY
          LDA     #3
          STA     AUDC1
          LDX     #6
          STX     AUDF1
          LDA     PASSINGS,Y
          STA     AUDV1
DONEMUS   RTS

CHKSWCHS  LDA     SWCHB
          LSR     A
          BCS     SWRTS

SETUPNG   LDA     #L(CLOSING-OPENING-1)
          STA     NOTE
          LDA     #2
          STA     DURATION
          LDA     #4
          STA     AUDC0
          LDA     #$D
          STA     AUDC1

          LDA     #$90
          STA     TIMER

SWTCHS    LDX     #0
          STX     PSCORE0
          STX     PSCORE1
          STX     PSCORE2
          STX     TIMER2
          STX     TIMER3
          STX     CARYH
          STX     DDPER
          STX     DPER
          STX     VEL
          STX     GEAR
          STX     QUALED

          BIT     PER
          BPL     NODEX2
          DEX
NODEX2    STX     PER
          LDX     #$18
          STX     CARY
          LDA     #$38
          STA     ZERX
          LDA     #$35
          STA     CAR1Y
CHLP      LDA     MOUNT-1,X
          STA     CHUNK-1,X
          DEX
          BNE     CHLP

          LDA     #8
          STA     SHFTREG

SWRTS     LDX     NOTE
          INX
          TXA

          ORA     TIMER
          ORA     VEL
          ORA     PASSEDCS
          BNE     RSWRTS

          LDA     RTLEFT
          AND     #$20
          BNE     RSWRTS

          BIT     INPT4
          BPL     SETUPNG

RSWRTS    RTS




;CURVELP IS THE ONLY ENTRY POINT
CURVELP   LDX     ROWCNT
          BPL     INTOLOOP
CURVLP    TXA
          LSR     A
          TAX
          INX
INTOLOOP  LDY     DISTANCE,X
          LDA     (ROADPOS),Y
          BEQ     BEND1
          LDA     TEMPY+1
BEND1     STA     MULT
          TXA
          TAY
          ASL     A
          TAX
          LDA     (MULT),Y
          ADC     ACCUM
          STA     ACCUM
          LSR     A                      ;THIS MAKES THE CURVE HALF AS SHARP
                                         ;  COULD BE DONE BY FIXING THE TABLE
          TAY
          LDA     ADDER
          AND     #$0F
          CLC
          ADC     SHIFT2,Y
          STA     ADDER
          CLC
          ADC     BEND,X
          STA     BEND,X
          LDA     ADDER
          AND     #$F0
          LSR     A
          LSR     A
          LSR     A
          EOR     #$1F
          ADC     #1
          AND     #$1F
          ADC     ROADTOT
          STA     ROADTOT
          LDA     ADDER
          AND     #$0F
          ADC     SHIFT2+3,Y             ;THIS NUMBER CAN BE USED TO SMOOTH THE
                                         ;   CURVES.  THE HIGHER THE NUMBER,
                                         ;   THE GREATER THE JAGGINESS.  THE
                                         ;   LOWER THE NUMBER, THE SMALLER THE
                                         ;   AVERAGING AFFECT.
          STA     ADDER
          CLC
          ADC     BEND+1,X
          STA     BEND+1,X
          LDA     ADDER
          AND     #$F0
          LSR     A
          LSR     A
          LSR     A
          EOR     #$1F
          ADC     #1
          AND     #$1F
          ADC     ROADTOT
          STA     ROADTOT
          CPX     TEMP1
          BNE     CURVLP
          TXA
          LSR     A
          TAX
          INX
          STX     ROWCNT
          RTS

;CURVELPR IS THE ONLY ENTRY POINT
CURVELPR  LDX     ROWCNT
          BPL     INTRLOOP
CURVLPR   TXA
          LSR     A
          TAX
          INX
INTRLOOP  LDY     DISTANCE,X
          LDA     (ROADPOS),Y
          BEQ     BEND2
          LDA     TEMPY+1
BEND2     STA     MULT
          TXA
          TAY
          ASL     A
          TAX
          LDA     (MULT),Y
          ADC     ACCUM
          STA     ACCUM
          LSR     A                      ;THIS MAKES THE CURVE HALF AS SHARP
                                         ;  COULD BE DONE BY FIXING THE TABLE
          TAY
          LDA     ADDER
          AND     #$0F
          CLC
          ADC     SHIFT1,Y
          STA     ADDER
          ADC     BEND,X
          STA     BEND,X
          LDA     ADDER
          AND     #$F0
          LSR     A
          LSR     A
          LSR     A
          ADC     ROADTOT
          STA     ROADTOT
          LDA     ADDER
          AND     #$0F
          ADC     SHIFT1+3,Y             ;THIS NUMBER CAN BE USED TO SMOOTH THE
                                         ;   CURVES.  THE HIGHER THE NUMBER,
                                         ;   THE GREATER THE JAGGINESS.  THE
                                         ;   LOWER THE NUMBER, THE SMALLER THE
                                         ;   AVERAGING AFFECT.
          STA     ADDER
          ADC     BEND+1,X
          STA     BEND+1,X
          LDA     ADDER
          AND     #$F0
          LSR     A
          LSR     A
          LSR     A
          ADC     ROADTOT
          STA     ROADTOT
          CPX     TEMP1
          BNE     CURVLPR
          TXA
          LSR     A
          TAX
          INX
          STX     ROWCNT
          RTS

COLISION  LDA     CARYH
          CMP     #20
          BEQ     FOURLAPS
          LDA     TIMER
          BNE     MORETIME
FOURLAPS  LDA     VEL
          BNE     DOSLOWDO
          LDA     PSCORE0
          AND     #$F0
          STA     PSCORE0
          BIT     QUALED
          BVC     ATZERO
RTSRTS    RTS

DOSLOWDO  SEC
          SBC     #3
          BEQ     ATZERO
          BCS     NOTZERO

ATZERO    LDA     TIMER
          STA     MISC

DOENDMUS  LDA     #L(STALL-OPENING-1)
          STA     NOTE
          LDA     #2
          STA     DURATION

          LDA     QUALED
          ORA     #$40
          STA     QUALED
          LDA     GEAR
          AND     #$BF
          STA     GEAR

          LDA     #0
NOTZERO   STA     VEL
          LDA     #$35
          STA     CAR1Y

MORETIME  LDX     #5
          BIT     CXP0FB
          BVC     COLRET
HITEDGE   LDA     VEL
          CMP     #$20
          BCC     COLRET
          LDX     #$1C
          SBC     #3
          STA     VEL
          STX     AUDV1

;OLRET    LDA     QUALED
;         AND     #$BF
;         STA     QUALED

COLRET    LDA     TIMER
          BEQ     RETFORR

          LDA     CAR1Y
          CMP     #$32
          BCS     RETFORR

          CMP     #$21
          BCC     RETFORR

          CMP     #$26
          BCS     DOCOL1                 ;COL WITH OWN CAR'S SLICKS

          LDA     CAR1X
          CMP     #$25
          BCC     RETFORR
          CMP     #$58
          BCS     RETFORR

DIE       LDA     GEAR
          AND     #$40
          BNE     RETFORR

          LDA     GEAR
          ORA     #$40
          STA     GEAR

          LDA     #$35
          STA     CAR1Y

          LDA     #L(XF0-OPENING+15)
          STA     NOTE
          LDA     #6
          STA     DURATION
          RTS

DOCOL1    LDA     CAR1X
          CMP     #$21
          BCC     RETFORR
          CMP     #$5C
          BCC     DIE
                                         ;TEST FOR NEW
RETFORR   RTS

JOYSTICK  LDA     TIMER
          BEQ     DODEBOUN
          LDA     CARYH
          CMP     #20
          BEQ     RETFORR

          LDA     SWCHA
          AND     #$30
          CMP     #$30
          BEQ     NOUPDOWN

          AND     #$20
          BEQ     GOHI

          LDA     GEAR                   ;SET GEAR = LOW
          AND     #$7F
          BPL     STORGEAR

GOHI      LDA     GEAR
          ORA     #$80
STORGEAR  STA     GEAR

NOUPDOWN
CKACCELL  LDA     VEL
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          TAX

          CLC
          LDA     #$F4
          BIT     INPT4
          BPL     BRAKE                  ;TRY THE BUTTON AS A BRAKE

          BIT     GEAR
          BMI     INHIGEAR

          LDA     LOSPEEDT,X             ;IN LOW GEAR
          BPL     STAVEL2

BRAKE     ADC     VEL
          BCS     NOTOP
          LDA     #0
          BEQ     NOTOP

INHIGEAR  LDA     HISPEEDT,X
STAVEL2   CLC
          ADC     VEL
          CMP     #163
          BCC     NOTOP
          LDA     #163
NOTOP     STA     VEL
          RTS

DODEBOUN  BIT     INPT4
          BPL     BUTDOWN

          LDA     RTLEFT
          AND     #$DF
          STA     RTLEFT

DONEJOY   RTS

BUTDOWN   LDA     RTLEFT
          ORA     #$20
          STA     RTLEFT
                                         ; RTS    EMBEDDED IN TABLE


TIMES     DB      $60,$62,$64,$66,$68,$70
TOPZNTBL  DB      18,14,11,09,06,04                  ;,02
PNTTAB    DB      2,2,2,2,2,4,6,$20,0                ;,0
DYZN      DB      0,5,10                             ;,16
NEXTNZ    DB      $10,$15,$15,$17,$17,$17
RTMASK    DB      $03,$07,$0F,$1F,$3F                ;,$7F
RTLNCH    DB      $7F,$3F,$3F,$3F
YZN       DB      $00,$04,$07,$0A,$0F,$1D
CAROFF    DB      $F0,$ED,$ED,$E6,$E6,$E6
SPEEDTBL  DB      30,15,10,05,02,01                  ;,00
RANGETBL  DB      00,10,20,30,50,80,150
NSKIDVEL  DB      $98,$90,$88,$80

CENTRIP   DB      0,0,0,0
          DB      0,0,0,0
          DB      0,0,0,1
          DB      0,0,0,2
          DB      0,0,1,3
          DB      0,0,2,4
          DB      0,1,3,5
          DB      0,2,4,6
          DB      0,3,5,7
          DB      0,4,6,8
          DB      0,5,7,9
          DB      0,6,8,10

PASSINGS  DB      5,7,9,11,13,15,13,11,9,7


ENDF0     DS      0

          ORG     $F9F7
HSTAMP    DB      1                      ;,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0
ROADCURV  DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
SW2       LDA     HOLD2                  ;2
          STA     PSCORE2                ;4
          LDA     HOLD1                  ;6
          STA     PSCORE1                ;8
          LDA     #3                     ;10
          TAY                            ;11
RIGHTSCO  LSR     PSCORE2                ;13
          ROR     PSCORE1                ;15
          ROR     A                      ;16
          DEY                            ;17
          BPL     RIGHTSCO               ;19
          STA     PSCORE0                ;21
          RTS                            ;22
SW4       LDA     TIMER
          ORA     VEL
          ORA     PASSEDCS
          BNE     SW5
          LDA     NOTE
          CMP     #$FF
          BNE     SW5
          LDA     FRMCNT      ;2
          BNE     NOSW        ;4
          LDA     QUALED
          EOR     #1
          STA     QUALED
          LSR     A
          BCC     NOSW
          LDA     GEAR        ;6
          EOR     #$20        ;8
          STA     GEAR        ;10
SW5       RTS                 ;13
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
NOSW      AND     #$7F        ;13
          BNE     SW3         ;15
          LDA     CARYH
          CMP     #20
          BNE     SW3
          LDA     QUALED      ;
          EOR     #$20        ;
          STA     QUALED      ;
          AND     #$20        ;17
          BNE     SW1         ;19
          JMP     SW2                    ;
SW1       LDY     #4                     ;2
LEFTSCOR  ASL     PSCORE0                ;4
          ROL     PSCORE1                ;6
          ROL     PSCORE2                ;8
          DEY                            ;9
          BNE     LEFTSCOR               ;11
          LDA     PSCORE1                ;13
          STA     HOLD1                  ;15
          LDA     PSCORE2                ;17
          STA     HOLD2                  ;19
          SED                            ;20
          LDA     TIMER3                 ;25
          STA     PSCORE0                ;27
          LDA     #$27                   ;29
          SEC
          SBC     MISC                   ;31
          CLD                            ;32
          PHP                            ;     +1
          STA     PSCORE1                ;34
          LDY     #3                     ;36
LEFTTIME  ASL     PSCORE0                ;38
          ROL     PSCORE1                ;40
          LSR     A                      ;41
          DEY                            ;42
          BPL     LEFTTIME               ;44
          ORA     #$10                   ;46
          PLP                            ;     +1
          BCC     NOMOREIN               ;     +2
          ADC     #$F                    ;     +2
NOMOREIN  STA     PSCORE2                ;48
SW3       RTS                            ;49
          DB      1,1,1,1,1,1,1,1
          DB      0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                                         ;296

DISTANCE  DB      0,0,1,1,1,2,2,3,3,4,4,5,5,6,8,9,11,13,15,18,21,25,29,34,40
                                         ;25


FINECORS  DB      $70,$70,$70,$70,$70,$70,$70,$70
          DB      $60,$50,$40,$30,$20,$10,$00,$F0
          DB      $E0
CARFCORS  DB      $70,$70,$60,$50,$40,$30,$20,$10        ;CARFCORS
          DB      $00,$F0,$E0,$D0,$C0,$B0,$A0,$90
          DB      $80,$61,$51,$41,$31,$21,$11,$01
          DB      $F1,$E1,$D1,$C1,$B1,$A1,$91,$81
          DB      $62,$52,$42,$32,$22,$12,$02,$F2
          DB      $E2,$D2,$C2,$B2,$A2,$92,$82,$63
          DB      $53,$43,$33,$23,$13
          DB      $03,$F3,$E3,$D3,$C3,$B3,$A3,$93
          DB      $83,$64,$54,$44,$34,$24,$14,$04
          DB      $F4,$E4,$D4,$C4,$B4,$A4,$94,$84
          DB      $65,$55,$45,$35,$25,$15,$05,$F5
          DB      $E5,$D5,$C5,$B5,$A5,$95,$85,$66
          DB      $56,$46,$36,$26,$16,$06,$F6,$E6
          DB      $D6,$C6,$B6,$A6,$96,$86,$67,$57
          DB      $47,$37,$27,$17,$07,$F7,$E7,$D7
          DB      $C7,$B7,$A7,$97,$87,$68,$58,$48
          DB      $38,$28,$18,$08,$F8,$E8,$D8,$C8
          DB      $B8,$A8,$98,$88,$69,$59,$49,$39
          DB      $29,$19,$09,$F9,$E9,$D9,$C9,$B9
          DB      $A9,$99,$89,$6A,$5A,$4A,$3A,$2A
          DB      $1A,$0A,$FA,$EA,$DA,$CA,$BA,$AA
          DB      $9A,$8A,$60,$60,$60,$60,$60,$60
                                         ;190
ENDF9     DS      0                      ;511 TOTAL FOR PAGE
          ORG     $FC00
;         MULTIPLY MUST HAVE A LOW BYTE OF ZERO
MULTIPLY  DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,1,1,1,1,1,2,2,2,2,3,3,3,4,4,5,5,6,7,8,9,10,12,14,16
          DB      1,1,1,1,2,2,2,3,3,3,4,4,5,5,6,7,8,9,10,12,14,16,18,20,23
          DB      1,1,1,1,2,2,2,3,3,4,4,5,6,7,8,9,11,13,15,17,20,23,27,31,36
                                         ;100

MOUNT     DB      $10,0,$F8,$30,$0,$C0
          DB      $30,0,$FE,$FF,0,$E0
          DB      $70,$01,$FF,$FF,$E0,$F0
          DB      $F0,$07,$FF,$FF,$F8,$F8
                                         ;24

LEFTRN    DB      $85,$89,$8D,$91,$95,$99
LEFTMASK  DB      $FE,$FC,$F8,$F0,$E0,$C0
RTRN      DB      $84,$88,$8C,$90,$94,$98
LOSPEEDT  DB      3,2,1,-1,-1,-1,-1
HISPEEDT  DB      1,1,1,2,2,1,1
SKID      DB      $FF,$3,$1,$0
                                         ;28

SOUND     DB      31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,14,13
          DB      13,12,12,11,11,10,10,9,9,9,9,9
                                         ;32

WIDTH     DB      51,50,49,48,47,46,45,44,43,42,41,40,39
          DB      38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19
          DB      18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,0,0
                                         ;53

OSKIDVEL  DB      $58,$50,$48,$40

STAMPZN   DB      STAMP6-STAMP1,STAMP5-STAMP1
          DB      STAMP4-STAMP1,STAMP3-STAMP1,STAMP2-STAMP1,0
                                         ;6

                                         ;255 FOR PAGE
ENDFC     DS      0
          ORG     $FD00
SHIFT2    DB      0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0
          DB      $FF,$FF,$FE,$FD,$FD,$FC,$FB,$FB,$FA,$F9,$F9,$F8
          DB      $F7,$F7,$F6,$F5,$F5,$F4,$F3,$F3,$F2,$F1,$F1,$F0
          DB      $EF,$EF,$EE,$ED,$ED,$EC,$EB,$EB,$EA,$E9,$E9,$E8
          DB      $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E3,$E2,$E1,$E1,$E0
          DB      $DF,$DF,$DE,$DD,$DD,$DC,$DB,$DB,$DA,$D9,$D9,$D8
          DB      $D7,$D7,$D6,$D5,$D5,$D4,$D3,$D3,$D2,$D1,$D1,$D0
          DB      $CF,$CF,$CE,$CD,$CD,$CC,$CB,$CB,$CA,$C9,$C9,$C8
          DB      $C7,$C7,$C6,$C5,$C5,$C4,$C3,$C3,$C2,$C1,$C1,$C0
          DB      $BF,$BF,$BE,$BD,$BD,$BC,$BB,$BB,$BA,$B9,$B9,$B8
          DB      $B7,$B7,$B6,$B5,$B5,$B4,$B3,$B3,$B2,$B1,$B1,$B0
          DB      $AF,$AF,$AE,$AD,$AD,$AC,$AB,$AB,$AA,$A9,$A9,$A8
          DB      $A7,$A7,$A6,$A5,$A5,$A4,$A3,$A3,$A2,$A1,$A1,$A0
                                         ;164

PERSP1    DB    $00,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$11,$21,$21
          DB    $FE,$FE,$FF,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$00
                                         ;32

PERSP2    DB    $FF,$0C,$05,$03,$14,$13,$12,$00,$21,$10,$20,$30,$60,$FF,$09,$04
          DB    $40,$90,$FF,$06,$03,$02,$01,$12,$00,$21,$31,$41,$30,$50,$C0,$FF
                                         ;32

F0TBL
OPENING   DB      $FF,$00,$0D,$0D,$0D,$0D,$0D,$0D
          DB      $0F,$0F,$11,$11,$14,$14,$17,$17
          DB      $1B,$1B,$1F,$1F,$1B,$1B,$17,$17
          DB      $12,$12,$00,$14,$00,$14,$14,$14
          DB      $17,$17,$1B,$1B,$1F,$1F,$1B,$1B
          DB      $17,$17,$12,$12,$00,$14,$00,$14
          DB      $00,$14,$14,$14,$14,$14,$14,$14
          DB      $FF
CLOSING   DB      0,0,0,0,0,0,0,0
          DB      $0B,$0B,$0B
          DB      $0B,$0B,$0B,$0B,$0F,$0F,$12,$12
          DB      $0F,$0F,$00,$12,$00,$12,$00,$12
          DB      $12,$12,$12,$12,$12,$12,$14,$14
          DB      $1F,$1F,$14,$14,$00,$17,$00,$17
          DB      $00,$17,$17,$17,$17,$17,$17,$17
STALL     DB      $FF,$00,$00,$17,$00,$17,$00,$17,$00
          DB      $17
STARTING  DB      $FF,$F,$F,0,$1F,0,$1F,0,$1F

          DB      $FF

;  ALL AFTER THIS POINT DO NOT STOP THE ACTION
EXTENDED  DB      $10,$00,$10,$00,$10,$00,$10,$00
          DB      $FF
XV0       DB      1,2,3,4,5,6,7,$A,$B,$F,$F,$F,$F,$F,$F,$F
XF0       DB      $FF,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18
          DB      $18,$18
SKIDSOUN  DB      $19,$1D,$1B,$1E,$1B,$1D,$1A,$1C,$1E,$1B,$19,$1C,$1A,$1E,$1D
          DB      $1B

F1TBL
OPENING2  DB      $FF,$00,$12,$12,$12,$12,$12,$12
          DB      $14,$14,$14,$14,$14,$14,$12,$12
          DB      $12,$12,$12,$12,$0F,$0F,$0F,$0F
          DB      $0F,$0F,$0D,$0D,$0D,$0D,$0D,$0D
          DB      $14,$14,$14,$14,$14,$14,$12,$12
          DB      $12,$12,$12,$12,$0F,$0F,$0F,$0F
          DB      $0F,$0F,$0D,$0D,$0D,$0D,$0D,$0D
          DB      $FF
CLOSING2  DB      0,0,0
          DB      $00,$00,$00,$00,$00,$00,$1F,$1F
          DB      $1F,$1F,$1F,$1F,$00,$14,$00,$14
          DB      $00,$14,$00,$0F,$00,$0F,$00,$0F
          DB      $0F,$0F,$0F,$0F,$0F,$0F,$00,$14
          DB      $00,$14,$00,$14,$00,$0F,$00,$0F
          DB      $00,$0F,$0F,$0F,$0F,$0F,$0F,$0F
STALL2    DB      $FF,$00,$00,$08,$00,$08,$00,$08,$00
          DB      $08
STARTIN2  DB      $FF,$F,$F,0,$1F,0,$1F,0,$1F
          DB      $FF


;  ALL AFTER THIS POINT DO NOT STOP THE ACTION
EXTENDE2  DB      $12,$00,$12,$00,$12,$00,$12,$00
          DB      $FF
XV1       DB      1,3,4,5,$F,$F,$F,$F,$F,$F,$F,$F,$F,$F,$F,$F
XF1       DB      $FF,$A,$A,$A,$A,$A,$A,$A,$A,$A,$A,$A,$A,7,7,7,7

SHIFT1    DB      0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0
          DB      $01,$01,$02,$02,$03,$04,$05,$05,$06,$07,$07,$08
          DB      $09,$09,$0A,$0B,$0B,$0C,$0D,$0D,$0E,$0F,$0F,$10
          DB      $11,$11,$12,$12,$13,$14,$15,$15,$16,$17,$17,$18
          DB      $19,$19,$1A,$1B,$1B,$1C,$1D,$1D,$1E,$1F,$1F,$20
          DB      $21,$21,$22,$22,$23,$24,$25,$25,$26,$27,$27,$28
          DB      $29,$29,$2A,$2B,$2B,$2C,$2D,$2D,$2E,$2F,$2F,$30
          DB      $31,$31,$32,$32,$33,$34,$35,$35,$36,$37,$37,$38
          DB      $39,$39,$3A,$3B,$3B,$3C,$3D,$3D,$3E,$3F,$3F,$40
          DB      $41,$41,$42,$42,$43,$44,$45,$45,$46,$47,$47,$48
          DB      $49,$49,$4A,$4B,$4B,$4C,$4D,$4D,$4E,$4F,$4F,$50
          DB      $51,$51,$52,$52,$53,$54,$55,$55,$56,$57,$57,$58
          DB      $59,$59,$5A,$5B,$5B,$5C,$5D,$5D,$5E,$5F,$5D,$60
                                         ;164
                                         ;164 FOR PAGE
ENDFD     DS      0

          ORG     $FFEC
GOSUBRD   JMP     DOSUBRD
DOSUBRF   JMP     JOYST
GOBANKD   JMP     DOBANKD
DOBANKF   JMP     OVERSCAN

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@    DISPLAY KERNEL     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

          ORG     $D000
          STA     $FFF9

KERNEL

          BEQ     REGULAR
          STX     COLUBK
          JMP     TITLE

;SCORE SETUP
;THIS ROUTINE SETS UP THE SCORE FOR DISPLAY
; X=0   Y=0

REGULAR   LDA     PSCORE0,X
          AND     #7
          STA     TEMP1
          BPL     NOTNEXT2
SCORELP   LDA     PSCORE0,X
          AND     #$0F
          ASL     A
          ASL     A
          ASL     A
          ADC     TEMP1
          STA     PTR0,Y
          CMP     #L(NINE)
          BCS     NOTNEXT2
          LDA     #0
          STA     TEMP1
NOTNEXT2  INY
          INY
          LDA     PSCORE0,X
          AND     #$F0
          LSR     A
          ADC     TEMP1
          STA     PTR0,Y
          CMP     #L(NINE)
          BCS     NOTNEXT1
          LDA     #0
          STA     TEMP1
NOTNEXT1  INY
          INY
          INX
          STA     WSYNC
          STA     HMOVE
          CPX     #3
          BNE     SCORELP

          STX     NUSIZ0
          STX     NUSIZ1
          STX     VDELP0
          STX     VDELP1
          LDX     #$F
          STX     COLUP0
          STX     COLUP1
          INX
          STX     HMP1
          LDA     TIMER
          AND     #1
          STA     RESP0
          STA     RESP1                  ;43
          BEQ     NOFLAG
          LDY     CARY
          CPY     #$A0
          BCC     NOFLAG
          LDA     CARYH
          AND     #3
          SBC     #3
          BNE     NOFLAG
          LDA     #L(FLAG)
          STA     PTR0
          STA     PTR5
          BNE     NOSECS                 ;NOT NEEDED
NOFLAG    LDA     QUALED
          AND     #$20
          BEQ     NOSECS                 ;51 +3
          LDA     PTR1
          STA     PTR0
          LDA     PTR2
          STA     PTR1
          LDA     #L(QUOTE)
          STA     PTR2

NOSECS    STA     WSYNC
          STA     HMOVE
          LDY     #$1
          STY     CTRLPF
          DEY
          STY     COLUPF
          LDA     #$FC
          STA     PF2
          LDY     #6
          STY     TEMPY
          LDX     #H(NUMTAB)
          STX     PTR0+1
          STX     PTR1+1
          STX     PTR2+1
          STX     PTR3+1
          STX     PTR4+1
          STX     PTR5+1
          NOP
          PLA
          PHA
          PLA                            ;50
          PHA                            ;54
          STA     HMCLR

DISPLSCR  LDY     TEMPY                  ;67
          LDA     (PTR5),Y               ;72
          STA     GRP0+$100              ;76     CAUTION!!!!!!   NO WSYNC!!!!!!
          STA     HMOVE                  ;3
          LDA     (PTR4),Y               ;8
          STA     GRP1                   ;11
          LDA     (PTR3),Y               ;16
          STA     GRP0                   ;19
          LDA     (PTR2),Y               ;24
          STA     TEMPX                  ;27
          LDA     (PTR1),Y               ;32
          TAX                            ;35
          LDA     (PTR0),Y               ;39
          TAY                            ;41
          LDA     TEMPX                  ;44
          STA     GRP1                   ;47
          STX     GRP0                   ;50
          STY     GRP1                   ;53
          STA     GRP0                   ;56
          DEC     TEMPY                  ;61
          BPL     DISPLSCR               ;63/64

          LDX     #0                     ;65
          STX     GRP0                   ;68
          STX     GRP1                   ;71
          STA     WSYNC                  ;74
          STA     HMOVE                  ;3
          STX     GRP0                   ;6
          STX     VDELP0                 ;9
          STX     VDELP1                 ;12

          LDA     TIMER                  ;15
          AND     #$F                    ;17
          STA     TEMP1                  ;20
          ASL     A                      ;22
          ASL     A                      ;24
          ADC     TEMP1                  ;27
          TAY                            ;29
          LDA     TIMER                  ;32
          AND     #$F0                   ;34
          LSR     A                      ;36
          LSR     A                      ;38
          STA     TEMP1                  ;41
          LSR     A                      ;43
          LSR     A                      ;45
          ADC     TEMP1                  ;48
          TAX                            ;50
          LDA     SMALL1,Y               ;54
          ORA     SMALL2,X               ;58
          STA     PTR0                   ;61
          LDA     SMALL1+1,Y             ;65
          ORA     SMALL2+1,X             ;69
          STA     PTR0+1                 ;72
          STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     #0                     ;5
          STA     PF2                    ;8
          LDA     SMALL1+2,Y             ;12
          ORA     SMALL2+2,X             ;16
          STA     PTR0+2                 ;19
          LDA     SMALL1+3,Y             ;23
          ORA     SMALL2+3,X             ;27
          STA     PTR0+3                 ;30
          LDA     SMALL1+4,Y             ;34
          ORA     SMALL2+4,X             ;38
          STA     PTR0+4                 ;41

          LDA     TIMER2                 ;44
          AND     #$F                    ;46
          STA     TEMP1                  ;49
          ASL     A                      ;51
          ASL     A                      ;53
          ADC     TEMP1                  ;56
          TAY                            ;58
          LDA     TIMER2                 ;61
          AND     #$F0                   ;63
          LSR     A                      ;65
          LSR     A                      ;67
          STA     TEMP1                  ;70
          LSR     A                      ;72
          STA     WSYNC
          STA     HMOVE                  ;3
          LSR     A                      ;5
          ADC     TEMP1                  ;8
          TAX                            ;10
          LDA     SMALL1,Y               ;14
          ORA     SMALL2,X               ;18
          STA     PTR0+5                 ;21
          LDA     SMALL1+1,Y             ;25
          ORA     SMALL2+1,X             ;29
          STA     PTR0+6                 ;32
          LDA     SMALL1+2,Y             ;36
          ORA     SMALL2+2,X             ;40
          STA     PTR0+7                 ;43
          LDA     SMALL1+3,Y             ;47
          ORA     SMALL2+3,X             ;51
          STA     PTR0+8                 ;54
          LDA     SMALL1+4,Y             ;58
          ORA     SMALL2+4,X             ;62
          STA     PTR0+9                 ;65
          LDA     TIMER3                 ;68
          AND     #$F                    ;70
          STA     TEMP1                  ;73

          STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          ASL     A                      ;5
          ASL     A                      ;7
          ADC     TEMP1                  ;10
          TAY                            ;12
          LDA     TIMER3                 ;15
          AND     #$F0                   ;17
          LSR     A                      ;19
          LSR     A                      ;21
          STA     TEMP1                  ;24
          LSR     A                      ;26
          LSR     A                      ;28
          ADC     TEMP1                  ;31
          TAX                            ;33
          LDA     SMALL1,Y               ;37
          ORA     SMALL2,X               ;41
          STA     PTR0+10                ;44
          LDA     SMALL1+1,Y             ;48
          ORA     SMALL2+1,X             ;52
          STA     PTR0+11                ;55
          LDA     SMALL1+2,Y             ;59
          ORA     SMALL2+2,X             ;63
          STA     PTR0+12                ;66
          LDA     SMALL1+3,Y             ;70

          STA     WSYNC
          STA     HMOVE
          ORA     SMALL2+3,X
          STA     PTR0+13
          LDA     #4
          STA     NUSIZ0
          LDA     #1
          STA     NUSIZ1
          NOP
          STA     RESP0
          LDA     #0
          STA     COLUP0
          STA     COLUP1
          LDA     SMALL1+4,Y
          ORA     SMALL2+4,X
          STA     PTR0+14
          PLA
          PHA
          LDA     #$60
          STA     HMM0
          LDA     #$F0
          STA     HMBL
          STA     RESP1
          STA     RESBL
          STA     RESM0

          LDY     #10
TIMELOOP  STA     WSYNC
          STA     HMOVE                  ;3
          LDA     G,Y                    ;7
          STA     GRP0                   ;10
          LDA     L,Y                    ;14
          STA     GRP1                   ;17
          PLA
          PHA
          NOP
          LDA     T,Y                    ;30
          STA     GRP0+$100              ;34
          PLA
          PHA
          PLA
          PHA
          PLA
          PHA
          LDA     #0
          STA     HMM0
          STA     HMBL
          DEY
          STA     GRP1
          BPL     TIMELOOP

          STA     WSYNC
          STA     HMOVE
          STA     GRP0
          STA     GRP1
          STA     CTRLPF
          LDX     #$0F
          STX     COLUP0
          STX     COLUP1
          STX     COLUPF
          LDY     #4
          STA     HMM0

TIME2OOP  STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          BIT     GEAR                   ;6
          BMI     HIGEAR                 ;8 (9)
          LDA     LO,Y                   ;12
          BNE     GEARRET                ;15
HIGEAR    LDA     HI,Y                   ;13
          NOP                            ;15
GEARRET   STA     GRP0                   ;18
          LDA     PTR0+5,Y               ;22
          STA     GRP1                   ;25
          LDA     #0                     ;27
          STA     ENAM0                  ;30
          LDA     PTR0,Y                 ;34
          STA     GRP0                   ;37
          PLA
          PHA
          PLA
          PHA
          LDA     SEC,Y
          STA     ENABL
          STA     ENAM0
          LDA     PTR0+10,Y
          DEY
          STA     GRP1
          BPL     TIME2OOP

          STA     WSYNC
          STA     HMOVE
          INY
          STY     GRP0
          STY     GRP1

          INY
LOOPER
          STA     WSYNC
          STA     HMOVE
          DEY
          BPL     LOOPER
          INY
          STY     GRP0
          STY     GRP1
          STA     WSYNC
          STA     HMOVE
          STY     NUSIZ0+$100


; The following takes VEL as input and draws a velocity bar on the screen.
; The bar has two blank lines followed by 5 drawn lines

          DEY                            ;WHAT DOES THIS DO??
          STY     TEMP1
          STY     RESM0
          STY     RESM1
          STY     TEMP2
          LDA     #$D0
          STA     HMM1
          STY     TEMP3
          LDA     #$7
          STA     TEMP4
          LDA     #$1
          STA     NUSIZ1
          LDA     #$3F                   ;PLAY WITH THIS, DAMNIT
          STA     CTRLPF
          LDA     #$F
          STA     COLUP0
          STA     COLUP1
          NOP
          LDA     #$E0
          STY     HMP1
          STA     RESP0
          STA     RESP1
          STA     HMP0
          STA     WSYNC
          STA     HMOVE
          LDA     #$44
          STA     COLUPF
          LDA     VEL
          LSR     A
          TAY
          LSR     A
          LSR     A
          TAX
          LDA     BAR4,X
          STA     TEMP4
          STA     HMCLR
          STA     WSYNC
          STA     HMOVE
          TYA
          SEC
BALLLP    SBC     #$0F
          BCS     BALLLP
          EOR     #7
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          NOP
          NOP
          STA     HMBL
          STA     RESBL

          STA     WSYNC
          STA     HMOVE
          LDA     BAR1,X
          STA     TEMP1
          LDA     BAR2,X
          STA     TEMP2
          LDA     BAR3,X
          STA     TEMP3
          PHA
          PLA
          PHA
          PLA
          PHA
          PLA
          LDA     #$F0
          STA     HMBL
          LDA     #2
          STA     ENAM0
          STA     ENAM1
          STA     ENABL

          STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDY     #4                     ;5

BARLOOP
          LDA     TEMP1                  ;8
          STA     PF1                    ;11
          LDA     TEMP2                  ;14
          STA     PF2                    ;17
          LDX     ZERO,Y                 ;21
          STX     NUSIZ0                 ;24
          LDA     TWO,Y                  ;28
          STX     COLUBK                 ;31
          STA     GRP0                   ;34
          LDA     TEMP4                  ;37
          STA     PF1                    ;40
          LDA     TEMP3                  ;43
          LDX     #$86                   ;45
          STA     PF2                    ;48 * IT WORKS, TRUST ME
          LDA     HUNDRED,Y              ;52
          STA     GRP1                   ;55
          LDA     MPHA,Y                 ;59
          STX     COLUBK                 ;62
          LDX     MPHB,Y                 ;66
          STA     GRP0                   ;69*
          STX     GRP1                   ;72*
          STA     HMOVE                  ;+$100             ;0
          DEY                            ;2
          BPL     BARLOOP                ;5

          INY
          STY     ENAM0
          STY     ENAM1
          STY     ENABL
          STY     PF1
          STY     PF2
          STY     GRP0
          STY     GRP1
          STA     CXCLR


DODEC     LDA     CARYH
          CMP     #20
          LDA     NOTE
          STA     WSYNC
          STA     HMOVE
          BPL     CLOUD
          BCS     CLOUD
          LDA     TIMER
          BEQ     CLOUD
          SED
          LDA     GEAR
          AND     #4
          BEQ     RUNIT
          LDA     FRMCNT
          BNE     NOTDONE
          LDA     GEAR
          AND     #$FB
          STA     GEAR
          LDA     #$4
          STA     TIMER2
          STA     TIMER3
          BNE     NOCARRY
NOTDONE   AND     #$3F
          BNE     NOCARRY
          LDA     TIMER
;         SEC
          SBC     #0
          STA     TIMER
          JMP     NOCARRY
RUNIT     LDX     #2
          LDA     FRMCNT
          AND     #$F
          CMP     #5
          BCS     NOMORE
          INX
NOMORE    TXA
          CLC
          ADC     TIMER3
          STA     TIMER3
          BCC     NOCARRY
          LDA     TIMER2
          ADC     #0
          STA     TIMER2
          LDA     TIMER
          SBC     #0
          STA     TIMER
          BNE     NOCARRY
          LDA     PSCORE0
          AND     #$F0
          STA     PSCORE0
NOCARRY   CLD

* CLOUD ========================================================================

CLOUD     STA     WSYNC
          STA     HMOVE
          LDA     ZERX
          CMP     #$11
          BCS     SEC1
          SBC     #4
          BCS     SEC1
          ADC     #$A5
SEC1      STA     WSYNC
          STA     HMOVE
ZERLP     SBC     #$0F
          BCS     ZERLP
          EOR     #7
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          STA     HMP0
          STA     RESP0
          STA     WSYNC
          STA     HMOVE
          LDA     ZERX
          ADC     #$0F                   ;CARRY IS SET
          CMP     #$A0
          BCC     LESSONE
          SBC     #$A0
LESSONE   CMP     #$11
          BCS     SEC2
          SBC     #4
          BCS     SEC2
          ADC     #$A5
SEC2      NOP
          STA     HMCLR+$100
          STA     WSYNC
          STA     HMOVE
ONELP     SBC     #$0F
          BCS     ONELP
          EOR     #7
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          STA     HMP1
          STA     RESP1
          STA     WSYNC
          STA     HMOVE
          LDA     #$F
          STA     COLUP0
          STA     COLUP1
          LDA     #5
          STA     NUSIZ0
          STA     NUSIZ1
          LDY     #10
CLOUDLP   STA     HMCLR
          STA     WSYNC
          STA     HMOVE
          LDA     CLOUDA,Y
          STA     GRP0
          LDA     CLOUDB,Y
          STA     GRP1
          DEY
          BPL     CLOUDLP
          STA     WSYNC
          STA     HMOVE

* MOUNTAIN =====================================================================

          INY
          STY     ENABL
          STY     ENAM1
          STY     CTRLPF

REMOVE    STA     WSYNC
          STA     HMOVE

          STY     GRP0
          STY     GRP1
          STY     REFP0
          STY     REFP1
          LDA     #$24
          STA     COLUPF
          STA     COLUP1
          LDA     #$D2
          STA     COLUP0
          LDA     #$35
          STA     NUSIZ0
          STA     NUSIZ1
          LDY     #11
          STA     WSYNC
          STA     HMOVE

          LDA     ZERX
          ADC     #$32                   ;CARRY IS STILL SET
          CMP     #$A0
          BCC     LESSTWO
          SBC     #$A0
LESSTWO   CLC
          ADC     #$33
          CMP     #$A0
          BCC     LESSTHRE
          SBC     #$A0
LESSTHRE  CMP     #$11
          BCS     SEC3
          SBC     #4
          BCS     SEC3
          ADC     #$A5
SEC3      STA     TEMP1

          STA     WSYNC
          STA     HMOVE
BLLOP     SBC     #$0F
          BCS     BLLOP
          EOR     #7
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          STA     HMM1
          STA     RESM1

          STA     WSYNC
          STA     HMOVE
          LDA     TEMP1
          PHA
          PLA
          PHA
          PLA
          NOP
          STA     HMCLR

          STA     WSYNC
          STA     HMOVE
MISLP     SBC     #$0F
          BCS     MISLP
          EOR     #7
          ASL     A
          ASL     A
          ASL     A
          ASL     A
          STA     HMM0
          STA     RESM0

          STA     WSYNC
          STA     HMOVE
          PHA
          PLA
          PHA
          PLA
;         PHA
          PLA
          STA     HMCLR

          STA     WSYNC
          STA     HMOVE

          LDA     #2
          STA     ENAM0

PEAKLP    LDA     TOP-9,Y
          STA     GRP0
          STA     GRP1
          LDA     NUS-9,Y
          STA     NUSIZ0

          STA     HMM0
          DEY

          CPY     #8
          STA     WSYNC
          STA     HMOVE                  ;3
          BNE     PEAKLP                 ;8/9

          LDA     #$FF                   ;10
          STA     GRP0                   ;13
          STA     GRP1                   ;16
;         LDA     #2                     ;18     CORRECT BIT IS SET
          STA     ENAM1                  ;21
          LDA     #$B0                   ;23
          STA     HMP1                   ;26
          LDA     #$40                   ;28
          STA     HMP0                   ;31
          LDA     #$20                   ;33
          STA     HMM0                   ;36
          LDA     #$E0                   ;38
          STA     HMM1                   ;41
          LDX     #L(CHUNK-1)            ;43
          TXS                            ;45
          DEY                            ;52
HILLOP    STA     WSYNC                  ;66     76
          STA     HMOVE                  ;3

          PLA                            ;17
          STA     PF0                    ;20
          PLA                            ;24
          STA     PF1                    ;27
          PLA                            ;31
          STA     PF2                    ;34
          PLA                            ;38
          STA     PF0                    ;41
          PLA                            ;45
          DEY                            ;47
          STA     PF1                    ;50
          PLA                            ;54
          TXS                            ;56
          STA     PF2                    ;59
          STA     WSYNC                  ;73
          STA     HMOVE+$100             ;3

          NOP
          PLA
          PHA

          PLA                            ;17
          STA     PF0                    ;20
          PLA                            ;24
          STA     PF1                    ;27
          PLA                            ;31
          STA     PF2                    ;34
          PLA                            ;39
          STA     PF0                    ;41
          PLA                            ;45
          STA     PF1                    ;48
          PLA                            ;52
          TSX                            ;54
          STA     PF2                    ;57

          DEY                            ;59
          BPL     HILLOP                 ;61/62
          INY                            ;68
          STA     WSYNC                  ;71
          STA     HMOVE                  ;3
          STY     GRP0                   ;6
          STY     GRP1                   ;9
          STY     ENAM0                  ;12
          STY     ENAM1                  ;15
          LDX     #$24                   ;17
          STX     COLUBK                 ;20
          STY     PF0                    ;23
          STY     PF1                    ;26
          STY     PF2                    ;29


;         LDA     #$24                   ;55
;         STA     COLUBK                 ;58
          STA     WSYNC                  ;61
          STA     HMOVE                  ;3
          STA     HMCLR                  ;6
          LDA     #$21                   ;8
          STA     CTRLPF                 ;11
;         LDA     #0                     ;13
;         STA     GRP0                   ;16
;         STA     GRP1                   ;19
;         STA     ENAM0                  ;22
;         STA     ENAM1                  ;25

          LDA     #$27                   ;27
          STA     NUSIZ0                 ;30
          LDA     NEXTNUSZ               ;32
          STA     NUSIZ1                 ;35

          STA     WSYNC                  ;38
          STA     HMOVE                  ;3
          PLA
          PHA
          NOP
          NOP

          LDA     #$2C                   ;16
          STA     COLUP1                 ;19
          LDX     #RESBL                 ;21
          TXS                            ;23
          LDA     ROADX                  ;26
          AND     #$F                    ;28
          STA     TEMP1+$100             ;32
          NOP                            ;34
          NOP                            ;36
          NOP                            ;38
          STA     RESP0+$100             ;44
          BEQ     ATEDGE                 ;46 (47)
          LDX     #$D0                   ;48
          BIT     PER                    ;51
          BMI     OTHEROAD               ;53 (54)
          LDA     #$30                   ;55
          STA     HMM0                   ;58
          LDA     #$80                   ;60
          JMP     DOWSYNC                ;63 ===>
OTHEROAD  LDA     #$E0                   ;56
          STA     HMM0                   ;59
          LDA     #$D0                   ;61
          JMP     DOWSYNC                ;64 ===>
ATEDGE    LDX     #$10                   ;49
          BIT     PER                    ;52
          BMI     OTHEROA2               ;54 (55)
          LDA     #$30                   ;56
          STA     HMM0                   ;59
          LDA     #$00                   ;61
          JMP     DOWSYNC                ;64 ===>
OTHEROA2  LDA     #$00                   ;57
          STA     HMM0                   ;60
          LDA     #$20                   ;62
DOWSYNC   STA     HMBL                   ;67 MAX
          STX     HMM1                   ;70

          STA     WSYNC
          STA     HMOVE

          LDA     #H(LINES)
          STA     LINECOLR+1
          LDA     #H(DASH)
          STA     DASHENA+1
          LDA     #H(CARCOL1)
          STA     CARCOLOR+1
          NOP
          NOP
          NOP
          NOP
          LDA     CAR1GR                 ;TEST*********************************
          STA     HMP1
          STA     WSYNC
          STA     HMOVE
          NOP
          NOP
          NOP
          NOP
          AND     #$F
          TAX
CAR1XLP   DEX
          BPL     CAR1XLP
          STA     RESP1
          STA     WSYNC                  ;DOUG GET RID OF THIS IF YOU CAN
          STA     HMOVE

DOLINES   LDA     POS                    ;6
          CMP     #14                    ;8
          BCC     NOSUB14                ;10
          SBC     #14                    ;12
NOSUB14   CMP     #7                     ;14
          BCC     DOFIRSTL               ;16
          ADC     #LINES2-LINES-7-1      ;18
DOFIRSTL  TAX                            ;20
          ADC     #L(LINES-11)           ;22
          STA     LINECOLR               ;25
          TXA                            ;27
          ADC     #L(DASH-12)            ;29
          STA     DASHENA                ;32
          LDY     #L(CARCOL1)            ;34
          LDA     VEL                    ;37
          BEQ     OTHERCOL               ;39
          LSR     A                      ;41
          LSR     A                      ;43
          LSR     A                      ;45
          LSR     A                      ;47
          LSR     A                      ;49
          TAX                            ;51
          LDA     TIRESPED,X             ;55
          AND     FRMCNT                 ;58
          BEQ     THISCOL                ;60
OTHERCOL  LDY     #L(CARCOL2)            ;62
THISCOL   STY     CARCOLOR               ;65

          LDA     #0                     ;67
          STA     HMP1                   ;70 HMOVE ONCE ON CAR1, THEN KILL
          LDA     #H(CARP0)              ;72

          STA     WSYNC                  ;REMOVE THIS IF NECESSARY
          STA     HMOVE

          STA     CARGRAPH+1
          STA     CARPF+1
          BIT     GEAR
          BVC     NOEXP

          LDA     FRMCNT
          LSR     A
          LSR     A
          AND     #$01
          CLC
          ADC     GEAR
          AND     #$03
          TAY

          LDA     #L(EXPCOL)
          STA     CARCOLOR

          LDA     EXPNTRS,Y

          STA     CARPF
          STA     CARGRAPH
          LDY     TEMP1
          JMP     STAW

NOEXP
          LDA     #L(CARP0)
          LDX     DDPER
          BMI     LFTCHK
RGTCHK    CPX     #$5
          BCC     NORIGHTT
          LDA     #L(CARP0R)
          JMP     NORIGHTT

LFTCHK    CPX     #$FC
          BCS     NORIGHTT
          LDA     #L(CARP0L)
NORIGHTT  LDX     #L(CARPLAYF)
ANOEXP    STX     CARPF
          STA     CARGRAPH

          LDY     TEMP1                  ;WAS TEMPY

          LDA     GEAR                   ;CHECK FOR END OF LAP BLINK
          AND     #$04
          BEQ     STAW

          LDA     FRMCNT
          CMP     #$40
          BCS     STAW
          AND     #$08
          BEQ     STAW

          LDA     #L(EXPLPF)
          STA     CARGRAPH
          STA     CARPF

STAW      CPY     #$A
          BEQ     ITSA
          STA     WSYNC
          STA     HMOVE
          NOP
          BNE     NOTA
ITSA      BIT     PER
          STA     WSYNC
          STA     HMOVE
          BPL     A1
          LDA     #$00
          STA     HMBL
          LDA     #$00
          BEQ     A2
A1        LDA     #$80
          STA     HMBL
          LDA     #$A0
          NOP
A2        STA     HMM1
          LDA     #$00
          STA     HMM0
          DEY
          DEY
          DEY
          DEY
ROADLP2   DEY
          BPL     ROADLP2
          BRK
NOTA      CPY     #0
          BEQ     BRK
ROADLP    DEY                            ;13
          BPL     ROADLP                 ;15 (17)
BRK       BRK                            ;22

; THIS BREAK WRITES TO RESBL, RESM1, AND RESM0 AND THEN RETURNS TO THE IR VECTOR
;    AT $FFFE WHICH SHOULD BE SET TO THE NEXT ADDRESS
;         STA     RESM0                  ;23 MIN
;         STA     RESM1                  ;26 MIN
;         STA     RESBL                  ;29 MIN


IR        STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDY     #49                    ;5
          LDA     #4                     ;7
          STA     COLUBK                 ;10
          STA     COLUP0                 ;13
          STA     COLUPF                 ;16
          STA     HMP1                   ;  ****TO KILL HMOVE ON CAR1
          LDA     #2                     ;18
          STA     ENAM0                  ;21
          STA     ENABL                  ;24
          LDA     ROADX                  ;27
          STA     HMM0                   ;30
          STA     HMM1                   ;33
          STA     HMBL                   ;36
          BIT     PER                    ;39
          BPL     SECT1                  ;41 (42)
          JMP     SECT5                  ;44

SECT1     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK
          STA     GRP1                   ;11
          LDA     (LINECOLR),Y           ;16
          STA     COLUP0                 ;19
          STA     COLUPF                 ;22
          LDA     BEND,Y                 ;26
          AND     #$F0

          ADC     #$10                   ;32
          STA     HMM0                   ;35
          SBC     #$0F                   ;37
          STA     HMM1                   ;40
          SBC     #$0E                   ;42
          STA     HMBL                   ;45
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          TAX
          LDA     DIV1L,X                ;49
          LDX     #3                     ;51
          CLC                            ;53
          ADC     LEFTEDGE               ;56
          STA     LEFTEDGE               ;59
          STA     WSYNC
          STA     HMOVE
          BMI     LEFTNOO1
          CMP     #RBORDER
          BCC     LEFTOK1
LEFTNOO1  INX
LEFTOK1   STX     ENAM0
          STX     ENABL
          LDX     #3
          ADC     WIDTHD,Y
          BMI     MIDNOOK1
          CMP     #RBORDER
          BCC     MIDOK1
MIDNOOK1  INX
MIDOK1    TXA
          AND     (DASHENA),Y
          STA     ENAM1
          DEY
          CPY     #$2D
          BNE     SECT1

;.........................................
SECT3     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK
          STA     GRP1                   ;11
          LDA     (LINECOLR),Y           ;16
          STA     COLUP0                 ;19
          STA     COLUPF                 ;22
          LDA     BEND,Y                 ;26
          AND     #$F0

          ADC     #$10                   ;32
          STA     HMM0                   ;35
          SBC     #$0F                   ;37
          STA     HMM1                   ;40
          SBC     #$0E                   ;42
          STA     HMBL                   ;45
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          TAX
          LDA     DIV1L,X                ;49
          LDX     #3                     ;51
          CLC                            ;53
          ADC     LEFTEDGE               ;56
          STA     LEFTEDGE               ;59
          STA     WSYNC
          STA     HMOVE
          BMI     LEFTNOO3
          CMP     #RBORDER
          BCC     LEFTOK3
LEFTNOO3  INX
LEFTOK3   STX     ENAM0
          LDX     #3
          ADC     WIDTHD,Y
          BMI     MIDNOOK3
          CMP     #RBORDER
          BCC     MIDOK3
MIDNOOK3  INX
MIDOK3    STX     TEMP1
          LDX     #3
          ADC     WIDTHD,Y
          BMI     RIGHTNO3
          CMP     #RBORDER
          BCC     RIGHTOK3
RIGHTNO3  INX
RIGHTOK3  STX     ENABL
          LDA     TEMP1
          AND     (DASHENA),Y
          STA     ENAM1
          DEY
          CPY     #$A
          BNE     SECT3
          LDA     #0
          STA     ENAM1

;.........................................

SECT4     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK               ;11
          STA     GRP1                   ;14
          LDA     (CARGRAPH),Y           ;19
          STA     GRP0                   ;22
          LDA     (CARPF),Y              ;27

          AND     #$E0                   ;GRTEST***********

          STA     PF2                    ;30
          LDA     (CARCOLOR),Y           ;35
          STA     COLUP0                 ;38
          STA     TEMP1                  ;41 THIS IS NOT NEEDED
          LDA     BEND,Y                 ;45
          AND     #$F0                   ;IS THIS NEEDED
          ADC     #$10                   ;47
          STA     HMM0                   ;50
          SBC     #$1E                   ;52
          STA     HMBL                   ;55
          LSR     A                      ;57
          LSR     A                      ;59
          LSR     A                      ;61
          LSR     A                      ;63
          TAX                            ;65
          LDA     DIV1L,X                ;69
          LDX     #3                     ;71
          CLC                            ;73
;;;       STA     WSYNC                  ;NOT NEEDED
          STA     HMOVE
          ADC     LEFTEDGE
          STA     LEFTEDGE
          BMI     LEFTNOO4
          CMP     #RBORDER
          BCC     LEFTOK4
LEFTNOO4  INX
LEFTOK4   STX     ENAM0
          LDX     #3
          ADC     WIDTHD,Y
          ADC     WIDTHD,Y
          BMI     RIGHTNO4
          CMP     #RBORDER
          BCC     RIGHTOK4
RIGHTNO4  INX
RIGHTOK4  STX     ENABL

          DEY
          BPL     SECT4
          JMP     JMPOVRSN


SECT5     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK
          STA     GRP1                   ;11
          LDA     (LINECOLR),Y           ;16
          STA     COLUP0                 ;19
          STA     COLUPF                 ;22
          LDA     BEND,Y                 ;26
          AND     #$F0                   ;28

          ADC     #$10                   ;32
          STA     HMBL                   ;35
          SBC     #$0F                   ;37
          STA     HMM1                   ;40
          SBC     #$0E                   ;42
          STA     HMM0                   ;45
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          TAX
          LDA     DIV1L,X                ;49
          LDX     #3                     ;51
          CLC                            ;53
          ADC     LEFTEDGE               ;56
          STA     LEFTEDGE               ;59
          STA     WSYNC
          STA     HMOVE
          BMI     LEFTNOO5
          CMP     #RBORDER
          BCC     LEFTOK5
LEFTNOO5  INX
LEFTOK5   STX     ENAM0
          STX     ENABL
          LDX     #3
          ADC     WIDTHD,Y
          BMI     MIDNOOK5
          CMP     #RBORDER
          BCC     MIDOK5
MIDNOOK5  INX
MIDOK5    TXA
          AND     (DASHENA),Y
          STA     ENAM1
          DEY
          CPY     #$2D
          BNE     SECT5

;.........................................

SECT7     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK
          STA     GRP1                   ;11
          LDA     (LINECOLR),Y           ;16
          STA     COLUP0                 ;19
          STA     COLUPF                 ;22
          LDA     BEND,Y                 ;26
          AND     #$F0                   ;28

          ADC     #$10                   ;32
          STA     HMBL                   ;35
          SBC     #$0F                   ;37
          STA     HMM1                   ;40
          SBC     #$0E                   ;42
          STA     HMM0                   ;45
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          TAX
          LDA     DIV1L,X                ;49
          LDX     #3                     ;51
          CLC                            ;53
          ADC     LEFTEDGE               ;56
          STA     LEFTEDGE               ;59
          STA     WSYNC
          STA     HMOVE
          BMI     LEFTNOO7
          CMP     #RBORDER
          BCC     LEFTOK7
LEFTNOO7  INX
LEFTOK7   STX     ENABL
          LDX     #3
          ADC     WIDTHD,Y
          BMI     MIDNOOK7
          CMP     #RBORDER
          BCC     MIDOK7
MIDNOOK7  INX
MIDOK7    STX     TEMP1
          LDX     #3
          ADC     WIDTHD,Y
          BMI     RIGHTNO7
          CMP     #RBORDER
          BCC     RIGHTOK7
RIGHTNO7  INX
RIGHTOK7  STX     ENAM0
          LDA     TEMP1
          AND     (DASHENA),Y
          STA     ENAM1
          DEY
          CPY     #$A
          BNE     SECT7
          LDA     #0
          STA     ENAM1

;.........................................

SECT8     STA     WSYNC                  ;0
          STA     HMOVE                  ;3
          LDA     (CAR1PTR),Y            ;8
          AND     CAR1MASK               ;11
          STA     GRP1                   ;14
          LDA     (CARGRAPH),Y           ;19
          STA     GRP0                   ;22
          LDA     (CARPF),Y              ;27

          AND     #$E0                   ;GRTEST********************

          STA     PF2                    ;30
          LDA     (CARCOLOR),Y           ;35
          STA     COLUP0                 ;38
          STA     TEMP1                  ;41 THIS IS NOT NEEDED
          LDA     BEND,Y                 ;45

          AND     #$F0                   ;47
          ADC     #$10                   ;49
          STA     HMBL                   ;52
          SBC     #$1E                   ;54
          STA     HMM0                   ;57
          LSR     A                      ;59
          LSR     A                      ;61
          LSR     A                      ;63
          LSR     A                      ;65
          TAX                            ;67
          LDA     DIV1L,X                ;71
          LDX     #3                     ;73
          CLC                            ;75
;;;;      STA     WSYNC                  ;NOT NEEDED
          STA     HMOVE
          ADC     LEFTEDGE
          STA     LEFTEDGE
          BMI     LEFTNOO8
          CMP     #RBORDER
          BCC     LEFTOK8
LEFTNOO8  INX
LEFTOK8   STX     ENABL
          LDX     #3
          ADC     WIDTHD,Y
          ADC     WIDTHD,Y
          BMI     RIGHTNO8
          CMP     #RBORDER
          BCC     RIGHTOK8
RIGHTNO8  INX
RIGHTOK8  STX     ENAM0

          DEY
          BPL     SECT8

JMPOVRSN  JMP     GOBANKF

SPEED     LDA     CARYH
          CMP     #20
          BCC     DOVEL
JENDR     JMP     ENDRACE

DOVEL     LDA     TIMER
          BNE     RDOVEL

          LDA     VEL
          BEQ     JENDR

RDOVEL    LDA     VEL
          BEQ     SETVELX
          LSR     A
          STA     TEMP1
          LSR     A
          CLC
          ADC     TEMP1
          LSR     A
          LSR     A
          LSR     A
          LSR     A
          STA     TEMP1
          LDA     FRMCNT
          AND     #2
          LSR     A
          ORA     TEMP1
SETVELX   STA     TEMP2

          CLC
          ADC     PSCORE0
          STA     PSCORE0
          AND     #$F
          CMP     #8
          BMI     ROLLOK

          INC     CARY
          BNE     NOCARYH
          INC     CARYH
          LDA     CARYH
          TAY
          CMP     #4
          BEQ     LAP1Q
          AND     #3
          BNE     NOCARYH

          CPY     #20
          BCC     DOTIMER

          LDA     PSCORE0
          AND     #$F0
          STA     PSCORE0
          JMP     NOCARYH

DOTIMER   LDA     CARYH
          LSR     A
          LSR     A
          TAY

          LDA     TIMER
          CLC
          SED
          ADC     EXTIME-2,Y

HARD      CLD
          STA     TIMER
          LDA     #L(EXTENDED-OPENING+8)
          STA     NOTE
          LDA     GEAR
          ORA     #4
          STA     GEAR
          LDA     #2
          STA     DURATION
          STA     FRMCNT

          BPL     NOCARYH

LAP1Q     LDA     TIMER2
          CMP     #$73
          BCS     NOCARYH
          LDA     GEAR
          AND     #$BF
          STA     GEAR
          LDA     #L(STALL-OPENING-1)
          STA     NOTE
          LDA     #2
          STA     DURATION
          LDA     PSCORE0
          AND     #$F0
          STA     PSCORE0
          LDA     #0
          STA     VEL
          STA     PASSEDCS
          STA     DDPER
          STA     VELC1
          LDA     #$35
          STA     CAR1Y
          LDA     QUALED
          ORA     #$80
          STA     QUALED

NOCARYH   LDA     PSCORE0
          AND     #$F7
          STA     PSCORE0

          LDA     #$10
          LDX     #$00
          JSR     SCORIT

ROLLOK    CLD

;         LDA     CARYH
;         CMP     #20
;         BCS     ENDRACE

          LDA     TEMP2
          CLC
          ADC     POS
          CMP     #28
          STA     POS
          BCC     SPEEDRET
          SBC     #28
          STA     POS
          JMP     SPEEDRET

;NDRACE   LDA     VEL
;         SEC
;         SBC     #6
;         BPL     STAVEL
;         LDA     #0
;
;         LDX     CARYH
;         CPX     #4
;         BCS     STAVEL
;
;         STA     PASSEDCS
;
;TAVEL    STA     VEL
ENDRACE   LDA     NOTE
          BPL     SPEEDRET
          LDA     VEL
          BNE     SPEEDRET

          LDA     FRMCNT
          AND     #$07
          BNE     SPEEDRET

          LDY     TIMER
          BNE     ADDSECS

          LDA     PASSEDCS
          BEQ     SPEEDRET

          LDA     QUALED
          BMI     DIDQUAL
          LDA     #0
          STA     PASSEDCS
          BEQ     SPEEDRET

DIDQUAL
          LDA     #$50
          LDX     #$00
          JSR     SCORIT

          CLD
          DEC     PASSEDCS
          BNE     SCORNOIS

          LDA     #2
          STA     MOVEC1CT

SCORNOIS  LDA     #$D
          STA     AUDV1
          STA     AUDC1
          STA     AUDF1
          BPL     SPEEDRET

ADDSECS
          LDA     #$00
          LDX     #$02
          JSR     SCORIT

          TYA
          SBC     #0
          STA     TIMER

          CLD
          BPL     SCORNOIS

SPEEDRET  JMP     GOSUBRF

SCORIT    SED
          CLC
          ADC     PSCORE0
          STA     PSCORE0
          TXA
          ADC     PSCORE1
          STA     PSCORE1
          LDA     #0
          ADC     PSCORE2
          STA     PSCORE2
          RTS

;###################
TITLE     STA     WSYNC

          LDA     #3
          STA     NUSIZ0
          STA     NUSIZ1
          STA     VDELP0
          STA     VDELP1
          LDA     #$44
          STA     COLUP0
          STA     COLUP1
          LDY     #$10
          STY     HMP1
          DEY
          STY     COLUPF
          LDA     #$81
          STA     CTRLPF
          STA     RESP0
          STA     RESP1
          LDY     #30
          STA     WSYNC
          STA     HMOVE

CTITLELP  STA     WSYNC
          STA     COLUBK
          DEY
          BPL     CTITLELP
          LDY     #40
          STY     TEMPY


BTITLELP  STA     WSYNC
          LDA     CHECKERS+2,Y
          STA     PF1
          LDA     CHECKERS+6,Y
          ORA     #$80
          STA     PF2
          DEY
          BNE     BTITLELP

          DEY
          STY     PF2

TITLELP   LDY     TEMPY                  ;67
          LDA     PP1,Y                  ;71
          LDX     CHECKERS+2,Y
          STA     WSYNC
          STX     PF1
          STA     GRP0
          LDA     PP2,Y                  ;7
          STA     GRP1                   ;10
          LDA     PP3,Y                  ;14
          STA     GRP0                   ;17
          LDA     PP4,Y                  ;21
          STA     TEMPX                  ;24
          LDX     PP5,Y                  ;28
          LDA     PP6,Y                  ;32
          TAY                            ;34
          LDA     TEMPX                  ;37
          NOP                            ;41
          STA     GRP1                   ;47
          STX     GRP0                   ;50
          STY     GRP1                   ;53
          STA     GRP0                   ;56
          DEC     TEMPY                  ;61
          BPL     TITLELP                ;63/64

          LDX     #0                     ;65
          STX     GRP0                   ;68
          STX     GRP1                   ;71
          STA     WSYNC                  ;74
          STX     GRP0                   ;6
          STX     VDELP0                 ;9
          STX     VDELP1                 ;12

          LDY     #39
TITLESTA  STA     WSYNC
          LDA     CHECKERS,Y
          STA     PF1
          LDA     CHECKERS+4,Y
          ORA     #$80
          STA     PF2
          DEY
          BNE     TITLESTA

          LDX     #192-128-28+1
TITLEST2  STA     WSYNC
          STY     PF1
          STY     PF2
          DEX
          BNE     TITLEST2
          STX     COLUBK
          JMP     GOBANKF


BAR2      DB      $00,$00,$00,$00,$00,$01,$03,$07,$0F,$1F,$3F,$7F,$FF
          DB      $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF             ;,$FF
L         DB      -1,0,$7E,$7E,$60,$60,$60,$60,$60,$60,$60

BAR3      DB      $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          DB      $80,$C0,$E0,$F0,$F8,$FC,$FE,$FF                  ;,$FF
T         DB      -1,0,$18,$18,$18,$18,$18,$18,$18,$FF,$FF


SMALL1    DB      $E,$A,$A,$A,$E
          DB      $E,$4,$4,$4,$C
          DB      $E,$8,$E,$2,$E
          DB      $E,$2,$6,$2,$E
          DB      $2,$2,$E,$A,$A
          DB      $E,$2,$E,$8,$E
          DB      $E,$A,$E,$8,$E
          DB      $4,$4,$2,$2,$E
          DB      $E,$A,$E,$A,$E
          DB      $E,$2,$E,$A,$E

TOP       DB      $7E,$3C,$18

ENDD0
          ORG     $DB00


CARP0     DB      $C3,$DB,$C3,$DB,$C3,$C3,$7E,$66,$66,$66,$00

CARP0L    DB      $C3,$CF,$C3,$DB,$C3,$C3,$3E,$C4,$C4,$C4                  ;,$00
CARCOL2   DB      $00,$00,$00,$00,$00,$00,$28                  ;,$00,$00,$00,$00
EXP1      DB      $00,$00,$00,$00,$18,$3C,$18                   ;$00,$00,$00,$00
BAR4      DB      0,0,0,0
EXPLPF    DB      $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          DB      $00,$00,$00,$00,$00,$00,$01

CARP0R    DB      $C3,$F3,$C3,$DB,$C3,$C3,$7C,$23,$23,$23                  ;,$00
EXPCOL    DB      $00,$46,$FF,$00,$46,$FF,$FF,$46,$00,$46                  ;,$00
CARPLAYF  DB      $00,$C0,$C0,$40,$C0,$C0,$00,$80,$C0,$C0                  ;,$00
EXP2      DB      $00,$00,$3C,$66,$42,$42,$66,$24,$18                  ;,$00,$00
EXP3      DB      $00,$00,$24,$42,$81,$42,$00,$24,$18                  ;,$00,$00
CARCOL1   DB      $00,$00,$00,$00,$08,$00,$28,$00,$00,$08                  ;,$00
EXP4      DB      $00,$DB,$5A,$18,$66,$66,$5A,$53,$18                  ;,$00,$00
SEC       DB      0,0,2,2,2

NUS       DB      $35,$25,$15

TIRESPED  DB      $FF,$0F,$7,$7,$3,$3,$3,$3

MPHB      DB      $12,$9E,$52,$D2,$00

DIV1L     DB      -2,-3,-4,-5,-6,-7,-8,7,6,5,4,3,2,1,0,-1

TWO       DB      $F7,$84,$F4,$14,$F7

G         DB      -1,0,$3C,$7E,$C3,$CF,$CF,$C0,$C3,$7E,$3C

HI        DB      $97,$92,$F2,$92,$97

LO        DB      $E6,$89,$89,$89,$86

WIDTHD    DB      51,50,49,48,47,46,45,44,43,42,41,40,39
          DB      38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19
          DB      18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,0
          DB      0,0,0,0,0                                                ;,0,0
CLOUDB    DB      $00,$00,$7F,$FB,$BE,$FC,$E8,$58,$78,$30,$30

ENDDB
          ORG     $DC00

;NOTE: L(NUMTAB) MUST = 0
NUMTAB    DB      $38,$6C,$C6,$C6,$C6,$6C,$38,0        ;ZERO
          DB      $7E,$18,$18,$18,$18,$38,$18,0        ;ONE
          DB      $FE,$C0,$E0,$3C,$06,$C6,$7C,0        ;TWO
          DB      $FC,$06,$06,$7C,$06,$06,$FC,0        ;THREE
          DB      $0C,$0C,$0C,$FE,$CC,$CC,$CC,0        ;FOUR
          DB      $FC,$06,$06,$FC,$C0,$C0,$FC,0        ;FIVE
          DB      $7C,$C6,$C6,$FC,$C0,$C0,$7C,0        ;SIX
          DB      $30,$30,$18,$18,$0C,$06,$FE,0        ;SEVEN
          DB      $7C,$C6,$C6,$7C,$C6,$C6,$7C,0        ;EIGHT
NINE      DB      $7C,$06,$06,$7E,$C6,$C6,$7C,0        ;NINE
          DB      $38,$6C,$C6,$C6,$C6,$6C,$38     ;,0        ;ZERO
QUOTE     DB      0,0,0,$24,$24,$6C,$6C              ;SECONDS
FLAG      DB      $54,$AA,$54,$AA,$54,$AA,$54     ;,$AA      ;CHECKERED FLAG
CHECKERS  DB      $AA,$AA,$AA,$AA,$55,$55,$55,$55,$AA,$AA
          DB      $AA,$AA,$55,$55,$55,$55,$AA,$AA,$AA,$AA
          DB      $55,$55,$55,$55,$AA,$AA,$AA,$AA,$55,$55
          DB      $55,$55,$AA,$AA,$AA,$AA,$55,$55,$55,$55
          DB      $AA,$AA,$AA,$AA,$55,$55,$55,$55
                                         ;48

EXTIME    DB      $53,$50,$48
MPHA      DB      $8A,$AB,$DA,$8B                      ;,0
DASH      DB      0,0,0,2,2,2
          DB      0,0,0,0,0,0,0,0,2,2,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,2,0
          DB      0,2,0,2,0,2,0,2,0,2,0,2,0,2,0
DASH2     DB      0,0,0,0,0,0
          DB      0,0,2,2,2,0,0,0,0,0,0,0,2,2,0,0,0,0,0,2,0,0,0,0,2,0,0,2
          DB      0,0,2,0,2,0,2,0,2,0,2,0,2,0,2
                                         ;45

                                         ;11
ENDDC     DS      0
          ORG     $DD00

EXPNTRS   DB      L(EXP1),L(EXP2),L(EXP3),L(EXP4)

PP1       DB      $0F,$1F,$3C,$30,$70,$60,$E0,$D4,$D4,$DC
          DB      $D4,$D4,$C9,$C0,$C0,$C0,$C0,$C0,$C0,$C0
          DB      $C0,$D1,$D1,$D1,$DD,$D5,$D5,$DD,$C0,$C0
          DB      $E0,$E0,$E0,$70,$70,$38,$3C,$1C,$1F,$0F,$03
PP3       DB      $F0,$F8,$1C,$0C,$06,$06,$06,$56,$56,$97
          DB      $57,$57,$93,$01,$02,$05,$05,$05,$02,$01
          DB      $00,$25,$25,$25,$25,$25,$25,$75,$00,$00
          DB      $BB,$A2,$A2,$A3,$A2,$A2,$A3,$00,$00,$FF,$FF
PP4       DB      $0F,$1F,$38,$30,$60,$60,$60,$68,$68,$EB
          DB      $EA,$CB,$00,$80,$40,$A0,$20,$A0,$40,$80
          DB      $00,$D1,$53,$53,$55,$59,$59,$D1,$01,$01
          DB      $81,$01,$01,$81,$01,$01,$81,$01,$00             ;,$FF,$FF
PP2       DB      $FF,$FF,$00,$00,$00,$00,$00,$95,$95,$9D
          DB      $95,$95,$C9,$00,$00,$00,$00,$00,$00,$00
          DB      $00,$DD,$45,$45,$5D,$51,$51,$DD,$00,$00
          DB      $23,$22,$22,$3A,$2A,$2A,$3B,$00,$80             ;,$FF,$FF
PP5       DB      $FF,$FF,$01,$00,$00,$00,$00,$BB,$A8,$BB
          DB      $A8,$BB,$00,$00,$01,$07,$1F,$3C,$38,$30
          DB      $70,$70,$70,$71,$3A,$3D,$1A,$15,$AA,$55
          DB      $AA,$55,$AA,$54,$A8,$50,$A0,$00,$01,$FF,$FF
PP6       DB      $00,$80,$C0,$E0,$60,$70,$30,$B0,$B0,$B0
          DB      $B0,$B0,$70,$70,$E0,$C0,$00,$00,$00,$00
          DB      $00,$00,$00,$40,$A0,$40,$A0,$40,$B8,$5C
          DB      $BE,$4E,$07,$03,$03,$07,$0E,$1E,$FC,$F8,$E0


ZERO      DB      $A1,$81,$81,$81,$A1    ;5

HUNDRED   DB      $BC,$A4,$A4,$A4,$BC    ;5


ENDDD     DS      0
          ORG     $DE00

STAMP1    DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      $00,$00,$C6,$FE,$FE,$D6,$54,$7C,$54
          DB      0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0
STAMP2    DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
STAMP3    DB      $00,$00,$00,$00,$C6,$FE,$D6,$7C,$54
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ;STAM4
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      $00,$00,$00


STAMP4    DB      $00,$00,$00,$7C,$7C,$6C
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      $00,$00,$00,$00,$00,$00
STAMP5    DB      $00,$FE,$EE
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      $00,$00,$00,$00,$00,$00,$00,$00,$38
          DB      0,0,0,0,0,0

STAMP6    DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0
          DB      $00,$00,$00,$00,$00,$00,$00,$00,$1C
          DB      0,0,0

SMALL2    DB      $E0,$A0,$A0,$A0,$E0
          DB      $E0,$40,$40,$40,$C0
          DB      $E0,$80,$E0,$20,$E0
          DB      $E0,$20,$60,$20,$E0
          DB      $20,$20,$E0,$A0,$A0
          DB      $E0,$20,$E0,$80,$E0
          DB      $E0,$A0,$E0,$80,$E0
          DB      $40,$40,$20,$20,$E0
          DB      $E0,$A0,$E0,$A0,$E0
          DB      $E0,$20,$E0,$A0,$E0
                                         ;50


LINES     DB      R,R,R,R,R,R,R
          DB      W,W,W,W,W,W,W,R,R,R,R,R,W,W,W,W,R,R,R,W,W,W,R,R,W2,W2,R2,R2
          DB      W2,R2,W2,R2,W3,R2,W3,R2,W4,R3,W5,R3,W5,$88
                                         ;45

LINES2    DB      R,R,R,R,R,R,R
          DB      R,R,R,R,R,R,R,W,W,W,W,W,R,R,R,R,W,W,W,R,R,R,W,W,R2,R2,W2,W2
          DB      R2,W2,R2,W2,R2,W3,R2,W3,R3,W4,R3,W5,R3,$88
                                         ;45
W         EQU     $E
W2        EQU     $C
W3        EQU     $A
W4        EQU     $8
W5        EQU     $6
R         EQU     $44
R2        EQU     $42
R3        EQU     $40

BAR1      DB      $70,$78,$7C,$7E,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
          DB      $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
                                         ;22

CLOUDA    DB      $00,$3E,$7F,$FF,$FB,$EF,$DE,$7C,$74,$70,$20
                                         ;11



ENDDE     DS      0

          ORG     $DFEC
GOSUBRF   JMP     DOSUBRF
DOSUBRD   JMP     SPEED
GOBANKF   JMP     DOBANKF
DOBANKD   JMP     KERNEL

          ORG     $DFFC                  ;I/R VECTOR
          DB      $00,$F0                ;DFFC FOR BURNING
          DB      L(IR),H(IR)

          ORG     $FFFC                  ;I/R VECTOR
          DB      $00,$F0                ;FFFC FOR SIMULATOR
          DB      L(IR),H(IR)
          END
