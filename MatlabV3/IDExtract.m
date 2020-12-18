function [ ID, answerNumber ] = IDExtract( IDNumber )
    IDnumberByte = dec2bin(IDNumber);
    L = strlength(IDnumberByte);
    while(L ~=16)
        IDnumberByte= strcat( '0' , IDnumberByte);
         L = L+1;
    end
    ID = bin2dec(IDnumberByte(1:4));
    answerNumber = bin2dec(IDnumberByte(5:16));
end
