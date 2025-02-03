# Guide to Cycle Counting on the Atari 2600

By Nick Bensema

Cycle counting is an important aspect of Atari 2600 programming. It makes possible the positioning of sprites, the drawing of six-digit scores, non-mirrored playfield graphics and many other cool TIA tricks that keep every game from looking like Combat. In fact, even Combat makes use of some cycle counting to position the tanks and to draw the scores into the playfield, though its methods aren't quite as precise as your typical Activision game.

Cycle counting's uses don't end at silly screen hacks. It is also useful for optimizing code to fit within a vertical blank, or a scanline, or a horizontal blank.

## Concepts of Counting

Programming the Atari requires one to modify one's perceptions of space and time, because the Atari observes some sort of Abian physics where space is time. One frame is 1/60 of a second. One scanline is 1/20000 of a second. You get the idea. It is important to know how much code can be executed in the amount of time it takes to draw the screen. The unit of time we use is cycles.

### CPU Cycles in Relation to Screen Pixels

The CPU clock works at a somewhat slow pace compared to the TIA. The TIA draws three pixels in the time it takes to execute one CPU cycle. A WSYNC command will halt the processor until the horizontal blank, which lasts about 20 CPU cycles, after which the electron beam turns on and begins to draw the picture once again. Therefore the X position of the electron beam is determined like this:

`X = (CYCLES - 20) * 3`

where CYCLES is the number of cycles that have elapsed since the horizontal blank. But the text I have states that registers are only read every five cycles, so the equation must be adjusted to account for that. For now, let's just assume that we round up to the next multiple of 15. The examples we use will involve RESP0, because I know the rule applies to that register.

If X is a negative number, a RESP0 will put player 0 on the left edge of the screen.

Let's look at a sample nonsense routine:

```6502
BEGIN: STA WSYNC    ;I begin counting here.
       NOP          ; 0 +2 = [2]    (Weenie instruction)
       LDA #0       ; 2 +3 = [5]    (Fast math, immediate)
       STA $FFFF    ; 5 +4 = [9]    (Storage, absolute)
       ROL $FFFE,X  ; 9 +7 = [16]   (Slow math, Absolute,X)
       ROL A        ; 16+2 = [18]   (Slow math, accumulator)
       STA RESP0    ; 18+3 = *21*   (Storage, zero page)
       DEY          ; 21+2 = [23]   (Weenie)
       BNE BEGIN    ; 23+3 = [26]   (Branch)
```

The number on the left is the number of cycles that have elapsed since WSYNC at the beginning of each instruction, it is only there to illustrate the addition of cycles. The number in brackets is the number of cycles that have elapsed at the end of each instruction. It is better to keep track of this number because writes to TIA registers occur on this cycle.

Note the number 22 next to RESP0 is in asterisks, signifying a write to a TIA register. (22-20)*3 == 6, and since it is RESP0 we round up to 15 and that is where Player 0 goes.

The cycle count is especially important to RESP0, but almost all writes to TIA registers are affected in some way by the cycle count. A player or missile modification too late in the scanline will cause the player to shift up one scanline as it moves away from the left side of the screen. Writes to the playfield must be timed to occur in the center of the screen if one wishes to produce an asymmetrical playfield. The number between these asterisks is very important to the program, and you may find yourself spending hours getting that number to be just what you need it to be for your particular application.

I usually put relevant comment outside the counting column, but this isn't relevant code so I decided to illustrate the mnemonic device I used to determine the cycles for each instruction.

## How to Remember What Takes How Long

One cannot be expected to look at a table for every instruction they use, lest they go mad. Many instructions, however, have similar characteristics, and so general rules can be followed in order to estimate the time of each instruction.

### Branching Instructions

Branching instructions like BNE and BCC are easier than they seem. All branch instructions take two cycles, plus one extra cycle if the branch is taken, plus another extra cycle if said branch crosses the page boundary.

