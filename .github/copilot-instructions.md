# Copilot Instructions for Atari VCS (2600) Disassembly

This repository contains disassembled Atari VCS (2600) games and tools for working with them.

## Build & Assembly

All source code is written in **6502 assembly** and compiled using **DASM** (the Atari Macro Assembler).

### Basic Assembly Command
```bat
dasm path\to\game.asm -f3 -o game.a26
```

The `-f3` flag is **critical** — it specifies RAW binary format (data only) required for 2600 cartridges.

### Full Build with Symbols and List File
```bat
dasm game.asm -f3 -I include -o game.a26 -l game.lst -s game.sym
```

- `-l game.lst`: Generates a list file for debugging
- `-s game.sym`: Generates a symbol file for debugger reference
- `-I include`: Specifies include path for `vcs.h` and related headers

### Multi-Bank Projects (ORG Segments)
Some games (e.g., Dig Dug) use modular source with a master file that `include`s segments at specific memory locations. See `Atari/Dig Dug (1983) (Atari)/Master.s`:

```assembly
processor 6502

NTSC                    = 0
PAL                     = 1
COMPILE_VERSION         = NTSC
NO_ILLEGAL_OPCODES      = 0

TIA_BASE_READ_ADDRESS   = $30

    include vcs.h
    include macro.h

    ORG $1000
    include p1.s
    ORG $2000
    include p2.s
    ORG $3000
    include p3.s
    ORG $4000
    include p4.s
```

Assembled via `make.bat`:
```bat
dasm.exe master.s -f3 -o digdug.a26
```

### Multi-Bank Projects (Separate Binaries)
Some bankswitched games (e.g., Defender II) compile each bank as a separate binary and concatenate them. See `Atari/Defender II (1987) (Atari)/make.bat`:

```bat
dasm d2_001.asm -f3 -o d2_001.out
dasm d2_002.asm -f3 -o d2_002.out
copy /b d2_001.out+d2_002.out out.a26
erase d2_001.out
erase d2_002.out
```

Each part file uses `ORG` at its bank base address (e.g., `ORG $D000`), and the parts are concatenated into the final `.a26` cartridge image.

### Common Build Issues
If you get `error: Value in 'byte byte XXXXX' must be <$100`, the source was written for an older dasm version. Fix byte references by adding the low-byte operator `<`:

```assembly
; Old (breaks with newer dasm)
.byte Zero,One,Two,Three

; New (works)
.byte <Zero,<One,<Two,<Three
```

## Testing & Validation

