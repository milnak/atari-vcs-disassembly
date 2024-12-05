dasm mrdo1.asm -f3 -omr.001
dasm mrdo2.asm -f3 -omr.002
copy /b mr.001+mr.002 mrdohack.bin
move mrdohack.bin c:\atari\roms
erase mr.001
erase mr.002

