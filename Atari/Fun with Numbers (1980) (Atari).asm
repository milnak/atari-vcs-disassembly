; Name: Fun with Numbers (1980) (Atari) (PAL)
; Manufacturer: Atari, Gary Palmer
; Model: CX2661P
; Rarity: Uncommon
; Note: AKA Basic Math

; Analyzed, labeled and commented
;  by Jeff Miller
; Last Update: April 6, 2025

; The player moves the joystick to cycle through numbers zero through nine to
; fill in number prompts. The player scores one point for each correct answer.
; At the end of 10 rounds, the total number problems is displayed on the right,
; while the player's score is displayed on the left.

; The game features eight modes. In the first four modes, the player can choose
; what number to start with at the top of the equation, and then the computer
; will decide the second number in line, leaving the player to answer underneath.
; In the other four modes, both numbers of the equation will be decided by the computer.

; The two difficulty switches on the Atari VCS can further change the rules of the game.
; The RIGHT DIFFICULTY switch functions on whether or not there will be a timer in the game.
; The LEFT DIFFICULTY switch changes whether the player has 12 or 24 seconds in the first four game modes.
; In the other four game modes, the player has either two-digit problems with a 24 second time limit or
; single digit problems with a 12 second time limit.

; Disassembled Thu Mar 27 08:45:18 2025
; Using DiStella v3.01b
; Command Line: C:\Users\jeffm\Downloads\distella.exe -c.\Fun with Numbers.cfg -pafs .\Fun with Numbers.bin
; .\Fun with Numbers.cfg contents:
;
;      ORG F000
;      GFX F6F6 F7C0

; To assemble:
; dasm '.\Basic Math.asm' -f3 -o'Basic Math.a26' -l'Basic Math.lst' -s'Basic Math.sym' -v1 -S -R
      processor 6502

; NOTES:
; Pointers to "Graphics" ORG:
; $(D4)
; $(D6)
; $(D8)
; $(DA)
; $(DC)
; $(DE)
; $(E0)

; ----------------------------------------------------------------------------
; ASSEMBLER SWITCHES

NTSC                    = 0
PAL50                   = 1
PAL60                   = 2

   IFNCONST COMPILE_REGION

COMPILE_REGION          = NTSC      ; change to compile for different regions

   ENDIF

   IF !(COMPILE_REGION = NTSC || COMPILE_REGION = PAL50 || COMPILE_REGION = PAL60)

      echo ""
      echo "*** ERROR: Invalid COMPILE_REGION value"
      echo "*** Valid values: NTSC = 0, PAL50 = 1, PAL60 = 2"
      echo ""
      err

   ENDIF

; ----------------------------------------------------------------------------
; DEFINES

; VSYNC - $00 - (write)
; Vertical Sync Set/Clear

; Controls vertical sync time by writing data bit 1 into the VSYNC latch.

; bit 0:
; bit 1: 0=Stop VSYNC, 1=Start VSYNC
; bit 2..7:
VSYNC   =  $00

; VBLANK - $01 - (write)
; Vertical Blank Set/Clear

; Controls vertical blank and the latches and dumping transistors on the input ports by writing into bits D7, D6 and D1 of the VBLANK register.

; bit 0:
; bit 1: 0=Stop VBLANK, 1=Start VBLANK
; bit 2..5:
; bit 6:
; 0=Disable INPT4, INPT5 latches
; 1=Enable INPT4, INPT5 latches
; bit 7:
; 0=Remove INPT0,1,2,3 dump path to ground
; 1=Dump INPT0,1,2,3 to ground
; Note - Disable latches (bit6=0) also resets latches to logic true
VBLANK  =  $01

; WSYNC - $02 - (write)
; Wait for Horizontal Blank

; Halts microprocessor by clearing RDY latch to zero. RDY is set true again by the leading edge of horizontal blank.

; bit 0..7:
WSYNC   =  $02

; COLUPF - $08 - (write)
; Color-Luminance Playfield and Ball

; bit 0:
; bit 1..7: Color value
COLUPF  =  $08

; COLUBK - $09 - (write)
; Color-Luminance Background

; bit 0:
; bit 1..7: Color value
COLUBK  =  $09

; REFP1 - $0C - (write)
; Reflection Player 1

; Write bit3 into the 1 bit player reflect register.

; bit0..2:
; bit3:
; 0 - no reflect, bit7 of GRP1 on left
; 1 - reflect, bit0 of GRP1 on left
; bit4..7:
REFP1   =  $0C

; PF0 - $0D - (write)
; Playfield Register Byte 0

; bit0..3:
; bit4..7: 'pixels' on screen
; Order when CTRLPF.REF=0

; bit 4..7 7..0 0..7 4..7 7..0 0..7
;     PF0  PF1  PF2  PF0  PF1  PF2
; Order when CTRLPF.REF=1

; bit 4..7 7..0 0..7 7..0 0..7 7..4
;     PF0  PF1  PF2  PF2  PF1  PF0
PF0     =  $0D

; PF1 - $0E - (write)
; Playfield Register Byte 1

; bit0..7: 'pixels' on screen
; Order when CTRLPF.REF=0

; bit 4..7 7..0 0..7 4..7 7..0 0..7
;     PF0  PF1  PF2  PF0  PF1  PF2
; Order when CTRLPF.REF=1

; bit 4..7 7..0 0..7 7..0 0..7 7..4
;     PF0  PF1  PF2  PF2  PF1  PF0
PF1     =  $0E

; PF2 - $0F - (write)
; Playfield Register Byte 2

; bit0..7: 'pixels' on screen
; Order when CTRLPF.REF=0

; bit 4..7 7..0 0..7 4..7 7..0 0..7
;     PF0  PF1  PF2  PF0  PF1  PF2
; Order when CTRLPF.REF=1

; bit 4..7 7..0 0..7 7..0 0..7 7..4
;     PF0  PF1  PF2  PF2  PF1  PF0
PF2     =  $0F

; AUDC0 - $15 - (write)
; Audio Control 0

; Audio control registers which control the noise content and additional division of the audio output.

; bit0..3:
; bit0=0 bit1=0 bit2=0 bit3=0 - Set to 1
; bit0=1 bit1=0 bit2=0 bit3=0 - 4 bit poly
; bit0=0 bit1=1 bit2=0 bit3=0 - Div 15 -> 4 bit poly
; bit0=1 bit1=1 bit2=0 bit3=0 - 5 bit poly -> 4 bit poly
; bit0=0 bit1=0 bit2=1 bit3=0 - Div 2 pure tone
; bit0=1 bit1=0 bit2=1 bit3=0 - Div 2 pure tone
; bit0=0 bit1=1 bit2=1 bit3=0 - Div 31 pure tone
; bit0=1 bit1=1 bit2=1 bit3=0 - 5 bit poly -> div 2
; bit0=0 bit1=0 bit2=0 bit3=1 - 9 bit poly white noise
; bit0=1 bit1=0 bit2=0 bit3=1 - 5 bit poly
; bit0=0 bit1=1 bit2=0 bit3=1 - div 31 : pure tone
; bit0=1 bit1=1 bit2=0 bit3=1 - set last 4 bits to 1
; bit0=0 bit1=0 bit2=1 bit3=1 - div 6 : pure tone
; bit0=1 bit1=0 bit2=1 bit3=1 - div 6 : pure tone
; bit0=0 bit1=1 bit2=1 bit3=1 - div 93 : pure tone
; bit0=1 bit1=1 bit2=1 bit3=1 - 5 bit poly div 6
; bit4..7:
AUDC0   =  $15

