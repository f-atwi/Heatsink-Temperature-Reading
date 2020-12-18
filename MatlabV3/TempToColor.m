function [col] = TempToColor(w)
col = zeros(3);
G=0.0;
R=(w-15)/45;
B=(60-w)/45;

col(1) = R;
col(2) = G;
col(3) = B;
end