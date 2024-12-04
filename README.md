# atari-vcs-disassembly

Collection of Atari VCS (2600) dissembly. Some in complete state, some in early stages.

## Assembling

To assembly binary from source,  use [dasm](https://dasm-assembler.github.io/).

`./dasm '.\game.asm'`

Or, to:

* specify an output name
* generate a list file
* generate a symbol file
* show verbose output, including symbol table

**Important:** The `-f3` is critical. It indicates "RAW" format containing data only.

`./dasm '.\game.asm' -f3 -v3 -I'machines\atari2600' -o'game.a26' -l'game.lst' -s'game.sym'`

## Script to assemble all sources

```PowerShell
mkdir '..\out'
cd '..\out'

Get-ChildItem -File -LiteralPath ..\atari-vcs-disassembly\ -Filter '*.asm' `
| ForEach-Object {
    $basename = $_.BaseName
    ..\dasm\dasm.exe $_ -f3 -I'..\dasm\machines\atari2600' -I'..\atari-vcs-disassembly\tools\Dennis Debro Build' -o"$basename.a26" -l"$basename.lst" -s"$basename.sym" | Out-File -LiteralPath "$basename.out"
    if ($LastExitCode -ne 0) {
        Remove-Item -LiteralPath "$basename.a26"
        Get-Content -LiteralPath "$basename.out"
    }
}
```

## Disassembling

To start disassembly of a VCS cartridge,  use [distella](https://github.com/johnkharvey/distella).

A distella configuration file will give distella hints as how to interpret the binary.  Sample distella cfg files are located in the `tools/distella_cfg` folder.
