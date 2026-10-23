; Game details
; ------------
; (from https://www.atarimania.com/games/atari-2600-games-breakout-7238)
; Genre: Arcade - Breakout / Pong / Circus
; Controls: Paddles
; Players: 1 / 2 (alt.) / 2+
; Programmer(s): Stewart, Brad
; Format: NTSC
; Year: 1978
; Publisher: Atari
; Country: USA
; Serial: CX2622

; Disassembly of Breakout ~ Breakaway IV (Japan, USA) (En).a26
; Disassembled Fri Oct 23 13:37:27 2026
; Using DiStella v3.02-SNAPSHOT
;
; Command Line: D:\temp\Breakout ~ Breakaway IV (Japan, USA) (En)\distella.exe -pafsbcbreakout.cfg Breakout ~ Breakaway IV (Japan, USA) (En).a26

; breakout.cfg contents:
;
;      ORG F000
;      CODE F000 F002
;      DATA F0FE F0FF
;      GFX F100 F131
;      CODE F1C6 F1E0
;      GFX F200 F236
;      DATA F782 F7FF

; BREAKOUT / BREAKAWAY IV -- annotated 2 KiB Atari VCS disassembly
; =====================================================================
; Hardware reference: Steve Wright, Stella Programmer's Guide (1979),
; HTML transcription: https://alienbill.com/2600/101/docs/stella.html
; References below use its section titles, not PDF page numbers.
; Especially useful: Television Protocol; TIA sections 5-12; PIA
; sections 2-5; TIA 1A section 6.D/E (delayed graphics latches).
; DiStella options/config: https://github.com/johnkharvey/distella
;
; This is a reverse-engineered listing, not original Atari source.
; Hardware descriptions follow the guide; game-variable and routine names
; are inferred from this ROM. Uncertain interpretations are marked.
; Original numeric branch labels and most RAM operands are retained so
; addresses can be compared with the unannotated breakout.raw.asm.
;
; ROM: Breakout ~ Breakaway IV (Japan, USA) (En).a26, 2048 bytes
; SHA256: 376323F051C3C373C887FD83ABEAD39D87D844FF283D435F4ADDBFC1710C6FD5
; No bank switching. ORG $F000 covers one copy of the 2 KiB ROM;
; $F800-$FFFF is its mirror. Thus CPU reset $FFFC reads ROM $F7FC,
; and the BRK vector at $FFFE reads $F7FE.
;
; Regenerate a clean listing (PowerShell, run in this directory):
;   .\distella.exe -pafsbcbreakout.cfg `
;     "Breakout ~ Breakaway IV (Japan, USA) (En).a26" |
;     Set-Content -Encoding ascii breakout.generated.asm
; Do not redirect over this manually annotated file.
; Reassemble with DASM: dasm breakout.asm -f3 -obreakout.rebuilt.a26
;
; READING THIS LISTING
; DiStella's trailing ;2, ;3, ... are base CPU cycles, not cumulative
; raster positions. Taken branches/page crossings can add cycles; WSYNC
; also stalls the CPU. Do not insert instructions into the visible kernel.
; The guide's Television Protocol describes 76 CPU cycles per scanline,
; 160 visible color clocks, and a typical NTSC 262-line frame. Those are
; hardware/reference timings, not a claim of a measured ROM frame trace.
;
; DISPLAY STRATEGY
; P0/P1 draw paddle bats; M0/M1 form side boundaries; BL is the moving
; ball; PF0/PF1/PF2 draw score, top boundary, and six colored brick rows.
; The brick kernel rewrites PF registers mid-line for asymmetric halves,
; rather than relying on one repeated/reflected 20-bit playfield.
; Paddle RC timing is sampled during drawing, not via the RIOT timer.
; Collisions latched during one display are handled in the next blank.
;
; FRAME FLOW
; $F25E: timed post-display work: digits, sound, palette.
; $F33A: wait; blank/dump paddles; emit three VSYNC lines.
; $F36B: reset/select, serve, collisions, physics, object positioning.
; $F611: wait; clear collisions; HMOVE; release VBLANK/paddle dump.
; $F623 onward: score, top boundary, brick field, paddles; back to $F25E.
;
; INFERRED RAM MAP (RIOT RAM $80-$FF; stack shares this physical RAM)
; $80-$A3  36 brick bytes: six rows in each of six PF register columns.
;          $9E/$98/$92 = left PF0/PF1/PF2 bases;
;          $8C/$86/$80 = right PF0/PF1/PF2 bases (row index 5 down to 0).
; $A4-$B1  packed bit stream used while exchanging/reformatting brick
;          state between turns; exact representation not fully decoded.
; $B2      selection index 0..47: 12 mode groups x 4 configurations.
;          Display shows ($B2 >> 2)+1 and ($B2 & 3)+1 separately.
; $B3      variation flags: $80 timed scoring, $40 visibility effect,
;          $20 breakthrough (no brick bounce), $10 paddle influence,
;          $08 held/caught-ball behavior, as tested in code.
; $B4      active-play flag (bit 7); $EE enables score/play display.
; $B5      current player/turn 0 or 1; $B6 sampled paddle input 0..3.
; $B7/$B8  paddle graphics pattern / second-paddle visibility mask.
; $B9      remaining ball counter; $BA low two variation bits.
; $BB-$BD  scratch; $BD also background color before scratch reuse.
; $BE/$BF  paddle colors; $C0-$C5 brick-row colors.
; $C6      paddle capacitor timing sample (vertical kernel count).
; $C7      six-byte column countdown for brick-state conversion.
; $C8/$C9  paddle horizontal positions; $CA/$CB packed-stream bit/index.
; $CC/$CD  current score, packed BCD high/low; $CE/$CF other score.
; $D0-$D9  five little-endian digit pointers (5 bytes per glyph).
; $DA/$DB  frame counter and slow/inactivity counter.
; $DC      SELECT repeat/debounce state; $DD attract palette phase.
; $DE      brick-state operation: low 6 bits count; $80 active, $40 fill
;          wall when finished ($E4 initialize, $A4 exchange, $C0 refill).
; $DF      sound state: high 2 bits select effect, low 6 count duration.
; $E0      brick-hit pitch; $E1 top-hit/small-paddle flag (bit 7).
; $E3/$E4  ball X integer/fraction; $E5/$E6 ball Y integer/fraction.
; $E7/$E8  signed Y velocity integer/fraction, ADDED to ball Y.
; $E9/$EA  signed X velocity integer/fraction, SUBTRACTED from ball X.
; $EB      bounce/speed state: low 6 bits speed, $40 paddle latch,
;          $80 brick latch (cleared on top-boundary handling).
; $EC      paddle impact-center offset; $ED velocity-table angle offset.
; $EF-$F4  mutable brick-row repeat counters (initialized to 2).
; $F5/$F6  previous paddle positions for optional ball influence.
; $F7      brick-state conversion descriptor index.
;
; SPECIAL TECHNIQUES
; BRK + padding byte calls $F1C6 using IRQ/BRK vector, returning by RTI.
; The apparent NOP after each BRK is skipped padding, not executed.
; In the visible kernel SP=$1F sends PHP's write to $011F, a TIA mirror
; of ENABL. The status Z flag is bit 1, exactly the ball-enable bit!
; PLA then balances SP; it is not a meaningful saved-status read.
; Ordinary subroutine/BRK calls use the RAM-backed stack, not SP=$1F.

      processor 6502
; TIA write registers: see guide, Write Address Detailed Functions.
VSYNC   =  $00       ; D1 = vertical sync.
VBLANK  =  $01       ; D1 blank picture; D7 dump paddle capacitors.
WSYNC   =  $02       ; Strobe: wait until next horizontal blank.
NUSIZ0  =  $04       ; P0 size/copies and M0 width.
NUSIZ1  =  $05       ; P1 size/copies and M1 width.
COLUP0  =  $06       ; P0/M0 color and luminance.
COLUP1  =  $07       ; P1/M1 color and luminance.
COLUPF  =  $08       ; Playfield AND ball color.
COLUBK  =  $09       ; Background color.
CTRLPF  =  $0A       ; D0 reflection, D1 score, D2 priority, D4-5 BL width.
PF0     =  $0D       ; Leftmost 4 PF bits, stored in D4-D7.
PF1     =  $0E       ; Next 8 PF bits, emitted D7 first.
PF2     =  $0F       ; Last 8 PF bits, emitted D0 first.
RESP0   =  $10       ; Indexed +0..4: reset P0, P1, M0, M1, BL position.
AUDC0   =  $15       ; Channel 0 waveform/noise selector (low 4 bits).
AUDF0   =  $17       ; Channel 0 frequency divider (low 5 bits).
AUDV0   =  $19       ; Channel 0 volume 0..15.
GRP0    =  $1B       ; Eight horizontal bits for player/paddle 0.
GRP1    =  $1C       ; Eight horizontal bits for player/paddle 1.
ENAM0   =  $1D       ; D1 enables missile 0 (side boundary).
ENAM1   =  $1E       ; D1 enables missile 1 (side boundary).
ENABL   =  $1F       ; D1 enables ball; PHP exploits its stack mirror.
HMP0    =  $20       ; Indexed +0..4: P0/P1/M0/M1/BL motion high nibble.
VDELBL  =  $27       ; D0 selects delayed ball enable latch.
HMOVE   =  $2A       ; Strobe: apply all five horizontal motion values.
HMCLR   =  $2B       ; Strobe: clear all five motion values.
CXCLR   =  $2C       ; Strobe: clear all collision latches.
; TIA reads have a DIFFERENT map than writes. $30-$3F mirror $00-$0F.
; Preserve the actual mirror addresses encoded in the original ROM.
CXP0FB  =  $32       ; D7 P0/PF; D6 P0/BL (paddle 0/ball).
CXP1FB  =  $33       ; D7 P1/PF; D6 P1/BL (paddle 1/ball).
CXM0FB  =  $34       ; D7 M0/PF; D6 M0/BL (right boundary/ball).
CXM1FB  =  $35       ; D7 M1/PF; D6 M1/BL (left boundary/ball).
CXBLPF  =  $36       ; D7 BL/PF (ball/bricks or top boundary).
INPT0   =  $38       ; D7 capacitor comparator; +0..3 selects paddle.
; RIOT/6532: guide, The PIA, Interval Timer and I/O ports.
SWCHA   =  $0280     ; Paddle buttons active low: D7,D6,D3,D2.
SWCHB   =  $0282     ; D0 RESET, D1 SELECT, D3 color; D6/D7 difficulty.
INTIM   =  $0284     ; Read interval timer count.
TIM64T  =  $0296     ; Write timer, decrement every 64 CPU clocks.

       ORG $F000
       JMP    LF237   ;3
; Five 3-bit-wide decimal glyphs, five rows each, doubled vertically.
; Guide: Playfield; PF register bit ordering; Television Protocol.
; Y counts glyph rows 4..0 (font stored bottom-to-top), X scanlines.
; Mid-line PF1/PF2 changes place later digits in the right half.
DrawScore:
LF003: LDY    #$04    ;2
LF005: STY    WSYNC   ;3
       LDA    ($D0),Y ;5
       AND    #$0F    ;2
       AND    $EE     ;3  Hide this score digit outside play.
       STA    PF1     ;3
       LDA    ($D2),Y ;5
       AND    #$0F    ;2
       STA    $BB     ;3
       LDA    ($D4),Y ;5
       AND    #$F0    ;2
       ORA    $BB     ;3
       STA    PF2     ;3
       LDA    ($D6),Y ;5
       AND    #$F0    ;2
       AND    $EE     ;3
       STA    PF1     ;3  Replace PF1 before right-half serialization.
       LDA    ($D8),Y ;5
       AND    #$0F    ;2
       STA    PF2     ;3
       INX            ;2
       TXA            ;2
       AND    #$01    ;2
       BNE    LF005   ;2  Repeat each font row for two scanlines.
       DEY            ;2
       BPL    LF005   ;2
       STY    $BB     ;3
       TXA            ;2
       TAY            ;2
       LDX    $BB     ;3
       RTS            ;6

; Draw all six brick bands, then the lower court and paddle band.
; Guide: Playfield, Ball Graphics, Dumped Input Ports.
DrawBricks:
LF03B: LDX    #$1F    ;2
       TXS            ;2  Stack writes now hit TIA, not RIOT RAM!
       LDX    #$05    ;2
LF040: SEC            ;2
       TYA            ;2
       SBC    $E5     ;3  Raster Y minus ball Y.
       AND    #$FC    ;2  Z=1 for a four-unit-high ball band.
       STA    WSYNC   ;3
       PHP            ;3  Status D1=Z -> $011F mirror of ENABL.
       LDA    $C0,X   ;4
       STA    COLUPF  ;3  Row color also colors ball (shared register).
       LDA    $9E,X   ;4
       STA    PF0     ;3
       LDA    $98,X   ;4
       STA    PF1     ;3
       LDA    $92,X   ;4
       STA    PF2     ;3
       LDA    $8C,X   ;4  Second half's independently stored PF pattern.
       STA    PF0     ;3
       LDA    $86,X   ;4
       STA    PF1     ;3
       LDA    $80,X   ;4
       STA    PF2     ;3
       LDA    $9E,X   ;4
       STA    PF0     ;3
       LDA    $98,X   ;4
       STA    PF1     ;3
       STX    $BB     ;3
       LDX    $B6     ;3
       LDA    INPT0,X ;4  Read selected paddle capacitor, D7 only.
       BPL    LF078   ;2
       NOP            ;2
       BMI    LF07A   ;2
LF078: STY    $C6     ;3  Last kernel Y while capacitor is still low.
LF07A: LDX    $BB     ;3
       LDA    #$00    ;2
       STA    GRP1    ;3  Also copies ENABL into delayed-ball latch.
       LDA    $92,X   ;4
       STA    PF2     ;3
       PLA            ;4  Balance PHP; read value deliberately discarded.
       INY            ;2
       INY            ;2
       LDA    $8C,X   ;4
       STA    PF0     ;3
       LDA    $86,X   ;4
       STA    PF1     ;3
       LDA    $80,X   ;4
       STA    PF2     ;3
       DEC    $EF,X   ;6  Each brick row repeats three two-line passes.
       BPL    LF040   ;2
       DEX            ;2
       BPL    LF040   ;2
       LDX    #$32    ;2  Continue through lower court/paddle region.
       LDA    #$00    ;2
       STA    PF0     ;3
       STA    PF1     ;3
       STA    PF2     ;3
       LDA    $BE     ;3
       STA    COLUPF  ;3
       BEQ    LF0B3   ;2
; Shared two-scanline court loop. Entered with different X counts for
; the top boundary, gap, and bottom court. No JSR while SP is in TIA.
DrawCourt:
LF0AA: STX    $BB     ;3
       LDX    #$1F    ;2
       TXS            ;2
       LDX    $BB     ;3
LF0B1: STA    WSYNC   ;3
LF0B3: TYA            ;2
       SEC            ;2
       SBC    $E5     ;3
       AND    #$FC    ;2
       PHP            ;3  Ball enable from Z, as in brick kernel.
       PLA            ;4  Restore stack pointer, not processor flags.
       STX    $BB     ;3
       LDX    $B6     ;3
       LDA    INPT0,X ;4
       BMI    LF0C5   ;2
       STY    $C6     ;3
LF0C5: LDX    $BB     ;3
       TYA            ;2
       AND    #$FC    ;2
       CMP    #$B4    ;2  Paddle band when (raster Y & $FC) == $B4.
       BEQ    LF0D6   ;2
       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    GRP0    ;3
       BEQ    LF0E6   ;2
LF0D6: LDA    $BE     ;3
       STA    WSYNC   ;3
       STA    COLUP0  ;3
       LDA    $BF     ;3
       STA    COLUP1  ;3
       LDA    $B7     ;3
       STA    GRP0    ;3  Bat shape from difficulty/top-hit lookup.
       AND    $B8     ;3  Second bat only when variation enables it.
LF0E6: STA    GRP1    ;3  Also clocks the delayed ENABL latch.
       INY            ;2
       INY            ;2
       DEX            ;2
       BPL    LF0B1   ;2
       LDX    #$FD    ;2
       TXS            ;2  Recover caller return address in RAM stack.
       RTS            ;6

; Repeated-subtraction division: A / $BB -> quotient Y, remainder A.
; Uses a signed BPL comparison: intended for the small values here,
; not a general-purpose unsigned 8-bit divider.
DivideSmall:
LF0F1: LDY    #$00    ;2
       BEQ    LF0F9   ;2
LF0F5: INY            ;2
       SEC            ;2
       SBC    $BB     ;3
LF0F9: CMP    $BB     ;3
       BPL    LF0F5   ;2
       RTS            ;6

; Each player can serve with its button on either controller port:
; player 0 mask D7|D3; player 1 mask D6|D2 (active-low at SWCHA).
PaddleButtonMasks:
LF0FE: .byte $88,$44
; Digits 0..9, five rows each. Both nibbles carry the same three-bit
; glyph. DrawScore masks whichever nibble the PF slot requires.
; GFX comments show stored bits, not final PF pixel order; Y runs down.
DigitFontShift0:
       .byte $77 ; | XXX XXX| $F100
       .byte $55 ; | X X X X| $F101
       .byte $55 ; | X X X X| $F102
       .byte $55 ; | X X X X| $F103
       .byte $77 ; | XXX XXX| $F104
       .byte $22 ; |  X   X | $F105
       .byte $22 ; |  X   X | $F106
       .byte $22 ; |  X   X | $F107
       .byte $22 ; |  X   X | $F108
       .byte $22 ; |  X   X | $F109
       .byte $77 ; | XXX XXX| $F10A
       .byte $44 ; | X   X  | $F10B
       .byte $77 ; | XXX XXX| $F10C
       .byte $11 ; |   X   X| $F10D
       .byte $77 ; | XXX XXX| $F10E
       .byte $77 ; | XXX XXX| $F10F
       .byte $11 ; |   X   X| $F110
       .byte $33 ; |  XX  XX| $F111
       .byte $11 ; |   X   X| $F112
       .byte $77 ; | XXX XXX| $F113
       .byte $11 ; |   X   X| $F114
       .byte $11 ; |   X   X| $F115
       .byte $77 ; | XXX XXX| $F116
       .byte $55 ; | X X X X| $F117
       .byte $55 ; | X X X X| $F118
       .byte $77 ; | XXX XXX| $F119
       .byte $11 ; |   X   X| $F11A
       .byte $77 ; | XXX XXX| $F11B
       .byte $44 ; | X   X  | $F11C
       .byte $77 ; | XXX XXX| $F11D
       .byte $77 ; | XXX XXX| $F11E
       .byte $55 ; | X X X X| $F11F
       .byte $77 ; | XXX XXX| $F120
       .byte $44 ; | X   X  | $F121
       .byte $44 ; | X   X  | $F122
       .byte $11 ; |   X   X| $F123
       .byte $11 ; |   X   X| $F124
       .byte $11 ; |   X   X| $F125
       .byte $11 ; |   X   X| $F126
       .byte $77 ; | XXX XXX| $F127
       .byte $77 ; | XXX XXX| $F128
       .byte $55 ; | X X X X| $F129
       .byte $77 ; | XXX XXX| $F12A
       .byte $55 ; | X X X X| $F12B
       .byte $77 ; | XXX XXX| $F12C
       .byte $11 ; |   X   X| $F12D
       .byte $11 ; |   X   X| $F12E
       .byte $77 ; | XXX XXX| $F12F
       .byte $55 ; | X X X X| $F130
       .byte $77 ; | XXX XXX| $F131
; Incrementally exchange/reformat the live brick bitmap and packed
; backing stream. The descriptor selects nibble swaps/rotation direction;
; carry transports individual bits through $F76E. One byte per frame.
; This is not ordinary ball movement; exact packed format is inferred.
StepBrickState:
LF132: LDA    $DE     ;3
       AND    #$3F    ;2
       BEQ    LF1A1   ;2
       TAX            ;2
       LDY    $F7     ;3
       LDA    LF7D0,Y ;4
       STA    $BC     ;3
       DEX            ;2
       AND    #$0F    ;2
       TAY            ;2
       LDA    $80,X   ;4
       ROL    $BC     ;5
       BCC    LF14D   ;2
       JSR    LF67F   ;6
LF14D: ROL    $BC     ;5
       BCC    LF161   ;2
LF151: ROL            ;2
       JSR    LF76E   ;6
       AND    #$FE    ;2
       BCC    LF15B   ;2
       ORA    #$01    ;2
LF15B: ROL            ;2
       DEY            ;2
       BNE    LF151   ;2
       BEQ    LF16F   ;2
LF161: ROR            ;2
       JSR    LF76E   ;6
       AND    #$7F    ;2
       BCC    LF16B   ;2
       ORA    #$80    ;2
LF16B: ROR            ;2
       DEY            ;2
       BNE    LF161   ;2
LF16F: ROL    $BC     ;5
       BCC    LF175   ;2
       LSR            ;2
       LSR            ;2
LF175: ROL    $BC     ;5
       BCC    LF17E   ;2
       ROR            ;2
       ROR            ;2
       ROR            ;2
       AND    #$C0    ;2
LF17E: STA    $80,X   ;4
       DEC    $C7     ;5
       BNE    LF18A   ;2
       LDA    #$06    ;2
       STA    $C7     ;3
       DEC    $F7     ;5  Advance descriptor after six vertical rows.
LF18A: STX    $BC     ;3
       LDA    $DE     ;3
       AND    #$C0    ;2
       ORA    $BC     ;3
       STA    $DE     ;3
       AND    #$3F    ;2
       BEQ    LF199   ;2
       RTS            ;6

; Finish the partial final nibble in the packed backing store.
LF199: LDX    #$03    ;2
LF19B: ROL    $B1     ;5
       DEX            ;2
       BPL    LF19B   ;2
       RTS            ;6

LF1A1: LDX    $DE     ;3
       STA    $DE     ;3
       TXA            ;2
       AND    #$40    ;2
       BNE    LF1AB   ;2
       RTS            ;6

; Restore a complete 36-byte wall: six $3F, 24 $FF, six $C0.
; PF0 uses only its high nibble; the partly filled edge bytes account
; for register layout/edge geometry. Layout is column-major in RAM.
FillBrickWall:
LF1AB: LDX    #$23    ;2
       LDA    #$C0    ;2
       LDY    #$05    ;2
       JSR    LF1BF   ;6
       LDA    #$FF    ;2
       LDY    #$17    ;2
       JSR    LF1BF   ;6
       LDA    #$3F    ;2
       LDY    #$05    ;2
LF1BF: STA    $80,X   ;4
       DEX            ;2
       DEY            ;2
       BPL    LF1BF   ;2
       RTS            ;6


BRK_ROUTINE:
; Software-call convention: A=horizontal coordinate, X=object 0..4.
; Guide: Horizontal Positioning, Horizontal Motion, RESP/HMP registers.
; Subtract coarse 15-color-clock steps; five-cycle DEY/BPL loop places
; RESPx at 15-clock intervals. Encode the remainder in HMPx's high nibble.
; HMOVE later applies that fine offset during horizontal blank.
; X=0/1 bats, 2/3 side missiles, 4 ball. RTI preserves caller flags;
; A and Y are not preserved. BRK pushes PC+2, skipping its NOP padding.
PositionObject:
LF1C6: SEC            ;2
       SBC    #$2F    ;2
       LDY    #$02    ;2
LF1CB: INY            ;2
       SBC    #$0F    ;2
       BCS    LF1CB   ;2
       EOR    #$FF    ;2
       SBC    #$06    ;2
       JSR    LF67F   ;6
       STY    WSYNC   ;3
LF1D9: DEY            ;2
       BPL    LF1D9   ;2
       STA    RESP0,X ;4  Timed coarse-position strobe; data ignored.
       STA    HMP0,X  ;4  Fine offset, not applied until HMOVE.
       RTI            ;6

; Stop ball motion; clear top-hit and bounce/speed state.
StopBall:
LF1E1: LDX    #$00    ;2
       STX    $E9     ;3
       STX    $E7     ;3
       STX    $EA     ;3
       STX    $E8     ;3
       STX    $E5     ;3
       STX    $E1     ;3
       STX    $EB     ;3
       RTS            ;6

; A is a packed-BCD score increment; score is $CC:$CD, not binary.
AddScoreBCD:
LF1F2: SED            ;2
       CLC            ;2
       ADC    $CD     ;3
       STA    $CD     ;3
       LDA    #$00    ;2
       ADC    $CC     ;3
       STA    $CC     ;3
       CLD            ;2  All subsequent game arithmetic is binary.
       RTS            ;6

; Alternate font, same digits/row order, shifted one bit relative to
; the $F100 font. Pointers $D2/$D4/$D8 have high byte $F2.
DigitFontShift1:
       .byte $EE ; |XXX XXX | $F200
       .byte $AA ; |X X X X | $F201
       .byte $AA ; |X X X X | $F202
       .byte $AA ; |X X X X | $F203
       .byte $EE ; |XXX XXX | $F204
       .byte $44 ; | X   X  | $F205
       .byte $44 ; | X   X  | $F206
       .byte $44 ; | X   X  | $F207
       .byte $44 ; | X   X  | $F208
       .byte $44 ; | X   X  | $F209
       .byte $EE ; |XXX XXX | $F20A
       .byte $22 ; |  X   X | $F20B
       .byte $EE ; |XXX XXX | $F20C
       .byte $88 ; |X   X   | $F20D
       .byte $EE ; |XXX XXX | $F20E
       .byte $EE ; |XXX XXX | $F20F
       .byte $88 ; |X   X   | $F210
       .byte $CC ; |XX  XX  | $F211
       .byte $88 ; |X   X   | $F212
       .byte $EE ; |XXX XXX | $F213
       .byte $88 ; |X   X   | $F214
       .byte $88 ; |X   X   | $F215
       .byte $EE ; |XXX XXX | $F216
       .byte $AA ; |X X X X | $F217
       .byte $AA ; |X X X X | $F218
       .byte $EE ; |XXX XXX | $F219
       .byte $88 ; |X   X   | $F21A
       .byte $EE ; |XXX XXX | $F21B
       .byte $22 ; |  X   X | $F21C
       .byte $EE ; |XXX XXX | $F21D
       .byte $EE ; |XXX XXX | $F21E
       .byte $AA ; |X X X X | $F21F
       .byte $EE ; |XXX XXX | $F220
       .byte $22 ; |  X   X | $F221
       .byte $22 ; |  X   X | $F222
       .byte $88 ; |X   X   | $F223
       .byte $88 ; |X   X   | $F224
       .byte $88 ; |X   X   | $F225
       .byte $88 ; |X   X   | $F226
       .byte $EE ; |XXX XXX | $F227
       .byte $EE ; |XXX XXX | $F228
       .byte $AA ; |X X X X | $F229
       .byte $EE ; |XXX XXX | $F22A
       .byte $AA ; |X X X X | $F22B
       .byte $EE ; |XXX XXX | $F22C
       .byte $88 ; |X   X   | $F22D
       .byte $88 ; |X   X   | $F22E
       .byte $EE ; |XXX XXX | $F22F
       .byte $AA ; |X X X X | $F230
       .byte $EE ; |XXX XXX | $F231
; Blank glyph at offset $32 (decimal 50), used for a leading zero.
BlankDigit:
       .byte $00 ; |        | $F232
       .byte $00 ; |        | $F233
       .byte $00 ; |        | $F234
       .byte $00 ; |        | $F235
       .byte $00 ; |        | $F236

START:
; Reset ($F7FC). STA $CC,X uses ZERO-PAGE indexing and wraps, clearing
; all 256 zero-page addresses: TIA mirrors plus the 128 RIOT RAM bytes.
Reset:
LF237: SEI            ;2
       CLD            ;2
       LDX    #$FF    ;2
       TXS            ;2
       INX            ;2
       TXA            ;2
LF23E: STA    $CC,X   ;4
       INX            ;2
       BNE    LF23E   ;2
       LDX    #$F1    ;2
       STX    $D1     ;3  Font pointer high bytes: $F1 or $F2.
       STX    $D7     ;3
       INX            ;2
       STX    $D3     ;3
       STX    $D5     ;3
       STX    $D9     ;3
       LDA    #$C9    ;2  Right boundary, missile 0.
       LDX    #$02    ;2
       BRK            ;7  PositionObject via IRQ/BRK vector.
       NOP            ;2  Skipped padding (return is PC+2).
       LDA    #$31    ;2  Left boundary, missile 1.
       INX            ;2
       BRK            ;7
       NOP            ;2
       JSR    LF730   ;6  Initial variation/wall/turn setup.
; Post-display/overscan-side work. $23 * 64 = 2240 timer clocks;
; the zero interval and alignment also matter for scanline timing.
FrameStart:
LF25E: LDA    #$23    ;2
       STA    WSYNC   ;3
       STA    TIM64T  ;4
       LDA    $EE     ;3
       BMI    LF28A   ;2
       LDA    $B2     ;3  Game selection, displayed when not in play.
       LSR            ;2
       LSR            ;2
       CLC            ;2
       ADC    #$01    ;2
       LDY    #$0A    ;2
       STY    $BB     ;3
       JSR    LF0F1   ;6
       JSR    LF676   ;6
       STA    $D4     ;3
       TYA            ;2
       JSR    LF676   ;6
       BNE    LF284   ;2
       LDA    #$32    ;2  Blank tens glyph for one-digit game numbers.
LF284: STA    $D2     ;3
       LDX    $BA     ;3
       BPL    LF2A8   ;2
; Build digit pointer low bytes for score, balls, and player number.
; Helpers $F673/$F676 select a BCD nibble and multiply by five.
LF28A: LDA    $CC     ;3
       JSR    LF676   ;6
       STA    $D0     ;3
       LDA    $CD     ;3
       JSR    LF676   ;6
       STA    $D4     ;3
       LDA    $CD     ;3
       JSR    LF673   ;6
       STA    $D2     ;3
       LDA    $B9     ;3
       JSR    LF676   ;6
       STA    $D6     ;3
       LDX    $B5     ;3
LF2A8: INX            ;2  Turn index 0/1 -> displayed player 1/2.
       TXA            ;2
       JSR    LF676   ;6
       STA    $D8     ;3
       LDA    #$3F    ;2
       LDY    #$00    ;2
       BIT    $DF     ;3
       BEQ    LF2CF   ;2
       BMI    LF2C3   ;2
       BVS    LF2BF   ;2
       LDX    $E0     ;3
       BPL    LF2CB   ;2
LF2BF: LDX    #$04    ;2
       BPL    LF2CB   ;2
LF2C3: BVS    LF2C9   ;2
       LDX    #$08    ;2
       BPL    LF2CB   ;2
LF2C9: LDX    #$02    ;2
LF2CB: DEC    $DF     ;5
       LDY    #$0F    ;2
; Guide: Sound. Channel 0 uses AUDC=$0C; $DF's upper bits select pitch.
; Y=0 silences expired effects; Y=$0F gives full volume while active.
; AUDC=$0C is the guide's divide-by-six pure-tone waveform.
UpdateSound:
LF2CF: STY    AUDV0   ;3
       STX    AUDF0   ;3
       LDA    #$0C    ;2
       STA    AUDC0   ;3
       LDA    $DD     ;3  Slow attract-mode palette phase.
       JSR    LF67F   ;6
       STA    $BB     ;3
       LDY    #$09    ;2
       LDX    #$FF    ;2
       LDA    SWCHB   ;4
       AND    #$08    ;2  Console color/B&W switch.
       BNE    LF2ED   ;2  First ten entries for color.
       LDY    #$13    ;2
       LDX    #$0F    ;2  Monochrome: mask off hue nibble.
LF2ED: TXA            ;2
       BIT    $B4     ;3
       BMI    LF2F4   ;2
       AND    #$F7    ;2
LF2F4: STA    $BC     ;3
       LDX    #$09    ;2
; Fill $BC-$C5: score/background/bat/brick colors. Palette bytes are
; XORed with attract phase and masked for active play or B&W.
LF2F8: CPX    #$04    ;2
       BMI    LF310   ;2
       BIT    $B3     ;3
       BVC    LF31F   ;2
       LDA    $B4     ;3
       BPL    LF31F   ;2
       BIT    $DF     ;3
       BMI    LF30C   ;2
       BVS    LF30C   ;2
       BNE    LF31F   ;2
LF30C: LDA    #$00    ;2
       BEQ    LF326   ;2
LF310: CPX    #$02    ;2
       BMI    LF31F   ;2
       LDA    $B5     ;3
       BEQ    LF31F   ;2
       LDA    LF7AA,Y ;4
       EOR    #$90    ;2
       BNE    LF322   ;2
LF31F: LDA    LF7AA,Y ;4
LF322: EOR    $BB     ;3
       AND    $BC     ;3
LF326: STA    $BC,X   ;4
       DEY            ;2
       DEX            ;2
       BPL    LF2F8   ;2
       STA    COLUPF  ;3
       STA    COLUP0  ;3
       STA    COLUP1  ;3
       LDA    $BD     ;3
       STA    COLUBK  ;3
       STX    NUSIZ0  ;3  X=$FF: P0/P1 quad-width, missiles 8 clocks.
       STX    NUSIZ1  ;3
; Guide: Synchronization, Dumped Input Ports. X=$FF sets VBLANK's
; D1 (picture blank) and D7 (paddle capacitor discharge) together.
; The three WSYNCs below maintain VSYNC for three scanlines.
WaitOverscan:
LF33A: LDA    INTIM   ;4
       BNE    LF33A   ;2
       STX    WSYNC   ;3
       STX    VBLANK  ;3  Blank and dump paddle capacitors.
       STX    VSYNC   ;3  Start vertical sync, D1=1.
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       STA    WSYNC   ;3
       STA    VSYNC   ;3  A=0: end sync, keep VBLANK asserted.
       LDA    #$22    ;2
       STA    TIM64T  ;4  $22 * 64 = 2176 clocks for blank-time work.
       INC    $DA     ;5  Frame counter also varies initial serve.
       BNE    LF36B   ;2
       INC    $DB     ;5
       BEQ    LF3B4   ;2
       INC    $DD     ;5  Slow palette changes when idle.
       LDA    $B4     ;3
       EOR    $EE     ;3
       BEQ    LF36B   ;2
       LDA    $BA     ;3
       BEQ    LF36B   ;2
       LDA    #$A4    ;2
       JSR    LF749   ;6
; Guide: PIA Port B. RESET and SELECT are active-low console switches.
ReadConsole:
LF36B: LDA    SWCHB   ;4
       LSR            ;2
       BCS    LF38F   ;2  Carry=1: RESET not pressed.
       JSR    LF730   ;6
       STX    $B9     ;3  Five-ball counter at game start.
       DEY            ;2
       STY    $B4     ;3  Y=$FF: enable play.
       STY    $EE     ;3  Enable score display.
       INY            ;2
       STY    $DD     ;3
       LDX    #$03    ;2
LF380: STY    $CC,X   ;4
       DEX            ;2
       BPL    LF380   ;2
LF385: STY    $DA     ;3
       STY    $DB     ;3
       JSR    LF1E1   ;6
       JMP    LF55F   ;3
LF38F: LSR            ;2  Next SWCHB bit: SELECT.
       LDX    #$FF    ;2
       BCC    LF398   ;2
       STX    $DC     ;3
       BCS    LF3BE   ;2
; Advance immediately on SELECT press; frame bits handle held repeat.
LF398: LDA    $DC     ;3
       BMI    LF3A4   ;2
       LDA    $DA     ;3
       AND    #$20    ;2
       ORA    $DB     ;3
       BEQ    LF3BE   ;2
LF3A4: LDX    $B2     ;3
       INX            ;2
       CPX    #$30    ;2  Wrap after 48 selectable games.
       BNE    LF3AD   ;2
       LDX    #$00    ;2
LF3AD: STX    $B2     ;3
       STX    $DC     ;3
       JSR    LF730   ;6
LF3B4: LDY    #$00    ;2
       STY    $EE     ;3
LF3B8: LDY    #$00    ;2
       STY    $B4     ;3
       BEQ    LF385   ;2
; Active-game logic. Timed variants score one point every 64 frames
; rather than using the normal per-brick point table.
UpdateGame:
LF3BE: LDA    $EE     ;3
       AND    $B4     ;3
       BPL    LF41E   ;2
       LDA    #$00    ;2
       STA    $DD     ;3
       BIT    $B3     ;3
       BPL    LF3D7   ;2
       LDA    $DA     ;3
       AND    #$3F    ;2
       BNE    LF3D7   ;2
       LDA    #$01    ;2
       JSR    LF1F2   ;6
LF3D7: LDA    $E5     ;3
       BEQ    LF3F5   ;2  Y=0: waiting to serve.
       CMP    #$D0    ;2  Ball below court: lose ball / exchange turn.
       BCC    LF41E   ;2
       JSR    LF1E1   ;6
       LDA    $BA     ;3
       BEQ    LF3EF   ;2
       LDA    #$A4    ;2
       JSR    LF749   ;6
       LDA    $B5     ;3
       BNE    LF41E   ;2
LF3EF: DEC    $B9     ;5
       BNE    LF41E   ;2
       BEQ    LF3B8   ;2
; Guide: Paddle Controllers. Paddle fire buttons are on SWCHA,
; not INPT4/INPT5 (those are joystick triggers).
ServeBall:
LF3F5: LDA    SWCHA   ;4
       EOR    #$FF    ;2
       LDX    $B5     ;3
       AND    LF0FE,X ;4
       BEQ    LF41E   ;2
       LDA    $DA     ;3
       AND    #$03    ;2
       TAX            ;2
       LDA    LF788,X ;4  Four frame-dependent serve X/directions.
       ASL            ;2
       STA    $E3     ;3
       LDA    #$01    ;2
       STA    $E7     ;3
       BCC    LF414   ;2
       LDA    #$FF    ;2
LF414: STA    $E9     ;3  Signed horizontal speed: +1 or -1.
       LDA    #$70    ;2
       STA    $E5     ;3
       LDA    #$48    ;2
       STA    $DF     ;3
LF41E: BIT    $DE     ;3
       BPL    LF428   ;2
       JSR    LF132   ;6  Wall conversion precedes collision logic.
       JMP    LF55F   ;3
; Guide: Collisions. BIT copies D6 to V and D7 to N. BVS here tests
; paddle/ball D6, NOT paddle/playfield D7. $EB D6 suppresses repeats.
HandlePaddleCollision:
LF428: LDA    $C8     ;3
       BIT    CXP0FB  ;3
       BVS    LF434   ;2
       LDA    $C9     ;3
       BIT    CXP1FB  ;3
       BVC    LF4A4   ;2
LF434: BIT    $EB     ;3
       BVS    LF4A4   ;2
       ADC    $EC     ;3
       SEC            ;2
       SBC    $E3     ;3  Impact displacement from paddle center.
       TAY            ;2
       BNE    LF44F   ;2
       LDA    #$04    ;2
       BIT    $E9     ;3
       BPL    LF448   ;2
       LDA    #$FC    ;2
LF448: CLC            ;2
       ADC    $E3     ;3
       STA    $E3     ;3
       INY            ;2
       TYA            ;2
LF44F: EOR    $E9     ;3
       BPL    LF456   ;2
       JSR    LF68C   ;6  Set X direction from impact side.
LF456: TYA            ;2
       BPL    LF45C   ;2
       JSR    LF6A2   ;6  Absolute displacement.
LF45C: CMP    #$09    ;2
       BMI    LF462   ;2
       LDA    #$08    ;2
LF462: LDX    $EC     ;3
       CPX    #$04    ;2
       BNE    LF469   ;2
       ASL            ;2
LF469: CPX    #$06    ;2
       BNE    LF473   ;2
       CMP    #$04    ;2
       BPL    LF473   ;2
       ADC    #$00    ;2
LF473: CLC            ;2
       ADC    #$03    ;2
       AND    #$04    ;2
       LSR            ;2
       STA    $ED     ;3  Angle selector, 0 or 2 within speed group.
       LDA    $EB     ;3
       AND    #$3F    ;2
       CMP    #$0C    ;2
       BPL    LF485   ;2
       ADC    #$01    ;2
LF485: ORA    #$40    ;2  Paddle-hit latch plus speed index.
       STA    $EB     ;3
       JSR    LF6A8   ;6  Choose signed fixed-point velocities.
       LDA    #$88    ;2
       STA    $DF     ;3
       BIT    $B3     ;3
       BMI    LF4A4   ;2
       LDA    #$04    ;2  Special full-wall score: packed BCD 0432.
       CMP    $CC     ;3
       BNE    LF4A4   ;2
       LDA    #$32    ;2
       CMP    $CD     ;3
       BNE    LF4A4   ;2
       LDA    #$C0    ;2
       STA    $DE     ;3  Request wall-refill operation.
; BL/PF collision D7 means ball hit either bricks or top boundary.
; Software ball Y distinguishes them; TIA has no brick identifiers.
HandlePlayfieldCollision:
LF4A4: BIT    CXBLPF  ;3
       BMI    LF4AB   ;2
LF4A8: JMP    LF542   ;3
LF4AB: LDA    $E5     ;3
       CMP    #$28    ;2
       BPL    LF4C4   ;2
       LDA    #$80    ;2
       STA    $E1     ;3  Top reached: narrower paddle.
       LDA    #$88    ;2
       STA    $DF     ;3
       JSR    LF690   ;6  Reverse vertical speed at top boundary.
       LDA    $EB     ;3
       AND    #$3F    ;2
       STA    $EB     ;3
       BPL    LF4A8   ;2
; Compute brick row, PF byte, and a two-bit erase mask from ball X/Y.
; One brick spans two PF pixels, or eight color clocks horizontally.
HandleBrickCollision:
LF4C4: BIT    $EB     ;3
       BMI    LF4A8   ;2
       SBC    #$32    ;2
       BCS    LF4CE   ;2
       LDA    #$00    ;2
LF4CE: LDX    #$06    ;2  Row pitch: six vertical coordinate units.
       STX    $BB     ;3
       JSR    LF0F1   ;6
       TYA            ;2
       STA    $BD     ;3  Row selects points and sound pitch.
       JSR    LF6A2   ;6
       CLC            ;2
       ADC    #$05    ;2
       STA    $BC     ;3
       LDA    $E3     ;3
       SBC    #$39    ;2
       BCS    LF4E8   ;2
       LDA    #$00    ;2
LF4E8: LSR            ;2
       LSR            ;2
       LSR            ;2  Divide adjusted X by eight.
       CMP    #$12    ;2  Clamp to 18 brick columns.
       BMI    LF4F1   ;2
       LDA    #$11    ;2
LF4F1: TAY            ;2
       LDA    $BC     ;3
       CLC            ;2
       ADC    LF798,Y ;4  Column -> six-byte-stride PF RAM group.
       TAX            ;2
       LDA    $80,X   ;4
       AND    LF7BE,Y ;4  Clear brick's two PF bits.
       CMP    $80,X   ;4
       BEQ    LF542   ;2  No change: brick already absent.
       STA    $80,X   ;4  Commit brick removal.
       LDX    $BD     ;3
       LDA    LF792,X ;4  Row-dependent sound pitch.
       STA    $E0     ;3
       LDA    #$06    ;2
       STA    $DF     ;3
       BIT    $B3     ;3
       BMI    LF519   ;2
       LDA    LF78C,X ;4  Row points: 7,7,4,4,1,1 (BCD).
       JSR    LF1F2   ;6
LF519: TXA            ;2
       CMP    #$03    ;2
       BPL    LF52A   ;2
       LDA    #$00    ;2
       STA    $ED     ;3
       LDA    $EB     ;3
       AND    #$C0    ;2
       ORA    #$10    ;2  Upper-row hit forces faster speed group.
       STA    $EB     ;3
LF52A: JSR    LF6A8   ;6
       STA    $BC     ;3
       LDA    #$20    ;2
       BIT    $B3     ;3  Breakthrough variation: do not bounce.
       BEQ    LF53C   ;2
       JSR    LF690   ;6  Undo ordinary Y reversal from $F6A8.
       LDA    #$00    ;2
       BEQ    LF53E   ;2
LF53C: LDA    #$80    ;2
LF53E: ORA    $BC     ;3
       STA    $EB     ;3
; Side boundaries are missiles. Combine their D6 ball collision bits.
; Position/sign guard avoids repeated reversal while still overlapping.
HandleSideCollision:
LF542: LDA    CXM0FB  ;3
       ORA    CXM1FB  ;3
       AND    #$40    ;2  M0/BL or M1/BL, not missile/PF.
       STA    $BC     ;3
       BEQ    LF55F   ;2
       LDA    $E3     ;3
       EOR    $E9     ;3
       BMI    LF55F   ;2
       JSR    LF68C   ;6  Reverse horizontal fixed-point velocity.
       LDA    $DF     ;3
       AND    #$3F    ;2
       BNE    LF55F   ;2
       LDA    #$46    ;2
       STA    $DF     ;3
; Guide: PIA console switches. Select current player's difficulty:
; SWCHB D6 for player 0, D7 for player 1. Top-hit flag narrows the bat
; by one more table step; $EC is the matching collision-center offset.
UpdatePaddleSize:
LF55F: LDX    #$00    ;2
       LDA    SWCHB   ;4
       ASL            ;2
       LDY    $B5     ;3
       BNE    LF56A   ;2
       ASL            ;2
LF56A: BCC    LF56D   ;2
       INX            ;2
LF56D: BIT    $E1     ;3
       BPL    LF572   ;2
       INX            ;2
LF572: LDA    LF7D9,X ;4
       STA    $EC     ;3
       LDA    LF7D6,X ;4
       STA    $B7     ;3
       LDA    $BA     ;3
       CMP    #$02    ;2
       BMI    LF58B   ;2
       ORA    $B5     ;3
       ROR            ;2
       BCC    LF58B   ;2
       LDY    #$FF    ;2
       BNE    LF58D   ;2
LF58B: LDY    #$00    ;2
LF58D: STY    $B8     ;3  $FF shows second bat; $00 hides it.
       BEQ    LF593   ;2
       LDY    #$02    ;2
; Process the most recently sampled paddle, then coarse-position both
; player objects. Fine movement is deferred to this frame's HMOVE.
UpdatePaddles:
LF593: LDX    #$00    ;2
       JSR    LF6DB   ;6
       LDX    #$00    ;2
       BRK            ;7  Position P0; NOP is skipped padding.
       NOP            ;2
       LDX    #$01    ;2
       LDY    $BB     ;3
       JSR    LF6DB   ;6
       LDX    #$01    ;2
       BRK            ;7  Position P1; NOP is skipped padding.
       NOP            ;2
       LDA    #$08    ;2
       BIT    $B3     ;3
       BEQ    LF5C1   ;2
       LDA    SWCHA   ;4
       LDX    $B5     ;3
       AND    LF0FE,X ;4
       LDY    $C8     ;3
       BIT    CXP0FB  ;3
       BVS    LF5E8   ;2
       LDY    $C9     ;3
       BIT    CXP1FB  ;3
       BVS    LF5E2   ;2
; Signed 8.8 fixed-point integration: Y += dY, X -= dX. The opposite
; X convention matters when interpreting left/right direction flags.
IntegrateBall:
LF5C1: CLC            ;2
       LDA    $E8     ;3
       ADC    $E6     ;3
       STA    $E6     ;3
       LDA    $E7     ;3
       ADC    $E5     ;3
       STA    $E5     ;3
       EOR    #$01    ;2
       STA    VDELBL  ;3  Complement Y parity -> one-line ball delay.
       SEC            ;2
       LDA    $E4     ;3
       SBC    $EA     ;3
       STA    $E4     ;3
       LDA    $E3     ;3
       SBC    $E9     ;3
       STA    $E3     ;3
       JMP    LF5F6   ;3
; Held-ball variation. Button bits select whether to keep integrating
; or keep the ball attached just above the colliding paddle.
; BMI at $F5E6 cannot be taken after AND #$0C; preserved ROM instruction.
LF5E2: AND    #$0C    ;2
       BNE    LF5C1   ;2
       BMI    LF5EC   ;2
LF5E8: AND    #$C0    ;2
       BNE    LF5C1   ;2
LF5EC: LDA    #$B2    ;2  Hold ball at paddle level.
       STA    $E5     ;3
       TYA            ;2
       CLC            ;2
       ADC    #$04    ;2
       STA    $E3     ;3
LF5F6: LDX    #$04    ;2  Object 4 is TIA ball (A holds its X).
       BRK            ;7  Position ball; following NOP is padding.
       NOP            ;2
       LDA    $B5     ;3
       BIT    $B8     ;3
       BPL    LF606   ;2
       LDA    $DA     ;3
       AND    #$02    ;2
       ORA    $B5     ;3
LF606: STA    $B6     ;3  Alternate capacitor inputs when second bat used.
       LDX    #$05    ;2
       LDA    #$02    ;2
LF60C: STA    $EF,X   ;4  Six brick rows, each repeats three times.
       DEX            ;2
       BPL    LF60C   ;2
; Guide: Collisions, Horizontal Motion, Dumped Input Ports.
; Clear the old collision latches ONLY after handling them. HMOVE is
; immediately after WSYNC, as recommended for horizontal-blank timing.
; Clearing VBLANK releases capacitor discharge; its RC charge time is
; then measured by INPT0,X samples in the visible kernel.
BeginVisible:
LF611: LDA    INTIM   ;4
       BNE    LF611   ;2
       STA    CXCLR   ;3  Discard previous display's collisions.
       STA    WSYNC   ;3
       STA    HMOVE   ;3  Apply all objects' pending fine X offsets.
       STA    VBLANK  ;3  A=0: video on, paddles begin charging.
       LDX    #$09    ;2
       JSR    LF664   ;6
       STA    HMCLR   ;3  Nine lines elapsed: motion registers safe to clear.
       STA    $C6     ;3  Default sample if no low comparator seen.
       TAX            ;2
       JSR    LF003   ;6  DrawScore: ten visible scanlines.
       LDX    #$02    ;2
       JSR    LF664   ;6
       LDA    #$FF    ;2  Solid PF top boundary, missiles for side walls.
       STA    PF0     ;3
       STA    PF1     ;3
       STA    PF2     ;3
       STA    ENAM0   ;3
       STA    ENAM1   ;3
       LDX    #$10    ;2
       STX    CTRLPF  ;3  BL width 2; PF repeated (not reflected).
       LDX    #$06    ;2
       JSR    LF0AA   ;6  Draw solid upper court boundary.
       LDA    #$00    ;2
       STA    WSYNC   ;3
       STA    PF0     ;3
       STA    PF1     ;3
       STA    PF2     ;3
       LDX    #$0B    ;2
       JSR    LF0AA   ;6  Gap between top boundary and bricks.
       JSR    LF03B   ;6  Brick bands followed by court/paddles.
       LDX    #$00    ;2
       STX    ENAM0   ;3
       STX    ENAM1   ;3
       STX    ENABL   ;3
       STX    GRP1    ;3
       JMP    LF25E   ;3  End display; do next frame's blank-time work.
; Wait X scanlines with an empty playfield; advance raster counter Y.
BlankLines:
LF664: LDA    #$00    ;2
       STA    PF0     ;3
       STA    PF1     ;3
       STA    PF2     ;3
       INY            ;2
       STY    WSYNC   ;3
       DEX            ;2
       BNE    LF664   ;2
       RTS            ;6

; Entry $F673 uses high BCD digit; entry $F676 uses low digit.
; Returns digit * 5, the glyph offset within a font page.
HighDigitOffset:
LF673: JSR    LF67F   ;6
LowDigitOffset:
LF676: AND    #$0F    ;2
       STA    $BB     ;3
       ASL            ;2
       ASL            ;2
       ADC    $BB     ;3
       RTS            ;6

; Circular byte rotate by four bits, exchanging nibbles. Each ADC #0
; reinserts the bit shifted into carry; this is not a plain ASL x4.
SwapNibbles:
LF67F: ASL            ;2
       ADC    #$00    ;2
       ASL            ;2
       ADC    #$00    ;2
       ASL            ;2
       ADC    #$00    ;2
       ASL            ;2
       ADC    #$00    ;2
       RTS            ;6

; Negate one signed 16-bit velocity: fraction first, then integer with
; carry. Zero-page indexing wraps ($FF+X)&$FF to $E9 or $E7.
ReverseX:
LF68C: LDX    #$EA    ;2
       BNE    LF692   ;2
ReverseY:
LF690: LDX    #$E8    ;2
LF692: LDA    $00,X   ;4  RAM $EA/$E8, NOT TIA VSYNC despite base $00.
       JSR    LF6A2   ;6
       STA    $00,X   ;4  Preserve zero-page-indexed addressing mode.
       LDA    $FF,X   ;4
       EOR    #$FF    ;2
       ADC    #$00    ;2
       STA    $FF,X   ;4
       RTS            ;6

; A := -A. Carry is needed by the 16-bit negate caller above.
NegateA:
LF6A2: EOR    #$FF    ;2
       SEC            ;2
       ADC    #$00    ;2
       RTS            ;6

; Reload velocity magnitudes from speed/angle table. Encoded byte:
; D0-D1 integer magnitude; D2-D7 fractional part, stored unchanged.
; First byte -> X speed, second -> Y speed. Preserve old X sign;
; reverse old Y sign, implementing the ordinary paddle/brick bounce.
ChooseVelocity:
LF6A8: LDA    $EB     ;3
       AND    #$3C    ;2
       CLC            ;2
       ADC    $ED     ;3
       TAY            ;2
       LDA    $E9     ;3
       PHP            ;3  Save old X sign on the ordinary RAM stack.
       LDA    $E7     ;3
       PHP            ;3  Save old Y sign.
       LDX    #$02    ;2
LF6B8: LDA    LF7DC,Y ;4
       PHA            ;3
       AND    #$03    ;2  Velocity integer component.
       STA    $E7,X   ;4
       PLA            ;4
       AND    #$FC    ;2  Velocity fractional component.
       STA    $E8,X   ;4
       INY            ;2
       DEX            ;2
       DEX            ;2
       BPL    LF6B8   ;2
       PLP            ;4
       BMI    LF6D0   ;2
       JSR    LF690   ;6
LF6D0: PLP            ;4
       BPL    LF6D6   ;2
       JSR    LF68C   ;6
LF6D6: LDA    $EB     ;3
       AND    #$3F    ;2
       RTS            ;6

; Guide: Dumped Input Ports. X=bat 0/1; Y selects clamp-limit pair.
; Only update the bat whose capacitor was sampled last display.
; Combine previous X and inverted charge-time sample (smoothed/averaged
; using carry), then clamp within full or half court.
ReadPaddle:
LF6DB: TXA            ;2
       ASL            ;2
       EOR    $B6     ;3
       AND    #$02    ;2
       BEQ    LF6E9   ;2
       INY            ;2
       INY            ;2
       STY    $BB     ;3
       BNE    LF72D   ;2
LF6E9: LDA    $C6     ;3
       ADC    #$14    ;2
       EOR    #$FF    ;2
       ADC    $C8,X   ;4
       ROR            ;2  Divide accumulated position/sample by two.
       CMP    LF782,Y ;4
       BCS    LF6FA   ;2
       LDA    LF782,Y ;4
LF6FA: INY            ;2
       CMP    LF782,Y ;4
       BCC    LF703   ;2
       LDA    LF782,Y ;4
LF703: INY            ;2
       STY    $BB     ;3
       STA    $C8,X   ;4
       BIT    $E7     ;3  Optional influence only while ball rises.
       BPL    LF72D   ;2
       LDA    #$10    ;2  Paddle-influence variation flag.
       BIT    $B3     ;3
       BEQ    LF72D   ;2
       BIT    $BC     ;3
       BVS    LF72D   ;2
       SEC            ;2
       LDY    $C8,X   ;4
       LDA    $F5,X   ;4
       STY    $F5,X   ;4
       SBC    $C8,X   ;4  Compare old and new paddle position.
       BEQ    LF72D   ;2
       BPL    LF729   ;2
       INC    $E3     ;5
       INC    $E3     ;5
       BNE    LF72D   ;2
LF729: DEC    $E3     ;5
       DEC    $E3     ;5
LF72D: LDA    $C8,X   ;4
       RTS            ;6

; Decode 48 selection states: low two bits choose configuration,
; upper bits select one of twelve combinations of gameplay flags.
InitializeVariation:
LF730: LDA    #$01    ;2
       STA    $B5     ;3
       LDA    $B2     ;3
       AND    #$03    ;2
       STA    $BA     ;3
       LDA    $B2     ;3
       LSR            ;2
       LSR            ;2
       TAX            ;2
       LDA    LF7F0,X ;4
       STA    $B3     ;3
       JSR    LF1AB   ;6  Fill live brick wall.
       LDA    #$E4    ;2
; Shared turn/state exchange. Swap both BCD score bytes, toggle player,
; and initialize incremental brick-state conversion ($24 = 36 bytes).
; Entry A=$E4 on mode initialization; A=$A4 on ordinary turn exchange.
ExchangeTurn:
LF749: STA    $DE     ;3
       LDX    #$01    ;2
LF74D: LDY    $CC,X   ;4
       LDA    $CE,X   ;4
       STA    $CC,X   ;4
       STY    $CE,X   ;4
       DEX            ;2
       BPL    LF74D   ;2
       LDA    $B5     ;3
       EOR    #$01    ;2
       STA    $B5     ;3
       LDA    #$08    ;2
       STA    $CA     ;3
       LDX    #$06    ;2
       STX    $C7     ;3
       DEX            ;2
       STX    $F7     ;3
       LDY    #$00    ;2
       STY    $CB     ;3
       RTS            ;6

; Packed backing-store bit transport: carry in/out holds one brick
; state bit. Rotate it into stream byte $A4+$CB; advance every 8 bits.
; The caller handles the live PF byte and restores X via $BD.
ShiftBrickBit:
LF76E: STX    $BD     ;3
       LDX    $CB     ;3
       ROL    $A4,X   ;6
       DEC    $CA     ;5
       BNE    LF77F   ;2
       INX            ;2
       STX    $CB     ;3
       LDX    #$08    ;2
       STX    $CA     ;3
LF77F: LDX    $BD     ;3
       RTS            ;6

; DATA TABLES -- table roles inferred from the indexed callers above.
; Paddle clamp ranges: full court [$37,$BF], left half [$37,$7E],
; right half [$80,$BF]. These coordinates include the ROM's X bias;
; they are not literal 0..159 visible screen coordinates.
PaddleLimits:
LF782: .byte $37,$BF,$37,$7E,$80,$BF
; ASL produces initial ball X and carry chooses horizontal direction.
ServePositions:
LF788: .byte $A0,$40,$C0,$60
; Six brick rows from top to bottom; each row has eighteen bricks.
; Full-wall point total = 18 * (7+7+4+4+1+1) = 432.
BrickPoints:
LF78C: .byte $07,$07,$04,$04,$01,$01
BrickSoundPitch:
LF792: .byte $0A,$0C,$10,$12,$16,$1C
; Horizontal brick column -> offset of PF byte group within $80-$A3.
; Add (5 - vertical row index) before indexing RAM.
BrickColumnOffsets:
LF798: .byte $1E,$18,$18,$18,$18,$12,$12,$12,$12,$0C,$0C,$06,$06,$06,$06,$00
       .byte $00,$00
; Two palettes of ten entries: score, background, bats 0/1, six rows.
; Guide: Color and Luminosity. High nibble = hue, D1-D3 = luminance.
; Second palette is selected with the console B&W switch.
DisplayPalettes:
LF7AA: .byte $06,$00,$46,$B6,$86,$C6,$16,$26,$36,$46,$06,$00,$0C,$0A,$08,$06
       .byte $04,$08,$06,$04
; AND masks remove one two-bit brick, in the PF register's serialized
; bit order. PF0's unused low nibble explains the clipped edge entries.
BrickEraseMasks:
LF7BE: .byte $3F,$3F,$CF,$F3,$FC,$FC,$F3,$CF,$3F,$CF,$3F,$3F,$CF,$F3,$FC,$FC
       .byte $F3,$CF
; One descriptor per six-byte PF column, consumed from index 5 down.
; High bits control nibble swap/rotation/edge clipping; low nibble is
; the number of live-bit/backing-stream transfers for each byte.
BrickStateDescriptors:
LF7D0: .byte $23,$44,$82,$04,$44,$51
; Player objects are quad-width (NUSIZ=7); enabled glyph bits therefore
; make bats 16, 12, or 8 color clocks wide. Half widths follow.
PaddlePatterns:
LF7D6: .byte $F0,$E0,$C0
PaddleCenterOffsets:
LF7D9: .byte $08,$06,$04
; Five speed groups, each with two X/Y pairs (two impact angles).
; Encoding: (byte & 3) + (byte & $FC)/256 color clocks or Y units/frame.
; Example $81 = 1.5, $02 = 2.0, $63 = 3.375.
VelocityTable:
LF7DC: .byte $81,$01,$01,$81,$81,$02,$80,$02,$02,$01,$02,$01,$02,$02,$02,$02
       .byte $02,$63,$02,$63
; Twelve mode-group flag bytes, indexed by selection >> 2.
; Bit meanings are documented in the RAM map at the top.
VariationFlags:
LF7F0: .byte $00,$10,$08,$40,$80,$90,$88,$C0,$20,$30,$28,$60
; Vectors occupy the last four ROM bytes. There is no usable NMI on
; the 6507; bytes at $F7FA-$F7FB are still variation data, not a vector.
; The 2 KiB hardware mirror exposes these at $FFFC and $FFFE.
       .word LF237            ; $F7FC: RESET -> $F237
       .word LF1C6            ; $F7FE: IRQ/BRK -> PositionObject