Use the **Stella** emulator (https://stella-emu.github.io/) to test assembled ROMs:
1. Assemble the `.asm` to `.a26` binary using dasm
2. Open the `.a26` file in Stella to run it

Stella includes debugging tools (debugger commands in `Tools/Stella Debugger Commands.md`).

Files in `Not Matched/` assemble successfully but their output binary does not match any entry in the Stella emulator ROM database.

## Architecture & Key Concepts

### Hardware Registers (vcs.h)
The VCS hardware interface is defined in `include/vcs.h`. Key registers include:

- **VSYNC** ($00): Vertical sync register
- **VBLANK** ($01): Vertical blank control
- **WSYNC** ($02): Wait for horizontal sync (CPU halts until end of scanline)
- **COLUP0/COLUP1** ($06/$07): Player colors
- **COLUPF** ($08): Playfield color
- **COLUBK** ($09): Background color
- **CTRLPF** ($0A): Playfield control (mirroring, priority, ball size)
- **PF0/PF1/PF2** ($0D-$0F): Playfield graphics
- **GRP0/GRP1** ($1B/$1C): Player graphics
- **ENABL** ($1F): Enable ball
- **HMP0/HMP1** ($20/$21): Horizontal motion registers
- **HMOVE** ($2A): Apply horizontal motion
- **HMCLR** ($2B): Clear horizontal motion registers
- **CXCLR** ($2C): Clear collision latches
- **SWCHA** ($0280): Joystick port A/B directions
- **SWCHB** ($0282): Console switches (Reset, Select, Color/B&W, Difficulty)
- **INTIM** ($0284): Interval timer read
- **TIM64T** ($0296): Set 64-cycle interval timer

Read-side TIA registers start at offset $30 (e.g., CXM0P = $30). Set `TIA_BASE_READ_ADDRESS = $30` before including `vcs.h` when reassembling a DiStella disassembly so the binary matches the original ROM exactly.

### Memory Model

The Atari 2600 has extreme hardware constraints:
- **128 bytes** of RAM ($80–$FF in zero page, mirrored at $180–$1FF)
- **4 KB cartridge ROM** per bank (standard); bankswitched carts have multiple banks
- **Video display**: Generated in real-time — the CPU must write TIA registers on every scanline

### Frame Structure

Every frame consists of three phases, each timed with `TIM64T`/`INTIM`:

1. **VSYNC** (3 scanlines): Assert `VSYNC` bit, then clear
2. **VBLANK** (37 scanlines): Game logic runs here while the screen is blank
3. **Kernel** (192 scanlines NTSC / 228 PAL50): Write TIA registers per-line to draw the screen
4. **Overscan** (30 scanlines): Additional game logic time

### Game Structure

The `Tools/Game Standards and Procedures.md` document defines industry standards including:
- **Copyright Screen** with title/artwork and copyright notice
- **Auto-Play Mode** demonstrating gameplay (after ~20 seconds of idle)
- **Game Select Screen** for difficulty and player count options
- **Difficulty Settings**: Novice, Standard, Advanced, Expert (adjustable via hardware switches A/B)
- **Controller Input**: Joystick, fire button, Select, and Reset switches
- **Pause Mode**: Triggered by Color/B&W switch; freezes video and audio

## Key Conventions

### Assembly File Organization

Every file begins with:
1. `processor 6502`
2. Compile switches (NTSC/PAL, feature flags)
3. `include vcs.h` and `include macro.h`
4. RAM variable segment (`SEG.U VARS` / `ORG $80`)
5. Code segment (`SEG` / `ORG $F000` for standard 4KB ROMs)
6. Reset/BRK vector table at the very end (`ORG $FFFC`)

Example skeleton:
```assembly
    processor 6502

NTSC                    = 0
PAL                     = 1
COMPILE_VERSION         = NTSC
NO_ILLEGAL_OPCODES      = 0

    include vcs.h
    include macro.h

    SEG.U VARS
    ORG $80

Score   DS 1        ; player score
Lives   DS 1        ; lives remaining

    SEG
    ORG $F000

Start:
    CLEAN_START         ; macro: clears TIA, RAM, sets stack

    ; ... game code ...

    ORG $FFFC
    .word Start         ; reset vector
    .word Start         ; BRK vector
```

### Compile Switches

Older files use a two-value NTSC/PAL switch:
```assembly
NTSC                    = 0
PAL                     = 1
COMPILE_VERSION         = NTSC
```

Newer files (e.g., Dennis Debro disassemblies) use a three-value region switch and `IFNCONST` so the value can be overridden on the command line:
```assembly
    IFNCONST COMPILE_REGION
COMPILE_REGION          = NTSC      ; 0=NTSC, 1=PAL50, 2=PAL60
    ENDIF
```

Additional common switches:
- `NO_ILLEGAL_OPCODES = 1` — disable illegal 6502 opcodes in macros
- `COPYRIGHT_ROM = TRUE/FALSE` — include/exclude the copyright screen
- `TIA_BASE_READ_ADDRESS = $30` — offset for TIA read registers (required for exact ROM reproduction)

### Disassembly Styles

There are two distinct styles in this repo:

**DiStella-generated** (e.g., `Space Invaders`, older `Defender II` parts):
- Wide column spacing, minimal comments, inlined register equates at the top
- Header comment with metadata: date, DiStella version, command line, `.cfg` contents
- Graphics regions appear as raw `.byte` dumps with ASCII art pixel comments

**Manually labeled** (e.g., Dennis Debro, Omegamatrix):
- Meaningful labels, inline cycle counts, explanatory comments
- `LIST OFF`/`LIST ON` directives to suppress include file listings
- `TIA_BASE_READ_ADDRESS = $30` set before `vcs.h` include
- vcs.h/macro.h version checks with `err` to abort on incompatible versions

### DiStella `.cfg` Files

Each DiStella disassembly has a companion `.cfg` file that classifies memory regions. Format:

```
GFX  $FB FE  $FD66    ; graphics data
CODE $F000   $FBFD    ; executable code
DATA $FFFA   $FFFF    ; data (e.g., vectors)
```

Directives: `GFX` (pixel data shown with ASCII art), `CODE` (disassembled as instructions), `DATA` (disassembled as `.byte`).

DiStella can be compiled from source with MSVC:
```
cl -DAPP_VERSION="3.02-SNAPSHOT" -DAPP_COMPILE="2024-12-10" distella.c /link /out:DiStella.EXE
```

### Code Style Notes

- Labels and register names use uppercase (e.g., `VSYNC`, `GRP0`, `KERNEL`, `OVERSC`)
- RAM variables defined starting at `$80` using `DS n` in an uninitialized segment (`SEG.U`)
- Inline cycle counts as comments (e.g., `STA WSYNC ;0`, `LDA #$82 ;2`)
- `ALIGN 256` used before lookup tables that must not cross a page boundary (a page crossing costs an extra cycle)
- Cycle counting is critical for timing; see `Tools/Guide to Cycle Counting.md`
- Sound/music programming uses AUDC0/AUDC1, AUDF0/AUDF1, AUDV0/AUDV1 registers; see `Tools/Music And Sound Programming Guide.md`

### Include Files

- **vcs.h**: Hardware register address definitions (version 1.05+). Required by all projects.
- **macro.h**: Common assembly macros (version 1.06+). Provides `CLEAN_START`, `VERTICAL_SYNC`, `SLEEP`, `SET_POINTER`.
- **tia_constants.h**: Named color constants and region constants (`NTSC=0`, `PAL50=1`, `PAL60=2`). Used in newer-style disassemblies.
- **multisprite3.a**: Pre-written multi-sprite kernel routines (optional).
- **xmacro.h**: Extended macros (optional).

### File Naming Convention

Files follow this pattern:
```
Game Name (Year) (Publisher) [variant] - Disassembler.asm
```

Examples:
- `Asteroids (1981) (Atari) - Dennis Debro.asm`
- `Bobby is Going Home (1983) (BitCorp) (PAL) - Omegamatrix.asm`
- `Dodge 'Em (1980) (Atari) [a] - Omegamatrix.asm`  ← `[a]` = alternate version

### Submodules

Homebrew games are included as git submodules (see `.gitmodules`). Clone with:
```bash
git submodule init
git submodule update
```

Some submodules use SSH URLs (`git@github.com:...`); add your public SSH key to GitHub if you get permission errors: https://github.com/settings/ssh/new

## Documentation

- **Game Standards and Procedures.md**: Official Atari user interface standards for VCS games
- **Guide to Cycle Counting.md**: Critical for timing-sensitive code (video generation, sound)
- **Music And Sound Programming Guide.md**: Sound and music synthesis using 2600 hardware
- **Stella Debugger Commands.md**: In-emulator debugging reference
- **Atari 2600 Programming for Newbies.docx**: Introductory programming guide

## Directory Structure

- **Atari/**: Official Atari VCS game disassemblies
- **Homebrew/**: Community-created games (standalone `.asm` files and git submodules)
- **Third Party/**: Non-Atari publisher game disassemblies (Activision, Imagic, Coleco, etc.)
- **Hacks/**: Modified versions of existing cartridges (e.g., Genesis controller support, NTSC↔PAL conversions)
- **Not Matched/**: Files that assemble correctly but whose output binary does not match any Stella ROM database entry
- **Tools/**: Documentation, guides, sprite/playfield editors, and utilities
- **include/**: Assembly header files (`vcs.h`, `macro.h`, `tia_constants.h`, etc.)

## Notes for Contributors

When creating or modifying assembly files:
1. Match the coding style and organization of existing files in the same category
2. Include proper header comments (game name, author, date, public domain notice for disassemblies)
3. Set `processor 6502` and compile switches before any includes
4. Use `TIA_BASE_READ_ADDRESS = $30` when reassembling DiStella output for exact ROM reproduction
5. Add a `.cfg` file for new DiStella disassembly projects to document code/GFX/data regions
6. Test assembly output in Stella emulator; confirm the binary matches the known ROM hash
7. Follow `Game Standards and Procedures.md` for new game implementations
8. Support both NTSC and PAL compilation via `COMPILE_REGION` or `COMPILE_VERSION` switches
