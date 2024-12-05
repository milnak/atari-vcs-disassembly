;
; Video Chess (Atari VCS/2600)
; Disassembled and commented by Oscar Toledo G. (nanochess)
; Full article at https://nanochess.org/video_chess.html
; This source code is purely for educational purposes.
; All trademarks are of their respective owners.
;
; Jun/11/2023.
; Jun/12/2023.
; Jun/13/2023.
; Jun/14/2023.
;
; Disassembly of ~/Documents/atari/video_chess.zip/Video Chess.bin
; Disassembled Tue May 16 22:47:19 2023
; Using Stella 6.4
;
; ROM properties name : Video Chess (1979) (Atari)
; ROM properties MD5  : f0b7db930ca0e548c41a97160b9f6275
; Bankswitch type     : 4K* (4K) 
;
; Legend: *  = CODE not yet run (tentative code)
;         D  = DATA directive (referenced in some way)
;         G  = GFX directive, shown as '#' (stored in player, missile, ball)
;         P  = PGFX directive, shown as '*' (stored in playfield)
;         C  = COL directive, shown as color constants (stored in player color)
;         CP = PCOL directive, shown as color constants (stored in playfield color)
;         CB = BCOL directive, shown as color constants (stored in background color)
;         A  = AUD directive (stored in audio registers)
;         i  = indexed accessed only
;         c  = used by code executed in RAM
;         s  = used by stack
;         !  = page crossed, 1 cycle penalty

    processor 6502


;-----------------------------------------------------------
;      Color constants
;-----------------------------------------------------------

BLACK            = $00
YELLOW           = $10
BROWN            = $20
ORANGE           = $30
RED              = $40
MAUVE            = $50
VIOLET           = $60
PURPLE           = $70
BLUE             = $80
BLUE_CYAN        = $90
CYAN             = $a0
CYAN_GREEN       = $b0
GREEN            = $c0
GREEN_YELLOW     = $d0
GREEN_BEIGE      = $e0
BEIGE            = $f0


;-----------------------------------------------------------
;      TIA and IO constants accessed
;-----------------------------------------------------------

;CXM0P          = $00  ; (Ri)
;CXM1P          = $01  ; (Ri)
;CXP0FB         = $02  ; (Ri)
;CXP1FB         = $03  ; (Ri)
;CXM0FB         = $04  ; (Ri)
;CXM1FB         = $05  ; (Ri)
;CXBLPF         = $06  ; (Ri)
;CXPPMM         = $07  ; (Ri)
;INPT0          = $08  ; (Ri)
;INPT1          = $09  ; (Ri)
;INPT2          = $0a  ; (Ri)
INPT4           = $0c  ; (R)
$1f             = $0f  ; (R)

VSYNC           = $00  ; (W)
VBLANK          = $01  ; (W)
WSYNC           = $02  ; (W)
NUSIZ0          = $04  ; (W)
NUSIZ1          = $05  ; (W)
COLUP0          = $06  ; (W)
COLUP1          = $07  ; (W)
;COLUPF         = $08  ; (Wi)
COLUBK          = $09  ; (W)
CTRLPF          = $0a  ; (W)
PF2             = $0f  ; (W)
RESP0           = $10  ; (W)
RESP1           = $11  ; (W)
RESM0           = $12  ; (W)
RESBL           = $14  ; (W)
AUDC0           = $15  ; (W)
AUDF0           = $17  ; (W)
AUDV0           = $19  ; (W)
GRP0            = $1b  ; (W)
GRP1            = $1c  ; (W)
ENAM0           = $1d  ; (W)
ENABL           = $1f  ; (W)
HMP0            = $20  ; (W)
HMP1            = $21  ; (W)
HMM0            = $22  ; (W)
HMBL            = $24  ; (W)
VDELP0          = $25  ; (W)
HMOVE           = $2a  ; (W)
HMCLR           = $2b  ; (W)

SWCHA           = $0280
SWCHB           = $0282
INTIM           = $0284
TIM64T          = $0296


;-----------------------------------------------------------
;      RIOT RAM (zero-page) labels
;-----------------------------------------------------------

ram_80          = $80
ram_81          = $81
ram_82          = $82
ram_83          = $83
ram_84          = $84
ram_85          = $85
ram_86          = $86
ram_87          = $87
ram_88          = $88
ram_89          = $89
ram_8A          = $8a
ram_8B          = $8b
ram_8C          = $8c
ram_8D          = $8d
;                 $8e  (i)
;                 $8f  (i)
ram_90          = $90
;                 $91  (i)
;                 $92  (i)
;                 $93  (i)
;                 $94  (i)
;                 $95  (i)
;                 $96  (i)
;                 $97  (i)
ram_98          = $98
;                 $99  (i)
ram_9A          = $9a
;                 $9b  (i)
ram_9C          = $9c
;                 $9d  (i)
;                 $9e  (i)
;                 $9f  (i)
ram_A0          = $a0
;                 $a1  (i)
;                 $a2  (i)
;                 $a3  (i)
;                 $a4  (i)
;                 $a5  (i)
ram_A6          = $a6
ram_A7          = $a7
ram_A8          = $a8
;                 $a9  (i)
;                 $aa  (i)
;                 $ab  (i)
;                 $ac  (i)
;                 $ad  (i)
;                 $ae  (i)
;                 $af  (i)
ram_B0          = $b0
;                 $b1  (i)
;                 $b2  (i)
;                 $b3  (i)
ram_B4          = $b4
;                 $b5  (i)
;                 $b6  (i)
ram_B7          = $b7
ram_B8          = $b8
ram_B9          = $b9
;                 $ba  (i)
;                 $bb  (i)
;                 $bc  (i)
;                 $bd  (i)
;                 $be  (i)
ram_BF          = $bf
ram_C0          = $c0
ram_C1          = $c1
ram_C2          = $c2
;                 $c3  (i)
ram_C4          = $c4
;                 $c5  (i)
ram_C6          = $c6
;                 $c7  (i)
ram_C8          = $c8
;                 $c9  (i)
ram_CA          = $ca		; White pieces material.
ram_CB          = $cb
ram_CC          = $cc		; Black pieces material.
ram_CD          = $cd
ram_CE          = $ce
ram_CF          = $cf
ram_D0          = $d0
ram_D1          = $d1
ram_D2          = $d2
ram_D3          = $d3
ram_D4          = $d4
ram_D5          = $d5
ram_D6          = $d6
ram_D7          = $d7
ram_D8          = $d8
ram_D9          = $d9
ram_DA          = $da
ram_DB          = $db
ram_DC          = $dc
ram_DD          = $dd
ram_DE          = $de
ram_DF          = $df
ram_E0          = $e0
ram_E1          = $e1
ram_E2          = $e2
ram_E3          = $e3
ram_E4          = $e4
ram_E5          = $e5
ram_E6          = $e6
ram_E7          = $e7
ram_E8          = $e8
ram_E9          = $e9
ram_EA          = $ea
ram_EB          = $eb
ram_EC          = $ec
ram_ED          = $ed
ram_EE          = $ee
ram_EF          = $ef
ram_F0          = $f0
ram_F1          = $f1
ram_F2          = $f2
ram_F3          = $f3
ram_F4          = $f4
ram_F5          = $f5
ram_F6          = $f6
ram_F7          = $f7
ram_F8          = $f8; (s)
ram_F9          = $f9; (s)
ram_FA          = $fa; (s)
ram_FB          = $fb; (s)
ram_FC          = $fc; (s)
ram_FD          = $fd; (s)
ram_FE          = $fe; (s)
ram_FF          = $ff; (s)


;***********************************************************
;      Bank 0
;***********************************************************

    SEG     CODE
    ORG     $f000

	;
	; Setup and erase RAM memory
	;
Lf000
    sei                             ; Disable interrupts.
    cld                             ; Clear decimal mode. 
    ldx     #$ff                    ; x = $ff        
    txs                             ; Setup stack pointer.        
    inx                             ; x = $00
    txa                             ; a = $00
Lf007
    sta     $00,x                   ; Write $00 to memory.        
    inx                             ; Increase counter.
    bne     Lf007                   ; Loop.
      
    jsr     Lf2ad                   ; Force game reset (a = $00)

	;
	; Start a new frame.
	;
Lf00f
    lda     #$ff                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     VSYNC                   ;3        
    sta     VBLANK                  ;3        
    inc     ram_D3                  ; Frame counter (low-byte)        
    bne     Lf021                   ; Is it zero? No, jump.      
    inc     ram_F1                  ; Frame counter (high-byte)        
    bne     Lf021                   ; Is it zero? No, jump.      
    sta     ram_F0                  ;3
Lf021
    eor     ram_F0                  ;3        
    ora     #$f7                    ;2        
    sta     ram_E9                  ;3        
    lda     SWCHB                   ; Read switches.        
    and     #$08                    ; Extract B/W switch.
    lsr                             ; $08 -> $04        
    tay                             ; y = $00 = B/W. $04 = Color.        
    ldx     #$04                    ; Count four colors.
Lf030
    lda     ram_F1                  ; Screensaver using high-byte of frame counter.        
    and     ram_F0                  ;3        
    eor     Lff6e,y                 ; Read color table.        
    and     ram_E9                  ;3        
    sta     ram_DD,x                ;4        
    sta     NUSIZ1,x                ; COLUBK/COLUPF/COLUP1/COLUP0 in order.        
    iny                             ; Next color.        
    dex                             ; Decrement counter.        
    bne     Lf030                   ; Jump if still not zero.
      
    stx     COLUP0                  ; Player 0 as black.        
    ldy     SWCHB                   ;4        
    sty     ram_ED                  ;3        
    bpl     Lf050                   ; Jump if player 2 difficulty is B.
      				; Switch side colors.
				; A already with content of ram_DE
    ldy     ram_DF                  ; Load ram_DF into Y
    sta     ram_DF                  ; Save reversed (a into ram_DF)
    sty     ram_DE                  ; (y into ram_DE)
Lf050
    ldy     #$24                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    stx     VSYNC                   ;3        
    sty     TIM64T                  ;4        
    jsr     Lf2aa                   ; Check for Reset/Select buttons.     
    lda     ram_D3                  ; Frame counter (low-byte)        
    and     #$0c                    ;         
    cmp     #$04                    ; Carry flag reset for 4 frames each 16 frames.
    jsr     Lf53c                   ;       
  
    ldx     ram_D9                  ; Previous movement source square.        
    bcc     Lf075                   ; Jump       
    ldy     ram_F3                  ; Is cursor moved yet?        
    bmi     Lf075                   ; No, show the X figure.      
    ldy     ram_DB                  ; Get original content of source square.        
    bne     Lf079                   ; Jump if it is a piece.      
    ldy     ram_F3                  ; Is cursor moved yet?        
    bne     Lf079                   ; 
Lf075
    lda     #$08                    ; The X figure.        
    bne     Lf07b                   ;
Lf079
    lda     ram_DB                  ; Previous movement original content of source square.
Lf07b
    jsr     Lfe64                   ; Update chessboard square.       
 
    ldx     ram_DA                  ; Previous movement target square.        
    lda     ram_80,x                ; Read content.        
    and     #$f0                    ; Erase chesspiece.        
    ldy     ram_E7                  ;3        
    bmi     Lf094                   ;2/3      
    ldy     ram_F3                  ; Get state of cursor.        
    beq     Lf09a                   ; If moving, don't change anything.      
    bpl     Lf090                   ; Jump if piece selected.     
    bcs     Lf098                   ; Jump if piece moved.
Lf090
    bcc     Lf096                   ;2/3      
    ora     ram_DC                  ; Show content of target square.
Lf094				; Notice next jump is unconditional because carry flag.
    bcs     Lf098                   ; Only briefly.
Lf096
    ora     ram_DB                  ; Show piece to be moved.
Lf098
    sta     ram_80,x                ; Update previous target square.
Lf09a
    lda     ram_E7                  ;3        
    beq     Lf0a8                   ;2/3      
    bmi     Lf0a8                   ;2/3      
    ora     ram_E6                  ;3         *
    bpl     Lf0a8                   ;2/3       *
    lda     #$00                    ;2         *
    sta     ram_E7                  ;3   =  17 *
Lf0a8
    tay                             ;2        
    beq     Lf0c8                   ;2/3      
    ldx     ram_F7                  ;3        
    bmi     Lf0bd                   ;2/3      
    lda     ram_F6                  ;3        
    beq     Lf0bd                   ;2/3      
    lda     #$0f                    ;2         *
    bcs     Lf0ba                   ;2/3       *
    lda     #$09                    ;2         *
    tay                             ;2   =  22 *
Lf0ba
    jsr     Lfe64                   ; Update chessboard square.        
Lf0bd
    lda     ram_EE                  ;3        
    rol                             ;2        
    cmp     #$04                    ;2        
    bcs     Lf0c8                   ;2/3      
    tax                             ;2         *
    ldy     Lfee9,x                 ;4   =  15 *
Lf0c8
    sty     AUDC0                   ;3   =   3
Lf0ca
    lda     INTIM                   ;4        
    bne     Lf0ca                   ;2/3      
    sta     WSYNC                   ;3   =   9
;---------------------------------------
    dec     ram_D0                  ; Current depth is >= 1?        
    bpl     Lf0d9                   ; Yes, jump (Atari playing leaves screen blank)
    inc     ram_D0                  ; Restore depth to 0.        
    sta     VBLANK                  ; Enable video.
Lf0d9
    ldx     #$0f                    ;2        
    stx     AUDV0                   ;3        
    stx     AUDF0                   ;3    

	;
	; Setup 8 words to point to graphics for 8 chess pieces.
	; High-byte is contained in register Y ($ff)
	; Low-byte is contained in register A ($00)
	; It forms the address Lff00.
	;    
    ldy     #$ff                    ;2   =  10
Lf0e1
    sty     ram_C0,x                ;4 y = $ff        
    dex                             ;2        
    sta     ram_C0,x                ;4 a = $00        
    dex                             ;2        
    bpl     Lf0e1                   ;2/3      
    ldy     #$1f                    ;2        
    jsr     Lf545                   ; Set timer and reverse board.       
    sta     HMCLR                   ;3        
    lda     ram_EA                  ;3   =  28
Lf0f2
    ldx     INTIM                   ;4        
    bne     Lf0f2                   ;2/3      
    stx     ram_EB                  ; Chessboard square counter.        
    sta     WSYNC                   ;3   =  12
;---------------------------------------
    sta     RESM0                   ;3        
    ldy     #$66                    ;2        
    sty     ram_E8                  ;3        
    asl                             ;2        
    asl                             ;2        
    adc     ram_EA                  ;3        
    adc     #$46                    ;2        
    sta     ram_CA                  ;3        
    ldy     #$04                    ;2        
    ldx     #$20                    ;2        
    stx     HMM0                    ;3        
    ldx     #$02                    ;2        
    stx     NUSIZ1                  ;3        
    sta     RESBL                   ;3        
    sta     RESP0                   ;3        
    lda     #$d0                    ;2        
    sta     RESP1                   ;3        
    sta     HMBL                    ;3        
    lda     #$f1                    ;2        
    sta     HMP1                    ;3        
    sta     VDELP0                  ;3        
    sta     WSYNC                   ;3   =  57