; AUDC1 - $16 - (write)
; Audio Control 0

; Audio control registers which control the noise content and additional division of the audio output.

; bit0..3:
; bit0=0 bit1=0 bit2=0 bit3=0 - Set to 1
; bit0=1 bit1=0 bit2=0 bit3=0 - 4 bit poly
; bit0=0 bit1=1 bit2=0 bit3=0 - Div 15 -> 4 bit poly
; bit0=1 bit1=1 bit2=0 bit3=0 - 5 bit poly -> 4 bit poly
; bit0=0 bit1=0 bit2=1 bit3=0 - Div 2 pure tone
; bit0=1 bit1=0 bit2=1 bit3=0 - Div 2 pure tone
; bit0=0 bit1=1 bit2=1 bit3=0 - Div 31 pure tone
; bit0=1 bit1=1 bit2=1 bit3=0 - 5 bit poly -> div 2
; bit0=0 bit1=0 bit2=0 bit3=1 - 9 bit poly white noise
; bit0=1 bit1=0 bit2=0 bit3=1 - 5 bit poly
; bit0=0 bit1=1 bit2=0 bit3=1 - div 31 : pure tone
; bit0=1 bit1=1 bit2=0 bit3=1 - set last 4 bits to 1
; bit0=0 bit1=0 bit2=1 bit3=1 - div 6 : pure tone
; bit0=1 bit1=0 bit2=1 bit3=1 - div 6 : pure tone
; bit0=0 bit1=1 bit2=1 bit3=1 - div 93 : pure tone
; bit0=1 bit1=1 bit2=1 bit3=1 - 5 bit poly div 6
; bit4..7:
AUDC1   =  $16

; AUDF0 - $17 - (write)
; Audio Frequency 0

; The audio frequency divider register.

; bit0..4: Division factor
; 0 - No division of the 30 KHz base frequency
; 1 - Divide by two
; 2 - Divide by three
; ...
; 31 - divide by thirtytwo
; bit5..7:
AUDF0   =  $17

; AUDF1 - $18 - (write)
; Audio Frequency 1

; The audio frequency divider register.

; bit0..4: Division factor
; 0 - No division of the 30 KHz base frequency
; 1 - Divide by two
; 2 - Divide by three
; ...
; 31 - divide by thirtytwo
; bit5..7:
AUDF1   =  $18

; AUDV0 - $19 - (write)
; Audio Volume 0

; Audio volume registers which set the pull down impedance driving the audio output pads.
; bit0..3: 0=off, 1=lowest, 15=highest volume
; bit4..7:
AUDV0   =  $19

; AUDV1 - $1A - (write)
; Audio Volume 1

; Audio volume registers which set the pull down impedance driving the audio output pads.
; . bit0 .. 3: 0=off, 1=lowest, 15=highest volume
; . bit4 .. 7:
AUDV1   =  $1A

; SWCHA - $280 (read)
; RIOT Port A data register - Joystick

; Two joysticks or four paddles (just the switches as the paddles themselves are read at INPO thru INPT3 of the TIA) can be read by
; configuring the entire port as input and reading the data at SWCHA according to the following table:
; . bit0: Player1 - Joystick up
; . bit1: Player1 - Joystick down
; . bit2: Player1 - Joystick left / Paddle button 3
; . bit3: Player1 - Joystick right / Paddle button 2
; . bit4: Player0 - Joystick up
; . bit5: Player0 - Joystick down
; . bit6: Player0 - Joystick left / Paddle button 1
; . bit7: Player0 - Joystick right / Paddle button 0
SWCHA   =  $0280

; SWCHB - $282 (read)
; RIOT Port B data - Console switches

; . bit0: Game reset, 0=switch pressed
; . bit1: Game select, 0=switch pressed
; . bit2:
; . bit3: Color or B/W, 0=B/W, 1=color
; · bit5 .. 4:
; · bit6: PO difficulty,0=Amateur (B), 1=Pro (A)
; . bit7: P1 difficulty, 0=Amateur (B), 1=Pro (A)
SWCHB   =  $0282

; INTIM - $284 (read)
; Get current timer value

; bit0..7: Current timer value
INTIM   =  $0284

; TIM8T - $295 - (write)
; Set timer /8 clock (6.7 us) intervals

; bit0..7: New timer value
TIM8T   =  $0295

; TIM64T - $296 - (write)
; Set time /64 clock (53.6 us) intervals

; bit0..7: New timer value
TIM64T  =  $0296

; ----------------------------------------------------------------------------
; USER CONSTANTS

ROM_BASE                = $F000

; ----------------------------------------------------------------------------
; CODE SEGMENT

       SEG CODE
       ORG ROM_BASE

START:
       SEI            ;2 disable tnterrrupts
       LDX    #$FF    ;2
       TXS            ;2 init stack pointer to $FF
       CLD            ;2 disable BCD math mode

;Set entire zero page region ($00-$FF) to zero
; (includes TIA register space and RAM space)

       LDX    #$00    ;2
       TXA            ;2
ZeroZP:
       STA    $0,X    ;4
       INX            ;2
       BNE    ZeroZP   ;2

       JSR    LF478   ;6

       INC    $9A     ;5

       LDA    #%00000100    ;2
       STA    AUDC0   ;3

; Set $D4 - $E1 to hiword of "Graphics" ORG
; loword bytes will be filled in as needed.

       LDX    #$0D    ;2
       STX    AUDC1   ;3
       LDA    #>Graphics    ;2  =0xF7
LF01C: STA    $D4,X   ;4
       DEX            ;2
       BPL    LF01C   ;2

LF021: LDA    #$04    ;2
       SBC    $8D     ;3
       STA    $8D     ;3

