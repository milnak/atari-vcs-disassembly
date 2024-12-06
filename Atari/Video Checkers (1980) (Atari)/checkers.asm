        .TITLE  "VCS CHECKERS BY CAROL SHAW 15/15/80 9:41 AM"
;        [Retyped by White Flame 2020-04-11]
PAL     =       0               ;0 => NTSC, 1=> PAL VERSION
PRNT    =       0               ;0 => ROM,  1=> DEBUG VERSION WHICH PRINTS ON TI TERMINAL
STACK   =       0               ;0 => NORMAL ALPHA-BETA "STACK",
ROMSTR  =       $F000           ;ROM START ADDR
;
;       DK1:SCHKG.SRC 
;       COPYRIGHT ATARI, 1980
;       STARTED 10/1/79 
;
;       THE ALPHA-BETA PRUNING ALGORITHM USED HEREIN IS BASED ON THE LISP 
;       PROGRAM ON PAGE 321 OF "ARTIFICIAL INTELLIGENCE" BY PATRICK HENRY 
;       WINSTON, 1977, ADDISON-WESLEY PUBLISHING COMPANY, INC. PHILIPPINES.
;       ALSO ON "SOME STUDIES IN MACHINE LEARNING USING THE GAME OF CHECKERS", 
;       BY A. L. SAMUEL, PARTS I AND II, IN THE IBM JOURNAL OF RESEARCH AND DEVELOPMENT, 
;       JULY 1959 AND NOVEMBER 1967.  PART I IS ALSO IN "COMPUTERS AND THOUGHT", 
;       BY EDWARD A. FEIGENBAUM AND JULIAN FELDMAN, PP.71-105, 1963, MCGRAW-HILL. 
;
;
;       STELLA (TIA) REGISTER ADDRESSES
;
VSYNC   =       $00     ;BIT        1  VERTICAL SYNC SET-CLR    1=>START
VBLANK  =       $01     ;BIT  76    1  VERTICAL BLANK SET-CLR, PORT CONTROL (INPT0-INPT5)
WSYNC   =       $02     ;STROBE        WAIT FOR HORIZ BLANK
RSYNC   =       $03     ;STROBE        RESET HORIZ SYNC COUNTER
NUSIZ0  =       $04     ;BITS   54 210 NUMBER-SIZE PLAYER/MISSILE 0
NUSIZ1  =       $05     ;BITS   54 210 NUMBER-SIZE PLAYER/MISSILE 1
COLUP0  =       $06     ;BITS 7654321  COLOR(4)-LUM(3) PLAYER 0
COLUP1  =       $07     ;BITS 7654321  COLOR(4)-LUM(3) PLAYER 1
COLUPF  =       $08     ;BITS 7654321  COLOR(4)-LUM(3) PLAYFIELD
COLUBK  =       $09     ;BITS 7654321  COLOR(4)-LUM(3) BACKGROUND
CTRLPF  =       $0A     ;BITS   54 210 PLAYFIELD CONTROL & BALL
REFP0   =       $0B     ;BIT      3    REFLECT PLAYER 0. 1=>REFLECT
REFP1   =       $0C     ;BIT      3    REFLECT PLAYER 1
PF0     =       $0D     ;BITS 7654     PLAYFIELD REG BYTE 0 (REVERSED)
PF1     =       $0E     ;BITS ALL      PLAYFIELD REG BYTE 1
PF2     =       $0F     ;BITS ALL      PLAYFIELD REG BYTE 2 (REVERSED)
RESP0   =       $10     ;STROBE        RESET PLAYER 0
RESP1   =       $11     ;STROBE        RESET PLAYER 1
RESM0   =       $12     ;STROBE        RESET MISSILE 0
RESM1   =       $13     ;STROBE        RESET MISSILE 1
RESBL   =       $14     ;STROBE        RESET BALL
AUDC0   =       $15     ;BITS     3210 AUDIO CONTROL 0
AUDC1   =       $16     ;BITS     3210 AUDIO CONTROL 1
AUDF0   =       $17     ;BITS     3210 AUDIO FREQUENCY 0
AUDF1   =       $18     ;BITS     3210 AUDIO FREQUENCY 1
AUDV0   =       $19     ;BITS     3210 AUDIO VOLUME 0
AUDV1   =       $1A     ;BITS     3210 AUDIO VOLUME 1
GRP0    =       $1B     ;BITS ALL      GRAPHICS FOR PLAYER 0
GRP1    =       $1B     ;BITS ALL      GRAPHICS FOR PLAYER 1
ENAM0   =       $1D     ;BIT        1  ENABLE MISSILE 0.  1=> ENABLE
ENAM1   =       $1E     ;BIT        1  ENABLE MISSILE 1
ENABL   =       $1F     ;BIT        1  ENABLE BALL
HMP0    =       $20     ;BITS 7654     HORIZ MOTION PLAYER 0.  0-7 => LEFT
HMP1    =       $21     ;BITS 7654     HORIZ MOTION PLAYER 1.  F-8 => RIGHT
HMM1    =       $22     ;BITS 7654     HORIZ MOTION MISSILE 0
HMM2    =       $23     ;BITS 7654     HORIZ MOTION MISSILE 1
HMBL    =       $24     ;BITS 7654     HORIZ MOTION BALL
VDELP0  =       $25     ;BIT         0 VERTICAL DELAY PLAYER 0.  1=> VDEL ON
VDELP1  =       $26     ;BIT         0 VERTICAL DELAY PLAYER 1
VDELBL  =       $27     ;BIT         0 VERTICAL DELAY BALL
RESMP0  =       $28     ;BIT        1  RESET MISSILE TO PLAYER 0.  1-> MISSILE RESET TO PLAYER
RESMP1  =       $29     ;BIT        1  RESET MISSILE TO PLAYER 1
HMOVE   =       $2A     ;STROBE        ACT ON HORIZ MOTION
HMCLR   =       $2B     ;STROBE        CLEAR ALL HM REGISTERS
CXCLR   =       $2C     ;STROBE        CLEAR COLLISION LATCHES
;       
;       READ ADDRESSES - BITS 7 & 6 ONLY
;       
CXM0P   =       $30     ;M0*P1  M0*P0
CXM1P   =       $31     ;M1*P0  M1*P1
CXP0FB  =       $32     ;P0*PF  P0*BL
CXP1FB  =       $33     ;P1*PF  P1*BL
CXM0FB  =       $34     ;M0*PF  M0*BL
CXM1FB  =       $35     ;M1*PF  M1*BL
CXBLPF  =       $36     ;BL*PF
CXPPMM  =       $37     ;P0*P1  M0*M1
INPT0   =       $38     ;POT 0.  BIT7=1 => POT CAPACITOR IS COMPLETELY CHARGED?
INPT1   =       $39     ;POT 1
INPT2   =       $3A     ;POT 2
INPT3   =       $3B     ;POT 3
INPT4   =       $3C     ;JOYSTICK 0 BUTTON.  B7=0 => BUTTON PRESSED
INPT5   =       $3D     ;JOUSTICK 1 BUTTON
;       
;       PIA AND TIMER (6532) LOCATIONS
;       
SWCHA   =       $280    ;P0,P1 JOYSTICKS (RLDU,RLDU), POT TRIGGERS, KEYBOARD, DRIVING CONTROLLER
CTLSWA  =       $281    ;SWCHA I/O CONTROL      1-OUTPUT
SWCHB   =       $282    ;CONSOLE SWITCHES (READ ONLY) P1B,P0B,X,X,B/W,X,SELECT,RESET IF 0
CTLSWB  =       $283    ;UNUSED
INTIM   =       $284    ;INTERVAL TIMER INPUT   0=>TIMER UP
TIM1T   =       $294    ;TIMER OUTPUT:  1 MACHINE CYCLE/TICK (.838 MICROSEC)
TIM8T   =       $295    ;8 MACHINE CYCLES/TICK
TIM64T  =       $296    ;64 MC'S/TICK
T1024T  =       $297    ;1024 MACHINE CYCLES/TICK (858.2 MICROSECONDS)
;       
;       KIM SUBROUTINES
;       
CRLF    =       $1E2F   ;PRINT CRLF ON TI
PRTBYT  =       $1E3B   ;PRINT ACCUMULATOR IN HEX ASCII ON TI
GETCH   =       $1E5A   ;READ ASCII CHAR FROM TI INTO A
OUTSP   =       $1E9E   ;PRINT SPACE ON TI
OUTCH   =       $1EA0   ;PRINT ACCUMULATOR AS ASCII CHAR ON TI
GETBYT  =       $1F9D   ;READ TWO HEX ASCII CHARS FROM TI INTO A


;----------------------------------


;               CHECKERS EQUATES
MAXMAX  =       11              ;MAX STACK DEPTH FOR ALPHA-BETA
        .IF     STACK
MAXMAX  =       22
        .ENDIF

JMPLEN  =       9               ;LENGTH OF JMPTBL (LIST OF JUMPED PIECES)

LINCHR  =       16              ;# OF LINES/CHAR
EMPTY   =       0               ;EMPTY SQUARE INDEX INTO CHARACTER TABLE
CHECKER =       1*LINCHR
KING    =       2*LINCHR
CURS    =       3*LINCHR

BLANK   =       10*16+10        ;TWO BLANK CHARS
JP      =       11*16+11        ;"JP"

CLP0    =       0               ;PLAYER 0 (HUMAN, LEFT JOYSTICK)
CLP1    =       $80             ;PLAYER 1 (COMPUTER, RIGHT PLAYER)

HUMCHK  =       CLP0+CHECKER    ;HUMAN CHECKER (NOT KING)
HUMKNG  =       CLP0+KING       ;HUMAN KING
HUMCRS  =       CLP0+CURS       ;HUMAN CURSOR
CMPCHK  =       CLP1+CHECKER    ;COMPUTER CHECKER
CMPKNG  =       CLP1+KING       ;COMPUTER KING
CMPCRS  =       CLP1+CURS       ;COMPUTER CURSOR

HMIN    =       5               ;MIN. GAMNO FOR HARD BOARD COLORS

DARK    =       $36             ;DARK CHECKER COLOR/LUM
LIGHT   =       $0C             ;LIGHT CHECKER COLOR/LUM
EDARK   =       0               ;EASY DARK SQUARE COLOR.  0 IS ACTUALLY USED INSTEAD OF EDARK
ELIGHT  =       $34             ;EASY LIGHT SQUARE COLOR (RED)
ELIAT   =       $36             ;EASY LIGHT IF ATTRACT
HDARK   =       $B0             ;HARD DARK SQUARE COLOR (GREEN)
HLIGHT  =       $26             ;HARD LIGHT SQUARE COLOR (BUFF OR CREAM OR WHITE)
HLIAT   =       $26             ;HARD LIGHT SQUARE IF ATTRACT
LTCHR   =       $0C             ;LIGHT CHAR COLOR
DRKCHR  =       $92             ;DARK CHARACTER COLOR
GSCON   =       45              ;GAME SELECT TIMER INITIAL VALUE
OVRCON  =       $25             ;OVERSCAN TIMER INITIAL VALUE
VBLCON  =       44              ;VBLANK TIMER INITIAL VALUE
VBTIM   =       30              ;1/2 SEC. VBLANK AFTER CALCULATION -- CHANGE FOR PAL
FRZTIM  =       45              ;FREEZE TIMER FOR END OF HUMAN MOVE

;       
;       PAL VERSIONS OF THE ABOVE
;       
        .IF     PAL
DARK    =       $66             ;DARK CHECKER COLOR/LUM
LIGHT   =       $0C             ;LIGHT CHECKER COLOR/LUM
EDARK   =       0               ;EASY DARK SQUARE COLOR
ELIGHT  =       $64             ;EASY LIGHT SQUARE COLOR (RED)
ELIAT   =       $66             ;EASY LIGHT IF ATTRACT
HDARK   =       $50             ;HARD DARK SQUARE COLOR (GREEN)
HLIGHT  =       $46             ;HARD LIGHT SQUARE COLOR (BUFF OR CREAM OR WHITE)
HLIAT   =       $46             ;HARD LIGHT SQUARE IF ATTRACT
LTCHR   =       $0C             ;LIGHT CHAR COLOR
DRKCHR  =       $B2             ;DARK CHARACTER COLOR
GSCON   =       38              ;GAME SELECT TIMER INITIAL VALUE
OVRCON  =       $2B             ;OVERSCAN TIMER INITIAL VALUE
VBLCON  =       $36             ;VBLANK TIMER INITIAL VALUE
VBTIM   =       $32             ;1/2 SEC. VBLANK AFTER CALCULATION -- CHANGE FOR PAL
FRZTIM  =       38              ;FREEZE TIMER FOR END OF HUMAN MOVE
        .ENDIF


RB      =       -5              ;SQUARE # OFFSET FOR RIGHT BACKWARD (DOWN) MOVEMENT
LB      =       -4              ;                    LEFT  BACKWARD
RF      =       4               ;                    RIGHT FORWARD
LF      =       5               ;                    LEFT FORWARD

PLAY2   =       $10             ;TWO-PLAYER GAME # IN DECIMAL

DROP    =       $36             ;PIECE DROPPING SOUND FOR AUDV0
PICKUP  =       $30             ;PIECE PICKUP SOUND FOR AUDV0
PURE2   =       4               ;PURE TONE/4 FOR AUDC0
ERRSND  =       15              ;ERROR SOUND FOR AUDC0

MLT     =       $08             ;MULTIPLE JUMP MASK
MST     =       $04             ;MUST JUMP MASK

CORN    =       4               ;DOUBLE CORNER CREDIT

ENDPC   =       4*2             ;MIN NUMBER OF HUMAN PIECES FOR NON-END GAME

ADDTRM  =       $20             ;TERM TO ADD TO MAGNITUDE OF SCORE IF STACK IS FULL IN TERMNODE


;----------------------------------


;                       VARIABLES (RAM PAGE ZERO)
        *=$80
;                       THE FOLLOWING RAM LOCS ARE CLEARED DURING RESET:
;A-B MEANS USED BY ALPHA-BETA PRUNING ROUTINE
;SAVE MEANS ALPHA-BETA PRUNING ROUTINE DOES NOT ALTER
ZROBGN
BOARD
        *=*+35          ;CHECKER BOARD (1 BYTE / SQUARE) SQUARES 8,17,26 ARE NOT USED. A-B
PIECE
        *=*+1           ;CURRENT PIECE BEING MOVED. A-B

JMPI
        *=*+1           ;INDEX INTO JMPLIST --  <0 => NO JUMPS. A-B
MSTJMP
        *=*+1           ;0 => ACTIVE PLAYER CAN'T JUMP   4 => ACTIVE PLAYER MUST JUMP.  A-B
MLTJMP
        *=*+1           ;8 => CONTINUING MULTIPLE JUMP. A-B & MAIN
MSTFLG
        *=*+1           ;MSTJMP SAVED WHILE NEW MSTJMP IS COMPUTED. A-B
MLTFLG
        *=*+1           ;MLTJMP BACKUP. A-B

HPIECE
        *=*+1           ;HUMAN PIECE COUNT.  KING=3, CHECKER=2. A-B
CPIECE
        *=*+1           ;COMPUTER PIECE COUNT. A-B

CURSOR
        *=*+1           ;SQUARE # FOR BLINKING CURSOR. SAVE
FROMB
        *=*+1           ;BINARY "FROM" SQUARE (INTERNAL NUMBERING). A-B
TOSQRB
        *=*+1           ;BINARY "TO" SQUARE.  A-B

HKING
        *=*+1           ;HUMAN KING COUNT
CKING
        *=*+1           ;COMPUTER KING COUNT (1 FOR EACH KING)

ZROEND
;
;                       THE FOLLOWING RAM LOCS ARE NOT CLEARED DURING RESET
;
; GAMNO = 1 TO GMAX2 IN DECIMAL
;       1-9             REGULAR CHECKERS
;       10              2-PLAYER (EITHER)
;       11-19           GIVE-AWAY (LOSING)
GAMNO
        *=*+1           ;GAME NUMBER
COLHUM
        *=*+1           ;HUMAN CHECKER COLOR (NO ATTRACT ADDED IN). SAVE
COLCMP
        *=*+1           ;COMPUTER CHECKER COLOR (NO ATTRACT ADDED IN). SAVE?
;
T0
        *=*+1           ;TEMP (USED IN  KERNEL, ETC.). A-B & MAIN
T1
        *=*+1           ;TEMP (USED IN KERNEL, ETC.). A-B & MAIN
XSAVE   =       T1      ;X REG SAVED FOR JMPCHK ROUTINE. A-B & MAIN
T2
        *=*+1           ;A-B & MAIN
YSAVE   =       T2      ;. A-B & MAIN
NUM     =       T2      ;2 BYTE NUMERATOR FOR STATIC EVALUATION DIVIDE (USED FOR RATIO OF PIECE COUNTS).A-B
T3
        *=*+1           ;A-B & MAIN
ANYMVE  =       T3      ;>0 => ACTIVE PLAYER CAN MOVE. A-B & MAIN -- USED ONLY BY JMPCHK
T6
        *=*+1           ;ANOTHER TEMP
DEN
        *=*+1           ;DENOMINATOR. A-B
T7
        *=*+1           ;TEMP
T8
        *=*+1           ;YET ANOTHER TEMP -- USED TO SAVE BK COLOR

ACTIVE
        *=*+1           ;ACTIVE OR CURRENT PLAYER (HUMAN=0, COMPUTER=$80). A-B & MAIN
DEPTH
        *=*+1           ;CURRENT DEPTH OF TREE SEARCH. A-B & SET UP BY MAIN

JMPSQR
        *=*+1           ;SQUARE # FOR PIECE BEING JUMPED. A-B
INDEX
        *=*+1           ;CURRENT OFFSET INDEX (0-3). A-B
FRSMOV
        *=*+1           ;$80 => FIRST MOVE (MAY BE MULTIPLE JUMP). A-B
;       B7=1 => FIRST MOVE, B6=1 => FIRST MOVE AT THIS LEVEL, BETTER MOVE FOUND [todo - misaligned in original?]
XMOVE
        *=*+1           ;"FROM" MOVE SQUARE FROM MOVCHK. A-B & MAIN
TIMOUT
        *=*+1           ;TIMER

OLDPBQ
        *=*+1           ;SWCHB FOR THIS FRAME.
FRAME
        *=*+1           ;FRAME COUNTER -- COUNTS UP.
PRNCNT
        *=*+1           ;B7=1 => PRUNE (FOR MULTIPLE JUMPS).  B6-B0 = RANDOM MOVE COUNTER

JMPLST
        *=*+JMPLEN      ;SQUARES FOR PIECES JUMPED BY COMPUTER, <0 => KING. A-B & MAIN
JMPEND
;
;       THE FOLLOWING ALPHA-BETA "STACK" OVERLAP THE MAIN PROGRAM VARS WHICH
;       ARE LISTED LAST.  THEY ALSO OVERLAP JMPLST WITH THE EXCEPTION OF THE FIRST 3 BYTES.
;
        *=JMPLST+3
        .IF     STACK
AX=*
        *=$180
        .ENDIF          ;ALLOW FOR BIGGER STACK IF DEBUG
FROMT
        *=*+MAXMAX      ;FROM(I-1) = FROM SQUARE FOR DEPTH I. A-B
;       B7=1 => FIRST MOVE, B6=1 => FIRST MOVE AT THIS LEVEL, BETTER MOVE FOUND
OTHER
        *=*+MAXMAX      ;OTHER(I-1) = OTHER FOR DEPTH I. A-B
; B7-6 = CAPTURED PIECE, B5-4 = MOVED PIECE, B3 = MLTJMP, B2 = MSTJMP, B1-0 = OFFSET INDEX
ALPHAL
        *=*+MAXMAX+1+1  ;ALPHAL(I) = ALPHA(DEPTH) LSB. A-B