;---------------------------------------
    sta     HMOVE                   ;3        
    sta     ENAM0                   ;3        
    sta     CTRLPF                  ;3 Right side of playfield is reflected.        
    stx     NUSIZ0                  ;3        
    lda     #$38                    ;2        
    sta     ram_C0                  ;3        
    ldx     ram_EE                  ;3        
    lda     ram_DE,x                ;4        
    sta     ram_F8                  ;3        
    lda     ram_DF                  ;3        
    sta     ram_FD                  ;3        
    jmp     Lf1cf                   ;3   =  36
    
	;
	; Do special movement.
	;
Lf13e
    lda     ram_D6                  ; Get current piece.        
    ldx     ram_D5                  ; Get target square.        
    and     #$07                    ; Extract only piece (no side).        
    cmp     #$06                    ; Is it a pawn?        
    bne     Lf163                   ; No, jump.
    lda     ram_E5                  ; Get en passant state.        
    eor     #$10                    ; $08 -> $18       
    tay                             ;2        
    eor     #$08                    ; $18 -> $10        
    cmp     ram_D5                  ; Player tries en passant?        
    beq     Lf17f                   ; Yes, jump.
    cpx     #$08                    ; Promotion in 8th rank?        
    bcc     Lf15b                   ; Yes, jump.      
    cpx     #$38                    ; Promotion in 1st rank?        
    bcc     Lf182                   ; No, jump.
Lf15b
    lda     ram_D6                  ;
    eor     #$04                    ; Make piece a queen.
    sta     ram_D6                  ;
    bcs     Lf182                   ; Jump.
Lf163
    cmp     #$01                    ; Is it a king?        
    bne     Lf182                   ; No, jump.      
    lda     ram_D4                  ; Get source square.
    and     #$38                    ; Preserve only rank (to get rook at left)
    tay                             ;
    txa                             ; Get target square.
    sbc     ram_D4                  ; Subtract origin square.
    cmp     #$fe                    ; Moving two squares left?
    bne     Lf176                   ; No, jump.
    inx                             ; Intermediate square of king.
    bcs     Lf17f                   ;
Lf176
    cmp     #$02                    ; Moving two squares right?
    bne     Lf182                   ; No, jump.
    dex                             ; Intermediate square of king.
    tya                             ;
    ora     #$07                    ; Get rook at right.
    tay                             ;
Lf17f
    jsr     Lfd37                   ; Move piece from y to x (castle rook).
Lf182
    rts                             ; Return.
    
Lf183
    sec                             ;2   =   2 
Lf184
    sta     ram_C0,x                ;4 Setup offset for graphics.        
    lda     ram_DE                  ;3 Color for black pieces.       
    bcs     Lf1a9                   ;2/3 =   9
Lf18a
    sta     ram_C0,x                ;4 Setup offset for graphics.       
    lda     ram_DE                  ;3 Color for black pieces.        
    bcc     Lf1c1                   ;2/3      
    pha                             ;3        
    dex                             ;2        
    bmi     Lf1c5                   ;2/3 =  16
Lf194
    dex                             ;2 x = x - 1       
    lda.wy  ram_80,y                ;4 Read chessboard square.       
    iny                             ;2 Next square.       
    asl                             ;2 x2       
    asl                             ;2 x4       
    asl                             ;2 x8       
    cmp     #$40                    ;2 Is it a white piece?       
    bcc     Lf183                   ;2/3 No, jump.     
    beq     Lf184                   ;2/3      
    and     #$38                    ;2        
    nop                             ;2        
    sta     ram_C0,x                ;4 Setup offset for graphics.        
    lda     ram_DF                  ;3   =  31 Color for white pieces.
Lf1a9
    pha                             ;3        
    dex                             ;2        
    dex                             ;2        
    lda.wy  ram_80,y                ;4 Read chessboard square.       
    iny                             ;2        
    sta     HMOVE                   ;3        
    asl                             ;2 x2       
    asl                             ;2 x4       
    asl                             ;2 x8       
    cmp     #$40                    ;2 Is it a white piece?       
    bcc     Lf18a                   ;2/3 No, jump.     
    beq     Lf18a                   ;2/3      
    and     #$38                    ;2        
    sta     ram_C0,x                ;4        
    lda     ram_DF                  ;3   =  37 Color for white pieces.
Lf1c1
    pha                             ;3        
    dex                             ;2        
    bpl     Lf194                   ;2/3 =   7
Lf1c5
    sty     ram_EB                  ; Update pixel row counter.      
    txs                             ;2        
    ldy     #$05                    ;2 Counter for six lines.        
    lda     (ram_CC),y              ;5        
    lsr                             ;2        
    sta     GRP0                    ;3   =  17
Lf1cf
    lda     ram_FE                  ;3        
    sta     COLUP0                  ;3        
    sta     HMCLR                   ;3        
    sta     WSYNC                   ;3   =  12
;---------------------------------------
    sta     HMOVE                   ;3        
    jmp     Lf209                   ;3   =   6

	;
	; Copy data of player movement to current area.
	;
Lf1dc
    ldx     #$04                    ;2   =   2
Lf1de
    lda     ram_D9,x                ;4        
    sta     ram_D4,x                ;4        
    dex                             ;2        
    bpl     Lf1de                   ;2/3      
    rts                             ;6   =  18
    
Lf1e6
    sta     AUDC0                   ; Make sound.        
    lda     ram_E7                  ;3        
    bpl     Lf1fb                   ;2/3      
    sty     ram_F3                  ;3        
    lda     ram_EE                  ;3        
    beq     Lf1fb                   ;2/3      
    ldx     ram_DA                  ;3        
    lda     ram_D6                  ;3        
    jsr     Lfe64                   ; Update chessboard square.        
    sty     ram_D6                  ;3   =  31
Lf1fb
    sty     ram_E7                  ;3        
    rts                             ;6   =   9
    
	; Venetian Blinds technique.
	; Draw one scanline with even pieces
Lf1fe
    lda     (ram_CC),y              ;5 2nd piece.        
    lsr                             ;2        
    sta     GRP0                    ;3        
    lda     ram_FE                  ;3 Color for 2nd piece.        
    sta     HMOVE                   ;3        
    sta     COLUP0                  ;3   =  19
Lf209
    lda     (ram_C8),y              ;5 4th piece.        
    lsr                             ;2        
    sta     GRP1                    ;3        
    lda     ram_FC                  ;3 Color for 4th piece.       
    sta.w   COLUP1                  ;4        
    lda     (ram_C4),y              ;5 6th piece.       
    lsr                             ;2        
    sta     GRP0                    ;3        
    lda     (ram_C0),y              ;5 8th piece.        
    lsr                             ;2        
    ldx     ram_FA                  ;3 Color for 6th piece.       
    stx     COLUP0                  ;3        
    sta     GRP1                    ;3        
    ldx     ram_F8                  ;3 Color for 8th piece.        
    stx     COLUP1                  ;3        
    lda     #$70                    ;2        
    sta     HMP0                    ;3        
    sta     HMP1                    ;3        
	; Draw one scanline with odd pieces.
    lda     ram_FF                  ;3 Color for 1st piece.        
    sta     COLUP0                  ;3        
    ldx     ram_FB                  ;3 Color for 5th piece.        
    sta     WSYNC                   ;3   =  69
;---------------------------------------
    sta     HMOVE                   ;3        
    lda     (ram_CE),y              ;5 1st piece.        
    sta     GRP0                    ;3        
    lda     (ram_CA),y              ;5 3rd piece.       
    sta     GRP1                    ;3        
    lda     ram_FD                  ;3 Color for 3rd piece.        
    sta     COLUP1                  ;3        
    lda     (ram_C6),y              ;5 5th piece.       
    sta     GRP0                    ;3        
    lda     (ram_C2),y              ;5 7th piece.       
    stx     COLUP0                  ;3        
    ldx     ram_F9                  ;3 Color for 7th piece.      
    sta     GRP1                    ;3        
    stx     COLUP1                  ;3        
    lda     #$90                    ;2        
    sta     HMP0                    ;3        
    sta     HMP1                    ;3        
    dey                             ;2 Repeat until drawing 12 scanlines.       
    bpl     Lf1fe                   ;2/3!     

    iny                             ;2 y = $00        
    sty     GRP0                    ;3        
    sty     GRP1                    ;3        
    sty     PF2                     ;3        
    sty     ENABL                   ;3        
    sta     HMOVE                   ;3        
    tya                             ;2        
    ldy     ram_EB                  ; Read chessboard square.        
    cpy     #$40                    ; All 64 squares drawn?
    bcs     Lf27b                   ; Yes, jump.
    lda     ram_E8                  ;3        
    sta     ENABL                   ;3        
    eor     #$fe                    ;2        
    sta     ram_E8                  ;3        
    sta     PF2                     ;3        
    ldx     #$0f                    ;2 x = $0f (offset for graphics pointer)       
    sta     HMCLR                   ;3        
    jmp     Lf194                   ;3   = 110
    
Lf27b
    ldy     #$3f                    ;2        
    sty     NUSIZ0                  ;3        
    sty     ENAM0                   ;3        
    sta     COLUP0                  ;3        
    jsr     Lf545                   ; Set timer and reverse board.       
    jsr     Lf3e7                   ; Remove cursor from board, do board search, and
				; handle joystick.      
    lda     #$09                    ; White king.        
    sta     ram_CC                  ;        
    jsr     Lfe7d                   ; Search for king and detect white king alone.        
    cpx     ram_D9                  ; Is it the piece to be moved?        
    bne     Lf29a                   ; No, jump.      
    lda     ram_F3                  ; Read cursor state.        
    beq     Lf29a                   ; Jump if cursor moving with nothing selected.      
    ldx     ram_DD                  ;3   =  47 *