LF027: LDA    #$BA    ;2
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    LF4A1   ;6
       JSR    WaitForTimerDone   ;6

       LDA    #$A7    ;2
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    WaitForTimerDone   ;6

       DEC    $8D     ;5
       BNE    LF027   ;2

       IF COMPILE_REGION = NTSC

       LDA    #$DF    ;2 NTSC
       STA    WSYNC   ;3 NTSC
       STA    TIM8T   ;4 NTSC
       STA    VBLANK  ;3 NTSC

       ELSE

       LDA    #$58    ;2 PAL
       STA    WSYNC   ;3 PAL halt the CPU until the next scanline starts.
       STA    TIM64T  ;4 PAL

       ENDIF

       JSR    LF255   ;6
       JSR    WaitForTimerDone   ;6
       LDA    #$16    ;2 0001 0110
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       ; Vertical sync set/clear (bit 1: 1=start vsync)

       STA    VSYNC   ;3 turn on VSYNC

       IF COMPILE_REGION = NTSC

                      ; NTSC (nothing)

       ELSE

       ; Vertical blank  set/clear (bit 1: 1=start vblank; bit 6,7 also used, but 0 here)
       STA    VBLANK  ;3 PAL turn on VBLANK

       ENDIF

       JSR    WaitForTimerDone  ; 3
       STA    VSYNC   ;3
       LDA    #$BA    ;2
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    LF414   ;6
       JSR    LF1B9   ;6
       JSR    WaitForTimerDone   ;6

       STA    VBLANK  ;3 Turn off VBLANK (WaitForTimerDone returned A=0) - releases TIA
       LDA    #$BA    ;2
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    LF48C   ;6
       JSR    LF332   ;6
       JSR    LF3AF   ;6
       JSR    LF38D   ;6
       JSR    LF6C4   ;6
       JSR    LF5EC   ;6
       JSR    WaitForTimerDone   ;6

       LDA    #$BA    ;2
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    LF677   ;6
       JSR    WaitForTimerDone   ;6

       LDA    #$A7    ;2
       STA    TIM8T   ;4 Set timer /8 clock (6.7 us) intervals
       JSR    WaitForTimerDone   ;6

       STA    $8D     ;3
LF09A: STA    PF0     ;3
       STA    PF1     ;3
       STA    PF2     ;3
       LDY    $8D     ;3
       LDA    ($D4),Y ;5
       CMP    #$CA    ;2
       BCC    LF0AB   ;2
       JMP    LF021   ;3

       ; Set "GRAPHICS" offsets (?)

LF0AB: STA    $CA     ;3
       INC    $8D     ;5

       LDX    $CA     ;3
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $E0     ;3

       DEX            ;2
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $DE     ;3
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.

       DEX            ;2
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $DC     ;3

       DEX            ;2
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $DA     ;3 GRAPHICS

       DEX            ;2
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $D8     ;3

       DEX            ;2
       LDA    $0,X ;4
       ASL            ;2
       ASL            ;2
       ASL            ;2
       STA    $D6     ;3
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.

       LDY    #$04    ;2
       BNE    LF0EA   ;2
LF0E8: STA    WSYNC   ;3 halt the CPU until the next scanline starts.
LF0EA: LDA    #$00    ;2
       PHA            ;3
       LDA    ($E0),Y ;5
       AND    #$0F    ;2
       STA    $8B     ;3
       LDA    ($DE),Y ;5
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ASL            ;2
       ORA    $8B     ;3
       PHA            ;3
       LDA    ($DC),Y ;5
       PHA            ;3
       LDA    ($DA),Y ;5  GRAPHICS
       AND    #$F0    ;2
       STA    $8B     ;3
       LDA    ($D8),Y ;5
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       ORA    $8B     ;3
       PHA            ;3
       LDA    ($D6),Y ;5
       AND    #$0F    ;2
       PHA            ;3
       LDA    #$00    ;2
       PHA            ;3
       DEY            ;2
       BPL    LF0E8   ;2
       LDX    #$04    ;2
       STX    $8B     ;3
LF11F: LDY    #$02    ;2

LF121: STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       PLA            ;4
       STA    $D6     ;3
       STA    PF0     ;3
       PLA            ;4
       STA    $D8     ;3
       STA    PF1     ;3
       PLA            ;4
       STA    $DA     ;3 GRAPHICS

       STA    PF2     ;3
       PLA            ;4
       STA    $DC     ;3
       STA    PF0     ;3
       PLA            ;4
       STA    $DE     ;3
       STA    PF1     ;3
       PLA            ;4
       STA    $E0     ;3
       STA    PF2     ;3

       ; DRAW SCREEN LOOP (?)

LF141: STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       LDA    $D6     ;3
       STA    PF0     ;3
       LDA    $D8     ;3
       STA    PF1     ;3
       LDA    $DA     ;3 GRAPHICS
       STA    PF2     ;3
       SED            ;2
       SEC            ;2
       LDA    #$00    ;2
       ADC    $AA     ;3
       STA    $AA     ;3
       CLD            ;2
       LDA    $DC     ;3
       STA    PF0     ;3
       LDA    $DE     ;3
       STA    PF1     ;3
       LDA    $E0     ;3
       DEY            ;2
       STA    PF2     ;3
       BPL    LF141   ;2
       DEX            ;2
       BPL    LF11F   ;2

       LDA    $8B     ;3
       BNE    LF173   ;2
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       JMP    LF09A   ;3
LF173: STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       LDX    #$00    ;2
       STX    PF0     ;3
       STX    PF1     ;3
       STX    PF2     ;3
       LDA    $CA     ;3
       CMP    #$BD    ;2
       BEQ    LF195   ;2
       CMP    #$C9    ;2
       BNE    LF19C   ;2
       LDA    $89     ;3
       ASL            ;2
       ASL            ;2
       ADC    #$8D    ;2
       LDY    $8C     ;3
       BEQ    LF19C   ;2
       LDX    $9C     ;3
       BCC    LF19C   ;2
LF195: DEX            ;2
       LDA    $8A     ;3
       ASL            ;2
       ASL            ;2
       ADC    #$9D    ;2
LF19C: STA    $D6     ;3
       STX    $D8     ;3
       LDY    #$03    ;2
       LDA    #$00    ;2
       PHA            ;3
LF1A5: STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       LDA    ($D6),Y ;5
       AND    $D8     ;3
       PHA            ;3
       DEY            ;2
       BPL    LF1A5   ;2
       LDA    #$00    ;2
       PHA            ;3
       TAX            ;2
       TAY            ;2
       STX    $8B     ;3
       JMP    LF121   ;3

       ; Check for game reset

LF1B9: LDY    #$00    ;2
       ROR    SWCHB   ;6 Check if Game reset is pressed
       BCC    GAMERESET   ;2 Game reset pressed

       LDA    $CC     ;3
       BEQ    LF1EE   ;2
       LDA    $8A     ;3
       JSR    LF314   ;6
       STY    $CC     ;3
       LDA    #$04    ;2
       BIT    $CD     ;3
       BNE    LF1F7   ;2
       INC    $80     ;5
       INC    $8C     ;5
       LDA    #$05    ;2
       BNE    LF23F   ;2

GAMERESET:
       LDA    $CC     ;3
       BNE    LF1EE   ;2
       INC    $CC     ;5
       JSR    LF478   ;6
       JSR    LF658   ;6
       LDA    #$2F    ;2
       STA    $D4     ;3
       LDA    #$06    ;2
       JMP    LF314   ;3

LF1EE: LDA    $81     ;3
       BEQ    LF22A   ;2
       JSR    LF658   ;6
       STY    $81     ;3
LF1F7: INC    $8C     ;5
       INC    $82     ;5
       STY    $94     ;3
       LDY    #$80    ;2
       STY    $98     ;3

; Check game difficulty

       LDA    SWCHB   ;4
       LDX    $CD     ;3
       CPX    #$04    ;2
       BCC    LF20C   ;2
       EOR    #$FF    ;2
