# Space Invaders (1980, Atari)

Original programmer: Rick Maurer. This is an annotated, address-preserving
disassembly of the 4 KB cartridge, not a port or a redesigned implementation.
The original DiStella provenance and existing variation descriptions remain
in the assembly source.

## Build and identity

From the repository root, with DASM on `PATH`:

```powershell
dasm "Atari\Space Invaders (1980) (Atari).asm" -f3 -ospaceinv.a26 -lspaceinv.lst -sspaceinv.sym
(Get-Item spaceinv.a26).Length
Get-FileHash spaceinv.a26 -Algorithm SHA256
```

The source is self-contained; no include directory is required. `-f3` is
essential: the cartridge is a raw 4096-byte image, mapped at `$F000-$FFFF`.
Reset enters `START` at `$FE98`, not the code at the beginning of the file.
NMI, RESET and IRQ/BRK vectors all contain `$FE98`.

| Property | Value |
|---|---|
| Size | 4096 bytes |
| MD5 | `72ffbef6504b75e69ee1045af9075f66` |
| SHA-256 | `7224b17462b992d67f4e06a3c85f269c9822b06df6015bf038b55f384ced0301` |

These identify the ROM assembled from the existing source before annotation.
The annotated source reproduces all those bytes exactly. This is a preservation
check, not an independent certification against a cartridge dump or Stella's
ROM database.

The palette and timing are preserved as found. There is no implemented PAL
compile switch; adding one would require a separate conversion, not merely
changing a region constant.

## Reading the source

Descriptive labels identify routine entries, major phases and data tables.
Remaining `LFxxx` labels are local branch destinations at their original
addresses. Inline numeric instruction comments are **base cycle costs**:
taken branches, branch page crossings and indexed read page crossings must
be added where applicable.

Read and write TIA registers occupy the same CPU addresses but have different
meanings. For example, `STA WSYNC` waits for a scanline, whereas `LDA CXP0FB`
reads collisions; both encode address `$02`. Fire inputs are `INPT4=$0C`
and `INPT5=$0D`, not writes to `REFP1` and `PF0`. The source names those
reads correctly without changing their encoded addresses. Do **not** substitute
the `$30` read-register mirrors used by some other disassemblies.

The companion `.cfg` classifies the entire ROM for DiStella. The original
configuration incorrectly presented the lookup tables and sound records as
pixel graphics. The main code ranges are `$F000-$FBFD` and `$FD67-$FF4B`;
the intervening material and ROM tail are classified separately.

## Frame and control flow

| Address / label | Responsibility |
|---|---|
| `$FE98 START` | Clear TIA/RAM, initialize stack and game state, enter attract display |
| `$F4D4 FrameStart` | Blank display, add queued BCD scores, advance explosion animation |
| `$F50C VerticalSync` | Generate sync; start vertical-blank timer |
| `$F528-$F68B` | Move projectiles; process periodic wave, life, turn and saucer events |
| `$F694 ReadConsoleSwitches` | RESET/SELECT, selection repeat and game-number display |
| `$F747 TryPlayerFire` | Route fire buttons according to the selected player mode |
| `$F7DB TryAlienBomb` | Choose a surviving column and its lowest alien as bomb origin |
| `$F875 MoveFormation` | Survivor-dependent speed, animation, edge bounce and descent |
| `$F8F5 PrepareFormationLayout` | Account for empty rows, invasion and shield space |
| `$F952 MergeOccupiedColumns` | Normalize empty columns and calculate the right travel limit |
| `$F98E-$FA42` | Encode positions, derive palette, sort the selected projectile pair |
| `$FA43 WaitVerticalBlank` | Finish blanking and start the visible-area deadline |
| `$FA64 BuildScoreDigitOffsets` / `$FB0D DrawSaucer` | Score or saucer band |
| `$FB55 PrepareAlienKernel` / `$F000 AlienRowKernel` | Position players and draw the formation |
| `$F11A DrawShields` / `$F1B9 DrawCannons` | Reuse players for shields and cannons |
| `$F282 FinishPlayfield` | Ground strip, audio and immediate cannon collision checks |
| `$F2F8 WaitDisplayTimer` | Wait for visible deadline, start short logic timer |
| `$F30F-$F4CE` | Shield damage, shot/alien hits, saucer and controller movement |
| `$F4CF WaitLogicTimer` | Finish short logic budget and return to `FrameStart` |