ALPHAH
        *=*+MAXMAX+1+1  ;ALPHAH(I) = ALPHA(DEPTH)/256. A-B
ALPEND

        .IF     STACK
        *=AX
        .ENDIF

;
;                       THE FOLLOWING VARS OVERLAP THE ALPHA-BETA "STACK" AND T4-SCRRPF:
;
        *=JMPLST+JMPLEN
COLP0
        *=*+1           ;COLOR OF P0 (ATTRACT ADDED IN)
COLP1
        *=*+1           ;COLOR OF P1

COL0
        *=*+2           ;COLOR OF 1ST PIECE IN ROW (FOR KERNEL ONLY)
COL1
        *=*+2
COL2
        *=*+2
COL3
        *=*+2

PNTR0
        *=*+2           ;POINTERS TO SQUARE GRAPHICS
PNTR1
        *=*+2
PNTR2
        *=*+2
PNTR3
        *=*+2

SQUARE
        *=*+1           ;SQUARE # FOR USE IN KERNEL
SQREND
;
;       THE FOLLOWING PARTIALLY OVERLAP BOTH THE ALPHA-BETA "STACK" AND
;       COLP0-SQUARE.
;
        *=JMPLST+JMPLEN
T4
        *=*+1
T5
        *=*+1

SCRLP0
        *=*+5           ;P0 "SCORE" GRAPHICS
SCRRP1
        *=*+5           ;P1
SCRLPF
        *=*+5           ;LEFT PF1 GRAPHICS
SCRRPF
        *=*+5           ;RIGHT PF1 GRAPHICS

MOVVAL
        *=*+1           ;VALUE IN MOVE SQUARE. SET UP AT END OF A-B. DON'T SAVE
MOVFLG
        *=*+1           ;1 => DISPLAY COMPUTER'S MOVE. DON'T SAVE
WINSAV
        *=*+1           ;WINNING PLAYER, 0=> NO WIN. DON'T SAVE
FROMTO
        *=*+1           ;0 => FROM, 1=> TO. DON'T SAVE

CURSC
        *=*+1           ;COMPUTER CURSOR. SET UP AT END OF A-B. DON'T SAVE
MOVE
        *=*+1           ;CURRENT MOVE. SET UP AT END OF A-B. DON'T SAVE
OLDINP
        *=*+1           ;JOYSTICK BUTTON VALUE FOR CURRENT PLAYER FOR LAST FRAME. DON'T SAVE
GSTIM
        *=*+1           ;GAME SELECT TIMER -- COUNTS DOWN TO 0. DON'T SAVE

OLDPB6
        *=*+1           ;OLD SWCHB VALUE, 0=>NORMAL, <>0=>SETUP (BIT 6 ONLY). DON'T SAVE
ILEGAL
        *=*+1           ;>0 => MAKE ILLEGAL MOVE SOUND. DON'T SAVE
ATIM
        *=*+1           ;ATTRACT MODE TIMER -- COUNTS UP. DON'T SAVE
GFLG2
        *=*+1           ;0=>ATTRACT  <> 0 => NOT ATTRACT. DON'T SAVE
BLNKTM
        *=*+1           ;FRAME COUNTER FOR VBLANK AFTER CALCULATION(DOWN TO 0). DON'T SAVE
SNDTIM
        *=*+1           ;TIMER FOR SOUNDS (COUNTS DOWN TO 0). DON'T SAVE
FREEZE
        *=*+1           ;TIMER FOR FREEZE AFTER HUMAN MOVE (0=END OF FREEZE)
COLSQ
        *=*+1           ;SQUARE COLOR FOR KERNEL


FROM
        *=*+1           ;FROM SQUARE FOR "SCORE" . DON'T SAVE
TOSQR
        *=*+1           ;TO SQUARE FOR "SCORE". DON'T SAVE
SCP0
        *=*+1           ;GAME # FOR "SCORE". SAVE
SCP1
        *=*+1           ;# OF PLAYERS FOR "SCORE". DON'T SAVE


;                       F8-FF ARE USED FOR STACK (4 LEVELS DEEP FOR NOW)


;----------------------------------


;                               SCORE KERNEL (TOP LINE OF CHARS)
        *=ROMSTR
        .IF     PRNT
        *=$E000                 ;RELOCATE IF DEBUG TO MAKE ROOM FOR MORE CODE
        JMP     PSTART
        .ENDIF

JMPBAK
        LDX     #5-1            ;5 BYTES PER CHARACTER
SCOR2
;                               MACHINE CYCLE COUNTS ARE GIVEN
        LDY     #2              ;50 49  REPEAT EACH BYTE TWICE
SCOR3
        STA     WSYNC           ;47 53 46 52
        LDA     SCRLPF,X        ;4
        STA     PF1             ;7  GAME # (AT LEFT)
        LDA     SCRLP0,X        ;11
        STA     GRP0            ;14 "FROM" SQUARE
        LDA     SCRRP1,X        ;18
        STA     GRP1            ;21 "TO" SQUARE


        LDA     #0              ;23 MISSILE 0 FOR DASH BETWEEN "FROM" AND "TO"
        CPX     #2              ;25  X=0 ON LAST TIME THROUGH SO CARRY IS CLEAR
        BNE     SCOR4           ;27 28
        TXA                     ;29 X=2
SCOR4
        STA     ENAM0           ;32 31

        LDA     SCRRPF,X        ;36 35
        DEY                     ;38 37
        STA     PF1             ;41 40 # OF PLAYERS (AT RIGHT)
        BNE     SCOR3           ;44 43 43 42

        DEX
        BPL     SCOR2           ;48 47 46  X=$FF  Y=0


;----------------------------------


;       CHECKERBOARD KERNEL
;
;                               X=$FF    Y=0
;                               CARRY IS CLEAR => LAST SQUARES AT LEFT,
;                               NEXT SQUARES AT RIGHT.
        LDA     COLSQ           ;49
        STA     WSYNC           ;52
        STA     COLUP1          ;3   SET UP P1 COLOR FOR TOP RIGHT OF TOP RIGHT SQUARE
        LDA     #$31            ;5  8 CLOCK BALL, REFLECT PLAYFIELD
        STA     CTRLPF          ;8
        STY     PF1             ;11
        STY     GRP0            ;14
        STY     GRP1            ;17
;                               SET HORIZONTAL POSITION OF PLAYERS, MISSILE AND BALL
        LDA     #$E0            ;19  2 TO RIGHT
        STA     HMBL            ;22
        TXA                     ;24  INIT MSG'S OF CHAR POINTERS FOR KERNEL  ($FF)  [todo - hex omitted from here forward, autogen from bins]
        STA     HMM1            ;27  $FX -- 1 TO RIGHT
        STA     PNTR0+1         ;30
        STA     RESP1           ;33     POSITION PLAYER 1 (P1)  (MUST OCCUR AT THIS TIME)
        LDX     #6              ;35     NOTE THAT RESET TAKES 4-6 CLOCKS
        STX     NUSIZ0          ;38  3 COPIES OF PLAYER, MEDIUM SEPARATION
        STY     HMP1            ;41  Y=0
        STA     RESP0           ;44     POSITION P0 (MUST OCCUR AT THIS TIME)
        LDX     #$30            ;46
        STX     NUSIZ1          ;49  8 CLOCK MISSILE, 1 COPY OF PLAYER 0
        STA     PNTR1+1         ;52
        STA     PNTR2+1         ;55
        STA     PNTR3+1         ;58
        LDA     #$10            ;60  1 TO LEFT
        STA     HMP0            ;63
        STA     RESBL           ;66     POSITION BALL (MUST OCCUR AT THIS TIME)
        STA     RESM1           ;69     POSITION MISSILE #1
        STA     WSYNC           ;72 0
        STA     HMOVE           ;3 MOVE OBJECTS A FEW CLOCKS FOR EXACT POSITIONING
        LDA     T8              ;CHANGE BK COLOR
        STA     COLUBK          ;IF B/W
        STA     WSYNC           ;12
        STA     HMCLR           ;3
        LDA     #$C0            ;5
        STA     HMP1            ;8   4 TO RIGHT
        STA     HMP0            ;11

        LDY     #35-4           ;13  START AT TOP LEFT OF BOARD -- BOARD(31) TO BOARD(35)

;
;       DISPLAY NEXT ROW OF CHECKERS
;
LOOP1
        STY     SQUARE          ;16 25
        LDX     #3*2            ;18 27  SET UP COLORS AND GRAPHICS FOR 4 CHECKERS IN THIS ROW
;
;       SET UP GRAPHICS IN RAM
;
KRNLP
        LDA     BOARD,Y         ;4
        BMI     KRN10           ;6 7
        STA     PNTR0,X         ;10  HUMAN PIECE OR EMPTY
        LDA     COLP0           ;13
        JMP     KRN15           ;16
LOOP15  BCS     LOOP20          ;34  FOR LOOP2 DELAY

KRN10
        AND     #$7F            ;9  COMPUTER PIECE
        STA     PNTR0,X         ;13
        LDA     COLP1           ;16
KRN15
        STA     COL0,X          ;20 20
        INY                     ;22
        DEX                     ;24
        DEX                     ;26
        BPL     KRNLP           ;29  4*29-1=115 M.C.'S
;
;       MIN = 18+115+3 = 136 = 76+60
;       MAX = 27+115+3 = 145 = 76+69
;
        .IF     PAL             ;PUT TWO EXTRA LINES AT BOTTOM OF SQUARE IF PAL
        JSR     WAIT2           ;DO 2 WSYNC'S. JSR & RTS EACH TAKE 6 MC'S
        .ENDIF
        STA     WSYNC           ;3
        STA     HMOVE           ;3  MOVE PLAYERS 4 MORE CLOCKS (RIGHT OR LEFT)
;                               SET UP BALL AND PLAYFIELD
        BCS     K100            ;5 6
        SEC                     ;7  CS => AT RIGHT
        LDA     #$C3            ;9  PLAYFIELD 2
        LDX     #3              ;11  PF1
        LDY     #2              ;13  ENABLE BALL
        BCS     K110            ;16  JMP
K100
        CLC                     ;8  CC => AT LEFT
        LDA     #$3C            ;10  PLAYFIELD 2
        TAX                     ;12  PF1
        LDY     #0              ;14 DISABLE BALL
K110
        STA     PF2             ;19 17
        STX     PF1             ;22
        STY     ENAM1           ;25
        STY     ENABL           ;28

        STA     WSYNC           ;31 29  MOVE 4 MORE CLOCKS
        STA     HMOVE           ;3
        .IF     PAL             ;PUT TWO EXTRA LINES AT BOTTOM OF SQUARE IF PAL
        JSR     WAIT3           ;DO 3 WSYNC'S. JSR & RTS EACH TAKE 6 MC'S
        .ENDIF
        .IF     PAL-1
        STA     WSYNC           ;6 0   WAIT 1 MORE LINE
        .ENDIF
        LDA     #$40            ;2      4 TO LEFT
        BCS     K130            ;4 5
        LDA     #$C0            ;6      4 TO RIGHT
K130
        STA     HMP0            ;9 8
        STA     HMP1            ;12 11

        LDY     #LINCHR-1       ;14 13

;                               DISPLAY ONE ROW OF CHECKER BOARD
;
;       DISPLAY NEXT TV LINE
;
LOOP2
        STA     WSYNC           ;16 15 72 76 0  WAIT FOR NEXT LINE
        LDA     COL0            ;3 STORE COLOR AND GRAPHICS FOR LEFT CHECKER
        STA     COLUP1          ;6
        LDA     (PNTR0),Y       ;11
        STA     GRP1            ;14

        LDA     COL1            ;17  STORE COLOR AND GRAPHICS FOR NEXT CHECKER
        STA     COLUP0          ;20
        LDA     (PNTR1),Y       ;25
        STA     GRP0            ;28

        BCS     LOOP15          ;30 31     4 EXTRA MACHINE CYCLES IF CARRY SET (SQUARES SHIFTED TO RIGHT)
LOOP20
        LDA     COLSQ           ;33 37  LOAD DARK SQUARE COLOR
        STA     COLUP1          ;36 40

        LDX     COL2            ;39 43  STORE COLOR & GRAPHICS FOR NEXT CHECKER
        LDA     (PNTR2),Y       ;44 48
        STX     COLUP0          ;47 51  TIMING IS CRITICAL FROM HERE TO NEXT WSYNC
        STA     GRP0            ;50 54

        LDX     COL3            ;53 57  STORE COLOR & GRAPHICS FOR RIGHT CHECKER
        LDA     (PNTR3),Y       ;58 62
        STA     GRP0            ;61 65
        STX     COLUP0          ;64 68

        DEY                     ;66 70
        BPL     LOOP2           ;69 73 68 72    CONTINUE FOR REST OF LINES IN THIS ROW OF SQUARES

;                               MOVE TO RIGHT OR LEFT 16 CLOCKS FOR NEXT ROW
;                               (4 CLOCKS/MOVE * 4 MOVES)    Y=$FF
        STA     WSYNC           ;71 75
        STA     HMOVE           ;3  EXECUTE MOVE
        INY                     ;5  Y=0
        STY     GRP1            ;8
        STY     GRP0            ;11

        STA     WSYNC           ;14 0
        STA     HMOVE           ;3  MOVE SOME MORE

        PHP                     ;6 SAVE CARRY
        LDA     SQUARE          ;9
        SBC     #4              ;11  SUBTRACT 5 IF CARRY IS CLEAR (COMPENSATES FOR BOARD NUMBERING)
        PLP                     ;15  RESTORE CARRY
        TAY                     ;17

        BMI     FRAMLP          ;19
        JMP     LOOP1           ;22  CONTINUE
;                               END OF KERNELS


;----------------------------------



;       INITIALIZATION

PSTART  SEI                     ;DISABLE INTERRUPTS
        CLD                     ;BINARY ARITHMETIC
        LDX     #0
        TXA

INLP    STA     0,X             ;CLEAR HARDWARE REGISTERS AND RAM
        INX
        BNE     INLP

        DEX                     ;$FF
        TXS                     ;INIT STACK PTR

        .IF     PRNT
        STA     PRFLG           ;0 -- CLEAR PRINT FLAGS IF DEBUG
        STA     PRDEP
        STA     PRCNT
        .ENDIF

        INC     GAMNO           ;1

        LDA     SWCHB           ;SAVE INITIAL PORT REAING
        STA     OLDPBQ
        AND     #$40
        STA     OLDPB6
        LDX     #$30
        STX     AUDF1           ;FOR WIN SOUND
        INX
        STX     CTRLPF          ;$31: 8 CLOCK BALL, REFLECT PLAYFIELD
        LDX     #4
        STX     AUDC1

        JSR     RESET           ;SET UP BOARD


;----------------------------------


;                               END OF FRAME -- RESTORE BOARD AFTER DISPLAY
FRAMLP
        .IF     PAL             ;TWO EXTRA LINES AT BOTTOM OF BOTTOM SQUARE IF PAL
        JSR     WAIT3           ;DO 3 WSYNC'S AND RETURN
        .ENDIF
        .IF     PAL-1
        STA     WSYNC           ;ANOTHER LINE AT BOTTOM OF BOARD IF NOT PAL
        .ENDIF
        LDX     #OVRCON
        STA     WSYNC
        STX     TIM64T          ;SET TIMER FOR OVERSCAN (? LINES)
        LDX     #0
        STX     PF2             ;CLEAR PLAYFIELD
        STX     PF1


        INC     FRAME
        BNE     FRMLP2
        INC     ATIM
        BNE     FRMLP2
        LDA     #0              ;GO INTO ATTRACT
        STA     GFLG2
FRMLP2
        LDA     MOVFLG
        BEQ     FRAM10          ;NO COMPUTER MOVE

;                               COMPUTER MOVE IS BEING DISPLAYED --- RESTORE
        CLC
        JSR     JMPSET          ;CLEAR OUT JUMPED PIECES, IF ANY
        LDX     CURSC
        LDA     #0
        STA     BOARD,X
FRAM10
        LDX     MOVE            ;"TO"
        LDA     MOVVAL
        STA     BOARD,X

        LDX     CURSOR          ;"FROM"
        LDA     PIECE
        STA     BOARD,X         ;RESTORE CURRENT SQUARE


        LDA     BLNKTM          ;STILL BLANKING AT END OF COMPUTER MOVE?
        BNE     BLKJMP          ;YES. SKIP


        LDA     SWCHB           ;NO. SAVE NEW CONSOLE SWITCH PORT VALUE
        TAX                     ;IN OLDPBQ BUT DON'T CHANGE OLDPB6 YET.
        EOR     OLDPBQ
        STX     OLDPBW
        BPL     NOREV           ;NO CHANGE IN BIT 7 OF OLDPBQ


;----------------------------------


;       RIGHT DIFFICULTY SWITCH MOVED MEANS TO REVERSE BOARD (SWITCH SIDES)
;
;                               MOVE CURSOR, FROMB, TOSQRB
        LDX     #2
        LDA     TOSQRB
        BMI     SW10            ;NO "TO" SQUARE
SWLP
        LDA     #34
        SEC
        SBC     CURSOR,X
        STA     CURSOR,X
SW10
        DEX
        BPL     SWLP

        LDA     #34             ;CHANGE CURSC, MOVE
        SEC
        SBC     CURSC
        STA     CURSC
        LDA     #34
        SEC
        SBC     MOVE
        STA     MOVE


;                               SWITCH SIDES FOR EACH PIECE ON BOARD, PIECE
        LDX     #34+1
NORLP
        LDA     BOARD,X
        BEQ     NOR05
        EOR     #$80
        STA     BOARD,X
NOR05
        DEX
        BPL     NORLP

        LDA     MOVVAL          ;SWITCH MOVVAL
        BEQ     NOR06
        EOR     #$80
        STA     MOVVAL
NOR06
;                               REVERSE BOARD
        LDX     #16
        LDY     #0              ;0 TO 16 (17 IS UNUSED), 18-34

BSWLP
        LDA     BOARD+18,X
        PHA
        LDA     BOARD,Y
        STA     BOARD+18,X
        PLA
        STA     BOARD,Y
        INY
        DEX
        BPL     BSWLP

        JSR     SWIT            ;REVERSE ACTIVE
        LDA     COLHUM          ;SWITCH COLORS
        LDX     COLCMP
        STX     COLHUM
        STA     COLCMP

        LDA     HPIECE          ;SWITCH HPIECE & CPIECE
        LDX     CPIECE
        STX     HPIECE
        STA     CPIECE

        LDA     HKING           ;SWITCH HKING & CKING
        LDX     CKING
        STX     HKING
        STA     CKING

NOREV


        JSR     GSRST


;----------------------------------


;                               BEGINNING OF FRAME -- CHECK FOR SET UP MODE
BLKJMP
        LDA     #3              ;B6=0 => DISABLE LATCHES, B1=1 => START VSYNC & VBLANK
OVSLP   LDX     INTIM           ;WAIT FOR END OF OVERSCAN
        BNE     OVSLP
;                               START VERTICAL BLANK
        STA     WSYNC
        STA     VSYNC           ;START VERTICAL SYNC
        STA     VBLANK
        STX     AUDC0           ;NO SOUND
        STA     CTRLPF          ;STORE 3 -- SCORE, REFLECT PLAYFIELD
        STA     WSYNC
        STA     WSYNC
        LDY     #VBLCON         ;37 LINES
        STA     WSYNC
        STX     VSYNC           ;END VERTICAL SYNC (X=0)
        STY     TIM64T

        LDA     BLNKTM
        BEQ     NOBL
        JMP     ATTR10          ;DO NOTHING
NOBL

