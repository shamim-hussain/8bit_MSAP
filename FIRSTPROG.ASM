MOV A, 100FH
org 20h
mov b, 10h
jz 2200h
not b
call 1100h
ret
hlt
push a
out a
test a, 2200h
in b
pop 1100h
sub a, b
xchg [2200h], b 
org 30h
db 12h