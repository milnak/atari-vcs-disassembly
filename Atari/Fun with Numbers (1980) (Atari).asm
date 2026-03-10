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


; ----------------------------------------------------------------------------
; Quick Reference

; ## One-Page Cheat Sheet
;
; ### RAM Variables (Most Important)
; $84       Current score (BCD: $00-$99)
; $89       Current digit being selected (0-9, wraps to 0)
; $8C       Game running flag (0=not playing, non-zero=active)
; $B0-$B1   First problem operand
; $B3       Second problem operand
; $B4       Expected answer
; $BE-$C5   Player-entered answer (6 bytes)
; $C4,X     Current digit at index X
; $CA       Graphics lookup index
; $CC       Reset debounce counter
; $CD       Game mode (0-7)
; $D4-$E0   Graphics pointers (high bytes, low filled dynamically)
;
; ### Hardware Registers (Video/Audio)
; $00       VSYNC     (Vertical sync control)
; $01       VBLANK    (Vertical blank control)
; $02       WSYNC     (Wait for scanline sync)
; $08       COLUPF    (Playfield color)
; $09       COLUBK    (Background color)
; $0D-$0F   PF0,PF1,PF2 (Playfield graphics)
; $15-$16   AUDC0,AUDC1 (Audio waveform)
; $17-$18   AUDF0,AUDF1 (Audio frequency)
; $19-$1A   AUDV0,AUDV1 (Audio volume)
; $0280     SWCHA     (Read joystick)
; $0282     SWCHB     (Read console switches)
; $0284     INTIM     (Read timer value)
; $0295     TIM8T     (Set timer /8)
;
; ### Joystick Bit Pattern (SWCHA)
; Player 0 (left controller):
; Bit 4: UP     (1=not pressed, 0=pressed)
; Bit 5: DOWN   (1=not pressed, 0=pressed)
; Bit 6: LEFT   (1=not pressed, 0=pressed)
; Bit 7: RIGHT  (1=not pressed, 0=pressed)
;
; ### Console Switches (SWCHB)
; Bit 0: RESET  (1=not pressed, 0=pressed)
; Bit 1: SELECT (1=not pressed, 0=pressed)
; Bit 6: P0 DIFFICULTY (1=Pro/A, 0=Beginner/B)
; Bit 7: P1 DIFFICULTY (1=Pro/A, 0=Beginner/B)
;
; ### Key Instruction Patterns
; ; Clear zero page ($00-$FF)
; LDX #$00
; TXA
; ClrLoop: STA $0,X
;         INX
;         BNE ClrLoop
;
; ; Wait for timer
; WaitTimer: LDA INTIM
;           BNE WaitTimer
;
; ; Add 1 using BCD
; SED
; SEC
; LDA $84
; ADC #$01
; STA $84
; CLD
;
; ; Test joystick for RIGHT movement
; LDA #%00100000
; BIT SWCHA
; BPL RightPressed    ; Branch if bit 7 clear (right)
;
; ### Main Code Sections
; START (LF000)      → Initialize CPU, clear zero page
; LF021              → Main loop: frame sync, graphics load, render
; LF09A              → Graphics rendering loop
; LF1B9              → Input processing and game state
; LF255              → Game select handling
; LF332              → Game logic and scoring
; LF478              → Reset audio/clear variables
; LF4A1              → BCD arithmetic operations
; Graphics (LF6E8)   → Bitmap data for digits
;
; ### Game Flow
; 1. Initialize (START)
;    ↓
; 2. Main Loop (LF021)
;    ├─ Frame sync (VSYNC/VBLANK)
;    ├─ Load graphics into pointers
;    ├─ Render 192 scanlines
;    ├─ Process input (joystick)
;    ├─ Check for game reset
;    └─ Repeat
;
; If reset pressed: → GAMERESET
;    ├─ Clear scores
;    ├─ Clear sounds
;    └─ Restart game
;
; ### Input Processing Flow
; Read SWCHA (joystick register)
;     ↓
; Mask for Player 0 bits (4-7)
;     ↓
; Compare to all-released state ($F0)
;     ├─ If bits show movement:
;     │  ├─ LEFT (bit 6 clear)  → $89 decremented
;     │  └─ RIGHT (bit 7 clear) → $89 incremented
;     │
;     └─ If no movement:
;        └─ Wait for next input
;
; Wrap: $89 counts 0→1→2...9→0→1...
;
; ### Score Tracking
; Stored as BCD in $84-$85:
;   $85 = $00 (always zero, hundreds placeholder)
;   $84 = $00-$99 (actual score in decimal)
;
; Examples:
;   Score 0:  $84=$00
;   Score 5:  $84=$05
;   Score 10: $84=$10 (1 in tens, 0 in ones)
;   Score 42: $84=$42
;
; To increment by 1:
;   SED; SEC; LDA $84; ADC #$01; STA $84; CLD
;
; ### Graphics System
; Graphics ROM at $F7xx contains bitmaps for digits 0-9
;
; 1. Read from Graphics table
; 2. Value is index into graphics ROM
; 3. Multiply by 8 (shift left 3 bits)
; 4. Store in graphics pointer ($D6-$E0)
; 5. During rendering: LDA ($D6),Y → read bitmap byte
; 6. Write to PF0/PF1/PF2 registers
; 7. Repeat for each scanline
;
; ### Video Timing (NTSC)
; 262 scanlines per frame @ 60 Hz = 16.67 ms per frame
;
; 0-2:     VSYNC (vertical sync)
; 3-36:    VBLANK (setup, CPU works, TIA doesn't draw)
; 37-228:  VISIBLE (CPU draws playfield during this 192 scanlines)
; 229-261: VBLANK (cleanup)
;
; Each scanline: 64 CPU cycles @ 3.58 MHz
; Use WSYNC to sync CPU with scanline boundaries
;
; ### Common 6502 Patterns
; ; Countdown loop (X=N to 0)
; LDX #$05
; LoopLabel: (operation)
;           DEX
;           BPL LoopLabel      ; Loop while X≥0
;
; ; Rotate right to test bit 0 (RESET in SWCHB)
; ROR SWCHB
; BCC ResetPressed            ; Branch if bit 0 was 1 (Carry clear)
;
; ; Indirect address
; LDA ($D4),Y                 ; Load from address in $D4-$D5, offset by Y
;
; ; Decimal arithmetic
; SED                         ; Enable BCD mode
; LDA #$05                    ; $05 (decimal 5)
; ADC #$01                    ; Add 1 (BCD)
; STA $84                     ; Result: $06 (decimal 6)
; CLD                         ; Back to binary mode
;
; ### Debugging Tips
; ; Find where a variable changes
; 1. Set breakpoint on write in Stella debugger
;    → Watch $84 (score) changes
; 2. Step through code to trace execution
; 3. Monitor RAM display to see state updates
; 4. Use list file (game.lst) to find addresses
;
; ; Understand screen display
; 1. Set breakpoint at LF09A (rendering loop start)
; 2. Watch $89 as user moves joystick
; 3. See how $D6-$E0 change during frame
; 4. Trace PF0/PF1/PF2 writes during scanlines
;
; ; Audio debugging
; 1. Breakpoint when AUDF0 written
; 2. Monitor AUDV0 volume changes
; 3. Count cycles between audio updates
;
; ### Assembly Testing
; ; Assemble the file
; dasm '.\Fun with Numbers (1980) (Atari).asm' -f3 \
;      -o'output.a26' -l'output.lst' -s'output.sym'
;
; Options:
;   -f3      : Output format (raw binary for 2600)
;   -o'file' : Output file
;   -l'file' : List file (for debugging)
;   -s'file' : Symbol file (for emulator)
;   -v1      : Verbose mode
;   -S       : Address display
;
; ; Test in emulator
; 1. Open output.a26 in Stella
; 2. Run with debugger enabled
; 3. Compare to reference ROM
;
; ### Video Display Layout
; Left Side          Center              Right Side
; (Player Score)     (= Sign)           (Problem #)
;
; Playfield (40 pixels):
;
; PF0 (4px)  PF1 (8px)  PF2 (8px)  [mirror pattern]
; ┌───┬──────────┬──────────┬──────────┬──────────┐
; │   │          │          │          │          │
; │   │ Digits   │ Symbols  │ Digits   │ Mirror   │
; │   │          │          │          │          │
; └───┴──────────┴──────────┴──────────┴──────────┘
;
; ### Game Modes
; Modes 1-4: Player selects first number
;            Computer selects second number
;            Player solves for answer
;
; Modes 5-8: Computer selects both numbers
;            Player solves for answer
;
; Difficulty controls timer (enable/disable) and time limit (12s/24s)
;
; ---
;
; ## Reverse Engineering Checklist
;
; Before modifying code:
; - [ ] Understand what the section does (Architecture doc)
; - [ ] Identify which RAM variables it uses (Memory Map)
; - [ ] Trace where those variables come from and go to
; - [ ] Check what other functions depend on those variables
; - [ ] Assemble with `dasm` to verify syntax
; - [ ] Test in Stella emulator
; - [ ] Compare binary output to ensure unchanged
;
; ---
;
; ## Emergency Reference
;
; **I need to find where the score is updated:**
; → Search for `$84` writes in editor
; → Usually: `LDA $84` + `ADC #$01` + `STA $84` with SED/CLD
;
; **I need to find input handling:**
; → Look for `SWCHA` reads
; → Usually: `LDA SWCHA` + `AND` + `BIT` or `CMP`
; → Check around line 776-820
;
; **I need to understand a specific address:**
; → Check Memory Map in Analysis doc
; → $80-$8F: Game state
; → $B0-$C5: Problem data
; → $D4-$E0: Graphics pointers
;
; **The game isn't displaying correctly:**
; → Check WSYNC / TIM8T usage
; → Verify VBLANK setup at frame start
; → Check PF0/PF1/PF2 writes timing
; → Use Stella debugger to trace rendering
;
; **Audio not playing:**
; → Check AUDV0 isn't zeroed out
; → Verify AUDC0 waveform set
; → Check AUDF0 frequency value set
; → Look for muting at end (AUDV0=#$00)

; -----------------------------------------------------------------------------
; Disassembly Analysis

; ## Overview
; Fun with Numbers is an educational Atari 2600 game where players cycle through digits (0-9) using the joystick to fill in math problems. The game features 8 modes with varying difficulty levels controlled by the console's difficulty switches.
;
; ## Key Game Mechanics
;
; ### Game Modes
; - **Modes 1-4**: Player selects first number, computer chooses second number
; - **Modes 5-8**: Both numbers chosen by computer
;
; ### Difficulty Switches
; - **RIGHT DIFFICULTY switch** (A/B): Enables/disables timer
; - **LEFT DIFFICULTY switch** (A/B):
;   - Modes 1-4: Chooses 12 or 24 second time limit
;   - Modes 5-8: Single digit (12s) vs two-digit (24s) problems
;
; ### Scoring
; - 1 point per correct answer
; - 10 rounds per game
; - Score display after game ends
;
; ## Memory Map & Variables
;
; ### Graphics Pointers ($D4-$E1)
; These RAM addresses hold high bytes for graphics data addresses. The low byte is filled dynamically during rendering:
; - `$D4`, `$D6`: Graphics pointer 1
; - `$D8`: Graphics pointer 2
; - `$DA`: Graphics pointer 3 (also labels as GRAPHICS)
; - `$DC`: Graphics pointer 4
; - `$DE`: Graphics pointer 5
; - `$E0`: Graphics pointer 6
;
; ### Game State Variables ($80-$AB)
; | Address | Purpose |
; |---------|---------|
; | `$80` | Player input flag (0=no input, non-zero=input active) |
; | `$81` | Game state flag |
; | `$82` | Debounce counter |
; | `$83` | Difficulty/mode setup flag |
; | `$84` | Score (BCD, ones/tens place) |
; | `$85` | Score (BCD, hundreds place) |
; | `$86` | Round counter (BCD format using SED/CLD) |
; | `$87` | Answer validation timer |
; | `$88` | Input processing state |
; | `$89` | Current selected digit (0-10) - cycles through displayed numbers |
; | `$8A` | Player index or mode counter |
; | `$8B` | Screen rendering control |
; | `$8C` | Game active flag (0=not started/ended, non-zero=game running) |
; | `$8D` | Screen drawing loop counter |
; | `$8E` | Operation type counter (addition/subtraction/etc) |
; | `$8F` | Carry/borrow flag for BCD arithmetic |
; | `$90` | Animation/rendering frame counter |
;
; ### Operand & Answer Storage ($B0-$C9)
; | Address | Purpose |
; |---------|---------|
; | `$B0` | First operand (left number) |
; | `$B1` | First operand high byte |
; | `$B2-$B7` | Generated problem data |
; | `$C0-$C5` | Player-entered answer (6 digits stored as bytes) |
;
; ### Rendering Variables ($CA-$E0)
; | Address | Purpose |
; |---------|---------|
; | `$CA` | Graphics table index |
; | `$CB` | Input debounce timer |
; | `$CC` | Reset debounce counter |
; | `$CD` | Current game mode (0-7) |
; | `$CE` | Score display buffer |
; | `$CF` | Problem number display |
;
; ### Audio/Animation Variables ($A0-$A9)
; | Address | Purpose |
; |---------|---------|
; | `$A0` | Answer display timer |
; | `$A1` | Answer validation state |
; | `$A2` | Sound duration counter |
; | `$A3` | Sound effect state |
; | `$A4` | Sound frequency table pointer |
; | `$A5` | Flash/animation counter |
; | `$A6` | Sound busy flag |
; | `$A7` | Sound frequency/control |
; | `$A8` | Sound note counter |
; | `$A9` | Sound volume/duration |
;
; ## Code Sections
;
; ### Section 1: Initialization (LF000-LF027)
; **Purpose**: CPU setup, zero page clearing, basic initialization
;
; START:
;   SEI                 ; Disable interrupts
;   LDX #$FF            ; Set stack pointer to top of stack
;   TXS
;   CLD                 ; Disable BCD mode (enabled selectively later)
;
;   ; Zero out entire zero page ($00-$FF)
;   ; This clears TIA registers, RAM, and graphics pointers
; ZeroZP:
;   LDA #$00
;   STA $00,X
;   INX
;   BNE ZeroZP
;
;   JSR LF478           ; Initialize sound (zero audio variables)
;
; **Key Points**:
; - All zero page is cleared, including TIA hardware registers
; - This resets all graphics, colors, audio to neutral state
; - Graphics pointers in $D4-$E1 are set to base address
;
; ### Section 2: Frame Timing & Synchronization (LF021-LF093)
; **Purpose**: Establishes video frame timing for proper screen drawing
;
; LF021: LDA #$04
;        SBC $8D
;        STA $8D          ; Counter for frame drawing iterations
;
; LF027: LDA #$BA         ; Timer value (186 in decimal)
;        STA WSYNC        ; Wait for horizontal blank
;        STA TIM8T        ; Set timer for /8 clock interval (6.7 µs per cycle)
;        JSR LF4A1        ; BCD arithmetic operation
;        JSR WaitForTimerDone
;
; **Video Timing**:
; - NTSC: 262 scanlines/frame @ 60 Hz
; - PAL: 312 scanlines/frame @ 50 Hz
; - Timer values chosen to maintain synchronization with video output
;
; ### Section 3: Main Game Loop (LF09A-LF589)
; **Purpose**: Core rendering loop that draws screen and processes game state
;
; LF09A: STA PF0         ; Clear playfield registers
;        STA PF1
;        STA PF2
;
;        LDY $8D         ; Load loop counter
;        LDA ($D4),Y     ; Read from graphics table pointer
;        CMP #$CA        ; Check if end of graphics data
;        BCC LF0AB       ; If not at end, process graphics
;        JMP LF021       ; Loop back to frame sync
;
; **Graphics Loading** (LF0AB-LF498):
; - Loads graphics table entries (6 bytes per digit)
; - Each byte is shifted left 3 bits (×8) to create memory offsets
; - Stores offsets in $D6-$E0 for use during scanline rendering
; - This allows rapid graphics lookups during real-time screen drawing
;
; ### Section 4: Input Processing (LF1B9-LF327)
; **Purpose**: Read joystick, handle game reset, manage number cycling
;
; LF1B9: LDY #$00
;        ROR SWCHB        ; Rotate to test bit 0 (RESET switch)
;        BCC GAMERESET    ; Branch if RESET pressed (bit was 0)
;
;        LDA $CC          ; Check reset debounce
;        BEQ LF1EE        ; If zero, check other inputs
;
; GAMERESET:
;        ; Reset game state and reinitialize
;        INC $CC          ; Set debounce flag
;        JSR LF478        ; Clear sounds
;        JSR LF658        ; Clear scores
;
; **Joystick Number Cycling** (LF2CB-LF312):
; - Reads SWCHA register for joystick position
; - Bit patterns indicate left/right/up/down
; - Current digit in $89 is incremented/decremented (0-9 wrapping)
; - $C4,X stores the current player's digit selection
;
; ### Section 5: Game Logic & Scoring (LF332-LF3E0)
; **Purpose**: Check answers, update scores, manage game progression
;
; LF332: LDA $90          ; Load animation counter
;        BEQ LF38C        ; If zero, skip logic
;        DEC $90          ; Decrement counter
;
;        ; Compare player answer ($BE-$C5) with expected answer ($C4,X)
; LF36C: LDA $BE,X
;        CMP $C4,X        ; Player digit matches expected digit?
;        BNE LF380        ; If not, answer is wrong
;
;        ; All digits match - answer correct!
;        STY $A1          ; Set answer-valid flag
;        SED              ; Enable BCD mode for decimal arithmetic
;        SEC              ; Set carry for addition
;        LDA $84          ; Load score ones/tens
;        ADC #$01         ; Add 1 point (BCD math)
;        STA $84
;        BNE LF382
;
; LF380: INC $A1          ; Mark answer incorrect
;
; **BCD Arithmetic Note**: The code uses SED/CLD to enable Decimal mode:
; - In Decimal mode, ADC/SBC treat operands as binary-coded decimal
; - Allows scoring in human-readable decimal without conversion
; - Score stored as: $85 = hundreds, $84 = ones/tens
;
; ### Section 6: Sound Generation (LF42E-LF466)
; **Purpose**: Generate beep sounds for input feedback or scoring
;
; LF42E: LDA $A8          ; Check if note sequence started
;        BEQ LF43D        ; If not, initialize
;        STA $A9          ; Set volume/duration
;
; LF434: LDA #%00000100
;        STA AUDC0        ; Set audio control (noise type)
;        LDX #$A6
;        JSR LF47A        ; Clear audio variables
;
; LF43D: INC $A8          ; Increment note counter
;        LDA $A7          ; Check frequency value
;        BNE LF466        ; If set, use it
;
; **Audio Registers Used**:
; - `AUDC0/AUDC1`: Noise/waveform type selector
; - `AUDF0/AUDF1`: Frequency divider (lower = higher pitch)
; - `AUDV0/AUDV1`: Volume level (0=off, 15=max)
;
; ### Section 7: Graphics Data (Starts ~LF6E8)
; **Purpose**: Stores bitmap data for digits 0-9 and symbols
;
; **Format**:
; - Multiple bytes per digit, each byte is one row of the bitmap
; - Digits are typically 8 pixels tall, 5-6 pixels wide
; - Each byte represents a column or row of pixel data
;
; ## Rendering Pipeline
;
; ### 1. Frame Initialization
; 1. Set VSYNC to signal vertical sync
; 2. Wait for timer (allows TIA to stabilize)
; 3. Set VBLANK to prevent drawing during blanking interval
; 4. Clear TIA registers
;
; ### 2. Scanline Drawing Loop
; For each scanline during the visible area (192 lines for NTSC):
; 1. Write WSYNC to align to scanline start
; 2. Update playfield registers (PF0, PF1, PF2) with graphics data
; 3. Read joystick input (minimal CPU overhead per line)
;
; ### 3. Playfield Graphics
; The three 8-bit playfield registers create a 40-pixel-wide playfield:
; - **PF0** (bits 4-7): Leftmost 4 pixels
; - **PF1** (bits 0-7): Middle 8 pixels
; - **PF2** (bits 0-7): Rightmost 8 pixels
; - Repeated twice per scanline for full resolution
;
; ## Data Flow: Number Display Example
;
; 1. **User presses joystick right**
;    - SWCHA bit 7 read (Player 0 right)
;    - $89 incremented (current digit 3→4)
;
; 2. **Render frame begins**
;    - Load graphics for digit "4" from graphics ROM
;    - Copy bitmap bytes into $D6-$E0 pointers
;
; 3. **During scanline rendering**
;    - Each scanline reads from ($D6), ($D8), ($DA)
;    - Bytes written to PF0, PF1, PF2
;    - Creates visible digit on screen
;
; 4. **When digit matches problem**
;    - Player pressing button triggers answer check
;    - BCD arithmetic adds 1 to score in $84
;    - Sound plays (if enabled)
;
; ## Common Patterns
;
; ### BCD Arithmetic with SED/CLD
ssembly
; SED                 ; Enable decimal mode
; SEC                 ; Set carry
; LDA $84             ; Score
; ADC #$01            ; Add 1 (in decimal)
; STA $84
; CLD                 ; Disable decimal mode
;
; ### WSYNC/Timer Synchronization
ssembly
; LDA #value
; STA WSYNC           ; Halt CPU until next scanline
; STA TIM8T           ; Set timer for later sync point
; JSR SomeFunction    ; Time-dependent code
; JSR WaitForTimerDone; Wait for timer to expire
;
; ### Joystick Input Reading
ssembly
; LDA SWCHA           ; Read joystick
; AND #%11110000      ; Mask for Player 0
; CMP #%11110000      ; All bits set = no movement
; BNE ProcessInput    ; Branch if movement detected
;
; ## References for Further Study
;
; ### Stella Emulator Debugging
; - **Stella Debugger Commands**: Tools/Stella Debugger Commands.md
; - Break on address, step through code, monitor RAM/registers
; - Useful for tracing execution during gameplay
;
; ### VCS Hardware
; - **vcs.h**: Hardware register definitions ($00-$1A TIA, $280-$284 RIOT)
; - **Playfield Graphics**: PF0/PF1/PF2 create 40-pixel playfield
; - **Cycle Counting**: Tools/Guide to Cycle Counting.md
;
; ### BCD and Audio
; - **BCD Mode**: 6502 SED/CLD enables decimal arithmetic automatically
; - **Audio**: Tools/Music And Sound Programming Guide.md


; -----------------------------------------------------------------------------
; Architecture & Data Structures

; ## High-Level Game Flow
;
; ┌─────────────────────────────────────────────────────────────┐
; │                      GAME START (START:)                    │
; │  - Disable interrupts (SEI)                                 │
; │  - Initialize stack ($FF)                                   │
; │  - Clear zero page ($00-$FF) → clears TIA + RAM             │
; │  - Setup graphics pointers ($D4-$E1)                        │
; └─────────────────────────────────────────────────────────────┘
;                             ↓
; ┌─────────────────────────────────────────────────────────────┐
; │                  MAIN LOOP (LF021)                          │
; │  1. Frame Sync: VSYNC, wait, VBLANK setup                   │
; │  2. Graphics Load: Read graphics table, setup pointers      │
; │  3. Render: Draw 192 scanlines (NTSC) / 312 (PAL)          │
; │  4. Input: Read joystick, process number cycling           │
; └─────────────────────────────────────────────────────────────┘
;                             ↓
;                     ┌───────┴────────┐
;                     ↓                ↓
;         ┌──────────────────┐  ┌──────────────────┐
;         │  GAME RUNNING    │  │  RESET PRESSED   │
;         │  (LF1B9)         │  │  (GAMERESET)     │
;         │                  │  │                  │
;         │ - Check input    │  │ - Clear scores   │
;         │ - Validate ans.  │  │ - Clear sounds   │
;         │ - Update score   │  │ - Restart        │
;         └──────────────────┘  └──────────────────┘
;                     ↓                ↓
;         ┌──────────────────────────────────────┐
;         │ CONTINUE MAIN LOOP                   │
;         └──────────────────────────────────────┘
;
; ## Data Structure: Problem Generation
;
; ### Problem Storage
; The game generates math problems dynamically. Two approaches:
; 1. **User chooses first number** (Modes 1-4)
; 2. **Computer chooses both** (Modes 5-8)
;
; **RAM Layout for Single Problem**:
; $B0-$B1: First operand (16-bit, BCD format)
; $B2:     Operation type (0=add, 1=subtract, etc.)
; $B3:     Second operand
; $B4:     Expected answer (calculated or provided)
; $BE-$C5: Player's entered answer (6 bytes, one digit each)
; $C4:     Current digit being selected (0-9)
; $C9:     End of answer buffer
;
; ### Problem Lifecycle
; 1. GENERATE phase:
;    - Compute or provide first operand → $B0
;    - Compute or provide second operand → $B3
;    - Compute expected answer → $B4
;
; 2. DISPLAY phase:
;    - Render first operand on screen
;    - Render operation symbol (+, -, ×, ÷)
;    - Render second operand
;
; 3. INPUT phase:
;    - Read $89 (current digit) from joystick cycling
;    - Player cycles digit 0-9 using left/right
;    - Player presses button to select digit
;
; 4. VALIDATE phase:
;    - Compare player's digits ($BE-$C5) with expected ($B4)
;    - If match: increment score ($84/$85), play sound
;    - If wrong: show indication, no points
;
; 5. NEXT phase:
;    - Load next problem
;    - Repeat (10 rounds per game)
;
; ## Data Structure: Screen Display
;
; ### Three-Digit Display Example
; Left Side (Score):        Middle (=):      Right Side (Problem):
; ┌─────────┐              ┌───────┐        ┌──────────────┐
; │  Score  │              │   =   │        │ Problem #    │
; │  (BCD)  │              │       │        │ (0-based)    │
; │  $84:   │              │       │        │ $CF (BCD)    │
; │  0-99   │              │       │        │              │
; └─────────┘              └───────┘        └──────────────┘
;
; ### Playfield Graphics Structure
; 40-pixel playfield divided into 3 registers:
;
; ┌───┬──────────────┬──────────────┐
; │PF0│     PF1      │     PF2      │
; ├───┼──────────────┼──────────────┤
; │   │              │              │
; │4px│    8 pixels  │    8 pixels  │
; │   │              │              │
; └───┴──────────────┴──────────────┘
;
; Each pixel row requires updating PF0, PF1, PF2 registers.
; Graphics pointers ($D6-$E0) provide base addresses.
;
; ## State Machine: Input Processing
;
; ┌─────────────────────────────────────────┐
; │       SWCHA Joystick Register          │
; │                                         │
; │  Player 0 (Left controller):            │
; │  Bit 4: UP     (0=pressed)              │
; │  Bit 5: DOWN   (0=pressed)              │
; │  Bit 6: LEFT   (0=pressed)              │
; │  Bit 7: RIGHT  (0=pressed)              │
; └─────────────────────────────────────────┘
;               ↓ Read $09
;     ┌─────────┴─────────────┐
;     ↓                       ↓
;  PRESSED              NO MOVEMENT
;     ↓                       ↓
;  ┌──┴──┬──┬──┐          Continue
;  ↓     ↓  ↓  ↓          (wait for input)
; LEFT  RIGHT UP DOWN     ↓
;  ↓     ↓               [Repeat]
; DECR  INCR    ↓
;  $89   $89   [Other]
;  ↓     ↓
; WRAP: $89=10→0
;
; ## State Machine: Answer Validation
;
;                   Player presses fire button
;                          ↓
;             Compare 6 digits: $BE[i] vs $C4[i]
;                   (loop i=0 to 5)
;                     ↙        ↖
;               ALL MATCH    MISMATCH
;                   ↓           ↓
;             ┌──────────┐  ┌─────────────────┐
;             │CORRECT!  │  │INCORRECT!       │
;             └──────────┘  └─────────────────┘
;                   ↓           ↓
;             ┌──────────┐  ┌─────────────────┐
;             │ SED      │  │ SED             │
;             │ SEC      │  │ SEC             │
;             │ LDA $84  │  │ LDA $84         │
;             │ ADC #$01 │  │ ADC #$00        │
;             │ STA $84  │  │ STA $84         │
;             │ CLD      │  │ CLD             │
;             │ PlaySnd  │  │ (no sound)      │
;             └──────────┘  └─────────────────┘
;                   ↓           ↓
;                 Load Next Problem
;                      ↓
;                 Rounds < 10? → YES: Repeat
;                               NO: Game Over
;
; ## Video Timing Reference
;
; ### Frame Structure (NTSC: 262 scanlines @ 60Hz)
;
; Scanline #    Activity              Duration
; ─────────────────────────────────────────────
; 0-2          VSYNC                 3 scanlines
; 3-36         VBLANK (setup)        34 scanlines
; 37-228       VISIBLE SCREEN        192 scanlines
; 229-261      VBLANK (cleanup)      33 scanlines
; ─────────────────────────────────────────────
; Total Frame                         262 scanlines
; Frame Duration: 262/60 Hz ≈ 16.67 ms per frame
;
; ### CPU-to-Video Synchronization
;
; Instruction       Clock Cycles    Scanline Duration
; ────────────────────────────────────────────────
; 6502 CPU          3.58 MHz
; One scanline      1/60 Hz
; 64 CPU cycles     per scanline
;
; WSYNC             Waits until next horizontal blank
;                   Ensures code starts at scanline boundary
;                   Allows predictable cycle timing
;
; TIM8T             Divides clock by 8
;                   $BA × 8 cycles ≈ 416 μs
;                   Allows waiting without WSYNC
;
; ## Graphics Table Format
;
; The Graphics table (at $F7xx in ROM) is structured as a sequence of 8-byte graphics definitions:
;
; Graphics Table Structure:
; ┌─────────────────────────────────────┐
; │ Byte 0: Character 0 metadata        │
; │ Byte 1: Character 0 metadata        │
; │ ...                                 │
; │ Byte 47: Character 15 metadata      │
; │                                     │
; │ (Continue with graphics data)       │
; │                                     │
; │ (...): Bitmap data for each digit   │
; │ (...): One byte per scanline row    │
; └─────────────────────────────────────┘
;
; Each byte loaded from Graphics table is shifted left 3 bits (×8):
; - Creates an offset into graphics ROM
; - Combined with graphics pointer high byte to form full address
; - Low byte used as index into bitmap data
;
; ### Graphics Lookup in Rendering
;
; 1. Read from Graphics table: LDA ($D4),Y
;    → Gets metadata byte for current frame segment
;
; 2. Multiply by 8: ASL, ASL, ASL
;    → Creates ROM offset
;
; 3. Store in graphics pointer: STA $E0
;    → High byte already set; low byte now contains index
;
; 4. During rendering:
;    LDA ($E0),Y    ; Load graphics byte at offset Y
;    STA PF2        ; Display on playfield register
;
; ## Audio System Overview
;
; ### Audio Registers
; AUDC0/AUDC1  $15-$16   Audio waveform/noise type
; AUDF0/AUDF1  $17-$18   Frequency divider
; AUDV0/AUDV1  $19-$1A   Volume (0=off, 15=max)
;
; ### Sound Generation Pattern
; 1. SELECT TONE (AUDC):
;    LDA #%00000100     ; Waveform bits
;    STA AUDC0
;
; 2. SET FREQUENCY (AUDF):
;    LDA frequency_table,X
;    STA AUDF0
;
; 3. SET VOLUME (AUDV):
;    LDA #$08           ; Medium volume
;    STA AUDV0
;
; 4. HOLD (timer or loop):
;    (wait N frames)
;
; 5. TURN OFF:
;    LDA #$00
;    STA AUDV0          ; Mute by zeroing volume
;
; ### Frequency Table Example
; The code contains sound frequency values that produce different pitches:
; - Correct answer: high frequency (happy beep)
; - Incorrect answer: low frequency (sad beep)
; - Game over: descending sequence
;
; ## Score Tracking (BCD Format)
;
; ### Why BCD?
; Binary-Coded Decimal allows easy human-readable display without conversion:
; - Each byte = two decimal digits
; - Ones place in low nibble (0-9)
; - Tens place in high nibble (0-9)
;
; ### Score Storage
; $84-$85: Score in BCD
;          $85 = $00 (hundreds placeholder, usually unused)
;          $84 = $00-$99 (score 00-99 in decimal)
;
; Examples:
;  Score 0:   $84 = $00
;  Score 5:   $84 = $05
;  Score 10:  $84 = $10 (1 in tens place, 0 in ones)
;  Score 42:  $84 = $42 (4 in tens place, 2 in ones)
;  Score 99:  $84 = $99 (maximum)
;
; ### BCD Arithmetic Example
; ; Enable decimal mode, add 1 to score:
; SED            ; Set Decimal flag
; SEC            ; Set Carry (required for +1)
; LDA $84        ; Load score
; ADC #$01       ; Add 1 (automatic BCD adjustment)
; STA $84        ; Store updated score
; CLD            ; Return to binary mode
;
; Execution:
;   $84 = $05 → ADD 1 → $84 = $06  ✓
;   $84 = $09 → ADD 1 → $84 = $10  ✓ (automatic tens carry)
;   $84 = $99 → ADD 1 → $84 = $00 + Carry
;
; ## Difficulty Switch Configuration
;
; ### Two Hardware Switches
; Each switch has two positions (A and B) on the Atari VCS console:
;
; RIGHT DIFFICULTY switch (bit 6 of SWCHB):
;   A position (bit 6 = 1): Timer ENABLED
;   B position (bit 6 = 0): Timer DISABLED
;
; LEFT DIFFICULTY switch (bit 7 of SWCHB):
;   A position (bit 7 = 1): ?
;   B position (bit 7 = 0): ?
;
; The code reads SWCHB at specific points to adjust:
; - Time limit (12 seconds vs 24 seconds)
; - Problem difficulty (single vs multi-digit)
; - Game mode speed
;
; Example from code:
ssembly
; LDA SWCHB
; AND #%01000000     ; Mask bit 6 (RIGHT difficulty)
; BNE handle_pro     ; If 1 (A position), expert mode
; ; Otherwise, beginner mode
;
; ---
;
; ## Performance Considerations
;
; ### Cycle-Critical Sections
; These parts must complete within specific cycle budgets:
; 1. **Scanline rendering** (64 cycles/scanline)
; 2. **Input processing** (done during VBLANK to avoid display glitches)
; 3. **Graphics lookup** (must complete before next PF update)
;
; ### Non-Critical Sections
; These can take variable time (done in VBLANK or during VBLANK-safe operations):
; 1. Score calculations
; 2. Problem generation
; 3. State management
; 4. Audio setup
;
; ### Memory Considerations
; - 128 bytes of zero-page RAM is shared with hardware registers
; - TIA registers ($00-$1F) must be managed carefully
; - Graphics pointers use most of zero page ($80-$E0+)
; - Limited room for data structures; efficient use is critical
;
; ---
;
; ## Common VCS Programming Patterns Used
;
; 1. **Zero-page accumulator addressing**: `STA $0,X` for efficient loops
; 2. **Indirect addressing for graphics**: `LDA ($D6),Y` for bitmap lookup
; 3. **BIT instruction**: Tests bits without modifying accumulator
; 4. **BCD mode for scores**: `SED`/`CLD` for decimal display
; 5. **WSYNC for timing**: Every scanline starts synchronized
; 6. **Self-modifying code**: Optional (not heavily used here)
; 7. **Lookup tables**: Graphics, sounds, game logic


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