When writing time-sensitive code, I recommend that branch instructions only be used at or near the end of a loop that begins in STA WSYNC, or in tight loops that are designed to waste a certain number of cycles. DEY-BNE loops, which are a common way of accomplishing this, will be covered later.

Let's just say for now that the decision of whether to branch should be generally constant throughout at least the time-sensitive portions of your routine.

### Fast Math Instructions

The 6502 has a family of "fast math" opcodes that have similar characteristics, and consequently they have the same cycle counts. These fast math opcodes do little more than alter registers or flags using bits from memory. This family consists of ADC, AND, BIT, CMP, CPX, CPY, EOR, LDA, LDX, LDY, ORA, and SBC. Not all of these instructions have all of the following address modes, but these rules apply to whichever modes are available. I will use ADC as an example:

```6502
        ADC #$01        ; +2    Immediate
        ADC $99         ; +3    Zero Page
        ADC $99,X       ; +4    Zero Page,X  (or ,Y)
        ADC $1234       ; +4    Absolute
        ADC $1234,X     ; +4*   Absolute,X  (or ,Y)
        ADC ($AA,X)     ; +6    (Indirect,X)
        ADC ($CC),Y     ; +5*   (Indirect),Y
```

The asterisk (*) signifies that if the instruction indexes across a page boundary, add one cycle. In some cases, just one cycle might not matter.

Also note that Zero Page, Y addressing is only available for LDX and STX.

### Storage Instructions

The instructions STA, STX, and STY have the same timing as fast math instructions, but in the case of Absolute, XY and (Indirect),Y addressing, the extra cycle is always added.

### Weenie Instructions

These weenie instructions don't even alter memory, only registers and flags. They are CLC, CLD, CLI, CLV, DEX, DEY, INX, INY, NOP, SEC, SED, SEI, TAX, TAY, TSX, TXA, TXS, and TYA. They take two cycles.

### Slow Math Instructions

There are certain instructions that take more clock cycles than simple math instructions. Some of these instructions can work with the accumulator, but when given an address to work with, they modify memory directly. The slow math instructions are ASL, DEC, INC, LSR, ROL, and ROR.

```6502
        ROR A           ; +2  Accumulator
        ROR $99         ; +5  Zero Page
        ROR $99,X       ; +6  Zero Page,X
        ROR $1234       ; +6  Absolute
        ROR $1234,X     ; +7  Absolute,X
```

Note that when these instructions work with the accumulator, they shrink down to two cycles and become Weenie Instructions.

### Stack Instructions

The two push instructions, PHA and PHP, each take three cycles. The two pull instructions, PLA and PLP, each take four cycles.

### Other Instructions

(A.K.A. Instructions You Have No Business Using In Time-sensitive Code)

JSR takes 6 cycles. JMP takes 3 cycles in absolute mode, and 5 cycles in absolute indirect mode, but absolute indirect mode is for machines that have a kernel. RTI and RTS take 6 cycles each. But with only a few dozen instructions available per scanline, you don't have time to bounce all over the cartridge executing subroutines.

## Cycle Counting In Practice

### Multiple Possibilities

This is how I would handle wishy-washy code that uses a branch:

```6502
BEGIN   STA WSYNC       ;CYCLES...
        NOP             ; [0]   +2
        BIT $CC         ; [2]   +3
        BMI STUPID      ; [5]   +2 if not taken...
        NOP             ; [7]   +2   Pretend everything's
        NOP             ; [9]   +2   just smurfy, until...
        NOP             ; [11]  +2
        NOP             ; [13]
        NOP             ; [15]
        NOP             ; [17]
        NOP             ; [19]  +2  IF BRANCHED
STUPID  LDA $F0         ; [21]  +3   [8]  (BMI takes +3 now)
        STA GRP0        ; *24*  +3   *11*
        LDA $F1         ; [27]  +3   [14]
        STA ENAM0       ; *30*  +3   *17*
        STA RESP0       ; *33*  +3   *20*
        STA WSYNC
```