LF20C: AND    #%01000000 ;2 P0 difficulty
       BNE    LF216   ;2 1=Pro (A)

       LDY    #$01    ;2
       LDA    #$06    ;2
       BNE    LF21A   ;2

LF216: STY    $94     ;3
       LDA    #$03    ;2
LF21A: STY    $96     ;3
       STY    $97     ;3
       STA    $95     ;3

       LDA    #$15    ;2
LF222: STA    $D4     ;3 GRAPHICS
       JSR    LF518   ;6
       JMP    LF243   ;3

LF22A: LDA    $9A     ;3
       BEQ    LF254   ;2
       JSR    LF658   ;6
       LDA    $CD     ;3
       CLC            ;2
       ADC    #$01    ;2
       STA    $D6     ;3  GRAPHICS
       JSR    LF6AF   ;6
       DEC    $9A     ;5
       LDA    #$0D    ;2
LF23F: STY    $CE     ;3
       BNE    LF222   ;2

LF243: LDX    $8A     ;3
LF245: DEX            ;2
       LDA    $B8,X   ;4
       CMP    #$0A    ;2
       BCC    LF245   ;2
       LDA    #$03    ;2
       AND    $CD     ;3
       ADC    #$0B    ;2
       STA    $B8,X   ;4
LF254: RTS            ;6

LF255: LDY    #$00    ;2
       LDA    #$02    ;2 mask for bit 1
       BIT    SWCHB   ;4 Is game select pressed?
       BNE    LF270   ;2 Not pressed

; Game select pressed

       LDA    $CB     ;3
       BNE    LF2CF   ;2 Not ready yet?
       JSR    LF478   ;6
       JSR    LF6E8   ;6
       LDA    $CD     ;3
       CLC            ;2
       ADC    #$01    ;2
       JMP    LF314   ;3

LF270: LDX    $89     ;3
       LDA    $8C     ;3
       BEQ    LF2C8   ;2
       LDA    $A2     ;3
       BNE    LF297   ;2
       LDA    $88     ;3
       BNE    LF28D   ;2
       LDA    REFP1   ;3
       BMI    LF2BF   ;2
       LDA    #%00001100    ;2
LF284: STA    AUDC0   ;3
       STY    $82     ;3
       INC    $88     ;5
       JMP    LF312   ;3
LF28D: LDA    $A6     ;3
       BNE    LF2D1   ;2
       STY    $88     ;3
       STY    AUDV1   ;3
       BEQ    LF29F   ;2
LF297: LDA    REFP1   ;3
       BPL    LF2BF   ;2
       STY    $A2     ;3
       BMI    LF2BF   ;2
LF29F: INC    $A2     ;5
       JSR    LF668   ;6
       LDA    $80     ;3
       BNE    LF2AF   ;2
       STY    $8C     ;3
       INC    $83     ;5
LF2AC: JMP    LF327   ;3

LF2AF: LDA    $C4,X   ;4
       CMP    #$0A    ;2
       BCS    LF2AC   ;2
       STA    $CE     ;3
       STY    $9E     ;3
       STY    $80     ;3
       INC    $81     ;5
       BNE    LF2AC   ;2

LF2BF: LDA    SWCHA   ;4
       AND    #%11110000    ;2 Mask for player 0
       CMP    #%11110000    ;2 Is any direction chosen?
       BNE    LF2CB   ;2 Yes
LF2C8: STY    $CB     ;3
       RTS            ;6

; Handle joystick 0 position

LF2CB: LDA    $CB     ;3
       BEQ    LF2D2   ;2
LF2CF: DEC    $CB     ;5
LF2D1: RTS            ;6

LF2D2: LDA    #%00100000    ;2
       BIT    SWCHA   ;4    ; player 0: check bits 6, 7 (right, left)
       BPL    LF2FE   ;2
       BVC    LF2FA   ;2
       BEQ    LF2F2   ;2
       INC    $C4,X   ;6
       CLC            ;2
       LDA    $C4,X   ;4
       ADC    #$F5    ;2
       BCC    LF2E8   ;2
LF2E6: STA    $C4,X   ;4
LF2E8: LDA    #$40    ;2
       STA    $A7     ;3
       LDA    $C4,X   ;4
       LDX    #$0F    ;2
       BNE    LF31A   ;2

LF2F2: DEC    $C4,X   ;6
       BPL    LF2E8   ;2
       LDA    #$0A    ;2
       BNE    LF2E6   ;2

LF2FA: LDA    #$FF    ;2
       BNE    LF300   ;2

LF2FE: LDA    #$01    ;2
LF300: LDX    $80     ;3
       BNE    LF2D1   ;2
       CLC            ;2
       ADC    $89     ;3
LF307: STA    $89     ;3
       BPL    LF30D   ;2
       LDA    #$0B    ;2
LF30D: CLC            ;2
       ADC    #$FA    ;2
       BCS    LF307   ;2
LF312: LDA    $89     ;3

LF314: LDX    #$C0    ;2
       STX    $A7     ;3
       LDX    #$1E    ;2
LF31A: CLC            ;2
       ADC    #$AD    ;2
       STA    $D6     ;3
       LDA    $A7     ;3
       ORA    ($D6),Y ;5
       STA    $A7     ;3
       INC    $A6     ;5

LF327: STX    $CB     ;3
       STY    $9B     ;3
       STY    $9C     ;3
       LDX    #$A8    ;2
       JMP    LF47A   ;3

LF332: LDA    $90     ;3
       BEQ    LF38C   ;2
       DEC    $90     ;5
       LDX    #$A2    ;2
       JSR    LF47A   ;6
       STY    $91     ;3
       LDX    $B1     ;3
       INC    $DC     ;5
       LDA    #$BC    ;2
       JSR    LF7C7   ;6
       LDX    $B0     ;3
       LDA    #$BE    ;2
       JSR    LF7C5   ;6
       LDX    $8A     ;3
       LDA    #$03    ;2
       AND    $CD     ;3
       CMP    #$03    ;2
       BNE    LF368   ;2
       INX            ;2
       INX            ;2
       LDA    $AE     ;3
       BNE    LF366   ;2
       LDY    $C4,X   ;4
       CPY    #$0A    ;2
       BNE    LF366   ;2
       TYA            ;2
LF366: STA    $BE,X   ;4
LF368: LDY    #$00    ;2
       LDX    #$05    ;2
LF36C: LDA    $BE,X   ;4
       CMP    $C4,X   ;4
       BNE    LF380   ;2
       DEX            ;2
       BPL    LF36C   ;2
       STY    $A1     ;3
       TYA            ;2
       SED            ;2
       SEC            ;2
       ADC    $84     ;3
       STA    $84     ;3
       BNE    LF382   ;2
LF380: INC    $A1     ;5
LF382: SED            ;2
       SEC            ;2
       TYA            ;2
       ADC    $85     ;3
       STA    $85     ;3
       CLD            ;2
       INC    $A0     ;5
LF38C: RTS            ;6

; METHOD: Draws cursor under number (?)
; $89: ?
; $9B: cursor flash speed?
; $9C: ?
; $A5: ?