Lf29a
    stx     ram_F7                  ; Save square of white king.        
    lda     ram_E2                  ; Reading ram_E2 sets N flag.       
    php                             ; Save flags (V clear means white king isn't alone)         
    pla                             ; Now it has a copy of the V flag in bit 6.        
    sta     ram_E2                  ; Write ram_E2 (bit 7 is unmodified).
Lf2a2
    lda     INTIM                   ;4        
    bne     Lf2a2                   ;2/3      
    jmp     Lf00f                   ; Start a new frame.
    
	;
	; Check for game restart.
	;
Lf2aa
    lda     SWCHB                   ; Read SWCHB.
Lf2ad
    ldy     #$00                    ; y = $00 used as constant through this subroutine.        
    lsr                             ; Reset switch pressed?        
    bcs     Lf2ff                   ; No, jump.
    sty     ram_E4                  ; Reset count of half-moves made.        

	;
	; Chessboard setup
	;
    ldx     #$07                    ; X = $07 for eight columns.
Lf2b6
    lda     Lfef2,x                 ; Read corresponding piece.        
    sta     ram_80,x                ; Put in top of the board.        
    eor     #$08                    ; Switch side.
    sta     ram_B8,x                ; Put in bottom of the board.
    lda     #$8e                    ; Unmoved white pawn.        
    sta     ram_B0,x                ; Put at 2nd row.
    lda     #$46                    ; Unmoved black pawn.
    sta     ram_88,x                ; Put at 7th row.
    sty     ram_90,x                ; Clear square at 6th row.
    sty     ram_98,x                ; Clear square at 5th row. 
    sty     ram_A0,x                ; Clear square at 4th row.
    sty     ram_A8,x                ; Clear square at 3rd row.
    dex                             ; Count column.
    bpl     Lf2b6                   ; Jump if not negative.

					; x is $ff here.
    stx     ram_E2                  ; Mark game as playing from start.
					; bit 7 = 1 = Start of game. 0 = Middlegame.
    stx     ram_F7                  ; Mark no king position.        
    stx     ram_E5                  ; Mark no en passant.  
      
    bit     ram_ED                  ; Check player 2 difficulty.        
    bpl     Lf2ec                   ; Jump if it is B (board normal). 
				; Atari plays.     
    bit     ram_D3                  ; Frame counter (low-byte)
    bvs     Lf2e1                   ; Alternating 64 video frames.
    inx                             ; x is $00 here.
Lf2e1

    sty     ram_8C,x                ; Erase pawn (at D7 or E7)
				; A still contains black pawn code.
    sta     ram_9C,x                ; Put pawn in D5 or E5
    asl     ram_B9                  ;5         *
    sec                             ;2         *
    ror     ram_B9                  ;5         *
    inc     ram_E4                  ; Increase count of half-moves.
Lf2ec
    sty     ram_F3                  ; Cursor moving.        
    sty     ram_E7                  ;3        
    ldx     #$03                    ;2        
    stx     ram_EE                  ;3        
    lsr                             ;2        
    sta     ram_D5                  ;3        
    sta     ram_D4                  ;3        
    sta     ram_D8                  ;3        
    tya                             ;2        
    jmp     Lf520                   ;3   =  27
    
Lf2ff
    lsr                             ; Select button pressed?       
    bcs     Lf315                   ; No, jump.
    ldy     ram_F2                  ; Select button was previously pressed?
    bne     Lf30e                   ; Yes, jump.
    ldx     ram_EA                  ; Current level.
    inx                             ; Increment.
    txa                             ;
    and     #$07                    ; Cap at 0-7.
    sta     ram_EA                  ; Update level.
Lf30e
    cpy     #$1e                    ; Reached 30 frames?
    bcc     Lf314                   ; No, jump.
    ldy     #$ff                    ; Ok, now select button starts to repeat.
Lf314
    iny                             ; Increment counter or...
Lf315
    sty     ram_F2                  ; ...mark select button as depressed.
       
    ldy     ram_F3                  ; Read cursor state.        
    dey                             ; Already moved a piece or cursor moving?        
    bmi     Lf35c                   ; Yes, jump.   
				; Piece currently selected.   
    ldy     ram_F4                  ;3        
    beq     Lf35c                   ;2/3      
    cpy     #$20                    ; Check for invalid movement? (>= $20)        
    bcc     Lf35d                   ; Yes, jump to check for invalid movement.     
    lda     #$20                    ;2        
    sta     ram_F4                  ;3        
    lda     #$ff                    ; Set current side as white.        
    sta     ram_E3                  ;        
    ldy     #$09                    ; White king.        
    cpy     ram_D6                  ; Is it the current piece?        
    bne     Lf354                   ; No, jump.      
    ldx     ram_D4                  ; Source square.
    bit     ram_83                  ; White king has moved?
    bvs     Lf354                   ; Yes, jump.
    lda     ram_86                  ; White queen-side rook moved.
    ora     ram_8A                  ; White able to castle queen-side.
    asl                             ; Is it all zero?
    bmi     Lf345                   ; No, jump.
    dex                             ;
    dex                             ;
    cpx     ram_D5                  ; Moving two squares to the left?
    beq     Lf3b9                   ; Yes, jump.
Lf345
    lda     ram_87                  ; White king-side rook moved.
    ora     ram_8B                  ; White able to castle king-side.
    asl                             ; Is it all zero?
    bmi     Lf354                   ; No, jump.
    ldx     ram_D4                  ; Source square.
    inx                             ; 
    inx                             ;
    cpx     ram_D5                  ; Moving two squares to the right?
    beq     Lf3b9                   ; Yes, jump.
Lf354
    inc     ram_D4                  ; Set piece as source square for search.
Lf356
    ldy     #$fe                    ; Restart movement generator.        
    sty     ram_D8                  ;        
    sty     ram_D6                  ;
Lf35c
    rts                             ; Return.
    
	;
	; Check for invalid movement.
	;
Lf35d
    lda     ram_D4                  ; Get source square.        
    bmi     Lf35c                   ; Jump if invalid.     
    ldx     ram_DA                  ; Get target square in X.        
    ldy     ram_D9                  ; Get origin square in Y.        
    lda     ram_E3                  ;         
    bmi     Lf379		; Going to put piece in origin square.
     				; Erase target square.
    ldx     ram_F7                  ; Get king position.        
    txa                             ; Is there a king?        
    bmi     Lf3bf                   ; No, jump.      
    ldy     ram_DA                  ; Get target square in Y.        
    jsr     Lfe62                   ; Erase king.        
    ldx     ram_D9                  ; Current origin square.        
    cpy     ram_F7                  ; Is target square the position of king?        
    beq     Lf383                   ; Yes, jump.
				; Going to put piece in target square.
				; Erase origin square.
Lf379
    lda.wy  ram_80,y                ; Read origin or target square.        
    and     #$f0                    ; Remove chess piece.        
    ora     ram_DB                  ; Put current chess piece.        
    sta.wy  ram_80,y                ; Update origin or target square.
Lf383
    jsr     Lfe62                   ; Erase origin or target square.       
    jsr     Lfa95                   ; Get next movement.        
    ldy     ram_E3                  ;3        
    bpl     Lf3c3                   ;2/3
				; Y is negative = invalid move.      
    lda     ram_D4                  ; Get current source square.        
    cmp     ram_D9                  ; Compare with cursor square?        
    bne     Lf3b7                   ; If not equal then invalid move
      
    lda     ram_D5                  ; Get current target square.        
    cmp     ram_DA                  ; Compare with cursor target?        
    bne     Lf3e6                   ; Jump if not equal.      
    ldx     ram_D6                  ; Get current piece.        
    cpx     #$06                    ; Is it pawn?        
    bne     Lf3b1                   ; No, jump.
    ldx     ram_D8                  ; Get movement pointer.        
    cpx     #$08                    ;2        
    bcs     Lf3b9                   ;2/3      
    cpx     #$04                    ;2        
    lda     ram_DC                  ; Get cursor capture.        
    bcs     Lf3af                   ; Jump if pawn captures.      
    bne     Lf3b7                   ; If there's something mark move as invalid.      
    beq     Lf3b9                   ; Moving to empty square, all good.
Lf3af
    beq     Lf3b7                   ; If capture is to empty square, mark as invalid.
Lf3b1
    lda     ram_DC                  ; Get cursor capture.        
    cmp     #$07                    ; Is it black piece or empty square?        
    bcc     Lf3b9                   ; Yes, jump.
Lf3b7
    sty     ram_F5                  ; Mark move as invalid.
Lf3b9
    ldy     #$01                    ; Set current side as black.        
    sty     ram_E3                  ;        
    lda     #$40                    ; Set square 64 to start search.
Lf3bf
    sta     ram_D4                  ; Set current square.        
    bne     Lf356                   ; 

Lf3c3
    ldx     ram_F7                  ; Is there a king?        
    bmi     Lf3cc                   ; No, jump.      
    lda     #$09                    ; White king.        
    jsr     Lfe64                   ; Restore chessboard square.        
Lf3cc
    cpx     ram_D5                  ;3        
    bne     Lf3e6                   ;2/3      
    ldy     ram_D8                  ;3         *
    bmi     Lf3e6                   ;2/3       *
    lda     #$06                    ; Black pawn.
    cmp     ram_D6                  ; Compare with current piece.
    bne     Lf3de                   ; Jump if not equal.
    cpy     #$04                    ;2         *
    bcc     Lf3e6                   ;2/3 =  21 *
Lf3de
    ldy     #$fe                    ; Invalid movement.
    sty     ram_F5                  ;
    sty     ram_F6                  ;3         *
    sty     ram_D4                  ;3   =  11 *
Lf3e6
    rts                             ;6   =   6
    
	;
	; Remove cursor from board, do board search, and handles joystick.
	;
Lf3e7
    jsr     Lf53c                   ;6        
    lda     ram_F3                  ; Get cursor state.        
    beq     Lf3f5                   ; Jump if only moving.      
    ldx     ram_DA                  ; Target square.        
    lda     ram_DC                  ; Content of target square.        
    jsr     Lfe64                   ; Update chessboard square.        
Lf3f5
    ldx     ram_D9                  ; Origin square.        
    lda     ram_DB                  ; Content of origin square.        
    jsr     Lfe64                   ; Update chessboard square.        
    ldx     ram_F7                  ; There is a white king?        
    bmi     Lf405                   ; No, jump.
    lda     #$09                    ; White king.        
    jsr     Lfe64                   ; Update chessboard square.        
Lf405
    ldy     ram_F4                  ; Get counter.        
    beq     Lf41c                   ; Is it zero? Jump.      
    dec     ram_F4                  ; Decrement counter.        
    bne     Lf41b                   ; Jump if it is non-zero.      
    ldx     ram_F3                  ;3        
    dex                             ;2        
    bmi     Lf3e6                   ;2/3!     
    lda     ram_D4                  ;3        
    bpl     Lf419                   ;2/3      
    jmp     Lf1dc                   ; Copy data of player movement to common area.
    
Lf419
    sty     ram_F4                  ;3   =   3
Lf41b
    rts                             ;6   =   6
    
Lf41c
    bit     ram_F3                  ; Get cursor state.       
    bpl     Lf46c                   ; Jump if moving or piece selected.      
    bvc     Lf468                   ; Jump if moving after Atari.
      
		; ram_F3 = $c0
    jsr     Lf1dc                   ; Copy data of player movement to common area.        
    tax                             ; A contains source square. Now in X.      
    lda     ram_D6                  ; Get current piece.        
    jsr     Lfe64                   ; Update chessboard square.        
    jsr     Lfd91                   ; Move piece.
				; Recalculate scores. En passant/Castling state.        
    ldy     ram_EA                  ;3        
    lda     ram_CC                  ; Black pieces material score.        
    bit     ram_E2                  ; Get bit 6 of ram_E2 into V flag.        
    cmp     #$55                    ; Less than 85 points?        
    bcs     Lf439                   ; No, jump.      
    clv                             ; White king isn't alone.
Lf439
    and     ram_E2                  ; Resets bit 7 if black pieces score < 128.        
    and     ram_CA                  ; Resets bit 7 if white pieces score < 128.        
    php                             ;        
    pla                             ;        
    sta     ram_E2                  ; Save bit 7 (N) and bit 6 (V) into ram_E2        
    lda     Lfff5,y                 ; Selected game table.        
    bcs     Lf448                   ; If too much material just jump.      
    adc     #$12                    ; Increase shallow depth by 2, full depth by 1.
Lf448
    bit     ram_E2                  ; Get state of game.       
    bvc     Lf44e                   ; Jump if white king has pieces.      
    lda     #$12                    ; Shallow depth is 2, full depth is 1.
Lf44e
    bmi     Lf452                   ; Is it normal game? Yes, jump.      
    adc     #$10                    ; Increase full depth by 1 in middlegame.
Lf452
    tay                             ; Copy value into Y register.        
    and     #$0f                    ; Extract bits 3-0.        
    sta     ram_D2                  ; Maximum depth (shallow).     
    tya                             ;        
    lsr                             ; Move high nibble to bits 3-0.        
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    sta     ram_D9                  ; Maximum full depth.        
    pla                             ; Remove return address from stack.        
    pla                             ;        
    rol     ram_B7                  ;        
    clc                             ; Erase bit 7 of ram_B7 (so it generates move)       
    ror     ram_B7                  ;        
    jmp     Lf574                   ; Do some analysis.
    
Lf468
    ldx     ram_D4                  ; Current origin square.        
    stx     ram_D8                  ; Save as cursor square.
Lf46c
    lda     INPT4|$30               ; Read joystick 1 button.        
    tax                             ;        
    eor     ram_E6                  ; XOR against previous state.        
    and     ram_E6                  ; AND against previous state.        
    stx     ram_E6                  ; Save current state as previous state.        
    bpl     Lf4d6                   ; Jump if not pressed.
    lda     #$04                    ; Tic sound.      
    jsr     Lf1e6                   ; Make "tic" sound.        
    bit     SWCHB                   ; Read switches.        
    lda     ram_D6                  ; Get current piece.        
    bvs     Lf497                   ; Left A difficulty? Yes, jump.
    tax                             ;        
    lda     ram_F3                  ; Get cursor state.        
    bne     Lf4be                   ; Already has a selected piece? Yes, jump.      
    cpx     #$09                    ; Is it a black piece?        
    bcc     Lf4d6                   ; Yes, jump to ignore.      
    sta     ram_D7                  ; Setup as content of target square.        
    lda     ram_D8                  ; Get current cursor position.        
    sta     ram_D5                  ; Setup as target square.        
    inc     ram_F3                  ; Cursor state = 1.        
    rts                             ; Return.
    
Lf495
    inc     ram_E4                  ; Increment the count of half-moves.
Lf497
    clc                             ;
    adc     #$01                    ; Increment piece type.
    cmp     #$08                    ; $08 is invalid...
    beq     Lf497                   ; ...so increment again.
    cmp     #$07                    ; $07 is invalid...
    beq     Lf497                   ; ...so increment again.
    cmp     #$0f                    ; $0f is invalid...
    beq     Lf495                   ; ...so increment again.
    and     #$0f                    ; Cap to $00-$0f
    sta     ram_D6                  ; Update current piece.
    ldx     #$c0                    ;2         *
    stx     ram_E2                  ;3         *
    stx     ram_E5                  ; Mark no en passant.
    ldx     ram_D4                  ; Get current origin square.
    stx     ram_D5                  ; Set as target square.
    stx     ram_D8                  ; Set as movement pointer.
    jsr     Lfe4b                   ; Detect if piece invalidates castling.
Lf4b9
    lda     #$00                    ; Cursor returns to simple movement.
    sta     ram_F3                  ; Cursor state = 0
    rts                             ; Return.
    
Lf4be
    lda     ram_D4                  ; Origin square.        
    cmp     ram_D5                  ; Is it same as target square?        
    beq     Lf4b9                   ; Yes, ignore.      
    lda     ram_F5                  ; Is it valid movement?        
    beq     Lf4cd                   ; Yes, jump.     
    lda     #$0f                    ; Invalid sound effect.
    sta     ram_E7                  ;
    rts                             ; Return.
    
Lf4cd
    lda     #$c0                    ; Piece moving and start board search.
    sta     ram_F3                  ; Set cursor state.        
    sta     ram_F4                  ; Start time before board search.        
    jmp     Lf13e                   ; Do special movement.
    
Lf4d6
    lda     SWCHA                   ; Read joysticks state.        
    cmp     #$f0                    ; Joystick 1 moving?        
    bcs     Lf53b                   ; No, jump.     
    bit     ram_ED                  ; Check player 2 difficulty.        
    bpl     Lf4e3                   ; Jump if it is B (board normal)      
    eor     #$c0                    ; Mirror leff/right (reversed board)
Lf4e3
    sta     ram_E9                  ; Save joystick state.      
    jsr     Lf1e6                   ; Make "tock" sound.        
    lda     ram_D8                  ; Current cursor position.        
    ldx     #$03                    ; X = $03 (movements offset).
Lf4ec
    asl     ram_E9                  ; Shift a bit of joystick movement.        
    bcs     Lf4f3                   ; Moved? No, jump.
    adc     Lff7e,x                 ; Add offset for direction.
Lf4f3
    dex                             ; Another bit to check?        
    bpl     Lf4ec                   ; Yes, jump.
    and     #$3f                    ; Limit square to range.        
    ldx     ram_D8                  ; Get old cursor position in X.        
    sta     ram_D8                  ; Update current cursor position.        
    tay                             ;2        
    lda     ram_F3                  ;3        
    lsr                             ;2        
    lda     ram_80,x                ; Read square at old cursor position.        
    and     #$f0                    ;2        
    bcs     Lf50e                   ;2/3      
    sty     ram_D4                  ;3        
    ora     ram_D6                  ;3        
    sta     ram_80,x                ; Update square at old cursor position.        
    bcc     Lf519                   ;2/3 =  39
Lf50e
    ora     ram_D7                  ;3        
    sty     ram_D5                  ;3        
    sta     ram_80,x                ; Update square at old cursor position.        
    tya                             ;2        
    eor     ram_D4                  ;3        
    beq     Lf522                   ;2/3 =  17
Lf519
    lda.wy  ram_80,y                ; Read square at new cursor position.        
    and     #$0f                    ; Read piece at square.        
    bcs     Lf522                   ;2/3 =   8
Lf520
    sta     ram_D6                  ;3   =   3
Lf522
    sta     ram_D7                  ;3   =   3
	; Notice how each time the cursor is moved,
	; ram_F5 is setup to valid movement,
	; until it goes to lf35d to verify it.

	;
	; Save last movement to display on chessboard.
	;
Lf524
    ldx     #$00                    ; Reset screensaver.        
    stx     ram_F1                  ; Frame counter (high-byte)        
    stx     ram_F0                  ;3        
    lda     #$20                    ;2        
    sta     ram_F4                  ; Go to check immediately for invalid movement.        
    stx     ram_F5                  ; Valid movement.        
    stx     ram_F6                  ;3   =  19
Lf532
    ldx     #$05                    ;2   =   2
Lf534
    lda     ram_D3,x                ;4        
    sta     ram_D8,x                ;4        
    dex                             ;2        
    bne     Lf534                   ;2/3 =  12
Lf53b
    rts                             ;6   =   6
    
Lf53c
    ldx     ram_F4                  ;3        
    bne     Lf544                   ;2/3      
    ldx     ram_D4                  ;3        
    bpl     Lf532                   ;2/3 =  10
Lf544
    rts                             ;6   =   6

	;
	; Set timing with Y register value.
	; Reverse board if necessary.
	;    
Lf545
    bit     ram_ED                  ; Check player 2 difficulty.        
    sty     TIM64T                  ;4        
    bpl     Lf573                   ; Jump if it is B (board normal).     
    ldx     #$3f                    ;2   =  11 *
Lf54e
    txa                             ;2         *
    eor     #$07                    ;2         *
    tay                             ;2         *
    lda.wy  ram_80,y                ;4         *
    and     #$0f                    ;2         *
    sta     ram_F8                  ;3         *
    lda     ram_80,x                ;4         *
    and     #$0f                    ;2         *
    sta     ram_F9                  ;3         *
    eor     ram_80,x                ;4         *
    ora     ram_F8                  ;3         *
    sta     ram_80,x                ;4         *
    lda.wy  ram_80,y                ;4         *
    and     #$f0                    ;2         *
    ora     ram_F9                  ;3         *
    sta.wy  ram_80,y                ;5         *
    dex                             ;2         *
    dex                             ;2         *
    bpl     Lf54e                   ;2/3 =  55 *
Lf573
    rts                             ;6   =   6
    
	;
	; Do some analysis while displaying a blank video signal.
	;
Lf574
    lda     #$00                    ;2        
    sta     ENAM0                   ;3        
    sta     ram_DC                  ;3        
    sta     ram_E1                  ;3        
    sta     ram_E0                  ;3        
    sta     ram_D1                  ;3        
    sta     ram_D0                  ; Setup current depth to zero @@@ not necessary.
Lf582
    ldx     #$01                    ; x = $01        
    stx     ram_DE                  ;3        
    stx     ram_C0                  ;3        
    lda     #$ff                    ;2        
    stx     ram_E3                  ;3        
    dex                             ; x = $00        
    stx     ram_DA                  ;3        
    sta     ram_DD                  ;3        
    sta     ram_DF                  ;3        
    sta     ram_CE                  ;3        
    sta     ram_CF                  ;3        
    lda     #$bf                    ;2        
    and     ram_80                  ;3        
    sta     ram_80                  ;3        
    lda     #$3f                    ;2        
    and     ram_B8                  ;3        
    sta     ram_B8                  ;3        
    stx     ram_D0                  ; Setup current depth to zero.        
    lda     ram_D1                  ;3        
    beq     Lf5d5                   ; Jump to restart search.     
    jmp     Lf64e                   ;3   =  57 *
    
Lf5ac
    inc     ram_D0                  ; Increment current depth.        
    bit     ram_B8                  ;3        
    bvs     Lf5cf                   ;2/3      
    ldx     ram_D0                  ; Get current depth?        
    dex                             ; Is it 1?
    beq     Lf5bb                   ; Yes, jump.
    cpx     ram_D1                  ; Compare against full depth.        
    bne     Lf5cf                   ; Jump if not equal.
Lf5bb
    lda     ram_B8                  ;3        
    and     #$3f                    ;2        
    ora     #$80                    ;2   =   7
Lf5c1
    sta     ram_B8                  ;3        
    lda     ram_E3                  ;3        
    eor     #$7c                    ;2        
    sta     ram_E7                  ;3        
    lda     #$00                    ; It doesn't need more analysis flag.        
    sta     ram_E6                  ;        
    beq     Lf5d5                   ; Jump to restart search.

Lf5cf
    lda     ram_E3                  ;        
    eor     #$fe                    ; Switch sides.        
    sta     ram_E3                  ;
Lf5d5
    lda     ram_B4                  ;        
    and     #$7f                    ; Erase bit 7 of ram_B4 (generate all moves)       
    sta     ram_B4                  ;
Lf5db
    lda     #$40                    ; Set current square = 64 (not valid)
    sta     ram_D4                  ; ...it will be decremented to 63.
    jsr     Lfa66                   ; Get next piece to move.
Lf5e2
    lda     ram_D4                  ; Read current square.        
    bmi     Lf5e9                   ; Jump if it analyzed the full chessboard.   
    jmp     Lf691                   ;3   =   8
    
Lf5e9
    lda     #$40                    ; Set current square = 64 (not valid)        
    sta     ram_D4                  ; ...it will be decremented to 63.
    bit     ram_B8                  ;3        
    bvs     Lf664                   ;2/3!     
    bmi     Lf657                   ;2/3!     
    lda     ram_D0                  ; Get current depth.        
    beq     Lf606                   ; Jump if zero.
    cmp     ram_D1                  ; Comparison against full depth.        
    beq     Lf600                   ; Jump if equal.     
    bcc     Lf600                   ; Jump if less than.
Lf5fd
    jmp     Lf8c6                   ; Exit search.
    
Lf600
    bit     ram_B4                  ;         
    bpl     Lf66d                   ; Jump if generating all the moves.
    bmi     Lf5fd                   ; Jump if generating only moves to empty squares.
Lf606
    bit     ram_B4                  ;        
    bpl     Lf66d                   ; Jump if generating all the moves.      
    bit     ram_80                  ;3        
    bvs     Lf611                   ;2/3      
    jmp     Lf9f5                   ;3   =  13
    
Lf611
    lda     ram_ED                  ;3        
    sta     ram_CE                  ;3        
    and     #$3f                    ;2        
    sta     ram_D4                  ;3        
    tax                             ;2        
    lda     ram_EE                  ;3        
    sta     ram_CF                  ;3        
    sta     ram_D8                  ;3        
    lda     ram_DE                  ; Always $01        
    sta     ram_DF                  ;3        
    lda     ram_80,x                ;4        
    and     #$0f                    ;2        
    sta     ram_D6                  ;3        
    jsr     Lfb91                   ; Get next movement for piece.       
    txa                             ; Copy target square into A.       
    clc                             ;        
    and     #$3c                    ; Extract row and column 0/4        
    adc     ram_D5                  ; Add again to target square.        
    asl                             ;        
    sta     COLUBK                  ; Use it as background color.        
    lda     ram_80,x                ; Read target square.        
    and     #$0f                    ; Extract piece.        
    ldx     ram_D6                  ; Read current piece.       
    cpx     #$06                    ; Is it pawn?        
    bne     Lf64c                   ; No, jump.     
    ldx     ram_D8                  ;3        
    cpx     #$08                    ;2        
    bcc     Lf64c                   ;2/3      
    cpx     #$0c                    ;2         *
    bcs     Lf64c                   ;2/3       *
    lda     #$0e                    ; White pawn.
Lf64c
    sta     ram_D7                  ; Content of target square.
Lf64e
    lda     #$bf                    ; Mark white as able to move.        
    and     ram_81                  ;        
    sta     ram_81                  ;        
    jmp     Lf6ea                   ;3   =  11
    
Lf657
    lda     ram_E3                  ;        
    eor     #$fe                    ; Switch sides.        
    sta     ram_E3                  ;        
    lda     ram_B8                  ;3        
    ora     #$c0                    ;2        
    jmp     Lf5c1                   ; Jump to restart search.
    
Lf664
    lda     ram_B8                  ;3        
    and     #$3f                    ;2        
    sta     ram_B8                  ;3        
    jmp     Lf5d5                   ; Jump to restart search.
    
Lf66d
    asl     ram_B4                  ;        
    sec                             ; Set bit 7 of ram_B4 (only moves to empty squares)       
    ror     ram_B4                  ;        
    lda     ram_D0                  ; Get current depth.        
    bne     Lf67f                   ; Jump if non-zero.      
    lda     ram_82                  ; Black king moved.        
    ora     ram_85                  ; Black king-side rook moved.
    ora     ram_89                  ; Black able to castle king-side.
    asl                             ; If bit 6 all zero.       
    bpl     Lf687                   ; Jump to do it.
Lf67f
    jmp     Lf5db                   ; Do a chessboard search.
    
	; E8, G8, king, empty, movement pointer.
Lf682
    .byte   $04,$06,$01,$00,$08             ; $f682 (*)
    
	; Try to castle black king side.
Lf687
    ldx     #$04                    ;2   =   2 *
Lf689
    lda     Lf682,x                 ;4         *
    sta     ram_D4,x                ;4         *
    dex                             ;2         *
    bpl     Lf689                   ;2/3 =  12 *
	;
	; It has a movement to do.
	;
Lf691
    lda     ram_D0                  ; Get current depth.       
    bne     Lf6ea                   ; Jump if non-zero.
    lda     ram_E0                  ; Best movement's origin square.        
    cmp     ram_D4                  ; Is it same as current origin square?
    bne     Lf6a1                   ; No, jump.
    lda     ram_E1                  ; Best movement's movement pointer.       
    cmp     ram_D8                  ; Is it same as current movement pointer?        
    beq     Lf6d1                   ; Yes, jump.
Lf6a1
    jsr     Lfbb6                   ; Detailed move evaluation.        
    ldx     ram_DE                  ; Read ram_DE, always $01       
    cpx     ram_F0                  ;3        
    bcs     Lf6d1                   ;2/3      
    tax                             ;2        
    lda     ram_B4                  ;3        
    eor     #$80                    ;2        
    and     #$80                    ;2        
    ora     ram_D4                  ;3        
    ldy     ram_D8                  ; Get movement counter.        
    cpx     ram_DF                  ;3        
    bcc     Lf6c5                   ;2/3      
    bne     Lf6d1                   ;2/3      
    cmp     ram_CE                  ;3        
    bcc     Lf6c5                   ;2/3      
    bne     Lf6d1                   ;2/3      
    cpy     ram_CF                  ;3        
    bcs     Lf6d1                   ;2/3 =  48
Lf6c5
    stx     ram_DE                  ; Save again x into ram_DE unchanged (so $01)        
    sta     ram_ED                  ;3        
    sty     ram_EE                  ;3        
    lda     ram_80                  ;3        
    ora     #$40                    ;2        
    sta     ram_80                  ;3   =  17
Lf6d1
    lda     ram_D6                  ; Get current piece.
    cmp     #$01                    ; King moving?        
    bne     Lf6dd                   ; No, jump.
    lda     ram_D8                  ;3        
    cmp     #$08                    ;2        
    bcs     Lf67f                   ;2/3 =  14
Lf6dd
    bit     ram_B4                  ; Is it generating all the moves?        
    bmi     Lf6e4                   ; No, jump.
Lf6e1
    jsr     Lfd4d                   ; Further movements for piece.
Lf6e4
    jsr     Lfa95                   ; Get next movement.        
    jmp     Lf5e2                   ; Go to loop.
    
Lf6ea
    lda     ram_8C                  ;3        
    and     #$bf                    ;2        
    ldy     ram_D6                  ; Get current piece.       
    cpy     #$06                    ; Is it pawn?
    bne     Lf6fc                   ; No, jump.
    ldy     ram_D8                  ;3        
    cpy     #$0c                    ;2        
    bcc     Lf6fc                   ;2/3      
    ora     #$40                    ;2   =  21 *
Lf6fc
    sta     ram_8C                  ;3        
    ldx     ram_D4                  ; Current origin square.        
    lda     ram_80,x                ; Read chessboard.        
    and     #$0f                    ; Extract piece.        
    sta     ram_EB                  ;         
    bit     ram_B8                  ;3        
    bpl     Lf782                   ;2/3      
    ldy     ram_D7                  ; Content of target square.        
    ldx     ram_D0                  ; Get current depth.        
    cpy     #$09                    ; Is it white king captured?        
    bne     Lf71c                   ; No, jump.      
    cpx     #$01                    ; Is it depth one?
    bne     Lf71c                   ; No, jump.
    lda     #$40                    ; Mark white as unable to move at depth 1.
    ora     ram_81                  ;
    sta     ram_81                  ;
	;
	; After an analysis at full depth, it checks for unquiet position
	;
Lf71c
    dex                             ; Depth - 1.      
    cpx     ram_D1                  ; Comparison against full depth.        
    bne     Lf775                   ; Jump if not equal.      
    inx                             ; Depth + 1.        
    cpy     #$01                    ; Is it black pawn?        
    bne     Lf72e                   ; No, jump.      
    lda     ram_DA                  ; Get current score.
    sbc     #$01                    ; Minus 1.
    eor     #$80                    ; Make it unsigned.
    sta     ram_C0,x                ; Save as current score for depth.
Lf72e
    ldx     ram_D7                  ; Content of target square.        
    ldy     ram_EB                  ; Content of origin square.        
    lda     Lfed5,y                 ; Get piece score.        
    clc                             ;        
    adc     Lfed5,x                 ; Add capture score.        
    beq     Lf768                   ; Neutralized itself? Yes, jump.     
    tay                             ;2        
    tax                             ;2        
    jsr     Lfd81                   ;6        
    rol                             ;2        
    bmi     Lf768                   ;2/3      
    bcs     Lf747                   ; Not losing by -5 points? Jump.     
    inc     ram_E6                  ; It needs more analysis.
Lf747
    sta     ram_EC                  ;3        
    ldy     ram_E7                  ;3        
    jsr     Lfd81                   ;6        
    rol                             ;2        
    cmp     ram_EC                  ;3        
    bcs     Lf755                   ;2/3      
    stx     ram_E7                  ;3   =  22
Lf755
    lda     #$01                    ;        
    cmp     ram_E6                  ; Is it requiring more analysis?        
    bcc     Lf76b                   ; Yes, jump.      
    lda     ram_D6                  ; Get current piece.        
    cmp     #$03                    ; Is it bishop?        
    bne     Lf764                   ; No, jump.
Lf761
    jmp     Lf6e4                   ; Go for next movement.
    
Lf764
    cmp     #$05                    ; Is it rook?        
    beq     Lf761                   ; Yes, jump.
Lf768
    jmp     Lf6e1                   ; Go for next movement.
    
Lf76b
    ldx     ram_D0                  ; Get current depth.
    lda     ram_DA                  ; Get board score.
    adc     ram_E7                  ; Add score.
    eor     #$80                    ; Make it unsigned.
    sta     ram_C0,x                ; Save it.
Lf775
    bit     ram_B8                  ;3         *
    bvs     Lf77f                   ;2/3       *
    lda     ram_E3                  ;
    eor     #$fe                    ; Switch sides.
    sta     ram_E3                  ;
Lf77f
    jmp     Lf664                   ;3   =   3 *
    
Lf782
    ldy     ram_D7                  ; Get target square content.       
    lda     ram_DA                  ; Get board score.       
    clc                             ;        
    adc     Lfed5,y                 ; Add capture score.        
    sta     ram_DB                  ;3        
    bit     ram_8C                  ;3        
    bvc     Lf7a9                   ;2/3      
    lda     ram_E3                  ; Current playing side.
    asl                             ; To get bit 7 into carry.
    and     #$08                    ; Extract bit 3.
    eor     #$0a                    ; Convert into queen of opposite side.
    tay                             ; Save into Y register.
    lda     #$05                    ; 5 points. Why? @@@ it is 6 in other places.
    bcs     Lf79e                   ;
    lda     #$fa                    ; -6 points.
Lf79e
    adc     ram_DB                  ; Add capture score.
    clc                             ;
    sbc     ram_D0                  ; Subtract current depth.
    clc                             ;
    adc     Lfed5,y                 ; Add promotion score.
    sta     ram_DB                  ; Update score.
Lf7a9
    lda     ram_D7                  ; Get content of target square.       
    and     #$07                    ; Extract only piece.        
    cmp     #$01                    ; Is it king?        
    bne     Lf7c1                   ; No, jump.
    lda     ram_E3                  ; Current playing side.
    asl                             ; Get bit 7 into carry flag.
    lda     ram_D0                  ; Current depth.
    bcs     Lf7ba                   ; Jump if playing white, A = depth + 1
    eor     #$ff                    ; Depth = -(depth + 1)
Lf7ba
    adc     #$00                    ;
    sta     ram_E9                  ; Save in temporary variable.
    jmp     Lf9ec                   ;
    
Lf7c1
    bit     ram_E2                  ; Is white king alone?        
    bvc     Lf7df                   ; No, jump.
    lda     #$01                    ; A = $01 Black king.
    jsr     Lfe71                   ; Search for the king.
    txa                             ; Move king's square number from X to A.
    tay                             ; Move king's square number from A to Y.
    jsr     Lfe6f                   ; Search for the white king.
    tya                             ; Move black king's square number from Y to A.
    jsr     Lfe9c                   ; Calculate distance between the two kings.
    sta     ram_DC                  ; Save it.
    lda     #$1b                    ; Center of board.
    jsr     Lfe9c                   ; Calculate distance of white king against center.
    asl                             ; Multiply by 2.
    sbc     ram_DC                  ; Subtract from previous distance.
    sta     ram_DC                  ;
Lf7df
    lda     ram_E3                  ; Get current side.        
    eor     #$fe                    ;        
    ldx     ram_D0                  ; Get current depth.        
    sta     ram_C1,x                ;        
    cpx     ram_D1                  ; Comparison against full depth.        
    bcc     Lf7f4                   ; Jump if less than.      
    lda     ram_DB                  ; Get current score.        
    clc                             ;        
    adc     ram_DC                  ; Add kings distance score.        
    eor     #$80                    ; Remove sign (so -1 is $7f and +1 is $81)
    sta     ram_C1,x                ;
Lf7f4
    ldx     ram_D1                  ; Get full maximum depth.        
    cpx     ram_D0                  ; Comparison with current depth.        
    bcs     Lf821                   ; Jump if full_depth >= cur_depth.     
    ldx     ram_D2                  ; Get shallow maximum depth.        
    cpx     ram_D0                  ; Comparison with current depth.
    bcs     Lf817                   ; Jump if shallow_depth >= cur_depth.
    lda     ram_D5                  ; Get target square.
    cmp     ram_DD                  ;3         *
    beq     Lf817                   ;2/3       *
    ldy     ram_EB                  ; Content of origin square.
    jsr     Lfd65                   ;6         *
    bpl     Lf817                   ;2/3       *
    lda     ram_D7                  ; Content of target square.
    beq     Lf817                   ;2/3       *
    jmp     Lf6e1                   ; Go for next movement.
    
Lf814
    jmp     Lf97a                   ; Go for simplest scoring.
    
Lf817
    lda     ram_D0                  ; Current depth.        
    cmp     #$0c                    ; Is it at 12 (maximum) ?
    beq     Lf814                   ; Yes, jump.
    lda     ram_D5                  ;3        
    sta     ram_DD                  ;3   =  13
	;
	; Save movement into simulated stack.
	;
Lf821
    lda     ram_D0                  ; Get current depth.        
    clc                             ;        
    adc     #$1a                    ; Start in offset +26, then +13, then +0        
    tax                             ;         
    lda     ram_D4                  ; Source square.       
    tay                             ; Save square number in Y.
    bpl     Lf836                   ; Jump to saves low nibble of source square number.
Lf82c
    tax                             ;        
    lda     ram_D7                  ; Content of target square.        
    cpx     ram_D0                  ; At current depth? (3rd iteration)        
    bne     Lf836                   ; No, jump.
    lda.wy  ram_80,y                ; Content of source square.
Lf836
    asl                             ; Move bits 0-3 into upper nibble.        
    asl                             ;        
    asl                             ;        
    asl                             ;        
    sta     ram_FB                  ; Variable data.        
    lda     ram_8D,x                ; Read content of square.        
    and     #$0f                    ; Preserve chessboard value (clears high-nibble)
    ora     ram_FB                  ; Insert variable data.        
    sta     ram_8D,x                ; Save into memory.
    txa                             ; The index...       
    sec                             ;        
    sbc     #$0d                    ; ...is subtracted $0d        
    bpl     Lf82c                   ; ...continue while positive.      

    lda     ram_D8                  ; Current movement counter.       
    sta     ram_EF,x                ; Save in simulated stack.
    lda     ram_80,x                ; Square used to contain upper bits of src square no.        
    and     #$4f                    ; Erase bits 7, 5 and 4.        
    sta     ram_80,x                ;        
    lda     ram_B4                  ; Variable ram_B4.        
    and     #$80                    ; Extract bit 7.        
    ora     ram_D4                  ; OR'ed with src square number.        
    and     #$b0                    ; Extract bit 7, 5, and 4.        
    ora     ram_80,x                ; OR'ed with chessboard square.        
    sta     ram_80,x                ; Save.        
    txa                             ; Current depth.        
    bne     Lf877                   ; Jump if not zero.      
    lda.wy  ram_80,y                ; Read content of source square.        
    and     #$0f                    ; Extract piece.        
    sta     ram_D6                  ; Save as current piece.        
    lsr                             ; Is it king ($01) ?        
    bne     Lf877                   ; No, jump.      
    lda     ram_D8                  ; Read movement counter.        
    ldy     #$07                    ; Rook at right side...        
    ldx     #$05                    ; ...moving two squares to the left.       
    cmp     #$08                    ; Is it right movement?        
    beq     Lf88b                   ; Yes, jump to move rook.
Lf877
    lda     ram_D6                  ; Read current piece.        
    cmp     #$06                    ; Is it pawn?        
    bne     Lf88e                   ; No, jump.      
    lda     ram_D8                  ; Read movement counter.        
    cmp     #$08                    ;2        
    bcc     Lf88e                   ;2/3      
    cmp     #$0c                    ;2         *
    bcs     Lf88e                   ;2/3       *
    ldx     ram_D5                  ;3         *
    ldy     ram_E5                  ;3   =  24 *
Lf88b
    jsr     Lfd37                   ; Move piece from y to x.
Lf88e
    jsr     Lfd33                   ; Move main piece.      
    ldy     ram_D7                  ; Get target square content.        
    lda     ram_DA                  ; Get current score.        
    clc                             ;        
    adc     Lfed5,y                 ; Add capture score.        
    sta     ram_DA                  ; Save current score.        
    bit     ram_8C                  ;3        
    bvc     Lf8c3                   ;2/3      
    lda     ram_E3                  ; Get current side playing.
    and     #$08                    ; Use only bit 3.
    ora     #$02                    ; Build a queen.
    sta     ram_E9                  ; Save to ram_E9.
    eor     #$08                    ; Switch side to calculate score.
    tay                             ; Save into Y register.
    ldx     ram_D5                  ; Target square number.
    jsr     Lfd44                   ; Update square x with ram_E9.
    lda     #$06                    ; 6 points.
    bit     ram_E3                  ; Current side playing is white?
    bmi     Lf8b7                   ; Yes, jump.
    lda     #$fa                    ; -6 points.
Lf8b7
    clc                             ;
    adc     ram_DA                  ; Add to current score.
    clc                             ;
    sbc     ram_D0                  ; Subtract current depth.
    clc                             ;
    adc     Lfed5,y                 ; Add promotion score.
    sta     ram_DA                  ; Update score for movement.
Lf8c3
    jmp     Lf5ac                   ; Go deeper.
    
	;
	; Restore movement from simulated stack.
	;
Lf8c6
    dec     ram_D0                  ; Decrement stack depth.        
    lda     ram_E3                  ;        
    eor     #$fe                    ; Switch sides.        
    sta     ram_E3                  ;        
    lda     #$ff                    ;2        
    sta     ram_DD                  ;3        
    ldx     ram_D0                  ; Current stack depth used as index (reg. X)        
    lda     ram_A7,x                ; Read nibble of source square number.        
    lsr                             ; Move to bits 3-0.
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    sta     ram_E9                  ; Save value.        
    lda     ram_80,x                ; Read upper bits of source square number.        
    and     #$b0                    ; Extract bits.       
    ora     ram_E9                  ; Add to previous vlaue.        
    asl     ram_B4                  ; Delete bit 7 of ram_B4        
    asl                             ; Get bit 7 on Carry Flag.        
    ror     ram_B4                  ; Restore bit 7 of ram_B4 using Carry Flag.        
    lsr                             ; Erase bit 7.        
    sta     ram_D4                  ; Now it is source square number.        
    lda     ram_9A,x                ; Read original content of target square.        
    lsr                             ; Move to bits 3-0.        
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    sta     ram_D7                  ; Original content of target square.        
    lda     ram_8D,x                ; Read original content of source square.        
    lsr                             ; Move to bits 3-0.        
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    sta     ram_E9                  ; Original content of source square.        
    and     #$07                    ; Extract only piece (no side).       
    sta     ram_D6                  ; Original current piece.        
    ldy     ram_EF,x                ; Read previous movement counter.        
    sty     ram_D8                  ; Restore movement counter.        
    jsr     Lfb91                   ; Get next movement for piece.        
    lda     ram_80,x                ; Read target square.        
    and     #$f0                    ; Remove content.        
    ora     ram_D7                  ; Restore with original content.        
    sta     ram_80,x                ; Write target square.        
    ldx     ram_D4                  ; Read source square.        
    jsr     Lfd44                   ; Update square x with ram_E9.
    ldx     ram_D8                  ; Get movement counter.        
    lda     ram_D6                  ; Current piece in evaluation.        
    cpx     #$08                    ;        
    bcc     Lf940                   ;2/3      
    bne     Lf928                   ;2/3
					; X = $08 at this point.      
    ldy     ram_D0                  ; Get current depth.
    bne     Lf928                   ; Jump if not zero (initial depth).
    ldy     #$05                    ; Y = $05 (castled rook)
    dex                             ; X = $07 (original position of rook)
    cmp     #$01                    ; Is it king?
    beq     Lf93d                   ; Yes, jump.
    inx                             ; X = $08
Lf928
    cmp     #$06                    ; Is it pawn?        
    bne     Lf940                   ; No, jump.
    cpx     #$0c                    ;2         *
    bcs     Lf940                   ;2/3       *
    lda     ram_E3                  ; Get current side playing.
    asl                             ; x2 $fe-$02
    asl                             ; x4 $fc-$04
    asl                             ; x8 $f8-$08
    eor     #$ff                    ; After this it is $07 (white) or $f7 (black)
    sec                             ;
    adc     ram_D5                  ; Add to target square number.
    tax                             ; Use as new target square number.
    ldy     ram_D5                  ; Use original target square as source square.
Lf93d
    jsr     Lfd37                   ; Move piece from y to x.
Lf940
    ldx     ram_D0                  ; Get current depth.       
    lda     ram_C1,x                ; Get best score of opponent.        
    sta     ram_E9                  ;        
    ldy     ram_D7                  ; Get content of target square.        
    lda     ram_DA                  ; Get current score.
    sec                             ;        
    sbc     Lfed5,y                 ; Subtract capture score.
    sta     ram_DA                  ; Update current score.
    lda     ram_D6                  ; Get current piece.      
    cmp     #$06                    ; Is it pawn?        
    bne     Lf983                   ; No, jump.      
    lda     ram_D8                  ;3        
    cmp     #$0c                    ;2        
    bcc     Lf983                   ;2/3      
    lda     ram_E3                  ; Get current side playing.
    and     #$08                    ; Extract bit 3.
    eor     #$0a                    ; Build a queen of the opposite side.
    tay                             ;
    lda     #$06                    ; 6 points.
    bit     ram_E3                  ; Playing black?
    bpl     Lf96b                   ; Yes, jump.
    lda     #$fa                    ; -6 points.
Lf96b
    clc                             ;
    adc     ram_DA                  ; Add to current score.
    sec                             ;
    adc     ram_D0                  ; Add current depth + 1.
    sec                             ;
    sbc     Lfed5,y                 ; Subtract promotion score.
    sta     ram_DA                  ; Update current score.
    jmp     Lf983                   ;
    
	;
	; Simplest scoring for depth 12.
	;
Lf97a
    lda     ram_DB                  ; Capture score.
    clc                             ;
    adc     ram_DC                  ; Add kings distance score.
    eor     #$80                    ; Remove sign (so -1 is $7f and +1 is $81)
    sta     ram_E9                  ; Save in temporary.
Lf983
    ldx     ram_D0                  ; Get current depth in X register.        
    lda     ram_E3                  ; Current side playing.        
    bmi     Lf9b9                   ; If white jump to correct comparison.      
    txa                             ; Current depth is zero?        
    bne     Lf9a1                   ; No, jump.
    lda     ram_E9                  ; Get score.        
    cmp     #$fd                    ; Less than maximum (+124) ?        
    bcc     Lf99e                   ; No, jump.      
    bit     ram_E2                  ; Is white king alone?
    bvc     Lf99e                   ; No, jump.
    bit     ram_81                  ; Is white unable to move at depth one?
    bvs     Lf99e                   ; Yes, jump.
    lda     #$03                    ; Make it minimum (-125)
    sta     ram_E9                  ; Save as score.
Lf99e
    jmp     Lf9b1                   ;
    
	;
	; Black score comparison
	;
Lf9a1
    lda     ram_BF,x                ; Previous score.       
    cmp     ram_C1                  ; Compare against initial score.
    beq     Lf9ab                   ; Jump if equal.      
    bcc     Lf9ab                   ; Jump if worst.
    lda     ram_C1                  ; Get initial score.
Lf9ab
    cmp     ram_E9                  ; Compare against current score?        
    beq     Lf9ec                   ; Jump if equal and abort search (alpha-beta cut)      
    bcc     Lf9ec                   ; Jump if worst and abort search (alpha-beta cut)
Lf9b1
    lda     ram_C0,x                ; Get current depth score.        
    cmp     ram_E9                  ; Compare against current score?
    bcc     Lf9cb                   ; Jump if new is better.
    bcs     Lf9da                   ; Jump if new is worst or equal.

	;
	; White score comparison.
	;
Lf9b9
    lda     ram_BF,x                ; Previous score.        
    cmp     ram_C0                  ; Compare against initial score.        
    bcs     Lf9c1                   ; Jump if worst.
    lda     ram_C0                  ; Get start score.
Lf9c1
    cmp     ram_E9                  ; Compare against current score?        
    bcs     Lf9ec                   ; Jump if worst and abort search (alpha-beta cut)

    lda     ram_E9                  ; Get current score.       
    cmp     ram_C0,x                ; Compare against current depth score?        
    bcs     Lf9da                   ; Jump if new is worst.
				; Continue if new is better.
Lf9cb
    lda     ram_E9                  ; Get current score.        
    sta     ram_C0,x                ; Save as new score for current depth.
    txa                             ; Is depth zero?        
    bne     Lf9da                   ; No, jump.
    lda     ram_D4                  ; Get origin square.        
    sta     ram_E0                  ; Save as best movement's origin square.        
    lda     ram_D8                  ; Get movement pointer.
    sta     ram_E1                  ; Save as best movement's movement pointer.
Lf9da
    txa                             ; Is depth zero?        
    beq     Lf9e0                   ; Yes, jump.
    jmp     Lf6dd                   ; No, go to search next movement.
    
	; This piece of code is entered with a = $00 and x = $00
Lf9e0
    lda     ram_80                  ;3        
    and     #$bf                    ;2        
    sta     ram_80                  ;3        
    inx                             ; x = $01        
    stx     ram_DE                  ; Again ram_DE equal to $01    
    jmp     Lf5d5                   ; Restart search.
    
Lf9ec
    ldx     ram_D0                  ; Get current depth.        
    lda     ram_E9                  ; Get score.        
    sta     ram_C0,x                ; Save score.        
    jmp     Lf8c6                   ; Exit search.
    
Lf9f5
    ldx     ram_E0                  ; Get best movement's origin.        
    stx     ram_D4                  ; Use as current square.   
    lda     ram_E1                  ; Get best movement's movement pointer.
    sta     ram_D8                  ; Use as current movement pointer.
    lda     ram_80,x                ; Read content of origin square        
    and     #$07                    ; Extract piece type (without side)        
    sta     ram_D6                  ; Save as current piece.
    jsr     Lfb91                   ; Get next movement for piece.       
    asl     ram_B4                  ;        
    sec                             ; Only generate movements to empty squares.         
    ror     ram_B4                  ; 
    lda     ram_80,x                ; Read target square.        
    and     #$0f                    ; Extract piece.        
    ldx     ram_D6                  ; Get current piece.        
    cpx     #$06                    ; Is it pawn?        
    bne     Lfa21                   ; No, jump.      
    ldx     ram_D8                  ;3        
    cpx     #$08                    ;2        
    bcc     Lfa21                   ;2/3      
    cpx     #$0c                    ;2         *
    bcs     Lfa21                   ;2/3       *
    lda     #$0e                    ; White pawn.
Lfa21
    sta     ram_D7                  ; Store content of target square.        
    ldy     ram_D9                  ; Get maximum full depth.        
    beq     Lfa30                   ; Is it zero? Jump.      
    lda     ram_D1                  ; Check if already set up.
    bne     Lfa30                   ; Yes, jump.
    sty     ram_D1                  ; No, copy value.
    jmp     Lf582                   ;
    
Lfa30
    inc     ram_E4                  ; Increment the count of half-moves.        
    ldx     #$1f                    ;2        
    stx     ram_D0                  ;3        
    stx     AUDC0                   ; Signal move completed.        
    ldy     ram_D4                  ;3        
    ldx     #$00                    ;2        
    lda     ram_C0                  ;3        
    cmp     #$03                    ;2        
    bcc     Lfa4b                   ;2/3      
    inx                             ;2        
    cmp     #$fd                    ;2        
    bcs     Lfa4d                   ;2/3      
    inx                             ;2        
    inx                             ;2        
    bne     Lfa4d                   ;2/3 =  37
Lfa4b
    sty     ram_D5                  ;3   =   3 *
Lfa4d
    stx     ram_EE                  ;3        
    sty     ram_D8                  ;3        
    jsr     Lf13e                   ; Do special movement.        
    jsr     Lf524                   ; Save movement data for display.        
    lda     #$80                    ; Piece is moving.       
    sta     ram_F3                  ; Set cursor state.        
    sta     ram_E7                  ; Signal valid movement.       
    jsr     Lfd91                   ; Move piece.
				; Recalculate scores. En passant/Castling state.        
    jsr     Lf3b9                   ;6        
    jmp     Lf00f                   ; Start a new frame.

	;
	; Get next piece to move from chessboard.
	;    
Lfa66
    ldx     ram_D4                  ; Get source square.
Lfa68
    dex                             ; Decrement X (go to left).
    bmi     Lfac8                   ; Jump if negative (board exit).
    lda     ram_80,x                ; Read square.        
    and     #$0f                    ; Extract piece.        
    beq     Lfa68                   ; Continue if empty square.      
    ldy     ram_E3                  ; Get current side.        
    bpl     Lfa77                   ; Jump if playing black.      
    eor     #$08                    ; XOR with $08 (to change side).
Lfa77
    cmp     #$07                    ; Is it valid piece?        
    bcs     Lfa68                   ; No, jump.
    stx     ram_D4                  ; New origin square.        
    sta     ram_D6                  ; New current piece.        
    tay                             ; Use as index (Y register).        
    lda     Lffef-1,y               ; Get table of movements.      
    cpy     #$06                    ; Is it pawn?        
    bne     Lfa8d                   ; No, jump.      
    bit     ram_E3                  ; Current side is black?        
    bpl     Lfa8d                   ; Yes, jump.      
    adc     #$00                    ; Carry is set, so A = A + 1.
Lfa8d
    sta     ram_D8                  ; Current movement.        
    lda     ram_B7                  ; Read ram_B7 to check if it should generate move.     
    sta     ram_D5                  ; Target square.        
    bmi     Lfaca                   ; Jump if target square is invalid.
	;
	; Get next movement (with previously setup information)
	;
Lfa95
    lda     ram_D6                  ; Get current piece.        
    cmp     #$06                    ; Is it a pawn?
    beq     Lfad2                   ; Yes, jump.
Lfa9b
    dec     ram_D8                  ; Decrement current movement.
Lfa9d
    bmi     Lfa66                   ; If negative go to get next piece to move.
Lfa9f
    jsr     Lfb91                   ; Get next movement for piece.       
    bmi     Lfacb                   ; Jump if invalid.     
    lda     ram_B4                  ; Get ram_B4 bit 7...        
    asl                             ; ...into carry flag.
    ldy     ram_D6                  ; Get current piece.        
    lda     ram_80,x                ; Read target square.       
    and     #$0f                    ; Extract piece.        
    sta     ram_D7                  ; Save as target content.        
    bne     Lfab9                   ; Jump if there is a capture.      
    bcs     Lfaca                   ; Empty square and ram_B4 bit 7 is set just do it.       
    cpy     #$06                    ; Current piece is pawn?        
    bne     Lfa9b                   ; No, jump to find another movement.      
    beq     Lfb19                   ; Yes, check further.
Lfab9
    eor     ram_E3                  ; XOR against current side.        
    and     #$08                    ; Is it a valid capture?        
    beq     Lfacb                   ; No, jump.      
    bcs     Lfacb                   ; Capture and ram_B4 bit 7 is set ignore this.      
    cpy     #$06                    ; Current piece is pawn?        
    bne     Lfaca                   ; No, exit with generated move. 
    jmp     Lfb75                   ; Yes, check further.
    
Lfac8
    stx     ram_D4                  ;3   =   3
Lfaca
    rts                             ;6   =   6
    
Lfacb
    jsr     Lfd4d                   ; Further movements for piece?        
    bcc     Lfa9b                   ; Jump if not a pawn.      
    bcs     Lfb19                   ; Jump if it is a pawn.

	;
	; Pawn special handling.
	;
Lfad2
    lda     ram_D4                  ; Get origin square.       
    lsr                             ; Extract row.        
    lsr                             ;        
    lsr                             ;        
    ldx     ram_E3                  ; Get current side.        
    bpl     Lfadd                   ; Jump if black.      
    eor     #$07                    ; row = 7 - row
Lfadd
    sta     ram_EC                  ; Save in temporary variable.        
    lda     ram_D8                  ; Get movement pointer.        
    cmp     #$0e                    ;2        
    bcc     Lfae9                   ;2/3      
    sbc     #$0c                    ;2         *
    sta     ram_D8                  ;3   =  15 *
Lfae9
    lda     #$80                    ; No valid en passant pawn.        
    sta     ram_EB                  ;        
    eor     ram_B7                  ; A = $00 if generates first move, $80 if don't.        
    and     ram_E3                  ; A = $80 only if white's turn.        
    bmi     Lfaf5                   ; If white's turn and no first move then jump.     
    lda     ram_E5                  ; Get en passant state.
Lfaf5
    ldx     ram_D0                  ; Get current depth.        
    beq     Lfb15                   ; Jump if it is zero.
    lda     ram_EE,x                ; Get previous movement counter.        
    cmp     #$02                    ; Is it moved two squares?        
    bcs     Lfb19                   ; No, jump.     
    lda     ram_8C,x                ; Content of previous source square content.        
    and     #$70                    ; Extract piece.        
    cmp     #$60                    ; Is it pawn?        
    bne     Lfb19                   ; No, jump.      
    lda     ram_A6,x                ; Get previous source square.        
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    lsr                             ;        
    sta     ram_EB                  ;        
    lda     $1f|$70,x               ;         
    and     #$30                    ;        
    ora     ram_EB                  ; A contains previous source square.
Lfb15
    eor     #$18                    ; So it gets the square number behind the enemy pawn.        
    sta     ram_EB                  ; Save it as en passant pawn.
Lfb19
    dec     ram_D8                  ; Avoid two movements.        
    dec     ram_D8                  ;
    bpl     Lfb22                   ;      
    jmp     Lfa9d                   ; Go to analyze next square.
    
Lfb22
    lda     ram_D8                  ;3        
    lsr                             ;2        
    tax                             ;2        
    dex                             ;2        
    bmi     Lfb85                   ;2/3      
    beq     Lfb5d                   ;2/3      
    dex                             ;2        
    dex                             ;2        
    dex                             ;2        
    bmi     Lfb54                   ;2/3      
    lda     ram_B7                  ;3        
    eor     ram_B4                  ;3        
    bmi     Lfb19                   ;2/3      
    lda     ram_EB                  ; Is there an en passant pawn?        
    bmi     Lfb19                   ; No, jump.
    bit     ram_B8                  ;3        
    bmi     Lfb19                   ;2/3      
    lda     ram_EC                  ;        
    cmp     #$04                    ; Is it at the 5th rank?        
    bne     Lfb19                   ; No, jump.      
    jsr     Lfb91                   ; Get next movement for piece.
    cpx     ram_EB                  ; Right opponent pawn for en passant?
    bne     Lfb19                   ; No, jump.
    lda     ram_E3                  ; Get current side.
    and     #$08                    ; Extract bit 3.
    eor     #$0e                    ; Create enemy pawn.
    sta     ram_D7                  ; Save as target square content.
    rts                             ;
    
Lfb54
    lda     ram_B7                  ;3        
    eor     ram_B4                  ;3        
    bmi     Lfb19                   ;2/3      
    jmp     Lfa9f                   ; Get next movement for piece.
    
Lfb5d
    lda     ram_EC                  ;        
    cmp     #$05                    ; Compare if reaching 6th rank.        
    ror                             ; Get carry flag in bit 7.        
    eor     ram_B4                  ;3        
    ora     ram_B7                  ;3        
    bpl     Lfb19                   ;2/3 =  15
Lfb68
    jsr     Lfb91                   ; Get next movement for piece.       
    bmi     Lfb19                   ; Jump if invalid.     
    lda     ram_80,x                ; Read target square.        
    and     #$0f                    ; Extract piece.        
    sta     ram_D7                  ; Save as target content.        
    bne     Lfb8e                   ; Jump if not empty square.
Lfb75
    lda     ram_B7                  ; Should it generate move?        
    bmi     Lfb84                   ; No, jump.      
    lda     #$06                    ;        
    cmp     ram_EC                  ; Is it reaching 7th rank?        
    bne     Lfb84                   ; No, jump.      
    asl                             ;2         *
    adc     ram_D8                  ;3         *
    sta     ram_D8                  ;3   =  20 *
Lfb84
    rts                             ;6   =   6
    
Lfb85
    ldx     ram_EC                  ;3        
    dex                             ;2        
    bne     Lfb8e                   ;2/3      
    bit     ram_B4                  ; Is it generating all the moves?       
    bmi     Lfb68                   ; No, jump.
Lfb8e
    jmp     Lfa66                   ; Go to get next piece to move.
    
	;
	; Get next movement for piece.
	; Input:
	; 	ram_D6 = current piece.
	; 	ram_D4 = source square.
	;	ram_D8 = adjustment per side.
	; Output:
	; 	ram_D5 / x = target square.
	;
Lfb91
    ldx     ram_D6                  ; Get current piece.        
    lda     Lffe9-1,x               ; Get table of movements.        
    clc                             ;        
    adc     ram_D8                  ; Add counter.        
    tay                             ;        
    lda     ram_D4                  ; Get source square.        
    and     #$38                    ; Extract row.        
    adc     ram_D4                  ; Add it to source square.
					; So 00xxxyyy now is 0xxx0yyy        
    sed                             ; Set BCD mode.        
    adc     Lff82,y                 ; Add movement.        
    cld                             ; Remove BCD mode.        
    tax                             ;      
    bmi     Lfbb3                   ; Any negative value is out of the chessboard, so jump.      
    sta     ram_D5                  ; Save as target square.       
    and     #$0f                    ; Extract column.        
    tax                             ;        
    adc     ram_D5                  ; Add itself, so 0xxx0yyy is now 0xxxyyy0        
    cpx     #$08                    ; Make it become negative if column >= 8 (invalid).        
    ror                             ; Rotate to right, so 0xxxyyy0 is now 00xxxyyy.        
    tax                             ;
Lfbb3
    stx     ram_D5                  ; Save as target square.        
    rts                             ; Return.

	;
	; Detailed move evaluation (only for initial depth)
	;    
Lfbb6
    ldx     ram_E4                  ; Get count of half-moves.        
    cpx     #$08                    ; 8 half-moves?
    lda     ram_D6                  ; Get current piece.        
    php                             ;        
    bcc     Lfbc1                   ; Jump if less than 8 moves.
    adc     #$07                    ; Convert black piece into white piece (negative val)
Lfbc1
    tay                             ;        
    lda     ram_D3                  ; Frame counter (low-byte)        
    and     #$1b                    ; This mask get us a random row (0-3) and column (0-3)       
    bit     ram_E2                  ; Get state of the game.       
    bpl     Lfbce                   ; Jump if in middlegame (use full center)      
    and     #$09                    ; This mask get us a random row (0-1) and column (0-1)        
    adc     #$09                    ; Now it is in row (1-2) and column (1-2)
					; Limit to four center squares.
Lfbce
    adc     #$12                    ; Center of board (row offset 2, col offset 2)
					; ........        
					; ........        
					; ..YYYY..        
					; ..YXXY..        
					; ..YXXY..        
					; ..YYYY..        
					; ........        
					; ........        
    tax                             ; Probably to encourage center domination.       
    lda     ram_D5                  ; Get target square.        
    jsr     Lfe9c                   ; Calculate distance between two squares.       
    sta     ram_F4                  ;        
    lda     ram_D4                  ; Get origin square.        
    jsr     Lfe9c                   ; Calculate distance between two squares.       
    sec                             ;        
    sbc     ram_F4                  ;        
    sta     ram_F7                  ;        
    ldx     Lfee3,y                 ;4        
    bne     Lfbeb                   ;2/3 =  39
Lfbe7
    txa                             ;2        
    jmp     Lfbf9                   ;3   =   5
    
Lfbeb
    bpl     Lfbf6                   ;2/3      
    bit     ram_E2                  ; Get state of the game.        
    bmi     Lfbe7                   ; Still in the first movements? Yes, jump.      
    ldx     #$05                    ; 5 times.
Lfbf3
    clc                             ;2        
    adc     ram_F7                  ;3   =   5
Lfbf6
    dex                             ;2        
    bne     Lfbf3                   ;2/3 =   4
Lfbf9
    plp                             ;       
    bcc     Lfc12                   ; Jump if less than 8 moves.     
    ldx     ram_D3                  ; Frame counter (low-byte)
    cpx     #$40                    ;2         *
    bcc     Lfc08                   ;2/3       *
    ldx     ram_D7                  ;3         *
    beq     Lfc08                   ;2/3       *
    sbc     #$32                    ;2   =  20 *
Lfc08
    cpy     #$0e                    ;2         *
    bne     Lfc11                   ;2/3       *
    ldy     ram_CB                  ;3         *
    sbc     Lfef2,y                 ;4   =  11 *
Lfc11
    sec                             ;2   =   2 *
Lfc12
    sta     ram_F8                  ;3        
    ldx     ram_D4                  ; Get origin square.        
    bcs     Lfc3f                   ;2/3      
    cpx     #$0d                    ;2        
    bcs     Lfc3f                   ;2/3      
    lda     Lfec6,x                 ;4        
    bit     ram_B9                  ;3        
    bpl     Lfc27                   ;2/3      
    lsr                             ;2         *
    lsr                             ;2         *
    lsr                             ;2         *
    lsr                             ;2   =  29 *
Lfc27
    and     #$0f                    ;2        
    bit     ram_D3                  ; Frame counter (low-byte)        
    ldy     ram_D5                  ; Get target square.        
    cpy     #$1a                    ;2        
    bcc     Lfc3d                   ;2/3      
    beq     Lfc34                   ;2/3      
    clv                             ;2   =  16
Lfc34
    ldy     ram_E4                  ; Get count of half-moves.        
    bne     Lfc3d                   ; Jump if non-zero.      
    bvc     Lfc3c                   ;2/3      
    adc     #$10                    ;2   =   9
Lfc3c
    asl                             ;2   =   2
Lfc3d
    adc     ram_F8                  ;3   =   3
Lfc3f
    ldy     ram_D6                  ; Get current piece.        
    cpy     #$06                    ; Is it pawn?        
    bne     Lfc65                   ; No, jump.      
    cpx     #$10                    ;2        
    bcs     Lfc65                   ;2/3      
    cpx     #$0d                    ;2        
    bcc     Lfc65                   ;2/3      
    pha                             ;3        
    ldx     #$03                    ;2   =  20
Lfc50
    lda     ram_84,x                ;4        
    and     #$0f                    ;2        
    bne     Lfc5a                   ;2/3      
    dex                             ;2         *
    txa                             ;2         *
    bpl     Lfc50                   ;2/3 =  14 *
Lfc5a
    cmp     #$02                    ;2        
    pla                             ;4        
    bit     ram_82                  ;3        
    bvc     Lfc63                   ;2/3      
    bcs     Lfc65                   ;2/3 =  13 *
Lfc63
    sbc     #$0b                    ;2   =   2
Lfc65
    ldx     ram_D5                  ; Get current target square.
Lfc67
    stx     ram_F2                  ;3        
    sta     ram_F8                  ;3        
    lda     #$0f                    ;2        
    sta     ram_F6                  ;3        
    lda     ram_D6                  ; Get current piece.        
    cmp     #$05                    ; Is it rook?        
    bne     Lfc9f                   ; No, jump.      
    txa                             ;
    and     #$07                    ; Extract column.
    tax                             ;
    eor     ram_F2                  ; XOR with original value to get rank.
    cmp     #$30                    ; Reached 2nd rank?
    bne     Lfc82                   ; No, jump.
    lsr                             ; A = $18
    sta     ram_F6                  ;
Lfc82
    txa                             ;
    clc                             ;
    adc     #$08                    ; Go one rank closer to white side.
    tax                             ;
    cpx     #$38                    ; Reached first rank?
    bcs     Lfcd8                   ; Yes, jump.
    lda     ram_80,x                ; Get content of square.
    and     #$0f                    ; Extract piece.
    cpx     ram_F2                  ; 
    eor     #$0e                    ; Is it white pawn?
    bne     Lfc99                   ; No, jump.
    dec     ram_F6                  ; Decrease two points for being blocked.
    dec     ram_F6                  ;
Lfc99
    eor     #$08                    ; Is it black pawn?
    bne     Lfc82                   ; No, continue moving towards white side.
    bcc     Lfcc7                   ;
Lfc9f
    bcc     Lfd1d                   ;
Lfca1
    ldy     #$03                    ;2   =   2
Lfca3
    dey                             ;2        
    bmi     Lfca1                   ;2/3      
    txa                             ;2        
    clc                             ;2        
    adc     Lfed2,y                 ;4        
    tax                             ;2        
    and     #$07                    ;2        
    eor     Lfefb,y                 ;4        
    beq     Lfca3                   ;2/3      
    txa                             ;2        
    ora     ram_F2                  ;3        
    cpx     #$40                    ; Exceeded chessboard?       
    bcs     Lfcc2                   ; Yes, jump.
    lda     ram_80,x                ; Read chessboard.        
    and     #$0f                    ; Extract piece.        
    eor     #$0e                    ; Is it white pawn?        
    bne     Lfca3                   ; No, jump.
Lfcc2
    dec     ram_F6                  ; One point less.        
    tay                             ;2        
    bne     Lfcc9                   ;2/3 =   9
Lfcc7
    sta     ram_F6                  ; Points = 0
Lfcc9
    ldx     ram_E4                  ; Read count of half-moves.        
    cpx     #$04                    ; At least 4 moves made?        
    bcs     Lfcd2                   ; Yes, jump.      
    lda     ram_D7                  ;3        
    asl                             ;2   =  12
Lfcd2
    ldy     ram_D6                  ; Get current piece.        
    cpy     #$06                    ; Is it pawn?        
    beq     Lfd2b                   ; Yes, jump.
Lfcd8
    ldy     #$03                    ; Four directions.
Lfcda
    ldx     ram_F2                  ;3         *
    cpx     ram_D4                  ;3         *
    bne     Lfce6                   ;2/3       *
    cpy     #$02                    ;2         *
    bcc     Lfce6                   ;2/3       *
    ldx     ram_D5                  ; Current target square.
Lfce6
    txa                             ;
    clc                             ;
    adc     Lff7e,y                 ; Add offset for direction.
    tax                             ;
    eor     ram_F2                  ; XOR against base square.
    cmp     #$08                    ; Is it in same row?
    bcc     Lfcf6                   ; Yes, jump.
    and     #$c7                    ; Is it in same column and inside the board?
    bne     Lfd09                   ; No, jump.
Lfcf6
    cpx     ram_D4                  ; Is it at origin square?
    beq     Lfce6                   ; Yes, move again.
    lda     ram_80,x                ; Read square content.
    and     #$0f                    ; Extract piece.
    beq     Lfce6                   ; If empty square then move again.
    tax                             ;
    tya                             ; Get direction (value from 0-3)
    lsr                             ; Make it value 0-1.
    eor     #$05                    ; XOR against $05 ($05 for vert, $04 for horiz).
    cpx     #$05                    ; Square contains a rook?
    beq     Lfd0d                   ; Yes, jump with this score.
Lfd09
    dey                             ; Try another direction.
    tya                             ;
    bpl     Lfcda                   ; Repeat until all four directions are explored.
				; A would exit with a value of $ff (-1)
Lfd0d
    sec                             ;
    adc     ram_F6                  ; Add previous points.
    ldx     ram_D4                  ; Get current source square.
    eor     #$ff                    ; Negate score.
    cpx     ram_F2                  ; Compare against base square.
    beq     Lfd2c                   ; If it is the same, jump.
    eor     #$ff                    ; Negate score.
    jmp     Lfc67                   ; Now try starting from target square.
    
Lfd1d
    lsr                             ;2        
    bne     Lfd28                   ;2/3      
    dex                             ;2        
    dex                             ;2        
    ldy     #$14                    ;2        
    cpx     ram_D4                  ;3        
    beq     Lfd2a                   ;2/3 =  15
Lfd28
    ldy     #$00                    ;2   =   2
Lfd2a
    tya                             ;2   =   2
Lfd2b
    clc                             ;2   =   2
Lfd2c
    adc     ram_F8                  ;3        
    eor     #$80                    ;2        
    sta     ram_F0                  ;3        
    rts                             ;6   =  14
    
	;
	; Move piece.
	; ram_D4 = source square.
	; ram_D5 = target square.
	;
Lfd33
    ldy     ram_D4                  ; Source square.       
    ldx     ram_D5                  ; Target square.
	;
	; Move piece.
	; y = source square.
	; x = target square.
	;
Lfd37
    lda.wy  ram_80,y                ; Read piece from source square.
    and     #$0f                    ; Extract piece.
    sta     ram_E9                  ; Save in temporary.
    eor.wy  ram_80,y                ; XOR against source square (deletes it).
    sta.wy  ram_80,y                ; Update source square.
	;
	; Update square.
	; x = square.
	; ram_E9 = new content ($00-$0f).
	;
Lfd44
    lda     ram_80,x                ; Read target square.
    and     #$f0                    ; Separate useful flags.
    ora     ram_E9                  ; Put piece.
    sta     ram_80,x                ; Update target square.
    rts                             ; Return.
    
	;
	; Check if it has further movements for the piece.
	; Returns:
	;     Carry flag = set = if the current piece is a pawn.
	;                  clear = if the current piece isn't a pawn.
	;
Lfd4d
    ldx     ram_D6                  ; Get current piece.        
    sec                             ;        
    dex                             ; Is it a king?        
    beq     Lfd63                   ; Yes, jump.
    dex                             ;        
    dex                             ;        
    dex                             ; Is it a queen/bishop?        
    bmi     Lfd5d                   ; Yes, jump.      
    dex                             ; Is it a knight?        
    bmi     Lfd63                   ; Yes, jump.
    bne     Lfd64                   ; Jump if it is a pawn.
Lfd5d
    lda     ram_D8                  ;        
    and     #$f8                    ; Pass to next direction.       
    sta     ram_D8                  ;
Lfd63
    clc                             ;
Lfd64
    rts                             ;
    
Lfd65
    lda     Lfed5,y                 ; Get score of origin piece.
    clc                             ;
    ldy     ram_D7                  ; Content of target square.
    adc     Lfed5,y                 ; Add capture score.
    tay                             ;
    lda     ram_DA                  ; Get current score.
    beq     Lfd81                   ; Jump if zero.
    eor     ram_E3                  ; Negate per current side.
    bpl     Lfd81                   ; Jump if positive.
    tya                             ; Move score.
    clc                             ;
    adc     ram_DA                  ; Add current score.
    beq     Lfd90                   ; Jump if zero.
    eor     ram_E3                  ; Negate per current side.
    bpl     Lfd90                   ; Jump if positive.
Lfd81
    lda     ram_E3                  ; Current playing side.        
    asl                             ;        
    tya                             ;        
    bcs     Lfd8b                   ; Jump if white side.      
    eor     #$ff                    ; Negate score.        
    adc     #$01                    ;
Lfd8b
    eor     #$80                    ;        
    cmp     #$7b                    ; Check if less than -5 points        
    ror                             ;
Lfd90
    rts                             ;6   =   6
    
	;
	; Move piece.
	; Recalculate chessboard score.
	; Calculate en passant state.
	; Verify if castling is possible.
	;
Lfd91
    jsr     Lfd33                   ; Move piece.        
    ldx     #$3f                    ; x = $3f to explore the full chessboard.        
    lda     #$04                    ; a = $04     
    sta     ram_CA                  ; Setup as base white material. 
    sta     ram_CC                  ; Setup as base black material.
Lfd9c
    lda     ram_80,x                ; Read square.        
    and     #$cf                    ; Remove bit 4 and 5.
    sta     ram_80,x                ; Store square.
    and     #$0f                    ; Extract piece.        
    cmp     #$08                    ; Comparison to get side in the Carry flag.        
    and     #$07                    ; Extract proper piece.        
    tay                             ; Copy into Y for indexing.        
    lda     Lfedd,y                 ; Get score for piece.       
    bcc     Lfdb6                   ; Jump if black piece.      
    clc                             ;        
    adc     ram_CA                  ; Add to white pieces material.        
    sta     ram_CA                  ;        
    jmp     Lfdbc                   ;
    
Lfdb6
    adc     ram_CC                  ; Add to black pieces material.        
    bcs     Lfdbc                   ; If it overflows then avoid updating.      
    sta     ram_CC                  ;
Lfdbc
    dex                             ; Decrement X.       
    bpl     Lfd9c                   ; Loop until chessboard is fully explored.
					; X is $ff here.
    stx     ram_F7                  ; No king position.       
 
    lda     ram_D6                  ; Get current piece.
    and     #$07                    ; Extract piece.
    cmp     #$06                    ; Piece moved is a pawn?        
    bne     Lfdd6                   ; No, jump.
    ldx     ram_D4                  ; Get source square.     
    txa                             ; 
    sbc     ram_D5                  ; Subtract target square.
    cmp     #$f0                    ; Moves two squares downward?        
    beq     Lfdd8                   ; Yes, jump.
    cmp     #$10                    ; Moves two squares upward?
    beq     Lfdd8                   ; Yes, jump.
Lfdd6
    ldx     #$80                    ; Flag to signal no enpassant.
Lfdd8
    stx     ram_E5                  ; Save.
    ldy     #$03                    ; Y = $03 (counting from 3 to 0)    
    rol     ram_B4                  ;        
    sec                             ; Set bit 7 of ram_B4 (only moves to empty squares)       
    ror     ram_B4                  ;        
    rol     ram_B7                  ;        
    sec                             ; Set bit 7 of ram_B7 (only find piece)        
    ror     ram_B7                  ;
Lfde6
    sty     ram_C1                  ; Save counter.       
    lda     #$bf                    ;        
    and.wy  ram_88,y                ; Erase flag (bit 6) for this movement.        
    sta.wy  ram_88,y                ;        
    ldx     Lff76,y                 ; Get origin square of king.        
    lda     ram_80,x                ; Read square.        
    and     #$0f                    ; Extract piece.
    sta     ram_CD                  ; Save for restoring.       
    eor     ram_80,x                ; Remove from square.       
    sta     ram_80,x                ; Update square.       
    ldx     Lff7a,y                 ; Get target square for castling.        
    stx     ram_C0                  ;         
    tya                             ;        
    lsr                             ; y = $02 or y = $00?        
    bcs     Lfe07                   ; No, jump.      
    dex                             ; x = $01 or x = $39
Lfe07
    asl                             ;          
    adc     #$ff                    ; $03->02 $02-$01 $01-$00 $00-$ff  
    sta     ram_E3                  ;3
				; The king has been removed.
				; All three squares between king and rook should be empty.
    lda     ram_80,x                ; 1st square.        
    ora     ram_81,x                ; 2nd square.
    ora     ram_82,x                ; 3rd square.        
    and     #$0f                    ; All empty?        
    bne     Lfe35                   ; No, jump.      
    ldx     #$fe                    ; Restart movement generator.
    stx     ram_D8                  ;
    stx     ram_D6                  ;
    lda     #$40                    ; Square 64.
    sta     ram_D4                  ; Set as source square to start search.
	;
	; Generate all possible movements to detect if the opponent
	; is attacking the squares where castling would happen.
	;
Lfe20
    jsr     Lfa95                   ; Get next movement.
    ldx     ram_D4                  ; Get source square.
    bmi     Lfe3d                   ; Chessboard fully analyzed? Yes, jump.
    ldx     ram_C0                  ; Target square for castling.
    ldy     #$02                    ; Count three times.
Lfe2b
    cpx     ram_D5                  ; Is it same as target square?
    beq     Lfe35                   ; Yes, jump.
    inx                             ; Next square.
    dey                             ; Decrement counter.
    bpl     Lfe2b                   ; Repeat.
    bmi     Lfe20                   ; Generate more movements.
Lfe35
    ldx     ram_C1                  ; Get counter.      
    lda     ram_88,x                ;        
    ora     #$40                    ; Set flag (bit 6) for this movement.
    sta     ram_88,x                ;
Lfe3d
    ldy     ram_C1                  ;
    ldx     Lff76,y                 ; Get square of king.      
    jsr     Lfe66                   ; Restore chessboard square with ram_CD content.       
    dey                             ; Decrement Y.        
    bpl     Lfde6                   ; Try the other squares.

    jsr     Lf1dc                   ; Copy data of player movement to current area.
	;
	; Detect if any king or rook has moved.
	; To mark as unavailable for castling.
	;
Lfe4b
    ldx     #$05                    ; 6 important squares.
Lfe4d
    lda     Lfefa,x                 ; Important square.        
    cmp     ram_D4                  ; Something moves from there?        
    beq     Lfe58                   ; Yes, jump.      
    cmp     ram_D5                  ; Something moves into?        
    bne     Lfe5e                   ; No, jump.
Lfe58
    lda     #$40                    ;
    ora     ram_82,x                ; Set bit 6.
    sta     ram_82,x                ;
Lfe5e
    dex                             ;2        
    bpl     Lfe4d                   ;2/3      
    rts                             ;6   =  10
    
	; Erase chessboard square.
	; x = square.
Lfe62
    lda     #$00                    ;2   =   2
	; Write chessboard square.
	; x = square.
	; a = piece ($00-$0f).
Lfe64
    sta     ram_CD                  ;3   =   3
	; Write chessboard square.
	; x = square.
	; ram_CD = piece ($00-$0f).
Lfe66
    lda     ram_80,x                ;4        
    and     #$f0                    ;2        
    ora     ram_CD                  ;3        
    sta     ram_80,x                ;4        
    rts                             ;6   =  19
    
Lfe6f
    lda     #$09                    ; A = $09 White king.
	;
	; Search for the king
	; Input:
	; 	A = King code ($01 for black king, $09 for white king)
	; Output:
	;       X = Current square of the king.
	; Notes:
	;       Y is unaffected.
	;
Lfe71
    sta     ram_CC                  ; Save king to search.     
    ldx     ram_D4                  ; Get source square.
    eor     ram_80,x                ; XOR with square.
    ldx     ram_D5                  ; Get target square.
    and     #$0f                    ; Extract piece code.
    beq     Lfe9b                   ; If zero it is moving king, so return with
					; target square as king position.
	;
	; Search for the king
	; Input:
	;	A = King code (it only can be $09 for white king)
	; Output:
	;	X = Current square of the king.
	;	V flag = Set = King alone. Clear = King with pieces.
Lfe7d
    lda     #$ff                    ; $ff = King not found.        
    sta     ram_CD                  ; Save as king's square number.
    bit     ram_CD                  ; This sets the overflow flag.
    ldx     #$3f                    ; Point to square 63.
Lfe85
    lda     ram_80,x                ; Read the current square.        
    and     #$0f                    ; Extract piece code.        
    beq     Lfe96                   ; Empty square? Yes, jump.
    cmp     ram_CC                  ; Found the king?   
    bne     Lfe93                   ; No, jump.
    stx     ram_CD                  ; Yes, save the square number.        
    beq     Lfe96                   ; Keep searching ???
Lfe93
    bcc     Lfe96                   ; Less than? Yes, jump.
    clv                             ; Clear overflow flag because king isn't alone.
Lfe96
    dex                             ; Next square to read.        
    bpl     Lfe85                   ; Continue until completed.
    ldx     ram_CD                  ; Load square number into X.
Lfe9b
    rts                             ; Return.
    
	;
	; Calculate distance between two squares.
	; Input:
	;	A = 1st square.
	;	X = 2nd square.
	; Output:
	;	A = Distance in squares (L-shaped).
	; Notes:
	;	X and Y both are unaffected.
	;
Lfe9c
    sta     ram_CC                  ; Save square number.       
    and     #$07                    ; Extract column.
    sta     ram_CB                  ; Save.        
    eor     ram_CC                  ; Remove column to get only row.   
    sta     ram_CC                  ; Save.
    txa                             ;        
    and     #$07                    ; Extract column.        
    sec                             ;        
    sbc     ram_CB                  ; Get difference between the 1st column.        
    bpl     Lfeb2                   ; Jump if positive.      
    eor     #$ff                    ; Negation.
    adc     #$01                    ;
Lfeb2
    sta     ram_CD                  ; Save current distance.        
    txa                             ;         
    and     #$38                    ; Extract row.        
    sec                             ;        
    sbc     ram_CC                  ; Get difference between the 1st row.        
    bpl     Lfec0                   ; Jump if positive.
    eor     #$ff                    ; Negation.
    adc     #$01                    ;
Lfec0
    lsr                             ; Divide by 2        
    lsr                             ; Divide by 4
    lsr                             ; Divide by 8
    adc     ram_CD                  ; Add to current distance.
    rts                             ; Return.
    
Lfec6
    .byte   $00                             ; $fec6 (*)
    .byte   $5e,$85,$00,$00                 ; $fec7 (D)
    .byte   $75                             ; $fecb (*)
    .byte   $e4                             ; $fecc (D)
    .byte   $00                             ; $fecd (*)
    .byte   $44,$33,$65,$fd                 ; $fece (D)
Lfed2
    .byte   $ff,$02,$07                     ; $fed2 (D)

	; Scores for each piece (used when index is $00-$0f)
Lfed5
    .byte   $00                             ; $fed5 (D)
    .byte   $be                             ; $fed6 (*)
    .byte   $e5,$f7,$f7                     ; $fed7 (D)
    .byte   $f1                             ; $feda (*)
    .byte   $fd                             ; $fedb (D)
    .byte   $00                             ; $fedc (*)

	; Positive scores for each piece (also uses $fee3)
Lfedd
    .byte   $00,$42,$1b,$09,$09,$0f         
Lfee3
    .byte   $03,$f8,$00,$02,$04             ; $fee3 (D)
    .byte   $f0                             ; $fee8 (*)
Lfee9
    .byte   $01                             ; $fee9 (D)
    .byte   $00,$00,$ff,$02,$03,$04,$00,$03 ; $feea (*)
	; Board initialization
Lfef2
    .byte   $05,$04,$03,$02,$01,$03,$04,$05 ; $fef2 (D)
	; Squares containing rooks and king (for castling unavailability).
Lfefa
    .byte   $04                             ; $fefa (D)
Lfefb
    .byte   $3c,$00,$07,$38,$3f             ; $fefb (D)
    
	;
	; All graphics for chess pieces are aligned at a 256-byte boundary.
	;
Lff00
    .byte   %00000000 ; |        |            $ff00 (G)
    .byte   %00000000 ; |        |            $ff01 (G)
    .byte   %00000000 ; |        |            $ff02 (G)
    .byte   %00000000 ; |        |            $ff03 (G)
    .byte   %00000000 ; |        |            $ff04 (G)
    .byte   %00000000 ; |        |            $ff05 (G)
    
    .byte   $00,$00                         ; $ff06 (*)
    
    .byte   %11111110 ; |####### |            $ff08 (G)
    .byte   %11111110 ; |####### |            $ff09 (G)
    .byte   %11010110 ; |## # ## |            $ff0a (G)
    .byte   %10010010 ; |#  #  # |            $ff0b (G)
    .byte   %00111000 ; |  ###   |            $ff0c (G)
    .byte   %00010000 ; |   #    |            $ff0d (G)
    
    .byte   $00,$00                         ; $ff0e (*)
    
    .byte   %11111110 ; |####### |            $ff10 (G)
    .byte   %00111000 ; |  ###   |            $ff11 (G)
    .byte   %00111000 ; |  ###   |            $ff12 (G)
    .byte   %11111110 ; |####### |            $ff13 (G)
    .byte   %01101100 ; | ## ##  |            $ff14 (G)
    .byte   %10101010 ; |# # # # |            $ff15 (G)
    
    .byte   $00,$00                         ; $ff16 (*)
    
    .byte   %01111100 ; | #####  |            $ff18 (G)
    .byte   %00111000 ; |  ###   |            $ff19 (G)
    .byte   %00111000 ; |  ###   |            $ff1a (G)
    .byte   %01111100 ; | #####  |            $ff1b (G)
    .byte   %00111000 ; |  ###   |            $ff1c (G)
    .byte   %00010000 ; |   #    |            $ff1d (G)
    
    .byte   $00,$00                         ; $ff1e (*)
    
    .byte   %11111000 ; |#####   |            $ff20 (G)
    .byte   %01110000 ; | ###    |            $ff21 (G)
    .byte   %01101100 ; | ## ##  |            $ff22 (G)
    .byte   %01111110 ; | ###### |            $ff23 (G)
    .byte   %01110100 ; | ### #  |            $ff24 (G)
    .byte   %00111000 ; |  ###   |            $ff25 (G)
    
    .byte   $00,$00                         ; $ff26 (*)
    
    .byte   %01111100 ; | #####  |            $ff28 (G)
    .byte   %01111100 ; | #####  |            $ff29 (G)
    .byte   %01111100 ; | #####  |            $ff2a (G)
    .byte   %01111100 ; | #####  |            $ff2b (G)
    .byte   %01010100 ; | # # #  |            $ff2c (G)
    .byte   %01010100 ; | # # #  |            $ff2d (G)
    
    .byte   $00,$00                         ; $ff2e (*)
    
    .byte   %00111000 ; |  ###   |            $ff30 (G)
    .byte   %00010000 ; |   #    |            $ff31 (G)
    .byte   %00111000 ; |  ###   |            $ff32 (G)
    .byte   %00010000 ; |   #    |            $ff33 (G)
    .byte   %00000000 ; |        |            $ff34 (G)
    .byte   %00000000 ; |        |            $ff35 (G)
    
    .byte   $00,$00                         ; $ff36 (*)
    
    .byte   %00010000 ; |   #    |            $ff38 (G)
    .byte   %00111000 ; |  ###   |            $ff39 (G)
    .byte   %10010010 ; |#  #  # |            $ff3a (G)
    .byte   %11010110 ; |## # ## |            $ff3b (G)
    .byte   %11111110 ; |####### |            $ff3c (G)
    
    .byte   $fe,$00,$00                     ; $ff3d (*)
    
    .byte   %11000110 ; |##   ## |            $ff40 (G)
    .byte   %01101100 ; | ## ##  |            $ff41 (G)
    .byte   %00111000 ; |  ###   |            $ff42 (G)
    .byte   %01101100 ; | ## ##  |            $ff43 (G)
    .byte   %11000110 ; |##   ## |            $ff44 (G)
    .byte   %00000000 ; |        |            $ff45 (G)
    .byte   %00110000 ; |  ##    |            $ff46 (G)
    .byte   %00110000 ; |  ##    |            $ff47 (G)
    .byte   %00110000 ; |  ##    |            $ff48 (G)
    .byte   %00110000 ; |  ##    |            $ff49 (G)
    .byte   %00110000 ; |  ##    |            $ff4a (G)
    
    .byte   $fc,$c0,$fc,$0c,$fc,$fc,$0c,$3c ; $ff4b (*)
    .byte   $0c,$fc,$0c,$0c,$fc,$cc,$cc,$fc ; $ff53 (*)
    .byte   $0c,$fc,$c0,$fc,$fc,$cc,$fc,$c0 ; $ff5b (*)
    .byte   $fc,$30,$30,$18,$0c,$fc,$fc,$cc ; $ff63 (*)
    .byte   $fc,$cc,$fc                     ; $ff6b (*)
Lff6e
    .byte   $06,$08,$0e,$00                 ; Black&White
    .byte   $82,$84,$8e,$26                 ; Color

	; Start squares for black king and white king.
Lff76
    .byte   $04,$04,$3c,$3c                 ; $ff76 (D)

	; Start squares for empty square revision for castling.
Lff7a
    .byte   $02,$04,$3a,$3c                 ; $ff7a (D)

	; Four-direction table.
Lff7e
    .byte   $f8,$08,$ff,$01                 ; $ff7e (D)

	;
	; Movement table.
	; Instead of having an extra variable for the current square,
	; it is a X-ray table, it stops moving once it reaches a non-valid square,
	; and aligns to the next 8-byte frontier.
	;
Lff82
    .byte   $09,$10,$99,$11,$91,$01,$90,$89 ; $ff82 (D)
    .byte   $02,$98,$92,$93,$94,$95         ; $ff8a (*)
    .byte   $96,$97,$98,$99                 ; $ff90 (D)
    .byte   $08,$07,$06                     ; $ff94 (*)
    .byte   $05,$04,$03,$02,$01             ; $ff97 (D)
    .byte   $80,$70,$60,$50,$40             ; $ff9c (*)
    .byte   $30,$20,$10                     ; $ffa1 (D)
    .byte   $20,$30,$40,$50,$60             ; $ffa4 (*)
    .byte   $70,$80,$90                     ; $ffa9 (D)
    .byte   $28,$37                         ; $ffac (*)
    .byte   $46,$55,$64,$73,$82,$91         ; $ffae (D)
    .byte   $12,$23                         ; $ffb4 (*)
    .byte   $34,$45,$56,$67,$78,$89         ; $ffb6 (D)
    .byte   $88,$77                         ; $ffbc (*)
    .byte   $66,$55,$44,$33,$22,$11         ; $ffbe (D)
    .byte   $72,$63                         ; $ffc4 (*)
    .byte   $54,$45,$36,$27,$18,$09,$12,$21 ; $ffc6 (D)
    .byte   $08,$19,$88,$79,$81,$92,$20,$80 ; $ffce (D)
    .byte   $10,$90,$09,$91,$11,$89         ; $ffd6 (D)
    .byte   $09,$91,$11,$89,$00,$00,$10,$90 ; $ffdc (*)
    .byte   $09,$91,$11,$89                 ; $ffe4 (*)
    .byte   $ff                             ; $ffe8 (*)

	;
	; This is the base position into the movement table.
	; It is added with the value in the following table.
	;
Lffe9
    .byte   $00		; King.
    .byte   $0a		; Queen.
    .byte   $2a		; Bishop.
    .byte   $4a		; Knight.
    .byte   $0a		; Rook.
    .byte   $52		; Pawn.

	; The value of this table is copied into ram_d8
	; It is a counter of possible squares that can be reached.
Lffef
    .byte   $08		; King.
    .byte   $40		; Queen.
    .byte   $20		; Bishop.
    .byte   $08		; Knight.
    .byte   $20		; Rook.
    .byte   $0c     	; Pawn.

Lfff5
    .byte   $02         ; Game 1
    .byte   $12		; Game 2
    .byte   $13		; Game 3
    .byte   $23		; Game 4
    .byte   $24		; Game 5
    .byte   $34		; Game 6
    .byte   $56         ; Game 7
			; Game 8 uses byte $00 from $fffc (easiest game).
    .word   Lf000
    .word   Lf000
