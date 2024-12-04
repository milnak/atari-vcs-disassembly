dasm d2_001.asm -f3 -od2_001.out
dasm d2_002.asm -f3 -od2_002.out
copy /b d2_001.out+d2_002.out out.a26
erase d2_001.out
erase d2_002.out

