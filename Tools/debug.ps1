# To compile ASM -> BIN:
# ./dasm '.\game.asm' -f3 -o'game.a26'

param (
	# Installation path of stella.exe
	# Download "Binary ZIP for 64-bit Windows" from https://stella-emu.github.io/downloads.html
	[string]$StellaPath = './Stella-7.0c/',
	# VCS .BIN file to debug
	[Parameter(Mandatory, Position=0)][string]$Pathname
)

$Filename = (Get-Item $Pathname).BaseName

Get-Content $env:AppData/Stella/autoexec.script -ErrorAction SilentlyContinue

Get-Content "$env:AppData/Stella/cfg/$Filename.cfg" -ErrorAction SilentlyContinue

$desktopFolder = [Environment]::GetFolderPath([Environment+SpecialFolder]::Desktop)
Get-Content (Join-Path $desktopFolder "$Filename.script") -ErrorAction SilentlyContinue

Get-Content "$Filename.lst" -ErrorAction SilentlyContinue

Get-Content "$Filename.sym" -ErrorAction SilentlyContinue

# 'https://stella-emu.github.io/docs/debugger.html'
'-' * 79
'Console Controls:'
'F1		Select Game'
'F2		Reset Game'
'F3/F4	Color TV / B&W TV'
'F5/F6	Left Player Difficulty A / B'
'F7/F8	Right Player Difficulty A / B'
'-' * 79
'Prompt Commands:'
'step - Single step CPU [with count xx] (Ctrl+S)'
'stepWhile - Single step CPU while <condition> is true'
'trace - Single step CPU over subroutines [with count xx] (Ctrl+T)'
'run - Exit debugger, return to emulator'
'runTo - Run until string xx in disassembly'
'runToPc - Run until PC is set to value xx'
''
'frame - Advance emulation by <xx> frames (default=1)'
'scanLine - Advance emulation by <xx> scanlines (default=1)'
''
'break		Set/clear breakpoint at <address> and <bank>'
'breakIf	Set/clear breakpoint on <condition>'
'           e.g. "breakIf { !(*SWCHB & 1 ) }"'
'clearBreaks - Clear all breakpoints'
'listBreaks - List breakpoints'
''
'disAsm - Disassemble address xx [yy lines] (default=PC)'
'dump - Dump data at address <xx> [to yy] [1: memory; 2: CPU state; 4: input regs] [?]'
'pc - Set Program Counter to address xx'
'print - Evaluate/print expression xx in hex/dec/binary'
'reset - Reset system to power-on state'
'rom - Set ROM address xx to yy1 [yy2 ...]'
'watch - Print contents of address xx before every prompt'

$stellaArgs = @(
	'-debug',
	'-plr.stats', '1',
	'-plr.detectedinfo', '1',
	'-plr.extaccess', '1',
	'-plr.rwportbreak', '1',
	'-plr.wrportbreak', '1',
	'-dbg.fontsize', 'small',
	'-dbg.fontstyle', '1'
)
& (Join-Path $StellaPath 'Stella.exe') @stellaArgs $Pathname