;                               CHECK FOR SETUP MODE (LEFT PRO/AM SWITCH UP (=1))
        LDA     OLDPBQ
        LDX     OLDPB6
        BNE     STUP25
        AND     #$40            ;PREVIOUSLY IN NORMAL MODE
        BNE     STUP10
;
;       STILL IN NORMAL MODE  (NORMAL -> NORMAL)
;
        LDA     WINSAV
        BEQ     COMP05          ;NO WIN
;
;       SOMEONE HAS WON -- OUTPUT WIN SOUND
;
        LDX     GFLG2
        BEQ     WIN70           ;ATTRACT MODE
        DEC     SNDTIM
        LDX     SNDTIM
        STX     GFLG2           ;0=> DONE WITH SOUND, DO ATTRACT
        BEQ     WIN60
        LDX     FRAME
WIN60
        STX     AUDV1
WIN70
        JMP     CRSBLK

;
;       CHECK FOR COMPUTER OR HUMAN MOVE
;
COMP05
        LDX     GAMNO
        LDA     FREEZE          ;FREEZE DISPLAY AFTER MOVE?
        BEQ     COMP06          ;NO. CONTINUE
        DEC     FREEZE          ;FREEZE OVER YET?
        BNE     WIN70           ;NO. JMP CRSBLK
        CPX     #PLAY2
        BNE     COMP07
        JSR     JMPWIN          ;CHECK FOR JUMP.  GAME OVER?
        BEQ     STUP50          ;YES
        LDA     CURSOR
        LDX     CURSC           ;REVERSE COMPUTER AND HUMAN CURSORS
        STA     CURSC
        STX     CURSOR
        LDA     BOARD,X
        STA     PIECE
        JSR     TOSET           ;CLEAR TOSQRB, MOVFLG
        JMP     ATTR10

COMP06
        CPX     #PLAY2
        BEQ     COMP10          ;2-PLAYER GAME
COMP07
        LDX     ACTIVE
        BMI     CMPMVE          ;COMPUTER'S MOVE
COMP10
        JMP     NOCHCK          ;2-PLAYER GAME OR HUMAN'S MOVE
CMPMVE
        JSR     JMPWIN          ;SET UP MSTJMP, XMOVE, YMOVE,  ETC.
        BEQ     STUP50          ;GAME OVER -- GOTO ATTR10
        BNE     COMPUT          ;JMP    DEFINITELY DO COMPUTER'S MOVE


;
;       CHANGE TO SETUP MODE (NORMAL -> SETUP)
;
STUP10
        STA     OLDPB6
        JSR     MOVCLR          ;SET MOVE TO OFF BOARD SQUARE
        JSR     TONORM          ;NOT SOFT ATTRACT (RETURNS Y=$FF)
        STY     JMPI            ;$FF -- NO JUMPS FOR COMPUTER
        JSR     TOSET           ;SET UP TOSQRB, MOVFLG, RETURN Y=0, EQ
        STY     AUDV1           ;CLEAR WIN SOUND
        STY     FROMTO
        STY     MSTJMP          ;NO JUMP
        BEQ     STUP30          ;JMP

;
;       PREVIOUSLY IN SETUP MODE
;
STUP25
        AND     #$40
        STA     OLDPB6


STUP30
        JSR     CRSTUP          ;SET UP ACTIVE, COLHUM,COLCMP

        LDX     CURSOR
        LDA     BOARD,X         ;CURSOR SQUARE DETERMINES STARTING PLAYER AFTER SET UP
        BEQ     STUP35          ; UNLESS EMPTY-- USE RIGHT DIFFICULTY SWITCH FROM CRSTUP
        AND     #$80
        STA     ACTIVE
STUP35
        LDX     #0
        STX     WINSAV
        STX     MOVFLG          ;NO COMPUTER MOVE
        LDX     OLDPB6
        BNE     COMP10          ;GOTO NOCHCK IF STILL IN SETUP (NORMAL->SETUP OR SETUP->SETUP)
;
;       OUT OF SETUP (SETUP -> NORMAL)
;
        .IF     PRNT
        JSR     PRBRD
        .ENDIF

        JSR     TONORM          ;MAKE SURE WE'RE NOT IN ATTRACT MODE
        LDX     GAMNO
        CPX     #PLAY2          ;TWO-PLAYER GAME?
        BEQ     STUP49          ;YES.
        LDA     ACTIVE          ;NO.    COMPUTER PLAYER?
        BMI     STUP50          ;YES.
STUP49
        JSR     JMPWIN          ;CHECK FOR JUMPS, MOVES, WINS FOR HUMAN PLAYER
STUP50
        JMP     ATTR10          ;SKIP THE REST UNTIL NEXT TIME


;----------------------------------


;       CALL ALPHA-BETA PRUNING ROUTINE
;       THIS IS A "RECURSIVE" TREE SEARCH.
;       TO SAVE SPACE, THE STACK IS NOT USED.  INSTEAD, TH EROUTINE RETURNS
;       TO ABRET1 IF DEPTH=1 AND OTHERWISE RETURNS TO ITSELF.
;       EVENTUALLY, WE WANT TO CHECK TO SEE IF THERE IS ONLY ONE POSSIBLE MOVE
;       FIRST, FOR FASTER RESPONSE.
;
COMPUT
        LDX     #1
        STX     DEPTH           ;START AT DEPTH=1
        STX     ALPHAL+0
        STX     ALPHAL+1
        DEX                     ;0
        STX     MLTJMP          ;NOT MULTIPLE JUMP YET
        STX     VBLANK          ;MAKE SURE VBLANK IS OFF
        STX     PRNCNT          ;CLEAR PRUNE FLAG AND BEST MOVE COUNTER

        LDA     #$80            ;ALPHA(0) = ALPHA(1) = $8001 = -INFINITY
        STA     ALPHAH+0
        STA     ALPHAH+1
        STA     FRSMOV          ;FIRST MOVE -- NO BETTER MOVE YET


;
;       IF RESET PRESSED THEN PICK OPENING MOVE AT RANDOM
;
        LDA     OLDPBQ
        ROR     A               ;RESET SWITCH PRESSED?
        BCS     COMPU2          ;NO.
        LDA     FRAME           ;YES. PICK FROM 7 OPENING MOVES
        AND     #7              ;AT RANDOM (22-19) IS TWICE AS LIKELY AS THE OTHERS). [todo - first close paren is likely an original typo]
        TAX
        LDA     FRSTAB,X
        STA     JMPLST
        AND     #$3F
        STA     FROMB
        STA     CURSC
        JMP     NOJUMP          ;JMP
COMPU2


;----------------------------------


;
;       ALPHBETA -- ALPHA-BETA PRUNING ROUTINE  -- PUT INLINE TO SAVE A FEW BYTES
;
;       CALL BY JMP ALPHBETA, NOT JSR
;       IF DEPTH = 1 THEN RETURN IS BY JMP ABRET1,
;       OTHERWISE, JMP ABRET2.
;
ALPHBETA
;
;       CHANGE COLORS IF TIMER UP
;
        .IF     PRNT
        LDA     INPT5           ;IS RIGHT JOYSTICK BUTTON PRESSED?
        BMI     AB05            ;NO.
        JSR     PAK             ;YES.  INPUT NEW PRFLG FROM TI FOR DEBUG

        .ENDIF

