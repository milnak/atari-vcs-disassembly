# To compile ASM -> BIN:
# ./dasm '.\game.asm' -f3 -o'game.a26'
param (
	# Installation path of stella.exe
	[string]$StellaPath = './Stella-7.0b/'
	# VCS .BIN file to debug
	[Parameter(Mandatory)][string]$Pathname
)

$Filename = (Get-Item $Pathname).BaseName

Get-Content $env:AppData/Stella/autoexec.script -ErrorAction SilentlyContinue

Get-Content "$env:AppData/Stella/cfg/$Filename.cfg" -ErrorAction SilentlyContinue

$desktopFolder = [Environment]::GetFolderPath([Environment+SpecialFolder]::Desktop)
Get-Content (Join-Path $desktopFolder "$Filename.script") -ErrorAction SilentlyContinue

Get-Content "$Filename.lst" -ErrorAction SilentlyContinue

Get-Content "$Filename.sym" -ErrorAction SilentlyContinue

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
