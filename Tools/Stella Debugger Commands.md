# Stella Debugger Commands

Adapted from [Stella Debugger Documentation](https://stella-emu.github.io/docs/debugger.html)

Enter debugger using ` key.

**list**, **del** and **clear** commands will list, delete and clear all.

## Console Controls

|Key|Command|
|---|-------|
|F1|Select Game|
|F2|Reset Game|
|F3 / F4|Color TV / B&W TV|
|F5 / F6|Left Player Difficulty A / B|
|F7 / F8|Right Player Difficulty A / B|

## Execution Control

**run** - Exit debugger, return to emulator

**runTo** - Run until string xx in disassembly

**runToPc** - Run until PC is set to value xx

**reset** - Reset system to power-on state

**step** - Single step CPU [with count xx] (Ctrl+S)

**stepWhile** - Single step CPU while \<condition\> is true

**trace** - Single step CPU over subroutines [with count xx] (Ctrl+T)

**frame** - Advance emulation by \<xx\> frames (default=1) (Ctrl+F)

**scanLine** - Advance emulation by \<xx\> scanlines (default=1)

## Breakpoints and Watchpoints

To remove a breakpoint, you just run the same command you used to set it.

**break** - Set/clear breakpoint at \<address\> and \<bank\>

**breakIf** - Set/clear breakpoint on \<condition\>, e.g.  `breakIf { !(*SWCHB & 1 ) }a`

**breakLabel** - Set/clear breakpoint on \<address\>

Or function:

* `function gameReset { !(*SWCHB & 1 ) }`
* `breakIf { gameReset && gameSelect }`

## Watches

**watch \<expr\>** - print before every prompt, e.g. `watch *y`

## Traps

**trap \<expr\>** - catch access to memory address, e.g. `trap RESP0`

**trapIf \<expr>\>** - trap on a conditional.

**trapRead(if)** - trap on read.

**trapWrite(if)** - trap on write.

## Controller

**joy0Up** - Set joystick 0 up direction to value \<x\> (0 or 1), or toggle (no arg)

**joy0Down** - Set joystick 0 down direction to value \<x\> (0 or 1), or toggle (no arg)

**joy0Left** - Set joystick 0 left direction to value \<x\> (0 or 1), or toggle (no arg)

**joy0Right** - Set joystick 0 right direction to value  (0 or 1), or toggle (no arg)

**joy0Fire** - Set joystick 0 fire button to value \<x\> (0 or 1), or toggle (no arg)

**swchb** - Set SWCHB to value xx

## Registers

**a** - Set Accumulator to \<value\>

**c** - Carry Flag: set (0 or 1), or toggle (no arg)

**d** - Decimal Mode Flag: set (0 or 1), or toggle (no arg)

**n** - Negative Flag: set (0 or 1), or toggle (no arg)

**s** - Set Stack Pointer to value xx

**v** - Overflow Flag: set (0 or 1), or toggle (no arg)

**x** - Set X Register to value xx

**y** - Set Y Register to value xx

**z** - Zero Flag: set (0 or 1), or toggle (no arg)

## Miscellaneous

**disAsm** - Disassemble address xx [yy lines] (default=PC)

**dump** - Dump data at address\ <xx\> [to yy] [1: memory; 2: CPU state; 4: input regs] [?]

**pc** - Set Program Counter to address xx

**print** - Evaluate/print expression xx in hex/dec/binary

**colorTest** - Show value xx as TIA color