LF38D: LDA    $8C     ;3
       BEQ    LF3AE   ;2
       LDX    $89     ;3

       LDA    $9C     ;3
       BEQ    LF39B   ;2
       LDY    #$0F    ;2
       BNE    LF39D   ;2
LF39B: LDY    #$3C    ;2

LF39D: LDA    $9B     ;3
       BEQ    LF3A4   ;2
       DEC    $9B     ;5
       RTS            ;6

LF3A4: STY    $9B     ;3
       LDA    #$FF    ;2
       EOR    $9C     ;3
       STA    $9C     ;3
       INC    $A5     ;5
LF3AE: RTS            ;6

LF3AF: LDA    $A0     ;3
       BEQ    LF3E0   ;2
       LDA    $A3     ;3
       BEQ    LF3D3   ;2
       LDA    $87     ;3
       BNE    LF3CF   ;2
       LDA    $85     ;3
       CMP    #$10    ;2
       BNE    LF3CB   ;2
       INC    $86     ;5
       JSR    LF658   ;6
LF3C6: LDX    #$A0    ;2
       JMP    LF47A   ;3
LF3CB: INC    $81     ;5
       BNE    LF3C6   ;2
LF3CF: DEC    $87     ;5
       BEQ    LF3C6   ;2
LF3D3: LDA    $A1     ;3
       BNE    LF3E1   ;2
       LDX    #$35    ;2
       JSR    LF419   ;6
       LDA    $A2     ;3
       BNE    LF408   ;2
LF3E0: RTS            ;6

LF3E1: LDA    $A2     ;3
       BNE    LF3EA   ;2
       LDX    #$4D    ;2
       JSR    LF419   ;6
LF3EA: LDA    #$25    ;2
       STA    $D6     ;3
       LDA    #$1D    ;2
       STA    $D8     ;3
LF3F2: LDA    $9C     ;3
       BEQ    LF3FC   ;2
       LDA    $D6     ;3
       LDY    #$0F    ;2
       BNE    LF40F   ;2
LF3FC: LDA    $A5     ;3
       CMP    #$06    ;2
       BCC    LF40B   ;2
       LDY    #$60    ;2
       CMP    #$07    ;2
       BCC    LF411   ;2
LF408: INC    $A3     ;5
       RTS            ;6

LF40B: LDA    $D8     ;3
       LDY    #$1E    ;2
LF40F: STA    $D4     ;3
LF411: JMP    LF39D   ;3
LF414: LDA    $A6     ;3
       BNE    LF427   ;2
       RTS            ;6

LF419: LDA    $A6     ;3
       BNE    LF42D   ;2
       LDA    $A4     ;3
       BNE    LF427   ;2
       STX    $A4     ;3
       LDA    #$03    ;2
       STA    $92     ;3
LF427: LDA    $A9     ;3
       BEQ    LF42E   ;2
       DEC    $A9     ;5
LF42D: RTS            ;6

LF42E: LDA    $A8     ;3
       BEQ    LF43D   ;2
       STA    $A9     ;3
LF434: LDA    #%00000100   ;2
       STA    AUDC0   ;3
       LDX    #$A6    ;2
       JMP    LF47A   ;3
LF43D: INC    $A8     ;5
       LDA    $A7     ;3
       BNE    LF466   ;2
       LDA    $92     ;3
       BNE    LF452   ;2
       LDA    #$03    ;2
       STA    $92     ;3
       CLC            ;2
       LDA    #$05    ;2
       ADC    $A4     ;3
       STA    $A4     ;3
LF452: DEC    $92     ;5
       LDY    #$00    ;2
       LDA    $A4     ;3
       STA    $D6     ;3
       INC    $A4     ;5
       LDA    ($D6),Y ;5
       CMP    #$FF    ;2
       BNE    LF466   ;2
       INC    $A2     ;5
       BNE    LF434   ;2
LF466: TAY            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       AND    #$FC    ;2
       STA    $A9     ;3
       TYA            ;2
       AND    #$1F    ;2
       STA    AUDF0   ;3
       LDA    #$08    ;2
       STA    AUDV0   ;3
       RTS            ;6

;
; METHOD: Reset sounds?
;
; First entry ($F478): start from $80
; Second entry ($F47A): start at X
;
; * Zero out addresses $X to $AA
; * Store #$20 in $AB

LF478: LDX    #$80    ;2
LF47A: LDY    #$00    ;2
LF47C: STY    $0,X ;4
       INX            ;2
       CPX    #$AA    ;2
       BNE    LF47C   ;2

       STY    AUDV0   ;3 Turn off Audio Volume 0
       STY    AUDV1   ;3 Turn off Audio Volume 1
       LDA    #$20    ;2
       STA    $AB     ;3
       RTS            ;6

LF48C: LDA    $83     ;3
       BEQ    LF4A0   ;2
       LDA    #$00    ;2
       STA    $83     ;3
       STA    $B0     ;3
       STA    $B1     ;3
       LDA    #$03    ;2
       AND    $CD     ;3
       TAX            ;2
       INX            ;2
       STX    $8E     ;3
LF4A0: RTS            ;6

; METHOD:

LF4A1: SED            ;2
       LDX    $8E     ;3
       DEX            ;2
       BNE    LF4BC   ;2
       CLC            ;2
       LDA    $AE     ;3
       ADC    $AF     ;3
       STA    $B0     ;3
       BCC    LF4B2   ;2
       INC    $B1     ;5
LF4B2: CLD            ;2
       LDA    #$00    ;2
       STA    $8E     ;3
       STA    $8F     ;3
       INC    $90     ;5
       RTS            ;6

LF4BC: DEX            ;2
       BNE    LF4C8   ;2
       SEC            ;2
       LDA    $AE     ;3
       SBC    $AF     ;3
       STA    $B0     ;3
       BCS    LF4B2   ;2
LF4C8: DEX            ;2
       BNE    LF4ED   ;2
       LDA    $8F     ;3
       BNE    LF4D1   ;2
       INC    $8F     ;5
LF4D1: LDX    #$21    ;2
LF4D3: LDA    $B0     ;3
       CLC            ;2
       ADC    $AE     ;3
       STA    $B0     ;3
       LDA    $B1     ;3
       ADC    #$00    ;2
       STA    $B1     ;3
       LDA    $AF     ;3
       SBC    #$00    ;2
       STA    $AF     ;3
       BEQ    LF515   ;2
       DEX            ;2
       BNE    LF4D3   ;2
       CLD            ;2
       RTS            ;6

LF4ED: DEX            ;2
       BNE    LF50F   ;2
       LDX    #$21    ;2
       LDA    $8F     ;3
       BNE    LF4FC   ;2
       LDA    #$99    ;2
       STA    $B0     ;3
       INC    $8F     ;5
LF4FC: LDA    #$00    ;2
       SEC            ;2
       ADC    $B0     ;3
       STA    $B0     ;3
       LDA    $AE     ;3
       SEC            ;2
       SBC    $AF     ;3
       STA    $AE     ;3
       BCC    LF511   ;2
       DEX            ;2
       BNE    LF4FC   ;2
