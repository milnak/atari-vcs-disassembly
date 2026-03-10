# Copilot Instructions for Atari VCS (2600) Disassembly

This repository contains disassembled Atari VCS (2600) games and tools for working with them.

## Build & Assembly

All source code is written in **6502 assembly** and compiled using **DASM** (the Atari Macro Assembler).

### Basic Assembly Command
```bash
./dasm '.\path\to\game.asm' -f3 -o'game.a26'
```

The `-f3` flag is **critical** — it specifies RAW binary format (data only) required for 2600 cartridges.

### Full Build with Symbols and List File
```bash
./dasm '.\game.asm' -f3 -I'machines\atari2600' -o'game.a26' -l'game.lst' -s'game.sym'
```

- `-l'game.lst'`: Generates a list file for debugging
- `-s'game.sym'`: Generates a symbol file for debugger reference
- `-I'machines\atari2600'`: Specifies include path for `vcs.h` and related headers

### Multi-File Projects
Some games (e.g., Dig Dug) use modular source with a master file that includes segments at specific memory locations:

```assembly
processor 6502
include vcs.h
include macro.h

ORG $1000
include p1.s
ORG $2000
include p2.s
```

The master file uses `.bat` scripts to automate assembly (e.g., `make.bat`).

### Common Build Issues
If you get `error: Value in 'byte byte XXXXX' must be <$100`, the source was written for an older dasm version. Fix byte references by adding the low-byte operator `<`:

```assembly
; Old (breaks)
.byte Zero,One,Two,Three

; New (works)
.byte <Zero,<One,<Two,<Three
```

## Testing & Validation

Use the **Stella** emulator (https://stella-emu.github.io/) to test assembled ROMs:
1. Assemble the `.asm` to `.a26` binary using dasm
2. Open the `.a26` file in Stella to run it

Stella includes debugging tools (debugger commands in `Tools/Stella Debugger Commands.md`).

## Architecture & Key Concepts

### Hardware Registers (vcs.h)
The VCS hardware interface is defined in `include/vcs.h`. Key registers include:

- **VSYNC** ($00): Vertical sync register
- **VBLANK** ($01): Vertical blank control
- **COLUP0/COLUP1** ($06/$07): Player colors
- **COLUPF** ($08): Playfield color
- **COLUBK** ($09): Background color
- **PF0/PF1/PF2** ($0D-$0F): Playfield graphics
- **GRP0/GRP1** ($1B/$1C): Player graphics
- **HMP0/HMP1** ($20/$21): Horizontal motion registers
- **HCLEAR** ($2B): Motion clear

### Memory Model

The Atari 2600 has extreme hardware constraints:
- **128 bytes** of RAM ($00-$7F)
- **4 KB cartridge ROM** (standard cartridges)
- **Video display**: 192 scanlines per frame (NTSC), generated in real-time

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

1. **Processor Declaration**: All files start with `processor 6502`
2. **Header Includes**:
   - `include vcs.h` — Hardware register definitions
   - `include macro.h` — Common macros for 2600 programming
3. **Address Comments**: Video generation typically starts at $F000 (NTSC) or configurable via compile switches
4. **Compile Switches**: NTSC/PAL mode defined at top of file:
   ```assembly
   NTSC                    = 0
   PAL                     = 1
   COMPILE_VERSION         = NTSC
   ```

### Disassembly Conventions

Files disassembled with **DiStella** include:
- Header comment showing disassembly metadata (date, version, command-line)
- Configuration file reference (e.g., `spaceinv.cfg`) that provides hints for interpretation
- Game variation documentation (e.g., game modes for Space Invaders)
- Byte dumps of graphics data (GFX) and data tables

DiStella compilation:
```
cl -DAPP_VERSION='\"3.02-SNAPSHOT\"' -DAPP_COMPILE='\"2024-12-10\"' .\distella.c /link /out:DiStella.EXE
```

### Code Style Notes

- Registers and labels use uppercase (e.g., `VSYNC`, `GRP0`)
- RAM variables defined in the zero page ($00-$FF) for efficient addressing
- Cycle counting is critical for timing; see `Tools/Guide to Cycle Counting.md`
- Sound/music programming uses AUDC0, AUDF0, AUDV0 registers; see `Tools/Music And Sound Programming Guide.md`

### Include Files

- **vcs.h**: Hardware register address definitions (version 1.05+)
- **macro.h**: Common assembly macros (included by most projects)
- **multisprite3.a**: Pre-written sprite rendering routines (optional)
- **tia_constants.h**: Additional TIA register constants
- **xmacro.h**: Extended macros (optional)

### Submodules

Homebrew games are included as git submodules for specific projects (see `.gitmodules`). Clone with:
```bash
git submodule init
git submodule update
```

If you encounter SSH permission errors, add your public SSH key to GitHub: https://github.com/settings/ssh/new

## Documentation

- **Game Standards and Procedures.md**: Official Atari user interface standards for VCS games
- **Guide to Cycle Counting.md**: Critical for timing-sensitive code (video generation, sound)
- **Music And Sound Programming Guide.md**: Sound and music synthesis using 2600 hardware
- **Stella Debugger Commands.md**: In-emulator debugging reference

## Directory Structure

- **Atari/**: Official Atari VCS game disassemblies
- **Homebrew/**: Community-created games (many are git submodules)
- **Third Party/**: Non-Atari publisher games
- **Hacks/**: Unofficial modifications and variants
- **Not Matched/**: Files not yet matched to known games
- **Tools/**: Documentation, guides, editors, and utilities
- **include/**: Assembly header files and macros

## Notes for Contributors

When creating or modifying assembly files:
1. Match the coding style and organization of existing files in the same category
2. Include proper header comments (processor, includes, compile switches)
3. Add DiStella configuration files (.cfg) for disassembly projects to document game structure
4. Test assembly output in Stella emulator
5. Follow the Game Standards and Procedures for new game implementations
6. Ensure both NTSC and PAL versions can be compiled (adjustable via compile switches)
