# atari-vcs-disassembly

Collection of Atari VCS (2600) dissembly. Some in complete state, some in early stages.

## Cloning

This repo contains submodules.  After cloning, you need to update the submodules.  If you already know how to do this, skip this section.

```PowerShell
git submodule init
git submodule update
```

If "git submodule update" returns `git@github.com: Permission denied (publickey)`, then you need to add a SSH key to your GitHub account.  Run `ssh-keygen` and choose all defaults.

Copy the output of the generated file, e.g. `.ssh\id_ed25519.pub` to the clipboard, then go to the [GitHub SSH page](https://github.com/settings/ssh/new), give a title, paste the public key from the clipboard and click "Add SSH key". Redo the "git submodule update" command and you should be good.

## Assembling

To assemble binary from source,  use [dasm](https://dasm-assembler.github.io/).

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

## Testing

I use the [Stella](https://stella-emu.github.io/) emulator.

## Disassembling

To start disassembly of a VCS cartridge, use [distella](https://github.com/johnkharvey/distella).

To compiler distella on Windows, open a Visual Studio Developer command prompt and run: `cl -DAPP_VERSION='\"3.02-SNAPSHOT\"' -DAPP_COMPILE='\"2024-12-10\"' .\distella.c /link /out:DiStella.EXE`

A distella configuration file will give distella hints as how to interpret the binary.