LF50F: CLD            ;2
       RTS            ;6

LF511: ADC    $AF     ;3
       STA    $AE     ;3
LF515: JMP    LF4B2   ;3
LF518: LDX    #$02    ;2
       LDA    $AC     ;3
       STA    $DE     ;3 GRAPHICS
       LDA    $CD     ;3
       CMP    #$04    ;2
       BCC    LF57C   ;2

       LDA    $AD     ;3
       STA    $E0     ;3
       BIT    SWCHB   ;4
       BVC    LF531   ;2

       LDX    #$03    ;2
       BNE    LF53D   ;2
LF531: LDA    #$0F    ;2
       AND    $DE     ;3
       STA    $DE     ;3
       LDA    #$0F    ;2
       AND    $E0     ;3
       STA    $E0     ;3
LF53D: STX    $8A     ;3
       STX    $89     ;3
       LDY    $DE     ;3
       CPY    $E0     ;3
       BCS    LF54D   ;2
       LDA    $E0     ;3
       STY    $E0     ;3
       STA    $DE     ;3
LF54D: LDA    $DE     ;3
       BNE    LF555   ;2
       LDA    #$01    ;2
       STA    $DE     ;3
LF555: STA    $AE     ;3
       LDA    $E0     ;3
       BNE    LF55D   ;2
       LDA    $DE     ;3
LF55D: LDY    $CD     ;3
       CPY    #$07    ;2
       BNE    LF567   ;2
       AND    #$0F    ;2
       BEQ    LF56F   ;2
LF567: CMP    $CF     ;3
       BNE    LF576   ;2
       CMP    #$02    ;2
       BCS    LF571   ;2
LF56F: LDA    #$02    ;2
LF571: SED            ;2
       CLC            ;2
       SBC    #$00    ;2
       CLD            ;2
LF576: STA    $CF     ;3
       STA    $AF     ;3
       BNE    LF5DD   ;2
LF57C: STX    $8A     ;3
       STX    $89     ;3
LF580: LDA    $9E     ;3
       BNE    LF59F   ;2
       INC    $9E     ;5
       LDA    #$09    ;2
       BIT    $CD     ;3
       BEQ    LF594   ;2
       LDA    $CE     ;3
       BNE    LF594   ;2
       LDA    #$01    ;2
       STA    $CE     ;3
LF594: STA    $9D     ;3
       LDA    #$0F    ;2
       AND    $DE     ;3
       STA    $9F     ;3
       JMP    LF5B6   ;3
LF59F: LDA    $9D     ;3
       BNE    LF5B2   ;2
       STA    $9E     ;3
       INC    $CE     ;5
       CLC            ;2
       LDA    $CE     ;3
       ADC    #$F6    ;2
       BCC    LF580   ;2
       STA    $CE     ;3
       BCS    LF580   ;2
LF5B2: INC    $9F     ;5
       LDA    $9F     ;3
LF5B6: CLC            ;2
       ADC    #$F7    ;2
       BCC    LF5BD   ;2
       STA    $9F     ;3
LF5BD: LDY    $9F     ;3
       LDA    #$B8    ;2
       STA    $D8     ;3 GRAPHICS
       LDA    ($D8),Y ;5 GRAPHICS
       STA    $AF     ;3
       LDA    $CE     ;3
       BNE    LF5CF   ;2
       LDA    #$01    ;2
       STA    $CE     ;3
LF5CF: STA    $AE     ;3
       CMP    $AF     ;3
       BCS    LF5DB   ;2
       LDA    #$01    ;2
       BIT    $CD     ;3
       BNE    LF5B2   ;2
LF5DB: DEC    $9D     ;5
LF5DD: LDX    $AE     ;3
       LDA    #$B2    ;2
       JSR    LF7C1   ;6
       LDX    $AF     ;3
       LDA    #$B8    ;2
       JSR    LF7C1   ;6
       RTS            ;6

; Idle screen (no game playing)?

LF5EC: LDX    #$00    ;2
       LDA    $93     ;3
       BNE    LF64E   ;2
       DEC    $94     ;5
       BNE    LF5FC   ;2
       DEC    $95     ;5
       DEC    $AB     ;5
       BEQ    LF637   ;2

LF5FC: BIT    SWCHB   ;4
       BPL    LF636   ;2
       LDY    $82     ;3
       BEQ    LF636   ;2
       LDY    $95     ;3
       BEQ    LF653   ;2
       LDA    $97     ;3
       CMP    #$80    ;2
       BEQ    LF614   ;2
       AND    $95     ;3
       JMP    LF616   ;3
LF614: AND    $94     ;3
LF616: CMP    $96     ;3
       BEQ    LF61E   ;2
       STA    $96     ;3
       LSR    $98     ;5
LF61E: LDA    $98     ;3
       AND    $94     ;3
       CMP    $99     ;3
       BEQ    LF632   ;2
       STA    $99     ;3
       LDA    $99     ;3
       BEQ    LF630   ;2
       LDX    #$0D    ;2
       BNE    LF632   ;2
LF630: LDX    #$1D    ;2
LF632: STX    AUDF1   ;3
       STX    AUDV1   ;3
LF636: RTS            ;6

LF637: JSR    LF478   ;6
       INC    $93     ;5
LF63C: JSR    LF668   ;6
       JSR    LF518   ;6
       JSR    LF6E8   ;6

; Set background color to $AA
       LDA    $AA     ;3
       STA    COLUBK  ;3

       EOR    #$FF    ;2
       STA    COLUPF  ;3
       RTS            ;6

LF64E: DEC    $94     ;5
       BEQ    LF63C   ;2
       RTS            ;6

LF653: LDA    #$0F    ;2
       JMP    LF284   ;3
LF658: LDX    #$05    ;2
       LDA    #$0A    ;2
LF65C: STA    $B2,X   ;4
       STA    $B8,X   ;4
       STA    $BE,X   ;4
       STA    $C4,X   ;4
       DEX            ;2
       BPL    LF65C   ;2
       RTS            ;6

LF668: SED            ;2
       LDA    $AA     ;3
       ADC    $AD     ;3
       STA    $AC     ;3
       LDA    $AA     ;3
       ADC    $AC     ;3
       STA    $AD     ;3
       CLD            ;2
       RTS            ;6

LF677: LDA    $86     ;3
       BNE    LF67C   ;2
LF67B: RTS            ;6
LF67C: LDA    $A2     ;3
       BNE    LF685   ;2
       LDX    #$65    ;2
       JSR    LF419   ;6
LF685: LDA    $A3     ;3
       BNE    LF67B   ;2
       LDA    $84     ;3
       STA    $D6     ;3
       LDA    $85     ;3
       STA    $D8     ;3
       JSR    LF69F   ;6
       LDA    #$2E    ;2
       STA    $D6     ;3
       LDA    #$2F    ;2
       STA    $D8     ;3
       JMP    LF3F2   ;3
LF69F: LDA    #$F0    ;2
       AND    $D8     ;3
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    $C8     ;3
       LDA    #$0F    ;2
       AND    $D8     ;3
       STA    $C9     ;3
