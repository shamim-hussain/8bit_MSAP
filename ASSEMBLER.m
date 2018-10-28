clc; clf; clear all; close all
ins={'JZ', 'NOT', 'CALL', 'RET', 'MOV', 'HLT', 'MOV', 'PUSH', 'OUT', 'TEST', 'IN', 'POP', 'SUB', 'XCHG', 'RCL', 'XOR', 'DB', 'ORG'};

fname = input('Insert file name:\n', 's');
% fname='firstprog.asm';
fid=fopen(fname,'r');
FC=strsplit(fname, '.');
oid=fopen([FC{1},'.bin'],'w');
while ~feof(fid)
    str=fgetl(fid);
    C=upper(strsplit(str, {',',' ', '\t', ':', '[', ']'}));
    f=find(strcmp(ins, C{1}));
    for op=f
        switch (op-1)
            case 0
                fwrite(oid, 0);
                fwrite(oid, sscanf(C{2}, '%x'), 'uint16');
            case 1
                fwrite(oid, 1);
            case 2
                fwrite(oid, 2);
                fwrite(oid, sscanf(C{2}, '%x'), 'uint16');
            case 3
                fwrite(oid, 3);
            case 4
                if strcmp(C{2}, 'B')
                    fwrite(oid, 4);
                    fwrite(oid, sscanf(C{3}, '%x'), 'uint8');
                end
            case 5
                fwrite(oid, 5);
            case 6
                if strcmp(C{2}, 'A')
                    fwrite(oid, 6);
                    fwrite(oid, sscanf(C{3}, '%x'), 'uint16');
                end
            case 7
                fwrite(oid, 7);
            case 8
                fwrite(oid, 8);
            case 9
                fwrite(oid, 9);
                fwrite(oid, sscanf(C{3}, '%x'), 'uint16');
            case 10
                fwrite(oid, 10);
            case 11
                fwrite(oid, 11);
                fwrite(oid, sscanf(C{2}, '%x'), 'uint16');
            case 12
                fwrite(oid, 12);
            case 13
                fwrite(oid, 13);
                fwrite(oid, sscanf(C{2}, '%x'), 'uint16');
            case 14
                fwrite(oid, 14);
            case 15
                fwrite(oid, 15);
                fwrite(oid, sscanf(C{2}, '%x'), 'uint16');
            case 16
                fwrite(oid, sscanf(C{2}, '%x'), 'uint8');
            case 17
                pos=sscanf(C{2}, '%x');
                fwrite(oid, zeros(1, pos-ftell(oid)));
        end
    end
end

fclose('all');