This is not a generic VSYNC/VBLANK/kernel/overscan template. The original
program uses three timer budgets:

| Timer load | Meaning |
|---|---|
| `TIM64T=48` at `$F518` | 3072-cycle vertical-blank budget |
| `TIM64T=234` at `$FA52` | 14976-cycle visible-area deadline, approximately 197 scanlines |
| `TIM8T=$C8` at `$F303` | 1600-cycle post-display logic budget |

Those products are timer budgets, not exact whole-frame scanline counts:
timer setup, polling, sync and `WSYNC` placement also matter.

`frameCounter` descends each frame. Its low bit schedules alternating work
and selects which projectile class is drawn: odd values select player shots,
even values select alien bombs. At zero, the long-period event path handles
respawn, wave and turn transitions. `StartEventTimer` restarts it at `$80`
or `$81`, retaining parity; some transitions load `$40`.

## RAM and state

The source declares all allocated bytes from `$80` through `$F9`; declarations
are in an uninitialized segment and emit no cartridge bytes.

| RAM | Purpose |
|---|---|
| `$80-$82` | Current row, temporary, accumulated row/saucer/shield collision flags |
| `$83-$88` | Packed coarse/fine horizontal positions for the reused TIA objects |
| `$89-$8F` | Ball vertical multiplexing, animation, row counts and kernel gaps |
| `$90-$9A` | Formation descent, survivor count, six row masks, flags, wave index, X |
| `$9B-$9E` | Shield, two cannon and saucer X positions |
| `$9F-$A9` | Inactive player's eleven-byte formation state |
| `$AA` | Selection, turn, movement and transition flags |
| `$AB-$C5` | Three independently damaged nine-byte shield bitmaps |
| `$C6-$CA` | Event pacing, attract color cycle, explosion, lives and frame counters |
| `$CB-$D0` | Two sound IDs, ages and script cursors |
| `$D1-$D8` | Two bomb Y/X pairs followed by two player-shot Y/X pairs |
| `$D9-$DC` | Control handoff, bomb drift, decoded control mode and variation |
| `$DD-$E4` | Eight derived display colors |
| `$E5` | End-game latch (bit 7) |
| `$E6-$E9` | Interleaved two-byte BCD scores |
| `$EA-$ED` | Random seed, occupied-column mask, player mode, SELECT repeat |
| `$EE-$F9` | Twelve phase-dependent work bytes |

For player `X=0/1`, the score is `scoreHi,X` (`$E6+X`) and `scoreLo,X`
(`$E8+X`). A score of 115 is `$01:$15`. Awards accumulate in `$F4/$F5`
(high) and `$F6/$F7` (low), then `FrameStart` adds them in decimal mode.
During selection these score bytes instead contain display digits, with
nibble `$A` selecting the blank glyph.

`displayFlags` (`$98`) has these meanings:

| Bit | Meaning |
|---|---|
| 7 | Formation has invaded the cannon area |
| 6 | Shields enabled |
| 5 / 4 | Right / left cannon displayed |
| 3 / 2 | Owner of shot slot 1 / 0; set means right player |
| 1 / 0 | Formation / saucer moving right |

`gameFlags` (`$AA`) uses bit 7 for selection/attract display, bit 6 for
alternate turn/control ownership, bit 4 for shield direction, bit 3 for a
cleared wave, bits 2/1 for left/right cannon hits, and bit 0 for pending
spawn/turn transition. Bit 5 has no identified active use.

Alternating-player games exchange `$90-$9A` with `$9F-$A9`; this preserves
each player's formation, wave and related flags. Shields are regenerated
on the turn handoff rather than saved in a second shield buffer.

`explosionState` packs animation frame in bits 7-6, row in bits 5-3 and
column in bits 2-0. `$39` in the low six bits denotes a saucer explosion;
`$30` is the initialized inactive state. Animation advances by `$40` and
eventually returns to that inactive state.

`saucerX=$B4` denotes an absent saucer. Projectiles are initialized/retired
with Y=`$F6`; the motion and display paths test high sentinel values rather
than maintaining separate active booleans.

`$FA-$FF` is not allocated to variables. Stack addresses `$1FA-$1FF` alias
the same physical RAM. Do not append variables without checking stack depth.

