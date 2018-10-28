mov a, 0020h
push a 
mov b, 0fh
push a
pop 30h 
pop 40h
mov a, 40h 
xor 30h, b
rcl a
out a
hlt
org 20h
db 3ah