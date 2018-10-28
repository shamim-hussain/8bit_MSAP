mov a, 40h
test a, 50h
jz 10h
hlt

org 10h
mov a, 60h
hlt

org 40h
db 00aah

org 50h
db 55h

org 60h
db 01h