I have to count both possibilities, side by side. Perhaps there is a shorter way to do this, but this way if I have to keep track of a long list, I won't have to page up in the code to figure out what the difference is.

If you can guess what this code does, congratulations. If you can't, I'll tell you. This code checks bit 8 of location $CC. If it is set, it goes immediately to set player 0's registers, setting its position at cycle 20. If it is clear, then the branch isn't taken so that saves us one cycle, but fourteen more cycles are taken by NOPs, making a net gain of 13 cycles. Now it takes 33 cycles to reset player 0.

### How to Tame the Mighty (Indirect),Y

Recall that if an (Indirect),Y instruction indexes across a page boundary, the CPU takes an extra cycle. This means that depending on the value of Y, the instruction might take four or five cycles.

In six-column or other high resolution display routines, as many as six (Indirect),Y instructions appear in one scanline. This adds up to six extra cycles that may or may not be taken. This could throw off your timing unless your data is properly arranged.

Make sure when putting graphics into your program, to arrange the data so that they either NEVER cross page boundaries, or ALWAYS cross page boundaries. As long as you can predict when that extra cycle is going to pop up, you'll be OK. You might need to play around with the assembler and the source code to make sure all the bytes in each graphics table are in the same page of memory.

In contrast, one could conceivably use either (Indirect),Y or Absolute, XY addressing as part of some sick, twisted timing loop with single-cycle precision, but most TIA applications only have a need for three-cycle precision.

### The DEY-BNE Loop and Its Applications

The DEY-BNE loop is a useful delay loop. How useful, I won't know until I see it applied where Y equals a variable. I did see it applied to a constant in this code from Defender:

```6502
       STA    WSYNC   ;               Cycle count:
       STA    PF2     ;Clear PF2       [0]  +3
       LDA    $EA     ;                [3]  +3
       STA    COLUP0  ;                [6]  +3
       STA    COLUP1  ;                [9]  +3
       LDY    #$08    ;                [12] +2  Y is set here
       STA    RESP0   ;                *14* +3
LF867: DEY            ;When 8 (17), when 0 (52)  }
       BNE    LF867   ;At end of loop, (54)      } +39
       STA    RESP1   ;                *56* +3
        ; End result: players are 42 CPU cycles apart.
```

RESP0 occurs at 14 cycles, which is still within the horizontal blank, so player 0 appears at the left side of the screen. RESP1 occurs at 56 cycles, and (56-20)*3 = 108 pixels. Stella. txt says I'm supposed to round that up to a multiple of 15, so that's 120. If player 1 is in triple repeat mode, that would put it on the right edge of the screen. And since this is the routine that sets the TIA up to display the number of remaining lives and smart bombs in Defender, that's a distinct possibility.

You can see how I came to the above conclusion if we unroll the loop:

```6502
LF867: DEY           ; Y becomes 7          +2 }
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 6          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 5          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 4          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 3          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 2          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 1          +2
       BNE    LF867  ; Branch is taken.     +3 } 5
LF867: DEY           ; Y becomes 0          +2
       BNE    LF867  ; Branch is NOT taken. +2 } 4
```

Each time through the loop where Y0, DEY takes two cycles and BNE takes three cycles (due to the branch). The last time through the loop, when Y=0, the branch is not taken so the BNE only takes two cycles.

From this, we can build a model for the DEY-BNE loop:

```6502
       LDY #NUM ; +2
        ; extra code possible here
DEYBNE DEY        ; }
       BNE DEYBNE ; } + NUM*5-1
```

Note that each iteration takes 5 CPU cycles, or 15 pixels. This is as close as it gets to perfect for our needs, since the TIA will only let you set up a player with RESP0 on a multiple of 15.

The X register can also be used to this end, but hey, it needs a name, doesn't it?

## Conclusion

Keep your code clean and tight. Make sure your display kernel routines use the same number of scanlines no matter what happens.
