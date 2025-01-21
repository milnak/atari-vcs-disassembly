Collect is a simple Atari 2600 game where the objective is
to collect randomly positioned boxes.

Use dasm to compile the program.  Dasm can be found here:
http://dasm-dillon.sourceforge.net

The command used to compile is:
dasm collect.asm -f3 -v0 -scollect.sym -lcollect.lst -ocollect.bin


the options after the source file are:
    -f3 sets output format to 3, RAW.

    -v0 sets verboseness.  Values are 0-4, see dasm documentation.

    -s requests a symbol dump, saved to specified file.  Stella uses the symbol
	dump in order to show your variable names in Stella’s debugger.  The
	*.sym filename must match the *.bin filename for this to work.

    -l requests a detailed listing, saved to specified file.

    -o specifies the output file.  If not specified, the output file will be a.out

Besides the source file, only option -f3 is required to build a Atari 2600 program.
