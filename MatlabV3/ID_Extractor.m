%[IDs, answerNumbers] = IDExtract('682684864804');
%fprintf('\nID.s = %d\nAnswer.d = %d\n', IDs, answerNumbers);

BauValue=115200;         
NumBits=8;      

SerialCOM = serial('COM7','BaudRate',BauValue,'DataBits', NumBits, 'Parity', 'none');
SerialCOM.Terminator = 'LF';
set(SerialCOM, 'Timeout',2);

fopen(SerialCOM);

% Code matlab: La fonction de la fermeture du port (Delete.m)
an = zeros(5, 1);
for i = 1:5
    valueget = fscanf(SerialCOM,'%c');
    [IDs, answerNumbers] = IDExtract(valueget);
    an(i) = answerNumbers;
end
% function Delete(SerialCOM)
disp(an);
fclose(instrfind);
delete(SerialCOM);


% afichage en 3D  https://enacit.epfl.ch/cours/matlab-octave/graphiques.shtml

plot(an);
