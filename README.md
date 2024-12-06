# atari-vcs-disassembly

Collection of Atari VCS (2600) dissembly. Some in complete state, some in early stages.

## Cloning

This repo contains submodules.  After cloning, you need to update the submodules.  If you already know how to do this, skip this section.

```PowerShell
git submodule init
git submodule update
```

If "git submodule update" returns `git@github.com: Permission denied (publickey)`, then you need to add a SSH key to your GitHub account.

```PowerShell
# choose all defaults
ssh-keygen

Get-Content C:\Users\jeffm\.ssh\id_ed25519.pub | Set-Clipboard
```

Then go to the [GitHub SSH page](https://github.com/settings/ssh/new), give a title, paste the public key from the clipboard and click "Add SSH key". Redo the "git submodule update" command and you should be good.

## Assembling

To assembly binary from source,  use [dasm](https://dasm-assembler.github.io/).

`./dasm '.\game.asm' -f3 -o'game.a26'`

**Important:** The `-f3` is critical. It indicates "RAW" format containing data only.

Or, to:

* specify an output name
* generate a list file
* generate a symbol file

`./dasm '.\game.asm' -f3 -I'machines\atari2600' -o'game.a26' -l'game.lst' -s'game.sym'`

## Fixing build issues

If you receive an "error: Value in 'byte byte 63971' must be <$100" error, it's because the source code was created in an older version of dasm. You likely need to make the following change:

For example,  change:

```text
.byte Zero,One,Two,<hree,Four,Five,Six,Seven,Eight,Nine
```

to:

```text
.byte <Zero,<One,<Two,<Three,<Four,<Five,<Six,<Seven,<Eight,<Nine
```

## Script to assemble all sources

```PowerShell
mkdir '..\out'
cd '..\out'

Get-ChildItem -File -LiteralPath '..\atari-vcs-disassembly' -Filter '*.asm' `
| ForEach-Object {
    $basename = $_.BaseName
    ..\dasm\dasm.exe $_ -f3 -I'..\dasm\machines\atari2600' -I'..\atari-vcs-disassembly\include' -o"$basename.a26" -l"$basename.lst" -s"$basename.sym" | Out-File -LiteralPath "$basename.out"
    if ($LastExitCode -ne 0) {
        Remove-Item -LiteralPath "$basename.a26"
        Get-Content -LiteralPath "$basename.out"
    }
}
```

## Testing

I use the [Stella](https://stella-emu.github.io/) emulator.

## Disassembling

To start disassembly of a VCS cartridge,  use [distella](https://github.com/johnkharvey/distella).

A distella configuration file will give distella hints as how to interpret the binary.
