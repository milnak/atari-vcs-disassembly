Medieval Mayhem
Copyright 2006 by Darrell Spice Jr.


File mm.asm is the source code for Medieval Mayhem.


File graphics.h is an include file used by mm.asm.  It's used so that
graphics can be drawn using _ and X instead of 0 and 1 in order to make
it easier to view the graphics in the source code.


File distance.ods creates the tables used for the distance calcluation
(a^2 + b^2 = c^2) which is by the AI routines to decide which fireball
should be tracked.


File ShieldBounce.ods creates the tables used to tweak the way the fireballs
bounce off the left and right sides of the shields.  


The .ods files were created using NeoOffice, a version of OpenOffice
for Mac OS X.  NeoOffice and OpenOffice.org are both free and are available
from these sites:
http://www.neooffice.org/
http://www.openoffice.org/


The source is formatted for the DASM Assembler, which can be found here:
http://www.atari2600.org/DASM/


Command to compile:
./dasm mm.asm -f3 -v5 -smm.sym -lmm.lst -omm.bin