## Display and collision techniques

### Six aliens from two players

Both players use `NUSIZ=6` (three copies at medium spacing), interlaced as
`P0 P1 P0 P1 P0 P1`. The kernel changes `GRP0/GRP1` between hardware copies.
Vertical delay and the extra `GRP0` store transfer the delayed graphics.
Six pointers at `$EE,$F0,$F2,$F4,$F6,$F8` provide distinct live/blank/explosion
graphics even though the hardware is repeating only two players.

There are six rows of six aliens. Row 5 is the top row; row 0 is the bottom.
Each row mask has one live bit per column. Graphics are ten bytes high;
Y counts down from 9 to 0. Adjacent rows are nine two-scanline units apart.
Animation pairs are ten bytes apart, all within page `$FC`.

`alienAnimationOffset` alternates `$FF/$09`. The row-mask `LSR` supplies
carry=1 for an occupied cell, so the following `ADC` selects the base
graphic or base+10. Losing that carry dependency would break animation.

The continuing loop at `$F00C` has two 76-cycle halves, with no intervening
`WSYNC`. The first includes the two `PHA/PLA` delay pairs. The second has
balanced ball-enable paths and an intentionally absolute, four-cycle
`STA.w ENABL` at `$F058`.

### Four projectiles from one ball

Neither missile is used to draw the game projectiles. The ball alternates
between the two bombs and the two player shots on successive frames.
`PrepareDisplay` sorts the chosen pair by Y, preserving shot ownership
when it swaps the shots. `$89` counts down to a four-unit active interval;
`$8A` initially holds the distance to the second object.

`DrawProjectileGap` spans two scanlines and, when the first countdown
underflows, repositions the ball horizontally for the second projectile.
`UpdateBallEnable` is a shorter helper for kernels that provide their own
timing. This reuse is why replacing seemingly redundant `WSYNC`, delay or
`HMOVE` instructions is unsafe.

The TIA latches only identify broad collisions. Per-row ball/player
collisions accumulate bits 0-5 of `hitFlags`; bit 6 records the saucer
collision and bit 7 the shields. Software compares projectile coordinates
to find the actual alien, shot owner and shield bitmap pixel. Cannon/ball
collision latches are also checked directly after the cannon kernel.

### Shields, scores and positioning

The shield kernel reuses player 0's three copies, rewriting graphics for
each independently damaged RAM bitmap. Each of nine bitmap lines is
displayed twice. Shield erosion clears the impact pixel and performs
randomized neighboring damage, using `$FF4C`'s bit-clear masks.

The score font at `$FF54` contains ten five-byte glyphs followed by a blank.
Each byte contains differently ordered nibbles for the TIA playfield's
bit directions. `ScoreKernel` rewrites playfield registers across each
line to produce two four-digit scores in the two cannon colors.
It draws two scanlines per font row. Its `BPL` at `$FAFE` branches from
post-instruction PC `$FB00` to `$FAAA`, costing **four** cycles when taken:
that page crossing makes each continuing iteration 152 cycles.

`EncodeHorizontalPosition` divides an X coordinate into a 15-pixel coarse
delay and signed HMOVE fine offset, stored together in one byte.
`PositionObject` consumes that result to strobe a TIA reset at the proper
time. Its TIA index is 0 for player 0 or 4 for the ball.

## Variations and gameplay

`gameVariation` stores the displayed game number minus one (0-111).
Bits 0-3 independently enable moving shields, zigzagging bombs, fast bombs
and invisible aliens. The upper three used bits select one of seven modes:

| Games | Mode | `$DB` control flags |
|---|---|---|
| 1-16 | One player | `$18` |
| 17-32 | Two players, alternating turns | `$10` |
| 33-48 | Two players competing simultaneously | `$61` |
| 49-64 | Two players competing, alternating shots | `$D1` |
| 65-80 | Partners divide right/left movement | `$32` |
| 81-96 | Partners alternate firing/control | `$90` |
| 97-112 | One partner moves, the other fires | `$14` |

`ControlModeFlags`, `ModeCannonFlags` and `ModeInitialFlags` decode these
modes; the handlers route joystick nibbles, fire inputs and shot ownership.
`OtherShotSlot` enforces shot separation. `SELECT` repeats through 112 games,
wrapping to 1; holding RESET with SELECT reduces the repeat interval.
RESET without SELECT clears the scores and starts the selected game.