LF6AF: LDA    #$F0    ;2
       AND    $D6     ;3
       BNE    LF6B7   ;2
       LDA    #$A0    ;2
LF6B7: LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    $C4     ;3
       LDA    #$0F    ;2
       AND    $D6     ;3
       STA    $C5     ;3
       RTS            ;6

; METHOD: Draws current board (?)

LF6C4: LDA    $93     ;3
       BNE    LF6E7   ;2

       LDY    $CD     ;3 Color to use ($7d),Y and ($85),Y
; Determine background color to X
       LDA    #<bg_colors    ;2
       STA    $D6     ;3
       LDA    ($D6),Y ;5 GRAPHICS
       TAX            ;2
; Determine foreground color to Y
       LDA    #<fg_colors    ;2
       STA    $D6     ;3
       LDA    ($D6),Y ;5 GRAPHICS
       TAY            ;2

       LDA    #$08    ;2 Mask for bit 3
       BIT    SWCHB   ;4 Color or B/W?
       BNE    SETCOLORS   ;2 1=color

; B/W color set (constant gray on black)
       LDX    #$00    ;2
       LDY    #$0B    ;2

; Set background color to X, playfield (digits) color to Y
SETCOLORS:
       STX    COLUBK  ;3
       STY    COLUPF  ;3
LF6E7: RTS            ;6

LF6E8: INC    $9A     ;5
       INC    $CD     ;5
       LDA    $CD     ;3
       CLC            ;2
       ADC    #$F8    ;2
       BCC    LF6F5   ;2
       STA    $CD     ;3
LF6F5: RTS            ;6

; ----------------------------------------------------------------------------
; GRAPHICS SEGMENT

       SEG GRAPHICS
       ORG $F700,0

Graphics
zero
       .byte $E7 ; |XXX  XXX| $F700
       .byte $A5 ; |X X  X X| $F701
       .byte $A5 ; |X X  X X| $F702
       .byte $A5 ; |X X  X X| $F703
       .byte $E7 ; |XXX  XXX| $F704

       .byte $C9 ; |XX  X  X| $F705
       .byte $BD ; |X XXXX X| $F706
       .byte $FF ; |XXXXXXXX| $F707

one
       .byte $81 ; |X      X| $F708
       .byte $81 ; |X      X| $F709
       .byte $81 ; |X      X| $F70A
       .byte $81 ; |X      X| $F70B
       .byte $81 ; |X      X| $F70C

       .byte $C9 ; |XX  X  X| $F70D
       .byte $B7 ; |X XX XXX| $F70E
       .byte $BD ; |X XXXX X| $F70F

two
       .byte $E7 ; |XXX  XXX| $F710
       .byte $81 ; |X      X| $F711
       .byte $E7 ; |XXX  XXX| $F712
       .byte $24 ; |  X  X  | $F713
       .byte $E7 ; |XXX  XXX| $F714

       .byte $B7 ; |X XX XXX| $F715
       .byte $BD ; |X XXXX X| $F716
       .byte $C9 ; |XX  X  X| $F717

three
       .byte $E7 ; |XXX  XXX| $F718
       .byte $81 ; |X      X| $F719
       .byte $C3 ; |XX    XX| $F71A
       .byte $81 ; |X      X| $F71B
       .byte $E7 ; |XXX  XXX| $F71C

       .byte $B7 ; |X XX XXX| $F71D
       .byte $BD ; |X XXXX X| $F71E
       .byte $FF ; |XXXXXXXX| $F71F

four
       .byte $A5 ; |X X  X X| $F720
       .byte $A5 ; |X X  X X| $F721
       .byte $E7 ; |XXX  XXX| $F722
       .byte $81 ; |X      X| $F723
       .byte $81 ; |X      X| $F724

       .byte $B7 ; |X XX XXX| $F725
       .byte $BD ; |X XXXX X| $F726
       .byte $C3 ; |XX    XX| $F727

five
       .byte $E7 ; |XXX  XXX| $F728
       .byte $24 ; |  X  X  | $F729
       .byte $E7 ; |XXX  XXX| $F72A
       .byte $81 ; |X      X| $F72B
       .byte $E7 ; |XXX  XXX| $F72C

       .byte $00 ; |        | $F72D
       .byte $C9 ; |XX  X  X| $F72E
       .byte $FF ; |XXXXXXXX| $F72F

six
       .byte $E7 ; |XXX  XXX| $F730
       .byte $24 ; |  X  X  | $F731
       .byte $E7 ; |XXX  XXX| $F732
       .byte $A5 ; |X X  X X| $F733
       .byte $E7 ; |XXX  XXX| $F734

       .byte $3C ; |  XXXX  | $F735
       .byte $34 ; |  XX X  | $F736
       .byte $30 ; |  XX    | $F737

seven
       .byte $E7 ; |XXX  XXX| $F738
       .byte $81 ; |X      X| $F739
       .byte $81 ; |X      X| $F73A
       .byte $81 ; |X      X| $F73B
       .byte $81 ; |X      X| $F73C

       .byte $4D ; | X  XX X| $F73D
       .byte $30 ; |  XX    | $F73E
       .byte $8D ; |X   XX X| $F73F

eight
       .byte $E7 ; |XXX  XXX| $F740
       .byte $A5 ; |X X  X X| $F741
       .byte $E7 ; |XXX  XXX| $F742
       .byte $A5 ; |X X  X X| $F743
       .byte $E7 ; |XXX  XXX| $F744

       .byte $FF ; |XXXXXXXX| $F745
       .byte $00 ; |        | $F746
       .byte $00 ; |        | $F747

nine
       .byte $E7 ; |XXX  XXX| $F748
       .byte $A5 ; |X X  X X| $F749
       .byte $E7 ; |XXX  XXX| $F74A
       .byte $81 ; |X      X| $F74B
       .byte $81 ; |X      X| $F74C

       .byte $9C ; |X  XXX  | $F74D
       .byte $3C ; |  XXXX  | $F74E
       .byte $F4 ; |XXXX X  | $F74F

blank_1
       .byte $00 ; |        | $F750
       .byte $00 ; |        | $F751
       .byte $00 ; |        | $F752
       .byte $00 ; |        | $F753
       .byte $00 ; |        | $F754

       .byte $9C ; |X  XXX  | $F755
       .byte $34 ; |  XX X  | $F756
       .byte $F0 ; |XXXX    | $F757

blank_2
       .byte $00 ; |        | $F758
       .byte $00 ; |        | $F759
       .byte $00 ; |        | $F75A
       .byte $00 ; |        | $F75B
       .byte $00 ; |        | $F75C

       .byte $FF ; |XXXXXXXX| $F75D
       .byte $00 ; |        | $F75E
       .byte $00 ; |        | $F75F

add
       .byte $00 ; |        | $F760
       .byte $42 ; | X    X | $F761
       .byte $E7 ; |XXX  XXX| $F762
       .byte $42 ; | X    X | $F763
       .byte $00 ; |        | $F764

       .byte $52 ; | X X  X | $F765
       .byte $32 ; |  XX  X | $F766
       .byte $52 ; | X X  X | $F767

