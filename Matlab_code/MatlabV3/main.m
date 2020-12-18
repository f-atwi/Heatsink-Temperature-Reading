BauValue=115200;
NumBits=8;
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
SerialCOM = serial('COM8','BaudRate',BauValue,'DataBits', NumBits, 'Parity', 'none');
SerialCOM.Terminator = 'LF';
set(SerialCOM, 'Timeout',2);

fopen(SerialCOM);
an = zeros(5, 1);

obj = readObj('heatsink.obj');
sz = size(obj.v);
tval = zeros(sz);
figure;
p = patch('vertices',obj.v,'faces',obj.f.v,'FaceVertexCData', tval);
shading interp
colormap gray(256);
lighting phong;
camproj('perspective');
axis square;
axis off;
axis equal
axis tight;
cameramenu;

while true
    %SerialCOM.
    for i = 1:5 %We may have 5 data to store before display (5 temp)
        valueget = fscanf(SerialCOM,'%c\n');
        valuenew = str2num(valueget);
        [IDs, answerNumbers] = IDExtract(valuenew);
        an(IDs) = uint16(answerNumbers/36.31);
        disp(an);
    end
    tval = zeros(sz);
    col1 = TempToColor(an(1));
    col2 = TempToColor(an(5));
    col3 = TempToColor(an(3));
    col4 = TempToColor(an(4));
    col5 = TempToColor(an(2));
    
    tval(48, 1) = col1(1);
    tval(48, 2) = col1(2);
    tval(48, 3) = col1(3);
    
    tval(451, 1) = col2(1);
    tval(451, 2) = col2(2);
    tval(451, 3) = col2(3);
    
    tval(1078, 1) = col3(1);
    tval(1078, 2) = col3(2);
    tval(1078, 3) = col3(3);
    
    tval(1101, 1) = col4(1);
    tval(1101, 2) = col4(2);
    tval(1101, 3) = col4(3);
    
    tval(1750, 1) = col5(1);
    tval(1750, 2) = col5(2);
    tval(1750, 3) = col5(3);
    
    delete(p);
    % display object
    p = patch('vertices',obj.v,'faces',obj.f.v,'FaceVertexCData', tval);
    shading interp
    colormap gray(256);
    pause(2);
    
end

fclose(instrfind);
delete(SerialCOM);