The difficulty switches select normal or double-width **player graphics**
for the cannons, and the firing helper adjusts the muzzle offset to match.
The Color/B&W switch chooses the palette; it is **not** a pause switch in
this cartridge.

The formation's six point awards, bottom row first, are BCD
`05,10,15,20,25,30`. Survivor thresholds select nine movement intervals/step
sizes. At each edge the formation changes direction and descends five
two-line units. Empty left columns are removed by shifting all row masks
and moving the formation origin, while the right limit follows the
rightmost occupied column. Bomb origins always come from live aliens.
New waves use starting descent values `5,10,15,20`, saturating the index.

The random generator is `seed = (5 * seed + $59) mod 256`. It drives bomb
selection, zigzag behavior, saucer direction and shield erosion.

## Sound and shared tables

Each channel has an effect ID/priority, age and script cursor.
`QueueSound0/1` only accept equal/higher-priority effects and reset their
playback counters. `UpdateSoundChannel` runs once per channel per frame.

| ID | Use | Representation |
|---|---|---|
| 0 | Inactive | No script |
| 1 | Formation step | `$FF8B MarchSound` |
| 2 | Alien hit | One seven-frame frequency sweep |
| 3 | Player shot | `$FFBF PlayerShotSound` |
| 4 | Saucer flight | `$FF9D SaucerSound`, looping |
| 5 | Saucer hit | Repeating seven-frame frequency sweep |
| 6 | Cannon death/invasion | `$FFD1 CannonDeathSound` |

Script records are `[absolute age, AUDF, AUDC, AUDV]`. A negative frequency
byte stops playback; frequency `$3F` resets age/cursor without clearing
the ID, making a loop. Ages are absolute effect frame numbers, not durations
to add together. IDs 2/5 bypass scripts and index `$FFEB-$FFF1` by age 1-7;
ID 2 stops at age 8, whereas ID 5 restarts.

The immediate `LDA #$CB` at `$FE31` is preserved exactly. It makes the
following comparison against 5 always select the volume-8 path. It must
not be silently "fixed" to a load of a sound-state variable.

Several tables deliberately share bytes:

| Shared bytes | Uses |
|---|---|
| `$FCDE-$FCDF` | Entries 2/3 of `BitMasks`, also `ShotOwnerMasks` |
| `$FD39` | `OtherShotSlot[1]` and first decimal-tens/column offset |
| `$FD61` | `CannonInactiveMasks[1]` and `InitialPositions[0]` |
| `$FFEA` | Death sound's stop marker and unused frequency-sweep entry 0 |

Likewise, zero-page indexed wraparound is intentional: `$FA,X` with
X=`$F4,$F6,...,$FE` writes the six sprite pointer lows at `$EE..$F8`;
`$97,X` with X=`$FB..$FF` reads row masks starting at `$92`; and `$E5,X`
with X=`$F8..$FF` writes the palette at `$DD..$E4`.

## Analysis status and further checks

The code/data split, allocated RAM, major routines, graphics, sound record
format and principal game-state paths are now annotated. This is substantial
static analysis, **not a claim that every timing path and all 112 variations
have been independently exercised**.

Remaining work includes full beam-position charts for every kernel path,
Stella traces of simultaneous/partnership control edge cases and life/turn
accounting, an independent ROM-database comparison, and determining whether
the currently unidentified flag bit has any historical purpose.
No emulator playthrough is claimed.

For further verification, assemble with symbols and use Stella's debugger
to break at `FrameStart` (`$F4D4`), `ProcessAlienHits` (`$F3A0`),
`FirePlayerShot` (`$FBAF`) and `UpdateSoundChannel` (`$FE08`).
Check RESET/SELECT repeat and wrap, all seven player modes, both difficulty
switches, Color/B&W, wave clear, invasion, shield damage and saucer hits.
Compare scanline counts with the preserved ROM rather than assuming a
generic timing template.

Repository references used for the annotation style and hardware reasoning:
`Atari\Night Driver (1980) (Atari) - Dennis Debro.asm`,
`include\vcs.h`, `Tools\Guide to Cycle Counting.md`, and
`Tools\Stella Debugger Commands.md`. The general game standards document
describes conventions, not necessarily features present in this 1980 game.