subtract
       .byte $00 ; |        | $F768
       .byte $00 ; |        | $F769
       .byte $E7 ; |XXX  XXX| $F76A
       .byte $00 ; |        | $F76B
       .byte $00 ; |        | $F76C

       .byte $56 ; | X X XX | $F76D
       .byte $52 ; | X X  X | $F76E
       .byte $8D ; |X   XX X| $F76F

multiply
       .byte $00 ; |        | $F770
       .byte $A5 ; |X X  X X| $F771
       .byte $42 ; | X    X | $F772
       .byte $A5 ; |X X  X X| $F773
       .byte $00 ; |        | $F774

       .byte $FF ; |XXXXXXXX| $F775
       .byte $00 ; |        | $F776
       .byte $00 ; |        | $F777

divide
       .byte $42 ; | X    X | $F778
       .byte $00 ; |        | $F779
       .byte $E7 ; |XXX  XXX| $F77A
       .byte $00 ; |        | $F77B
       .byte $42 ; | X    X | $F77C

bg_colors

       IF COMPILE_REGION = NTSC

       .byte $13 ; NTSC
       .byte $25 ; NTSC
       .byte $61 ; NTSC
       .byte $17 ; NTSC
       .byte $93 ; NTSC
       .byte $f6 ; NTSC
       .byte $15 ; NTSC
       .byte $27 ; NTSC

       ELSE

       .byte $B3 ; PAL
       .byte $25 ; PAL
       .byte $31 ; PAL
       .byte $47 ; PAL
       .byte $83 ; PAL
       .byte $D3 ; PAL
       .byte $25 ; PAL
       .byte $63 ; PAL

       ENDIF

fg_colors

       IF COMPILE_REGION = NTSC

       .byte $E8 ; NTSC
       .byte $A5 ; NTSC
       .byte $F6 ; NTSC
       .byte $92 ; NTSC
       .byte $15 ; NTSC
       .byte $61 ; NTSC
       .byte $F6 ; NTSC
       .byte $C6 ; NTSC

       ELSE

       .byte $48 ; PAL
       .byte $D5 ; PAL
       .byte $86 ; PAL
       .byte $D2 ; PAL
       .byte $35 ; PAL
       .byte $23 ; PAL
       .byte $B6 ; PAL
       .byte $36 ; PAL

       ENDIF

       .byte $0F ; |    XXXX| $F78D
       .byte $01 ; |       X| $F78E
       .byte $00 ; |        | $F78F
       .byte $00 ; |        | $F790
       .byte $00 ; |        | $F791
       .byte $1F ; |   XXXXX| $F792
       .byte $00 ; |        | $F793
       .byte $00 ; |        | $F794
       .byte $00 ; |        | $F795
       .byte $F0 ; |XXXX    | $F796
       .byte $10 ; |   X    | $F797
       .byte $00 ; |        | $F798
       .byte $00 ; |        | $F799
       .byte $00 ; |        | $F79A
       .byte $F0 ; |XXXX    | $F79B
       .byte $80 ; |X       | $F79C
       .byte $00 ; |        | $F79D
       .byte $00 ; |        | $F79E
       .byte $00 ; |        | $F79F
       .byte $F8 ; |XXXXX   | $F7A0
       .byte $00 ; |        | $F7A1
       .byte $00 ; |        | $F7A2
       .byte $00 ; |        | $F7A3
       .byte $0F ; |    XXXX| $F7A4
       .byte $00 ; |        | $F7A5
       .byte $FF ; |XXXXXXXX| $F7A6
       .byte $10 ; |   X    | $F7A7
       .byte $00 ; |        | $F7A8
       .byte $00 ; |        | $F7A9
       .byte $FF ; |XXXXXXXX| $F7AA
       .byte $F0 ; |XXXX    | $F7AB
       .byte $80 ; |X       | $F7AC
       .byte $1D ; |   XXX X| $F7AD
       .byte $1C ; |   XXX  | $F7AE
       .byte $19 ; |   XX  X| $F7AF
       .byte $16 ; |   X XX | $F7B0
       .byte $14 ; |   X X  | $F7B1
       .byte $12 ; |   X  X | $F7B2
       .byte $10 ; |   X    | $F7B3
       .byte $0E ; |    XXX | $F7B4
       .byte $0D ; |    XX X| $F7B5
       .byte $0C ; |    XX  | $F7B6
       .byte $0A ; |    X X | $F7B7
       .byte $09 ; |    X  X| $F7B8
       .byte $04 ; |     X  | $F7B9
       .byte $07 ; |     XXX| $F7BA
       .byte $03 ; |      XX| $F7BB
       .byte $01 ; |       X| $F7BC
       .byte $05 ; |     X X| $F7BD
       .byte $08 ; |    X   | $F7BE
       .byte $02 ; |      X | $F7BF
       .byte $06 ; |     XX | $F7C0

LF7C1: LDY    #$00    ;2
       STY    $91     ;3
LF7C5: STY    $DC     ;3
LF7C7: STX    $DA     ;3 GRAPHICS
       CLC            ;2
       ADC    $8A     ;3
       TAX            ;2
       DEX            ;2
       LDA    #$F0    ;2
       AND    $DA     ;3 GRAPHICS
       BNE    LF7D8   ;2
       CPY    $91     ;3
       BEQ    LF7E0   ;2
LF7D8: INC    $91     ;5
       LSR            ;2
       LSR            ;2
       LSR            ;2
       LSR            ;2
       STA    $0,X ;4
LF7E0: INX            ;2
       LDA    #$0F    ;2
       AND    $DA     ;3 GRAPHICS
       BNE    LF7EF   ;2
       CPY    $91     ;3
       BNE    LF7EF   ;2
       CPY    $DC     ;3
       BNE    LF7F3   ;2
LF7EF: INC    $91     ;5
       STA    $0,X ;4
LF7F3: RTS            ;6

; METHOD: Wait for PIA Timer
;
; Waits until INTTIM reaches zero.
; Returns with A=0
;

; Scan lines take 76 CPU cycles each.
; overhead = 9
;  Loop: 6 cycles each iteration
;  STA WSYNC 3 cycles
; cycles = ((number_of_scanlines_to_skip * 76) - overhead)

; If using TIM64T:
; Each timer tick takes 64 CPU cycles.
; set TIM64T to (cycles / 64)

; If using TIM8T:
; Each timer tick takes 8 CPU cycles.
; set TIM8T to (cycles / 8)

WaitForTimerDone:
       LDA    INTIM   ;4 Get current timer value
       BNE    WaitForTimerDone   ;2
       ; Can't guarantee timer ends at exactly the end of a scanline, so
       ; using "STA WSYNC" to continue at beginning of next scanline.
       STA    WSYNC   ;3 halt the CPU until the next scanline starts.
       RTS            ;6

; ----------------------------------------------------------------------------
; VECTORS

       org ROM_BASE + 2048 - 4, 0  ; 2K ROM
       .word START                 ; RESET vector
       .word $0000                 ; BRK vector