;
;       CHECK RESET SWITCH (DON'T CHECK GAME SELECT)
;
        LDA     SWCHB
        ROR     A               ;RESET PRESSED?
        BCS     AB50            ;NO.
        ROL     A               ;SHIFT A BACK
        JSR     RSV2            ;YES.
        LDA     #VBTIM
        STA     BLNKTM
        JMP     NOREV           ;GOTO CODE THAT DOES JSR GSRST



AB50
        LDA     MLTJMP          ;SAVE MLTJMP AND MSTJMP
        STA     MLTFLG
        LDA     MSTJMP
        STA     MSTFLG

        LDX     XMOVE           ;USE MOVE DISCOVERED BY JMPCHK
;
;       TRY NEXT SQUARE
;
ALOOP1
        LDA     BOARD,X
        BEQ     CON3J           ;EMPTY -- TRY NEXT SQUARE
        EOR     ACTIVE
        BPL     ALPH05
CONT3J
        JMP     CONT3           ;OPPONENT'S PIECE -- TRY NEXT SQUARE
ALPH05  STX     FROMB           ;ACTIVE -- SAVE SQUARE #
        JSR     LOADY           ;LOAD Y WITH 3 (OR  IF CMPCHK)
;
;       TRY NEXT INDEX
;
ALPH10
        LDA     BOARD,X
        STA     PIECE           ;SAVE CONTENTS OF SQUARE (PIECE BEING MOVED)
        JSR     ONBRD2          ;ADD MOVTAB OFFSET. ON BOARD?
        BCS     CONT2J          ;NO.  TRY NEXT OFFSET
        TAX
        LDA     MSTJMP
        BNE     AJUMP           ;MUST JUMP


;----------------------------------


;
;       NO JUMP -- ORDINARY MOVE
;
        LDA     BOARD,X         ;IS "TO" SQUARE OCCUPIED?
        BNE     CONT2J          ;YES.  TRY NEXT OFFSET

        STX     TOSQRB          ;NO. HAVE POTENTIAL MOVE
        STY     INDEX           ;SAVE TO SQUARE AND INDEX
        LDA     PIECE           ;LOAD PIECE AND CHECK FOR NEW KING
        JSR     KNGCK2          ;CHANGES A AND PIECE COUNT IF NEW KING
        STA     BOARD,X         ;CHANGE TOSQR TO FROM SQUARE
        LDA     #0              ;CLEAR FROM SQUARE
        LDX     FROMB
        STA     BOARD,X

        JSR     TERMNODE        ;CHECK FOR TERMINAL NODE
        BCS     TER             ;YES. -- TERMINAL

;
;       NOT TERMINAL NODE -- SAVE VARS. FOR THIS LEVEL
;
        LDA     PIECE
        AND     #$30            ;BIT 5-4 INDICATES KING OR CHECKER
        ORA     INDEX           ;BIT 1-0 IS MOVTAB INDEX (MSTJMP AND MLTJMP ARE 0)
        JSR     SAVE1           ;SAVE OTHE, FROMT, INC DEPTH.  RETURN X=DEPTH
        JMP     ALPJMP


;
;       TER -- ORDINARY MOVE -- NOT JMP -- TERMINAL NODE
;
TER
        JSR     SWIT
;
;       TAKE MOVE BACK
        JSR     RESTOR
        LDA     #0              ;MAKE SURE MSTJMP IS CLEAR BECAUSE IF AT MAXMAX DEPTH,.
;                               THEN TERMNODE MIGHT HAVE DETECTED JUMP.
        STA     MSTJMP
        JMP     FINSH3          ;CHECK NEW STATIC VALUE, POSSIBLY MODIFY ALPHA
;
;       AJUMP -- MUST JUMP
;
AJUMP
        LDA     BOARD,X
        BEQ     CONT2J          ;EMPTY -- TRY NEXT OFFSET
        EOR     ACTIVE
        BMI     AJ05
CONT2J
        JMP     CONT2           ;ACTIVE PLAYER -- CAN'T JUMP OWN PIECE
AJ05
        STX     JMPSQR          ;SAVE SQUARE WHICH WE ARE JUMPING OVER
        JSR     ONBRD2          ;ADD MOVTAB OFFSET.  OFF BOARD?
        BCS     CONT2J          ;YES. TRY NEXT OFFSET
        TAX
        LDA     BOARD,X
        BNE     CONT2J          ;TO SQUARE IS OCCUPIED -- TRY NEXT OFFSET

        STX     TOSQRB          ;SUCCESS -- SAVE SQUARE
        STY     INDEX
        LDA     PIECE
        JSR     KNGCHK          ;IF NEW KING THEN SET CARRY, INC PIECE COUNT & MODIFY MSTJMP
        STA     BOARD,X         ;STORE IN TO SQUARE
        LDY     #0              ;CLEAR FROM SQUARE
        LDX     FROMB
        STY     BOARD,X
        LDX     JMPSQR
        LDA     BOARD,X
        ASL     A               ;SAVE JUMPED PIECE IN B7-6
        ASL     A
        ORA     JMPSQR          ;COMBINE WITH JMP SQUARE
        STA     JMPSQR
        STY     BOARD,X         ;CLEAR JUMP SQUARE 
        JSR     CHGCNT          ;CHANGE PIECE COUNTS




        LDA     MSTJMP          ;MUST JUMP?
        BEQ     MJ05            ;NO -- NEW KING MUST STOP -- CHECK FOR NEW JUMP
        LDX     TOSQRB
        JSR     MOVCHK
        BCC     MJ08            ;ANOTHER JUMP FOR THIS PIECE


;----------------------------------


;
;       NEW KING OR END OF JUMP
;
MJ05
        LDA     #0              ;NOT MULTIPLE JUMP NEXT TIME
        STA     MLTJMP

        JSR     TERMNODE        ;SWITCH PLAYERS -- CHECK FOR TERMINAL
;                               SET UP XMOVE, MSTJMP FOR NEXT LEVEL
        BCS     MJ07            ;TERMINAL
;                               NOT TERMINAL
        JSR     JMPSAV          ;INC DEPTH & SAVE VARS   RETURN X=NEW DEPTH
ALPJMP
        LDA     ALPHAL-2,X
        STA     ALPHAL,X
        LDA     ALPHAH-2,X
        STA     ALPHAH,X

        LDA     #0
        STA     FRSMOV          ;NOT FIRST MOVE
        STA     MLTJMP


        JMP     ALPHBETA        ;RECURSE

MJ07
        JSR     SWIT            ;TERMINAL -- SWITCH ACTIVE BACK
        BCS     MJ15            ;JMP

;
;       MULTIPLE JUMP -- MSTJMP ALREADY SET
;
MJ08
        LDA     #MLT
        STA     MLTJMP
        JSR     SWIT
        JSR     ALP200          ;CHECK FOR MAXMAXDEPTH
        JSR     SWIT
        BCC     MJ20            ;OK - KEEP GOING
;
;       STACK FULL -- MUST STOP -- UNDO JUMP
;
MJ15
        LDA     JMPSQR
        AND     #$3F
        TAX
        LDA     JMPSQR

        JSR     RESTR5          ;RESTORES MSTJMP, MLTJMP, ETC.

FINSH3                          ;CHECK NEW STATIC VALUE


;----------------------------------


;
;       SAVE VARS -- MULTIPLE JUMP NEXT TIME
;
MJ20
        JSR     JMPSAV          ;INC DEPTH & SAVE VARS (MSTFLG, MLTFLG, ETC.)

        LDA     FRSMOV
        AND     #$80            ;FIRST MOVE STAYS THE SAME, EXCEPT NO BETTER MOVE
        STA     FRSMOV

        LDA     ALPHAL-1,X      ;USE SAME ALPHA
        STA     ALPHAL,X
        LDA     ALPHAH-1,X
        STA     ALPHAH,X

        LDA     ALPHAL-2,X      ;ALSO SAME BETA (PREVIOUS ALPHA)
        STA     ALPHAL-1,X
        LDA     ALPHAH-2,X
        STA     ALPHAH-1,X

        JMP     ALPHBETA


;----------------------------------


;
;       RETURN FROM RECURSIVE ALPHBETA CALL
;
;
;       RESTORE VARS
;
ABRET2
        DEC     DEPTH
        LDX     DEPTH

        LDA     FROMT-1,X
        AND     #$EF
        STA     FROMB
        LDA     OTHER-1,X
        AND     #MLT
        STA     MLTFLG
        LDA     OTHER-1,X
        AND     #MST
        STA     MSTFLG
        LDA     OTHER-1,X
        AND     #3
        STA     INDEX

        LDA     MSTFLG          ;WAS MOVE A JMP?
        BNE     WASJ            ;YES.
;
;       NOT A JUMP
;
        JSR     SWIT            ;SWITCH ACTIVEPLAYER
        LDA     MLTFLG          ;NO. NOT JUMP
        STA     MLTJMP
        LDA     MSTFLG
        STA     MSTJMP

        LDA     OTHER-1,X       ;SET UP PIECE
        AND     #$30
        ORA     ACTIVE
        STA     PIECE

        LDA     FROMT-1,X
        AND     #$C0
        STA     FRSMOV

        LDA     FROMB
        LDY     INDEX
        CLC
        ADC     MOVTAB,Y
        STA     TOSQRB
        JSR     RESTOR          ;RESTORE SOME VARS & BOARD
        JMP     PRNJMP          ;CLEAR PRUNE FLAG & CHECK NEW VALUE AGAINST ALPHA

;
;       WAS A JUMP
;
WASJ
        LDY     MLTJMP
        BNE     WASJ10
;
;       WAS NOT A MULTIPLE JUMP
;
        JSR     SWIT            ;SWITCH ACTIVE PLAYER
        LDA     FROMT-1,X
        JSR     RESTR6          ;SET UP FRSMOV,PIECE,MSTJMP,MLTJMP, RESTORE BOARD
PRNJMP
        ASL     PRNCNT          ;CLEAR PRUNE FLAG WITHOUT DISTURBING COUNTER
        CLC
        ROR     PRNCNT
        JMP     FINSH3

;
;       NEXT LEVEL CONTNUED MULTIPLE JUMP -- MOVE BETA & NEW ALPHA BACK
;
WASJ10
        .IFPRNT
        LDA     PRFLG
        AND     #$80            ;FLAG SET?
        BEQ     SKIP1           ;NO.
        TXA                     ;YES.  SAVE X AND PRINT "MULTIPLE JUMP" MESSAGE
        PHA
        LDA     #MJ
        JSR     BLECCH
        PLA                     ;RESTORE X
        TAX
SKIP1
        .ENDIF

        LDA     ALPHAL,X        ;MOVE BETA
        STA     ALPHAL-1,X
        LDA     ALPHAH,X
        STA     ALPHAH-1,X

        LDA     ALPHAH+1,X      ;MOVE ALPHA
        STA     ALPHAH,X
        LDA     ALPHAL+1,X
        STA     ALPHAL,X

        LDA     PRNCNT          ;PRUNE?
        BPL     NEW50           ;NO.

        JSR     RESTR4          ;YES.  LEAVE FRSMOV AS IS.  RESTORE OTHER JUNK
        JMP     ABD2            ;GOTO PRUNE
NEW50

        BIT     FRSMOV          ;FIRST MOVE? (NEXT LEVEL)
        BPL     SKIP2           ;NO.  BETTER MOVE?
        BVC     SKIP2           ;NO.  DON'T SAVE MOVE BUT RESTORE JUNK
;
;       MULTIPLE JUMP -- FIRST MOVE & BETTER MOVE
;
;       KEEP FRSMOV & BETTER MOVE FROM PREVIOUS LEVEL (BOTH SET)
;
WASJ17
        JSR     JMPSV2

        .IF     PRNT
        LDA     PRFLG
        AND     #$40
        BEQ     SKIP2
        LDA     #MJBA           ;"MULTIPLE JUMP - FIRST MOVE & BETTER ALPHA"
        JSR     BLECCH
        .ENDIF

SKIP2
        JSR     RESTR4          ;SET UP PIECE,MSTJMP,MLTJMP,RESTORE BOARD
        JMP     CONT1           ;SKIP ALPHA CHECKING AND DO NEXT INDEX


;----------------------------------


;
;       CHECK NEW VALUE AGAINST ALPHA
;       MAY BE STATIC VALUE OR VALUE PASSED BACK BY CALL TO NEXT DEPTH.
;
;       HUMAN PASSES UP -C/H, COMPUTER TRIES TO MAXIMIZE +C/H (MAKE H SMALLER RELATIVE TO C).
;       COMPUTER PASSES UP +C/H, HUMAN TRIES TO MAXIMIZE -C/H (MAKE H LARGER RELATIVE TO C).
;
FINSH3
;
;       IF -ALPHA(DEPTH+1) > ALPHA(DEPTH) THEN HAVE BETTER ALPHA.
;       I.E. IF ALPHA(DEPTH) + ALPHA(DEPTH+1) < 0 THEN HAVE BETTER ALPHA.
;
        LDX     DEPTH

        BIT     FRSMOV          ;FIRST MOVE?
        BPL     NEW10           ;NO.
        INC     ALPHAL+1,X      ;YES.  INCREASE -ALPHA BY 1 (TO MAKE RANDOMNESS WORK)
        BNE     NEW10
        INC     ALPHAH+1,X      ;IF LSB WENT TO 0 THEN INC MSB
NEW10

        LDA     ALPHAL,X
        CLC
        ADC     ALPHAL+1,X
        STA     T0              ;SAVE LSB
        LDA     ALPHAH,X
        ADC     ALPHAH+1,X
        BVC     FH5             ;OVERFLOW?
        LDA     ALPHAH,X        ;YES.  OVERFLOW -- LOAD SIGN
FH5
        BMI     FH7             ;NEGATIVE => HAVE BETTER ALPHA
;
;       NEW VALUE IS THE SAME AS OLD ALPHA OR WORSE
;
        BVS     FH6             ;OVERFLOW SET -- NOT 0 -- WORSE
        BNE     FH6             ;MSB NOT 0 -- WORSE
        BIT     FRSMOV          ;FIRST MOVE?
        BPL     FH6             ;NO.  FORGET THIS MOVE
        LDA     T0              ;NEW VALUE = ALPHA?
        BNE     FH6             ;NO.  FORGET THIS MOVE

        .IF     PRNT
        LDA     PRFLG
        AND     #$02
        BEQ     SKIP7
        LDY     DEPTH
        CPY     PRDEP
        BCS     SKIP7           ;DON'T PRINT IF DEPTH>=PRDEP

        LDA     #RAN            ;"RANDOM"
        JSR     OUTAL3
        LDX     DEPTH
SKIP7
        .ENDIF

        LDA     FRAME           ;SUM IS 0  -- USE NEW VALUE AT "RANDOM"
        TAY                     ;MOVE OLD FRAME VALUE TO Y AND COMPUTE NEW VALUE
        BNE     FRAQ
        LDA     #$62            ;SET TO NEW VALUE IF 0
        STA     FRAME
FRAQ
        ROL     A               ;B7-> CARRY
        ROL     FRAME           ;B7 -> B0
        ROL     A               ;OLD B6 -> CARRY
        ROL     A               ;OLD B6-> B0
        AND     #1
        EOR     FRAME
        STA     FRAME

        LDA     PRNCNT          ;LOAD COUNTER
        AND     #$7F            ;MASK OFF PRUNE FLAG
        CMP     #5              ;EQUAL TO 5?
        BCS     NEW40           ;YES.  LIMIT TO 5
        INC     PRNCNT          ;NO. INCREMENT EQUAL MOVE COUNTER
NEW40
        TAX
        TYA
        CMP     RANTAB,X        ;IS RANDOM NUMBER < 1/2, 1/3, 1/4 ETC?
        BCC     FHQ             ;YES.  KEEP MOVE

;
;       NEW VALUE WAS THE SAME AND WE ARE NOT USING THIS MOVE OR
;       NEW VALUE WAS WORSE THAN THE OLD ALPHA.
;
FH6
        .IF     PRNT
        LDA     PRFLG
        AND     #$20
        BEQ     SKIP3
        LDA     #WA             ;"WORSE ALPHA"
        JSR     BLECCH
SKIP3
        .ENDIF
        JMP     CONT1
;
;       IF ALPHA >= BETA THEN PRUNE TREE -- OPPONENT WOULD NEVER LET US PICK THIS MOVE
;       I.E. IF ALPHA(DEPTH) + ALPHA(DEPTH-1) >= 0 THEN PRUNE TREE
;       BETA(DEPTH) = -ALPHA(DEPTH-1)
;
FH7
;
;       NEGATE ALPHA+1 AND MOVE TO ALPHA (X=DEPTH ON INPUT)
;
        LDA     #0              ;NEGATE AND MOVE NEW VALUE TO ALPHA
        SEC
        SBC     ALPHAL+1,X
        STA     ALPHAL,X
        LDA     #0
        SBC     ALPHAH+1,X
        STA     ALPHAH,X

        LDA     ALPHAL,X
LC
        ADC     ALPHAL-1,X
        LDA     ALPHAH,X
        ADC     ALPHAH-1,X
        BVC     FH20
        LDA     ALPHAH,X        ;OVERFLOW -- LOAD SIGN
FH20
        BPL     ABD2            ;MOVE REJECTED => PRUNE

;
;       BEST MOVE SO FAR -- SAVE IN JMPLST IF FIRST MOVE.
;       RESULT OF ADDITION WAS NEGATIVE
;
FHQ
        LDA     FRSMOV
        ORA     #$40            ;INDICATE BETTER MOVE
        STA     FRSMOV


        .IF     PRNT
        BMI     FHBLEC          ;BRANCH IF FIRST MOVE
        LDA     PRFLG
        AND     #$10
        BEQ     SKIP4
        LDA     #BANFM          ;"BETTER ALPHA - NOT FIRST MOVE"
        JSR     BLECCH
SKIP4
        JMP     CONT1
        .ENDIF
        BPL     CONT1           ;IF NOT DEBUG THEN BRANCH IF NOT FIRST MOVE
FHBLEC
        LDA     #0              ;FIRST MOVE => CLEAR PRUNE FLAG & COUNTER
        STA     PRNCNT
        LDA     #$FF
        LDX     MSTJMP
        BEQ     FH21
        LDA     DEPTH           ;JUMP
FH21
        STA     JMPI

        JSR     JMPSV2          ;SAVE MOVE IN JMPLST

        .IF     PRNT
        LDA     PRFLG
        AND     #$08
        BEQ     SKIP5
        LDA     #BAFM           ;"BETTER ALPHA - FIST MOVE"
        JSR     BLECCH
SKIP5
        .ENDIF


;----------------------------------


;
;       TRY NEXT INDEX
;
CONT1
        LDY     INDEX
;
;       TRY NEXT INDEX -- Y=INDEX
CONT2
        LDX     FROMB
        DEY
        BMI     CONT3           ;DONE WITH THIS SQUARE
        CPY     #1
        BNE     ALJ
        LDA     BOARD,X
        CMP     #HUMCHK         ;STOP IF HUMAN CHECKER
        BEQ     CONT3
ALJ
        JMP     ALPH10          ;CONTINUE

;
;       TRY NEXT SQUARE -- X=SQUARE
;
CONT3
        DEC     TIMOUT          ;TIME UP?
        BNE     AB30            ;NO.
        LDA     SWCHB
        AND     #8              ;COLOR TV?
        BNE     AB10            ;YES.
        LDA     DEPTH           ;NO. B/W -- USE DEPTH TO SET LUMINANCE
        ASL     A
        AND     #6
        BPL     AB20            ;JMP
AB10
        LDA     DEPTH           ;COLOR TV
        ROR     A
        ROR     A
        ROR     A
        ROR     A
        ORA     #2              ;SET LUMINANCE
AB20
        STA     COLUBK
AB30

        LDA     MLTJP
        BNE     ABDONE          ;MULTIPLE JUMP => DONE (ONLY TRY ONE SQUARE)

        DEX
        BMI     ABDONE          ;SKIP
        JMP     ALOOP1          ;CONTINUE
;
;       DONE WITH ALL SQUARES -- RETURN
ABD2
        .IF     PRNT            ;WE COME HERE FOR PRUNING
        LDA     PRFLG
        AND     #$04
        BEQ     SKIP6
        LDA     #PRUNE          ;"PRUNE"
        JSR     BLECCH
SKIP6
        .ENDIF

        ASL     PRNCNT          ;SET PRUNE FLAG (FOR MULTIPLE JUMPS)
        SEC
        ROR     PRNCNT
        LDA     FRSMOV          ;NOT BETTERMOVE
        AND     #$80
        STA     FRSMOV
ABDONE
        LDA     DEPTH
        CMP     #1
        BEQ     ABRET1          ;RETURN FOR DEPTH = 1
        JMP     ABRET2          ;RETURN FOR DEPTH > 1


;----------------------------------



ABRET1
        LDA     JMPLST
        AND     #$3F            ;START SQUARE
        STA     FROMB
        STA     CURSC
        LDX     JMPI
        BMI     NOJUMP          ;NO JUMPS

;
;       JUMPS
;
        DEC     JMPI            ;CHANGE 1-9 TO 0-8 (JMPLST INDEX)
        STA     T0
        LDA     #0              ;JUMPS
        STA     T1              ;START WITH JMPLST+0
        ASL     JMPLST
        ROL     A
        ASL     JMPLST          ;B7-6 = INDEX INTO MOVTAB
        ROL     A
        TAY
        JSR     JUMP1           ;SET UP JMPLST FOR FIRST JUMP
        BCS     JTHRU           ;DONE
        LDA     JMPLST+2        ;MOVE 3RD BYTE TO END OF JMPLST TO SAVE IT
        PHA
        LDA     JMPLST+1        ;2ND BYTE CONTAINS 4 MOVTAB INDEXES
        JSR     JUMP4           ;DO 4 JUMPS
        PLA
        BCS     JTHRU           ;BRANCH IF THROUGH
        JSR     JUMP4

JTHRU
        LDX     FROMB
        LDA     BOARD,X
        PHA
        LDA     #0              ;CLEAR FROM SQUARE
        STA     BOARD,X
        LDA     T0              ;TO SQUARE
        JMP     THRU2

;
;       NO JUMP -- JUST MAKE 1 MOVE   A=START SQUARE FROM JMPLST
;
NOJUMP
        TAX
        LDA     BOARD,X
        PHA
        LDA     #0
        STA     BOARD,X
        ASL     JMPLST
        ROL     A
        ASL     JMPLST
        ROL     A
        TAY                     ;OFFSET INDEX
        TXA
        CLC
        ADC     MOVTAB,Y        ;TO SQUARE
JTHRU2
        TAX
        STA     TOSQRB
        STA     MOVE
        PLA                     ;PIECE BEING MOVED
        JSR     KNGCK2          ;IF NEW KING THEN CHANGE AND INCREMENT PIECE COUNT
        STA     BOARD,X
        STA     MOVVAL


;----------------------------------


;
;       RESTORE VARIABLES -- END OF COMPUTER MOVE
;
        JSR     RSV

        LDX     CURSOR          ;SET UP PIECE IN CASE CURSOR'S PIECE WAS JUMPED
        LDA     BOARD,X
        STA     PIECE

        JSR     JMPWIN          ;CHECK FOR WIN
        JMP     ATTR10


RSV
        LDA     SWCHB
RSV2
        STA     OLDPBQ
        AND     #$40
        STA     OLDPB6

        JSR     TONORM          ;MAKE SURE IN NORMAL MODE, Y<-$FF
        INY                     ;0
        STY     MLTJMP          ;NOT MULTIPLE JUMP CONTINUATION
        STY     ACTIVE          ;HUMAN IS ACTIVE
        STY     FROMTO          ;"FROM"
        STY     ILEGAL          ;NOT ILLEGAL MOVE
        STY     WINSAV          ;NO WIN
        STY     FREEZE          ;NO FREEZE
        INY                     ;1
        STY     MOVFLG          ;DISPLAY COMPUTER'S MOVE

        .IF     PRNT
        JSR     PRMOVE          ;PRINT MOVE ON TI
        .ENDIF
        RTS


;----------------------------------



NOCHCK
;                               CHECK JOYSTICK BUTTON -- SET UP MODE?
        .IF     PRNT
        LDA     INPT5           ;IS RIGHT JOYSTICK BUTTON PUSHED?
        BMI     JOY2            ;NO.
        JSR     PASK            ;YES.  INPUT PRFLG FROM TI
JOY2
        .ENDIF

        LDA     OLDPB6
        BEQ     JOY11
        LDA     INPT4           ;SETUP MOVE: CHECK PUSHBUTTON
        BPL     JOY3

;
;       BUTTON NOT PRESSED
;
        CLC                     ;ALWAYS USE P0'S JOYSTICK IN SETUP
        JMP     BNEO            ;UNCOND JMP
JOY3
        LDA     FRAME           ;BUTTON IS PUSHED
        AND     #$1F            ;MOVE ONLY ON CERTAIN FRAMES
        BNE     JOY111          ;GOTO CRSBLK
        LDA     PIECE           ;ALTERNATE BETWEEN COMPUTER & HUMAN CHECKER, COMPUTER & HUMAN KING, & SPACE
        LDX     #4
JOYLP
        CMP     NXTAB,X         ;FIND CURRENT SQUARE CONTENTS IN TABLE
        BEQ     JOY9            ;FOUND
        DEX                     ;NOT FOUND
        BPL     JOYLP           ;CONTINUE

        .IF     PRNT
        LDA     #$FF
        STA     PRFLG
        LDA     #JLERR
        JSR     OUTMSG          ;PRINT ERROR MESSAGE ON TI
        JMP     *               ;ERROR (SHOULD NEVER OCCUR)
        .ENDIF

JOY9
        LDA     HPIECE          ;MODIFY PIECE COUNT TO REFLECT CHANGE
        CLC
        ADC     HTAB,X
        STA     HPIECE
        LDA     CPIECE
        CLC
        ADC     CTAB,X
        STA     SPIECE

        LDA     HKING           ;MODIFY KING COUNT TO REFLECT CHANGE
        CLC
        ADC     HKTAB,X
        STA     HKING
        LDA     HKING
        CLC
        ADC     CKTAB,X
        STA     CKING

        DEX                     ;TAKE PREVIOUS ENTRY FROM TABLE
        BPL     JOY10
        LDX     #4              ;0 GOES TO 4
JOY10
        LDA     NXTAB,X         ;LOAD NEXT SQUARE VALUE
        LDX     CURSOR
        JSR     KNGCK2          ;MUST HAVE KING IF LAST ROW
        STA     PIECE
        STA     BOARD,X
        JSR     TONORM
        JMP     JOY81


;----------------------------------


;                               CHECK JOYSTICK BUTTON -- NOT SET UP MODE
JOY11
        LDA     ACTIVE
        ASL     A
        ROL     A
        TAY                     ;Y=0 IF ACTIVE=0, 1 IF ACTIVE =$80

        LDA     INPT4,Y         ;IF BUTTON PRESSED THEN DROP PIECE IF LEGAL
        TAY
        EOR     OLDINP
        BMI     NOCHDO
        TYA                     ;NO CHANGE IN PUSHBUTTON
        BMI     JPM05           ;NOT PRESSED
        LDA     ILEGAL          ;BUTTON PRESSED
        BNE     JOY20           ;ILLEGAL NOISE SOUND
JOY111  JMP     CRSBLK          ;OK-- WAIT FOR LETUP
JPM05
        LDA     ILEGAL          ;JOYSTICK MOVEMENT ERROR?
        BPL     JPM06           ;NO.
        LDA     ACTIVE          ;SET UP CARRY TO INDICATE PLAYER
        ROL     A
        JMP     MOVE12          ;YES. CHECK JOYSTICK MOTION
JPM06
        LDA     #0              ;OK
        STA     ILEGAL
JMP10
        JMP     MOVE10          ;CHECK JOYSTICK
NOCHDO
        STY     OLDINP          ;STORE NEW BUTTON READING
        TYA
        BMI     JPM10           ;NOT PRESSED

;                               BUTTON JUST PRESSED
        LDA     FROMTO
        BNE     TO10            ;TO

;                               FROM
        JSR     TOSET           ;DON'T DISPLAY COMPUTER'S MOVE, SET UP TOSQRB
        LDX     CURSOR
        JSR     MOVCHK
        BCC     FROM10          ;CAN JUMP
        BEQ     JOY12           ;CAN'T MOVE

        LDA     MSTJMP          ;MUST JUMP?
        BNE     JOY12           ;YES, NOT LEGAL PIECE TO PICK UP
FROM10
        INC     FROMTO          ;CAN MOVE - DO TO NEXT

        LDX     CURSOR
        STX     MOVE
        LDA     BOARD,X
        STA     PIECE
        STA     MOVVAL
        LDA     #0
        STA     MLTJMP          ;NO MULTIPLE JUMPS YET
        JSR     TONORM
        LDA     #PICKUP
        JSR     SOUND1
        JMP     ATTR10

;
;       ILLEGAL MOVE -- MAKE NOISE
;
JOY12
        LDA     #1
JOY13
        STA     ILEGAL          ;ILLEGAL MOVE NOISE WILL CONTINUE UNTIL BUTTON IS RELEASED
        JSR     TONORM
        LDA     MSTJMP
        BEQ     JOY20
        LDA     #JP
        STA     TOSQRB
JOY20
        LDA     #$30            ;AUDF0
        LDX     #$08            ;AUDV0
        LDY     #ERRSND         ;AUDC0
        JSR     SOUND3
        JMP     CRSBLK
;
;       "TO" MODE
;
TO10
        LDX     CURSOR          ;FROM SQUARE
        LDA     #0
        STA     BOARD,X
        CPX     MOVE            ;FROM SQUARE = TO SQUARE?
        BNE     TO11            ;NO.
        LDY     MLTJMP          ;YES. MULTIPLE JUMP?
        BNE     JOY12           ;YES.  MUST MOVE THIS PIECE TO CONTINUE MULTIPLE JUMP
        JSR     TOMOV           ;SET UP TOSQRB, CLEAR MOVFLG. RETURN TO "FROM" SQUARE -- CLEAR MOVE
        LDA     PIECE
        STA     BOARD,X
        JMP     JOY81           ;WAIT FOR SAME PLAYER TO MOVE AGAIN
TO11
        LDY     MSTJMP          ;MUST JUMP?
        BEQ     TO50            ;NO. SKIP
;
;       JUMP
;
;
;       CHANGE OPPONENT'S PIECE COUNT -- REMOVE JUMPED PIECE
;
        TXA                     ;CURSOR
        LDY     INDEX
        CLC
        ADC     MOVTAB,Y
        TAX
        LDA     BOARD,X         ;LOAD JUMPED PIECE

        LDY     #0
        STY     BOARD,X         ;REMOVE JUMPED PIECE FROM BOARD
        ASL     A               ;SHIFT KING BIT TO MSB
        ASL     A
        JSR     CHGCNT          ;CHANGE OPPONENT'S PIECE COUNT
        JSR     TOSUB           ;DO STUFF WITH PIECE INCLUDING KING CHECK
;                               STORE IN NEW SQUARE, RETURN X=MOVE. NEW KING?
        BCS     T051            ;YES.  NEW KING CAN'T DO MULTIPLE JUMP
        JSR     MOVCHK          ;RETURN X UNCHANGED.  CAN PIECE JUMP AGAIN?
        BCS     TO51            ;NO.
;                               YES.
        .IF     PRNG
        JSR     PRMOV2          ;PRINT MOVE IF DEBUG
        .ENDIF

        STX     CURSOR          ;MOVE TO CURSOR

        LDA     #JP
        STA     TOSQRB
        STA     FROMTO          ;TO MODE
        STA     MLTJMP          ;<>0 => CONTINUE JUMPING
        BNE     JOY90           ;JMP

TO50
        JSR     TOSUB           ;DO STUFF WITH MOVE & PIECE INCLUDING KING CHECK & STORE
TO51
        .IF     PRNT
        JSR     PRMOV2
        .ENDIF

        STX     CURSOR
        JSR     TONORM          ;RETURNS Y=$FF
        INY                     ;0
        STY     MSTJMP          ;CLEAR MSTJMP


        JSR     SWIT            ;REVERSE ACTIVE PLAYER
        LDA     #FRZTIM         ;SET FREEZE TIMER
        STA     FREEZE

;
;       BRANCH HERE FROM SETUP MODE WHEN PUSHBUTTON PUSHED
;       BRANCH HERE FROM CASE WHER EPIECE IS RETURNED TO STARTING SQUARE
;
JOY81
        LDA     #0
        STA     FROMTO          ;DO FROM NEXT
JOY90
        JSR     SOUND0          ;PIECE DROPPING SOUND
        JMP     ATTR10


;----------------------------------


;                               CHECK FOR JOYSTICK MOVEMENT EVERY FEW FRAMES
MOVE10
        LDA     ACTIVE          ;MOVE BIT 7 OF ACTIVE TO BIT 1 OF Y
        ROL     A               ;SET CARRY IF PLAYER 1
;
;       BRANCH HERE FROM SETUP WITH Y=0   CC => PLAYER 0
;
BNE0
        LDA     FRAME
        AND     #$1F
        BNE     MOVE36          ;DON'T MOVE THIS FRAME
MOVE12
        LDA     SWCHA
        BCS     MOVE20          ;CHECK CARRY BIT (SET UP PREVIOUSLY)
        LSR     A               ;P0
        LSR     A
        LSR     A
        LSR     A
MOVE20
        AND     #$F
        CMP     #$F             ;IS JOYSTICK CENTERED?
        BEQ     MOVE36          ;YES. SKIP
;
;                               ;JOYSTICK IS NOT CENTERED
MOVE28
        JSR     TONORM

        LDX     MOVE            ;TO MODE
        LDY     FROMTO          ;FROM?
        BNE     MOVE29          ;NO. TO

        JSR     TOMOV           ;SET UP TOSQRB, CLEAR MOVFLG. RETURN TO "FROM" SQUARE -- CLEAR MOVE
        LDX     CURSOR
MOVE29

        LDY     #3              ;CHECK FOR DIAGONAL MOVEMENT
M28LP
        CMP     JOYTAB,Y
        BEQ     MOVE37          ;DIAGONAL FOUND
        DEY
        BPL     M28LP           ;CONTINUE
MOVE36
        JMP     FRM30           ;NOT DIAGONAL -- NO SOUND

;                               ;DIAGONAL MOVEMENT
MOVE37
        JSR     ONBRD2          ;COMPUTE MOVE SQUARE. OFF BOARD?
        BCC     MOVE50          ;NO. OK
MOVE40
        LDA     #$80            ;INDICATE JOYSTICK ILLEGAL MOVE
        JMP     JOY13           ;ERROR
MOVE50
        TAX
        LDA     FROMTO          ;FROM?
        BNE     FRM10           ;NO. TO
        LDA     BOARD,X         ;YES. FROM
        STA     PIECE
        STX     CURSOR
        JMP     FRM20           ;JMP
FRM10
        LDA     MSTJMP          ;MUST JUMP?
        BEQ     MOVE60          ;NO.
        LDA     BOARD,X         ;YES. SQUARE EMPTY?
        BEQ     MOVE40          ;YES. ERROR
        EOR     ACTIVE          ;NO. OPPONENT'S PIECE?
        BPL     MOVE40          ;NO. ERROR
        JSR     ONBRD2          ;YES. MOVE TO NEXT SQUARE.  OFF BOARD?
        BCS     MOVE40          ;YES. ERROR
        TAX
MOVE60
        CPX     CURSOR          ;RETURN TO FROM SQUARE?
        BEQ     FRM15           ;YES. OK
        LDA     MOVE            ;ALREADY MOVED?
        CMP     CURSOR
        BNE     MOVE40          ;YES. CAN'T MOVE PIECE AGAIN (EXCEPT TO FROM SQUARE)
        LDA     BOARD,X         ;EMPTY?
        BNE     MOVE40          ;NO. ERROR
        LDA     PIECE           ;YES. LEGAL MOVE DIRECTION?
        CMP     #HUMCHK         ;HUMAN CHECKER (NOT KING)?
        BNE     MOVE70          ;NO.
        CPY     #2              ;YES. LEGAL?
        BCC     MOVE40          ;NO. ERROR
MOVE70
        CMP     #CMPCHK         ;RIGHT PLAYER CHECKER (NOT KING)?
        BNE     FRM15           ;NO. SKIP
        CPY     #2              ;YES. LEGAL?
        BCS     MOVE40          ;NO. ERROR
FRM15
        LDA     BOARD,X
        STA     MOVVAL
        STX     MOVE
        STX     TOSQRB
        STY     INDEX

FRM20
        LDA     #$30            ;SET UP FOR MOVE SOUND  -- LOAD AUDF0
        LDY     #14             ;AUDC0
        JSR     SOUND2          ;USE MAX VOLUME -- CALL SOUND ROUTINE
FRM30
        LDA     #0
        STA     ILEGAL          ;CLEAR ILLEGAL MOVE FLAG


;----------------------------------


;       SET UP CURSOR, MOVE, JMP DISPLAY
CRSBLK
        LDA     FRAME
        AND     #$10
        BNE     CRSB10
        LDA     MOVFLG
        BEQ     ATTR10

        SEC                     ;DISPLAY COMPUTER MOVE
        JSR     JMPSET          ;DISPLAY ANY JUMPED PIECES
        LDX     CURSC           ;COMPUTER CURSOR
        LDA     #CMPCRS
        STA     BOARD,X
        LDX     MOVE            ;DON'T SHOW COMPUTER'S NEW LOC
        LDA     #0
        STA     BOARD,X

        LDX     CURSOR
        CPX     MOVE            ;HUMAN CURSOR & COMPUTER MOVE IN SAME SQUARE?
        BNE     ATTR10          ;NO
        LDA     #HUMCRS         ;YES. DISPLAY HUMAN CURSOR NOW
        LDY     ACTIVE
        BPL     CRSB03
        LDA     #CMPCRS
CRSB03
        STA     BOARD,X
        JMP     ATTR10          ;JMP

CRSB10
        LDA     WINSAV
        BEQ     CRSB13

        LDA     MOVFLG
        BEQ     CRSB17
        LDX     CURSC           ;COMPUTER HAS WON -- DISPLAY ITS CURSOR
        LDA     #CMPCRS
        STA     BOARD,X
        BNE     CRSB17          ;JMP

CRSB13
        LDX     CURSOR          ;HUMAN CURSOR
        LDA     #0
        LDY     FREEZE          ;FREEZE LAST MOVE?
        BNE     CRSB16          ;YES.  DON'T DISPLAY CURSOR OR PIECE -- PIECE WILL BLINK
        LDA     MOVFLG          ;COMPUTER MOVE BEING DISPLAYED?
        BEQ     CRSB14          ;NO. OK
        CPX     MOVE            ;HUMAN CURSOR & COMPUTER MOVE ON SAME SQUARE?
        BEQ     CRSB17          ;YES.  DON'T DISPLAY HUMAN CURSOR NOW
CRSB14
        LDA     #HUMCRS
        LDY     ACTIVE
        BPL     CRSB15
        LDA     #CMPCRS         ;RIGHT PLAYER (P1) IS ACTIVE
CRSB15
        STA     BOARD,X

CRSB17
        LDA     FROMTO
        BEQ     ATTR10          ;FROM (MAY BE DISPLAYING COMPUTER MOVE)
        LDX     MOVE            ;TO
        LDY     PIECE
        CPY     MOVVAL          ;DOES PIECE = MOVVVAL?
        BNE     CRSB20          ;NO. SKIP
        LDA     FRAME           ;YES.  ONLY DISPLAY PIECE ON XXX10100 - XXX11011
        ROR     A               ;WHEN B2 & B3 ARE DIFFERENT
        EOR     FRAME
        AND     #4
        BNE     CRSB20
        LDY     #0
CRSB20
        STY     BOARD,X


;----------------------------------


;       LOAD RAM TABLE OF GRAPHICS FOR SCORE KERNEL
ATTR10
        LDY     #1              ;ONE PLAYER
        LDX     GAMNO
        STX     SCP0
        CPX     #PLAY2
        BNE     ATTR20
        INY                     ;2-PLAYER GAME
ATTR20
        STY     SCP1

        LDA     FREEZE          ;FREEZE?
        BNE     ATTR35          ;YES. SKIP -- DON'T CHANGE FROM
        LDX     CURSOR
        LDA     MOVFLG          ;COMPUTER MOVE DISPLAY?
        BEQ     ATTR30          ;NO.
        LDX     FROMB           ;YES. USE FROMB
ATTR30
        JSR     IEDSP
        STA     FROM            ;CONVERT BINARY TO BCD
ATTR35
        LDX     TOSQRB
        JSR     IEDSP
        STA     TOSQR


;
;       BASED ON VCS BASKETBALL BY AL MILLER (WITH EOR IMPROVEMENT A LA COIN-OP)
;
        LDX     #0
        STX     T4+1            ;INITIALIZE HIGH BYTE INDIRECT POINTER
        LDA     #SCRTBL/256
        STA     T0+1
        STA     T2+1
        LDA     #5*4+SCRLP0
;
        LDX     #3
LODRAM
        SEC
        SBC     #5
        STA     T4
        LDA     FROM,X          ;GET LOW ORDER DIGIT
        AND     #$0F
        STA     T2
        ASL     A
        ASL     A               ;SHIFT LEFT AND CLEAR CARRY
        ADC     T2              ;FIVE TIMES LOW DIGIT
        ADC     #SCRTBL&$FF     ;ADD IN BEGINNING OF GRAPHICS TABLE [todo - indent properly]
        STA     T0              ;STORE IN LOW BYTE OF INDIRECT POINTER
;
;
        LDA     FROM,X          ;GET HIGH ORDER DIGIT
        AND     #$F0
        LSR     A
        LSR     A               ;SHIFT RIGHT AND CLEAR CARRY
        STA     T2
        LSR     A
        LSR     A
        ADC     T2              ;FIVE TIMES HIGH ORDER BIT
        ADC     #SCRTBL&$FF     ;ADD IN BEGINNING OF GRAPHICS TABLE
        STA     T2              ;STORE IN LOW BYTE OF INDIRECT POINTER
;
        LDY     #4
HIDIGT
        LDA     (T0),Y
        EOR     (T2),Y          ;TAKE UPPER NIBBLE FROM T2, LOWER FROM T0
        AND     #$0F
        EOR     (T2),Y
        STA     (T4),Y          ;STORE IN RAM TABLE OF GRAPHICS
        DEY
        BPL     HIDIGT

        LDA     T4
;
        DEX
        BPL     LODRAM
;
        LDX     #5
DOROT   LDA     SCRRPF-1,X      ;MAKE MIRROR IMAGE [todo - original had no semicolon]
;
        LDY     #7
ROTIT   ROL     A
        ROR     SCRRPF-1,X
        DEY
        BPL     ROTIT
;
        DEX
        BNE     DOROT


;----------------------------------


;
;       SET UP PLAYERS AND MISSILE FOR SCORE
;
        LDA     #$15
        STA     NUSIZ0          ;2 CLOCK MISSILE, DOUBLE SIZE PLAYERS (1 COPY)
        STA     NUSIZ1
        LDA     #$F0            ;1 TO RIGHT
        STA     HMP0
        LDA     #$30            ;3 TO LEFT
        STA     HMP1
        LDA     #$C0            ;4 TO RIGHT
        STA     HMM0

        STA     WSYNC
        LDY     #8              ;8*5+1 = 41 MACHINE CYCLES
WSLP    DEY                     ;WARNING -- MUST NOT CROSS PAGE BOUNDARY [todo - check in converted code]
        BNE     WSLP            ;DELAY
        STA     RESP0           ;44
        NOP                     ;46 DELAY
        STA     RESM0           ;49
        STA     RESP1           ;52

        STA     WSYNC
        STA     HMOVE


;----------------------------------


;
;       SET UP COLORS, DOING ATTRACT IF NECESSARY
;
        LDX     #0              ;0 IF NOT ATTRACT
        LDA     OLDPBQ
        AND     #$08            ;B/W?
        BNE     QQ30            ;NO. COLOR -- SKIP
        LDA     #$0F            ;YES.
        LDY     GFLG2           ;ATTRACT?
        BNE     QQ10            ;NO. SKIP
        LDX     ATIM            ;YES. USE ATTRACT TIMER TO CHANGE LUMS
        LDA     #$07            ;MASK OFF COLOR BITS
QQ10
        STA     T0              ;SAVE MASK
        TXA
        EOR     #$06            ;DARK SQUARE COLOR
        AND     T0
        STA     COLSQ
        STA     COLUPF
        STA     COLUBK          ;USE THIS FOR BK COLOR FOR SCORE
        TXA
        EOR     #$0A            ;LIGHT SQUARE COLOR
        AND     T0
        STA     T8
        TXA
        EOR     #$0C            ;LIGHT CHECKER COLOR
        AND     T0
        STA     COLP1           ;ASSUME COMPUTER (P1) IS LIGHT
        TXA
;       EOR #$00 ;ASSUME HUMAN (P0) IS DARK [todo - circled in printout. weird no-op?]
        AND     T0
        STA     COLP0
        LDY     COLHUM
        CPY     #DARK           ;IS HUMAN DARK?
        BEQ     QQ20            ;YES. SKIP
        LDY     COLP1           ;NO. SWITCH
        STY     COLP0
        STA     COLP1
        TYA
QQ20
        STA     COLUP0          ;STORE HUMAN COLOR FOR SCORE
        STA     COLUP1
        JMP     QQ50
;
;       COLOR
;
QQ30
        LDA     #$FF
        LDY     GFLG2           ;ATTRACT?
        BNE     QQ40            ;NO. SKIP
        LDA     ATIM            ;YES. ROTATE SO COLORS SHIFT QUICKLY
        ROL     A
        ROL     A
        ROL     A
        ROL     A
        TAX
        LDA     #$F7            ;MASK OFF HI BIT OF LUM IN ATTRACT
QQ40
        STA     T0
        TXA
        EOR     #DRKCHR
        LDY     COLHUM
        CPY     #DARK           ;IS HUMAN DARK?
        BEQ     LPSKIP          ;YES. SKIP
        TXA
        EOR     #LTCHR          ;HUMAN IS LIGHT -- SO IS SCORE COLOR
LPSKIP
        AND     T0
        STA     COLUP0
        STA     COLUP1

        LDY     #0
        LDA     GAMNO
        AND     #$0F
        CMP     #HMIN
        BCC     LPX
        LDY     #3              ;USE DIFFERENT COLORS FOR HARD GAMES
LPX
        TXA
        EOR     COLTB,Y
        AND     T0
        STA     COLSQ           ;DARK SQUARE COLOR
        STA     COLUPF          ;SET UP PLAYFIELD COLOR

        LDA     GFLG2           ;ATTRACT?
        BNE     LPQX            ;NO.
        INY                     ;YES.  USE DIF COLORS
LPQX
        TXA
        EOR     COLTB+1,Y
        AND     T0
        STA     COLUBK          ;LIGHT SQUARE COLOR AND BK
        STA     T8

        TXA
        EOR     COLHUM
        AND     T0
        STA     COLP0
        TXA
        EOR     COLCMP
        AND     T0
        STA     COLP1

QQ50
        LDA     WINSAV
        BEQ     LP10
        LDA     FRAME           ;SOMEONE HAS WON
        AND     #$10
        BNE     LP10            ;TURN OFF REMAINING PLAYER'S PIECES EVERY
;                               FEW FRAMES BY SETTING TO PF COLOR
        LDA     COLSQ
        LDX     ACTIVE
        BMI     LP06
        STA     COLP1           ;HUMAN CAN'T MOVE -- TURN OFF COMPUTER
        BPL     LP10            ;JMP
LP06
        STA     COLP0           ;COMPUTER CAN'T MOVE -- TURN OFF HUMAN
LP10
        LDY     BLNKTM
        BEQ     VBLP

        LDY     #2              ;KEEP VBLANK ON WHIL SYNCING AFTER CALCULATIONS

        DEC     VLNKTM
        BNE     VBLP

        LDA     GAMNO           ;BLANK TIME IS UP
        CMP     #PLAY2
        BEQ     VBLP            ;2-PLAYER GAME
        JSR     SOUND0          ;PIECE DROPPING SOUND IF 1-PLAY & HUMAN NEXT

VBLP    LDX     INTIM           ;WAIT FOR TIMER TO RUN OUT
        BNE     VBLP

        STA     WSYNC
        STY     VBLANK          ;END OF VERTICAL BLANK (IF Y=0)
        .IF     PAL             ;IF PAL THEN ADD 3 EXTRA LINES AT TOP OF DISPLAY
        JSR     WAIT3           ;DO 3 WSYNC'S
        .ENDIF

        JMP     JMPBAK          ;SKIP BACK TO KERNEL
;                               END OF MAIN PROGRAM


;----------------------------------



;       GSRST -- SUBROUTINE TO CHECK GAME SELECT AND RESET SWITCHES
;
GSRST
        LDA     OLDPBQ          ;CHECK GAME SELECT
        ROR     A
        ROR     A
        BCS     GS1             ;BRANCH IF GAME SELECT NOT PRESSED


        DEC     GSTIM           ;GAME SELECT PRESSED -- DON'T CHANGE GAME NUMBER TILL TIME UP
        BNE     GRTN2

        LDA     #GSCON
        STA     GSTIM           ;REINITIALIZE TIMER

        SED                     ;DECIMAL ARITHMETIC
        LDA     GAMNO
        CLC
        ADC     #1
        CMP     #$20            ;GMAX+1 IN DECIMAL
        BNE     RESET2
        LDA     #1
RESET2
        STA     GAMNO
        CLD

        LDA     WINSAV          ;STAY IN ATTRACT IF WIN
        BNE     GSKIP

        JSR     TONORM          ;MAKE SURE NOT ATTRACT, RETURN Y=$FF
GSKIP
        LDY     #0
        STY     AUDV1
GRTN2
        RTS

;                               SET UP GAME SELECT TIMER & CHECK GAME RESET
GS1
        ASL     A
        BCS     RES20           ;NOT PRESSED -- GSTIM<-1 & RETURN

        LDA     #0              ;RESET BUTTON IS PRESSED
        LDX     #ZROEND-1-ZROBGN
CLRLP
        STA     ZROBGN,X
        DEX
        BPL     CLRLP

        .IF     PRNT
        LDX     #0
        STX     PRCNT
        .ENDIF

        STA     AUDV1           ;OFF (0)

        LDX     #3              ;CLEAR MORE STUFF -- MOVVAL, MOVFLG, WINSAV, FROMTO
RESLP
        STA     MOVVAL,X
        DEX
        BPL     RESLP

;
;       RESET -- ENTRY POINT FROM INIT CODE
;
RESET
        JSR     TONORM          ;NOT ATTRACT, Y<-$FF
        STY     JMPI            ;$FF

        JSR     MOVCLF          ;NO CURRENT MOVE SO POINT OFF BOARD
        LDA     OLDPB6
        BNE     RES10           ;IF SETUP MODE THEN LEAVE BOARD EMPTY
;                               SET UP BOARD
        LDA     #CHECKER+CLP0   ;HUMAN ON 0-12 (8 NOT USED)
        LDY     #CHECKER+CLP1   ;COMPUTER ON SQUARES 22-34 (26 NOT USED)
        LDX     #13-1+1
BRDLP
        STA     BOARD-1,X
        STY     BOARD-1+22,X
        DEX
        BNE     BRDLP

        STX     BOARD+8         ;CLEAR PHANTOM SQUARES
        STX     BOARD+26

        LDA     #12*2           ;INITIALIZE PIECE COUNTS -- 12 MEN PER SIDE
        STA     CPIECE          ;COMPUTER PIECE COUNT (P1)
        STA     HPIECE          ;HUMAN PIECE COUNT (P0)

RES10
        LDX     #11             ;INITIALIZE CURSOR POSITIONS
        LDY     #23
        LDA     GAMNO
        CMP     #PLAY2
        BNE     RES15
        LDA     ACTIVE          ;BOTTOM (P0) PLAYER STARTS?
        BPL     RES15           ;YES.
        LDX     #23             ;NO. TOP PLAYER STARTS
        LDY     #11
RES15
        STX     CURSOR
        STY     CURSC
        LDA     BOARD,X
        STA     PIECE

        LDA     #$80
        STA     OLDINP
        JSR     CRSTUP          ;SET UP ACTIVE, COLHUM, COLCMP BASED ON RIGHT DIFFICULTY SWITCH

        JSR     TOSET           ;MSTJMP=0 SO CLEAR TOSQRB, MOVFLG
RES20
        LDX     #1
        STX     GSTIM
        RTS


;----------------------------------


        .IF     PAL
;
;       WAIT3 -- DO 3 WSYNC'S
;       WAIT2 -- DO 2 WSYNC'S
;
WAIT3
        STA     WSYNC
WAIT2
        STA     WSYNC
        STA     WSYNC
        RTS
        .ENDIF
;
;       JMPSET -- SET UP OR CLEAR BOARD FOR JUMP DISPLAY
;
;                       INPUT:  CC  => CLEAR EACH SQUARE [todo - check indentation against right comments]
;                               CS => PUT JUMPED CHECKERS IN EACH SQUARE IN JMPLST
;
JMPSET
        LDY     JMPI
        BMI     JMPSR           ;NO JUMPS
JMPSLP
        LDA     #HUMCHK
        LDX     JMPLST,Y
        BPL     JMPS10
        TXA                     ;<0 => KING
        AND     #$7F
        TAX
        LDA     #HUMKNG
JMPS10
        BCS     JMPS20
        LDA     #0              ;CLEAR SQUARE
JMPS20
        STA     BOARD,X
        DEY
        BPL     JMPSLP
JMPSR
        RTS


;
;       JMPWIN -- SET UP OLDINP, MLTJMP, CALL JMPCHK TO SET UP MSTJMP,XMOVE
;                               RETURN EQ=>WIN, NE=> NO WIN
;
JMPWIN
        LDA     #$80
        STA     OLDINP          ;ASSUME BUTTON NOT PRESSED
        LDA     #0
        STA     MLTJMP
        JSR     JMPCHK          ;CHECK FOR JUMPS & ANY MOVES
        BNE     JMPRTN          ;CAN MOVE

        .IF     PRNT            ;CAN'T MOVE -- OTHER PLAYER WINS
        LDA     PRFLG
        BEQ     PRSKIP
        JSR
CRLF
        LDA     #GAMOVR         ;DISPLAY "GAME OVER" ON TI IF DEBUG
        JSR     OUTMSG
        JSR     PRBRD
PRSKIP
        .ENDIF

        INC     WINSAV
        LDA     #$80
        STA     SNDTIM
        LDA     #0              ;EQ
JMPRTN
        RTS
;
;       JMPCHK -- CHECK TO SEE IF ACTIVE PLAYER HAS ANY JUMPS.SETUP MSTJMP,CALL MOVCHK TO SET UP XMOVE
;                               RETURN CC=> JUMP, CS => NO JUMPS
;                               MSTJMP=4 OR MSTJMP =0
;                               NE => ACTIVE PLAYER CAN MOVE (ANYMVE = 1)
;                               EQ => ACTIVE PLAYER CANNOT MOVE AT ALL (ANYMVE = 0)
;
;                               SETS UP BLNKTM, TURNS O VBLANK
;
JMPCHK
        LDA     #VBTIM          ;BLANK SCREEN FOR 1/2 SECOND AFTER
        STA     BLNKTM          ;THIS BECAUSE IT TAKES 1203-2080 MICROSEC.
        LDA     #2
        STA     VBLANK          ;TURN ON VBLANK
;
;       JMPCK2 -- SAME AS JMPCHK EXCEPT NO VBLANK JUNK
;
JMPCK2
        LDA     #0
        STA     ANYMVE          ;NO MOVE FOUND YET
        LDA     #4
        STA     MSTJMP          ;ASSUME JUMP
        LDX     #34
JMPLP1
        JSR     MOVCHK
        BEQ     JPF1
        INC     ANYMVE          ;INDICATE THAT MOVE HAS BEEN FOUND
        BCC     JMPF2           ;JUMP FOUND
JPF1
        DEX
        BPL     JMPLP1
        INX                     ;NO JUMP FOUND  0, CS
        STX     MSTJMP
JMPF2
        LDY     ANYMVE
        RTS


;----------------------------------


;
;       LOADY -- Y <-- 3 (OR 1 IF CMPCHK)
;
LOADY
        LDY     #3
        LDA     BOARD,X
        CMP     #CMPCHK
        BNE     LODY10
        LDY     #1              ;COMPUTER CHECKER CANNOT MOVE FORWARD (UP) -- SKIP RF,LF
LODY10
        RTS
;
;       MOVCHK -- CHECK TO SEE IF THIS IS AN ACTIVE PIECE WHICH CAN JUMP
;
;                       INPUT: X = SQUARE NUMBER (0-34)
;                       OUTPUT: X=SQUARE #
;                       CC => ACTIVE, CAN JUMP
;                       CS => CANNOT JUMP
;                       Y>0 (NE)  => ACTIVE PIECE WHICH CAN MOVE -- SAVED IN YSAVE
;                       Y=0 (EQ)  => NO MOVE AT ALL FOR THIS SQUARE
;                       XMOVE=START SQUARE OF FIRST MOVE OR JUMP FOUND IF ANYMVE=0 OR IF JUMP.
;
MOVCHK
        LDY     #0
        STY     YSAVE           ;T2
        LDA     BOARD,X
        BEQ     JMP12           ;EMPTY SQUARE
        EOR     ACTIVE
        BMI     JMP12           ;PASSIVE PIECE -- CAN'T MOVE
        STX     XSAVE           ;T1
        JSR     LOADY           ;Y <-- 3 (OR 1 IF CMPCHK)
JMPLP2
        JSR     ONBRD2          ;ADD MOVTAB OFFSET TO SQUARE AND CHECK TO SEE IF OFF BOARD
        BCS     JMP10           ;OFF BOARD
        TAX
        LDA     BOARD,X
        BNE     JMP05
;
;       NOT JUMP
;
        TXA                     ;NEXT SQUARE IS EMPTY
        LDA     ANYMVE
        BNE     JMP02
        LDX     XSAVE
        STX     XMOVE           ;SAVE START SQUARE AND OFFSET INDEX
JMP02
        INC     YSAVE
        BNE     JMP10           ;JMP
;
;       JUMP
;
JMP05
        EOR     ACTIVE          ;NEXT SQUARE IS OCCUPIED
        BPL     JMP10           ;ACTIVE PIECE -- CAN'T JUMP OWN PIECE
        JSR     ONBRD2          ;ADD MOVTAB OFFSET TO SQUARE AND CHECK TO SEE IF OFF BOARD
        BCS     JMP10           ;CAN'T JUMP OFF BOARD
        TAX
        LDA     BOARD,X
        BNE     JMP10

        LDX     XSAVE           ;SAVE START SQUARE AND OFFSET INDEX FOR JUMP
        STX     XMOVE           ;CC, NE  JUMP FOUND
        LDY     #1
        RTS

JMP10
        LDX     XSAVE
        DEY
        BMI     JMP12           ;DONE
        CPY     #1
        BNE     JMPLP2          ;CONTINUE
        LDA     BOARD,X
        CMP     #HUMCHK
        BNE     JMPLP2
;                               HUMAN CHECKER CAN'T GO BACK (DOWN) SKIP RB,LB
JMP12
        SEC                     ;NO JUMP FOUND
        LDY     YSAFE           ;LOAD MOVE COUNT
        RTS


;----------------------------------


;
;       XIE1 --      INPUT X = INTERNAL SQUARE NUMBER (0-34) [todo - fix this wrong indentation line]
;                               OUTPUT X = EXTERNAL SQUARE #-1    (0-31)
;                               AFFECTS X, CARRY SET IF RESULT = 24-31
;                               INTERNAL #'S 8, 17 AND 26 ARE NOT USED.
;
XIE1
        CPX     #8
        BCC     ARTN            ;O-7 OK
        DEX                     ;9-34 TO 8-33
        CPX     #16
        BCC     ARTN            ;8-15 OK
        DEX                     ;17-33 TO 16-32
        CPX     #24
        BCC     ARTN            ;16-23 OK
        DEX                     ;25-32 TO 24-31
ARTN
        RTS
;
;       IEDSP -- CONVERT INTERNAL SQUARE # IN X (0-34) TO
;                               EXTERNAL IN A FOR DISPLAY.
;                               1-32 IF HUMAN IS DARK, 32-1 IF HUMAN IS LIGHT
IEDSP
        TXA
        BPL     IED04

        LDA     FRAME
        AND     #$10
        BEQ     IED02
        LDX     #BLANK          ;IF SPECIAL CHAR (E.Q. "JP") THEN BLINK ON & OFF
IED02
        TXA
        RTS

IED04
        JSR     XIE1

        LDA     OLDPBQ          ;CHECK "B/W SWITCH"
        LDY     COLHUM
        CPY     #DARK
        BNE     IED05           ;HUMAN LIGHT => REVERSE NUMBERING
        AND     #$8             ;DARK=>DON'T REVERSE
        BEQ     IED07           ;B/W => REVERSE
        BNE     IED10           ;NOT B/W => DON'T REVERSE
IED05
        AND     #8              ;CHECK B/W
        BEQ     IED10           ;B/W IMPLIES DON'T REVERSE
IED07
        TXA                     ;BOARD REVERSED
        SEC
        SBC     #32             ;31-X = -(X-31) = -((X-32)+1) = COMP (X-32)
        EOR     #$FF            ;COMPLEMENT
        TAX
EID10
        INX                     ;1-32
        TXA

;                               CONVERT BINARY IN A TO DECIMAL IN A
        LDY     #0
IEDLP1
        CMP     #$10
        BCC     IED20           ;0-9 => DONE
        SBC     #10
        INY
        BNE     EIDLP1          ;JMP

IEDLP2
        ADC     #16             ;CONVERT BINARY TO DECIMAL
IED20
        DEY
        BPL     IEDLP2
        RTS


;----------------------------------


;
;       ONBRD2 -- ADD MOVTAB OFFSET TO SQUARE AND CHECK TO SEE IF OFF BOARD
;
ONBRD2
        TXA
        CLC
        ADC     MOVTAB,Y
;
;       ONBRD -- INPUT: A=INTERNAL SQUARE #
;                               OUTPUT: CS => OFF BOARD
;                                A,X,Y ARE NOT CHANGED
;
        CMP     #35
        BCS     NOTON           ;>=35 OR <=
        CMP     #26
        BEQ     NOTON
        CMP     #17
        BEQ     NOTON
        CMP     #8
        BEQ     NOTON
        CLC
        RTS
NOTON
        SEC
        RTS



;
;       TOSET -- SET UP TOSQRB, MOVFLG, RETURN Y=0, A,X UNCHANGED, EQ
;
TOSET
        LDY     MSTJMP          ;"FROM"
        BEQ     MV285
        LDY     #JP             ;MUST JUMP
        BNE     MV287           ;JMP
MV285
        LDY     #BLANK          ;NO JUMP
MV287
        STY     TOSQRB

        LDY     #0
        STY     MOVFLG
        RTS


;----------------------------------


;
;       TONORM --       GO OUT OF ATTRACT INTO NORMAL MODE [todo - verify indentation]
;
TONORM
        LDY     #0              ;CLEAR TIMER
        STY     ATIM
        DEY                     ;RETURN Y=$FF
        STY     GFLG2
        RTS


;
;       CRSTUP -- SET UP ACTIVE AND COLORS (COLHUM&COLCMP) (DEPENDS ON RIGHT DIFFICULTY SWITCH)
;
CRSTUP
        LDY     OLDPBQ
        BPL     FSET20          ;0 (AM,B,DOWN) => P0 FIRST (ACTIVE)


        LDA     #$80            ;COMPUTER STARTS 1 (PRO,A,UP)
        LDX     #LIGHT          ;HUMAN IS LIGHT
        LDY     #DARK           ;COMPUTER IS DARK (OR RIGHT HAND PLAYER)
        BNE     FSET30          ;JMP
FSET20
        LDA     #0
        LDX     #DARK           ;HUMAN IS DARK
        LDY     #LIGHT          ;COMPUTER IS LIGHT (OR RIGHT HAND PLAYER)
FSET30
        STA     ACTIVE
        STX     COLHUM
        STY     COLCMP
        RTS


;
;       SWIT -- SWITCH ACTIVE PLAYER, RETURN A=ACTIVE
;
SWIT
        LDA     ACTIVE
        EOR     #$80
        STA     ACTIVE
        RTS


;----------------------------------



;
;       RESTR6 -- RESTORE A BUNCH OF STUFF INCLUDING FRSMOV
;
RESTR6
        AND     #$C0
        STA     FRSMOV
;
;       RESTR4 -- RESTORE BOARD AFTER JUMP
;
RESTR4
        LDX     DEPTH
        LDA     OTHER-1,X       ;COMPUTE PIECE
        AND     #$30
        ORA     ACTIVE
        STA     PIECE

        LDA     OTHER-1,X
        PHA                     ;CAPTURED PIECCE
        LDA     FROMB           ;FROM SQUARE
        LDY     INDEX
        CLC
        ADC     MOVTAB,Y
        TAX                     ;JUMP SQUARE
        CLC
        ADC     MOVTAB,Y
        STA     TOSQRB
        PLA
;
;       RESTR5 -- ENTRY POINT
;
RESTR5
        LDY     #2              ;SET UP TO INCREMENT OPPONENT'S PIECE COUNT
        ROL     A               ;KING?
        LDA     #CMPCHK
        BCC     NOK             ;NO.
        INY                     ;KING => 3
        LDA     #CMPKNG
NOK
        EOR     ACTIVE          ;OPPOSITE PLAYER -- JUMPED PIECE
        STA     BOARD,X

        AND     #$80            ;ACTIVE EOR #$80
        ASL     A
        ROL     A               ;SHIFT AND CLEAR CARRY
        TAX
        TYA
        ADC     HPIECE,X
        STA     HPIECE,X        ;STORE NEW PIECE COUNT

        CPY     #3
        BNE     NOK10
        INC     HKING,X
NOK10

        LDA     MSTFLG
        STA     MSTJMP
        LDA     MLTFLG          ;RESTORE FLAGS
        STA     MLTJMP
;
;       RESTOR -- MOVE PIECE BACK & DEC PIECE COUNT IF NEW KING
;
RESTOR
        LDX     TOSQRB
        LDA     BOARD,X
        CMP     PIECE
        BEQ     TERR            ;SAME -- NOT NEW KING
        LDA     ACTIVE          ;MOVE BIT7 TO BIT 1
        ASL     A
        ROL     A
        TAX
        DEC     HPIECE,X
        DEC     HKING,X         ;DECREMENT KING COUNT
TERR
        LDX     TOSQRB
        LDA     #0
        STA     BOARD,X         ;CLEAR TO SQUARE
        LDX     FROMB
        LDA     PIECE           ;MOVE PIECE TO FROM SQUARE
        STA     BOARD,X
        RTS


;----------------------------------


;
;       JUMP1 -- SETS UP JMPLST IF MULTIPLE JUMP FOR COMPUTER (FOR END OF ALPHA-BETA)
;
;       INPUT: T0 = STARTING SQUARE
;              Y = INDEX INTO MOVTAB
;              T1 = CURRENT JMPLST INDEX
;
;       OUTPUT: T0 = ENDING SQUARE (AFTER JUMP_
;               T1 = T1+1 (OLD T1 IN X)
;               JMPLST,X = JUMPED PIECE (B7=1 => KING) AND SQUARE
;               CS = DONE (LAST JUMP)
;
JUMP1
        LDA     T0
        CLC
        ADC     MOVTAB,Y
        PHA
        TAX
        LDA     BOARD,X         ;SAVE JUMP SQUARE

        DEC     HPIECE          ;DECREMENT HUMAN'S PIECE COUNT
        DEC     HPIECE
        CMP     #HUMKNG
        BNE     NK
        DEC     HPIECE          ;KING -- DECREMENT AGAIN
        DEC     HKING           ;DEC KING COUNT
NK
        PHA                     ;SAVE JUMPED PIECE
        LDA     #0              ;CLEAR OUT JUMP SQUARE
        STA     BOARD,X
        PLA

        TAX
        PLA                     ;JUMP SQUARE
        PHA
        CPX     #HUMKNG         ;DOES JUMP SQUARE CONTAIN HUMAN KING?
        BNE     JUMPS           ;NO.
        ORA     #$80            ;YES. KING
JUMPS
        LDX     T1
        STA     JMPLST,X
        INC     T1

        PLA                     ;RELOAD JUMP SQUARE
        CLC                     ;COMPUTE TO SQUARE
        ADC     MOVTAB,Y
        STA     T0
        CPX     JMPI            ;DONE?
        RTS


;----------------------------------


;
;       JUMP4 -- SIMILAR TO JUMP1, EXCEPT DOES 4 JUMPS
;
;       INPUT: A = 4 OFFSET INDEX (B7-6 = FIRST)
;              T0 = START SQUARE (FOR JUMP1)
;              T1 = JMPLST INDEX (FOR JUMP1)
;
;       USES:  T2 = LOOP COUNT
;              T3 = INDEXES
;
;       OUTPUT: T0 = END SQUARE, CS=> DONE
;
JUMP4
        STA     T3
        LDA     #3
        STA     T2
JUMPL
        LDA     #0
        ASL     T3              ;SHIFT 2 BITS OF INDEX FROM MSB'S OF T3 TO LSB'S OF A
        ROL     A
        ASL     T3
        ROL     A
        TAY
        JSR     JUMP1
        BCS     JUMP4           ;BRANCH IF DONE
        DEC     T2
        BPL     JUMPL           ;CONTINUE
JUMPR
        RTS


;----------------------------------


;
;       TERMNODE -- CHECK FOR TERMINAL NODE
;
;       RETURN ACTIVE SWITCHED
;       CC => NOT TERMINAL --  XMOVE, AND MSTJMP SET UP FOR NEXT LEVEL
;       CS => TERMINAL -- NUM = STATIC VALUE OF BOARD
TERMNODE
        JSR     SWIT            ;SWITCH ACTIVE PLAYER TO GET ACTIVE FOR NEXT LEVEL
        JSR     JMPCK2          ;CHECK FOR MOVE OR JUMP, SET UP MSTJMP, XMOVE,YMOVE
        BNE     ALP200          ;CAN MOVE

        LDX     DEPTH           ;CAN'T MOVE -- VERY BAD
        TXA
        CLC
        ADC     #2
        STA     ALPHAL+1,X
        LDA     #$80
        STA     ALPHAH+1,X      ;-INFINITY = $8002+DEPTH = -(7FFF - DEPTH-1) (-7FFD TO -7FFE)  ($8003 - $800 [todo - original likely truncated]
        JMP     SED20           ;NEGATE IF LOSING CHECKERS & RETURN CARRY SET
;
;       ALP200 -- ENTRY POINT -- CHECK DEPTH -- WE KNOW WE CAN JUMP.  CS=>TERMINAL NODE
;
ALP200  LDA     DEPTH
        CMP     #MAXMAX
        BCC     ALP220

        JSR     STATEVAL        ;"STACK" FULL -- MUST STOP
        LDA     MSTJMP
        BEQ     ALP210
;                               MUST JUMP -- MODIFY VALUE FOR PENDING JUMP
;                               DECREATE MAGNITUDE OF SCORE.
        LDY     #0              ;ADD NEGATIVE NUMBER
        LDX     DEPTH
        LDA     ALPHAH+1,X
        BPL     ALP205
        LDY     #2              ;<0  =>  ADD POSITIVE NUMBER
ALP205
        LDA     ADDTAB,Y        ;POS. => -ADDTRM.   NEG => ADDTRM
        CLC
        ADC     ALPHAL+1,X
        STA     ALPHAL+1,X
        LDA     ADDTAB+1,Y      ;POS=> $FF.  NEG => 0
        ADC     ALPHAH+1,X
        STA     ALPHAH+1,X

ALP210
        SEC
        RTS

ALP220
        LDX     MSTJMP          ;MUST JUMP?
        BEQ     ALP235          ;NO. BRANCH
ALP230
        CLC                     ;YES. CONTINUE TREE SEARCH
ALP231
        RTS
ALP235
        LDA     GAMNO           ;CHECK MAX DEPTH
        AND     #$0F
        CMP     DEPTH
        BEQ     ALP240          ;IF GAMNO = DEPTH THEN STOP UNLESS OTHER PLAYER CAN JUMP
        BCS     ALP230          ;IF GAMNO > DEPTH THEN CONTINUE TREE SEARCH
;
;                               IF GAMNO < DEPTH THEN STOP UNLESS OTHER PLAYER CAN JUMP
;
ALP240


;----------------------------------


;        STATEVAL -- COMPUTE STATIC VALUE OF BOARD
;
;       HUMAN ACTIVE => -CPIECE/HPIECE   THEN SHIFT LEFT 4 BITS  (2 BYTE RESULT)
;       COMPUTER ACTIVE => CPIECE/HPIECE
;       RESULT IS TWO BYTES IN NUM & ALPHA(DEPTH+1) (THIS MIGHT REPLACE OLD ALPHA VALUE)
;       NUM = LSB = FRACTIONAL PART.
;       NUM+1 = MSB = INTEGER PART.
;
;       RETURN CARRY SET
;
STATEVAL
        LDX     HPIECE
        LDY     CPIECE
        STX     DEN             ;HUMAN ACTIVE => HPIECE/CPIECE
        STY     NUM+1           ;MSB
        LDA     #0              ;LSB
        STA     NUM
        LDX     #17
        CLC
SELP
        ROL     NUM             ;LSB
        ROL     NUM+1           ;MSB
        DEX
        BEQ     SEDONE          ;BRANCH IF DONE
        ROL     A
        CMP     DEN
        BCC     SELP            ;0
        SBC     DEN
        BCS     SELP            ;DJUMP -- ROTATE IN 1
SEDONE
        LDA     #0
        STA     T1              ;INIT CREDIT TO 0

        ASL     NUM             ;SHIFT LEFT 4 BITS
        ROL     NUM+1           ;CHECK FOR OVERFLOW
        ASL     NUM
        ROL     NUM+1
        ASL     NUM
        ROL     NUM+1
        ASL     NUM
        ROL     NUM+1
        BCS     SED05           ;OVERFLOW
        BPL     SED07           ;NO OVERFLOW
SED05
        LDA     #$FF-MAXMAX-2   ;$F2 IF MAXMAX = 11
        STA     NUM
        LDA     #$7F            ;SET TO MAX MAGNITUDE (-$800E TO ALLOW ROOM FOR DEC)
        STA     NUM+1
        JMP     ADDSUM          ;IGNORE REST OF CREDITS
SED07


;----------------------------------


;
;       END GAME CLEAN UP -- DO ONLY IF COMPUTER IS WINNING OR EVEN
;
        LDA     #$FF
        STA     T7              ;INDICATE NOT END GAME UNTIL PROVEN OTHERWISE

        LDA     HPIECE
        SEC                     ;COMPUTE # OF HUMAN PIECES * 2 = HPIECE-HKING
        SBC     HKING
        CMP     #ENDPC          ;DOES HUMAN HAVE MORE THAN END GAME AMOUNT?
        BCC     DIS03
DIS02
        JMP     DIS70           ;YES.  NOT END GAME
DIS03
        ADC     CKING           ;NO. ENG GAME. IS COMPUTER AHEAD IN # OF PIECES?
        SEC
        SBC     CPIECE
        BCS     DIS02           ;SKIP IF HUMAN >= COMPUTER

DIS04
        LDX     #34
DISLP1
        STX     T7              ;SAVE X
        LDA     BOARD,X         ;EMPTY SQUARE?
        BEQ     DIS65           ;YES. TRY NEXT SQUARE

        AND     #KING           ;KING?
        BNE     DIS05           ;YES.  SKIP

        JSR     XIE1            ;NO. ORDINARY MAN.  COMPUTE DISTANCE OF MAN FROM BOTTOM OF BOARD
        TXA
        LSR     A
        LSR     A
        CLC
        ADC     T1              ;ADD T1
        STA     T1
        LDX     T7              ;RELOAD X
DIS05
        LDA     BOARD,X
        BMI     DIS65           ;SKIP IF COMPUTER
        JSR     XIE1            ;CONVERT INTERNAL SQUARE # TO EXTERNAL
        TXA
        LSR     A
        LSR     A
        STA     T6              ;ROW
        EOR     #1              ;COMPLEMENT LSBIT
        ROR     A               ;AND SHIFT TO CARRY.
        TXA
        ROL     A               ;SHIFT CARRY INTO B0
        AND     #7              ;AND MASK TO GET COL
        STA     DEN             ;COL

        LDX     #34             ;FIND COMPUTER'S PIECES
DISLP2
        LDA     BOARD,X
        BPL     DIS60           ;EMPTY OR HUMAN
;                               CHECK FOR KING?
        TXA                     ;SAVE INTERNAL SQUARE #
        PHA
        JSR     X1E1            ;CONVERT INTERNAL SQUARE # TO EXTERNAL
        TAX
        LSR     A               ;COMPUTE ROW
        LSR     A
        SEC
        SBC     T6              ;COMPUTE DIFFERENCE IN ROWS
        BPL     DIS30
        EOR     #$FF            ;MAKE POSITIVE
        CLC
        ADC     #1
DIS30
        STA     T0
        TXA                     ;COMPUTE DIFFERENCE IN COLS
        LSR     A
        LSR     A
        EOR     #1
        ROR     A               ;SHIFT TO CARRY
        TXA
        ROL     A
        AND     #7              ;COL
        SEC
        SBC     DEN
        BPL     DIS40
        EOR     #$FF            ;MAKE POSITIVE
        CLC
        ADC     #1
DIS40
        CMP     T0              ;FIND LARGER OF DIF IN ROWS AND COLS
        BCS     DIS50
        LDA     T0              ;USE FIRST VALUE
DIS50
        CLC                     ;THIS IS THE DISTANCE BET. THE COMPUTER PIECE & THE HUMAN PIECE
        ADC     T1              ;ADD NEG. # TO CREDIT
        STA     T1
        PLA                     ;RESTORE INTERNAL SQUARE #
        TAX
DIS60
        DEX
        BPL     DISLP2

DIS65
        LDX     T7              ;STOP WHEN T7=0
        DEX
        BPL     DISLP1

        LDA     NUM             ;SUBTRACT CREDIT FROM NUM
        SEC
        SBC     T1
        STA     NUM
        BCS     DIS67           ;BORROW?
        DEC     NUM+1           ;YES. DECREMENT MSB
DIS67
        LDA     #0              ;CLEAR OUT T1
        STA     T1

;
;       COUNT COMPUTER PIECES ON DIAGONAL
;
        LDY     #14-1
DIAGLP
        LDX     DIAG,Y
        LDA     BOARD,X
        BEQ     DIAG20          ;EMPTY
        ROL     A
        AND     #KING*2         ;KING?
        BEQ     DIAG20          ;NO.
        BCC     DIAG10          ;YES. BRANCH IF HUMAN
        INC     T1              ;COMPUTER
        JMP     DIAG20
DIAG10
        DEC     T1              ;HUMAN
DIAG20
        DEY
        BPL     DIAGLP
DIS70


;----------------------------------


;
;       COMPUTE BACK ROW CREDIT (KING ROW PROTECTION)
;
        LDA     GAMNO
        AND     #$0E            ;GAME # = 1?
        BNE     ADS10           ;NO. SKIP
BACK25
        JMP     ADDSUM          ;SKIP THE REST IF GAME # = 1 OR $11
ADS10

        LDA     HKING           ;DOES HKING * 3 = HPIECE?
        ASL     A               ;SHIFT LEFT AND CLEAR CARRY
        ADC     HKING
        CMP     HPIECE
        BEQ     BACK10          ;YES.  => NO ORDINARY MEN TO CONVERT TO KINGS

        LDA     #0
        LDY     BOARD+31
        BPL     BACK30
        ORA     #8              ;OR IN 1 BIT FOR EACH BACK ROW SQUARE WHICH IS OCCUPIED BY A COMP PIECE
BACK30
        LDY     BOARD+32
        BPL     BACK40
        ORA     #4
BACK40
        LDY     BOARD+33
        BPL     BACK50
        ORA     #2
BACK50
        LDY     BOARD+34
        BPL     BACK60
        ORA     #1
BACK60
        TAX
        LDA     BAKTAB,X        ;ADD TABLE VALUE TO CURRENT CREDIT
        CLC
        ADC     T1
        STA     T1

BACK10
        LDA     CKING           ;DOES CKING*3 = CPIECE?
        ASL     A
        ADC     CKING
        CMP     CPIECE
        BEQ     BACK20          ;YES.  NO CHECKERS TO CONVERT TO KINGS

        LDA     #0              ;OR IN 1 BIT FOR EACH BACK ROW SQUARE WHICH IS OCCUPIED BY A HUMAN PIECE
        LDY     BOARD+3
        BEQ     BACK70
        BMI     BACK70
        ORA     #8
BACK70
        LDY     BOARD+2
        BEQ     BACK80
        BMI     BACK80
        ORA     #4
BACK80
        LDY     BOARD+1
        BEQ     BACK90
        BMI     BACK90
        ORA     #2
BACK90
        LDY     BOARD+0
        BEQ     BACK95
        BMI     BACK95
        ORA     #1
BACK95
        TAX
        LDA     T1
        SEC
        SBC     BAKTAB,X        ;SUBTRACT TABLE VALUE FROM CURRENT CREDIT
        STA     T1

BACK20


;----------------------------------


;
;       COMPUTE DOUBLE CORNER CREDIT
;
        LDA     GAMNO
        AND     #$0F
        CMP     #3              ;GAME # = 1 OR 2?
        BCC     BACK25          ;JMP ADDSUM IF GAME # TO SMALL

        LDA     #HUMKNG
        LDX     #-CORN&$FF
        LDY     HPIECE
        CPY     CPIECE
        BEQ     CORN20          ;DO IF EQUAL [todo - penciled in "NOP NOP?"]
        BCC     CORN20          ;HUMAN <= COMPUTER ==> HUMAN WANTS CORN
        LDA     #CMPKNG         ;HUMAN > COMPUTER =>COMPUTER WANTS CORN
        LDX     #CORN           ;INC ALPHA
CORN20
        STA     DEN             ;HUMAN OR COMPUTER
        STX     T0              ;-CORN OR +CORN
        LDY     #0
        LDA     BOARD+0         ;IS SQUARE OCCUPIED?
        BEQ     CORN30          ;NO. EMPTY
        EOR     DEN             ;CORRECT PLAYER AND KING?
        BNE     CORN50          ;NO. OTHER PLAYER -- TOO BAD
        INY                     ;YES. INC CORN COUNT
CORN30
        LDA     BOARD+4         ;CHECK OTHER SQUARE IN THIS CORNER
        BEQ     CORN40          ;EMPTY
        EOR     DEN
        BNE     CORN50          ;WRONG PLAYER -- TOO BAD
        INY
CORN40
        CPY     #1
        BNE     CORN50
        LDA     T1
        CLC
        ADC     T0              ;WE GET CREDIT
        STA     T1
CORN50
        LDY     #0              ;CHECK OTHER CORNER
        LDA     BOARD+30        ;IS SQUARE OCCUPIED?
        BEQ     CORN60          ;NO. EMPTY
        EOR     DEN             ;CORRECT PLAYER AND KING?
        BNE     CRN100          ;NO. TOO BAD
        INY
CORN60
        LDA     BOARD+34
        BEQ     CORN70          ;NO. EMPTY
        EOR     DEN             ;CORRECT PLAYER AND KING?
        BNE     CRN100          ;NO.
        INY
CORN70
        CPY     #1
        BNE     CRN100
        LDA     T1
        CLC
        ADC     T0
        STA     T1
CRN100

;
;       COMPUTE CENTER CREDIT
;
DOCENT
        LDA     T7
        BEQ     CENT90          ;SKIP IF END GAME
        LDA     BOARD+19        ;COUNT EACH COMPUTER PIECE IN SQUARES 19&20
        BPL     CENT50
        INC     T1
CENT50
        LDA     BOARD+20
        BPL     CENT90
        INC     T1
CENT90


;----------------------------------


;
;       COMPUTE MOVE CREDIT (ADD CREDIT IF COMPUTER HAS MOVE)
;
        LDA     GAMNO
        AND     #$0C            ;GAME # < 4?
        BEQ     ADDSUM          ;YES. SKIP
        LDA     HPIECE
        CLC
        ADC     CPIECE
        CMP     #24+1           ;TOTAL PIECE COUNT > 24?
        BCS     QMV100          ;YES. SKIP MOVE

        LDA     HPIECE          ;SUBTRACT OFF EXTRA POINT FOR EACH KING TO GET
        SEC                     ;2 TIMES PIECE COUNT FOR EACH PLAYER
        SBC     HKING
        SEC
        SBC     CPIECE          ;HPIECE-HKING-CPIECE+CKING
        CLC                     ;=HPIECE-HKING-(CPIECE-CKING)
        ADC     CKING
        BNE     QMV100          ;PIECE COUNTS ARE DIFFERENT

;
;       COUNT PIECES IN COMPUTER'S SYSTEM
;
        LDY     #16-1
        LDA     #0              ;INIT COUNT
        STA     T0
QMVLP
        LDX     SYSTEM,Y
        LDA     BOARD,X
        BEQ     QMV10
        INC     T0
QMV10
        DEY
        BPL     QMVLP

        ROR     T0              ;ODD OR EVEN?
        ROR     A
        EOR     ACTIVE          ;COMPUTER OR HUMAN ACTIVE?
        BMI     QMV100          ;HUMAN HAS MOVE -- DON'T ADD CREDIT
        INC     T1              ;HUMAN IS ACTIVE AND EVEN COUNT
QMV100


;----------------------------------


;
;       ADD SUM OF BACK, CORN, ETC. IN T1 TO PIECE COUNT RATIO IN NUM
;
ADDSUM
        LDX     DEPTH
        LDA     T1
        CLC
        ADC     NUM
        STA     ALPHAL+1,X
        LDA     #0              ;COMPUTE MSB
        LDY     T1              ;NEGATIVE?
        BPL     ADD10           ;NO. POSITIVE. USE 0
        LDA     #$FF            ;YES.  USE $FF
ADD10
        ADC     NUM+1           ;ADD WITH CARRY FROM LSB
        STA     ALPHAH+1,X      ;SHOULD NEVER GET OVERFLOW

        LDA     ACTIVE          ;HUMAN ACTIVE?
        BMI     SED20           ;NO.
        LDA     GAMNO
        CMP     #PLAY2          ;LOSING CHECKERS?
        BCC     SED25           ;NO. WINNING CHECKERS -- NEGATE ALPHA
        RTS                     ;YES. DOUBLE NEGATE => NO NEGATE.  RETURN CARRY SET
;
;       IF LOSING CHECKERS (GAMES > 2-PLAYER GAME) THEN NEGATE ALPHA -- ENTRY POINT
;
;       RETURN CARRY SET
;
SED20
        LDX     DEPTH
        LDA     GAMNO
        CMP     #PLAY2
        BCC     SED30
SED25
        SEC                     ;LOSING CHECKERS
        LDA     #0
        SBC     ALPHAL+1,X
        STA     ALPHAL+1,X
        LDA     #0
        SBC     ALPHAH+1,X
        STA     ALPHAH+1,X
SED30
        SEC                     ;RETURN CARY SET (FOR TERMNODE)
        RTS


;----------------------------------


;
;       CHGCNT -- CHANGE PIECE COUNT TO REFLECT OPPONENT'S JUMPED PIECE
;
CHGCNT
        LDY     #-2&$FF         ;DECREASE OPPONENT'S PIECE COUNT FOR JUMPED PIECE
        TAX                     ;KING?
        BPL     AJ10            ;NO.
        DEY                     ;YES. USE -3
AJ10
        LDA     ACTIVE
        EOR     #$80            ;OPPONENT
        ASL     A
        ROL     A               ;SHIFT CLEARS CARRY
        TAX
        TYA
        ADC     HPIECE,X
        STA     HPIECE,X

        CPY     #-3&$FF
        BNE     AJ15
        DEC     HKING,X         ;DECREMENT KING COUNT BECAUSE KING WAS CAPTURED
AJ15
        RTS
;
;       JMPSV2 -- SAVE MOVE IN JMPLST (COMPACTED FORMAT FOR ALPHA-BETA)
;
JMPSV2
        LDY     #0              ;YES. SAVE FIRST MOVE IN JMPLST
        LDX     DEPTH           ;1-9
        DEX
        BNE     WASJ18

        LDA     INDEX           ;DEPTH=1
        LSR     A
        ROR     A
        ROR     A
        ORA     FROMB
        STA     JMPLST
        RTS
WASJ18
        DEX                     ;DEPTH-2  (0-7)
        TXA
        PHA
        LSR     A
        LSR     A               ;0 OR 1
        TAX
        INX                     ;1 OR 2
        PLA
        AND     #3              ;0-2
        TAY

        LDA     INDEX
        STY     T0
WASJLP
        CPY     #3              ;DONE?
        BCS     WASJ90          ;YES.
        ASL     A               ;NO.  SHIFT LEFT 2 MORE BITS
        ASL     A
        INY
        BCC     WASJLP          ;JMP
WASJ90
        LDY     T0
        EOR     JMPLST,X
        AND     MSKLST,Y        ;COMBINE WITH JMPLST (C0,30,0C,03)
        EOR     JMPLST,X
        STA     JMPLST,X
        RTS
;
;       JMPSAV -- SAVE VARIABLES FOR JUMP & INC DEPTH
;
JMPSAV
        LDA     JMPSQR
        AND     #$C0            ;JUMPED PIECE
        ORA     MSTFLG
        ORA     MLTFLG
        ORA     INDEX
        EOR     PIECE
        AND     #$CF            ;COMBINE A WITH BITS 5-4 OR PIECE (KING OR CHECKER)
        EOR     PIECE

;
;       SAVE1 -- ENTRY POINT
;
SAVE1
        INC     DEPTH
        LDX     DEPTH
        STA     OTHER-2,X
        LDA     FROMB
        ORA     FRSMOV
        STA     FROMT-2,X
        RTS


;----------------------------------



;
;       KNGCK2 -- RETURN CS IF NEW KING ON SQUARE X(0-34), A=CONTENTS OF SQUARE X
;                 INC CPIECE OR HPIECE IF NEW KING
;
KNGCK2
        CMP     #CMPCHK
        BNE     TO60
        CPX     #4              ;COMPUTER CHECKER TO KING OF ON 0-3
        BCS     T080            ;NOT NEW KING
        INC     CPIECE          ;INCREMENT COMPUTER PIECE COUNT
        INC     CKING           ;INC KING COUNT
        BCC     TO70            ;JMP    NEW KING
TO60
        CMP     #HUMCHK
        BNE     TO80
        CPX     #31             ;HUMAN CHECKER TO KING IF ON 31-34
        BCC     TO80
        INC     HPIEVE          ;INCREMENT HUMAN PIECE COUNT FOR NEW KING
        INC     HKING           ;INC KING COUNT
TO70
        AND     #$80
        ORA     #KING
        SEC
        RTS
TO80
        CLC
        RTS
;
;       TOMOV -- CALL TOSET, MOVCLR
;
TOMOV
        JSR     TOSET
;
;       MOVCLR -- SET MOVE TO 8 (OFF BOARD SQUARE), SET MOVVAL TO 0
;                 RETURN Y=0
;
MOVCLR
        LDY     #8
        STY     MOVE
        LDY     #0
        STY     MOVVAL
        RTS

;                       RANDOM MOVE TABLE -- INDEXED BY PRNCNT [todo - verify indentation]
;               1/2,1/3,1/4,1/5,1/6,1/7
RANTAB  .BYTE   $80,$55,$40,$33,$2B,$25


        .BYTE   0               ;EXTRA BYTE
        .IF     PAL-1
        .BYTE   0,0,0,0,0,0,0,0 ;MORE EXTRA BYTES IF NOT PAL


        .BYTE   0,0,0,0,0,0,0


        .ENDIF

        .IF     PRNT
AD=*
        .ENDIF


;----------------------------------


;               DATA [todo - verify indentation]
        *=ROMSTR+$F00
;                               BOARD CHARACTERS (IN UPSIDE DOWN ORDER)
BRDCHR
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0                                 ;EMPTY 0*LINCHR [todo - indentation changes with long lines]





        .BYTE   $3C,$3C,$7E,$7E,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$8E,$8E,$3C,$3C ;CHECKER 1





        .BYTE   $3C,$3C,$7E,$7E,$C3,$C3,$C3,$C3,$A5,$A5,$A5,$E7,$7E,$7E,$3C,$3C ;KING 2





        .BYTE   0,0,0,$C6,$C6,$6C,$6C,$38,$38,$6C,$6C,$C6,$C6,0         ;CURSOR 3




HTAB    .BYTE   0,0                     ;CHANGES FOR HPIECE (BASED ON NXTAB). 0,0 IS PART OF CURSOR
CTAB    .BYTE   -3,1,2                  ;PART OF HTAB
HKTAB   .BYTE   0,0                     ;CHANGES FOR HKING (KING COUNT). 0,0 IS PART OF CTAB
CKTAB   .BYTE   -1,1,0,0,0              ;CHANGES FOR CKING. -1,1,0 IS PART OF HKTAB

MSKLST  .BYTE   $C0,$30,$0C,$03         ;MASKS FOR DIFFERENT 2 BIT COMBOS -- USED IN JMPSV2

;                                       NEXT CURSOR VALUES FOR SETUP
NXTAB   .BYTE   CMPKNG,CMPCHK,HUMKNG,HUMCHK     ;EMPTY

;       BAKTAB -- LIST OF BACK ROW CREDITS
;       0=>     NO PIECE IN BACK ROW
;       1=>     1 PIECE IN BACK ROW (OR 31 AND 32)
;       2=>     2 PIECES IN BACK ROW (NOT 34)
;       3=>     ANY 2 AS LONG AS 34
;       4=>     ALL BUT 34
;       5=>     ALL BUT 32
;       6=>     32 AND 34 (AND MAYBE OTHERS)
;
;       FIRST 0 IS PART OF NXTAB
;       SELECT BY DETERMINING 32,32,33,34 OR 3,2,1,0


;----------------------------------


BAKTAB  .BYTE   0*2,1*2,1*2,3*2,1*2,6*2,2*2,6*2,1*2,3*2,4*2,5*2,1*2,6*2,4*2,6*2





JOYTAB  .BYTE   5,9,6,$A                ;JOYSTICK READINGS FOR DIAGONAL MOVEMENT.

;               MOVTAB & MVTAB2 GO TOGETHER -- DO NOT SEPARATE!!!
;       HUMAN CHECKER CAN'T DO 0,1; COMPUTER CHECKER CAN'T DO 2,3.
;
MOVTAB  .BYTE   RB,LB,RF,LF             ;OFFSETS FOR DIAGONAL MOVEMENT (RELATED TO JOYTAB) [todo - "VV" in left margin]

MVTAB2  .BYTE   2*RB,2*LB,2*RF,2*LF     ;OFFSETS FOR JUMPS

;       LIST OF FIRST MOVES
FRSTAB  .BYTE   $40+25,$00+25,$40+24,$00+24,$40+23,$40+22,$40+23        ;USE 23 FROM SYSTEM


;       COMPUTER'S MOVE SYSTEM (INTERNAL NUMBERING)
SYSTEM  .BYTE   23,6,7,13,16,22,31,32,33        ;23 IS PART OF FRSTAB


;       SQUARES ON DIAGONAL BETWEEN DOUBLE CORNERS
DIAG    .BYTE   4,5,14,15,24,25,34                      ;PART OF SYSTEM ALSO


        .BYTE   0,9,10,19,20,29,30                      ;REST OF DIAG


;       "SCORE" TABLE -- CHARACTERS 0-9, BLANK, JP
;       MUST NOT CROSS PAGE BOUNDARY -- THIS INCLUDES BOTH LISTING PAGE & RAM PAGE [todo - verify in code]
SCRTBL
        .BYTE   $0E,$0A,$0A,$0A,$0E     ;0    HIGH ORDER 0 IS DISPLAYED AS BLANK

        .BYTE   $EE,$44,$44,$CC,$44     ;1

        .BYTE   $EE,$88,$EE,$22,$EE     ;2

        .BYTE   $EE,$22,$66,$22,$EE     ;3

        .BYTE   $22,$22,$EE,$AA,$AA     ;4

        .BYTE   $EE,$22,$EE,$88,$EE     ;5

        .BYTE   $EE,$AA,$EE,$88,$EE     ;6

        .BYTE   $22,$22,$22,$22,$EE     ;7

        .BYTE   $EE,$AA,$EE,$AA,$EE     ;8

        .BYTE   $EE,$22,$EE,$AA,$EE     ;9

        .BYTE   0,0,0,0,0               ;AA     BLANK [todo - verify spacing]

        .BYTE   $E4,$A4,$27,$25,$27     ;BB     JP



;----------------------------------


ADDTAB  .BYTE   -ADDTRM,$FF,ADDTRM      ;TERMS TO ADD IN TERMNODE IF FULL & PENDING JMP
;               USE 0 FROM COLTB FOR END OF ADDTAB [todo - check indentation]
COLTB   .BYTE   EDARK,ELIGHT,ELIAT,HDARK,HLIGHT,HLIAT           ;COLORS FOR DIFFERENT SQUARES & EASY OR HARD [todo - maybe truncated]



;----------------------------------


;
;       TOSUB -- SUBROUTINE TO DO JUNK FOR TO CODE
;
TOSUB
        LDX     MOVE            ;MOVE TO NEW SQUARE FOR MOVCHK
        LDA     PIECE
        JSR     KNGCHK          ;NEW KING?
        STA     PIECE
        STA     BOARD,X
        STA     MOVVAL
        RTS
;
;       KNGCHK -- SAME AS KNGCK2 EXCEPT USES Y TO SET MSTJMP TO 0 IF NEW KING
;
KNGCHK
        JSR     KNGCK2
        BCC     TO81
        LDY     #0
        STY     MSTJMP
TO81
        RTS
;
;       SOUND0-SOUND3 -- SET UP SOUND REGISTERS
;
SOUND0
        LDA     #DROP           ;AUDF0
SOUND1
        LDY     #PURE           ;AUDC0
SOUND2
        LDX     #$0F            ;AUDV0 -- MAX VOL
SOUND3
        STA     AUDF0
        STX     AUDV0
        STX     AUDC0
        RTS

        .BYTE   0,0             ;EXTRA BYTES

        .BYTE   0,0,0,0         ;MORE EXTRA BYTES



        *=ROMSTR+$FFFC
        .WORD   PSTART          ;START VECTOR
        .BYTE   0,0             ;EXTRA BYTES


;----------------------------------


;
;       THE FOLLOWING CODE IS FOR DEBUGGING ONLY.
;       IT IS NOT TO BE INCLUDED IN THE FINAL CARTRIDGE.
;       THESE SUBROUTINES USE THE KIM MONITOR ROUTINES TO PRINT VARIOUS
;       INFORMATION ON THE TI TERMINAL CONNECTED TO THE DEVELOPMENT SYSTEM.
;
        .IF     PRNT
        *=AD

        *=*-1/256+1/256
;
;       PRMOVE -- PRINT FROMB-TOSQRB
;
PRMOVE
        LDX     PRFLG           ;PRINT FLAG SET?
        BEQ     PRRTN           ;NO. DON'T PRINT
        DEC     PRCNT           ;PRINT 10 MOVES TO THE LINE
        BPL     PRMV10
        JSR     CRLF
        LDA     #10-1
        STA     PRCNT
PRMV10
        LDX     FROMB           ;YES.
        JSR     IEDSP           ;PRINT FROM SQUARE #
        JSR     PRTBYT
;
;       PRTO -- PRINT TO SQUARE
;
PRTO
        LDA     PRFLG           ;PRINT FLAG SET?
        BEQ     PRRTN           ;NO. DON'T PRINT
        LDA     #'-             ;YES. PRINT '-'
        JSR     OUTCH
        LDX     TOSQRB          ;PRINT TO
        TXA
        BMI     PROT1           ;SKIP IF TO = BLANK (AA) OR JP (BB)
        JSR     IEDSP           ;CONVERT FROM INTERNAL TO EXTERNAL NUMBERING
PROT1
        JSR     PRTBYT
        JMP     OUTSP

PRRTN
        RTS
;
;       PRBRD -- PRINT ENTIRE BOARD & OTHER INFO
;
PRBRD
        LDA     PRFLG           ;PRINT FLAG SET?
        BEQ     PRRTN           ;NO. DON'T PRINT
        LDA     #0              ;YES. TURN OFF SOUND, IF ANY
        STA     AUDV0
        JSR     CRLF            ;YES. PRINT CR

        LDA     #GAMMSG         ;PRINT "GAME NUMBER ="
        JSR     OUTAL3
        LDA     GAMNO
        JSR     PRTBYT
        JSR     CRLF

        LDA     #BLKMSG         ;"COMPUTER IS DARK"
        LDX     COLCMP
        CPX     #DARK
        BEQ     AXB
        LDA     #WHMSG          ;"COMPUTER IS WHITE"
AXB
        JSR     OUTMSG          ;PRINT MSG WITH CR
        LDX     #B112           ;"DARK STARTS ON 1-12" (IF COLOR)
        LDA     OLDPBQ
        AND     #8
        BNE     AXC             ;COLOR
        LDX     #W112           ;B/W "WHITE STARTS ON 1-12"
AXC
        TXA
        JSR     OUTMSG          ;PRINT MSG WITH CR
        LDA     #TOPLFT         ;"TOP LEFT SQUARE IS"

        JSR     OUTMS2          ;PRINT MSG WTIHOUT CR
        LDX     #34
        JSR     IEDSP           ;COMPUTE TOP LEFT SQUARE # IN EXTERNAL FORM
        JSR     PRTBYT

        JSR     CRLF            ;PRINT BOARD
        LDX     #34
        JSR     PR2ROW
        JSR     PR2ROW
        JSR     PR2ROW
        JSR     PR2ROW
PRBD70
        JMP     CRLF

;
;       PR2ROW -- PRINT 2 ROWS AND DECREMENT X
;
PR2ROW
        JSR     BL2             ;2 BLANK SPACES
        JSR     PRROW
        JSR     PRROW
        DEX
        RTS
;
;       BL2 -- PRINT TWO SPACES
;
BL2
        TXA
        PHA
        JSR     OUTSP
        JSR     OUTSP
        PLA
        TAX
        RTS
;
;       PRROW -- PRINT ONE ROW (4 PIECES) & CR
;
PRROW   JSR     PRPIEC
        JSR     BL2
        JSR     PRPIEC
        JSR     BL2
        JSR     PRPIEC
        JSR     BL2
        JSR     PRPIEC
        TXA
        PHA
        JSR     CRLF
        PLA
        TAX
        RTS
;
;       PRPIEC -- PRINT ONE PIECE (OR -- IF EMPTY)
;
PRPIEC  TXA
        PHA
        LDA     BOARD,X
        BNE     PRP10
        LDA     #'-             ;EMPTY
        JSR     OUTCH
        LDA     #'-
        JSR     OUTCH
        JMP     PRP40
PRP10
        PHA                     ;NOT EMPTY
        LDX     #'
        TAY
        BMI     PRP20           ;COMPUTER -- PRINT SPACE
        LDX     #'H             ;HUMAN -- PRINT "H"
PRP20
        TXA
        JSR     OUTCH
        LDX     #'1
        PLA
        AND     #$7F
        CMP     #KING           ;CHECKER = 1
        BNE     PRP30           ;KING = 2
        INX
PRP30
        TXA
        JSR     OUTCH
PRP40
        PLA
        TAX
        DEX
        RTS
;
;       OUTMS2 -- PRINT STRING AT MESSAG/256*256+A ON TI WITH NO CR
;
OUTMS2
        LDY     PRFLG           ;PRINT FLAG SET?
        BEQ     PRRTN2          ;NO. DON'T PRINT
        TAX
        LDA     T0              ;SAVE T0,T0+1
        PHA
        LDA     T0+1
        PHA
        STX     T0              ;MESSAGE ADR LSB
        LDA     #MESSAG/256     ;MESSAGE ADR MSB
        STA     T0+1
        JSR     OUTM3
        TAX
        PLA                     ;RESTORE T0,T0+1
        STA     T0+1
        PLA
        STA     T0
        TXA
PRRTN2
        RTS
;
;       OUTMSG -- SAME AS OUTMS2 EXCEPT DO CR
;
OUTMSG
        LDY     PRFLG
        BEQ     PRRTN2
        JSR     OUTMS2
        JMP     CRLF
;
;       PRMB -- INPUT:  Y=LSB OF ADDR OF MESSAGE TO BE PRINTED
;                       X=ADDR OF RAM PAGE ZERO VAR TO BE PRINTED
;               OUTPUT: X RESTORED, A,Y MODIFIED
;
PRMB
        TXA
        PHA
        TYA
        JSR     OUTMS2
        PLA
        PHA
        JSR     PRTBYT
        JSR     OUTSP
        PLA
        TAX
        RTS
;
;       BLECCH -- CALL OUTALP, THEN PRALL
;
BLECCH
        LDY     DEPTH
        CPY     PRDEP
        BCS     PRRTN2
        JSR     OUTALP
;
;       PRALL -- PRINT A BUNCH OF JUNK FOR ALPHA-BETA PRUNING DEBUG
;
PRALL
        JSR     PRMOVE
        LDX     DEPTH
        LDY     #QDEPTH
        JSR     PRMB
        LDX     ACTIVE
        LDY     #QACTIVE
        JSR     PRMB
        JSR     OUTSP

        LDX     DEPTH
        LDA     ALPHAH-1,X
        JSR     PRTBYT
        LDX     DEPTH
        LDA     ALPHAL-1,X
        JSR     PRTBYT
        JSR     OUTSP

        LDX     DEPTH
        LDA     ALPHAH,X
        JSR     PRTBYT
        LDX     DEPTH
        LDA     ALPHAL,X
        JSR     PRTBYT
        JSR     OUTSP

        LDX     DEPTH
        LDA     ALPAH+1,X
        JSR     PRTBYT
        LDX     DEPTH
        LDA     ALPHAL+1,X
        JSR     PRTBYT
        JSR     OUTSP

        JSR     CRLF
        LDA     PRDEP
        CMP     #4
        BCC     PRA20
        LDX     DEPTH
        CPX     #2
        BEQ     PRA10
        CPX     #1
        BNE     PRA20
        JSR     CRLF            ;2 SPACES IF LEVEL 1
PRA10
        JSR     CRLF            ;1 SPACE IF LEVEL 2
PRA20
        RTS
;
;       OUTAL3 -- OUTPUT MSG A WITHOUT CR
;
OUTAL3
        LDY     #MJ/256
        STA     T0
        STY     T0+1
;
;       OUTM3 -- MESSAGE PRINTING LOOP
;
OUTM3
        LDY     #0
        TYA
        PHA
OUTM10
        LDA     (T0),Y
        BEQ     OUTM20          ;END OF MESSAGE IS INDICATED BY A 0 BYTE
        JSR     OUTCH
        PLA
        TAY
        INY
        TYA
        PHA
        BNE     OUTM10          ;JMP
OUTM20
        PLA
        RTS
;
;       OUTALP -- OUTPUT MESSAGE A WITH CR
;
OUTALP
        JSR     OUTAL3
        JMP     CRLF
;
;       PASK -- INPUT NEW PRFLG AND PRDEP FROM TI
;
PASK
        LDA     #1
        STA     PRFLG
        JSR     CRLF
        LDA     #PRMSG
        JSR     OUTMS2
        JSR     GETBYT
        PHA
        JSR     CRLF
        LDA     #PRDMSG
        JSR     OUTMS2
        JSR     GETBYT
        STA     PRDEP
        PLA
        STA     PRFLG
        JMP     CRLF
;
;       PRMOV2 -- SIMILAR TO PRMOVE
;
PRMOV2
        LDA     CURSOR
        STA     FROMB
        LDA     PRFLG
        AND     #$FE            ;DO CR'S IF PRINTING ALPHA-BETA JUNK
        BEQ     JOY800
        JSR     CRLF
        JSR     CRLF
        JSR     PRMOVE
        JSR     CRLF
        JSR     CRLF
        LDX     MOVE
        RTS
JOY800
        JSR     PRMOVE
        LDX     MOVE
        RTS
        .PAGE

        *=*-1/256+1*256         ;GO ON TO NEXT PAGE BOUNDARY
MESSAG
PRMSG   .BYTE "ENTER PRFLG?",0
PRDMSG  .BYTE "ENTER PRDEP?",0
GAMOVR  .BYTE "GAME OVER",0
BLKMSG  .BYTE "COMPUTER IS DARK",0
WHMSG   .BYTE "COMPUTER IS WHITE",0
B112    .BYTE "DARK STARTS ON 1-12",0
W112    .BYTE "WHITE STARTS ON 1-12",0
TOPLFT  .BYTE "TOP LEFT SQUARE IS ",0
        .PAGE
JLERR   .BYTE "JOYLP ERROR",0
QDEPTH  .BYTE "DEPTH=",0
QINDEX  .BYTE "INDEX=",0
QALPHA  .BYTE "ALPHA(DEPTH)=",0
QBETA   .BYTE "ALPHA(DEPTH-1)=",0
QALP1   .BYTE "ALPHA(DEPTH+1)=",0
QHPIECE .BYTE "HPIECE=",0
QCPIECE .BYTE "CPIECE=",0
QACTIVE .BYTE "ACTIVE=",0
        .PAGE

        *=*-1/256+1*256
MJ      .BYTE "MULTIPLE JUMP ",0
MJBA    .BYTE "FRSMOV & BETTER ALPHA",0
WA      .BYTE "WORSE ALPHA",0
PRUNE   .BYTE "PRUNE",0
BANFM   .BYTE "BETTER ALPHA NOT FRSMOV",0
        .PAGE
GAMMSG  .BYTE "GAME NUMBER=",0
RAN     .BYTE "RANDOM ",0



        *=*-1/256+1/256
;
;       PRINTING VARS FOR DEBUG
;
PRCNT
        *=*+1                   ;COUNT OF NUMBER OF MOVES PRINTED ON A LINE
PRFLG
        *=*+1                   ;PRINTING FLAG
PRDEP
        *=*+1                   ;MAX DEPTH TO BE PRINTED+1
        .ENDIF
        .END


;----------------------------------



